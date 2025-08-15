Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90666CA0EE8
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:12:45 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web11.11468.1755263553550411383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=lv+07UYq;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=315bbc237=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755263556; x=1786799556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qfgbVX2L5k2RSnJOhIoY30QUdzmAWha1GbBAOj4nees=;
  b=lv+07UYqH7CsL/x2ecNDXlVQh7ZOweVJXZHKlvXtSnKWsHdm5ACFhWRS
   sUMh9mP43Q4jD9ckSbS6n2LDOAdJXhyJ3FTissAzjRrvCEztFYX6r9Y41
   NlVjqLNdoX2BoqzdBIYxMoDibkcpuxc2ksLCnmqnPjMQwSi7y2RNTh3dK
   E=;
X-CSE-ConnectionGUID: N9gJCWc1QMuWEM07H/74TA==
X-CSE-MsgGUID: xbgY1hMjTkKEToRzM9lMvg==
Received: from 160.46.252.49.spf.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Aug 2025 15:12:36 +0200
Received: from unknown (HELO esabb5.muc) ([10.31.187.136]) by esagw6.muc with
 ESMTP/TLS; 15 Aug 2025 15:12:36 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb5.muc with ESMTP/TLS; 15 Aug 2025 15:12:35 +0200
Received: from marvin-ws (10.30.85.206) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Fri, 15 Aug 2025 15:12:35 +0200
X-CSE-ConnectionGUID: CrqhzpkqQPOmvcIIQIp70g==
X-CSE-MsgGUID: xR5pXQAIQ5O7eX9BTXCR/A==
X-CSE-ConnectionGUID: CUBq7JPtRXG4YcQJ9LDWkQ==
X-CSE-MsgGUID: e/eIs9ECTHiGpYcIuYUQIQ==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 2/3] p11-kit: Handle USE_NLS
Date: Fri, 15 Aug 2025 15:04:39 +0200
Message-ID: <20250815130440.1402632-2-philip.lorenz@bmw.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221973

Disable NLS in the build when USE_NLS is off.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/recipes-support/p11-kit/p11-kit_0.25.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
index d60e4abdaf1..1c982a2aab2 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
+EXTRA_OEMESON:append = " -Dnls=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'}"
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES:${PN} += " \

