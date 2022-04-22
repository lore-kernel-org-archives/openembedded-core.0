Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01488C4708C
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.6351.1650619973724927296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cqeWvJ6s;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F1641240008;
	Fri, 22 Apr 2022 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650619971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t1eNOaHACQMZtDa2JIy5zGA+LY/VYH4wXGPzWt7d9HQ=;
	b=cqeWvJ6suae8+Z7VgojYNSOjSmoLZeUaQx5+uZqlgz7tT1uJ6zA3NTtuNgEMoeeqdwf9ss
	49s8Czh/phYongTbtH4TVnT2Tx0iHWKcl9XgIBOt6osFJPIfYBJOWDPBC41kTVIR6On95n
	0rbcf65sEPUv2xkT6OuGbIatZPg+iOHmrgZaF4qbvwEaL1P7TD56NsapkuMSkQwZ8YzYL9
	jGqMaQENHP2PGW20DPTClPAX5mMARAseJydyk0nHJzZboxC3cD/1n6+PxUK7wjyWii/VgE
	+NxjhJqS2WP/m81WkWlcwnjyGcGlBwtvPZpGRTd3Z6lzYRzzbQw926Ohc18B4g==
Date: Fri, 22 Apr 2022 11:32:49 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Felix Moessbauer" <felix.moessbauer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, jan.kiszka@siemens.com,
 henning.schild@siemens.com, adriaan.schmidt@siemens.com
Subject: Re: [OE-core] [PATCH 1/1] Fix permissions when splitting rootfs
 folders across partitions.
Message-ID: <20220422113249.178338dc@melee>
In-Reply-To: <20220421160543.2718864-1-felix.moessbauer@siemens.com>
References: <20220421160543.2718864-1-felix.moessbauer@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164781

Hello Felix,

Il giorno Thu, 21 Apr 2022 18:05:43 +0200
"Felix Moessbauer" <felix.moessbauer@siemens.com> ha scritto:

> This patches ensures that the file database containing the file and
> folder usernames and permissions is always located relative to the
> source and not to the appended rootfs-dir.
> 
> Prior to this patch, the database was not found when using -rootfs-dir
> in the WIC script, leading to erronous file permissions and ownership.
> 
> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>

Autobuilder testing showed some errors, perhaps due to this patch:

  KeyError: 'ROOTFS_DIR'

See the full logs at:
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3450/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3489/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3431/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3482/steps/15/logs/stdio

Would you mind looking at what is happening?

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

