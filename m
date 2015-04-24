Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A39E16E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 08:38:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 24 Apr 2015 01:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,638,1422950400"; d="scan'208";a="485056615"
Received: from unknown (HELO [10.252.9.220]) ([10.252.9.220])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2015 01:38:48 -0700
User-Agent: Microsoft-MacOutlook/14.4.9.150325
Date: Fri, 24 Apr 2015 11:38:45 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <D15FDB62.4EB39%markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 4/8] devtool: extract: remove patches when
	S=WORKDIR
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
	<c1dd117694b4df1c77bac677d00dba392f3f7487.1429805738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <c1dd117694b4df1c77bac677d00dba392f3f7487.1429805738.git.paul.eggleton@linux.intel.com>
Mime-version: 1.0
Subject: Re: [PATCH 4/8] devtool: extract: remove patches when S=WORKDIR
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
X-List-Received-Date: Fri, 24 Apr 2015 08:38:51 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

Hi,

On 23/04/15 19:18, "Paul Eggleton" <paul.eggleton@linux.intel.com> wrote:

>From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>
>All local files from the layer, including patches, are added to to
>srctree repository when S==WORKDIR. The patch files are useless as they
>are automatically applied on top of the srctree by devtool.
>
>This change causes devtool extract to not commit these unnecessary (and
>possibly confusing) patch file(s) into srctree repository.
>
>[YOCTO #7602]
>
>Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>---
> scripts/lib/devtool/standard.py | 20 ++++++++++++++++++++
> 1 file changed, 20 insertions(+)
>
>diff --git a/scripts/lib/devtool/standard.py
>b/scripts/lib/devtool/standard.py
>index aa30a98..926ec6c 100644
>--- a/scripts/lib/devtool/standard.py
>+++ b/scripts/lib/devtool/standard.py
>@@ -153,6 +153,7 @@ def extract(args, config, basepath, workspace):
> 
> def _extract_source(srctree, keep_temp, devbranch, d):
>     import bb.event
>+    import oe.recipeutils
> 
>     def eventfilter(name, handler, event, d):
>         if name == 'base_eventhandler':
>@@ -240,6 +241,13 @@ def _extract_source(srctree, keep_temp, devbranch,
>d):
>             else:
>                 os.rmdir(patchdir)
> 
>+        # Find local patches that were "unpacked" to srctree directory
>+        recipe_patches = [os.path.basename(patch) for patch in
>+                oe.recipeutils.get_recipe_patches(crd)]
>+        patches = [fname for fname in os.listdir(workdir) if fname in
>+                   recipe_patches]
>+
>+        # Set-up srctree repo
>         if bb.data.inherits_class('kernel-yocto', d):
>             (stdout, _) = bb.process.run('git --git-dir="%s" rev-parse
>HEAD' % crd.expand('${WORKDIR}/git'), cwd=srcsubdir)
>             initial_rev = stdout.rstrip()
>@@ -251,6 +259,10 @@ def _extract_source(srctree, keep_temp, devbranch,
>d):
>             if not os.path.exists(os.path.join(srcsubdir, '.git')):
>                 bb.process.run('git init', cwd=srcsubdir)
>                 bb.process.run('git add .', cwd=srcsubdir)
>+                # Do not commit patches (would happend if S=WORKDIR)
>+                if patches and srcsubdir == workdir:
>+                    bb.process.run('git reset -- %s' % " ".join(patches),
>+                                    cwd=srcsubdir)
>                 bb.process.run('git commit -q -m "Initial commit from
>upstream at version %s"' % crd.getVar('PV', True), cwd=srcsubdir)
> 
>             (stdout, _) = bb.process.run('git rev-parse HEAD',
>cwd=srcsubdir)
>@@ -266,6 +278,14 @@ def _extract_source(srctree, keep_temp, devbranch,
>d):
> 
>         bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
> 
>+        # Remove patches if S=WORKDIR so that stale patch files are not
>present
>+        # in the srtree
>+        if patches and srcsubdir == workdir:
>+            logger.info('Removing patch files...')
>+            for patch in patches:
>+                os.unlink(os.path.join(workdir, patch))
>+
>+
>         if os.path.exists(patchdir):
>             shutil.rmtree(patchdir)
>             if haspatches:


NACK! Please skip this patch for now. I just found out it doesn't work as
expected. I'll submit a new version when I've worked around the problems.

Thanks,
  Markus



