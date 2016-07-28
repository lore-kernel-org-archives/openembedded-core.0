Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 17E956072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 10:58:23 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l69so3470189lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=T0Cflerok73Be6yeLg2xXjVE6TeDq4NXFr7xnbZyE94=;
	b=UOsZi9BqpN5Xioj/F1xrejARTM1jb618SkaIt0rku9RjHYJamWD5UFhnlQTSgfI8rq
	nbHkmLmijCfawpmLSfVvbHa/a/a4b9cCgCoeqx5Zk7lzKiLWNCLNcukGPyLcpwxDV733
	aU61nsvb2nqM/EKnmvaff0ORS5Ym7JTc5FHH57RRmtXPBtDeSOMFSplI85scW98kregi
	NdiknxGlUl7Oa3f1Zqk21ktdYvArlP1KweW+zEcjKnM+HIo9iK5porCPzipFiXxUIGvC
	NTFk31h3fMTqZ8RCzsG9Qm/kfSSSxw/48fDJnC0DcFSz2ZEZ70gUOW2rMr4y8YwKguGT
	ST0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=T0Cflerok73Be6yeLg2xXjVE6TeDq4NXFr7xnbZyE94=;
	b=gMyYfsoCvPlLQxWEUwc2u5UOBJWkwK7ELkSRwYcA0KaiyZtZnsygNkjzkwRN1ahhlp
	O3Y5WAh1WR+sU/rMleSB03g9jbgOzDLi3dWCnyr/trvoQPTkkOP5WPAFY0AaqGU/496t
	4Kk+ggm1Vnj66OfLDFe8W+Ns0F4S07k6MJSDVtrKNgmCslSJom0vScYVctalMhsPjC4v
	bzJxPjfjf4ODEVMDg8eBiPd1ntjVhzx1HUY+pyji9LanfGDkdcDIm/wjcy5IIJsgjv7w
	x1qdzJmzIqWfdL2askDa3WWBOId4D0ymXQKCeRpWqDjR1z6+PAICnKaqqtL8F0Fp8kdz
	98oA==
X-Gm-Message-State: AEkoous49NED1Z0ejQ+qw8sXEstSufvtkDH+vzEz+nkdv8BzDM1MRSkCRKrbubRKLNTBpg==
X-Received: by 10.46.71.144 with SMTP id u138mr12634519lja.20.1469703502836;
	Thu, 28 Jul 2016 03:58:22 -0700 (PDT)
Received: from skeletor.greyskull (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by smtp.gmail.com with ESMTPSA id
	k63sm1841622lfe.48.2016.07.28.03.58.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jul 2016 03:58:22 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 12:56:06 +0200
Message-Id: <1469703366-3019-1-git-send-email-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bitbake.conf/toolchain-scripts.bbclass: Remove debug prefix mappings in SDK
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
X-List-Received-Date: Thu, 28 Jul 2016 10:58:25 -0000

CFLAGS/CXXFLAGS in the SDK environment script adds debug-prefix mappings
that include staging area/work directories. Remove them since the SDK
shouldn't be aware of them.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/toolchain-scripts.bbclass | 3 +++
 meta/conf/bitbake.conf                 | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 32d8c32..57874f3 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -6,6 +6,9 @@ REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
 TARGET_CC_ARCH_append_libc-uclibc = " -muclibc"
 TARGET_CC_ARCH_append_libc-musl = " -mmusl"
 
+# default debug prefix map isn't valid in the SDK
+DEBUG_PREFIX_MAP = ""
+
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script.  Remember that $SDKTARGETSYSROOT should
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af3b181..900d2fe 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -549,11 +549,11 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 # Optimization flags.
 ##################################################################
-DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
-                -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-                -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
-                -fdebug-prefix-map=${STAGING_DIR_HOST}= \
+DEBUG_PREFIX_MAP ?= "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
 "
+DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
-- 
2.7.4


