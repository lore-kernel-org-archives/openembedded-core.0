Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 808E26B25F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 16:03:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,780,1389740400"; d="scan'208";a="43757458"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 02 Apr 2014 18:03:33 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 2 Apr 2014 18:03:33 +0200
Received: from u75.usr.ingenico.loc (10.23.7.75) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 2 Apr 2014 18:03:33 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Apr 2014 18:01:50 +0200
Message-ID: <1396454510-5744-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1396451750-10888-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1396451750-10888-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [PATCH v2] rootfs.py: introduce USE_DEVFS check
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
X-List-Received-Date: Wed, 02 Apr 2014 16:03:33 -0000
Content-Type: text/plain

Since commit a83144bac8d67704ff66f5dc0fc56f5b63979694 (2014-02-11), USE_DEVFS is not considered anymore.
For compatibility, let's restore USE_DEVFS semantic.
Also add USE_DEVFS to documentation.conf.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/conf/documentation.conf | 1 +
 meta/lib/oe/rootfs.py        | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 4d49a02..315e1b5 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -436,6 +436,7 @@ UBOOT_MACHINE[doc] = "Specifies the value passed on the make command line when b
 UBOOT_MAKE_TARGET[doc] = "Specifies the target called in the Makefile."
 UBOOT_SUFFIX[doc] = "Points to the generated U-Boot extension."
 UBOOT_TARGET[doc] = "Specifies the target used for building U-Boot."
+USE_DEVFS[doc] = "When building images, specifies to populate or not ${sysconfdir}. This variable defaults to '1' (leave directory empty, surely because devtmpfs do the job). Set it to '0' to use makedevs (or consider using a custom file with IMAGE_DEVICE_TABLES)."
 USER_CLASSES[doc] = "List of additional classes to use when building images that enable extra features."
 USERADD_PACKAGES[doc] = "When a recipe inherits the useradd class, this variable specifies the individual packages within the recipe that require users and/or groups to be added."
 USERADD_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the useradd command if you wish to add a user to the system when the package is installed."
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 3eac3c9..dddbef4 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -116,7 +116,8 @@ class Rootfs(object):
                          "offline and rootfs is read-only: %s" %
                          delayed_postinsts)
 
-        self._create_devfs()
+        if self.d.getVar('USE_DEVFS', True) != "1":
+            self._create_devfs()
 
         self._uninstall_uneeded()
 
-- 
1.8.5.4


