Return-Path: <prvs=4282363e9=mnhu@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id BA98677FC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1551; q=dns/txt;
	s=ironport2; t=1505812182; x=1537348182;
	h=subject:from:to:cc:references:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=dnV+eJv1IgtoneBiwdYZDpECErF2H9Gqan8EGkDnP80=;
	b=fVRBKnkfkbD0ouhMWgwN2/Y6U7nn/6gWvdN7aTkZ0vjMfrVrYozO/4Y7
	T3oZoa3m44Xr8kN91NToLmWPLDPwY9DXTbOTURuF/ZBQdnj+1s7tScxlY
	K5QWPLCeQQehvPlyj064415nh+4+CTIXw5zKIzNrl/6Wv87GwLG6bNnbZ Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GtAADC3cBZ/+iTuFUNTxkBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAaR3XJd3QAqFOwKFFxUBAgEBAQEBAQEDgVISAYREAQEBAzIBBTM?=
	=?us-ascii?q?OEAsNAQouVwYNCAEBiiKpF4MSIosFAQEBAQEBBAEBAQEkgyuFYIJ9ikwfBaELl?=
	=?us-ascii?q?FaCE4Vqg3GHC0iUb4E5NYEwMikxhheBUIMihi0BAQE?=
X-IPAS-Result: =?us-ascii?q?A2GtAADC3cBZ/+iTuFUNTxkBAQEBAQEBAQEBAQcBAQEBAaR?=
	=?us-ascii?q?3XJd3QAqFOwKFFxUBAgEBAQEBAQEDgVISAYREAQEBAzIBBTMOEAsNAQouVwYNC?=
	=?us-ascii?q?AEBiiKpF4MSIosFAQEBAQEBBAEBAQEkgyuFYIJ9ikwfBaELlFaCE4Vqg3GHC0i?=
	=?us-ascii?q?Ub4E5NYEwMikxhheBUIMihi0BAQE?=
X-IronPort-AV: E=Sophos;i="5.42,417,1500933600"; 
   d="scan'208";a="2494938"
Received: from unknown (HELO [10.0.0.232]) ([85.184.147.232])
	by mail02.prevas.se with ESMTP/TLS/DHE-RSA-AES128-SHA;
	19 Sep 2017 11:09:01 +0200
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
To: Tom Rini <trini@konsulko.com>
References: <1501012689-2574-1-git-send-email-trini@konsulko.com>
	<01d79bbc-39d1-b610-f199-15dc2b63c10c@prevas.dk>
	<20170915121620.GR4560@bill-the-cat>
	<48cfd456-5bb7-8446-2954-b055983e58cd@prevas.dk>
Message-ID: <19d71f11-d747-76b3-515c-4fceb56f40d6@prevas.dk>
Date: Tue, 19 Sep 2017 11:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <48cfd456-5bb7-8446-2954-b055983e58cd@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image: Fix "metadata is not deterministic" when chaining 2+ CONVERSION_CMDs
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
X-List-Received-Date: Tue, 19 Sep 2017 09:09:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-IE
Content-Transfer-Encoding: 8bit



On 2017-09-15 20:20, Martin Hundebøll wrote:
> On 2017-09-15 14:16, Tom Rini wrote:
>>> This commit has resulted in more or less persistent basehash issues
>>> for my cpio.gz.u-boot image:
>>>
>>> ERROR: When reparsing 
>>> /home/mnhu/projects/pil/yocto/meta-pil/recipes-filesystems/rescue-rootfs.bb.do_image_cpio, 
>>>
>>> the basehash value changed from ac9907bbb8ee2ee6d9ca90f7a7e265f5 to
>>> 8c7b717add6b1d1ba6ff761ebfdedf01. The metadata is not deterministic
>>> and this needs to be fixed.
>>>
>>> The error occurs repeatedly when doing `bitbake -c clean
>>> rescue-rootfs && bitbake rescue-rootfs`. Reverting the commit makes
>>> the error go away.
>>>
>>> Also, the issue only appears for cpio.gz.u-boot image types, but not
>>> for cpio.gz
>>>
>>> I am far from an expert in bitbake signature handling, so please let
>>> me know what to do, to debug this further.
>> Can you let me know what layers and machine I need to reproduce this?
>> I'll take a look, thanks!
> 
> I am able to reproduce with the following:
> 
>    - Ubuntu 16.04 based on the attached Dockerfile
>    - A clean clone of poky (commit 072430b9b3)
>    - meta, meta-poky, and meta-yocto-bsp (see build-config.log)
>    - beaglebone machine and gpio.gz.u-boot image type (see local.conf)

Sorry, this seems to be caused by your earlier patch: 88eec32150 
('image.bbclass: Correct chaining compression support'). My first 
conclusion was probably caused by caching playing me a trick.

I'll reply to that patch instead.

// Martin

