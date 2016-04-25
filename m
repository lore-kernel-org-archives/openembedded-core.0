Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2412606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:51:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3PDpkk0009495
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 06:51:46 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 06:51:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2016 06:51:40 -0700
Message-ID: <4264e15fe14d6ef8fc99c1df40541f76cd19285f.1461592183.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461592183.git.liezhi.yang@windriver.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Mon, 25 Apr 2016 13:51:45 -0000
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


