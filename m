Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBTDk-0002Ak-4z
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:21:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Sep 2012 09:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,406,1344236400"; d="scan'208";a="143846419"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Sep 2012 09:09:16 -0700
Message-ID: <504F622A.8020309@linux.intel.com>
Date: Tue, 11 Sep 2012 09:09:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <cover.1347300913.git.andrei@gherzan.ro>
	<5d91c62217814247b57453bf6b6d97bc049caa1b.1347300913.git.andrei@gherzan.ro>
In-Reply-To: <5d91c62217814247b57453bf6b6d97bc049caa1b.1347300913.git.andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image_types.bbclass: Round up ROOTFS_SIZE after base_size check
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
X-List-Received-Date: Tue, 11 Sep 2012 16:21:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2012 11:18 AM, Andrei Gherzan wrote:
> If we round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT before checking if
> base_size is greater then IMAGE_ROOTFS_SIZE, we can end up adding an
> unaligned value to IMAGE_ROOTFS_SIZE. Obviously, if
> IMAGE_ROOTFS_EXTRA_SPACE was overwritten with an unaligned value. So
> let's add the round up code after the base_size calculus and it's
> comparison.
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>   meta/classes/image_types.bbclass |    8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index d286eea..0bd7a6f 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -82,9 +82,13 @@ runimagecmd () {
>   	# The base_size gets calculated:
>   	#  - initial size determined by `du -ks` of the IMAGE_ROOTFS
>   	#  - then multiplied by the IMAGE_OVERHEAD_FACTOR
> -	#  - then rounded up to IMAGE_ROOTFS_ALIGNMENT
>   	#  - finally tested against IMAGE_ROOTFS_SIZE
> -	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -= base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
> +
> +	# Round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT
> +	ROOTFS_SIZE=`expr ${ROOTFS_SIZE} + ${IMAGE_ROOTFS_ALIGNMENT} - 1`
> +	ROOTFS_SIZE=`expr ${ROOTFS_SIZE} - ${ROOTFS_SIZE} % ${IMAGE_ROOTFS_ALIGNMENT}`
> +
I saw a new expr failure on rootfs this morning testing with this patch, 
I have to dig into it to figure out what went wrong.

Sau!

>   	${cmd}
>   	# Now create the needed compressed versions
>   	cd ${DEPLOY_DIR_IMAGE}/
>


