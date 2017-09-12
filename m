Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2C9783FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 14:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 5A71131801C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:45:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2fri9IttTdLg
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:45:32 +0200 (CEST)
Received: from t460p (p4FE9AB4C.dip0.t-ipconnect.de [79.233.171.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 831F031801C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:45:32 +0200 (CEST)
Date: Tue, 12 Sep 2017 16:45:31 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170912164531.34d2af4f@t460p>
In-Reply-To: <20170912134551.12678-3-otavio@ossystems.com.br>
References: <20170912134551.12678-1-otavio@ossystems.com.br>
	<20170912134551.12678-3-otavio@ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH v8 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Tue, 12 Sep 2017 14:45:34 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Otavio,

On Tue, 12 Sep 2017 10:45:51 -0300
Otavio Salvador <otavio@ossystems.com.br> wrote:

> +do_configure_devicetree() {
> +	if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
> +		if echo ${KERNEL_IMAGETYPE_FOR_MAKE} | grep -q 'zImage'; then
> +			config="${B}/.config"
> +			if ! grep -q 'CONFIG_ARM_APPENDED_DTB=y' $config; then
> +				bbwarn 'CONFIG_ARM_APPENDED_DTB is NOT enabled in the kernel. Enabling it to allow the kernel to boot with the Device Tree appended!'
> +				sed -i "/CONFIG_ARM_APPENDED_DTB[ =]/d" $config
> +				echo "CONFIG_ARM_APPENDED_DTB=y" >> $config
> +				echo "# CONFIG_ARM_ATAG_DTB_COMPAT is not set" >> $config

what about CONFIG_MIPS_APPENDED_DTB?

Can we ever make sure to cover all relevant architectures?

Regards,
Andreas

> +			fi
> +		else
> +			bberror 'The KERNEL_DEVICETREE_BUNDLE requires the KERNEL_IMAGETYPE to contain zImage.'
> +		fi
> +	fi
> +}


