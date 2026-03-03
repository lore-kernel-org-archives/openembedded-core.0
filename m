Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2335AEDEBF5
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 20:41:24 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2623.1772570476880010358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 12:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=rtGk/fGI;
 dkim=pass header.i=@valla.it header.s=default header.b=URNE1gwQ;
 spf=pass (domain: valla.it, ip: 185.56.87.12, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-hpzk.prod.antispam.mailspamprotection.com; s=arckey; t=1772570477;
	 b=rQv1gdpAFexCdoU/0krLBPNrS8z4LkL6XY4sN5IZabPfynX0B9g4e8ETUuWPCms+HTzgYYgk8k
	  2YMkQsXoc39+AUQY1ZelOV+aoLal+TQMjCM5H698iOGKaK1ll0CAKL4GJiawR4dQJ1ltZGNAx2
	  0thLuArM3J70rQgC9ryxcZkBmbqBV0+8/+MKeIUwEB4ycigdLv2yW3kFkkH2OHV69DBeNS9QnQ
	  tYl2ZthDfeOm8yFyTZ6U0RtC9n8ufvxSFwhug0GohFZooOeWq5rWqeejnTaX9XBjPnHH7h4nA4
	  4DaGWBtCwBefaoelj9AYKOcrWMoifo4Rm2mp1o2JP5xVZw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-hpzk.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-hpzk.prod.antispam.mailspamprotection.com; s=arckey; t=1772570477;
	bh=z9shAe+oTnC17GkfZ3xxdLwYGx3tVSYJPGXgWPs+dCE=;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	  Subject:MIME-Version:Date:Message-ID:DKIM-Signature:DKIM-Signature;
	b=QWUVRxUFjBVGxaUzY9mfRTntKfvrQJdYyRyHnmn3QYJFha1B6+X0VPZateFM7032IBHetWMfiG
	  23C6mXli/heZACSmhGEl+NA5+WFQZYk1pJhbUo6UlyDAGRYmp+NopwygAmQd6xNbnhohAfeg+q
	  6PCzJcUewrpOV1KeFvJeEyJ1mUITSl9bgEno++ti9YUJOh7qoGzyyT0wrX6uZP+F+Rx2350ntD
	  WzNU2MGyDpGCOMTqQjnq732WH5A8mjHQVUTM3VF/X3DAPI55g0QuNMey9yrKk7aRYlaFMnoG7Z
	  a5+TWceqrYGxY2LneA4J3Glh4y574Ma+99Oy+X/2rzm0KQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:List-Unsubscribe;
	bh=H6zzZl3GiVdzKlHSzkHr0GCjfrHiEKDMsY55/GiqIl8=; b=rtGk/fGI4SGGDx31v/ZywLN85M
	86/0CAagSutSKzCBhsbHIFhCvH1f0r1cd6J9L6Qh7+Y0g3lUu0Gx/TIZX2ceXrMAoYpAy9mtM7kwn
	dR2Zo2r+i0jW7LZVgQhUy/JIPsKPA3eSbKWKj1G27iiLgr7Wg8L+BVgM37zHooba4LbI=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-hpzk.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vxWYK-00000000tW6-3DOM
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Mar 2026 20:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=From:Cc:To:Subject:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=H6zzZl3GiVdzKlHSzkHr0GCjfrHiEKDMsY55/GiqIl8=; b=URNE1gwQAk4OUtcjHw33PKWeA4
	ZXX317ThV8bFda8aPf3aT2wINzYbs8jWalt63pDUhNOSZBHsEpOJKUoVeblSN58uFcD+DWIN9mV72
	By4VZL49+h9hZwjO+Rz+12vXOjwx1w+x+ualH8704HJrsXw4/NNXpgMDof0AG46T/xNw=;
Received: from [82.57.88.19] (port=63803 helo=[192.168.178.65])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vxWYE-000000009a2-329u;
	Tue, 03 Mar 2026 20:41:06 +0000
Message-ID: <598ce0d0-90d5-4a14-a2b8-7d19c93af3c1@valla.it>
Date: Tue, 3 Mar 2026 21:41:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] kernel-fit-image: support arbitrary
 loadables
To: Trevor Gamblin <tgamblin@baylibre.com>,
 openembedded-core@lists.openembedded.org,
 Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
References: <20260301-fit_loadables-v2-1-2cf4cdf36a91@valla.it>
 <896a5439-cafb-41c7-b770-0d328cb5bf8b@baylibre.com>
Content-Language: en-US
From: Francesco Valla <francesco@valla.it>
In-Reply-To: <896a5439-cafb-41c7-b770-0d328cb5bf8b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 55dd41319f069d1a09cb72a76c2562bb
X-AntiAbuse: ID - 55dd41319f069d1a09cb72a76c2562bb
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vxWYK-00000000tW6-3DOM-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-hpzk.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 20:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232337

Hi Trevor,

On 3/2/26 19:00, Trevor Gamblin wrote:
>
> On 2026-03-01 16:17, Francesco Valla via lists.openembedded.org wrote:
>> Allow a user to insert additional, arbitrary loadables in a FIT image.
>> The loadables can be specified through the FIT_LOADABLES variable as
>> a list, with parameters defined by flags on dedicated FIT_LOADABLE_*
>> variables; they will be included in all configurations.
>>
>> Sensible defaults will be used for some parameters (type, compression,
>> description, arch, os) if the corresponding flag is not set, while
>> others (load address and entry point) will be omitted in the final FIT
>> image.
>>
>> As an example, the following configuration can be specified to add as
>> loadables a TF-A BL31 firmware and a (compressed) TEE firmware, to be
>> loaded respectively at 0x204E0000 and 0x96000000:
>>
>>    FIT_LOADABLES = "atf tee"
>>
>>    FIT_LOADABLE_FILENAME[atf] = "bl31.bin"
>>    FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
>>    FIT_LOADABLE_ARCH[atf] = "arm64"
>>    FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
>>    FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"
>>
>>    FIT_LOADABLE_FILENAME[tee] = "tee.bin.gz"
>>    FIT_LOADABLE_COMPRESSSION[tee] = "gzip"
>>    FIT_LOADABLE_TYPE[tee] = "tee"
>>    FIT_LOADABLE_OS[tee] = "tee"
>>    FIT_LOADABLE_LOADADDRESS[tee] = "0x21000000"
>>
>> Signed-off-by: Francesco Valla <francesco@valla.it>
>> ---
>> Hello,
>>
>> (sending this shortly after the v1 because that one had a wrong approach
>> to testing - sorry for the noise)
>>
>> this patchset adds the possibility to include arbitrary loadables in a
>> kernel FIT image and to define all associated parameters (description,
>> compression, type, arch, os, load address and entry address) through
>> variables.
>>
>> The idea behind the proposal is to be able to generate FIT images for
>> complex boot flows, in which components beyond the Linux kernel, its FDT
>> and an initramfs need to be loaded before the aforementioned Linux
>> kernel is up and running.
>>
>> As an example, the setup propose by Marek Vasut in [1] (boot of the
>> kernel through OP-TEE, with both components being loaded from a single
>> FIT by U-Boot) could be simply obtained with:
>>
>>    FIT_LOADABLES = "tee"
>>    FIT_LOADABLE_DESCRIPTION[tee] = "OP-TEE"
>>    FIT_LOADABLE_TYPE[tee] = "tee"
>>    FIT_LOADABLE_ARCH = "arm"
>>    FIT_LOADABLE_OS[tee] = "tee"
>>    FIT_LOADABLE_LOADADDRESS[tee] = "0xde000000"
>>    FIT_LOADABLE_ENTRYPOINT[tee] = "0xde000000"
>>
>> while a more complex flow I'm experimenting on (boot of the OP-TEE and
>> the kernel through TF-A on the i.MX93, with all components being loaded
>> from a single FIT by U-Boot SPL after verification) as:
>>
>>    FIT_LOADABLES = "atf tee"
>>
>>    FIT_LOADABLE_FILENAME[atf] = "bl31-imx93.bin-optee"
>>    FIT_LOADABLE_DESCRIPTION[atf] = "TF-A Firmware"
>>    FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
>>    FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
>>    FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"
>>
>>    FIT_LOADABLE_FILENAME[tee] = "tee.bin"
>>    FIT_LOADABLE_DESCRIPTION[tee] = "OP-TEE"
>>    FIT_LOADABLE_TYPE[tee] = "tee"
>>    FIT_LOADABLE_OS[tee] = "tee"
>>    FIT_LOADABLE_LOADADDRESS[tee] = "0x96000000"
>>
>> Being inside the FIT image, and part of all configurations, the
>> loadables can be in this way hashed and (optionally) signed and/or
>> encrypted with the same flow and key(s) already in place for the kernel.
>>
>> The generated FIT image is compatible with the U-Boot FIT "full" boot
>> flow, which loads any component part of the "loadables" group after the
>> kernel, the fdt and the initramfs.
>>
>> Regards,
>> Francesco Valla
>
> Hi,
>
> Thanks for submitting this. LGTM, but it'd be nice to have it 
> documented as well.
>
> Could you add some details to the Yocto Project docs (e.g. in the 
> "Variables Glossary" section) and submit it to 
> docs@lists.yoctoproject.org?

Yes, documentation here is pretty much necessary to understand how this 
shall be used.
I'll work on it as soon as possible.

>
> Thanks,
>
> Trevor
>
Regards,

Francesco


