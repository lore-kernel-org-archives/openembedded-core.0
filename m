Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf6H-0003ka-2z
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:55:29 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1554552dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UtJIm1inmHX1JnR4QAxwEISLpOLMTVxvTyIQLN26WvQ=;
	b=1Dojim+a9kWZffS+vcNHRK3Gshezunzr8X2XSfmcU+5dVjIS2tEWyzG/UIM8n5L8IL
	heDBOeV6mPdv8V0v0Ugoj1C/5cFZN2g5Or+OGypGcdRSr0cTFjW6F1xZuW2TlmmKP+Uc
	+6d0yHMruVSXk6eyhWbM+LOh6biaZ3xVh+3n92qErTUZas5TF7EJ2ozSf47DCOquBBuZ
	xdfuWf+0PlUwI9c8Nl6luv/Zxykmz46Lxzv3YVvIwuQMEomiDMegg3Ai+cogOvW7queW
	oc169sG3nncQ74PnLy092cogJEE8ZfYEmbmDytLDoEEwfk1Gf5/LpS3Q7bMeXI68EtLl
	TNCg==
Received: by 10.68.225.70 with SMTP id ri6mr20262768pbc.41.1355528451613;
	Fri, 14 Dec 2012 15:40:51 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gq10sm3666340pbc.54.2012.12.14.15.40.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:40:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:41 +0100
Message-Id: <d909934e2f6cca0b4ca34975445404f8867555ba.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/10] rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 23:55:29 -0000

* I have kernel recipe which depends on other recipe to build tiny initramfs
  image, without this change it rebuilds not only that initramfs image
  but also whole kernel when DATE or TIME is changed and OEBasicHash enabled
* also resolves ERROR shown when bitbake -S is used for image:
  ERROR: Bitbake's cached basehash does not match the one we just generated
  (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-image-minimal.bb.do_rootfs)!
  ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8dc and b5d6e2e5952770557c48c5779ddb73fc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rootfs_deb.bbclass | 1 +
 meta/classes/rootfs_ipk.bbclass | 1 +
 meta/classes/rootfs_rpm.bbclass | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 955382f..293953d 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -7,6 +7,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
+do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 02b1d57..5c962de 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -11,6 +11,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
+do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 2bb1b08..91bf108 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -20,6 +20,7 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot"
 do_rootfs[depends] += "createrepo-native:do_populate_sysroot"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
+do_rootfs[vardepsexclude] += "BUILDNAME"
 
 RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; package_generate_rpm_conf; "
 RPM_POSTPROCESS_COMMANDS = ""
-- 
1.8.0.2



