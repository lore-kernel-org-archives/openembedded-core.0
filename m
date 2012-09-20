Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TEg0w-0000La-Rh for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 14:37:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8KCPANx011858;
	Thu, 20 Sep 2012 13:25:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01232-10; Thu, 20 Sep 2012 13:25:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8KCP3BG011851
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 20 Sep 2012 13:25:04 +0100
Message-ID: <1348143902.25163.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 20 Sep 2012 13:25:02 +0100
In-Reply-To: <949436f21dca1d0f73ff55f2692d8c1459657fa2.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<949436f21dca1d0f73ff55f2692d8c1459657fa2.1348052899.git.laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/7] image.bbclass: run postinst scripts once, at rootfs time
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
X-List-Received-Date: Thu, 20 Sep 2012 12:37:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-19 at 14:49 +0300, Laurentiu Palcu wrote:
> This patch will allow the repeating postinst scriptlets to be run
> only once, on host, at do_rootfs time. This will lower the time for
> rootfs generation and, also, instead of running some time consuming
> scriptlets at target's first boot, we will do on the host.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/image.bbclass |   24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index ab212b3..4889260 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -155,7 +155,7 @@ inherit ${IMAGE_CLASSES}
>  
>  IMAGE_POSTPROCESS_COMMAND ?= ""
>  MACHINE_POSTPROCESS_COMMAND ?= ""
> -ROOTFS_POSTPROCESS_COMMAND ?= ""
> +ROOTFS_POSTPROCESS_COMMAND ?= "run_intercept_scriptlets"
>  
>  # some default locales
>  IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> @@ -174,6 +174,21 @@ do_build[nostamp] = "1"
>  # task, so that we have a single fakeroot context for the whole process.
>  do_rootfs[umask] = "022"
>  
> +
> +run_intercept_scriptlets () {
> +	echo $D >> test.txt
> +	if [ -d ${WORKDIR}/intercept_scripts ]; then
> +		cd ${WORKDIR}/intercept_scripts
> +		echo "Running intercept scripts:"
> +		for script in *; do
> +			if [ "$script" = "*" ]; then break; fi
> +			echo "> Executing $script"
> +			chmod +x $script
> +			./$script
> +		done
> +	fi
> +}
> +
>  fakeroot do_rootfs () {
>  	#set -x
>  	# When use the rpm incremental image generation, don't remove the rootfs
> @@ -202,6 +217,13 @@ fakeroot do_rootfs () {
>  		done
>  	fi
>  
> +	if [ -d ${WORKDIR}/intercept_scripts ]; then
> +		# clean-up old intercept scripts
> +		rm -f ${WORKDIR}/intercept_scripts/*
> +	else
> +		mkdir ${WORKDIR}/intercept_scripts
> +	fi

You can achieve this piece with:

do_rootfs[cleandirs] += "${WORKDIR}/intercept_scripts"

Cheers,

Richard





