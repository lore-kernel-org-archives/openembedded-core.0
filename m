Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E06E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 14:13:01 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.20380.1736345571453919562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 06:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=VU0bOTeR;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=YOE7Tkv7ptbPVjLVkhd8MNqmQ5UDh9CUS82uJ5LGRkw=; b=VU
	0bOTeRQxQBV9+jo3xTZVQmrl0dDWWQ8zvQSOaMLHs+J9/5yeDqaQGTGCaOrrK+3DgxirUwv8s6+Tv
	jd4cUsc0jdAMGh6o+PwEUrGQLV9Dqbw7oZ+hAqQyscvL5yTsSuP0TN4+RMa695pb6L/6SGtL9HJLq
	Qv+AHX7Ydm/5utU+uZ5x3GpsCSw4nB/52rHCrf3GHJIASQuHdHsHnd+uzfKrRx7mCLgSv23PxceVg
	guyEW3jrDU29zvHkkmDz8yt1kaorRoaULU88x2HY5Rn4TVaKtdsEy01Csq3A65jytX6lon3uQK84D
	jTsK7vMrDXqzK1m5k8fYEIH23xuL3PJA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tVWnh-000PAq-2U;
	Wed, 08 Jan 2025 15:12:49 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tVWnh-0008Jx-1l;
	Wed, 08 Jan 2025 15:12:49 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 08 Jan 2025 15:12:31 +0100
Subject: [PATCH] pulseaudio: fix webrtc audio depdency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-pulseaudio-webrtc-v1-1-48a702fca2fc@geanix.com>
X-B4-Tracking: v=1; b=H4sIAM6HfmcC/x3MTQ5AMBBA4avIrDWp8RtXEQvMYBJBWkXS9O4ay
 2/xngfLRthCm3gwfIuVY4/I0gSmddgXVkLRgBpLnelGnW6zPDiSQz08mmtSWKOmGqmocoLYnYZ
 nef9n14fwAUjCZvVjAAAA
X-Change-ID: 20250108-pulseaudio-webrtc-2720d72d463d
To: openembedded-core@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736345569; l=1709;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=531RpOi7HIE7Y1AOBRkV907lYqN+2FOQ1rT3rUYshbU=;
 b=qME0dHBQ/PZYXYXM/rxPVStJ/qdcpo11eIjq75mxW49Cvj6NTpVQ4sjEFDKwToPy0xAEi4SFm
 GsRCp/tt+ZQDj8ybjAth/39y7kaLvbER9PqpxQ4wh/w/ThZscYJ3ENr
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27512/Wed Jan  8 10:41:20 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 14:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209561

Since pulseaudio v16.99.1, the library needed is webrtc-audio-processing-1.
This fixes

Run-time dependency webrtc-audio-processing-1 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency webrtc-audio-processing-1

../pulseaudio-17.0/meson.build:730:15: ERROR: Automatic wrap-based subproject downloading is disabled

The library is available in meta-openembedded/meta-multimedia.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index bfd57c8e21f0911abdc7c85d5f2bafba11a3b508..18c12ede630766bb9204bb1d5efb7cea8695dd1e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -121,7 +121,7 @@ PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack"
 # able to use pulseaudio autospawn for root as well.
 PACKAGECONFIG[autospawn-for-root] = ",,,"
 PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
-PACKAGECONFIG[webrtc] = "-Dwebrtc-aec=enabled,-Dwebrtc-aec=disabled,webrtc-audio-processing"
+PACKAGECONFIG[webrtc] = "-Dwebrtc-aec=enabled,-Dwebrtc-aec=disabled,webrtc-audio-processing-1"
 PACKAGECONFIG[ipv6] = "-Dipv6=true,-Dipv6=false,"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,"
 PACKAGECONFIG[oss-output] = "-Doss-output=enabled,-Doss-output=disabled,"

---
base-commit: 06f72780010ea628ade2c3838a05c5966750cc2e
change-id: 20250108-pulseaudio-webrtc-2720d72d463d

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


