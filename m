Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B2ECA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:12:45 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web11.11468.1755263553550411383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=C+1G0hyq;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=315bbc237=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755263558; x=1786799558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+lDlO8+s4DwbE/12QE5+D4btf37GSON4xjzarAUCNz0=;
  b=C+1G0hyqU22pfytYzwTAbmn2a6JKcs4pmUff+C5UiqGOxq0Mc2FeCcx8
   mDAwbqckfyGjQ3NSjYXxQnp7+jTED+JPTDegjy8eUkt0RX9Khnl6G9cet
   eBIpszGvypByTAPO5RPFGWS7fGD5xioWBq54UDEg056jQCJWlkTm8Kima
   k=;
X-CSE-ConnectionGUID: N9gJCWc1QMuWEM07H/74TA==
X-CSE-MsgGUID: 3w/errnaSQeavFwyuJV63A==
Received: from 160.46.252.49.spf.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Aug 2025 15:12:38 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw6.muc with
 ESMTP/TLS; 15 Aug 2025 15:12:38 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb6.muc with ESMTP/TLS; 15 Aug 2025 15:12:38 +0200
Received: from marvin-ws (10.30.85.206) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Fri, 15 Aug 2025 15:12:37 +0200
X-CSE-ConnectionGUID: 2ICpOsW3SwWY5xxzqLMH2g==
X-CSE-MsgGUID: jInZm/b0TFiXrnPnisFMWQ==
X-CSE-ConnectionGUID: rDWHuaaWTBGjI1kddMtU6w==
X-CSE-MsgGUID: YeX/jPvAT+itAUa6UY3VWA==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 3/3] shared-mime-info: Handle USE_NLS
Date: Fri, 15 Aug 2025 15:04:40 +0200
Message-ID: <20250815130440.1402632-3-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815130440.1402632-1-philip.lorenz@bmw.de>
References: <20250815130440.1402632-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16e.europe.bmw.corp (2a03:1e80:a15:58f::1:147) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221974

Skip building of translations when NLS is disabled.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 .../recipes-support/shared-mime-info/shared-mime-info_2.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index 8790a9dc117..f307aca35dd 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -15,7 +15,10 @@ SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
 
 inherit meson pkgconfig gettext python3native mime
 
-EXTRA_OEMESON = "-Dupdate-mimedb=true"
+EXTRA_OEMESON = " \
+                 -Dupdate-mimedb=true \
+                 -Dbuild-translations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
+                "
 
 FILES:${PN} += "${datadir}/mime"
 FILES:${PN}-dev += "${datadir}/pkgconfig/shared-mime-info.pc ${datadir}/gettext/its"

