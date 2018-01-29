Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B9831787DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 16:29:14 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id a43so323205wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 08:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=m2iRW6Tjdndsl/GIY8CkcTFafvTz+kOzqcYuu2dG5kU=;
	b=dxhVtlw9yxkek4ZjWgu4jZEzG+F9pL22CcVd/kLer8CmaHprW9gQZge59i5ANFKNMl
	00qrxTkooojl8loydX5PfJYW1HVJLcAJpOvulBwpyr4FkBvm4WufG+6A940zR0qHkKpe
	9Aobm1thmV0wNH+X1so8UD5RCg5FZpm8hnelMUkEoIiBm6dlVjSgdrTGQeofpbka62h9
	FVtVnYYL/njyPw7YGQ+ZfcZsu2BWAJDR8IONw2K2379ueMkMkmifsJfPDdebztONJKtB
	Q9jLJxk0p/n5KIddIH7Ep+4Cl+jLVYSqemb3h2dOiMYhoUPj78ZIXZ2CwYwIDknHEtfW
	+5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=m2iRW6Tjdndsl/GIY8CkcTFafvTz+kOzqcYuu2dG5kU=;
	b=junynyYDAnBrLPzt0FDsff9EL/ZCBL99VEtptFtC4s5OPogzMyVcS0wWF5/glP+2yD
	emvXdeYAQ3rbgo2wsSvdFdJN+A/Ms6cJxsaIDYMBhHh3jKE0O2Xlj8ebdgE3JZ9Z6XIi
	ENioFRSZ2kE+FUsGlEevbovLYeHQG9OnIsGGPQBk0aRIERz4IUq7SRMUzhKszb5HXbrU
	vu1rHGMxDa8znYWQqRnoBWU6qkEpZZHLbECYGmFO8TjiuVBWqZeCQLCm7TEjBg01W3Dz
	1yQItAsVPJeMsBkOHIZ5JRNYBQ2kcnmPG1HBK0P1DapBXXGKZLVghIBjYUs1xjcDPTyk
	4p4A==
X-Gm-Message-State: AKwxytfL7aQDTjdnFoWBb6ObEw61UxZUEBx8KJrX1xCUKMPCRhJqs99i
	P+pfGAhKn8qindijuLTvh3UE7Ydo
X-Google-Smtp-Source: AH8x224IFiqLQCH51lg/ECyE2PH6TUMGSczVTjkUyDKeNPuDCSGPeo9WXfr791En0AgyOwEnBHbZXQ==
X-Received: by 10.223.135.18 with SMTP id a18mr19866670wra.122.1517243355199; 
	Mon, 29 Jan 2018 08:29:15 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l2sm2509120wre.6.2018.01.29.08.29.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 08:29:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 16:29:12 +0000
Message-Id: <20180129162912.7899-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libxshmfence: fix build with glibc 2.27
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 16:29:15 -0000

With glibc 2.27 memfd_create() is behind a _GNU_SOURCE guard, so use
AC_USE_SYSTEM_EXTENSIONS to define it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/libxshmfence/extensions.patch              | 17 +++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb      |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
new file mode 100644
index 00000000000..4cc9e05ab53
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
@@ -0,0 +1,17 @@
+With glibc 2.27 memfd_create is behind a _GNU_SOURCE guard, so call
+AC_USE_SYSTEM_EXTENSIONS to get that defined.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 0c98875..ebf4dee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
+ AC_CONFIG_HEADERS([config.h])
+ 
++AC_USE_SYSTEM_EXTENSIONS
++
+ # Initialize Automake
+ AM_INIT_AUTOMAKE([foreign dist-bzip2])
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
index ae34b1fe46c..1df068d1b0f 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
@@ -13,5 +13,7 @@ DEPENDS += "virtual/libx11"
 
 BBCLASSEXTEND = "native nativesdk"
 
+SRC_URI += "file://extensions.patch"
+
 SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
 SRC_URI[sha256sum] = "d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c"
-- 
2.11.0


