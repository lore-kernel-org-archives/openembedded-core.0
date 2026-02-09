Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A5EE78D57
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43823.1770627820291228938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HiMh22Ig;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627820; x=1802163820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X5VkZhT5dHlEkKgIaz2joF0FHO07s5hAu6DQarD7Qek=;
  b=HiMh22Igy4XEuSGTkGi1Xny6K3Udxvnx7r5uHTZeZcVTEE3hnnuVXbHv
   GbrWCyh4xlccBIU4E4HHSHxZA3ejgmbtqFJ9FyEiudj3OL4Np72Qc25Ue
   wtUrjbcMUHE/90naKtT8IzcfMAgmGa6kQdAFAW2F9/23N1b8whWmE4XMV
   WttOg4UTLes7Y68zUQYFlKMEnloUaRKrwMQHISFIt8Gqtr0/GT8NZVZiX
   ut4GDen3z2BjQsx9qZART97lrwreefoJfIKRHK17oPKFowhl26PxZc2Ig
   sgoK75e4xqlyo3T7j+/21GTIHpaa6ER9S1xqHcdiVAzXp6QEje7CFtcBa
   Q==;
X-CSE-ConnectionGUID: w90ypMBIRA6qqsfxaOQEYg==
X-CSE-MsgGUID: 5jCpMNYvSgevLnQmmDSVWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229032467"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229032467"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:39 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id B7B5F1000346
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:38 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6873F1C002A1
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id DC636101A412;
	Mon,  9 Feb 2026 09:03:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/39] liburcu: upgrade 0.15.5 -> 0.15.6
Date: Mon,  9 Feb 2026 17:02:46 +0800
Message-ID: <20260209090317.1468-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230719

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* urcu-mb: Add missing TSAN annotation to _urcu_mb_read_lock_update
* lfstack: Coding style cleanup
* urcu-qsbr: Use CMM_SEQ_CST_FENCE for _urcu_qsbr_thread_online
* urcu-mb: Use CMM_SEQ_CST_FENCE for _urcu_mb_read_lock_update
* urcu-qsbr: Use CMM_SEQ_CST_FENCE for quiescent state update and offline
* urcu-mb: Use CMM_SEQ_CST_FENCE for _urcu_mb_read_unlock_update_and_wakeup
* Fix: Only include linux/time_types.h when __NR_futex_time64 is defined
* Use __NR_futex_time64 in futex syscall wrapper

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburcu/{liburcu_0.15.5.bb => liburcu_0.15.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.5.bb => liburcu_0.15.6.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.5.bb b/meta/recipes-support/liburcu/liburcu_0.15.6.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.5.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.6.bb
index 94124c6391..1cb349f55d 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.5.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1"
+SRC_URI[sha256sum] = "850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e3986908bac414f"
 
 S = "${UNPACKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.43.0


