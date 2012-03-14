Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S7phl-00024o-31
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:01:33 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2012 07:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128914009"
Received: from unknown (HELO envy.home) ([10.255.15.199])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2012 07:52:46 -0700
Message-ID: <4F60B091.9010005@linux.intel.com>
Date: Wed, 14 Mar 2012 07:52:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.3.5
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Wed, 14 Mar 2012 15:01:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/13/2012 05:36 PM, Paul Eggleton wrote:
> If the user is in any directory other than $BUILDDIR when the bitbake
> wrapper script is run, then show an error an exit.
> 
> Fixes [YOCTO #2071].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/bitbake |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/bitbake b/scripts/bitbake
> index dda3b26..45c8697 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -47,6 +47,11 @@ float_test() {
>  # but earlier versions do not
>  float_test "$TARVERSION > 1.23" && needtar="0"
>  
> +if [ "`pwd`" != "$BUILDDIR" ] ; then
> +    echo "BitBake must be run from your build directory: $BUILDDIR"
> +    exit 1

Should this have some kind of prefix? "ERROR: " or something along those
lines for consistency with other output?

Otherwise, YAY! I've tripped over this frequently and keep doing the cd
dance after a short "What the heck" session. Such a simple fix to -
Thanks Paul!

> +fi
> +
>  buildpseudo="1"
>  if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
>      PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


