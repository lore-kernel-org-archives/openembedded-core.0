Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FB5C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:24:44 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6082.1787721878887268716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SW5sKnhE;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1336; q=dns/txt;
  s=iport01; t=1787721878; x=1788931478;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9YftZ33OGpmpHS5XY+Rx9iOwI8y8spoXLFOras6a1P4=;
  b=SW5sKnhEq95GHtXDgIp/UK/mPZ0B+fc6RSTACJ58mZ7IlQobyTHUH9Ek
   a+B2cuiGPZkpRCc3GORmvX+xKNlGa3EiOFmVkpemOLmwEhPGMMCnnA/x3
   WoFEdxlnOIt88pwTvDwRFhKVvDUd4jNXojM8MhqSlWGWvJYLfuFBZ2YTA
   MhGmNmgwcIpXy2a22i81ohYYQau8dVNCgujQsIsNL+qgGXwdouxxUzyaZ
   0jWwRsq0DU0T4tywwNdyFprvAcr9TzQMBY9iFHonxqntqYDFWF7oJAUWl
   Fx7jKulPyp/TCkPH41nhz4SToEfr4nTRV0pnqVYk2dKUbHI5aqGuSSE0o
   g==;
X-CSE-ConnectionGUID: mA8qdGhCTR6TFAsBLzA4uw==
X-CSE-MsgGUID: u5L4Dje1SN6NBTccKVZhAA==
X-IPAS-Result: =?us-ascii?q?A0BCAgD7do5q/5EQJK1aglmCV3ReQ0mTWQGCcJ4egX4PA?=
 =?us-ascii?q?QEBDz0UBAEBhQWNbgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdKwsBGAEtMFxEgwIBgnQDEQa+SIF5M4EBgygBQ0HcAAELFAEFg?=
 =?us-ascii?q?TOFP4gidQGEfCcbG4FyhH6CYQEDgSWBBoV4BIMugXiRakiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCB?=
 =?us-ascii?q?wKCWoIFAgFJQw4HRz4LGA1IESw3FBkEPm4HjmsfgkgBYS0qApYmkXyhDwoog?=
 =?us-ascii?q?3aMIpU6GjOqbJkIjgqWUIRpgWg8gVlwFYMiCUoZD5c2xyYnMgIBATkCBwIHD?=
 =?us-ascii?q?gMLkWiBfgEB?=
IronPort-Data: A9a23:8CNUdKxenH6xbux54dR6t+dExyrEfRIJ4+MujC+fZmUNrF6WrkVWn
 DcdX2CCaPjcZjPxLt92OYu09ktU75bSzNY2GgJvq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEQfbZQU1eZcPVsQy
 dIxMxopfDnfmv3jldpXSsE07igiBMDvOIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUidC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOK1YYOIKozQLSlTtlvFg
 j7q/WmgOTdEEvajwjGmzECsr8aayEsXX6pXTtVU7MVCmlyYxmUJBFsOSEG3oPSRjk+4RsJRL
 FES9iMyrK80skuxQbHVWAW1pnOBtBMQV9dcVuY98gylzqvP/x3fAXAJSDNEYtEquMI6Azsw2
 Te0c8jBDDhrtviRDHma7LrR9WP0MikOJmhEbigBJecY3+TeTEgIpkqnZr5e/GSd17UZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:/uRguqmgCjL+BJr7MVPfKV4RN9DpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3Al7Yls2tkqRnJhUcj+L6f7gVp6IsgWy3EwFjQCHO?=
 =?us-ascii?q?CV1pHYaa/bU25pL57xp8=3D?=
X-Talos-MUID: 9a23:+fYyoQaW3V++leBTqmLI2B1gOZ5TxfqIInwGmrY4icmtHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="820915882"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:24:38 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id CC77C18000451;
	Wed, 26 Aug 2026 05:24:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 6D174CCA79B; Tue, 25 Aug 2026 22:24:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-mako: upgrade 1.3.10 -> 1.3.12
Date: Tue, 25 Aug 2026 22:24:21 -0700
Message-Id: <20260826052421.3255804-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244285

From: Richard Purdie <richard.purdie@linuxfoundation.org>

ChangeLog:https://docs.makotemplates.org/en/latest/changelog.html#change-1.3.12

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 439b05aa55a7d4d71b81ca93025de1b28d79b311)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.10.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.12.bb
index 2d937dc184..b2c1a8dad8 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
+SRC_URI[sha256sum] = "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.35.6


