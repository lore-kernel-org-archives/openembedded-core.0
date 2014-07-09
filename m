Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 97A1165C83
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 00:19:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2014 17:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,629,1400050800"; d="scan'208";a="570257668"
Received: from unknown (HELO [10.255.13.46]) ([10.255.13.46])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2014 17:19:02 -0700
Message-ID: <53BC8A76.3010608@linux.intel.com>
Date: Tue, 08 Jul 2014 17:19:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>, openembedded-core@lists.openembedded.org
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
	<1404266329-13524-3-git-send-email-joaohf@gmail.com>
In-Reply-To: <1404266329-13524-3-git-send-email-joaohf@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 2/2] populate_sdk_base: ensure that filenames with empty space character are handled
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
X-List-Received-Date: Wed, 09 Jul 2014 00:19:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/01/2014 06:58 PM, João Henrique Ferreira de Freitas wrote:
> When extracting toolchain, if the list $executable_files has filenames
> with empty space character, the list will created but relocate_sdk.sh
> will not handle it well. This will lead to the below erro:
>
>      ./tmp/deploy/sdk/buildtools-mytools-x86_64-nativesdk-standalone-1.6.1.0.sh
>      Enter target directory for SDK (default: /opt/mydistro/mytoolset/1.6.1.0):
>      You are about to install the SDK to "/opt/mydistro/mytoolset/1.6.1.0". Proceed[Y/n]?
>      Extracting SDK...done
>      Setting it up.../opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line 2: sintaxe error `token'  `('
>      /opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line 2: `e
>
> The same occurs with replacement of ${SDKPATH} in configs/scripts/etc files.
>
> We should ensure that full path is protected before relocate_sdk.sh
> and ${SDKPATH} replacement calls.
>

I am not sure about this one, there are other cases where spaces in 
filenames/directory pathes just don't work, so fixing one place may not 
address all issues, I thought this was documented someplace, but I can't 
seem to find the associated bug or wiki entries.

Maybe someone else can remind me also where we talk about whitespace in 
pathe, obviously my search-fu is off right now.

Sau!

> Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
> ---
>   meta/classes/populate_sdk_base.bbclass | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index a12bf11..5311271 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -252,7 +252,7 @@ if [ "$dl_path" = "" ] ; then
>   	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
>   	exit 1
>   fi
> -executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111)
> +executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -exec echo \'{}\' \;)
>
>   tdir=`mktemp -d`
>   if [ x$tdir = x ] ; then
> @@ -273,7 +273,7 @@ if [ $relocate = 1 ] ; then
>   fi
>
>   # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
> -$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
> +$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|cut -d':' -f1|tr "\n" "\0"|$SUDO_EXEC xargs -0 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
>
>   # change all symlinks pointing to ${SDKPATH}
>   for l in $($SUDO_EXEC find $native_sysroot -type l); do
>

