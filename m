Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6DB774F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:20:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2016 18:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="1102758831"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2016 18:20:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 15:19:58 +1300
Message-Id: <367afd4ed8b09d73dee981a214fb3ecdfc7e3ea1.1482373109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482373109.git.paul.eggleton@linux.intel.com>
References: <cover.1482373109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/sstate: handle filenames containing square brackets
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
X-List-Received-Date: Thu, 22 Dec 2016 02:20:14 -0000

If a recipe installs a file or directory whose name contains square
brackets [ ] that form a valid glob expression and that file then they
won't be correctly removed from the sysroot, because we pass each path
in the sstate manifest to our oe.path.remove() function which calls
glob.glob() on the path passed into it and the expression won't
actually match the original filename. Since we don't expect to put any
wildcarded expressions in the sstate manifests, and we already have a
try...except around this, we can actually use os.remove() here instead.

Similarly, when we pass existing file paths to "grep" looking through
the manifests, we don't want those paths to be treated as regexes - so
use grep's -F command line switch.

Fixes [YOCTO #10836].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a7cd9ec..755bf59 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -213,7 +213,7 @@ def sstate_install(ss, d):
                     break
             if realmatch:
                 match.append(f)
-                sstate_search_cmd = "grep -rl '%s' %s --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
+                sstate_search_cmd = "grep -rlF '%s' %s --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
                 search_output = subprocess.Popen(sstate_search_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0]
                 if search_output != "":
                     match.append("Matched in %s" % search_output.rstrip())
@@ -406,7 +406,7 @@ def sstate_clean_manifest(manifest, d):
                 elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
                     os.rmdir(entry[:-1])
             else:
-                oe.path.remove(entry)
+                os.remove(entry)
         except OSError:
             pass
 
-- 
2.5.5


