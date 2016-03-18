Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DAB976FEF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 08:23:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 Mar 2016 01:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,354,1455004800"; d="scan'208";a="926856229"
Received: from jblondin-mobl1.ger.corp.intel.com (HELO [10.252.21.216])
	([10.252.21.216])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2016 01:23:23 -0700
User-Agent: Microsoft-MacOutlook/0.0.0.160212
Date: Fri, 18 Mar 2016 10:23:22 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <0C3D50DF-A6F1-4192-B5A8-ACCDE93006F9@linux.intel.com>
Thread-Topic: [OE-core] [jethro][PATCH 1/2] devtool: extract: copy kernel
	config to srctree
References: <cover.1457988127.git.paul.eggleton@linux.intel.com>
	<9f1eb07236d23ea550e34f5c8791817d71245bff.1457988127.git.paul.eggleton@linux.intel.com>
In-Reply-To: <9f1eb07236d23ea550e34f5c8791817d71245bff.1457988127.git.paul.eggleton@linux.intel.com>
Mime-version: 1.0
Subject: Re: [jethro][PATCH 1/2] devtool: extract: copy kernel config to srctree
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
X-List-Received-Date: Fri, 18 Mar 2016 08:23:25 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi,



On 14/03/16 22:43, "Paul Eggleton" <openembedded-core-bounces@lists.openembedded.org on behalf of paul.eggleton@linux.intel.com> wrote:

>From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>
>This makes the correct kernel config to be used when building kernel
>from srctree (extrernalsrc). If no kernel config is present in the
>builddir 'do_configure' task copies .config from the srctree.
>
>(From OE-Core master rev: 3b516332e038a587685f6e0c14a7f04990bdd6cc)
>
>Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>Signed-off-by: Ross Burton <ross.burton@intel.com>
>Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>---
> scripts/lib/devtool/standard.py | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
>index 5464d7b..c1fbfe3 100644
>--- a/scripts/lib/devtool/standard.py
>+++ b/scripts/lib/devtool/standard.py
>@@ -430,11 +430,12 @@ def _extract_source(srctree, keep_temp, devbranch, d):
>             if haspatches:
>                 bb.process.run('git checkout patches', cwd=srcsubdir)
> 
>-        # Move oe-local-files directory to srctree
>-        if os.path.exists(os.path.join(tempdir, 'oe-local-files')):
>-            logger.info('Adding local source files to srctree...')
>-            shutil.move(os.path.join(tempdir, 'oe-local-files'), srcsubdir)
>-

Why are you "disabling" oe-local-files here? That's unrelated to the kernel config. A mistake in patch conflict resolving, perhaps(?)

Thanks,
  Markus



>+        if bb.data.inherits_class('kernel-yocto', d):
>+            # Store generate and store kernel config
>+            logger.info('Generating kernel config')
>+            task_executor.exec_func('do_configure', False)
>+            kconfig = os.path.join(d.getVar('B', True), '.config')
>+            shutil.copy2(kconfig, srcsubdir)
> 
>         shutil.move(srcsubdir, srctree)
>     finally:


