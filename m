Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0529A6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 03:19:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Dec 2015 19:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="866907967"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2015 19:19:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:19:18 +1300
Message-Id: <0a6bdaccedb76fd3c9bc5987fb36dbad3c69bdf8.1450754300.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] devtool: sdk-update: fix traceback without update server set
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
X-List-Received-Date: Tue, 22 Dec 2015 03:19:52 -0000

If the SDK update server hasn't been set in the config (when building
the extensible SDK this would be set via SDK_UPDATE_URL) and it wasn't
specified on the command line then we were failing with a traceback
because we didn't pass the default value properly - None is interpreted
as no default, meaning raise an exception if no such option exists.

Additionally we don't need the try...except anymore either because with
a proper default value, NoSectionError is caught as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 85c0fb1..f08f0ee 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -81,13 +81,9 @@ def install_sstate_objects(sstate_objects, src_sdk, dest_sdk):
 
 def sdk_update(args, config, basepath, workspace):
     # Fetch locked-sigs.inc file from remote/local destination
-    from ConfigParser import NoSectionError
     updateserver = args.updateserver
     if not updateserver:
-        try:
-            updateserver = config.get('SDK', 'updateserver', None)
-        except NoSectionError:
-            pass
+        updateserver = config.get('SDK', 'updateserver', '')
     if not updateserver:
         raise DevtoolError("Update server not specified in config file, you must specify it on the command line")
     logger.debug("updateserver: %s" % args.updateserver)
-- 
2.5.0


