Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7yiy-0001J0-IY
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 01:39:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 96F9E315A189
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 01:30:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UgsnhNTSG70A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 01:30:33 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecefe.pool.mediaWays.net
	[89.14.206.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E882B315A161
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 01:30:32 +0100 (CET)
Message-ID: <4F613827.3040705@opendreambox.org>
Date: Thu, 15 Mar 2012 01:30:31 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Thu, 15 Mar 2012 00:39:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Paul,

On 14.03.2012 01:36, Paul Eggleton wrote:
> If the user is in any directory other than $BUILDDIR when the bitbake
> wrapper script is run, then show an error an exit.

this patch broke my setup.

My $BUILDDIR points to tmp, so that pseudo doesn't get rebuilt for every
machine. I have a shared tmp for many machines.

BUILDDIR doesn't seem to have any other use than pointing to the
'pseudodone' file. I don't understand why it's required to run bitbake
from there.

I'm using a tiny shell fragment to set up my build environment. This is
how it looks like:

export BUILDDIR=${PREFIX}/tmp
export
PATH=${PREFIX}/openembedded-core/scripts:${PREFIX}/bitbake/bin:${PATH}

local.conf and bblayers.conf for individual machines are stored in
${PREFIX}/build/${MACHINE}/conf.

Regards,
Andreas

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
> +fi
> +
>  buildpseudo="1"
>  if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
>      PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`



