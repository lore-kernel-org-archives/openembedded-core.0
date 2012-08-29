Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6qt8-0005uR-Qt
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:37:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2012 15:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="139468722"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2012 15:25:14 -0700
Message-ID: <503E96CA.5070509@linux.intel.com>
Date: Wed, 29 Aug 2012 15:25:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344390266-11878-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1344390266-11878-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] bitbake: compile tar-replacement firstly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 22:37:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2012 06:44 PM, rongqing.li@windriver.com wrote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> Compiling tar-replacement or not is decided by version of host tar,
> if the host tar version is lower than 1.23, Compiling tar-replacement
> is needed.
>
> When doing popoluate tar-replacement sysroot to write the tar to
> sysroot, but writing is not finished. other packages probably
> use the being written tar to unzip file, which will lead to failure
> and report the below error:
> "bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text file busy"
>
> Now we compile tar-replacement firstly to ensure that a being written
> tar command will not be used.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   scripts/bitbake |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/bitbake b/scripts/bitbake
> index 09f8a86..79a81ea 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -152,7 +152,12 @@ if [ $buildpseudo -gt 0 ]; then
>               fi
>           done
>       done
> -    bitbake pseudo-native $TARTARGET $GITTARGET $additionalopts -c populate_sysroot
> +
> +    if [ $needtar = "1" ]; then
> +	bitbake $TARTARGET -c populate_sysroot
> +    fi
> +
> +    bitbake pseudo-native $GITTARGET $additionalopts -c populate_sysroot
>       ret=$?
>       if [ "$ret" != "0" ]; then
>           exit 1
>

Merged into OE-Core

Thanks
	Sau!



