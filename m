Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QqnYn-0000VG-P1
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:45:37 +0200
Received: by gxk3 with SMTP id 3so43920gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LyI75+l3FYA9xfKrZtaiIH+8139DoDd9820eLg2Mr5Y=;
	b=p2hPRGND9qv14n19Bs706L8+jJH/ZgI28VitSzJvTvWOoUgJCCYSRLBk5Z9Uo8PArT
	E7HP32GDyCExuTWFmyIyA5vlpbuwrhxENrWZ//ouSAaPCPwStxgrOduXBTgPP0yE62gI
	ZtLOXlRZxc4QRMRWsca76dtrfdSbe7Jmd1iFM=
Received: by 10.236.175.200 with SMTP id z48mr2780974yhl.40.1312900868149;
	Tue, 09 Aug 2011 07:41:08 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id w1sm6579291yhi.65.2011.08.09.07.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 07:41:07 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 07:40:53 -0700
Message-Id: <f37fff1303b6bd40bb6ff790eceb66bd7b08b824.1312900463.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1312900463.git.chris_larson@mentor.com>
References: <cover.1312900463.git.chris_larson@mentor.com>
In-Reply-To: <cover.1312900463.git.chris_larson@mentor.com>
References: <cover.1312900463.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] image: add support for generally useful {dev, doc, dbg}-pkgs features
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

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass |   34 ++++++++++++++++++++++++++++++++--
 1 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e057329..54eb78b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -6,8 +6,8 @@ inherit imagetest-${IMAGETEST}
 LICENSE = "MIT"
 PACKAGES = ""
 MULTILIB_IMAGE_INSTALL ?= ""
-RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${MULTILIB_IMAGE_INSTALL} ${FEATURE_INSTALL}"
-RRECOMMENDS += "${FEATURE_INSTALL_OPTIONAL}"
+RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${MULTILIB_IMAGE_INSTALL} ${NORMAL_FEATURE_INSTALL}"
+RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -19,6 +19,36 @@ IMAGE_FEATURES[type] = "list"
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 
+# packages to install from features, excluding dev/dbg/doc
+NORMAL_FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(normal_groups(d), d))}"
+NORMAL_FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(normal_groups(d), d))}"
+
+def normal_groups(d):
+    """Return all the IMAGE_FEATURES, with the exception of our special package groups"""
+    extras = set(['dev-pkgs', 'doc-pkgs', 'dbg-pkgs'])
+    features = set(oe.data.typed_value('IMAGE_FEATURES', d))
+    return features.difference(extras)
+
+def normal_pkgs_to_install(d):
+    import oe.packagedata
+
+    to_install = oe.data.typed_value('IMAGE_INSTALL', d)
+    features = normal_groups(d)
+    required = list(oe.packagegroup.required_packages(features, d))
+    optional = list(oe.packagegroup.optional_packages(features, d))
+    all_packages = to_install + required + optional
+
+    recipes = filter(None, [oe.packagedata.recipename(pkg, d) for pkg in all_packages])
+
+    return all_packages + recipes
+
+PACKAGE_GROUP_dbg-pkgs = "${@' '.join('%s-dbg' % pkg for pkg in normal_pkgs_to_install(d))}"
+PACKAGE_GROUP_dbg-pkgs[optional] = "1"
+PACKAGE_GROUP_dev-pkgs = "${@' '.join('%s-dev' % pkg for pkg in normal_pkgs_to_install(d))}"
+PACKAGE_GROUP_dev-pkgs[optional] = "1"
+PACKAGE_GROUP_doc-pkgs = "${@' '.join('%s-doc' % pkg for pkg in normal_pkgs_to_install(d))}"
+PACKAGE_GROUP_doc-pkgs[optional] = "1"
+
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_INSTALL ?= ""
 IMAGE_INSTALL[type] = "list"
-- 
1.7.4.1



