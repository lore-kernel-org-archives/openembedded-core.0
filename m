Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37933C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 12:31:09 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.66295.1638880268094542970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 04:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=PplXCwi0;
 spf=pass (domain: pbarker.dev, ip: 64.147.123.24, mailfrom: paul@pbarker.dev)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D9CF43200D78;
	Tue,  7 Dec 2021 07:31:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 07 Dec 2021 07:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=4
	QqgcGo7+SyPheFWbhM9mTyWCxFW6ZcOeXVQkcSEGcQ=; b=PplXCwi0lNT5ZQhxJ
	ssHgIAWZ/LRIe2YvIHCouQbqTj2xi5CIDIj68jw/HBCAdf14rRQaAnekLpjp6rVY
	acG/yCvTfyYZ+Or1BvxPdXTZ/BVYbvmD0eJP3urjIiTd7Ui5SbS9fWMG/SZPwgMc
	UNA9lRI8JEZ6cOSWHZcGwMIqlYMo87nnKzEkwScHkZT9xpMPHjaP0Stf+lELYoYN
	OAuvP7Rbd0uqOpeTMvxyvQ/63jmtqrJx0Fbuh/DsmfIBBT1NI3xCsFP2EORP+8Jx
	3q9RKgvXxWMB3UrOStHg9DhtLDlGDVSbQXX5AX3r9j4LW7PLBzazVdfK5yp16d2O
	TK3lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=4QqgcGo7+SyPheFWbhM9mTyWCxFW6ZcOeXVQkcSEG
	cQ=; b=j6Le7161AgFL1fpzGkBwp/SjkL8bD5UfFN/hIR1zI7a0Iddu6LbwX8upm
	J34pdZS/1vdkJ0Q5kxAdFxbegQRev8VqtFAozvSHJeiQRCC9lfpEsRqQeKWr1A0n
	Q78EFvHiJ8M/wjfoofadTOLUhMYmv6DeOC67xmIc6SgQCR2/krYE2SYRI8bsPjvl
	HZssf/8OpbWnHoFZCvNBfKwnniVKCod+ZX+2Pu1Wh51PFMPjBGlHW34/J4kCQjIa
	CsmOhT+0j1qf0VogNMhgGP7yy/WwOjxYowZ0CdVDYAWrWgNe5w861+RQHj0D/9Wt
	dh8PaMKj4r4fN+kBD8LEzayU2qImA==
X-ME-Sender: <xms:CVSvYQnGAPtGlxWB-3sMDk0uQ7_zI8zdPW-Mh8b04qpAE7vqKdcnaQ>
    <xme:CVSvYf2Dgjd3IsTsR8HIJURDLQNl0y6eaMtAdptQkHl3TusnBZQd6wH8w6zf6NzAZ
    heuDJ8EOQSAbhFJtoU>
X-ME-Received: 
 <xmr:CVSvYerYw--UCauLgUC6Xs1c7ygh-RE1m05bDlfYc4a5DHFK2KnnBIGKXLSoBuQRB5P8EKbgHb4k7sjrsUK-hVVNlFnOI1JZdZsWwSk6ziL3JSpAQoY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefrrghulhcu
    uegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrh
    hnpeduuefgudefkeehgfektdevudevffdtleduhfevleehheekieegkeetgfeiudelkeen
    ucffohhmrghinhepphgsrghrkhgvrhdruggvvhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:CVSvYckD4TNjxC_hzLBRuJrczwscJ8vlRgxnWwWdAP1OxPq_eyNgPA>
    <xmx:CVSvYe32xEcpuFY1n4jWRKAEKcJinX9IUIVokLSYMyJCbJ3ktVxzeA>
    <xmx:CVSvYTutGC5cfnc0aG29HvlfzBTC0jGi6Js_ija_iyxNoXCAYpJKjw>
    <xmx:CVSvYcAUzTX-Gb4EBsqp1L1e45aFF58FCnvQkQ1kKndH5moSdGtlqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Dec 2021 07:31:04 -0500 (EST)
Message-ID: <66ca5907-969f-be34-6bd0-f5179c7b84ae@pbarker.dev>
Date: Tue, 7 Dec 2021 12:31:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [dunfell][PATCH 00/14] Backport mandatory dtschema handling for
 device trees built through the kernel.
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, bhupesh.linux@gmail.com
References: <20211201203407.218692-1-bhupesh.sharma@linaro.org>
 <CADkTA4NV0ix0S4rc8HqJuJJr=Os299bx5UZrQEBnx9MBW-DCzw@mail.gmail.com>
From: Paul Barker <paul@pbarker.dev>
In-Reply-To: 
 <CADkTA4NV0ix0S4rc8HqJuJJr=Os299bx5UZrQEBnx9MBW-DCzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 12:31:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159286

On 01/12/2021 21:33, Bruce Ashfield wrote:
> On Wed, Dec 1, 2021 at 3:34 PM Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>>
>> This is a backport request for dunfell, while picking up only the
>> skeletal support for allowing mandatory dtschema handling for
>> device trees built through the kernel, introduced from kernel
>> version 5.16 onwards.
> 
> The problem with adding this support to dunfell, is obvious in the
> number of patches involved.  We've also said/known that at some point
> that we won't be able to support all new kernel versions with the LTS
> release. This may be the start of drawing that line.
> 
> Also, we've had to do some license tweaks in master just today for one
> of the added packages (idna), so that would be needed as well.
> 
> The validation isn't absolutely critical, I'd suggest that just the
> wrappers and pkg-config fixes would be a smaller footprint to allow
> the kernel to build, without the new package/feature additions to the
> dunfell release. The new packages (and full validation) could still
> possibly be done through a secondary or mixin layer.
> 
> I'm not sure which way to go on this, but I thought I'd offer those
> points for discussion.

I've been thinking about this for meta-linux-mainline. Backporting 
python3-dtschema-wrapper seems like the way to go, either into a very 
small mixin layer or into oe-core.

Thanks,

-- 
Paul Barker

e: paul@pbarker.dev
w: https://pbarker.dev/

