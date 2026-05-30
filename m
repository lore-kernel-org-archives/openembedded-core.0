Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B962CD5BD0
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 12:19:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5579.1780143538257485908
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 05:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1vp4yYU6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2488E4E42DA1;
	Sat, 30 May 2026 12:18:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC6C86073B;
	Sat, 30 May 2026 12:18:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8973410888CC3;
	Sat, 30 May 2026 14:18:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780143535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MahaIsnoZTjRym6MoUY7ajLe0uKjNNNMrm+iA7EDB4o=;
	b=1vp4yYU60J2tvwekubIeB26Wfc6Zc/Ve9XcFXHnf8cMOPV1XXjklRaRkAnasgBEwV6Xf/j
	Z59sT5bSduitnPrxqmGsxHY2oYLWRS4C+wLAZx8AAnsS3YWbmy41eh6b9tNiGb7eImQ6Sx
	EXgy7PEY1xJnsV6bvjqQ60rruKhOIB4LunB7RqxREYd/U9JO9opdB6r9O7HYiVKf+4maYi
	FhwYV0lKKYV3UExfZRkfIgyRiSSTH2X/6idvzK5lATmdl1hLQnDqpuZfEmVRJOT+NTOFhG
	fenJDarKf51/eY0vt6LU7UDVxlBAQ/A1f8QLCQBW5sHsFNHiWWvsTxTLa6s7Dg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 May 2026 14:18:51 +0200
Message-Id: <DIW07SLD8APO.2SRL8Q1GXY60P@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mengshi.wu@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bluez5: add patch to fix 8.56 gatt cache
 issue
Cc: <shuai.zhang@oss.qualcomm.com>, <cheng.jiang@oss.qualcomm.com>,
 <chezhou@qti.qualcomm.com>, <wei.deng@oss.qualcomm.com>,
 <yiboz@qti.qualcomm.com>, <jinwang.li@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260521062216.3352030-1-mengshi.wu@oss.qualcomm.com>
 <20f1b74e-69df-4f4e-8adc-bafcae25dfbf@oss.qualcomm.com>
In-Reply-To: <20f1b74e-69df-4f4e-8adc-bafcae25dfbf@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 12:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237775

On Fri May 29, 2026 at 6:06 AM CEST, Mengshi Wu via lists.openembedded.org =
wrote:
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored=
-gatt-cache-DB-Hash-value-no.patch
>> @@ -0,0 +1,84 @@
...
>> +          =E2=94=94=E2=94=80> gatt_service_removed()
>> +              =E2=94=94=E2=94=80> store_gatt_db() =E2=86=90 SAVED TO DI=
SK (hash is NEW)
>> +
>> +There is a timing issue to update DB Hash value.
>> +
>> +The gatt_client_service_changed() callback in src/device.c is called
>> +from service_changed_complete() in gatt-client.c, which is invoked
>> +after db_hash_read_cb() has already updated the hash. Adding
>> +store_gatt_db(device) here guarantees the db is persisted with the
>> +correct, up-to-date hash for both the addition and removal cases.
>> +
>> +Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
>> +---

I also note you are missing the Upstream-Status line in this patch.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


