Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QqnYm-0000V5-Sa
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:45:37 +0200
Received: by gxk3 with SMTP id 3so43904gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 07:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vSJTpUS90vTMQwiQ+tV/CLjaZ6+tQ0JlDePHnHRTemo=;
	b=Rp8+uvIxNLT8Gx7hxbBmlYgRk4V0byidVscMcPOc+egyUymtMG6vWwDnm68jmvzDz+
	cMugDLMYcrEEHQqip0p7Tqh7l5UfYRjj+WZwnprcrw2TSDhmyJYDKWagbpBDpD+b91vK
	W9ITWTHacBd01OPyGkLEwmeiAkq1OpdaVktTo=
Received: by 10.91.195.19 with SMTP id x19mr6094104agp.6.1312900866652;
	Tue, 09 Aug 2011 07:41:06 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id w1sm6579291yhi.65.2011.08.09.07.41.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 07:41:06 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 07:40:52 -0700
Message-Id: <9f512860d6f129f01eb815be5594ef10e9bcce57.1312900463.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1312900463.git.chris_larson@mentor.com>
References: <cover.1312900463.git.chris_larson@mentor.com>
In-Reply-To: <cover.1312900463.git.chris_larson@mentor.com>
References: <cover.1312900463.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] image: implement IMAGE_FEATURES
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
X-List-Received-Date: Tue, 09 Aug 2011 14:45:37 -0000

From: Chris Larson <chris_larson@mentor.com>

IMAGE_FEATURES is analagous to DISTRO_FEATURES and MACHINE_FEATURES, for
root filesystem construction. Currently, the only supported features are
any defined package groups, as used by the oe.packagegroup python
module.

Example usage:

    PACKAGE_GROUP_myfeature = "vim iptables"
    IMAGE_FEATURES += "myfeature"

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 243baa9..e057329 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -6,15 +6,26 @@ inherit imagetest-${IMAGETEST}
 LICENSE = "MIT"
 PACKAGES = ""
 MULTILIB_IMAGE_INSTALL ?= ""
-RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${MULTILIB_IMAGE_INSTALL}"
+RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${MULTILIB_IMAGE_INSTALL} ${FEATURE_INSTALL}"
+RRECOMMENDS += "${FEATURE_INSTALL_OPTIONAL}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+# IMAGE_FEATURES may contain any available package group
+IMAGE_FEATURES ?= ""
+IMAGE_FEATURES[type] = "list"
+
+# packages to install from features
+FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
+FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
+
 # "export IMAGE_BASENAME" not supported at this time
+IMAGE_INSTALL ?= ""
+IMAGE_INSTALL[type] = "list"
 IMAGE_BASENAME[export] = "1"
-export PACKAGE_INSTALL ?= "${IMAGE_INSTALL}"
+export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${FEATURE_INSTALL}"
 export MULTILIB_PACKAGE_INSTALL ?= "${MULTILIB_IMAGE_INSTALL}"
-PACKAGE_INSTALL_ATTEMPTONLY ?= ""
+PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
-- 
1.7.4.1



