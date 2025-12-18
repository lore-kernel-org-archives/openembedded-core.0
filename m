Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05289D6ACE5
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 10:46:54 +0000 (UTC)
Received: from mailrelay-egress8.pub.mailoutpod2-cph3.one.com (mailrelay-egress8.pub.mailoutpod2-cph3.one.com [46.30.211.183])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39097.1766054802146200558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 02:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=jVwr2Qw6;
 dkim=pass header.i=@berginkonsult.se header.s=ed2 header.b=PgbTlct4;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.183, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1766054799; x=1766659599;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=FK06RvwRgLrYlp1f0OBaFGdLI8CaUxukpemliPGkB94=;
	b=jVwr2Qw6aSSEceopLgd2lvJ4SYYqJs8fFDTkGUc4txGS2t6FYX0lJAhCG7sTkwR4j0Pnf6BR52eqF
	 k4axAKEJQ6okZC5olZhJf6SarqDqyZvjIdd1k1aixTD54s+lJUb3tZ7IWkTcmoRbSojbcKoIgDj5QV
	 et7WMTVSRQCUGBGSfiaZmg/LGSTWK+Japf+z4oS2KATPuNrwPiJ6+s4LpKowWhE5qttUrFL6YwgjyM
	 s9psmuxkuxLH98LySeJNIwHF9yYZhkh9qLk4802RuUqW5+60LEKOf0gWGvUw1Cv7Sw1XotyGDSW2f/
	 YUT8vQ9ri1nbSPjzNzG1Hxzlv2H3XQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1766054799; x=1766659599;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=FK06RvwRgLrYlp1f0OBaFGdLI8CaUxukpemliPGkB94=;
	b=PgbTlct4TW/Cwy/CJsqrP0GeHj0Q073hXd8NLlpQEwQ/R3QKg6dtDfdZ+s/jGxgNup8hNPyEpjh5m
	 buLlCQOAQ==
X-HalOne-ID: d226363f-dbfe-11f0-b45f-d510462faafc
Received: from pbergin-7420.. (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id d226363f-dbfe-11f0-b45f-d510462faafc;
	Thu, 18 Dec 2025 10:46:39 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] go.bbclass: disable workspaces
Date: Thu, 18 Dec 2025 11:46:34 +0100
Message-ID: <20251218104634.95116-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 10:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228109

go has a feature of workspaces [1]. If there is a file called go.work
in your working directory on any of its parent directories that will
be read and used during build. For OE where the builds shall
be sandboxed this is bad as a workspace file outside of the build
environment can be picked up. This commit wil disable that feature
according to the instruction in [1].

This was found and introduced build failures when a file go.work was
in the parent directory outside of OE build directory.

[1] https://go.dev/ref/mod#workspaces

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/classes-recipe/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index c323d4c9c93..b540471ba2d 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -24,6 +24,7 @@ export GOARCH = "${TARGET_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOHOSTOS = "${BUILD_GOOS}"
+export GOWORK = "off"
 
 GOARM[export] = "0"
 GOARM:arm:class-target = "${TARGET_GOARM}"

