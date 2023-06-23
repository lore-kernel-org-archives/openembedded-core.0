Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BD1EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 09:32:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.38445.1687512731286218618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 02:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IHL69RQK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687512729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7ue4FTAaAAVDuWIKL5KMlFHg0SeXtwIM/NX7oroSsM=;
	b=IHL69RQKr8taebMUFEzSz6F2nodw0TaCep78x62HnzCJ6SNE3kNyN0+9Yfwrqs7BlXzyk/
	7OlIqnnD/3AyOo1oroa3azzMRG5mE4cnZivgLZZFZXA01NScPEyfZI8vBLjOyNt1q3Xl5r
	hnFCw7piRQqf8xJ+j5Ax6adT9jE7EHlBgBmH/ap5tC+s1RLXvAZ9bEmx78I7NRwcwWh31g
	FC1g4BohLXVob+GgxvO6vuvrSFQMWcoh9R0DLMYf6SoiXVGUU4WSgVh07+/fDEh93HU4Cj
	JhIMRolXGGDpRbknsiY+sSIzVeQCFoNM0ZDtaI7zcmfvMlChMntd0yoPP381zg==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0F151BF212;
	Fri, 23 Jun 2023 09:32:08 +0000 (UTC)
Date: Fri, 23 Jun 2023 11:32:07 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Peter Hoyes" <peter.hoyes@arm.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com,
 richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v2] rootfs-postcommands: Set vardeps for
 write_image_test_data
Message-ID: <20230623113207.15b8da6c@booty>
In-Reply-To: <20230622163413.839916-1-peter.hoyes@arm.com>
References: <20230622163413.839916-1-peter.hoyes@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 09:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183313

Hello Peter,

On Thu, 22 Jun 2023 17:34:13 +0100
"Peter Hoyes" <peter.hoyes@arm.com> wrote:

> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> The testdata.json file generated as part of the rootfs postprocess
> commands currently contains almost all Bitbake variables and is used by
> OEQA test cases to inspect the build environment. However only a small
> number of variables are actually used and the testdata.json is not
> automatically updated when the variables are updated.
> 
> Introduce the TESTIMAGE_EXPORT_VARS variable to explicitly define the
> variables to be collected for testdata.json and populate with all
> variables used by runtime tests in OE-core. Use this variable to set the
> vardeps of write_image_test_data.
> 
> Modify export2json to take an explicit list of keys to export, instead
> of exporting everything in the datastore.
> 
> Add a demonstrative OE selftest to rootfspostcommandstests.
> 
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>

This patch is triggering some failures on the autobuilders:

Exception: TypeError: export2json() missing 1 required positional argument: 'json_file'

Some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/7744/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/7744/steps/16/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

