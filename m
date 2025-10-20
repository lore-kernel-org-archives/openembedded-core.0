Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7D8CCD184
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 02:40:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.9799.1760928011687929269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 19:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HT1FT+KM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760928011; x=1792464011;
  h=from:to:subject:date:message-id;
  bh=IkyAHLn7H4uZPe30rYIs7CWqmViLYXILlK1j+2Og7Rc=;
  b=HT1FT+KMNNG6qqhj7DrRo27blROgkLnnT9U4p8ETTUTnXO4Wn62cB8Il
   PtEU40W9UXfKKmUDuQkcuTzNwLtEStmimwyrAt+Vde52RpyAnvpOlk9h9
   G3HSBmDx+6liqpyNLrgijy+QVNEjNJbZmCT34XMScM4GEjodl7kUpfn8j
   Ata6OkEavVzXAKZTHAlhzKJ1JyxFSXSxKsw3pKaXCs+AQ+s/NKlj4koT2
   fDQCvKEvYesL9MJZDAaDlhn1vr8cwvLK/3T95LiJ8sg40mE0qbQfGVu1o
   EWWBduOLz13j3/aHs3eeDKO+HA0SOtKx37Mu0DNA96Soz7pZ5Z6Gai/A4
   g==;
X-CSE-ConnectionGUID: VNHNsO/CRM2bnTZ3oRs/4w==
X-CSE-MsgGUID: noBAAnE1QcWDI2zFTZpSqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="204382390"
X-IronPort-AV: E=Sophos;i="6.19,241,1754924400"; 
   d="scan'208";a="204382390"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:40:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 03FB2C00357
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AF08E8D65EF
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:09 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D575B1800101
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:07 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kea: Fix EXTRA_OE config to EXTRA_OEMESON and installation umask of meson
Date: Mon, 20 Oct 2025 10:39:53 +0800
Message-Id: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225090

*** BLURB HERE ***

Liu Yiding (2):
  Subject: [OE-core][PATCH] kea: fix EXTRA_OE config to EXTRA_OEMESON
  Subject: [OE-core][PATCH] kea: fix installation umask to 0022 of 
    meson.

 meta/recipes-connectivity/kea/kea_3.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.43.0


