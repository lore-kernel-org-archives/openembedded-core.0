Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D92307BF70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 07:12:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0H7CY7k016642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2019 23:12:35 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 16 Jan 2019 23:12:34 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 17 Jan 2019 02:12:27 -0500
Message-ID: <20190117071227.57387-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Thu, 17 Jan 2019 07:12:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Reset default value of DEBUG_PREFIX_MAP with '-fdebug-prefix-map'.
Specifying -fdebug-prefix-map is equivalent to specifying all the
individual -f*-prefix-map options which means including
-fmacro-prefix-map and -fdebug-prefix-map currently. Option
-fmacro-prefix-map helps to avoid buildpaths qa warnings which caused
by __FILE__ macro expansion for packages such as llvm and librepo.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/bitbake.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0bdcd04d74..d20460e845 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+DEBUG_PREFIX_MAP ?= "-ffile-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+                     -ffile-prefix-map=${STAGING_DIR_HOST}= \
+                     -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
-- 
2.20.0


