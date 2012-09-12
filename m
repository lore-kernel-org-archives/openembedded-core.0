Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBtxZ-0001c6-Qw
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 22:54:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Sep 2012 13:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,413,1344236400"; d="scan'208";a="221367102"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2012 13:42:14 -0700
Message-ID: <5050F3A5.9070609@linux.intel.com>
Date: Wed, 12 Sep 2012 13:42:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <cover.1347480378.git.andrei@gherzan.ro>
	<09795cfdec0b03e3c5e03b8bef431de0adad71e5.1347480378.git.andrei@gherzan.ro>
In-Reply-To: <09795cfdec0b03e3c5e03b8bef431de0adad71e5.1347480378.git.andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] image_types.bbclass: Round up ROOTFS_SIZE after base_size check
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
X-List-Received-Date: Wed, 12 Sep 2012 20:54:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2012 01:10 PM, Andrei Gherzan wrote:
> If we round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT before checking if
> base_size is greater then IMAGE_ROOTFS_SIZE, we can end up adding an
> unaligned value to IMAGE_ROOTFS_SIZE. Obviously, if
> IMAGE_ROOTFS_EXTRA_SPACE was overwritten with an unaligned value. So
> let's add the round up code after the base_size calculus and it's
> comparison.
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>   meta/classes/image_types.bbclass |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index d286eea..6c01b21 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -82,9 +82,12 @@ runimagecmd () {
>   	# The base_size gets calculated:
>   	#  - initial size determined by `du -ks` of the IMAGE_ROOTFS
>   	#  - then multiplied by the IMAGE_OVERHEAD_FACTOR
> -	#  - then rounded up to IMAGE_ROOTFS_ALIGNMENT
>   	#  - finally tested against IMAGE_ROOTFS_SIZE
> -	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -= base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
> +
> +	# Round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT
> +	ROOTFS_SIZE=`awk "BEGIN { rootfs_size = $ROOTFS_SIZE + ${IMAGE_ROOTFS_ALIGNMENT} - 1; rootfs_size -= rootfs_size % ${IMAGE_ROOTFS_ALIGNMENT}; print rootfs_size }"`
> +


AWK seems a little heavy weight here, now we are forking it twice, since 
we are already in awk above, can you not just continue the function from 
there instead, maybe with a END{} or something else?

Also will this guarantee an Integer result?
>   	${cmd}
>   	# Now create the needed compressed versions
>   	cd ${DEPLOY_DIR_IMAGE}/
>


