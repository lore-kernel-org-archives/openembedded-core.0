Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 32F287F3D5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 19:46:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2019 12:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="174608527"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
	by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2019 12:46:41 -0700
Date: Wed, 7 Aug 2019 12:45:58 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190807194558.GA4273@ranerica-svr.sc.intel.com>
References: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<20190807020207.2331.54874@do>
MIME-Version: 1.0
In-Reply-To: <20190807020207.2331.54874@do>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Paul bluelightning Eggleton <paul.eggleton@linux.intel.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG92bWY6IEJ1bXAgdG8gZWRrMi1zdGFibGUyMDE5MDUgYW5kIGFkZCBpbXByb3ZlbWVudHM=?=
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
X-List-Received-Date: Wed, 07 Aug 2019 19:46:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2019 at 02:02:07AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: ovmf: Bump to edk2-stable201905 and add improvements
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/19138/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at f03ab9b21c)

It looks like patchtest thinks the patchset does not apply because of
the line endings EDK2 uses. If patchest used git am --keep-cr the
patches would apply cleanly.

Also the Patch class in lib/patchestpatch.py in the patch test repo
reads the patch using f.read() with the newline parameter implicitly set
to None and this causes newlines to be translated from \r\n into \n.
Hence, when applying the patch with git am it fails; even when using
--keep-cr.

I was able to pass the patchtest tests with this change:

diff --git a/lib/patchtestpatch.py b/lib/patchtestpatch.py
index e05d22f..4583b5c 100644
--- a/lib/patchtestpatch.py
+++ b/lib/patchtestpatch.py
@@ -47,7 +47,7 @@ class Patch(object):
         if self._forcereload or (not self._contents):
             logger.debug('Reading %s contents' % self._path)
             try:
-                with open(self._path) as _f:
+                with open(self._path, newline='') as _f:
                     self._contents = _f.read()
             except IOError:
                 logger.warn("Reading the mbox %s failed" % self.resource)
diff --git a/lib/patchtestrepo.py b/lib/patchtestrepo.py
index edc17d4..3c38b9c 100644
--- a/lib/patchtestrepo.py
+++ b/lib/patchtestrepo.py
@@ -71,7 +71,7 @@ class Repo(object):
         # Check if patch can be merged using git-am
         self._patchcanbemerged = True
         try:
-            self._exec({'cmd': ['git', 'am'], 'input': self._patch.contents})
+            self._exec({'cmd': ['git', 'am', '--keep-cr'], 'input': self._patch.contents})
         except utils.CmdException as ce:
             self._exec({'cmd': ['git', 'am', '--abort']})
             self._patchcanbemerged = False
@@ -174,7 +174,7 @@ class Repo(object):

     def merge(self):
         if self._patchcanbemerged:
-            self._exec({'cmd': ['git', 'am'],
+            self._exec({'cmd': ['git', 'am', '--keep-cr'],
                         'input': self._patch.contents,
                         'updateenv': {'PTRESOURCE':self._patch.path}})
             self._patchmerged = True
diff --git a/scripts/test-mboxes b/scripts/test-mboxes
index 9137ba4..1d0c6f7 100755
--- a/scripts/test-mboxes
+++ b/scripts/test-mboxes
@@ -116,13 +116,13 @@ function testpatch() {
 	    # try patch merge
 	    if git apply --check $patch 2> /dev/null; then
 		if [ -n "$mergeall" ]; then
-		    git am --quiet $patch 2>/dev/null && gitnotes
+		    git am --quiet --keep-cr $patch 2>/dev/null && gitnotes
 		    echo -e "\tPatch merged into '${assemblebranch}' including all test results"
 		else
-		    if [ "$(echo "$PTRESULTS" | any-fail)" == "yes"]; then
+		    if [ "$(echo "$PTRESULTS" | any-fail)" == "yes" ]; then
 			echo -e "\tPatch has test failures, skipping"
 		    else
-			git am --quiet $patch 2>/dev/null && gitnotes
+			git am --quiet --keep-cr $patch 2>/dev/null && gitnotes
 			echo -e "\tPatch merged into '${assemblebranch}' with no test failures"
 		    fi
 		fi


Thanks and BR,
Ricardo
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 

