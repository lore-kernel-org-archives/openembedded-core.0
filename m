Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 725EE7016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 21:36:34 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id b22so4783543oii.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rnwhNCN03M5USyWCwWg5mqMO7+iuZ2peUNtNW0i5R7s=;
	b=cA0/h4QM/LhAYQAYsca0iz4IuPyCtBfRlpyPIYC/vk+knVMXcVZZ2xSUEa3qXHkpWs
	RcIR66lR6sogY0wBi+0X4ujNHR8DG/cqUsa5eBl5BSETj1Ilm+pdymiD0MY1AW16auyT
	Ml4UD8fDyI3uYP8IO8jJErqGo6nYQOKxcx1YfXCPEOzef/0ESKQp1xQgZJJQCF1H0pgb
	AGjCP6tYzgOnUSuKEUhAZ8SEOin/HAjtpeUUSnJ76an47jm3vABEA2k2Ic4Bqr/NsiM/
	oHZXAkR+dTjUgH/TbsZR5mIFSKL8ya221ckhG0LRLE4TzdhUVl7D60FJ7Fbq5IqgQtPS
	pt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rnwhNCN03M5USyWCwWg5mqMO7+iuZ2peUNtNW0i5R7s=;
	b=gUXISXb8wl+pgNGcyCOPHi8hCHDVOdDdFmYGekXTZDXJktKLphC3kuH/MDELDwWwLt
	pCLdeJCggLQJz8SdcQn9uL+tdrhmhsb4yYMVsMOA95cC+FzcyBvSfBKilHK7bZd3s5XM
	cwq8JUxiOqIIcOhvxLlkIc1EDADHghS/E965y+1CeuwHDyfbRwUBLrxOEaWPgqbcQyN9
	wqGdwueLL9ecgwB58hPOAg4Vsh0py+xBFNWlC/bGD6O/PDNDAb6Checp42VOHONhmSFQ
	GjVNygWgq9hRCaRHBvRdoK37Py9ybVJ8AdI5gY6kT4kcBhXqyBppdC1d96aTUl5b7kG0
	mKOg==
X-Gm-Message-State: AEkoouv51nleNXkAC/Hb0fWayY6f8R51ig6tGcmg4d4HNKUZkhhgW+fwQfz4fZXM5U+pK0+4rdqS71uMclC3RQ==
X-Received: by 10.157.56.187 with SMTP id p56mr2609899otc.69.1471556194568;
	Thu, 18 Aug 2016 14:36:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.229 with HTTP; Thu, 18 Aug 2016 14:36:04 -0700 (PDT)
In-Reply-To: <cover.1471500427.git.liezhi.yang@windriver.com>
References: <cover.1471500427.git.liezhi.yang@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Aug 2016 14:36:04 -0700
Message-ID: <CAKmqyKNdnFbHRVsxYNhqQH05XwSv54ES71X-SeveKwCykq2BXw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Thu, 18 Aug 2016 21:36:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 17, 2016 at 11:15 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Previously, runqemu had hard coded machine knowledge, which limited its
> usage, for example, qemu can boot genericx86, but runqemu can't, we need
> edit runqemu/runqemu-internal a lot if we want to boot genericx86.
>
> Now bsp conf files can set vars to make it can be boot by runqemu, and
> qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py.
> Please see qemuboot.bbclass' comments on how to set the vars.
>
> * Re-write it in python3, which can reduce lines from 1239 to about 750
>   lines
> * All the machine knowledges are gone
> * Most of the TUN_ARCH knowledge are gone except aarch64 and powerpc,
>   it's not easy to remove the two, so leave them there atm
> * All the previous options are preserved, and there is a new way to run
>   runqemu: (it doesn't need run "bitake -e" in such a case)
>   $ runqemu tmp/deploy/images/qemux86
>   or:
>   $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
>   or:
>   $ runqemu tmp/deploy/images/qemuarm/qemuboot.py
> * Fixed audio support, not limited on x86 or x86_64
> * The kvm support is not limited on x86 or x86_64
> * Fix SLIRP mode
> * Fix NFS boot, it will extract <image>.tar.bz2 or tar.gz to
>   DEPLOY_DIR_IMAGE/<image>-nfsroot when no NFS_DIR, and remove it after
>   stop.
> * More bsps can be boot, such as genericx86 and genericx86-64.
> * The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent to
>   meta-xilinx' mailing list.
> * I can't find any qemush4 bsp or how to build it, so it is not
>   considered atm.
>
> * Tested the following machines, all of them work well:
>   genericx86 genericx86-64
>   qemuarm qemuarm64
>   qemumips qemumips64 qemuppc
>   qemux86 qemux86-64
>   qemuzynq qemuzynqmp
>
> And also test "bitbake core-image-sato -ctestimage" which uses runqemu, it
> also works.
>
> // Robert
>
> The following changes since commit c86bf80abd87acb0da5860806822c64ec9dee089:
>
>   oeqa.buildperf: use oe.path.remove() (2016-08-17 10:35:27 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>
> Robert Yang (8):
>   qemu.inc: inherit qemu-boot.bbclass
>   arm: set vars for runqemu
>   qemuarm64.conf: set vars for runqemu
>   arch-x86.inc: set vars for runqemu
>   arch-mips.inc: set vars for runqemu
>   qemuppc.conf: set vars for runqemu
>   qemuboot.bbclass: add it for runqemu
>  runqemu: refactor it and remove machine knowledge

Your patches are a different order in the git tree you have above.
Which one is the correct ordering?

The idea of this patch set looks great!

Thanks,

Alistair

>
>  meta/classes/qemuboot.bbclass                |   59 ++
>  meta/conf/machine/include/mips/arch-mips.inc |    6 +
>  meta/conf/machine/include/qemu.inc           |    2 +
>  meta/conf/machine/include/tune-cortexa8.inc  |    4 +
>  meta/conf/machine/include/x86/arch-x86.inc   |   15 +
>  meta/conf/machine/qemuarm.conf               |    5 +
>  meta/conf/machine/qemuarm64.conf             |    9 +
>  meta/conf/machine/qemuppc.conf               |    6 +
>  scripts/runqemu                              | 1261 +++++++++++++++-----------
>  scripts/runqemu-internal                     |  739 ---------------
>  10 files changed, 842 insertions(+), 1264 deletions(-)
>  create mode 100644 meta/classes/qemuboot.bbclass
>  delete mode 100755 scripts/runqemu-internal
>
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

