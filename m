Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACCD66FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 17:43:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v95HhTfr011870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Oct 2017 10:43:29 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 5 Oct 2017 10:43:28 -0700
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1485350316-4842-1-git-send-email-ed.bartosh@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <94360711-c98a-a103-20c4-6fa4e5d70ef7@windriver.com>
Date: Thu, 5 Oct 2017 12:43:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1485350316-4842-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: Re: [PATCH] toolchain-shar-extract: compare SDK and host gcc versions
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
X-List-Received-Date: Thu, 05 Oct 2017 17:43:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I realize this reply is months after the original email.  But I think I found a
bug with the implementation.  See below inline.

On 1/25/17 7:18 AM, Ed Bartosh wrote:
> If ext sdk is built by gcc version higher than host gcc version
> and host gcc version is 4.8 or 4.9 the installation is known to
> fail due to the way uninative sstate package is built.
> 
> It's a known issue and we don't have a way to fix it for above
> mentioned combinations of build and host gcc versions.
> 
> Detected non-installable combinations of gcc versions and
> print an installation error.
> 
> [YOCTO #10881]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 1 +
>  meta/files/toolchain-shar-extract.sh   | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 5ad08c6..588a3cb 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -226,6 +226,7 @@ EOF
>  		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
>  		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
>  		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
> +		-e 's#@SDK_GCC_VER@#${@oe.utils.host_gcc_version(d)}#g' \

The return value from "oe.utils.host_gcc_version(d)" includes a leading '-'...

>  		${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
>  
>  	# add execution permission
> diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
> index 9295ddc..3f54c96 100644
> --- a/meta/files/toolchain-shar-extract.sh
> +++ b/meta/files/toolchain-shar-extract.sh
> @@ -11,6 +11,9 @@ export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
>  INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>  SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>  
> +INST_GCC_VER=$(gcc --version | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/p')

The item above fails with the message:

line 28: gcc: command not found

If the host does not have gcc on it.  (I realize this is incredibly rare
situation, but is valid in some cases.)  It might be a good idea to catch this
and put up a warning or otherwise clean up the error situation.

> +SDK_GCC_VER='@SDK_GCC_VER@'
> +

So based on the above you will end up with:

INST_GCC_VER="4.8"
SDK_GCC_VER="-4.9"

>  verlte () {
>  	[  "$1" = "`printf "$1\n$2" | sort -V | head -n1`" ]
>  }
> @@ -112,6 +115,11 @@ fi
>  # SDK_EXTENSIBLE is exposed from the SDK_PRE_INSTALL_COMMAND above
>  if [ "$SDK_EXTENSIBLE" = "1" ]; then
>  	DEFAULT_INSTALL_DIR="@SDKEXTPATH@"
> +	if [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '4.9' ] || [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '' ] || \
> +		[ "$INST_GCC_VER" = '4.9' -a "$SDK_GCC_VER" = '' ]; then

The comparisons above do not include the leading '-', so it would appear to me
that the checked would never end up being true -- and thus the error below would
never happen.

Am I seeing what is happening right?  If so, we'll need to get this fixed...

--Mark


> +		echo "Error: Incompatible SDK installer! Your host gcc version is $INST_GCC_VER and this SDK was built by gcc higher version."
> +		exit 1
> +	fi
>  fi
>  
>  if [ "$target_sdk_dir" = "" ]; then
> 


