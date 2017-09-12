Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9573B784DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:34:04 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8C8Y1ZL028728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 12 Sep 2017 09:34:03 +0100
Message-ID: <1505205241.18640.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:34:01 +0100
In-Reply-To: <20170911211807.21269-1-otavio@ossystems.com.br>
References: <20170911211807.21269-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v7 1/2] kernel: Move Device Tree support to kernel.bbclass
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
X-List-Received-Date: Tue, 12 Sep 2017 08:34:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-09-11 at 18:18 -0300, Otavio Salvador wrote:
> The Device Tree is commonly used but it is still kept as a .inc file
> instead of a proper class. Instead now we move the Device Tree code
> to
> a kernel-devicetree class and automatically enable it when the
> KERNEL_DEVICETREE variable is set.
> 
> While converting to the class, we reworked the compile and install in
> tasks as well as run the build of the Device Tree files in parallel,
> if possible.
> 
> To avoid breakage in existing layers, we kept a linux-dtb.inc file
> which raises a warning telling the user about the change so in next
> release this can be removed.

Sorry but this patchset doesn't appear to be well tested and has big
issues. For example:

https://autobuilder.yocto.io/builders/nightly-x86/builds/497/steps/Buil
dImages/logs/stdio

I'm going to guess that do_compile_devicetree is racing
against do_compile_kernelmodules. Debugging these kinds of races is
tremendously hard and taking a patchset on a key component like the
kernel at this point in M4 where this hasn't been considered is
worrying/risky.

https://autobuilder.yocto.io/builders/nightly-mips-lsb/builds/461/steps
/BuildImages/logs/stdio

another form of the same race? The autobuilder is full of these
failures :(

I think if this patchset is to go anywhere it needs to be split into
more incremental changes, one to move to the new file structure but not
change the functionality, another looking at parallelisation etc. as
the current approach of "this patch does X + Y + Z" makes review harder
and makes it harder to merge any piece of it.

Cheers,

Richard





