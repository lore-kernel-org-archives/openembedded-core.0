Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE33C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 09:16:12 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.33338.1737364564968314759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 01:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=AbhLEfMn;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=fg2FpFOxYcScCFy8JXB9ENWEPckDeHc0BZklcwQWaA4=; b=Ab
	hLEfMnbj1cL1MuLsEapKpH026SIVHaDMHHlGmyN/Io0tRQNUe7/5XhaoDVPDG2OAAEykMlywntHn9
	2MEMoVYJ74P/fuWJVj+vGixxFbNplVAl68R75fB2xge2/qYz2ufVDsBSMZ3cGdvRNeZHoTd0yb8ar
	vCKYwxG5/bwAngUD7IGWOvi0DlRsTlyQTNU4t4v0Zp/p0qsIdL6pPETv7hSo5Njz8OpEPLd/sYq4X
	FNOkM+aJSpswA8vzEhS99YCnGfCTMJdr/W3C4b57T6WHWgQqlcylNu4/3tXgOnqX19G5StKLdw46N
	PM54Jhd39ekJC9ee39WjpnmBC2kfWdwA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tZnt4-000PE0-2p;
	Mon, 20 Jan 2025 10:16:02 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tZnt4-000OhT-1w;
	Mon, 20 Jan 2025 10:16:02 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 20 Jan 2025 10:15:51 +0100
Subject: [PATCH scarthgap] pulseaudio: fix webrtc audio depdency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-pulseaudio-webrtc-scarthgap-v1-1-a440293635ed@geanix.com>
X-B4-Tracking: v=1; b=H4sIAEYUjmcC/z3MQQrCQAxA0auUrA2kg87Cq4iLNBPbgLRD0qpQe
 ncHFy4ffP4OoW4acO12cH1Z2DI39KcOZOJ5VLTSDInShfpEWLdnKG/FFnzr4KtgCPs6jVxxEKI
 zZeFcMrRDdX3Y53e/wT+D+3F8Ab0HSpd4AAAA
X-Change-ID: 20250120-pulseaudio-webrtc-scarthgap-bc00406ca6d6
To: openembedded-core@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737364562; l=1835;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=m0Es2KS5BzkEBKJJ+vGjPkqA6YA9V5ZIQBC9UVEPEuc=;
 b=YsELFjJh+WVzjRK/3uvHjEIwRBqaLThF14YYSvNjc98LB1rCJDnq9Qcjqxz5gO2l4lgGxquOu
 9/e3SEu8VI9CYkXxzi9zFD8hiI5wtTk0fGbTp3/KNLXJLTu4zBEUoCJ
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27523/Sun Jan 19 10:40:50 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210024

Since pulseaudio v16.99.1, the library needed is webrtc-audio-processing-1.
This fixes

Run-time dependency webrtc-audio-processing-1 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency webrtc-audio-processing-1

../pulseaudio-17.0/meson.build:730:15: ERROR: Automatic wrap-based subproject downloading is disabled

The library is available in meta-openembedded/meta-multimedia.

(cherry picked from commit 4661c49eb4f0ed89a3d027d9a003c40744baaf38)

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ae16056d24344367ad284c3c12b4c3e922a8f9d2..1ab38315199fa749e5c93977d1a4c2bb2e96e73a 100644
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
 

---
base-commit: 92eea72a25e553c698bee9e3f551a5880bd4631c
change-id: 20250120-pulseaudio-webrtc-scarthgap-bc00406ca6d6

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


