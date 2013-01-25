Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tyfv7-0000o2-43
	for Openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 10:50:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jan 2013 01:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,537,1355126400"; d="scan'208";a="248288437"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 25 Jan 2013 01:34:24 -0800
Message-ID: <5102518C.7000201@intel.com>
Date: Fri, 25 Jan 2013 11:34:04 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Jason Wessel <jason.wessel@windriver.com>
References: <1359074326-12029-1-git-send-email-jason.wessel@windriver.com>
	<1359074326-12029-2-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1359074326-12029-2-git-send-email-jason.wessel@windriver.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] populate_sdk_base.bbclass: Improve debugging capabilities for SDK installer
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
X-List-Received-Date: Fri, 25 Jan 2013 09:50:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/25/2013 02:38 AM, Jason Wessel wrote:
>  executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm +111)
> -$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
> -if [ $? -ne 0 ]; then
> -	echo "SDK could not be set up. Relocate script failed. Abort!"
> -	exit 1


> +echo "#!/bin/bash" > ${env_setup_script%/*}/relocate_sdk.sh
> +echo exec $SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> ${env_setup_script%/*}/relocate_sdk.sh
> +chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
The last 3 lines will certainly fail if installation takes place in a
location you don't have rights... So, you'll end up with no
relocate_sdk.sh script.

Thanks,
Laurentiu
> +if [ $relocate = 1 ] ; then
> +	${env_setup_script%/*}/relocate_sdk.sh
> +	if [ $? -ne 0 ]; then
> +		echo "SDK could not be set up. Relocate script failed. Abort!"
> +		exit 1
> +	fi
>  fi


