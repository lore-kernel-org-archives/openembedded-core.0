Return-Path: <primoz.fiser@norik.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CFBC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 05:56:02 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by mx.groups.io with SMTP id smtpd.web10.13094.1719813356103643337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 22:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norik.com header.s=default header.b=Ir5fAy16;
 spf=pass (domain: norik.com, ip: 46.19.9.99, mailfrom: primoz.fiser@norik.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fY14qS2mz47qoLVd/j875N9lGqo4K/11mmC1TUaLyBc=; b=Ir5fAy16CJuNV6Tpfnj7/+uW9I
	yP3SGM8z8cKQ4LdU9Hp9ItX6orjYTrUO6Iq/NFygwmt7pQWiALfI1uMH7Rhqx1rFSdF68EgUO0tIn
	iDyJ4PPiNu6MTEKrnVB3YVMeZTN4JKsvHidsm0DMqP7QKcjihUqnLvwoi6lnvx/7EFglrA3CnDzav
	qycYYSdR/VmYE/4n4sXHyQMtYEGSg7tNuJQMko0PmEDsUd0Q/mQ75R+qtYC3VTffeq2XL+Cuo8n2h
	IAT3A002QO2ZtA1AtN2YdWQRejWl9GvI4EVl7QA2IFRLcxRIFAhW+0ahiw9OX06+Fz1n2uZhjgj0E
	thV8aknQ==;
Received: from [89.212.21.243] (port=37874 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1sOA14-00Ddjc-2a;
	Mon, 01 Jul 2024 07:55:54 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: openembedded-core@lists.openembedded.org
Cc: upstream@lists.phytec.de
Subject: [PATCH 1/2] pulseaudio: Add PACKAGECONFIG for optional OSS support
Date: Mon,  1 Jul 2024 07:55:52 +0200
Message-Id: <20240701055553.2851418-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701055553.2851418-1-primoz.fiser@norik.com>
References: <20240701055553.2851418-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 05:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201276

Add pulseaudio PACKAGECONFIG for optional OSS (Open Sound System) output
support. OSS was a sound system available before ALSA and has since been
deprecated. Lately, this part has started causing build issues when used
with GLIBC_64BIT_TIME_FLAGS. Thus, by default drop OSS output support in
favor of Y2038 compliance.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 9fb5c81757da..bfd57c8e21f0 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -124,6 +124,7 @@ PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
 PACKAGECONFIG[webrtc] = "-Dwebrtc-aec=enabled,-Dwebrtc-aec=disabled,webrtc-audio-processing"
 PACKAGECONFIG[ipv6] = "-Dipv6=true,-Dipv6=false,"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,"
+PACKAGECONFIG[oss-output] = "-Doss-output=enabled,-Doss-output=disabled,"
 
 export TARGET_PFPU = "${TARGET_FPU}"
 
-- 
2.25.1


