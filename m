Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75804C7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 20:14:58 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.805.1683576892667701613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 13:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 348KEpwN016426
	for <openembedded-core@lists.openembedded.org>; Mon, 8 May 2023 15:14:51 -0500
Message-ID: <0b015ab5-560e-9cce-27fc-ffd5092686b6@kernel.crashing.org>
Date: Mon, 8 May 2023 15:14:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Initramfs recipes - How to set IMAGE_FSTYPES
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 20:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181028

A little background, looking at oe-core and poky for background, I see the 
initramfs images contain:

IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"

I see this in both oe-core 
meta/recipes-core/images/core-image-minimal-initramfs.bb and 
core-image-tiny-initramfs.bb.

The "meta-security" layer also seems to the do the same in it's 
'dm-verify-image-iniramfs.bb' recipe as well.


However, when I look at meta-openembedded/meta-initramfs (initramfs-debug-image 
and initramfs-kexecboot-image), I see:

# Some BSPs use IMAGE_FSTYPES_<machine override> which would override
# an assignment to IMAGE_FSTYPES so we need anon python
python() {
    d.setVar("IMAGE_FSTYPES", d.getVar("INITRAMFS_FSTYPES"))
}


This is the exact issue I'm trying to understand.  (Ignoring the comment above 
uses the older style override syntax), the issue I have is someone is setting:

IMAGE_FSTYPES:<override> = "something"
INITRAMFS_FSTYPES:<override> = "something else"

Then the initramfs recipes in oe-core are failing to set IMAGE_FSTYPES to 
INITRAMFS_FSTYPES due to the IMAGE_FSTYPES override, which causes the types to 
not be correct.


My question then is, is setting IMAGE_FSTYPES:<override> valid, if not should be 
add a sanity check to tell people to NOT do it?  If it is valid to do, is the 
workaround/fix in meta-openembedded the right solution?   If using the python 
approach is correct, then I'm happy to generate patches to oe-core but I'm just 
not sure what the expected usage is.

Thanks!
--Mark

