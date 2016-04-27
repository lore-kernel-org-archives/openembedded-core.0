Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1C4731FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 02:20:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3R2KXLG030787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 19:20:33 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Apr 2016 19:20:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Apr 2016 19:20:27 -0700
Message-ID: <b59fd4c5891e116865197f6a71186a99b893924b.1461723377.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461723377.git.liezhi.yang@windriver.com>
References: <cover.1461723377.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] packagegroup.bbclass: set LICENSE and LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 27 Apr 2016 02:20:32 -0000
Content-Type: text/plain

* Use "??=" in bitbake.conf to set LICENSE, so that it can overrided by
  packagegroup.bbclass and recipes.

* Use "?=" to set LICENSE and LIC_FILES_CHKSUM to MIT by default
  in packagegroup.bbclass, this won't impact any packagegroup recipes
  which use non-MIT license, since they can be overrided by the recipe.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/packagegroup.bbclass | 5 +++++
 meta/conf/bitbake.conf            | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 38bdbd3..3674894 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -14,6 +14,11 @@ PACKAGE_ARCH ?= "all"
 # Fully expanded - so it applies the overrides as well
 PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
 
+LICENSE ?= "MIT"
+LIC_FILES_CHKSUM ?= "${@oe.utils.ifelse(d.getVar('LICENSE', True) == 'MIT', \
+                     'file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420', \
+                    '')}"
+
 inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED', True) == 'all', 'allarch', '')}
 
 # This automatically adds -dbg and -dev flavours of all PACKAGES
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 40796aa..66646c8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -247,7 +247,7 @@ SUMMARY_${PN}-doc ?= "${SUMMARY} - Documentation files"
 DESCRIPTION_${PN}-doc ?= "${DESCRIPTION}  \
 This package contains documentation."
 
-LICENSE = "INVALID"
+LICENSE ??= "INVALID"
 MAINTAINER = "OE-Core Developers <openembedded-core@lists.openembedded.org>"
 HOMEPAGE = ""
 
-- 
2.7.4


