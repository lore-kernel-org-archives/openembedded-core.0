Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB1AE700FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 09:20:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5N9Kix3017935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jun 2016 02:20:44 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 23 Jun 2016 02:20:41 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, Bartosz Woronicz
	<mastier@mastier.pl>, Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
	<1466669835.3319.205.camel@linuxfoundation.org>
	<576BA114.9020804@windriver.com>
	<1466672218.3319.216.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <576BA9E8.9030803@windriver.com>
Date: Thu, 23 Jun 2016 17:20:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1466672218.3319.216.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/8] [WIP] runqemu/runqemu-internal: refactor it
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
X-List-Received-Date: Thu, 23 Jun 2016 09:20:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi RP,

Thanks, clear enough, here are the summary. For anyone who
cares about runqemu, please free to give your comments, I will
start working on it sooner.
1) Use python to replace of shell
2) Preserve the current command line options
3) Remove any machine knowledges out of runqemu scripts
4) I'm not sure whether we should remove arch knowledges out of runqemu,
    I'd like to keep them, this can make bsp add runqemu support easier.
5) Add qemu-boot.bbclass to help create boot files during build.
6) Use python3.

// Robert

On 06/23/2016 04:56 PM, Richard Purdie wrote:
> On Thu, 2016-06-23 at 16:43 +0800, Robert Yang wrote:
>> On 06/23/2016 04:17 PM, Richard Purdie wrote:
>>> On Tue, 2016-05-10 at 01:13 -0700, Robert Yang wrote:
>>> Sorry about not responding to this before now. My concerns:
>>>
>>> a) The commandline structure is changing and I'm not sure I like
>>> the
>>> new one or believe its an improvement. This is particularly
>>> problematic
>>> from a documentation perspective. Is there a way to preserve the
>>> existing syntax?
>>
>> I did like to preserve the existing command, but the main problem is
>> that then we had to hardcode the MACHINE knowledge into the code,
>> for example, when we run:
>> runqemu qemux86-64 core-image-sato
>>
>> The qemux86-64 should be hardcoded into the code, otherwise it
>> doesn't know this is a machine arg or typo.
>
> If we use python code, we can ask bitbake if "qemux86-64" is a valid
> MACHINE or not?
>
> We could assume that images are in DEPLOY_DIR/MACHINE and at least try
> looking to see if such a qemu-boot file exists? We could then error and
> simply inform them that there didn't appear to be any data for "qemu86
> -64" available. DEPLOY_DIR could come from bitbake -e.
>
> We could add in functionality to make it take an argument of a path to
> the qemu-boot directory so that if the first option looks like a
> relative/absolute PATH, try to see if a qemu-boot file exists there. If
> it doesn't, it can then fall back to slower ops?
>
>>> c) I don't think qemu-boot should be added be hardcoded into
>>> image.bbclass, we need to find a better way to do this.
>>
>> Sorry, I don't quite understand this, the code inside image.bbclass
>> is:
>>
>> +QEMU_BOOT_CLASS = "${@base_conditional('QEMU_BOOT_SUPPORTED', '1',
>> 'qemu-boot',
>> '', d)}"
>> +inherit ${QEMU_BOOT_CLASS}
>>
>> It doesn't look like a hardcode ?
>
> Imagine that qemu.inc does:
>
> IMAGE_CLASSES += "qemu-boot"
>
> You then shouldn't need to change image.bbclass at all, its much
> cleaner. I don't like much of the way image.bbclass deals with all its
> subclasses at the moment and don't want to make it worse.
>
> Cheers,
>
> Richard
>

