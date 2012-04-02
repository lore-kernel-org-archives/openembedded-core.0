Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SEnZa-0001ql-Fd
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 22:09:54 +0200
Received: by pbcum15 with SMTP id um15so4005438pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fa5dcTMxA2xzvv+EEJVqbiE99VGX2ZuejEL5RUOOzFQ=;
	b=yHyNvUlu3jX3juYYzMZ867Tc2C7h9+3gICLDgeaioiklhMsFsvqTmq2b8LaAVVf/CG
	gj9+R3L/byMVugeom4wXL7cTr67hJnCn5aEIMQ5xl+X3b2EWob1T9XdvUe716vPxKbCW
	x3u3SPpV6qHEMPbkcObRLWg9m9BbzUej8zjGgL76ul30A0csQlXCZ1yoorZXan/d1km3
	6ALnVgouZdKxUAcpAEKozxwSuKGG+X/bnIL9oIRdtzAbwpq5CvOzyBbIxDCAIF3556nt
	iX9Lp6JRpzOT0tQXYVLhUZqm+6zeoVk5LPLmn25nz77bXkgLMqNqTRmSQCTcg0x+gHPE
	ZnJA==
Received: by 10.68.234.106 with SMTP id ud10mr22715979pbc.128.1333396845146;
	Mon, 02 Apr 2012 13:00:45 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id s10sm14646055pbp.14.2012.04.02.13.00.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Apr 2012 13:00:43 -0700 (PDT)
Date: Mon, 2 Apr 2012 13:00:15 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120402200015.GA26494@sakrah.homelinux.org>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 02 Apr 2012 20:09:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/03/12 00:36), Paul Eggleton wrote:
> If the user is in any directory other than $BUILDDIR when the bitbake
> wrapper script is run, then show an error an exit.
> 
> Fixes [YOCTO #2071].


angstrom e.g. does not have this restriction but uses script/bitbake
so this fix seems to be wrong here since its specific to OE-Core's
default build env.

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
> +fi
> +
>  buildpseudo="1"
>  if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
>      PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


