Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113AAC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:07 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26624.1646662445881657083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iBhxn/KC;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662446; x=1678198446;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IAH4TuWk8sgR/I6QWLTW6kbxk4wHPMNZgMdz2vZbatc=;
  b=iBhxn/KCIfwpf/wTzaibBy7MHIkvzMJddiLUM3vFp5IawO0d2Da5RiAQ
   Pcpyl8P2ytjRRUDBo81HN6PYoACLf5xFl4nKI49PDBQaaFtgga6MCqtRD
   aF7FWD5r5aVqYfYjYDnxnjQOz7esqZ4IOa4lV+EPH2okvYQDHbB1fHlPk
   YQgy2gNfS7S4VZhbwupXy/f+5RmitIfZ0p0dagfGM2nzgRovQZ/doeccJ
   Oyy+KTVZl7uXv/Wt811XG7Ma4DRvZiUPyHomUO5PXUmTuH3d9Y6b7bEdv
   q35EQfYQ1cp1yvxnL8iBPCpPM7OSWdW2soyrVmdpNED+jztzuWrv82zqd
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112574"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:35 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070904"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 18/25] cups: Add --with-dbusdir to EXTRA_OECONF for
 deterministic build
Date: Mon,  7 Mar 2022 22:09:54 +0800
Message-Id: 
 <a5adc91b6cebf7a006805e01fcf20ca4cb9a9a6a.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162839

From: Robert Yang <liezhi.yang@windriver.com>

The configure checks /etc/dbus-1 and set DBUSDIR is null:
        if test -d /etc/dbus-1 -a "x$DBUSDIR" = x; then
            DBUSDIR="/etc/dbus-1"
        fi

So that the build resutl would be different w/o /etc/dbus-1:

/etc/dbus-1/system.d/cups.conf (Only exists when DBUSDIR is set)

Add --with-dbusdir to EXTRA_OECONF to fix the issue

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e4b2464138601c4c20882c001ef11eef5100395)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 0f5c2e730f..a8e790bd8f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -49,6 +49,7 @@ PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,x
 
 EXTRA_OECONF = " \
                --enable-dbus \
+               --with-dbusdir=${sysconfdir}/dbus-1 \
                --enable-browsing \
                --disable-gssapi \
                --enable-debug \
-- 
2.35.1


