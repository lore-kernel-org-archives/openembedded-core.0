Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D19907326D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 06:27:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u726RviV029362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 1 Aug 2016 23:27:57 -0700
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 1 Aug 2016 23:27:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1470016499-30815-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LadvrbvgPVpC=-pDSBd6ykYyKX=+MqqkNQhzFtbYo=3Ew@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57A03CC9.7010802@windriver.com>
Date: Tue, 2 Aug 2016 14:25:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LadvrbvgPVpC=-pDSBd6ykYyKX=+MqqkNQhzFtbYo=3Ew@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub2.inc: run autogen.sh before configure
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
X-List-Received-Date: Tue, 02 Aug 2016 06:28:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年08月02日 03:22, Burton, Ross wrote:
>
> On 1 August 2016 at 02:54, <mingli.yu@windriver.com
> <mailto:mingli.yu@windriver.com>> wrote:
>
>     When adding new source files from upstream the autogen.sh
>     script needs to be run
>
>
> This results in this change:
>
> packages/corei7-64-poky-linux/grub-efi/grub-efi: PKGSIZE changed from
> 6787555 to 7524227 (+10%)
>    * FILELIST: added "/usr/sbin/grub-sparc64-setup"
> packages/corei7-64-poky-linux/grub-efi/grub-efi: FILELIST: added
> "/usr/sbin/grub-sparc64-setup"
> packages/corei7-64-poky-linux/grub/grub-dbg: PKGSIZE changed from
> 26159624 to 28829025 (+10%)
> packages/corei7-64-poky-linux/grub/grub: PKGSIZE changed from 5942339 to
> 6679011 (+12%)
>    * FILELIST: added "/usr/sbin/grub-sparc64-setup"
> packages/corei7-64-poky-linux/grub/grub: FILELIST: added
> "/usr/sbin/grub-sparc64-setup"
>
> Is this intentional?

Thanks Ross! This is unintentional, adding autogen.sh in 
do_configure_prepend in grub2.inc results this issue, it is because:

* before add autogen.sh in grub2.inc, there is a patch
./meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
   used to remove grub-sparc64-setup in Makefile.util.am for x86 builds.

* After add autogen.sh in grub2.inc, the previous patch logic to remove
   grub-sparc64-setup in Makefile.util.am for x86 builds is overwritten 
  by autogen.sh (Which will regenerate Makefile.util.am) in do_configure 
phase.

Anyway, resend the V2 patch to remove the side effect.

Thanks,
Grace
> Ross

