Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992B1C83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 14:55:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17171.1753282517785841233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 07:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D15E22E6
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 07:55:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E37833F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 07:55:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] pybootchartgui: account for network stats when calculating extents
Date: Wed, 23 Jul 2025 15:55:07 +0100
Message-ID: <20250723145507.584335-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723145507.584335-1-ross.burton@arm.com>
References: <20250723145507.584335-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 14:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220807

We could take into account the network device statistics when calculating
the size of the image, otherwise charts will be truncated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybo=
otchartgui/pybootchartgui/draw.py
index 09253ea1852..4d76ce6e8e1 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -371,6 +371,8 @@ def extents(options, xscale, trace):
             h +=3D 30 + bar_h
         if trace.mem_stats:
             h +=3D meminfo_bar_h
+        if trace.net_stats:
+            h +=3D (30 + bar_h) * len(trace.net_stats)
=20
     # Allow for width of process legend and offset
     if w < (720 + off_x):
--=20
2.43.0


