Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16407C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:53:38 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.116310.1738677216186847194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=fOFmEn+2;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=FvitEwVrRMVZEmoiTAlAo3WKzr19eUF5d9ykuevdYQI=; b=fO
	FmEn+2H/fSVOZMPxlHlb3YSSbHXSBmAP0NqSagnBe5SKZJPIVSh3kR+RfDn7rTP2uvxLB+ivcEcF9
	K/rnQb9L10UGn9yBpxY7sJrPXEc4Z0IDZb1UTcQYzeUVRkdouABOc22Y8rQfyAaRAA919qt7YXK9p
	UyLCNML9j1gyVcra7uiDihLT0P3CxyPOgTgzi+uBX0rFiaGcx9Bk0W+BZ8eytlD8CtHWjfakhisje
	LRdfYnSw/QtyCZXZeBzx+F/3WyMYUyPSJ0Gy+FRTwbu/f+b0ggx0hbExaeLMRLEmVMPJ2ggDulrJ5
	UHnOeKlfKDscxdFRlCDFKCy6Uq8Ikawg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tfJMr-000Cou-33;
	Tue, 04 Feb 2025 14:53:33 +0100
Received: from [87.49.147.231] (helo=localhost)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tfJMr-0008gf-1w;
	Tue, 04 Feb 2025 14:53:33 +0100
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH scarthgap 0/2] Backport a couple of changes to
 overlayfs-create-dirs
Date: Tue, 04 Feb 2025 14:53:01 +0100
Message-Id: <20250204-scarthgap-overlayfs-create-dirs-v1-0-4a70d03db557@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0bomcC/z2NwQqDQAwFf0VybmBd21r6K6WHsL7VQFFJRCriv
 7v00OMcZmYnhymcntVOhlVdp7FAfakoDTL2YO0KUwzxFmK4siexZehl5mmFfWTLzskgC7hTc0b
 T5PaR7nUbhEplNmT9/g4v+sv0Po4TeWpW9HwAAAA=
X-Change-ID: 20250204-scarthgap-overlayfs-create-dirs-e33f78c6170a
To: openembedded-core@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Ross Burton <ross.burton@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738677213; l=816;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=PSC2J53JsGaWs1q7nkym/pEZ1GHQOVHf0Z4Rfo9wHVE=;
 b=Pw11Yfe7s0qjw1Ro1JO8WAe+UiWOiL3prwRk2yBPp1HZCf4g4PTDO95qfMJRakWmvngNPTT+J
 z49hft2uba1BFuMsViZew43j+0NaHmxxFDXeOaF5QkTlbyO2BQae0zO
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27539/Tue Feb  4 10:37:52 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210794

This is a backport of two minor changes to the
overlayfs-create-dirs.service file, improving the usefulness of the unit
description and thus log messages, and improving the unit depdency to
allow use with upper dirs placed in subdir of mountpoints.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (2):
      files: Amend overlayfs unit descriptions with path information
      files: overlayfs-create-dirs: Improve mount unit dependency

 meta/files/overlayfs-create-dirs.service.in | 5 ++---
 meta/files/overlayfs-unit.mount.in          | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 37835788d0772568f3551532eacbf810a4a6e47b
change-id: 20250204-scarthgap-overlayfs-create-dirs-e33f78c6170a

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


