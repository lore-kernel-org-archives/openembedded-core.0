Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCWI3-00078u-GS
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 15:18:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E4641315A8DF;
	Tue, 27 Mar 2012 15:09:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id WZd55UI5KQSl; Tue, 27 Mar 2012 15:09:13 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d014418.pool.mediaWays.net [77.1.68.24])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id C976F315A8DD;
	Tue, 27 Mar 2012 15:09:11 +0200 (CEST)
Message-ID: <4F71BBF7.4030001@opendreambox.org>
Date: Tue, 27 Mar 2012 15:09:11 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
	<0b6dadd78b527731df18b8fa308d714b6d3ef956.1332848153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <0b6dadd78b527731df18b8fa308d714b6d3ef956.1332848153.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] scripts/bitbake: allow switching between build directories
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
X-List-Received-Date: Tue, 27 Mar 2012 13:18:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 27.03.2012 13:50, Paul Eggleton wrote:
> The recent addition of the check to ensure the user was in their build
> directory disabled the ability to switch between build directories
> without re-running the build environment setup script. We can rely
> upon checking for conf/bblayers.conf instead, so use this check.
> 
> This does allow BUILDDIR (which is normally set by the environment
> script) to be unset; however if it is set then it is assumed to be the
> correct build directory and will be used in the error message that is
> shown when we can't find conf/bblayers.conf.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Andreas Oberritter <obi@opendreambox.org>

> ---
>  scripts/bitbake |   15 ++++++++++-----
>  1 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/bitbake b/scripts/bitbake
> index 1ba1839..f02e89b 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -37,6 +37,16 @@ if [ "$py_v26_check" != "True" ]; then
>  	exit 1
>  fi
>  
> +if [ ! -e conf/bblayers.conf ] ; then
> +    BDPRINT=""
> +    [ -n "$BUILDDIR" ] && BDPRINT=": $BUILDDIR"
> +    echo "Unable to find conf/bblayers.conf"
> +    echo "BitBake must be run from within your build directory$BDPRINT"
> +    exit 1
> +elif [ -z "$BUILDDIR" ] ; then
> +    BUILDDIR="`pwd`"
> +fi
> +
>  needtar="1"
>  TARVERSION=`tar --version | head -n 1 | cut -d ' ' -f 4`
>  float_test() {
> @@ -47,11 +57,6 @@ float_test() {
>  # but earlier versions do not
>  float_test "$TARVERSION > 1.23" && needtar="0"
>  
> -if [ "`pwd`" != "$BUILDDIR" ] ; then
> -    echo "BitBake must be run from your build directory: $BUILDDIR"
> -    exit 1
> -fi
> -
>  buildpseudo="1"
>  if [ $needpseudo = "1" ]; then
>      if [ -e "$BUILDDIR/pseudodone" ]; then



