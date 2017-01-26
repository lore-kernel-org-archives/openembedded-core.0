Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A713773180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 16:47:12 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id r144so93864131wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 08:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xMaCG8kEAza5VcV5zOUDpNihE1/K/IkmCF8BMtHCZJs=;
	b=RbXS7W9/fZNDIsBy8PXFsqLZKzsl0+/1iOWSCqmZlUGx5PxZVd6QduTLLi4Oh1v+jW
	7jVqSzD/xJCPOnQU/BvNWiiQIZkHlVu5fMaUtspJz3vSOeOJwpJwmsR7Xqg7641IUP43
	NPSeJtmvsFy175oILe7Qn9Fb0X0P1w5F9i33F0dDgPs7DV2KCKxcwyhYPWYSF3Uml8zl
	Sg+0H4kSpTH/wQ/7F5qt4NK38N16dkOQ1mn9xTsThc2xzb3JWkCX7Kg60mWe0uKgLUDO
	hjdZZgbfsKVKPvjANj/nBhb/Q7ITqaluOd90RB5VU6y9A0b7LMMgnSeQ7pO1rYT1NY+t
	Bs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xMaCG8kEAza5VcV5zOUDpNihE1/K/IkmCF8BMtHCZJs=;
	b=fhrAXYrnf5vTUIMB0MubP42ousIzCxr+czoScNDgjz53DhS3O1mu2DBy76T7bEYeDU
	ZkbNFLXVZqXGAcpgUayiLC/CcHHLFD3ZI/0fPTvjYJaGHRqdh++QeBUUA4IyelN/T16q
	oIZll3/CgrnQ3JjOc/zlbXt75yX39o+LAUcKYwvcYasM/AgyUZROqoaDT0oaGJmIPnQh
	fIBOh/9AdOiNobYxipAa5iDPs1qMysmGoi+azSDtYJGM66AIkD+Az1Dp5SX7eHc+EqJl
	1hOP2ikufjdMAZBaH+7mbN885NQu2aDWj+ni0v2o9zhaWrJf9cLTlhcYK6XTai9Cn3kz
	ZIWw==
X-Gm-Message-State: AIkVDXI0ZIMBA0fuvo5vLJsoELx4steGmFZI0MLAHkmSl9MJPazPfNm9i0zEXhdSEfPJfQ==
X-Received: by 10.28.17.20 with SMTP id 20mr29252186wmr.106.1485449232167;
	Thu, 26 Jan 2017 08:47:12 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	w16sm18545042wmd.4.2017.01.26.08.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 08:47:11 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 17:45:18 +0100
Message-Id: <20170126164518.23219-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: conditional inclusion of login utilities
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
X-List-Received-Date: Thu, 26 Jan 2017 16:47:13 -0000

If busybox is not selected as login manager, do not include the fragment
containing the corresponding utilities.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-core/busybox/busybox_1.24.1.bb | 2 +-
 meta/recipes-core/busybox/busybox_git.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index afb69d13e6..7d994dc10d 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
+           ${@["", "file://login-utilities.cfg"][(d.getVar('VIRTUAL-RUNTIME_login_manager') == 'busybox')]} \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index c2ee3e6c4b..4213ef4b1e 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -31,7 +31,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
+           ${@["", "file://login-utilities.cfg"][(d.getVar('VIRTUAL-RUNTIME_login_manager') == 'busybox')]} \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-- 
2.11.0


