Return-Path: <sumit.garg@linaro.org>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8877FA47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 06:59:37 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 62so4855354pfu.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 22:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=1umpX1Ea2/DVrDtNejQoAZWiCXKZFj0lTxlV/OqJzho=;
	b=UVMWgjpP2zbI909a5n57xc7tkHa+aESu5dhu3FHw8DH0n6nEPtBe9JXJ1zunb9uei0
	zu//kHrZonrUqmjoqcjeaY40N6JjGQM6oOMlA0oKqAkGZoTaaZ7VhJzoHm+JxEiuJiKJ
	ILisgbHVo6mV1U2Ze7t6FweAZ1qW/Y0FiyuDP+xnb7XAp1sDsL4uUbBs8C75sSWtm9TW
	WdMDC1Q9+CPydZbmC8snlKXg2JBIUkzLzkaOo1mglBr2XpHDOmHdcCaNlb7ANRjBhdVk
	b/L9P3zdBE+jrvZvixV4E4vmqFhQiKnFtfpk5LDskiPGMMtS09htsBU0ShUO2uHwI+cQ
	RkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1umpX1Ea2/DVrDtNejQoAZWiCXKZFj0lTxlV/OqJzho=;
	b=kP1Vzr+GH8hdPRUDQdw2DPwBbdc+Jf9J83MvnMhUKmTXNqGLSTz90ret/5xxxMbXd7
	rnTkX9auYYbPmv7AaTOyQc7JuGpMkBs+hSTQpHkKVf2dHR7FbVD5OQYF2GPyaZLvk96G
	aEXLH5Kmqt+At0Bp4IiSfXm0t0pG1b8UDz2nZIxnOavV+xq8yCcAhjRiZPXhA4Chg6Lw
	cHzZLrYqKpYrqFP+CP9ejpEyAHPA4diuksFfrje5nTrmX4nVkL/1y4AZUEypzl8hXx2A
	LkJ8DjvitjW/z0Wd7fI4IsG1xjFdripqxw2bNPq5qAmQuBU4vqYVTw0EWR/oBdNFubcm
	b5bQ==
X-Gm-Message-State: APjAAAWFqug/KyZ5lxLponSiwLLRLmhpABM1ygFa9jqLGVA1YLfJipsi
	5bL+YK8ZNMEbgKWJ+51npLX/ZmwKBgA=
X-Google-Smtp-Source: APXvYqzlZ6Vdgb6s17THqEbawbBcAfs0hiPheEvFjMZIcwY/IngBXPX5lfk86Z6YgTzukp/wF2f6GQ==
X-Received: by 2002:a65:488f:: with SMTP id n15mr45959810pgs.61.1579244377452; 
	Thu, 16 Jan 2020 22:59:37 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	m15sm26501261pgi.91.2020.01.16.22.59.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jan 2020 22:59:36 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 12:29:14 +0530
Message-Id: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 06:59:37 -0000

Some native tools dependency issues were seen while building with
external GCC tool-set rather than source GCC tool-set. While building
with source tool-set these dependencies were implicitly met which is not
the case with external tool-set. So explicitly state these native tools
dependencies.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta/classes/autotools.bbclass                     | 2 +-
 meta/recipes-extended/man-db/man-db_2.9.0.bb       | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 3d22ad0..4c71be2 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -10,7 +10,7 @@ def autotools_dep_prepend(d):
     deps += 'autoconf-native automake-native '
 
     if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
-        deps += 'libtool-native '
+        deps += 'libtool-native xz-native '
         if not bb.data.inherits_class('native', d) \
                         and not bb.data.inherits_class('nativesdk', d) \
                         and not bb.data.inherits_class('cross', d) \
diff --git a/meta/recipes-extended/man-db/man-db_2.9.0.bb b/meta/recipes-extended/man-db/man-db_2.9.0.bb
index 5b017e8..3cbb0de 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
 SRC_URI[md5sum] = "897576a19ecbef376a916485608cd790"
 SRC_URI[sha256sum] = "5d4aacd9e8876d6a3203a889860c3524c293c38f04111a3350deab8a6cd3e261"
 
-DEPENDS = "libpipeline gdbm groff-native base-passwd"
+DEPENDS = "libpipeline gdbm groff-native base-passwd flex-native"
 RDEPENDS_${PN} += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 101b3df..2938da0 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org/"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/apps"
 LICENSE = "MIT-X"
-DEPENDS = "util-macros-native virtual/libx11"
+DEPENDS = "util-macros-native virtual/libx11 gettext-native"
 
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.7.4


