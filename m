Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09097C61DD6
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:42:16 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12950.1788525725729000211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e76PwEX8;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1208; q=dns/txt;
  s=iport01; t=1788525727; x=1789735327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=864sHBS0nhT7e79PqIGeItuWzUuGgEFHUIKiwDR8xfQ=;
  b=e76PwEX8hkJKXHshornknxBCMPXeVA0XEnntE44eLSPnFuOv6uxv3DDi
   4IVWj/CZ9gS3DDE7x3eNI/43YzIAegaPomuwg67pISSkV2VAYWvXZ+EdO
   Bn9OeA+WHJMG6YVKGC3QjpaLjHF/MY8eu/0Z19hy25itO6hbqQPKq02Qt
   BtTU7kNeXa4VpO8kPuGgWcUKU4/orA5d/xzjOcX5v3tCq/rQUMf+18nVQ
   z8E0Lw+cdV0fhXWpiyvIk59f28FrGL4KZDxNpUncUheJpLI7jyFevFzv5
   o5vq2Q+ROUJ6DBkPj4tBf/4Eun+5i3JD8nfxIUS02GoSw9asBtxLrEEA2
   w==;
X-CSE-ConnectionGUID: XB5BfqeRR6KEWTfRHy8cKQ==
X-CSE-MsgGUID: ixeGLGE5StakdljiN0vhnQ==
X-IPAS-Result: =?us-ascii?q?A0D5AgBAu5pq/5QQJK1aglmCV3RgQ0mWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQUCjgICJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QHQIBAzIBRhAgMSsrGYMCAYJ0AxHDIoIsgQGDaAJDUNsxAQsUAQWBM?=
 =?us-ascii?q?4U/iCJ1AYR8JxsbgXKEfoEFgVwBAYIthXgEgiKBDJNnSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2eoEJXoErKWABEheBCYIIA?=
 =?us-ascii?q?oJUggMCAUlDDgdHUwknQQQLGA1IESw3FRkEPm4Hjl8fglCBDiwEgX+mH6EPC?=
 =?us-ascii?q?iiDdowilToaM6ptC5h9jgqWUIRpgW8BNIFHCwdwFYMiCUoZD445g2uBf8o6J?=
 =?us-ascii?q?zI9AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:WGugxq+LapZUz+T3QcUODrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zcbXWiBbPffMWGhfIskPd61801Vv8DRxoUyHAU4+XtEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYzpIs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kGF9Ay9P96O1sQ1
 tEnFD43TgHTjMGPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cM3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oi3b4WJKobbHa25mG6Zt
 m/p20vUXyoGPd+TzTiE1Cqyhun2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:sVeDKK0a/JJjxWbKCp3JOQqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:Fu+VGm0eIJ7K7xluZOTk6rxfKup4WHPEwU3qfWyVNlpncp2EGVSzwfYx
X-Talos-MUID: 9a23:WcrbJwnzfH1OlxTdJflpdnpjJMpHx4uDVXsRmJYKv8uFE3RuOzGk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,262,1779148800"; 
   d="scan'208";a="827748290"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 12:42:06 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id B65E0180003B4;
	Fri,  4 Sep 2026 12:42:06 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 5CF9FCCD9B2; Fri,  4 Sep 2026 05:42:06 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/4] u-boot-tools: Ignore CVE-2026-29008
Date: Fri,  4 Sep 2026 05:41:55 -0700
Message-Id: <20260904124157.1723755-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260904124157.1723755-1-hthakar@cisco.com>
References: <20260904124157.1723755-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245099

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD identifies the vulnerable code as net/tcp.c when
  CONFIG_PROT_TCP is enabled [1].
- tools-only_defconfig disables networking, so this code is not built
  into u-boot-tools [2].
- Hence ignoring the CVE for this recipe.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29008
[2] https://github.com/u-boot/u-boot/blob/v2026.01/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
index 0e57bb88849..6b28718c54a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
@@ -2,3 +2,4 @@ require u-boot-common.inc
 require u-boot-tools.inc
 
 CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
+CVE_STATUS[CVE-2026-29008] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
-- 
2.35.6


