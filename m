Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D18D178316
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:49:06 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 07:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="129748651"
Received: from rpieper-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.39.83])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2017 07:48:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:48:12 +0200
Message-Id: <2ef340f8455cf236cb192243e48e92808cf19512.1500561823.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500561823.git.paul.eggleton@linux.intel.com>
References: <cover.1500561823.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 6/7] classes/base: set do_unpack dependencies for rpm files
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
X-List-Received-Date: Thu, 20 Jul 2017 14:49:07 -0000

If we're unpacking any rpm (not just .src.rpm) then we'll need to call
rpm2cpio.sh. As of OE-Core rev a7da1aade118d1ccf1b286f82556cd9f706bd2a4
that script no longer uses file-native, but there is a chance that the
rpm file will be compressed internally using xz (for example, rpms from
Fedora) and therefore the script will need xzcat provided xz-native.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 27a28b8..9c40e01 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -632,8 +632,8 @@ python () {
             d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
 
         # file is needed by rpm2cpio.sh
-        elif path.endswith('.src.rpm'):
-            d.appendVarFlag('do_unpack', 'depends', ' file-native:do_populate_sysroot')
+        elif path.endswith('.rpm'):
+            d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
     if needsrcrev:
         d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
-- 
2.9.4


