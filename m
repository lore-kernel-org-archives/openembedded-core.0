Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF05B6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 11:09:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 19 Apr 2016 04:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,506,1455004800"; d="scan'208";a="87888900"
Received: from sadnan1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.36])
	by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2016 04:09:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 23:09:11 +1200
Message-Id: <12bb712eeb10c09a0c540477f7966b4ab15001e0.1461063424.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1461063424.git.paul.eggleton@linux.intel.com>
References: <cover.1461063424.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1461063424.git.paul.eggleton@linux.intel.com>
References: <cover.1461063424.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] devtool: sdk-update: fix handling of UNINATIVE_CHECKSUM changes
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
X-List-Received-Date: Tue, 19 Apr 2016 11:09:48 -0000

If UNINATIVE_CHECKSUM changes over an SDK update, bitbake within the
extensible SDK will be broken because it will see that the matching
uninative tarball doesn't exist and if there is a default value of
UNINATIVE_URL it will attempt to download the file and will then fail
because the checksums don't match up; alternatively if no UNINATIVE_URL
is set then it'll also fail with an error about misconfiguration. To fix
this, add some logic to devtool sdk-update to download the matching
uninative tarball(s) for the checksum(s) in the newly fetched SDK
configuration.

Fixes [YOCTO #9301].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index a22841d..46fd12b 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -23,6 +23,7 @@ import shutil
 import errno
 import sys
 import tempfile
+import re
 from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
@@ -209,6 +210,28 @@ def sdk_update(args, config, basepath, workspace):
                     logger.error("Updating %s failed" % changedfile)
                     return ret
 
+            # Check if UNINATIVE_CHECKSUM changed
+            uninative = False
+            if 'conf/local.conf' in changedfiles:
+                def read_uninative_checksums(fn):
+                    chksumitems = []
+                    with open(fn, 'r') as f:
+                        for line in f:
+                            if line.startswith('UNINATIVE_CHECKSUM'):
+                                splitline = re.split(r'[\[\]"\']', line)
+                                if len(splitline) > 3:
+                                    chksumitems.append((splitline[1], splitline[3]))
+                    return chksumitems
+
+                oldsums = read_uninative_checksums(os.path.join(basepath, 'conf/local.conf'))
+                newsums = read_uninative_checksums(os.path.join(tmpsdk_dir, 'conf/local.conf'))
+                if oldsums != newsums:
+                    uninative = True
+                    for buildarch, chksum in newsums:
+                        uninative_file = os.path.join('downloads', 'uninative', chksum, '%s-nativesdk-libc.tar.bz2' % buildarch)
+                        mkdir(os.path.join(tmpsdk_dir, os.path.dirname(uninative_file)))
+                        ret = subprocess.call("wget -q -O %s %s/%s" % (uninative_file, updateserver, uninative_file), shell=True, cwd=tmpsdk_dir)
+
             # Ok, all is well at this point - move everything over
             tmplayers_dir = os.path.join(tmpsdk_dir, 'layers')
             if os.path.exists(tmplayers_dir):
@@ -220,6 +243,9 @@ def sdk_update(args, config, basepath, workspace):
                 shutil.move(os.path.join(tmpsdk_dir, changedfile), destfile)
             os.remove(os.path.join(conf_dir, 'sdk-conf-manifest'))
             shutil.move(tmpmanifest, conf_dir)
+            if uninative:
+                shutil.rmtree(os.path.join(basepath, 'downloads', 'uninative'))
+                shutil.move(os.path.join(tmpsdk_dir, 'downloads', 'uninative'), os.path.join(basepath, 'downloads'))
 
             if not sstate_mirrors:
                 with open(os.path.join(conf_dir, 'site.conf'), 'a') as f:
-- 
2.5.5


