Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 328B5788CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 10:20:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 03:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,460,1515484800"; d="scan'208";a="24448679"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 12 Mar 2018 03:20:24 -0700
To: Zhang Xiao <xiao.zhang@windriver.com>,
	openembedded-core@lists.openembedded.org, mark.hatle@windriver.com
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
Date: Mon, 12 Mar 2018 12:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180312091303.121887-1-xiao.zhang@windriver.com>
Subject: Re: [PATCH 1/7] eudev: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 10:20:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/12/2018 11:12 AM, Zhang Xiao wrote:
> Config file udev.pc conflicts between 32 and 64 bit packages.
> Use update-alternatives to add base_libdir as suffix to avoid it.
> -inherit autotools update-rc.d qemu pkgconfig distro_features_check
> +inherit autotools update-rc.d qemu pkgconfig distro_features_check update-alternatives
> +
> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> +
> +ALTERNATIVE_${PN}-dev = "udev.pc"
> +ALTERNATIVE_LINK_NAME[udev.pc] = "${datadir}/pkgconfig/udev.pc"
> +ALTERNATIVE_TARGET[udev.pc] = "${datadir}/pkgconfig/udev.pc-${MULTILIB_SUFFIX}"
> +
> +PACKAGE_PREPROCESS_FUNCS += "eudev_alternative_rename"
> +
> +eudev_alternative_rename() {
> +       # rename udev.pc
> +       mv ${PKGD}${datadir}/pkgconfig/udev.pc ${PKGD}${datadir}/pkgconfig/udev.pc-${MULTILIB_SUFFIX}
> +}

I'm afraid, I have to say no to the entire patchset. It's abusing 
update-alternatives to do what it was never meant for, and effectively 
renders one of the -dev packages broken, just so that package manager 
can satisfy dependencies.

Let's first take a look at why dnf wants to install two different -dev 
packages in the first place, and why these seven recipes need to be 
fixed in particular. My understanding is multilib feature should be used 
only for libraries, and not for supporting development files.

Alex

