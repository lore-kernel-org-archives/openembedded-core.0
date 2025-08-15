Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B43CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:12:45 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web11.11468.1755263553550411383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=HH192eZz;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=315bbc237=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755263554; x=1786799554;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IYyF1ZVWf1X2fX7/MWCQvKIuKjAoLXwTr/vTUGZvGdA=;
  b=HH192eZz2raYC8rAdnxxMdIrOqBp9LhluKkcvXlt+eIrQd6yXELyTORA
   SKOlyD2qCDf8Zx04if4DfoTbFTjNvJ1+gFmKRXh7/7C5vL8zXBvYuAbfz
   rdmnIpjGGxUmBkiCcwBi2PcoJvAywpgM3rf9GjXQ3a4JGHbFhUIRajodm
   U=;
X-CSE-ConnectionGUID: N9gJCWc1QMuWEM07H/74TA==
X-CSE-MsgGUID: ad7BZTM4TfOoJJVhoh4w+A==
Received: from 160.46.252.49.spf.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Aug 2025 15:12:32 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw6.muc with
 ESMTP/TLS; 15 Aug 2025 15:12:32 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb2.muc with ESMTP/TLS; 15 Aug 2025 15:12:32 +0200
Received: from marvin-ws (10.30.85.206) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Fri, 15 Aug 2025 15:12:31 +0200
X-CSE-ConnectionGUID: usb35kpfSoamEnam2yIsMQ==
X-CSE-MsgGUID: DbEmf403Qr2bToo5YfUTQA==
X-CSE-ConnectionGUID: gCIOKUduSdGzOpg1Ryuv3g==
X-CSE-MsgGUID: 4OhKiKZ4QUa3KgLWNg68Kw==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 1/3] systemd: Handle USE_NLS
Date: Fri, 15 Aug 2025 15:04:38 +0200
Message-ID: <20250815130440.1402632-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16e.europe.bmw.corp (2a03:1e80:a15:58f::1:147) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221972

Do not build translations when NLS is disabled.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/recipes-core/systemd/systemd_257.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-core/systemd/systemd_257.8.bb
index adc27f6cff1..174372be03c 100644
--- a/meta/recipes-core/systemd/systemd_257.8.bb
+++ b/meta/recipes-core/systemd/systemd_257.8.bb
@@ -249,6 +249,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dsystem-uid-max=999 \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
+                  -Dtranslations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
                   -Ddbus=disabled \
                   "

