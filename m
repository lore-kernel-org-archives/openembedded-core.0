Return-Path: <wes@mitsi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760B4C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 21:10:38 +0000 (UTC)
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by mx.groups.io with SMTP id smtpd.web11.3067.1651525831081633646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 14:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mitsi.com header.s=mesmtp
 header.b=D9UviFEC;
 spf=pass (domain: mitsi.com, ip: 173.228.157.52, mailfrom: wes@mitsi.com)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 375B9195577
	for <openembedded-core@lists.openembedded.org>;
 Mon,  2 May 2022 17:10:28 -0400 (EDT)
	(envelope-from wes@mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=6mGNe+LpJ9Z4v1okCLPBKGEtRwTDELKJy648LG+o/6c=; b=xOJ6
	/ku7XKFgaYe/i8SuidQG8nA3WuIJBflb2b8BV+KbWTNJ3qgUy2c53pzpGFs+/H/C
	bkRKwcTzcTzfu/UB5YvsRg6HFNvjfYyYLlyZvX3iaO+I1QEDB/h5IUmi8obgpTKG
	kzjWD8e/Uxy73B6IIDBidrfiD4hL5UBLwu7XZFU=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 31896195576
	for <openembedded-core@lists.openembedded.org>;
 Mon,  2 May 2022 17:10:28 -0400 (EDT)
	(envelope-from wes@mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mitsi.com;
 h=from:to:subject:date:message-id:mime-version:content-transfer-encoding;
 s=mesmtp; bh=6mGNe+LpJ9Z4v1okCLPBKGEtRwTDELKJy648LG+o/6c=;
 b=D9UviFECJA2j/NAzzhLjYfOkQGI/AnPwA4RCV889Adz3W/iAoxc7wBiaEEGvNtIi7HTdDN0eYGDCZohombUaj83rPHl16kiJnWe1NU7FAmk+NtOGc7ZfnRUN3M+kK5ctOL2O5eZtqlis0wJpF7bH8Li+Emej46u+OFAED6kFNYo=
Received: from bigboss.lan.mitsi.com (unknown [24.173.0.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id C26E3195575
	for <openembedded-core@lists.openembedded.org>;
 Mon,  2 May 2022 17:10:22 -0400 (EDT)
	(envelope-from wes@mitsi.com)
From: Wes Malone <wes@mitsi.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rng-tools: disable libjitterentropy due to cpu usage
Date: Mon,  2 May 2022 16:10:00 -0500
Message-Id: <20220502211001.4183095-1-wes@mitsi.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Pobox-Relay-ID: 
 479ABDF0-CA5C-11EC-B4F4-C85A9F429DF0-78235051!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 21:10:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165175

Since updating to kirkstone from hardknott, after boot rngd maxes out my
rpi4's processor for minutes initializing JITTER. The sustained CPU
usage was triggering my resource monitoring alerts. Changing config to
disable jitter with -x jitter stops the initialization process and uses
just the pi's hardware rng source. Since that solved the problem I
disabled building rng-tools with libjitterentropy enabled.

I submitted the change to meta-raspberrypi (pull #1057) where kraj noted
that the CPU spike is seen even on qemu so the change should go in the
core layer.


