Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZ3d4-0004Ql-8Y
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 19:21:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2012 10:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157958449"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.22])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2012 10:10:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 18:10:50 +0100
Message-Id: <cdd82734f677e36564fb5409e27dff13cf9d1f56.1338224754.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1338224754.git.paul.eggleton@linux.intel.com>
References: <cover.1338224754.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1338224754.git.paul.eggleton@linux.intel.com>
References: <cover.1338224754.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/sanity: send sanity check failure as a separate event for Hob
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2012 17:21:14 -0000

In order to show a friendlier error message within Hob that does not
bury the actual sanity error in our typical preamble about disabling
sanity checks, use a separate event to indicate that sanity checks
failed.

This change is intended to work together with the related change to
BitBake, however it has a check to ensure that it does not fail with
older versions that do not include that change.

Fixes [YOCTO #2336].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |   16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a2b45bc..8a09b6d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -4,7 +4,16 @@
 
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo svn bzip2 tar gzip gawk chrpath wget cpio"
 
-def raise_sanity_error(msg):
+def raise_sanity_error(msg, d):
+    if d.getVar("SANITY_USE_EVENTS", True) == "1":
+        # FIXME: handle when BitBake version is too old to support bb.event.SanityCheckFailed
+        # We can just fire the event directly once the minimum version is bumped beyond 1.15.1
+        try:
+            bb.event.fire(bb.event.SanityCheckFailed(msg), d)
+            return
+        except AttributeError:
+            pass
+
     bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
     Following is the list of potential problems / advisories:
@@ -298,7 +307,7 @@ def check_sanity(sanity_data):
         return
 
     if 0 == os.getuid():
-        raise_sanity_error("Do not use Bitbake as root.")
+        raise_sanity_error("Do not use Bitbake as root.", sanity_data)
 
     messages = ""
 
@@ -532,7 +541,7 @@ def check_sanity(sanity_data):
         messages = messages + "Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space."
 
     if messages != "":
-        raise_sanity_error(messages)
+        raise_sanity_error(messages, sanity_data)
 
 # Create a copy of the datastore and finalise it to ensure appends and 
 # overrides are set - the datastore has yet to be finalised at ConfigParsed
@@ -548,6 +557,7 @@ python check_sanity_eventhandler() {
         check_sanity(sanity_data)
     elif bb.event.getName(e) == "SanityCheck":
         sanity_data = copy_data(e)
+        sanity_data.setVar("SANITY_USE_EVENTS", "1")
         check_sanity(sanity_data)
         bb.event.fire(bb.event.SanityCheckPassed(), e.data)
 
-- 
1.7.9.5



