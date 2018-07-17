Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 586 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Jul 2018 15:09:09 UTC
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id ED60778889
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3491; q=dns/txt; s=iport;
	t=1531840151; x=1533049751;
	h=subject:from:to:cc:references:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=g9/zT56Prr1j8grl1KCqYlGCYFmYHOyhWI3RgSMWBgE=;
	b=j8eTj4j/iEo2zm0b4Fbu4JeCtjrpDamk4r5jth/USDKrJkPei2rmKhL/
	6BPfz5fd2wI68VXuqn6A7qUMa6y3WkBGeXtw2k197gkUfd5EwR2FQDkF5
	+UimaTCIBaONPpUedL+UaZQWAiE9X6vpt5PL0WuEnNcLUnKCkagtMcdSv 8=;
X-IronPort-AV: E=Sophos;i="5.51,366,1526342400"; 
   d="scan'208";a="5174363"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2018 14:59:24 +0000
Received: from [10.61.68.62] (ams3-vpn-dhcp1086.cisco.com [10.61.68.62])
	(authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id w6HExNMe027024
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 Jul 2018 14:59:24 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-core@lists.openembedded.org
References: <1511349605-22464-1-git-send-email-rbilovol@cisco.com>
Message-ID: <6fc7ed17-7619-15b8-fc7e-5fdab594fcbf@cisco.com>
Date: Tue, 17 Jul 2018 17:59:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1511349605-22464-1-git-send-email-rbilovol@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: rbilovol
Cc: "Grygorii Tertychnyi \(gtertych\)" <gtertych@cisco.com>,
	xe-linux-external@cisco.com
Subject: Re: [PATCH] relocate_sdk.py: remove hardcoded SDK path
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
X-List-Received-Date: Tue, 17 Jul 2018 15:09:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

Any comments on this patch?

Thanks
Ruslan

On 11/22/2017 01:20 PM, Ruslan Bilovol wrote:
> This patch removes hardcodes added to relocate_sdk.py
> during SDK build, making it flexible and reusable.
> Now default SDK path is passed to the script as
> parameter rather then harcoded inside it.
> 
> This allows to reuse this script for multiple
> relocations, and adds possibility to relocate
> SDK multiple times
> 
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>   meta/classes/populate_sdk_base.bbclass |  5 -----
>   meta/files/toolchain-shar-relocate.sh  |  2 +-
>   scripts/relocate_sdk.py                | 17 +++++++++--------
>   3 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 424c63c..e7aa5a8 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -152,11 +152,6 @@ do_populate_sdk[stamp-extra-info] = "${MACHINE}${SDKMACHINE}"
>   
>   fakeroot create_sdk_files() {
>   	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
> -
> -	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
> -	# Escape special characters like '+' and '.' in the SDKPATH
> -	escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
> -	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
>   }
>   
>   python check_sdk_sysroots() {
> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
> index e3c1001..f82ff2b 100644
> --- a/meta/files/toolchain-shar-relocate.sh
> +++ b/meta/files/toolchain-shar-relocate.sh
> @@ -36,7 +36,7 @@ if [ x\${PYTHON} = "x"  ]; then
>   	echo "SDK could not be relocated.  No python found."
>   	exit 1
>   fi
> -\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
> +\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $DEFAULT_INSTALL_DIR $target_sdk_dir $dl_path $executable_files
>   EOF
>   
>   $SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> index c752fa2..0d5a6f5 100755
> --- a/scripts/relocate_sdk.py
> +++ b/scripts/relocate_sdk.py
> @@ -38,8 +38,6 @@ else:
>       def b(x):
>           return x.encode(sys.getfilesystemencoding())
>   
> -old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
> -
>   def get_arch():
>       f.seek(0)
>       e_ident =f.read(16)
> @@ -212,19 +210,22 @@ def change_dl_sysdirs(elf_file_name):
>           f.write(sysdirslen)
>   
>   # MAIN
> -if len(sys.argv) < 4:
> +if len(sys.argv) < 5:
>       sys.exit(-1)
>   
>   # In python > 3, strings may also contain Unicode characters. So, convert
>   # them to bytes
>   if sys.version_info < (3,):
> -    new_prefix = sys.argv[1]
> -    new_dl_path = sys.argv[2]
> +    new_prefix = sys.argv[2]
> +    new_dl_path = sys.argv[3]
>   else:
> -    new_prefix = sys.argv[1].encode()
> -    new_dl_path = sys.argv[2].encode()
> +    new_prefix = sys.argv[2].encode()
> +    new_dl_path = sys.argv[3].encode()
> +
> +executables_list = sys.argv[4:]
>   
> -executables_list = sys.argv[3:]
> +old_prefix_ne = b(sys.argv[1])
> +old_prefix = re.compile(re.escape(old_prefix_ne));
>   
>   for e in executables_list:
>       perms = os.stat(e)[stat.ST_MODE]
> 

