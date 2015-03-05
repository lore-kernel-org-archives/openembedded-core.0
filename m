Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5D46371637
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:18:46 +0000 (UTC)
Received: by lbvp9 with SMTP id p9so29447092lbv.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DaHzKfBCthq0bP6xTOvopsvj/s5pg3x/24RJvgvfOK0=;
	b=fqFAlHDyIxgYJQDOZFJ9RwHGh/+djvOEONgSk9RGOKuc6szZK7jvzXLeoxIXQyFubd
	g5U9aGMq3sJkELkt+NF1qNtg1cpH9FU4yuAT2HnRQEbncDg+RHG4EpDxdfOlA+0a5Jqm
	iT7yOSdLBVbTA19r+lCy5FEW+3CqTNYBcbGX1PGVtBaLSAYC+zgRGZJq4ULMytvyOxMG
	Pn9ePYPdvJ0ssocsHv+2nD0DtaqGUgHNMM1fBWtG9265+woUmwQ+SKPslDx78w3kdbim
	CTXJhB39+SgxiL5aigfOVExlt9vSwreNahV9mxW/df4p+adJg6h9y0cQDjiWjqLprALo
	4ubQ==
MIME-Version: 1.0
X-Received: by 10.112.180.198 with SMTP id dq6mr8541487lbc.93.1425572327419;
	Thu, 05 Mar 2015 08:18:47 -0800 (PST)
Received: by 10.152.111.200 with HTTP; Thu, 5 Mar 2015 08:18:47 -0800 (PST)
In-Reply-To: <CAFoFrHYSHJfyWWfgaVGk6cukkVECzTv7TA+4Ur4BnfE2aC=mrA@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
	<CAFoFrHZnnK+SuTcVVn7JSZE_A0DKBy2+9R9wtubWBf5zupPhnw@mail.gmail.com>
	<081F4A97-C2A2-4221-9A7F-CFC1022D71A1@gmail.com>
	<CAFoFrHYSHJfyWWfgaVGk6cukkVECzTv7TA+4Ur4BnfE2aC=mrA@mail.gmail.com>
Date: Thu, 5 Mar 2015 17:18:47 +0100
Message-ID: <CAC1BbcRkNO_U+XFmzoLwDUV+7Gn8NC5-JUXOqfVTwHOt_osrag@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Thu, 05 Mar 2015 16:18:49 -0000
Content-Type: text/plain; charset=UTF-8

On 5 March 2015 at 15:06, Naresh Bhat <naresh.bhat@linaro.org> wrote:

>>>if d.getVar('TARGET_ARCH', True) == "aarch64":
>>>               return
>>>
>>>Does it make sense ?
>>
>> At least the parser should grok it.
>> The change itself does not make sense to me either way.
> I did this change because it does not make any sense to build the ISO
> image for aarch64 architecture.  The HDD image should be sufficient.
> Correct me if I am wrong.  I find a dependency of syslinux package to
> build ISO image (isolinux.bin).  I have skipped the syslinux package
> dependency @luvOS distribution.  The syslinux package contains lot of
> x86 assembly code. That's the reason I just want to skip the ISO image
> build for aarch64 architecture.

COMPATIBLE_HOST of syslinux should have prevented you from building
syslinux for aarch64 in the first place, no?

My assumption is that building this part of bootimg class for aarch64
is wrong, you should have gotten an error when you attempt to build
the HDD-image for non-i386 compatible targets.
So, maybe, NOHDD should be (automagically) set based on
COMPATIBLE_HOST or something like this?
But then i don't really see why your aarch64 is the first to encounter
this so maybe your config is just wrong instead?

Not my homework though ;)

thanks,

