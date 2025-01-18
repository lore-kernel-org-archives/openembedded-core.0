Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADDAC02185
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 18:50:20 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.1047.1737226214133190370
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jan 2025 10:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=odHksYCE;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=sr9qPTXFMtOQQBYnYfxshL/dqdhesUPFtTLVtdJHM0Q=; b=od
	HksYCEXbTiRnjB7AixwPjQbLQwe8CNdsdouOO+3x6YPOOM8iuOoqTq7ElbmG3cw/mAFEmITX1IOnC
	f8i3+CRszUt+66RCfxggovNuodNIRDX9nMliz5wGTcyUuP1rp8fmtJ7ID6V3KwtOM8E57P3Z77Rz+
	UQ9f20bg0uEeNZbjE3EjofhVUuFAbdjv6fnMZNgcOfJmQL/rqsQ0QkZ3C6KTqpX5v9V5CM/LOHv/i
	sTVL/MAe11wuzmoyhYPbMuy6I3RxYAEko1KfFCAiRHup8Ru8oveW3NkpWgR94uPmQn5aM/1u1YRKK
	AqXRdQJ97VwwfiiWURiybFPnzM5y/wwA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tZDtc-000PfF-0V;
	Sat, 18 Jan 2025 19:50:12 +0100
Received: from [87.49.147.251] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tZDtb-000Pyt-2u;
	Sat, 18 Jan 2025 19:50:11 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Sat, 18 Jan 2025 19:49:55 +0100
Subject: [PATCH] files: overlayfs-create-dirs: Improve mount unit
 dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-overlayfs-requires-v1-1-8f3eafdb54d0@geanix.com>
X-B4-Tracking: v=1; b=H4sIANL3i2cC/x3MSQqAMAxA0atI1hZscb6KuKg11YA4JChK8e4Wl
 2/xfwBBJhRokwCMFwlta4ROE3CzXSdUNEaDyUyRaV2r7UJe7ONFMR4nMYpyzuRNrX1ZNQPEcGf
 0dP/Trn/fD3VFDVRkAAAA
X-Change-ID: 20250118-overlayfs-requires-cc24981f679b
To: openembedded-core@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737226211; l=1345;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=j86C4SYGTJlqK6ZtN6Fz2BHJ49FDlyGnppA/V2KrA5g=;
 b=IKxrqH9fbU9pCQMtQKREmEeYDN/KaFEyjYCIDuvLbuE7rcULEWSZzzh33zpbyapvKFDAgynLr
 zK/V0FBc0JqCUZ9VM0zagjltqgKOoaorNqLAQLZ0+84OQJFffEQbY4D
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27522/Sat Jan 18 10:34:20 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jan 2025 18:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210001

The RequiresMountsFor configuration option of systemd.unit (added in
systemd version 201) not only adds the Requires and After options for
the required mount unit, but it adds them for all mount units required
to access the specified path.

So this change is both a simplification, and an improvement.

Not only will all needed mount units be added to Requires and After, but
the overlay path does not have to be a mountpoint, but can be at any
directory level beneath a mountpoint.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta/files/overlayfs-create-dirs.service.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
index d8d916365a4562dbe522eca9f291a9a4c859f7d9..c8431548d76d18b8dfafd5a69d18f25b6629cc4f 100644
--- a/meta/files/overlayfs-create-dirs.service.in
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -1,7 +1,6 @@
 [Unit]
 Description=Overlayfs directories setup {LOWERDIR}
-Requires={DATA_MOUNT_UNIT}
-After={DATA_MOUNT_UNIT}
+RequiresMountsFor={DATA_MOUNT_POINT}
 DefaultDependencies=no
 
 [Service]

---
base-commit: f642edb006a8c16dbe45681afe547eabfae17073
change-id: 20250118-overlayfs-requires-cc24981f679b

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


