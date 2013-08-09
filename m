Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5B06B5AA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 20:58:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Aug 2013 13:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,848,1367996400"; d="scan'208";a="383998627"
Received: from unknown (HELO [10.255.14.176]) ([10.255.14.176])
	by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2013 13:58:23 -0700
Message-ID: <520557EE.7090904@linux.intel.com>
Date: Fri, 09 Aug 2013 13:58:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1376040425-2928-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1376040425-2928-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][V3] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Fri, 09 Aug 2013 20:58:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2013 02:27 AM, Ross Burton wrote:
> oe-setup-builddir substitutes ##COREBASE## which seems like it should have the
> same value as the variable ${COREBASE}.  In reality it doesn't as ##COREBASE##
> is substituted with the value of $OEROOT (the location of the oe-init-build-env
> script), whereas ${COREBASE} is set by oe-core to the parent directory of meta/.
> If oe-core's meta/ isn't a top-level directory then ##COREBASE## and ${COREBASE}
> have different values, which can lead to confusion.
>
> To resolve this, deprecate (but still substitute) ##COREBASE## and substitute
>
Did you mean for this sentence to just trail off?

Sau!

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   scripts/oe-setup-builddir |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index d5d8d98..adb55c7 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -101,7 +101,10 @@ EOM
>
>       # Put the abosolute path to the layers in bblayers.conf so we can run
>       # bitbake without the init script after the first run
> -    sed "s|##COREBASE##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
> +    sed "s|##OEROOT##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
> +    # ##COREBASE## is deprecated as it's meaning was inconsistent, but continue
> +    # to replace it for compatibility.
> +    sed -i -e "s|##COREBASE##|$OEROOT|g" $BUILDDIR/conf/bblayers.conf
>   fi
>
>   # Prevent disturbing a new GIT clone in same console
>

