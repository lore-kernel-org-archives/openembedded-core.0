Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.357.1611586396181712227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1MU4JVtx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id q2so4977500plk.4
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aNdObSi3nb2rCO2mZeUBe97EMUz/rkzHVJOswzVzdr8=;
        b=1MU4JVtxFgrfhbkwEIq22F1zgRdtIqyoxWPEBtVofQYAJG/AB2JepvA/aTW0ieCSMK
         dy+E7ZaS97aFWVTpR2seN5NytLQGVh2t/s51wDO0ZfANfQ9kAKh9gx3BiRWDi3nsF6yu
         fSHg1OF3tW7Druog0EcpG8glOe73WF5V13Jf+Vzza1lsuxfX32715mXTgjnHwfChX27z
         L9nZdHHGveGd4cmyozEpJKNcLITzgNNKVJkGRugTPtIU+MkMzBnSyjAYNEQFiM0+zKTV
         AyIYFBocoDtq57mL22lLoYJ4LOwC9SVxnbTVeyVg9mCntTkEL1+PqIblpFCGEiCp63Bt
         RQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aNdObSi3nb2rCO2mZeUBe97EMUz/rkzHVJOswzVzdr8=;
        b=fWOQCZ6VKmIEchdJ1Mn8ysNvMnw9GWXf6rcJ8gzhvfzOqNnTGlQ6twXZ5qcvneWhP2
         AYzrSaAGvOsy3NYF0EWpJjXT9w3tEa2gOwyvUyXDNT+OipXg9f5wl22gNuLKKT3M4Rog
         aHMyoy1wlgLHVaNnldF2ZHbxHj+p3NShac/BTmkx5/1Zqiose9dfkTX05q87Q6Lc/jBn
         2liIlFnYlU4FtmMEoCgWgfwMCqtBWTYQ8v0Ke2CSjxvTpcWmoGfmB9M0SWEzxbUQpUzC
         rQWnI7LNqHBnfDIHO3TJz/mN6Zk3U73wXrwe/pD80GoEEUWYZ1BjEhy9K/EzO328Bea0
         QAhQ==
X-Gm-Message-State: AOAM531TVj9abJ3a1i0KJRg36MfilUnyzCWG3f6YvFTw2D/+H8tM2r3U
	SpcDheKEE2b2yBymkxgm8DDTFTrjCUvAtVeyXU8=
X-Google-Smtp-Source: ABdhPJxlahdPpVUPAM5N2p47TKGyWJbpxJj+fDydK2OVtkxteB4Xgv8eiahFNVCq31icQt/87WxJWg==
X-Received: by 2002:a17:90a:d258:: with SMTP id o24mr544914pjw.231.1611586395273;
        Mon, 25 Jan 2021 06:53:15 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:14 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/47] bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
Date: Mon, 25 Jan 2021 04:51:05 -1000
Message-Id: <2fba84e7a8996370a964aff925625afcd6f6f063.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Use oe.path.canonicalize() to canonicalize the paths in
PSEUDO_IGNORE_PATHS before passing them to pseudo. This is needed since
pseudo will compare them to paths that are canonicalized.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f2a497daa09cf3459e27ad6e0e8513938b52c79)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6615dee760..94a643ccc7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -692,9 +692,9 @@ export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
-- 
2.25.1

