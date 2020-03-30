Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.53031.1585582706572829792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 08:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YVetaF5J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id m11so16351218wrx.10
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MUGQcvq4E89FrSbMC6u8ylbU/WElYJz//6EOmHc1q8s=;
        b=YVetaF5JEEsfmQRJL4tydx5FteMNjla7Oej+T1uQ1jW69LpVQaqf8Pwc1zw1lUR+88
         WGgEjBri6GZLtVjHFD3ssyvYP8rclUq6Z6HtOtSUVZC5C7RG09s3mSodzIuC6zmNJ+0E
         1mSZDMG75jP2w4RwdzirbMjxD8+T9IkglOoKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MUGQcvq4E89FrSbMC6u8ylbU/WElYJz//6EOmHc1q8s=;
        b=IhgwVHQ9muBitUZpDQGDYtprGDqAPcOiLfpZl8Yd0u0TCfTo6d2sB5E5bDkb/nzX+E
         vnTBiRD9dwAWPvlz2SEGREwRHdOQoztw1S8/0tdSniKfHNMeJ1d23Rj1Yug0bEuNsqeO
         /6/87Gn6IrneySCrf3jlAUsgOz3t2rl+wSOb0cQdhGpkMVJvAyoIeVgvSD2/6DTAH5LE
         N7KHjs+rtYxIuY0s3J/s6kBSu7R0cAdMm8Oo5OLxMBN5l0ABFaS+f/sR61S/ArLLRQ1v
         lc5amMgBoRild0IKtH+k6C8hwK3OZ+KaEi0No8iVPfANWvFH+tV68zezbCbanAoW1kHY
         Pulg==
X-Gm-Message-State: ANhLgQ3bknBSnqxXiP94T0B7nq+phlV9zXuX9x//GxzsQL4DcWKuFZNF
	Lzasf1wTFp6vWoZ0NTMeTIx2vJkppIo=
X-Google-Smtp-Source: ADFU+vvZWgtsTs/daPRKz8YtRUCcAUtPA44QOj1BLjlvAo9XwSbCSpywyINXawJOWEMkBtlE4reelw==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr14765309wru.94.1585582704618;
        Mon, 30 Mar 2020 08:38:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j11sm22344253wrt.14.2020.03.30.08.38.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 08:38:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Ensure we use our own libsqlite
Date: Mon, 30 Mar 2020 16:38:21 +0100
Message-Id: <20200330153821.658396-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pseudo-native is special in that bitbake ends up executing it from the
sysroot-components directory before we have any workdirs for the bitbake
fakeroot worker. Since we switched to dynamically linking sqlite, it
means sqlite from the host system may be found, we really want the version
in sysroot-components. Trying to run tasks to create some special environment
for pseudo is hard and error prone. The simplest fix is to add an RPATH to
the binary so that it can correctly find the sqlite we want.

Unfortunately passing $ORIGIN into make doesn't work so well with shell
quoting so we have to fix that during do_install.

[YOCTO #13814]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 7ff8e449e9a..50e30064bde 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -16,6 +16,7 @@ INSANE_SKIP_${PN}-dbg += "libdir"
 PROVIDES += "virtual/fakeroot"
 
 MAKEOPTS = ""
+MAKEOPTS_class-native = "'RPATH=-Wl,--rpath=XORIGIN/../../../sqlite3-native/usr/lib/'"
 
 inherit siteinfo pkgconfig
 
@@ -115,6 +116,7 @@ do_install () {
 }
 
 do_install_append_class-native () {
+	chrpath ${D}${bindir}/pseudo -r `chrpath ${D}${bindir}/pseudo | cut -d = -f 2 | sed s/XORIGIN/\\$ORIGIN/`
 	install -d ${D}${sysconfdir}
 	# The fallback files should never be modified
 	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
-- 
2.25.1

