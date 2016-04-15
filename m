Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B23F9602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 02:28:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 14 Apr 2016 19:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,485,1455004800"; d="scan'208";a="959099825"
Received: from shermanc-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.244])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2016 19:28:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Date: Fri, 15 Apr 2016 14:28:40 +1200
Message-ID: <1584006.oVQdNUNaQD@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.6-301.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <1460657741-27556-1-git-send-email-stephano.cetola@linux.intel.com>
References: <1460657741-27556-1-git-send-email-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: sdk-update: reset git metadata on update
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
X-List-Received-Date: Fri, 15 Apr 2016 02:28:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Stephano,

A few review comments below.

On Thu, 14 Apr 2016 11:15:41 Stephano Cetola wrote:
> Forgot to add in the .gitignore. It's in there now.

For future patches if you could mark them as "[PATCH v2]", "[PATCH v3]" etc 
that would be great. Additionally the commit message should be standalone - 
imagine you were reading it via "git log" in a year's time, things like the 
above don't really belong. If you do need to comment on the changes between 
versions then use a cover letter or alternatively edit the patch before 
sending and put the comments after the --- line.
 
> Replace git pull with fetch and reset. 

You ought to say why we're doing this here (i.e. to avoid the merge logic in 
the event that the layers repo in the published SDK we're updating to isn't 
fast-forward merge from the local repo).

> Also add gitignore and committer
> info during publish to avoid errors on update.
>
> [ YOCTO #9368 ]
> 
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  scripts/lib/devtool/sdk.py | 11 +++++++++--
>  scripts/oe-publish-sdk     |  4 ++--
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
> index b1905f9..d666341 100644
> --- a/scripts/lib/devtool/sdk.py
> +++ b/scripts/lib/devtool/sdk.py
> @@ -17,6 +17,7 @@
> 
>  import os
>  import subprocess
> +from subprocess import check_output

We're already importing the entire subprocess module on the line above so you 
don't need this, just change the code to call subprocess.check_output() 
instead of just check_output().

>  import logging
>  import glob
>  import shutil
> @@ -186,9 +187,15 @@ def sdk_update(args, config, basepath, workspace):
>                  return 0
>              # Update metadata
>              logger.debug("Updating metadata via git ...")
> -            # Try using 'git pull', if failed, use 'git clone'
> +            #Check for the status before doing a fetch and reset
>              if os.path.exists(os.path.join(basepath, 'layers/.git')):
> -                ret = subprocess.call("git pull %s/layers/.git" %
> updateserver, shell=True, cwd=layers_dir) +                out =
> check_output("git status --porcelain", shell=True, cwd=layers_dir) +       
>         if not out:
> +                  ret = subprocess.call("git fetch --all; git reset
> --hard", shell=True, cwd=layers_dir) +                else:
> +                  logger.error("Failed to update metadata as there have
> been changes made to it. Aborting."); +                 
> logger.error("Changed files:\n%s" % out);
> +                  return -1

Please use four spaces for indentation in python code like this.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

