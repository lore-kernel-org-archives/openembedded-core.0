Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B104CCD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 16:18:06 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2653.1777565878478670140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 09:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sOnVDi4F;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7bd5e373d07so5313417b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 09:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777565877; x=1778170677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8auunBIllLVHI6xHaK85axEiJHfc5PmEgz+GZv5eCk8=;
        b=sOnVDi4FnCXFivQR6ZS3gE9Z5e4N3648/Jkp42rmtUGmMu9/VcDBJ3780s51/PMrSj
         DtsKpLhnQ5H/WxSeBR44HFTCovobVzIobirtF+OC6x4kTkXqE4aLanaNY8eWa2rQif4I
         MJq1xnqdBBgJ34NB0kCgpXvBITAtebItYbNJ9f+ydUsQlTk9/WTXqWxNwbV4wobRIEM0
         shmOtS4rOH4OoUdRJLOORy9vKj4JSsr9WAI89N5uSfGL5K0nWAjqrpvpzuUts+rkRFw3
         yWJ89znn1rUp765Yh/qKgrvrBfRTQely6VpJzzMNRFSUqMcERFJ2byKV56d+iRxi2sSh
         S7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777565877; x=1778170677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8auunBIllLVHI6xHaK85axEiJHfc5PmEgz+GZv5eCk8=;
        b=LTNCAZm1Bff1wv/ZTiCygfXxuuwNhkoncjfe2CnFm5zf16ANYtfT8l6wqz7iUwxc3X
         cRIYku2NT6IZt6rAkVN4Rg8VCxX/bzTxVSOjE6kRfs2FqDDD/wJQhz2Dc4iTeLvvhJol
         6SEfuRp71FG3GYwuruffkKtAOCFhHEAwKz6EkcZc+lB2lzFdztTRTQQU9UW5uE0+52vY
         UqbLNwlUWJZrKD8hb6Ktnw8Eej6nfd0O30p6g2HTDLY1D3X/x9nWrMcQ/6Oa0MWQSpLr
         MDVuuoWJvFmSAIMh4Xq1SGpyJ2QleyuerGUtpSrcBqvxv5vtTO/AorEm5MMntbyo0ilV
         XZJg==
X-Gm-Message-State: AOJu0YzuzJGITp3tsNRbVV49rZ0DWVLHPbdI/8uRd1efMiWh6jw9Z9r5
	x4YqW+EVXHwu6+UCRM+ztHb0Rev5mYa65L7Kd4p6N8bnG10/vuNTjHNlmAL24Q==
X-Gm-Gg: AeBDies6zF6kWd6Hc7ZqqdqJ9Yu1OYJLk9F5/6164zYt/pFb1kL/8WyBsSHpPKiRLGF
	PKp1WoGmOM3a6LdorEgPYtxkW6l3pcXMkZDGfY0vSKhbcW4IQycYI7vvssAJCqOL4xx7skcO8SA
	LsP8mOgnB33b1cXkxTRvyD/lQQ5xyXxCAk3e5mgN8F4hIVodpkJV6l2lm0SE5A5lMLF9YVNocbh
	+3TreqVGtfYT7u7sgqDNXwary2+YljvEMTkwJXY9ThMqB3MGJ2aX9/hCJoFj5a+wul9LgV3/N+j
	k9+uMy3rNFY/hELpxUQE2cQ+haELGSG+dQJ8toZQ5WaKyAEeoac9d2qHK+OfnlJH+J+Li5Tzv3Y
	V/zxYHkB0WrGVaak4CyCdp5qn3KhFPEdmzbGEcicdI8Jr3tSLgJq2GfFZT340adkYp60oT3PCBD
	bcYPO7+BtZWnFAW7cepdeGh6+lPKMOQSEcKGRmyq8v/ytkjUauvFjZ9vD1Mi08lKHv9Q==
X-Received: by 2002:a05:690c:397:b0:7b3:401f:2e7d with SMTP id 00721157ae682-7bd52906297mr35652607b3.25.1777565877148;
        Thu, 30 Apr 2026 09:17:57 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff43b776sm21541866d6.27.2026.04.30.09.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:17:56 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 1/2] tar: make gtar always gnu tar
Date: Thu, 30 Apr 2026 10:17:01 -0600
Message-ID: <20260430161702.77076-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 16:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236175

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Previously, gtar was a symlink to tar. It followed update-alternatives,
when what we most likely want is for gtar to always be GNU tar, and tar
to be whatever update-alternatives decides.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-extended/tar/tar_1.35.bb | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index 042baa035c9..ce7076ae606 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -18,20 +18,22 @@ PACKAGECONFIG:append:class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl
 PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
-EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir} --program-prefix=g"
 
 CACHED_CONFIGUREVARS += "tar_cv_path_RSH=no"
 
 do_install () {
     autotools_do_install
-    ln -s tar ${D}${bindir}/gtar
+    ln -s gtar ${D}${bindir}/tar
+    ln -s grmt ${D}${sbindir}/rmt
 }
 
 do_install:append:class-target() {
+    rm ${D}${bindir}/tar
+    rm ${D}${sbindir}/rmt
     if [ "${base_bindir}" != "${bindir}" ]; then
         install -d ${D}${base_bindir}
-        mv ${D}${bindir}/tar ${D}${base_bindir}/tar
-        mv ${D}${bindir}/gtar ${D}${base_bindir}/gtar
+        mv ${D}${bindir}/gtar ${D}${base_bindir}
         rmdir ${D}${bindir}/
     fi
 }
@@ -72,19 +74,27 @@ do_install_ptest() {
 
 PACKAGES =+ "${PN}-rmt"
 
-FILES:${PN}-rmt = "${sbindir}/rmt*"
+FILES:${PN}-rmt = "${sbindir}/grmt*"
 
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE:${PN} = "tar"
+ALTERNATIVE:${PN}-doc = "tar.1 rmt.8"
 ALTERNATIVE:${PN}-rmt = "rmt"
 ALTERNATIVE:${PN}:class-nativesdk = ""
 ALTERNATIVE:${PN}-rmt:class-nativesdk = ""
 
 ALTERNATIVE_LINK_NAME[tar] = "${base_bindir}/tar"
+ALTERNATIVE_TARGET[tar] = "${base_bindir}/gtar"
 ALTERNATIVE_LINK_NAME[rmt] = "${sbindir}/rmt"
+ALTERNATIVE_TARGET[rmt] = "${sbindir}/grmt"
+
+ALTERNATIVE_LINK_NAME[tar.1] = "${mandir}/man1/tar.1"
+ALTERNATIVE_TARGET[tar.1] = "${mandir}/man1/gtar.1"
+ALTERNATIVE_LINK_NAME[rmt.8] = "${mandir}/man8/rmt.8"
+ALTERNATIVE_TARGET[rmt.8] = "${mandir}/man8/grmt.8"
 
 PROVIDES:append:class-native = " tar-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"

