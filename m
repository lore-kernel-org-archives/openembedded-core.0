Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4E18F6B91B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:38:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 08:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,942,1367996400"; d="scan'208";a="285887254"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.235])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 08:38:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
Date: Fri, 23 Aug 2013 16:38:02 +0100
Message-ID: <3198150.4aauEBHVOu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <b58ed117ebd7a8b543fb843c2f67e014e4b521ad.1377269486.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
	<b58ed117ebd7a8b543fb843c2f67e014e4b521ad.1377269486.git.stefanx.stanacar@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 17/21] oeqa/utils/targetbuild: change download to use bitbake's fetcher
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
X-List-Received-Date: Fri, 23 Aug 2013 15:38:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Stefan,

On Friday 23 August 2013 18:30:57 Stefan Stanacar wrote:
> Use bb.fetcher2 instead of running our own wget command
> (helps with proxy too). Also no need to use the class attribute target,
> use self.target, as the tests pass that to the class.
> Also, we shouldn't clean the archive, now that it gets to DL_DIR.
> 
> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
> ---
>  meta/lib/oeqa/utils/targetbuild.py | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/meta/lib/oeqa/utils/targetbuild.py
> b/meta/lib/oeqa/utils/targetbuild.py index 7555add..9b2cf53 100644
> --- a/meta/lib/oeqa/utils/targetbuild.py
> +++ b/meta/lib/oeqa/utils/targetbuild.py
> @@ -5,8 +5,8 @@
>  # Provides a class for automating build tests for projects
> 
>  from oeqa.oetest import oeRuntimeTest
> -from oeqa.utils.decorators import *
> -import bb.process
> +import bb.fetch2
> +import bb.data
>  import os
>  import re
> 
> @@ -18,6 +18,9 @@ class TargetBuildProject():
>          self.uri = uri
>          self.targetdir = "/home/root/"
> 
> +        self.localdata = bb.data.createCopy(oeRuntimeTest.tc.d)
> +        bb.data.update_data(self.localdata)
> +
>          if not foldername:
>              self.archive = os.path.basename(uri)
>              self.fname = re.sub(r'.tar.bz2|tar.gz$', '', self.archive)
> @@ -25,22 +28,20 @@ class TargetBuildProject():
>              self.fname = foldername
> 
>      def download_archive(self):
> -        wgetcmd = oeRuntimeTest.tc.d.getVar('FETCHCMD_wget', True).split()
> -        self.testdir = oeRuntimeTest.tc.d.getVar('TEST_LOG_DIR', True)
> 
>          try:
> -            output = bb.process.run(wgetcmd + ['-P', self.testdir,
> self.uri])[0] -        except bb.process.CmdError:
> -            raise Exception("Failed to download archive, output: %s" %
> output) -
> -        (status, output) = oeRuntimeTest.tc.target.copy_to(
> -            os.path.join(self.testdir, self.archive),
> -            self.targetdir)
> +            self.localdata.delVar("BB_STRICT_CHECKSUM")
> +            fetcher = bb.fetch2.Fetch([self.uri], self.localdata)
> +            fetcher.download()
> +            self.localarchive = fetcher.localpath(self.uri)
> +        except bb.fetch2.BBFetchException:
> +            raise Exception("Failed to download archive: %s" % self.uri)
> +
> +        (status, output) = self.target.copy_to(self.localarchive,
> self.targetdir) if status != 0:
>              raise Exception("Failed to copy archive to target, output: %s"
> % output)
> 
> -        (status, output) = oeRuntimeTest.tc.target.run(
> -            'tar xf %s%s -C %s' % (self.targetdir, self.archive,
> self.targetdir)) +        (status, output) = self.target.run('tar xf %s%s
> -C %s' % (self.targetdir, self.archive, self.targetdir)) if status != 0:
>              raise Exception("Failed to extract archive, output: %s" %
> output)
> 
> @@ -59,8 +60,4 @@ class TargetBuildProject():
>          return self.target.run('cd %s; make install' % self.targetdir,
> 0)[0]
> 
>      def clean(self):
> -        self.target.run('rm -r %s*' % self.targetdir)
> -        try:
> -            bb.process.run(['rm', '-rf', os.path.join(self.testdir,
> self.archive)]) -        except bb.process.CmdError:
> -            bb.note("Failed to remove archive")
> +        self.target.run('rm -rf %s' % self.targetdir)

Could you please squash this into the commit that adds this module?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

