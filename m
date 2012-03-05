Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S4gq9-0008Ns-Op
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 23:57:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Mar 2012 14:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="73912220"
Received: from unknown (HELO helios.localnet) ([10.252.123.129])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Mar 2012 14:48:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Mar 2012 22:48:31 +0000
Message-ID: <2264127.4aVO04txSy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1330986694-28199-1-git-send-email-tworaz666@gmail.com>
References: <1330986694-28199-1-git-send-email-tworaz666@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] psplash: Add mising commands module import.
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
X-List-Received-Date: Mon, 05 Mar 2012 22:57:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 05 March 2012 23:31:34 Peter Tworek wrote:
> Python commands module is used in the recipe, but never imported.
> This leads to build errors like:
> 
> NameError: global name 'commands' is not defined
> 
> ERROR: The stack trace of python calls that resulted in this
> exception/failure was: ERROR:   File "do_compile", line 24, in <module>
> ERROR:
> ERROR:   File "do_compile", line 11, in do_compile
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0020:        bb.build.exec_func("oe_runmake", d)
> ERROR:      0021:        shutil.copyfile("psplash", outputfile)
> ERROR:      0022:
> ERROR:      0023:
> ERROR:  *** 0024:do_compile(d)
> ERROR:      0025:
> ERROR: (file: 'do_compile', lineno: 24, function: <module>)
> ERROR:      0007:    localfiles = d.getVar('SPLASH_LOCALPATHS',
> True).split() ERROR:      0008:    outputfiles = d.getVar('SPLASH_INSTALL',
> True).split() ERROR:      0009:    for localfile, outputfile in
> zip(localfiles, outputfiles): ERROR:      0010:        if
> localfile.endswith(".png"):
> ERROR:  *** 0011:            outp =
> commands.getstatusoutput('./make-image-header.sh %s POKY' % localfile)
> ERROR:      0012:            print(outp[1])
> ERROR:      0013:            fbase =
> os.path.splitext(os.path.basename(localfile))[0] ERROR:      0014:         
>   shutil.copyfile("%s-img.h" % fbase, destfile) ERROR:      0015:       
> else:
> 
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
>  meta/recipes-core/psplash/psplash_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/psplash/psplash_git.bb
> b/meta/recipes-core/psplash/psplash_git.bb index 42ea615..bd405f9 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -68,7 +68,7 @@ S = "${WORKDIR}/git"
>  inherit autotools pkgconfig update-rc.d
> 
>  python do_compile () {
> -    import shutil
> +    import shutil, commands
> 
>      # Build a separate executable for each splash image
>      destfile = "%s/psplash-poky-img.h" % d.getVar('S', True)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre


