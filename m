Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EACE07570D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:58:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 30 Sep 2015 06:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="816340372"
Received: from mhanley-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.22.120])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2015 06:58:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Wed, 30 Sep 2015 14:58:47 +0100
Message-ID: <5874760.80fx6LnMAu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1443621113-4568-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1443621113-4568-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: update-recipe: enable var history tracking
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
X-List-Received-Date: Wed, 30 Sep 2015 13:58:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 30 September 2015 16:51:53 Markus Lehtonen wrote:
> Enable variable history tracking so that the variables are updated in
> the correct file - i.e. in the file they are already defined.
> 
> [YOCTO #7715]
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  scripts/lib/devtool/__init__.py | 4 ++--
>  scripts/lib/devtool/standard.py | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/devtool/__init__.py
> b/scripts/lib/devtool/__init__.py index 7b1ab11..844aa12 100644
> --- a/scripts/lib/devtool/__init__.py
> +++ b/scripts/lib/devtool/__init__.py
> @@ -96,7 +96,7 @@ def exec_fakeroot(d, cmd, **kwargs):
>              newenv[splitval[0]] = splitval[1]
>      return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv,
> **kwargs)
> 
> -def setup_tinfoil(config_only=False, basepath=None):
> +def setup_tinfoil(config_only=False, basepath=None, tracking=False):
>      """Initialize tinfoil api from bitbake"""
>      import scriptpath
>      orig_cwd = os.path.abspath(os.curdir)
> @@ -108,7 +108,7 @@ def setup_tinfoil(config_only=False, basepath=None):
>          sys.exit(1)
> 
>      import bb.tinfoil
> -    tinfoil = bb.tinfoil.Tinfoil()
> +    tinfoil = bb.tinfoil.Tinfoil(tracking=tracking)
>      tinfoil.prepare(config_only)
>      tinfoil.logger.setLevel(logger.getEffectiveLevel())
>      os.chdir(orig_cwd)
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index 1dcf7cd..686c9d9 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -797,7 +797,7 @@ def update_recipe(args, config, basepath, workspace):
>              raise DevtoolError('conf/layer.conf not found in bbappend '
>                                 'destination layer "%s"' % args.append)
> 
> -    tinfoil = setup_tinfoil(basepath=basepath)
> +    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
> 
>      rd = parse_recipe(config, tinfoil, args.recipename, True)
>      if not rd:


Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

