Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EC37D73BE8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:16:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,470,1427785200"; d="scan'208";a="733176206"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 09:15:36 +0000
Message-Id: <d7c5d6c81a376795f7c8321695f81b73b94f4d6c.1432199284.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/5] python3: Fix distutils import error
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
X-List-Received-Date: Thu, 21 May 2015 16:16:08 -0000

The patch 12-distutils-prefix-is-inside-staging-area.patch is used
to fix problems when trying to get some environmental variables
but it is only necessary for python3-native, on python3-core it
causes an error when importing distutils since env variables of
the likes of HOST_SYS and such do not exist on target, this removes
the patch from python3-core so distutils can be imported correctly.

[YOCTO #7766]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python3_3.4.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index bee9e6f..120b594 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -7,7 +7,6 @@ PYTHON_BINABI= "${PYTHON_MAJMIN}m"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
-file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
 file://000-cross-compile.patch \
 file://020-dont-compile-python-files.patch \
-- 
1.8.4.5


