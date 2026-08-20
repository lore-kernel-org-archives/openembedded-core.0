Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9EDC5DF89
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3041.1787216875055117220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h6amlSiO;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1260; q=dns/txt;
  s=iport01; t=1787216875; x=1788426475;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pLhEpIgRC34LoLvEwok6Mruc+eLLsFC2ZQK6/tCeG+U=;
  b=h6amlSiOV4hC6HqnRVFa9ZGXiZaR/VuVYT69lkgUWMSDV4xzR4QsOXMQ
   QUef1Ipco9QFjsw4Kn4k5Nfw5XO5mCx1iBoPLbzVl8MiYNOf41SxXFN1W
   ML9Hmj7V49AcyOmFGHewnlSf5/qu3nRTYz85YsRqO29zkIXyN++UlJD22
   1cW6yPC3ztPLv9gY+p9sL1kZLHiBE/7DnKCYaGTy5e6YSNuPAHs9DM6YR
   IAVSWt7YLk+jSbXLOtzefq/ZRPWetmzl3Ise7F+r+WsjF4H/krcO2rD/c
   cP4UhjVBHWxiPvT5gPr/kvA3GT4zW1zSff4b8TW6AZl+UWJdad8FeLYmS
   A==;
X-CSE-ConnectionGUID: DcImY4SbRPmQ0bFE7yG2iw==
X-CSE-MsgGUID: fO0gkqIrT7CJzZBfei6gUA==
X-IPAS-Result: =?us-ascii?q?A0BCAgAdw4Zq/5EQJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDEcIygiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6EF3mFeASCIoEMk0pIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBSUUOC?=
 =?us-ascii?q?RcLGA1IESw3FBkEPm4HjlEggks9UYIZpjWhDwoog3aMIZU6GjOqbC6YWqRah?=
 =?us-ascii?q?GmBaDyBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:RIXZNqt6Y3tQPnqtjbNWmL/pOOfnVAdfMUV32f8akzHdYApBsoF/q
 tZmKW7Vb/fcazH3etl0at/k9RkB65eBxtEwG1c4qyBmRH8WgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La+Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw1u1WBFASz
 vYiEDU0Nhqtqr2n7+i6Vbw57igjBJGD0II3s3Vky3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgp/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KoXRHJsOxRfFz
 o7A12reWh4ZLf2F9WWu0GCerOHCnH30ZatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Gva1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:SNjHma4Q92yL4y+u6wPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AxzMJVWjo57o0GqCeyThhXRXp+TJuXnb8yUaMGEW?=
 =?us-ascii?q?CMWNQELe7ZACB1/lljJ87?=
X-Talos-MUID: 9a23:Kq3j0gmutDX4ChEThkDWdnpsE59n4L2PEnxSurcUieOKOC0uNAq02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813163395"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:51 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 3304918000449;
	Thu, 20 Aug 2026 09:07:51 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id C3520CC124A; Thu, 20 Aug 2026 02:07:50 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-pycryptodome: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:50 -0700
Message-Id: <20260820090750.62217-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243841

From: Tim Orling <tim.orling@konsulko.com>

The current pypi default "python:pycryptodome" is deprecated and does
not match current NVD configuration criteria. Use
"pycryptodome:pycryptodome", the active NVD dictionary CPE and
configuration identity for the packaged source, so two patched CVE
records are reported.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8a88010edc6edbb168cbc31aa5df847a328661c)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
index 2528162ff8..1b2a5edd38 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
@@ -3,3 +3,4 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
 
+CVE_PRODUCT = "pycryptodome:pycryptodome"
-- 
2.35.6

