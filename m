Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tdhbi-0000J5-2b
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 14:23:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2012 05:09:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,177,1355126400"; d="scan'208";a="248497179"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 28 Nov 2012 05:08:55 -0800
Message-ID: <50B60CE6.2090208@intel.com>
Date: Wed, 28 Nov 2012 15:08:54 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1353662831.git.hongxu.jia@windriver.com>
	<09c8bb8e48152f7887694be2aa7f69d5b135986e.1353662831.git.hongxu.jia@windriver.com>
In-Reply-To: <09c8bb8e48152f7887694be2aa7f69d5b135986e.1353662831.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Toolchain installation:adds sudo prompt and optins
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
X-List-Received-Date: Wed, 28 Nov 2012 13:23:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

This patch is on a collision course with this one:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=86d4b94bf29d68307cc02b235ab737136de70619

Would you please rebase on master-next and then resubmit?

Also, see my comments below.

Thanks,
Laurentiu

On 11/28/2012 02:14 PM, Hongxu Jia wrote:
> 1.Adds a sudo passwd prompt during installation if the
>   user couldn't install on the dir.
> 2.Adds option -d <dir>  to let user input dir without prompts.
> 3.Adds option -y for automatic yes to all prompts, a non-
>   interactive method.
> 
> [YOCTO# 3153]
> [YOCTO# 3309]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/populate_sdk_base.bbclass |   70 +++++++++++++++++++++++---------
>  1 file changed, 51 insertions(+), 19 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index ac34c32..c817b83 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -128,12 +128,33 @@ fi
>  
>  DEFAULT_INSTALL_DIR="${SDKPATH}"
>  COMPONENTS_LEN=$(echo ".${SDKPATH}" | sed "s/\// /g" | wc -w)
> +SUDO_EXEC=""
> +target_sdk_dir=""
> +answer=""
> +while getopts ":yd:" OPT; do
> +    case $OPT in
> +    y)  
> +        answer="Y"
> +        [ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
> +        ;;  
> +    d)    
> +        target_sdk_dir=$OPTARG
> +        ;;  
> +    *)  
> +        echo "Usage: $(basename $0) [-y] [-d <dir>]"
> +        echo "  -y         Automatic yes to all prompts"
> +        echo "  -d <dir>   Install the SDK to <dir>"
> +        exit 1 
> +        ;;    
> +    esac   
> +done
Please, don't use spaces for indentation. The rest of the script uses tabs.
>  
>  printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
> -read target_sdk_dir
> -
>  if [ "$target_sdk_dir" = "" ]; then
> -	target_sdk_dir=$DEFAULT_INSTALL_DIR
> +	read target_sdk_dir
> +	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
> +else
> +	echo "$target_sdk_dir"
>  fi
>  
>  eval target_sdk_dir=$target_sdk_dir
> @@ -144,10 +165,11 @@ else
>  fi
>  
>  printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
> -read answer
> -
>  if [ "$answer" = "" ]; then
> -	answer="y"
> +	read answer
> +	[ "$answer" = "" ] && answer="y"
> +else
> +	echo $answer
>  fi
>  
>  if [ "$answer" != "Y" -a "$answer" != "y" ]; then
> @@ -155,47 +177,57 @@ if [ "$answer" != "Y" -a "$answer" != "y" ]; then
>  	exit 1
>  fi
>  
> +# create dir and don't care about the result. 
>  mkdir -p $target_sdk_dir >/dev/null 2>&1
> -if [ $? -ne 0 ]; then
> -	echo "Error: Unable to create target directory. Do you have permissions?"
> -	exit 1
> +
> +# if don't have the right to access dir, gain by sudo 
> +if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
> +	SUDO_EXEC=$(which "sudo")
> +	if [ -z $SUDO_EXEC ]; then
> +		echo "No command 'sudo' found, please install sduo first. Abort!"
s/sduo/sudo/
> +		exit 1
> +	fi
> +
> +	# test sudo could gain root right
> +	$SUDO_EXEC pwd >/dev/null 2>&1
> +	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
>  fi
>  
>  payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
>  
>  printf "Extracting SDK..."
> -tail -n +$payload_offset $0| tar xj --strip-components=$COMPONENTS_LEN -C $target_sdk_dir
> +tail -n +$payload_offset $0| $SUDO_EXEC tar xj --strip-components=$COMPONENTS_LEN -C $target_sdk_dir
>  echo "done"
>  
>  printf "Setting it up..."
>  # fix environment paths
>  for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
> -  sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
> +  $SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
>  done
>  
>  # fix dynamic loader paths in all ELF SDK binaries
> -native_sysroot=$(cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
> -dl_path=$(find $native_sysroot/lib -name "ld-linux*")
> -executable_files=$(find $native_sysroot -type f -perm +111)
> -${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
> +native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
> +dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
> +executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm +111)
> +$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
>  if [ $? -ne 0 ]; then
>  	echo "SDK could not be set up. Relocate script failed. Abort!"
>  	exit 1
>  fi
>  
>  # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
> -find $native_sysroot -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
> +$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|$SUDO_EXEC grep ":.*ASCII.*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
>  
>  # change all symlinks pointing to ${SDKPATH}
> -for l in $(find $native_sysroot -type l); do
> -	ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
> +for l in $($SUDO_EXEC find $native_sysroot -type l); do
> +	$SUDO_EXEC ln -sf $(readlink $l| $SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
>  done
>  
>  echo done
>  
>  # delete the relocating script, so that user is forced to re-run the installer
>  # if he/she wants another location for the sdk
> -rm ${env_setup_script%/*}/relocate_sdk.py
> +$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py
>  
>  echo "SDK has been successfully set up and is ready to be used."
>  
> 


