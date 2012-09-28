Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THf75-0008JR-TO
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 20:16:35 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so116762wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 11:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aqY51CdNgExz9jVRUZBcIDO6DpC1NNd0dSVqbyeS34o=;
	b=xUhPDNg9vVXRRn8Rn8Se9l6/Fl+f89lwcCGXewliNCi+aq74ABCVNgQ+ZdoqAGd0gE
	hfVqR6xF/SBpLGw5N+1VKPOykOhpaLPVCxlUxC7pBqVPP2PdIz1UE8Vk42mQZsdba3Tm
	uxBJqZzwvj0bxn58a8ORkFArfnuKQ1rjXHC0nZ/DSJZyT1dE0kmJ6E/U5IAwOzIZJQBH
	rgp31KmewG+gPOnOmqke7Fr5la/QVkQtIwV98BccvY9K4EVbBWlcAX1FmkonUb9IwYRJ
	yc6avAlRCeM+AIwokhV08qAABeczFZlAYzz5XCudnGUk54jC5urbqaYZ/FXgEuDILYhc
	9Fqw==
Received: by 10.180.8.161 with SMTP id s1mr442915wia.0.1348855422767;
	Fri, 28 Sep 2012 11:03:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm568202wiz.4.2012.09.28.11.03.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 11:03:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2012 20:03:49 +0200
Message-Id: <1348855430-11091-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [RFC][PATCH 1/2] rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
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
X-List-Received-Date: Fri, 28 Sep 2012 18:16:36 -0000

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
index 881fdbd..244dc05 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -7,6 +7,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
+do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 46e8d60..d3228b9 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -11,6 +11,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
+do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index d95ccfa..c07a948 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -20,6 +20,7 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot"
 do_rootfs[depends] += "createrepo-native:do_populate_sysroot"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
+do_rootfs[vardepsexclude] += "BUILDNAME"
 
 RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; package_generate_rpm_conf; "
 RPM_POSTPROCESS_COMMANDS = ""
-- 
1.7.12



