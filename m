Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62hj-0002wC-V8
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 17:30:08 +0100
Received: by ghbz2 with SMTP id z2so914526ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HrNDK94SVgnZkb5J7nf4c1RI4QUcpjLFfj87XGcOsEA=;
	b=jQ3oLdPwnwWgzjO7fiLHsPANNsGdNPmxi/kmD+RmMnn8e3fRy5rIRB8ROKfs15amp+
	nhqY5NT0Pl40Ie1raGbRzWIDqPAibThnjAiHhwp/tOkvT6JCBKFF0FEzQzRUlIzBl7aM
	FxsVy5rDSARYSg83BmMXdRzxe1OVb/j8MJGG445n1VnNYzScRCUqcbVxjHueHKqXLfiC
	bzYl60Vu2LyLqImnXYlWVldO8jQpbfxUJyyFbP9uNLlciLR/c1Jqvgh9UpHy+XvaqAKo
	FHDx/bUmJQdOEMTneJiBsQYcLFWcLelwwFbD5EhCxSRYA7T5vXj3dXYrHsuwKh7nXpen
	1Upw==
Received: by 10.101.139.29 with SMTP id r29mr930432ann.65.1331310088228;
	Fri, 09 Mar 2012 08:21:28 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm15000143yhj.7.2012.03.09.08.21.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:21:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:21:13 +0000
Message-Id: <7e33ddb0c3c1692afb3c96978a03f598ca4b84e7.1331310044.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
Subject: [PATCH 2/6] image.bbclass: fix rootfs generation without package management tools
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
X-List-Received-Date: Fri, 09 Mar 2012 16:30:08 -0000

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
index a62eb2c..533f53c 100644
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



