Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1518965CB6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 09:53:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 05 Jan 2017 01:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="919180959"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 05 Jan 2017 01:53:21 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id AD2A16A4006;
	Thu,  5 Jan 2017 01:52:26 -0800 (PST)
Date: Thu, 5 Jan 2017 11:40:09 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170105094009.GA30427@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1483573733-10014-1-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1483573733-10014-1-git-send-email-richard.purdie@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-selftest: Improve BUILDDIR environment handling
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
X-List-Received-Date: Thu, 05 Jan 2017 09:53:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2017 at 11:48:53PM +0000, Richard Purdie wrote:
> Its possible something (like bitbake/tinfoil2) may mess around with the
> environment and using the enviroment as a global variable store isn't
> particularly nice anyway.
> 
> This patch changes the BUILDDIR usages so that the environment isn't used
> as a global store and a global variable is used instead. Whilst that
> is still not perfect, it does avoid the current double and triple backtraces
> we're seeing where tinfoil2/bitbake has trampled the enviroment leading
> to failures of failures making debugging even harder.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/oe-selftest | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/oe-selftest b/scripts/oe-selftest
> index bfcea66..e166521 100755
> --- a/scripts/oe-selftest
> +++ b/scripts/oe-selftest
> @@ -111,9 +111,13 @@ def get_args_parser():
>                          help='Submit test results to a repository')
>      return parser
>  
> +builddir = None
> +
>  
>  def preflight_check():
>  
> +    global builddir
> +
>      log.info("Checking that everything is in order before running the tests")
>  
>      if not os.environ.get("BUILDDIR"):
> @@ -135,7 +139,7 @@ def preflight_check():
>      return True
>  
>  def add_include():
> -    builddir = os.environ.get("BUILDDIR")
> +    global builddir
You don't need to use 'global' here. It's only mandatory if
you change variable value:
https://docs.python.org/3/reference/simple_stmts.html#the-global-statement

Would it be more readable to use name in upper case: BUILDDIR?

>      if "#include added by oe-selftest.py" \
>          not in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
>              log.info("Adding: \"include selftest.inc\" in local.conf")
> @@ -149,7 +153,7 @@ def add_include():
>                      "\n#include added by oe-selftest.py\ninclude bblayers.inc")
>  
>  def remove_include():
> -    builddir = os.environ.get("BUILDDIR")
> +    global builddir
>      if builddir is None:
>          return
>      if "#include added by oe-selftest.py" \
> @@ -165,18 +169,21 @@ def remove_include():
>                      "\n#include added by oe-selftest.py\ninclude bblayers.inc")
>  
>  def remove_inc_files():
> +    global builddir
> +    if builddir is None:
> +        return
>      try:
> -        os.remove(os.path.join(os.environ.get("BUILDDIR"), "conf/selftest.inc"))
> +        os.remove(os.path.join(builddir, "conf/selftest.inc"))
>          for root, _, files in os.walk(get_test_layer()):
>              for f in files:
>                  if f == 'test_recipe.inc':
>                      os.remove(os.path.join(root, f))
> -    except (AttributeError, OSError,) as e:    # AttributeError may happen if BUILDDIR is not set
> +    except OSError as e:
>          pass
>  
>      for incl_file in ['conf/bblayers.inc', 'conf/machine.inc']:
>          try:
> -            os.remove(os.path.join(os.environ.get("BUILDDIR"), incl_file))
> +            os.remove(os.path.join(builddir, incl_file))
>          except:
>              pass
>  
> @@ -394,7 +401,7 @@ def coverage_setup(coverage_source, coverage_include, coverage_omit):
>      """ Set up the coverage measurement for the testcases to be run """
>      import datetime
>      import subprocess
> -    builddir = os.environ.get("BUILDDIR")
> +    global builddir
>      pokydir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
>      curcommit= subprocess.check_output(["git", "--git-dir", os.path.join(pokydir, ".git"), "rev-parse", "HEAD"]).decode('utf-8')
>      coveragerc = "%s/.coveragerc" % builddir
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

