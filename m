Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ECBFD005D
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 10:45:05 +0000 (UTC)
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136073.1772361899951710163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 02:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=ka+sDvdl;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.246, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4FAB5822287;
	Sun, 01 Mar 2026 10:44:59 +0000 (UTC)
Received: from fr-int-smtpout29.hostinger.io (100-106-44-163.trex-nlb.outbound.svc.cluster.local [100.106.44.163])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id CEED2822034;
	Sun, 01 Mar 2026 10:44:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1772361898;
	b=PGY9Wt01RqPnKoHvs9iGkUDIzCWlHoiilnE7QplzHnB2tN0IyKN04M5h6WWfacAa1irqS1
	EtVt2rH9gY0vmO8yLOEcoVMcdSJBFyGC4gF17jKEwi3bDfEwXocGHnNVOGhCthQNp8F2vT
	O0oQuj92kh3JUA0TEJTJFxziK94O/H/g0/+wqqPQ4HromizzVY8q+auPFQbP67k/oFuSFj
	18xKK/G/9CFNVkcMT7NoO3HI/PZlamu1TTaXjeOaFx+JMIkKovA5sA7Qp6x9QpGRxzShan
	Pa37crGKfRYhXdJpUJhSDylbbz3Z8Z3hwTPyPuH/FVTROzLLG82U1AjAIY4Dkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1772361898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=vH1Y59DcVhxCdR4r5X5TBBwebaxRHb7TI0yzeHvLozg=;
	b=vBhkkx+pkC+swsgKsH/7VNdkBtMroP40nfqecwac9ZuFTzihng2bZIRgJgWsRj8Fwt16hP
	+9bIm8kLMktzqeAm8DrWlJo4F7bL9fhw+QgZ4GH10n+BTzHQPzTdDg8Ux0ui4vvpsqOzQg
	sR26SK8sev93e/zzFeovomb2rpHXqQl6//n43Eus1MQvkW3cHnxcZL1BYSx5k9YAiLZFUe
	FG6anzpznpQ3PWtuy48b5jLMzlVrBUCyflU27wBw7PPmXHxJ9UTp9ecgbp+auL+Z4bzNV7
	5W88/qkbjw3viQzpQFPi9C4oWKhBMTR4/2Ru7C1hoRUCO2hFsAEsN9mFsiXRFg==
ARC-Authentication-Results: i=1;
	rspamd-7f65b64645-vwtlk;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Descriptive-Stupid: 77e83dcc0b063f97_1772361899062_1651689774
X-MC-Loop-Signature: 1772361899062:2688698304
X-MC-Ingress-Time: 1772361899061
Received: from fr-int-smtpout29.hostinger.io (fr-int-smtpout29.hostinger.io
 [148.222.54.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.106.44.163 (trex/7.1.3);
	Sun, 01 Mar 2026 10:44:59 +0000
Received: from [IPV6:2001:861:4450:d360:ce17:18d4:cd7d:85d7] (unknown [IPv6:2001:861:4450:d360:ce17:18d4:cd7d:85d7])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fNzGb4cVfz2xgx;
	Sun,  1 Mar 2026 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1772361896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vH1Y59DcVhxCdR4r5X5TBBwebaxRHb7TI0yzeHvLozg=;
	b=ka+sDvdlJRYjTOlk5w7p79MwI70EigalgIKU/vzCDdeDo2q8XS22II6OVwN1sD6eDeX8Rc
	r3HzaWmdJOa9UBRpJhBQES8wi9IZnnnsaOhjLvN2aRuRQHVmeenbLfTy8zNlSjgT5TA4lc
	0ukT0pOTUWCLlDxICiLqCBCL+dWAoS0dqeRCsGdNrKEiBE+WZh5F5Gnz6BY2BN1mXPox90
	Y2BAGu9RG1+EnMd+9lYPNgOGfYJjX2cIyr3FYydx9QJ5sUQ8xKB8T5k2es0hVxN9lfR9FY
	6UA1maHAKkvYUO8boMJUY5p2Ks7i2VNC3Ygi2UN1Rpre1tWSw0D6fhVkjdpotw==
Message-ID: <d92e89bc-9abc-4a59-a59a-18de25747ee9@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Marek Vasut <marek.vasut@mailbox.org>,
 Usama Arif <usama.arif@arm.com>
Subject: Re: [PATCH 0/2] fitimage: add ability to include arbitrary loadables
To: Francesco Valla <francesco@valla.it>,
 openembedded-core@lists.openembedded.org,
 Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun,  1 Mar 2026 10:44:55 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69a418a8 a=tYUyu9Su+O64wtbcsxDTPw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=xvfqbYfxAAAA:20 a=d70CFdQeAAAA:8 a=G9VyFs9zu4Ai8fI2714A:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-CM-Envelope: MS4xfBV0BnWSeV/Tx1v6JmSTJLb0C7wYPwPtOnC+X2AkwNw3rTIFswVM1zHGbkRubFZBT2opfnXYY8poPJVDNC5d+pmPlbExufZIjNx6X70KGkQPnfp2olzD YCTQSZ5L5neUr+tO05o4KgNqLu8RF2QC0VZEjjTeNynQ8OiTdf+VtHrBovt7foXrVgLSA8xeV/LCfm4ZCI7Bz7jIFPI7VIB5UWxaOP3Du1ru9lC41edShuzH YSymnF06PorzeTXDaAYzU822vWgzxEhEvevGw73LUHtOi4sUUociMO5JUaxEVMDJKBZfmWywMxWtSwGxlQMDZEho0CSVxwuzFSpwfZuhK40b/Th3ZNQdlfXx buCtGhSpcaQ4cCm9O8smT5a/S6r4f6+W9dGyIZHcqvI5BcHvk8gtbDXQEguvVVpm5fot30SNUaDm/cKTiJVaEqEb8EP7n+F3s/ng4XIg0Q1SZVy8o76tnwLp DMkIr81tovbCEUh6Z5I5npgVTIUapyg8CX6ANlL4p7fGbW6h6LQWQutTBeE=
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 10:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232133

Hi Francesco,

Thanks for the patches!

On 2/28/26 12:37 AM, Francesco Valla wrote:
> Hello,
>
> this patchset adds the possibility to include arbitrary loadables in a
> kernel FIT image and to define all associated parameters (description,
> compression, type, arch, os, load address and entry address) through
> variables.
>
> Patch 1 simply extends the fitimage test infrastructure to allow
> checking for existence of node properties regardless of their values,
> while patch 2 contains the new functionality and associated tests,
>
> The idea behind the proposal is to be able to generate FIT images for
> complex boot flows, in which components beyond the Linux kernel, its FDT
> and an initramfs need to be loaded before the aforementioned Linux
> kernel is up and running.
>
> As an example, the setup propose by Marek Vasut in [1] (boot of the
> kernel through OP-TEE, with both components being loaded from a single
> FIT by U-Boot) could be simply obtained with:
>
>    FIT_LOADABLES = "tee"
>    FIT_LOADABLE_DESCRIPTION[tee] = "OP-TEE"
>    FIT_LOADABLE_TYPE[tee] = "tee"
>    FIT_LOADABLE_ARCH = "arm"
>    FIT_LOADABLE_OS[tee] = "tee"
>    FIT_LOADABLE_LOADADDRESS[tee] = "0xde000000"
>    FIT_LOADABLE_ENTRYPOINT[tee] = "0xde000000"
>
> while a more complex flow I'm experimenting on (boot of the OP-TEE and
> the kernel through TF-A on the i.MX93, with all components being loaded
> from a single FIT by U-Boot SPL after verification) as:
>
>    FIT_LOADABLES = "atf tee"
>
>    FIT_LOADABLE_FILENAME[atf] = "bl31-imx93.bin"
>    FIT_LOADABLE_DESCRIPTION[atf] = "TF-A Firmware"
>    FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
>    FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
>    FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"
>
>    FIT_LOADABLE_FILENAME[tee] = "tee.bin"
>    FIT_LOADABLE_DESCRIPTION[tee] = "OP-TEE"
>    FIT_LOADABLE_TYPE[tee] = "tee"
>    FIT_LOADABLE_OS[tee] = "tee"
>    FIT_LOADABLE_LOADADDRESS[tee] = "0x96000000"
>
> Being inside the FIT image, and part of all configurations, the
> loadables can be in this way hashed and (optionally) signed and/or
> encrypted with the same flow and key(s) already in place for the kernel.
>
> The generated FIT image is compatible with the U-Boot FIT "full" boot
> flow, which loads any component part of the "loadables" group after the
> kernel, the fdt and the initramfs.
This looks good!

I guess, I could use this mechanism to replace my "boot-bundle" recipe 
in meta-riscv 
(https://github.com/riscv/meta-riscv/blob/master/recipes-bsp/u-boot/boot-bundle.bb).

The idea implemented by this recipe is to add the compressed kernel and 
DTB to the FIT image loaded by the first stage bootloader (SPL), when 
using a vendor SPL with MMC support and a mainline U-Boot that doesn't 
have storage support yet. This way, the kernel and DTB are preloaded in 
RAM by the SPL.

Using your mechanism, I should be able to add the bootloader binaries to 
the kernel FIT image, to achieve the same result, but without a custom 
recipe :)
Thanks
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


