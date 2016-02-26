Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C5BC06014F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:01:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1Q119io003576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Feb 2016 17:01:09 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 17:01:08 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <56CED925.5090700@windriver.com>
	<CADkTA4PM1AYzUH9d8RGOyaeMmQmr+iSXRjcEQGpqWj7TCXNcwQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56CFA3D2.70300@windriver.com>
Date: Fri, 26 Feb 2016 09:01:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4PM1AYzUH9d8RGOyaeMmQmr+iSXRjcEQGpqWj7TCXNcwQ@mail.gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu needs target kernel sets CONFIG_SCSI_VIRTIO=y to boot vmdk qcow2 and vdi
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
X-List-Received-Date: Fri, 26 Feb 2016 01:01:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/25/2016 08:42 PM, Bruce Ashfield wrote:
>
>
> On Thu, Feb 25, 2016 at 5:36 AM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Hi Bruce and Darren,
>
>     We need enable target kernel's CONFIG_SCSI_VIRTIO=y to make native qemu
>     can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can't
>     work in qemu since our vm image's root default to /dev/sda2, or we can
>     change it default to /dev/hda2, then we don't have to make any changes
>     on kernel, but I prefer scsi since ide is going to be out of date.
>
>
> The IDE fragment was on for compatibility reasons, but we dropped that
> compatibility about a year ago. I was under the impression that we had
> fully dropped all the IDE fragments.
>
>
>     I've tried to enable it by menuconfig, it works well, would you please
>     enable it by default ?
>
>
>
> Send a patch to the linux-yocto mailing list to change the virtio configuration
> fragment.
>
> You are already set up to test it out, so it is much easier.
>
> I don't see why this shouldn't follow the normal patch flow for configuration
> frag changes.

Sorry, the problem was that I didn't know how to send patch for yocto kernel:-).
I will send the patch to linux-yocto.

// Robert

>
> Cheers,
>
> Bruce
>
>
>
>     $ diff .config.old .config -Nur
>     --- .config.old 2016-02-25 01:04:25.816381913 -0800
>     +++ .config     2016-02-25 01:16:31.332232759 -0800
>     @@ -1479,7 +1479,7 @@
>       # CONFIG_SCSI_DEBUG is not set
>       # CONFIG_SCSI_PMCRAID is not set
>       # CONFIG_SCSI_PM8001 is not set
>     -# CONFIG_SCSI_VIRTIO is not set
>     +CONFIG_SCSI_VIRTIO=y
>       # CONFIG_SCSI_DH is not set
>       # CONFIG_SCSI_OSD_INITIATOR is not set
>       CONFIG_ATA=y
>
>     $ du bzImage bzImage_new
>     6752    bzImage
>     6756    bzImage_new
>
>     It nearly has no impact on the size.
>
>     --
>     Thanks
>
>     Robert
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"

