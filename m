Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE166F769
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 10:30:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Mar 2014 03:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,764,1389772800"; d="scan'208";a="483892562"
Received: from williams-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.67])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2014 03:30:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 11:29:36 +0100
Message-Id: <c43e9e4067c3dfcf8c25d8783f4e26e580dc3e13.1396261733.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396261733.git.paul.eggleton@linux.intel.com>
References: <cover.1396261733.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396261733.git.paul.eggleton@linux.intel.com>
References: <cover.1396261733.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/sanity: check if SDKMACHINE setting has taken effect
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
X-List-Received-Date: Mon, 31 Mar 2014 10:30:11 -0000

If you try to set SDKMACHINE in a distro configuration file, it won't
take effect because by the time that is parsed the line in bitbake.conf
which includes the appropriate conf file for SDKMACHINE has already been
parsed. Check that SDK_ARCH has changed from its default value and show
an error if it hasn't in order to catch this misconfiguration.

Fixes [YOCTO #5861].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cf514d0..69d6a24 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -667,6 +667,8 @@ def check_sanity_everybuild(status, d):
     if d.getVar('SDKMACHINE', True):
         if not check_conf_exists("conf/machine-sdk/${SDKMACHINE}.conf", d):
             status.addresult('Specified SDKMACHINE value is not valid\n')
+        elif d.getVar('SDK_ARCH', False) == "${BUILD_ARCH}":
+            status.addresult('SDKMACHINE is set, but SDK_ARCH has not been changed as a result - SDKMACHINE may have been set too late (e.g. in the distro configuration)\n')
 
     check_supported_distro(d)
 
-- 
1.9.0


