Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AED9C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:19:35 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.27960.1709655569266003818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=J6OIV2Or;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=787e54d6c=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709655569; x=1741191569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JFLXEvak2YzgHpbYNbrxLlHAV6VrueQQzdzkilJ71FA=;
  b=J6OIV2OrR4DSND6LwYgef/+Nz/WXWyVIm6zpoe0EpZSIdWV/x4t2eA+N
   JZdUwRVuN/LjNXa4qEM/dl33+GFQc/Kpl37YkOxW7VxqcfUl9G1Aps2nY
   Fncsh5eziUNwHIxo5otTB3XLH6cTkzrHL4+jIWmuYG/CFIrXLnC3uebiy
   4=;
X-CSE-ConnectionGUID: NcK67gmiTcSJfQ7NqrMMJg==
X-CSE-MsgGUID: Jp5L8ExNQwuB8PBwzcaRuA==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Mar 2024 17:19:26 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw3.muc with ESMTP/TLS;
 05 Mar 2024 17:19:26 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb3.muc with ESMTP/TLS; 05 Mar 2024 17:19:26 +0100
Received: from localhost.localdomain (10.30.85.204) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Tue, 5 Mar 2024 17:19:25 +0100
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [RFC PATCH v2 0/3] package: Extract GNU build ID during packaging
Date: Tue, 5 Mar 2024 17:18:27 +0100
Message-ID: <20240305161856.4163138-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228062139.473528-1-philip.lorenz@bmw.de>
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP10F.europe.bmw.corp (2a03:1e80:a15:58f::202c) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 16:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196637

This is the follow up to "package.bbclass: Expose list of split out
debug files" adding the extraction of the build IDs directly into the
do_package task.

Build IDs are stored inside the "extended" section of the pkgdata and to
enable easier testing the "read-extended" command is added to
"oe-pkgdata-util".

Sequentially reading the build ID from ~8000 debug symbol files takes
approximately 90 seconds on my machine, and given that extraction
parallelises well, I deemed those figures low enough to enable this
feature by default without a configuration switch. Let me know if this
doesn't match your expectations.

Philip Lorenz (3):
  oe-pkgdata-util: Add read-extended command
  package: Expose list of split out debug files
  packagedata: Extract GNU build ID during pkgdata creation

 meta/classes-global/package.bbclass     |  4 +++
 meta/lib/oe/package.py                  | 19 ++++++-------
 meta/lib/oe/packagedata.py              | 25 +++++++++++++++++
 meta/lib/oeqa/selftest/cases/pkgdata.py | 18 +++++++++++++
 scripts/oe-pkgdata-util                 | 36 +++++++++++++++++++++++++
 5 files changed, 93 insertions(+), 9 deletions(-)

-- 
2.44.0


