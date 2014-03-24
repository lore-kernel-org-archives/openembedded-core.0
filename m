Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD236BBDC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:20:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Mar 2014 08:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,721,1389772800"; d="scan'208";a="506414721"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.64])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2014 08:18:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2014 15:18:51 +0000
Message-Id: <0175877e4e58d7d7e82c38c1a798aa352e19ef32.1395674266.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395674266.git.paul.eggleton@linux.intel.com>
References: <cover.1395674266.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395674266.git.paul.eggleton@linux.intel.com>
References: <cover.1395674266.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/staging: ensure do_populate_sysroot re-execs on changes to sysroot preprocessing funcs
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
X-List-Received-Date: Mon, 24 Mar 2014 15:20:15 -0000

Without this dependency, changes to functions added to
SYSROOT_PREPROCESS_FUNCS do not change do_populate_sysroot's signature
and thus don't cause it to re-execute.

Fixes [YOCTO #5852].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/staging.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index d17a53e..644b9a8 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -95,6 +95,8 @@ python do_populate_sysroot () {
         bb.build.exec_func(f, d)
 }
 
+do_populate_sysroot[vardeps] += "${SYSROOT_PREPROCESS_FUNCS}"
+
 SSTATETASKS += "do_populate_sysroot"
 do_populate_sysroot[cleandirs] = "${SYSROOT_DESTDIR}"
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}"
-- 
1.8.5.3


