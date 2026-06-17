Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D01ECD98F7
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10214.1781682330047987832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YamoTP3M;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4624c1409c9so391660f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682328; x=1782287128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E79dQRqkBoQJNGiBypunlId49I9N2UvUtBtubF7aNk=;
        b=YamoTP3MvY7ya7XSC+isry/RppAmF82HTYX/Ir/RbPiDz4deLH76FnzSafxNWND5w6
         Jh+jrhbFNqA/7Q73nk9k5qrnp1zncBie6Iu0PkYC3ZZ7u/e0T2M97T3lEN6ehYECbhaS
         FeW3hbrkBY/Qx5QEOJJhFagZOSvJGYpodHLOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682328; x=1782287128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1E79dQRqkBoQJNGiBypunlId49I9N2UvUtBtubF7aNk=;
        b=oTBCpL5f5IfrPun+uOZuOT8GxFSvZs/GrYk4TIxGbXlDuhAoEncD5krOF9AxvSj4Sh
         TmZRTnI1/2oA1HmCI23SnXeFJKtxl4KC9Cligteeft2dY+9VUhgn4DnW//XmIqokmw7I
         n+U1D9X3HcXj0HcbxDWtacIyPXlUTNA1Wi8pfsMKQTCb+uFmVpDJ7ZVUeOnXZRQ0Zwqg
         wRfw2HK9Re6/O5TO4woAW/gjdP0y6LiGvLT2ALkAe6hnfDwrkGRV8tKaR/UFYudA7BjQ
         a3nm0TTXFHFjitbpP18fl3bFpcydTF7kELVamLRnGGhAipQH9nd1RjsdcQZ5XkiNwyjZ
         ddfw==
X-Gm-Message-State: AOJu0YyUfXq/F/lJMFOndcJm5PfVwdAZyWdT1Eu1XVOt70jK4ev/k4aJ
	NEdprAla+I5FcuJMKKGQCx813F4I153cyfCYCCbyfCE0jDDUMHMHP+pm3HW9v7CAeUKkR/sqqn8
	/JbiP
X-Gm-Gg: AfdE7cnbC+SnpAQ0o9gLwJHcKnqLX7dfGJq/eeKm8DRk2v6jXG/1iC4570gStpjlOHv
	Nh8faHf13zzHOnGJFqOL2H4szxgaC1r17ZtWrmHrde/9LQXyMObPW99TUO50YaBtYkYA+bR5kNh
	qgb9Adx81e+vaa5mTbYQjY3VPhhYi5jBqyqwh2qzUPHo1RWLJt8xmsfViJwb8djBoedOkFb2Ix/
	pTFsSyjdGFCMUhM0ahhHFsNqWlZH/97NMJxYvFPb9d2JZC2i4mWmQ5ayrNeIZxDryzaPZb97MG9
	gXOruhNh+VVIDl8+rlkBhHcLcG/+dNUn6EZCcYsps+VimR425HFfJTBbFKzgVKMH8k98NTmUN2u
	fwVwAuV7qJzP2EtguakQqgD8ApgD7jdAcpktlYYzs8h6iX46z6657XYrixKgftqzJ95NB31y1bX
	GUkmBH5bBHEzuDxYZdKxTxm7jX1bbirhPFmfgq+Pgco70J+we5K18Z/kgDXcwfnvFXa5WS2jp5h
	XeNbFD121s4A5oEwA==
X-Received: by 2002:a5d:4812:0:b0:452:6aa0:1d11 with SMTP id ffacd0b85a97d-462368399b4mr2906584f8f.19.1781682328215;
        Wed, 17 Jun 2026 00:45:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/30] avahi: Remove a reference to the rejected CVE-2021-36217
Date: Wed, 17 Jun 2026 09:44:39 +0200
Message-ID: <128af716be75ec76203f1d34a8448741e6573d9e.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238986

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

CVE-2021-36217 is rejected, and should no longer be referenced.
CVE-2021-36217 is a duplicate of CVE-2021-3502 which is already
referenced in the local-ping.patch.

The CVE database indicates the following reason:
  ConsultIDs: CVE-2021-3502. Reason: This candidate is a duplicate of
  CVE-2021-3502. Notes: All CVE users should reference CVE-2021-3502
  instead of this candidate. All references and descriptions in this
  candidate have been removed to prevent accidental usage.

(cherry picked from commit bf41240132e2efa6b46aab46290eed9c53e312e9)

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/files/local-ping.patch | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/files/local-ping.patch b/meta/recipes-connectivity/avahi/files/local-ping.patch
index 29c192d296e..8f102815df0 100644
--- a/meta/recipes-connectivity/avahi/files/local-ping.patch
+++ b/meta/recipes-connectivity/avahi/files/local-ping.patch
@@ -1,4 +1,3 @@
-CVE: CVE-2021-36217
 CVE: CVE-2021-3502
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>

