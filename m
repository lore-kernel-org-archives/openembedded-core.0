Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184DDC02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:53:38 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.116311.1738677216644261960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=FKnPzaEF;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NAKxdLUOQilPhGCeHExUo4F6V2F2+u+TBtOQkZUfzRE=; b=FKnPzaEFZG9XHr7Dn+2SZoHDba
	7/Wb5CFPxsSX0b3ptMJ8bpMpz6vQkjsQS1f+eaNx5x0dxtbFJKnF4IFtmQQsHOpBEHr2eAJ7P/h5h
	VxiHchNHWsF6hcdSKX3uk9+30Q0qDaPQofjQJK5cDxyNumkjLNlPAiTXvZPuM3IPJ8d0U3eCTX3dk
	9bHVUkRKJ73+w+gxozOto7vjLEohWFfm/ki2vUtzhVWjqsip3z9MlmMKjg8WU+eSt55DpcmG4mJck
	EA/MYByd6QtC7DmMIUkn0w0ymY0bVdxk556Ic8QWRG0j7n4N8kETsG1nVwJUta4JnAoWyJ9cVnrhE
	SatkPDJw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tfJMt-000CpE-0f;
	Tue, 04 Feb 2025 14:53:35 +0100
Received: from [87.49.147.231] (helo=localhost)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tfJMs-0008s6-2v;
	Tue, 04 Feb 2025 14:53:34 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 04 Feb 2025 14:53:03 +0100
Subject: [PATCH scarthgap 2/2] files: overlayfs-create-dirs: Improve mount
 unit dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-scarthgap-overlayfs-create-dirs-v1-2-4a70d03db557@geanix.com>
References: <20250204-scarthgap-overlayfs-create-dirs-v1-0-4a70d03db557@geanix.com>
In-Reply-To: <20250204-scarthgap-overlayfs-create-dirs-v1-0-4a70d03db557@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Ross Burton <ross.burton@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738677213; l=1381;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=9g0Ne3N0fGPWmQuPzZj8ie7+PuIOhxfsz7zjtMcCcI8=;
 b=5kuo7II9rQUWG3pNhP4KZELkGahB3v9wC9NHR7tA8xVzftRpw9Wnh4uew47CoSpodO/mRSOVv
 UQecWob+m3DAfVN68rYMoM2EDz/hgQpEaOI47JWnFNkrAUvBEB+bw1x
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27539/Tue Feb  4 10:37:52 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210795

The RequiresMountsFor configuration option of systemd.unit (added in
systemd version 201) not only adds the Requires and After options for
the required mount unit, but it adds them for all mount units required
to access the specified path.

So this change is both a simplification, and an improvement.

Not only will all needed mount units be added to Requires and After, but
the overlay path does not have to be a mountpoint, but can be at any
directory level beneath a mountpoint.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
(cherry picked from commit fa2422232a143b21aeea3728abca82100946dbc4)
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

-- 
2.48.1


