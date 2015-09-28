Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA2F9755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 07:46:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8S7kDTJ026744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 00:46:13 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 28 Sep 2015 00:46:13 -0700
Message-ID: <5608F044.1000909@windriver.com>
Date: Mon, 28 Sep 2015 15:46:12 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1443424138.git.liezhi.yang@windriver.com>
	<c863983a0f775079fa0bff7983be09ae6841e923.1443424138.git.liezhi.yang@windriver.com>
In-Reply-To: <c863983a0f775079fa0bff7983be09ae6841e923.1443424138.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] toolchain-shar-relocate.sh: make it faster
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
X-List-Received-Date: Mon, 28 Sep 2015 07:46:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/28/2015 03:09 PM, Robert Yang wrote:
> Make the extrating faster by:
> * Merge the two heavy t"for .. find" loops into one

Sorry, a typo, should be no "t", updated in the repo.

// Robert

> * Move the commands out of for loop rather than inside, this can reduce the
>    forking amount.
>
> As a result, when install:
> * buildtools-nativesdk-standalone: 14s -> 7s (50% saved)
> * core-image-minimal-core2-64-toolchain: 56s -> 47s (17% saved)
>
> [YOCTO #8404]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/files/toolchain-shar-relocate.sh |   24 ++++++++++--------------
>   1 file changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
> index dfb8e16..4ef2927 100644
> --- a/meta/files/toolchain-shar-relocate.sh
> +++ b/meta/files/toolchain-shar-relocate.sh
> @@ -26,25 +26,21 @@ if [ $relocate = 1 ] ; then
>   	fi
>   fi
>
> -# replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc
> +# replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc.
> +# replace the host perl with SDK perl.
>   for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
> -	$SUDO_EXEC find $replace -type f -exec file '{}' \; | \
> -		grep ":.*\(ASCII\|script\|source\).*text" | \
> -		awk -F':' '{printf "\"%s\"\n", $1}' | \
> -		grep -v "$target_sdk_dir/environment-setup-*" | \
> -		$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
> -done
> +	$SUDO_EXEC find $replace -type f
> +done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
> +    awk -F':' '{printf "\"%s\"\n", $1}' | \
> +    grep -v "$target_sdk_dir/environment-setup-*" | \
> +    xargs -n100 $SUDO_EXEC sed -i \
> +        -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
> +        -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
> +        -e "s: /usr/bin/perl: /usr/bin/env perl:g"
>
>   # change all symlinks pointing to @SDKPATH@
>   for l in $($SUDO_EXEC find $native_sysroot -type l); do
>   	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
>   done
>
> -# find out all perl scripts in $native_sysroot and modify them replacing the
> -# host perl with SDK perl.
> -for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep -l "^#!.*perl" '{}' \;); do
> -	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
> -		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
> -done
> -
>   echo done
>

