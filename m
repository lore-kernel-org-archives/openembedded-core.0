Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web09.35250.1612792531087605012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bStzIZqM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id s107so14189505otb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HHd+sDRL/pa1ZkXX+zCr2WzeNPVe51PtmI58C6smm5k=;
        b=bStzIZqMPdR32h3elHrHoxQFk3BV5vS9/HzwRYPnIfz1sVV6vF2A5W1ZFaMSlygdMe
         AR46HeuveoL4iAJU/k5SLSD7gxgQy7DsS6X2a9tUTY9cmvmyFwEH7S2cH/OaIDwTLuLv
         tId80Zx1QN8+Iof6/YrJgI0BTVcGKo2ZR8gphzr+RjUNIVmVvmZ/9pQPSoOHkgDqEr2z
         oSuPb8Pdg5GchO162jBo+OSr9usKWLAAxrhVKJm5UUOFgHpNEiLKpSoN3en4QOjxdxlY
         Adg79OCmLRE1CqHInEH6ClBmnW2e8Kmbi95tNgksGdjCKmmvhh47F8RHuCvFMuogVjQH
         98dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HHd+sDRL/pa1ZkXX+zCr2WzeNPVe51PtmI58C6smm5k=;
        b=PmfodvufKrDG6macQXvqgrKIMMFGmDGkYnx6lGGJNi3fLRLcfZkiXet/UtGN/IHdpC
         LTay41qJJzWvUNXn9T0rbECR1Ov5LODd/MLejjgUZs9LjYmKmtD7gN1Y7Z5ud/sbp0Ug
         83qwv1AdQeLGgTbAAUhjUWA69sWffeA1JvxbGysbp9J2ZRTHC2bfWrFyvxjTMRUTR3Q6
         kmHo3K3lpd7qjXgrNsz6sbLcbNyPcjantbgGuQMxUg8ipLFbEt7WNUIxo0i4QTgSIYAY
         U7wZGEik/RxoxqZAsdOK90+RctDNbHCvmiJ5fvUVqedqhZ3UJVZudwva9CUK5paqLpIe
         +FjQ==
X-Gm-Message-State: AOAM532Qf+K4J/Julm/3Wo31/vxA4rsPPFG20eydEMKrFB7DLl43AijY
	qD4BGwSq2Aq7e3bfMkP3ilENzdedK4p8z/f9Xn4=
X-Google-Smtp-Source: ABdhPJzIgqEUCbR/0aoX0nw1TApGA5ulusZClQ7v05Ipe+/hb3tbi8okqf9rpq0ZlYBnd7gqvqHn7w==
X-Received: by 2002:a9d:d38:: with SMTP id 53mr12583504oti.237.1612792529979;
        Mon, 08 Feb 2021 05:55:29 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.55.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:55:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/28] opkg: Fix build reproducibility issue
Date: Mon,  8 Feb 2021 03:52:15 -1000
Message-Id: <bc1f08f0202b1ea3780b72dc9b2e7bc339581fcc.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

A build date was leaking into the generated docs and makefile used for
ptests leading to reproducibility issues each time the month changed.

Add a patch to use SOURCE_DATE_EPOCH to derive it if available.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a9ca7aec4991eabd425e32fdf85f51bb1686b8b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../opkg/opkg/sourcedateepoch.patch           | 25 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch

diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
new file mode 100644
index 0000000000..285d258c63
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
@@ -0,0 +1,25 @@
+Having CLEAN_DATE come from the current date doesn't allow for build
+reproducibility. Add the option of using SOURCE_DATE_EPOCH if set
+which for OE, it will be.
+
+Upstream-Status: Pending
+RP 2021/2/2
+
+Index: opkg-0.4.4/configure.ac
+===================================================================
+--- opkg-0.4.4.orig/configure.ac
++++ opkg-0.4.4/configure.ac
+@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
+ AC_FUNC_VPRINTF
+ AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
+ 
+-CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
++1607446883
++if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
++    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d '\n'`
++else
++    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
++fi
+ 
+ AC_SUBST([CLEAN_DATE])
+ 
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.2.bb b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
index 66a74dc5ed..516982c6f5 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
@@ -14,6 +14,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://sourcedateepoch.patch \
            file://run-ptest \
 "
 
-- 
2.25.1

