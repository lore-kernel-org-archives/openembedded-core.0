Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2F0C5DF90
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3038.1787216871405847851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WiyaWpj/;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1488; q=dns/txt;
  s=iport01; t=1787216872; x=1788426472;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vC2Gu+TgqcX+pcHLKxPbSo7N/fxqIIsB7S/1EP1lwM8=;
  b=WiyaWpj/WotMx4lj6YxJ86oykh+aAy3eoS/zdLHFaQOc1SKxciAeHjCk
   3YxQ3qnUz2+TmcSJ7uB1bbFosy8xzCCqHoAymi10oXUipzstk6GsCEI8c
   SO/Fio9uFrPYcbfCT3rxqyEPWz9IBmeKhc4T2QsOzrUaw3q8JD+jfFTBH
   UOjZS7V9Qne2wtUOXICDttf5JEEK2hmscf/rSh7pxZd9RTE6hSZP0ztvG
   tFUMfcRyGKYX7rbNATitjikV+Y0zkifkLRsQdRBZvL1vb+quLraQ2TOjx
   E+KsGiL9JYrTHoDbDcyTVpnO2aNVBalO+yS7wdDXaRa6RbJoJzSG9hboe
   Q==;
X-CSE-ConnectionGUID: ArzsOG21SaC+xsFUE3gDlw==
X-CSE-MsgGUID: cHQ5/vWeSAqH2riAu7h5Pg==
X-IPAS-Result: =?us-ascii?q?A0D4AgAdw4Zq/4wQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW0CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXTYBGAEtMFxEgwIBgnQDEcIygiyBAYMoAYFU2zABCxQBBYEzh?=
 =?us-ascii?q?T+IInaEfCcbG4FyhH6CYQKBNHmFeASCIoEMgXiRUkiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCc?=
 =?us-ascii?q?IIGAgFJRQ4JFwsYDUgRLDcUGQQ+bgeOUSCCSz1RLHMlVaY1oQ8KKIN2jCGVO?=
 =?us-ascii?q?hozqmwumFqOCpZQhGmBbwE0gVlwFYMiCUoZD5IjzDknMgI7AgcCBw4DC5NmA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:nLHnc6yXFAWNZtlrAp16t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 WUXCGHUPa2MNmbzfY8jYIngo04F6JfVnNJjHAI++FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGgsL5Y/1bwuOmhlt
 uwDBg0gNR+vg/3jldpXSsE07igiBMDvOIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiYC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi0aYOJK43TG625mG6Th
 lubuHrGDyozLfzF0zus7y2s29fAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYS71Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:EG78Xa7bFFxMlNFmJwPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:WKaqTmD6LlzLQtr6EwB95lUzNZp8SXT2j2fLDXKVUmlFTKLAHA==
X-Talos-MUID: 9a23:1Uq75wunFy/dL11D9c2njxFbaYB23KmVIVkty48HktTbNXFINGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="811149916"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:51 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 183D818000436;
	Thu, 20 Aug 2026 09:07:51 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id A9C04CC12A8; Thu, 20 Aug 2026 02:07:50 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-numpy: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:50 -0700
Message-Id: <20260820090750.62148-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243839

From: Tim Orling <tim.orling@konsulko.com>

The current "python3-numpy" mapping has no matching NVD CPE or
configuration identity, so eight source-aligned CVE records are missed.
Use "numpy:numpy", the active NVD dictionary CPE and configuration
identity for the packaged NumPy source.

Note: The original commit targeted python3-numpy_2.5.2.bb. This is
adjusted for Wrynose, where the recipe version is 2.4.3.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad623e71fadeddcb0b70bba8fbf28c75a976e596)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-numpy_2.4.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
index 7521a93f99..f34723b2c2 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e3261
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
+CVE_PRODUCT = "numpy:numpy"
+
 inherit pkgconfig ptest python_mesonpy github-releases cython
 
 S = "${UNPACKDIR}/numpy-${PV}"
-- 
2.35.6

