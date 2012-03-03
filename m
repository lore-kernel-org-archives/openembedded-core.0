Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3gtd-0001Qs-P3
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 05:48:41 +0100
Received: by ggcy3 with SMTP id y3so1012134ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 20:40:09 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.170.193 as permitted sender) client-ip=10.236.170.193; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.170.193 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.170.193])
	by 10.236.170.193 with SMTP id p41mr17372301yhl.15.1330749609716
	(num_hops = 1); Fri, 02 Mar 2012 20:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=TyNwg1PhJs/8NTUNVz0UTVWlJAYDaP9bmiPt7oJ6ZpA=;
	b=nmRY29EA9ovFZvCQik+B5JQNeUXmWxdamY3Wb6M+HGFvGbd9pG0v+fLAmoR5O2KIli
	edeYG0Q2WLIxh3Ij8AlPklY/LgDzH6Kcww3V6v4AwiTHs/MNkWuRNVx6UGuNTrMo/pKD
	ypvbS4CKBzfaGGGqC0923eAvW1PMPzd9yNWRHmk+GFkugWNysN/aZL29d+zxAi7unxon
	rSFJRmuoszzpFxJ1Ts7dYxnZ8gXXQxoo6ByVgEd9EVkdL5LP/LIX3sy8El2QqDvtolja
	voFNQurjDIhVG4Wv5dLIbs8TSb2A/NCCLs4VaZAe6c4gL+SMi5PtwPrbnw8os3FGZsR4
	6zMw==
Received: by 10.236.170.193 with SMTP id p41mr13816592yhl.15.1330749609627;
	Fri, 02 Mar 2012 20:40:09 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id p18sm12629635ano.20.2012.03.02.20.40.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 20:40:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2012 04:40:03 +0000
Message-Id: <57c7884c358bda5259c0cef0ec6fb10bc47eb158.1330749589.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330749589.git.otavio@ossystems.com.br>
References: <cover.1330749589.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] image.bbclass: fix rootfs generation without package management tools
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
X-List-Received-Date: Sat, 03 Mar 2012 04:48:42 -0000

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



