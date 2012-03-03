Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3t44-0000cJ-KJ
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 18:48:16 +0100
Received: by mail-yx0-f175.google.com with SMTP id m3so1171174yen.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 09:39:46 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.101.176.6 as permitted sender) client-ip=10.101.176.6; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.101.176.6 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.101.176.6])
	by 10.101.176.6 with SMTP id d6mr6085039anp.27.1330796386410 (num_hops
	= 1); Sat, 03 Mar 2012 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=TyNwg1PhJs/8NTUNVz0UTVWlJAYDaP9bmiPt7oJ6ZpA=;
	b=pS9JkZ6p9Sl3p8eGPaN6L+CdHjJsyuFp2anQgxp48jQiQd0NEPIoMwzPSfpjyRDjAa
	3fN9ZnO7whRoo876KKwhGnGigzHQzFt5oaURhJ7WJVNHfW+MrIeV6LOZwpnAiLnKhkp0
	gU30L2VGkNXI9sq/M3fr7lvPVAffmWzV1/lnorVxsVew7rjO/r9F+iX4JFKrkjKDXGrX
	s0SHyz84SQTrOuILN/9YFkd/2AVrtbBFCqu2Icoxt9I9+TloaLehX3SDbXHK1hH1OsDl
	f+Hkr6rpwX5D73XtRDC64phJez6iz0ObQ5I8HWA/4x4Z5n401KXEeEkHw5BjUKs65vsl
	Kl9A==
Received: by 10.101.176.6 with SMTP id d6mr4829201anp.27.1330796386360;
	Sat, 03 Mar 2012 09:39:46 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o11sm15284275anl.11.2012.03.03.09.39.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 09:39:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2012 17:39:32 +0000
Message-Id: <7c13d18bc74fcc48e9c03bcd7c74630b62957f12.1330796256.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
Subject: [PATCH 2/4] image.bbclass: fix rootfs generation without package management tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2012 17:48:16 -0000

When building without package management tools the
ROOTFS_BOOTSTRAP_INSTALL packages need to be available to provide the
bare minimal for rootfs unconfigure postinsts to be on first boot.

Those packages where being include in core-image.bbclass' based images
however every image needs those available for proper rootfs generation.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/core-image.bbclass |    2 --
 meta/classes/image.bbclass      |    7 +++++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 668297b..e2ad0fc 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -51,8 +51,6 @@ CORE_IMAGE_BASE_INSTALL = '\
     task-core-boot \
     task-base-extended \
     \
-    ${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
-    \
     ${CORE_IMAGE_EXTRA_INSTALL} \
     '
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index dfce381..8e9da99 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -5,7 +5,7 @@ inherit imagetest-${IMAGETEST}
 
 LICENSE = "MIT"
 PACKAGES = ""
-RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL}"
+RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
 RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -14,6 +14,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
 
+# rootfs bootstrap install
+ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
+
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
@@ -52,7 +55,7 @@ PACKAGE_GROUP_doc-pkgs[optional] = "1"
 IMAGE_INSTALL ?= ""
 IMAGE_INSTALL[type] = "list"
 IMAGE_BASENAME[export] = "1"
-export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${FEATURE_INSTALL}"
+export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
 PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
 # Images are generally built explicitly, do not need to be part of world.
-- 
1.7.2.5



