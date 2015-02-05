Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 39B8E6E60D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 12:05:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2015 04:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,523,1418112000"; d="scan'208";a="647734040"
Received: from mhgreen-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.49])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2015 04:05:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 12:05:40 +0000
Message-Id: <597274808b6739886161ffd6a20d5f98ea65dcd3.1423131107.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423131107.git.paul.eggleton@linux.intel.com>
References: <cover.1423131107.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423131107.git.paul.eggleton@linux.intel.com>
References: <cover.1423131107.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/sanity: avoid bblayers version issue when switching between poky and other DISTRO values
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
X-List-Received-Date: Thu, 05 Feb 2015 12:05:57 -0000

If you create a build directory with poky, or set DISTRO to "poky" and
run bitbake, you'll get a bblayers.conf file with LCONF_VERSION set to
6. If you then set DISTRO to any other value where the new distro config
doesn't pull in poky's config, e.g. "nodistro", you would then get a
bblayers.conf version error which didn't immediately make sense. (The
layer versions have been out-of-step ever since meta-yocto-bsp was
split out of meta-yocto several years ago).

This is just painful and we'd rather users didn't have to deal with
it. Obviously it isn't an OE-Core problem per se, but a simple way to
resolve it for everyone is to bump OE-Core's version to 6 with an
automatic no-op upgrade. Also ensure that multiple upgrade functions
(such as the poky one) have a chance to execute by not breaking out of
the loop as we were before.

Fixes [YOCTO #6139].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass | 7 ++++++-
 meta/conf/sanity.conf       | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2f75558..31b99d4 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -70,6 +70,12 @@ python oecore_update_bblayers() {
         sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
         return
 
+    elif current_lconf == 5 and lconf_version > 5:
+        # Null update, to avoid issues with people switching between poky and other distros
+        current_lconf = 6
+        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', current_lconf)
+        return
+
     sys.exit()
 }
 
@@ -470,7 +476,6 @@ def sanity_check_conffiles(status, d):
             if success:
                 bb.note("Your conf/bblayers.conf has been automatically updated.")
                 status.reparse = True
-                break
         if not status.reparse:
             status.addresult("Your version of bblayers.conf has the wrong LCONF_VERSION (has %s, expecting %s).\nPlease compare the your file against bblayers.conf.sample and merge any changes before continuing.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n" % (current_lconf, lconf_version))
 
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 1d55fa7..669b8ba 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -9,7 +9,7 @@ SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
 SANITY_VERSION ?= "1"
 LOCALCONF_VERSION  ?= "1"
-LAYER_CONF_VERSION ?= "5"
+LAYER_CONF_VERSION ?= "6"
 SITE_CONF_VERSION  ?= "1"
 
 INHERIT += "sanity"
-- 
1.9.3


