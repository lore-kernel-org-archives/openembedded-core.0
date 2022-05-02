Return-Path: <wes@mitsi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77237C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 21:10:38 +0000 (UTC)
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by mx.groups.io with SMTP id smtpd.web08.3065.1651525834035374113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 14:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mitsi.com header.s=mesmtp
 header.b=y1o6gHXV;
 spf=pass (domain: mitsi.com, ip: 173.228.157.52, mailfrom: wes@mitsi.com)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 90D2E19557F;
	Mon,  2 May 2022 17:10:33 -0400 (EDT)
	(envelope-from wes@mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=RBRt24hAtNU3kw5uEbZsrgIPL
	z1fQ9vxjoV2OoIyI3c=; b=ONqMP0y8nh1sAoek8VZ9yf/CH8WGLgNgKuVA5JNUt
	gXfwVzbAT/qV+1OQa3Fi/iGjTxh4h40rxrO2ToDDsje4yIML92WW05aErDXP2OuS
	qoHH0OeSp3WvoFTf+q4mZQkt68xvNttRG2Mp+/rmWmLLY/laQVrUOOZPu7gaF6fG
	hg=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 8A59519557D;
	Mon,  2 May 2022 17:10:33 -0400 (EDT)
	(envelope-from wes@mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mitsi.com;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding;
 s=mesmtp; bh=6rpEPUor3lUt7gM5SQgq+pbD+zk5JnvAZXV25oD+4tQ=;
 b=y1o6gHXVy8Erx3y1om6epBr43OKV+cpn+Y8VVTWBBNIh+dePMF1Buz/dsQezBIrI2lZRGN7taaS3AA+4X4lZBEBjMlkKvg8dAzEv9egKHHNiDYmN3yaiM8CKmg6MXgYx8TnVJKdzoTADVQMfWq/MNaITX+vctDmGthRuXHD0krY=
Received: from bigboss.lan.mitsi.com (unknown [24.173.0.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id C053D195578;
	Mon,  2 May 2022 17:10:28 -0400 (EDT)
	(envelope-from wes@mitsi.com)
From: Wes Malone <wes@mitsi.com>
To: openembedded-core@lists.openembedded.org
Cc: Wes Malone <wes@mitsi.com>
Subject: [PATCH] rng-tools: disable libjitterentropy due to cpu usage
Date: Mon,  2 May 2022 16:10:01 -0500
Message-Id: <20220502211001.4183095-2-wes@mitsi.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502211001.4183095-1-wes@mitsi.com>
References: <20220502211001.4183095-1-wes@mitsi.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 
 4BD0A25E-CA5C-11EC-829D-C85A9F429DF0-78235051!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 21:10:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165176

After boot rngd maxes out the processor initializing JITTER entropy for
some minutes. Here we disable libjitterentropy in favor of only using
the hardware random source via config.

Signed-off-by: Wes Malone <wes@mitsi.com>
---
 meta/recipes-support/rng-tools/rng-tools_6.15.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/reci=
pes-support/rng-tools/rng-tools_6.15.bb
index 0696351903..4eed060960 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -21,7 +21,6 @@ inherit autotools update-rc.d systemd pkgconfig
=20
 EXTRA_OECONF =3D "--without-rtlsdr"
=20
-PACKAGECONFIG ??=3D "libjitterentropy"
 PACKAGECONFIG:libc-musl =3D "libargp libjitterentropy"
=20
 PACKAGECONFIG[libargp] =3D "--with-libargp,--without-libargp,argp-standa=
lone,"
--=20
2.36.0


