Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EE4EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 12:42:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.10230.1687437741556585371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 05:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YjTIwx6b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687437738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1DNyLb3SBZ6aQ/0XIen6Bd50IGD7QDB7fY+goUQmMI=;
	b=YjTIwx6b05RHez5CoovjHQSTB9UMEDJ+8pD0KK660KrvQuCLYDNe3fU/CrM7PsR+9VwGbx
	51aUj7ypXi6uA+/947Z5fvfPffSI6xjSBTnhW9iB2UeKOwjz7YEzlRdwVzYmP16HmMFAQU
	eDQ0876wgPfgmG1MxgNWSZFkJ0dU4QeeB95Yd3udSCq76vpGXXPTEFwn3MqvlNZkNzs4v5
	caF2IF4QUYxNJG6lPUY449ldNmkEJ8UP5UgYt9S5uuIdkNEpSDqU+Y29F3oMXfIiXBLpzQ
	WDS9bB+h7wlreB8eLa5S7HrhsPgwrLz/sgWvO7p51rkCLDGHKN2qrDQuU964Gg==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FD1A1C0006;
	Thu, 22 Jun 2023 12:42:18 +0000 (UTC)
Date: Thu, 22 Jun 2023 14:42:16 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Andrej Valek via lists.openembedded.org"
 <andrej.valek=siemens.com@lists.openembedded.org>
Cc: andrej.valek@siemens.com, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v7 0/3] CVE-check handling
Message-ID: <20230622144216.18783d4b@booty>
In-Reply-To: <20230622065914.37448-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	<20230622065914.37448-1-andrej.valek@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 12:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183241

Hello Andrej,

On Thu, 22 Jun 2023 08:59:02 +0200
"Andrej Valek via lists.openembedded.org"
<andrej.valek=siemens.com@lists.openembedded.org> wrote:

> After discussion in all parallel threads we proposed following variant which
> covers both expressed requirements to have very small number of different cve
> statuses and also very large number of them at the same time.
> This is a compromise version which maybe is not ideal but deals with
> conflicting responses we got.
> 
> Changes compare to version 6:
>  - added conversion from CVE_CHECK_IGNORE to CVE_STATUS
>  - added comments for all statuses
>  - dropped "not-affected" status
>   - conversion showed that it is not very usefull
>  - added "disputed" status
> 
> Documentation will be updated in separated repository.

This patchset generates a lot of warnings when run on the autobuilders.
Here are a few:

WARNING: qemu-8.0.0-r0 do_create_spdx: Invalid detail cpe-incorrect for CVE_STATUS[CVE-2017-5957] = "cpe-incorrect: Applies against virglrender < 0.6.0 and not qemu itself", fallback to Unpatched
WARNING: qemu-8.0.0-r0 do_create_spdx: Invalid detail not-applicable-config for CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default.", fallback to Unpatched
WARNING: qemu-8.0.0-r0 do_create_spdx: Invalid detail disputed for CVE_STATUS[CVE-2018-18438] = "disputed: The issues identified by this CVE were determined to not constitute a vulnerability.", fallback to Unpatched
NOTE: recipe python3-calver-2022.6.26-r0: task do_create_runtime_spdx: Succeeded
WARNING: qemu-8.0.0-r0 do_create_spdx: Invalid detail not-applicable-platform for CVE_STATUS[CVE-2023-0664] = "not-applicable-platform: Issue only applies on Windows", fallback to Unpatched

WARNING: cpio-2.14-r0 do_create_spdx: Invalid detail not-applicable-platform for CVE_STATUS[CVE-2010-4226] = "not-applicable-platform: Issue applies to use of cpio in SUSE/OBS", fallback to Unpatched

WARNING: bluez5-5.66-r0 do_create_spdx: Invalid detail cpe-incorrect for CVE_STATUS[CVE-2022-3563] = "cpe-incorrect: This issues have kernel fixes rather than bluez fixes", fallback to Unpatched
WARNING: bluez5-5.66-r0 do_create_spdx: Invalid detail cpe-incorrect for CVE_STATUS[CVE-2022-3637] = "cpe-incorrect: This issues have kernel fixes rather than bluez fixes", fallback to Unpatched

For a more complete list you can look at the build page:
https://swatbot.yoctoproject.org/collection/17294/

All/most of the warnings are about CVEs.

I haven't looked in detail at what is the intended behavior of your
patch set, however I'm removing it from my testing branch for the time
being.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

