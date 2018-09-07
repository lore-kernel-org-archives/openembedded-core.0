Return-Path: <Lu.Jiang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13D2E79714
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 03:04:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8734QW2011768
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 20:04:26 -0700 (PDT)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 6 Sep 2018 20:04:25 -0700
Reply-To: <lu.jiang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <trini@konsulko.com>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
From: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <e16a6f29-9651-5b0e-7b81-e73750d0c7b7@windriver.com>
Date: Fri, 7 Sep 2018 11:02:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
X-Originating-IP: [128.224.162.214]
Subject: Re: [v2] [PATCH 0/7] wic:allow wic compile as an individual package
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
X-List-Received-Date: Fri, 07 Sep 2018 03:04:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi all,

Thanks Tom help me review this patch.

The patch intend to bring wic into target, allow it generate new image 
at runtime.
For example, most x86 board can boot from USB or SATA,  then wic enable 
uuid for partition to distinguish different device. If we use same image 
for all device, uuid will be same. It is better to generate a new image 
based on running system at runtime. Then wic is best choice.

In this patch set, patch 1-4 intend to bring wic into a individual 
package and allow it running out of OE environment.

However, to allow wic running on target, we need hack current 
implementation to fit target environment. This is patch  6 try to fix, 
while Tom think the workround implementation isn't good. The patch can 
not provide a good reason.  I agree.

I'd like introduce a new image plugin in next review request. The new 
plugin used to overcome the different between OE environment & target 
environment, and allow wic to generate image direct on a block device to 
save disk space usage on runtime. Please give your option about this, Tom.

BTW, for patch 7(use uuid for all partition in mkefi.wks), which is 
irrelevant with this issue. I will send a separated RR.

Thanks
Jiang Lu

在 2018年08月31日 10:15, Jiang Lu 写道:
> [V2]
> Rebase patch to latest oe-core commmit.
>
> [V1 log]
> This patch set intend to allow wic compile as an individual package, then it can run both on host & target side.
>
> On host, it invoke by image_type_wic.bbclass to as a native tool to generate wic image.
>
> Patch 1-4 make wic compile as a native tool.
>
> On trarget, it parse wks file, and use current rootfs & /boot folder to generated a new wic image on target.
>
> Patch 5-6 fix a few minor issue on target.
>
> The patch is validate with mkefidisk.wks from oe-core layer on intel x86 platform.
>
> Assume /dev/sda2 is root device, then with following command, use could generate a new wic image
>
> 	$mount /dev/sda2 /tmp/sda
> 	$wic create /root/mkefidisk.wks  -k /boot -r /tmp/sda -o /tmp/
>
> The generated image is under /tmp with name mkefidisk-xxx-sda.direct. Then user may dump this file into another booting deivce.
>
>
> Thanks
> Jiang Lu
>


