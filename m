Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id D9EAF608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 14:41:47 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 54293F811DF; Thu,  8 Aug 2013 08:41:48 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D10A5F81199;
	Thu,  8 Aug 2013 08:41:46 -0600 (MDT)
Message-ID: <5203AE2F.6070106@mlbassoc.com>
Date: Thu, 08 Aug 2013 08:41:51 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1375971269-9758-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1375971269-9758-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Thu, 08 Aug 2013 14:41:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-08-08 08:14, Ross Burton wrote:
> oe-setup-builddir substitutes ##COREBASE## which seems like it should have the
> same value as the variable ${COREBASE}.  In reality it doesn't as ##COREBASE##
> is substituted with the value of $OEROOT (the location of the oe-init-build-env
> script), whereas ${COREBASE} is set by oe-core to the parent directory of meta/.
> If oe-core's meta/ isn't a top-level directory then ##COREBASE## and ${COREBASE}
> have different values, which can lead to confusion.
>
> To resolve this, deprecate (but still substitute) ##COREBASE## and substitute
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   scripts/oe-setup-builddir |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index d5d8d98..d5bd581 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -101,7 +101,10 @@ EOM
>
>       # Put the abosolute path to the layers in bblayers.conf so we can run
>       # bitbake without the init script after the first run
> -    sed "s|##COREBASE##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
> +    sed "s|##OEROOT##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
> +    # ##COREBASE## is deprecated as it's meaning was inconsistent, but continue
> +    # ##to replace it for compatibility.
          ^^
Should these be here?

> +    sed -i -e "s|##COREBASE##|$OEROOT|g" $BUILDDIR/conf/bblayers.conf
>   fi
>
>   # Prevent disturbing a new GIT clone in same console
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

