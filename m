Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCWHL-00076V-4m
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 15:17:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 678AB315A8DF;
	Tue, 27 Mar 2012 15:08:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id X-6mu9+MDXZ5; Tue, 27 Mar 2012 15:08:29 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d014418.pool.mediaWays.net [77.1.68.24])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3594B315A8DD;
	Tue, 27 Mar 2012 15:08:29 +0200 (CEST)
Message-ID: <4F71BBCC.4030307@opendreambox.org>
Date: Tue, 27 Mar 2012 15:08:28 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
	<4a226262b48b8f0c56019183604b70c0f565d5f2.1332848153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <4a226262b48b8f0c56019183604b70c0f565d5f2.1332848153.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] scripts/bitbake: try harder to check if pseudo exists
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
X-List-Received-Date: Tue, 27 Mar 2012 13:17:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 27.03.2012 13:50, Paul Eggleton wrote:
> If pseudodone doesn't exist, we can get STAGING_BINDIR_NATIVE by calling
> bitbake -e and use that as the path to check for pseudo before we give
> up and try to build it explicitly first.
> 
> This is useful for people who share TMPDIR between multiple build
> directories.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

This adds a 3s delay over the previous setup on my build system, which I 
deem acceptable. See one minor suggestion inline.

Acked-by: Andreas Oberritter <obi@opendreambox.org>

> ---
>  scripts/bitbake |   12 +++++++++---
>  1 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/bitbake b/scripts/bitbake
> index 45c8697..1ba1839 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -53,14 +53,21 @@ if [ "`pwd`" != "$BUILDDIR" ] ; then
>  fi
>  
>  buildpseudo="1"
> -if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
> -    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
> +if [ $needpseudo = "1" ]; then
> +    if [ -e "$BUILDDIR/pseudodone" ]; then
> +        PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
> +    else
> +        PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`

I think using sed might improve readability:

bitbake -e | grep ^STAGING_BINDIR_NATIVE= | sed -e 's,^STAGING_BINDIR_NATIVE="\(.*\)"$,\1,'

This may be a subjective impression, though.

> +    fi
>      if [ -e "$PSEUDOBINDIR/pseudo" -a -e "$PSEUDOBINDIR/tar" -a "$needtar" = "1" ]; then
>          buildpseudo="0"
>      fi
>      if [ -e "$PSEUDOBINDIR/pseudo" -a $needtar = "0" ]; then
>          buildpseudo="0"
>      fi
> +    if [ $buildpseudo = "0" -a ! -e "$BUILDDIR/pseudodone" ] ; then
> +        echo $PSEUDOBINDIR > $BUILDDIR/pseudodone
> +    fi
>  fi
>  if [ $needpseudo = "0" ]; then
>      buildpseudo="0"
> @@ -104,7 +111,6 @@ BITBAKE=`which bitbake`
>  export PATH=$OLDPATH
>  if [ $needpseudo = "1" ]; then
>      export PSEUDO_BUILD=2
> -    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
>      PSEUDO_BINDIR=$PSEUDOBINDIR PSEUDO_LIBDIR=$PSEUDOBINDIR/../lib/pseudo/lib PSEUDO_PREFIX=$PSEUDOBINDIR/../../ PSEUDO_DISABLED=1 $PSEUDOBINDIR/pseudo $BITBAKE $@
>  else
>      export PSEUDO_BUILD=0



