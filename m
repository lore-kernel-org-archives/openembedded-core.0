Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0658C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:05:00 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.23930.1641765900009200763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IEWvjS9f;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id e19so3719645plc.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ssi1YGS6CogmkGD/uwzSx/Ld5cDtzrZhhFxd5+XTI/w=;
        b=IEWvjS9fAujiRIatdj36SI+qqgGIL0Bd2RKuNt02je4EVr20EA0BQbPsYpGoNnGdFg
         fMnX+Hr07+I9r2kcPC1vgCZshDq5pQMBK0avSV73w30N/k1e0vFKutnH90vmDlawADpC
         qmQ297rQRYEiqI1mtlP/+yA+l7hsPWrWRPNgSdR6FBcJP2tF6kFlRqvcHFAR++KhIxGi
         XAVZu3jTdm95l9w4byIylq56wPWCrGlo7yq0x0VFDC1WzSuSvxmU8uKCDIApkxbhmhok
         HXDGlseiaEpo17vpM3U86zDxmw2eSdqCLGz+YULSCB4iYYYZuSXS2pQa2qitjNQyXaz8
         ZIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ssi1YGS6CogmkGD/uwzSx/Ld5cDtzrZhhFxd5+XTI/w=;
        b=j+PWhd0V3tHRJZetfz1fHAhqzfJoZodJB6NiS34eYALsZGc95ykUWxPvdzAp8q9WcH
         JDMz1RQnKpK48T2rEVuIY6ciBHMeAIOcp9d+hZKxDGJss6gKliXJxg24YQ94XOE+Qwh4
         qS02QLNUX8wWzPNWsSncj9J5L6WHEcXaKvYZjTP0XJTn2GpGB/nSpMVvujph+t5LiFu5
         1ZouFsYScXycQhKDaV2rKgMIOP4/nfy4nux9CS5zUsb3Ep7f6QlZTF3lmG4MqX8UCrd/
         z/owzREm0Ijh3actYb4Uki4y2k+F3Cf9MUHP3l6Xo0u57+nAdgUFX4olUU0MD42LtBOH
         n/KQ==
X-Gm-Message-State: AOAM531FqvGr9vOHDRDfrWZNuatUPL5fG+7VwbwcEhZ50y/P+09jJDFT
	sDwXuq4xwW9Qg3rr9NZbq0P4veda0eH4aovkeuA=
X-Google-Smtp-Source: 
 ABdhPJzJ+cRwe71v/AbcZavijPkBb7Auz1I+GLkThI6nEk5BMJixcej586mZIWa31Mxbh3LX82Kxaw==
X-Received: by 2002:a17:902:6e01:b0:149:8800:58b7 with SMTP id
 u1-20020a1709026e0100b00149880058b7mr58325992plk.47.1641765899087;
        Sun, 09 Jan 2022 14:04:59 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] asciidoc: properly detect and compare Python
 versions >= 3.10
Date: Sun,  9 Jan 2022 12:04:16 -1000
Message-Id: 
 <da3bd5e0934b6462ae53225a58305235849b32d5.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:05:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160303

asciidoc.py cannot properly detect versions of Python >= 3.10

Backport patch from upstream to correct this:

https://github.com/asciidoc-py/asciidoc-py/commit/44d2d6095246124c024230f89c1029794491839f

Fixed upstream in version 9.04, so this patch is not required in master.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../asciidoc/detect-python-version.patch      | 42 +++++++++++++++++++
 .../asciidoc/asciidoc_8.6.9.bb                |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/asciidoc/asciidoc/detect-python-version.patch

diff --git a/meta/recipes-extended/asciidoc/asciidoc/detect-python-version.patch b/meta/recipes-extended/asciidoc/asciidoc/detect-python-version.patch
new file mode 100644
index 0000000000..14c1cd806e
--- /dev/null
+++ b/meta/recipes-extended/asciidoc/asciidoc/detect-python-version.patch
@@ -0,0 +1,42 @@
+From 44d2d6095246124c024230f89c1029794491839f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Fri, 30 Oct 2020 15:10:35 +0100
+Subject: [PATCH] Properly detect and compare Python version 3.10+ (#151)
+
+Upstream commit: https://github.com/asciidoc-py/asciidoc-py/commit/44d2d6095246124c024230f89c1029794491839f
+
+Slightly modified to cleanly apply to asciidoc 8.6.9:
+- VERSION and MIN_PYTHON_VERSION changed to reflect values in 8.6.9
+- line numbers corrected to eliminate offset warnings
+
+Upstream-Status: Backport
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ asciidoc.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/asciidoc.py b/asciidoc.py
+index f960e7d8..42868c4b 100755
+--- a/asciidoc.py
++++ b/asciidoc.py
+@@ -30,7 +30,7 @@
+ # Used by asciidocapi.py #
+ VERSION = '8.6.10'           # See CHANGELOG file for version history.
+ 
+-MIN_PYTHON_VERSION = '3.4'  # Require this version of Python or better.
++MIN_PYTHON_VERSION = (3, 4)  # Require this version of Python or better.
+ 
+ # ---------------------------------------------------------------------------
+ # Program constants.
+@@ -4704,8 +4704,8 @@ def init(self, cmd):
+         directory.
+         cmd is the asciidoc command or asciidoc.py path.
+         """
+-        if float(sys.version[:3]) < float(MIN_PYTHON_VERSION):
+-            message.stderr('FAILED: Python %s or better required' % MIN_PYTHON_VERSION)
++        if sys.version_info[:2] < MIN_PYTHON_VERSION:
++            message.stderr('FAILED: Python %d.%d or better required' % MIN_PYTHON_VERSION)
+             sys.exit(1)
+         if not os.path.exists(cmd):
+             message.stderr('FAILED: Missing asciidoc command: %s' % cmd)
diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index 932339f739..62738dc8d9 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main \
-           file://auto-catalogs.patch"
+           file://auto-catalogs.patch \
+           file://detect-python-version.patch"
 SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
 PV .= "+py3-git${SRCPV}"
 
-- 
2.25.1


