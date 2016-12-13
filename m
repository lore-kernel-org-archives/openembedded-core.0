Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C476971E16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 17:05:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 13 Dec 2016 09:06:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="1098625957"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2016 09:06:01 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8F12A6A4006;
	Tue, 13 Dec 2016 09:05:13 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 19:05:49 +0200
Message-Id: <1481648749-25726-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAJTo0LaODS73GuCL0z9Sz49EnQ5GiZF6FdJ+KHOUiCdfEhZJfQ@mail.gmail.com>
References: <CAJTo0LaODS73GuCL0z9Sz49EnQ5GiZF6FdJ+KHOUiCdfEhZJfQ@mail.gmail.com>
Subject: [PATCH] populate_sdk_ext: get NATIVELSBSTRING variable
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
X-List-Received-Date: Tue, 13 Dec 2016 17:06:04 -0000

Setting fixedlsbstring to 'universal' can break populate_sdk_ext
task as NATIVELSBSTRING can be set to universal-<gcc version> in
some cases.

Getting NATIVELSBSTRING value using getVar should fix this.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3c3a73c..6ef48c0 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -374,8 +374,8 @@ python copy_buildsystem () {
 
     sstate_out = baseoutpath + '/sstate-cache'
     bb.utils.remove(sstate_out, True)
-    # uninative.bbclass sets NATIVELSBSTRING to 'universal'
-    fixedlsbstring = 'universal'
+
+    fixedlsbstring = d.getVar('NATIVELSBSTRING', True)
 
     sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1')
     sdk_ext_type = d.getVar('SDK_EXT_TYPE', True)
-- 
2.1.4


