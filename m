Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D0B5C785B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:24:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8D8Osix026039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 13 Sep 2017 09:24:55 +0100
Message-ID: <1505291094.18640.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 09:24:54 +0100
In-Reply-To: <20170912203608.14327-1-otavio@ossystems.com.br>
References: <20170912203608.14327-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v8 1/3] kernel: Move Device Tree support to kernel.bbclass
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
X-List-Received-Date: Wed, 13 Sep 2017 08:24:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-09-12 at 17:36 -0300, Otavio Salvador wrote:
> The Device Tree is commonly used but it is still kept as a .inc file
> instead of a proper class. Instead now we move the Device Tree code
> to
> a kernel-devicetree class and automatically enable it when the
> KERNEL_DEVICETREE variable is set.
> 
> To avoid breakage in existing layers, we kept a linux-dtb.inc file
> which raises a warning telling the user about the change so in next
> release this can be removed.

Still causing breakage:

https://autobuilder.yocto.io/builders/nightly-mips/builds/469/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-arm64/builds/454/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-mips-lsb/builds/464/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-mips64/builds/467/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-multilib/builds/489/steps/BuildImages_5/logs/stdio
https://autobuilder.yocto.io/builders/nightly-ppc/builds/488/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/477/steps/BuildImages/logs/stdio


All look like racing of do_compile_devicetree and do_make_scripts?

https://autobuilder.yocto.io/builders/nightly-arm/builds/537/steps/Buil
ding%20Toolchain%20Images/logs/stdio

"package kernel-devicetree-4.12.10+git0+42965d664f_fd16268214-r0.1.qemuarm does not have a compatible architecture"

Cheers,

Richard



