Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3272D7568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:22:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9MRRf016606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:22:27 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:22:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:22:24 -0700
Message-ID: <66c420800cbd82a710753a3d334e13393a177baf.1432782683.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432782683.git.liezhi.yang@windriver.com>
References: <cover.1432782683.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python3: fix build for shared object
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
X-List-Received-Date: Thu, 28 May 2015 09:22:27 -0000
Content-Type: text/plain

Fixed when build on armv7a_vfp_neon:
Python-3.3.3/Modules/_struct.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC

All the archs should use -fPIC when build shared object for linux.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python3_3.4.3.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index bee9e6f..5ef17e6 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -67,6 +67,7 @@ EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 export _PYTHON_PROJECT_BASE = "${B}"
 export _PYTHON_PROJECT_SRC = "${S}"
+export CCSHARED = "-fPIC"
 
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
-- 
1.7.9.5


