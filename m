Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBD4C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:19:48 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7630.1784549986711043712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kpWA7cTL;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7098; q=dns/txt;
  s=iport01; t=1784549986; x=1785759586;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ePfl5WLGVXqr4vYtB41l1ulrRpE4Vo1vLQoTfnFmc2I=;
  b=kpWA7cTLBLZvvXRnRATKSKQbynkTUrJBIwH4i/RohtZGmXmfMLHUiBIm
   z6qMt/CX66751dQGAu0BptB4iwTTWoAC9aM2mpcObSexdmjvs2OlvpOZ0
   2RuYTZWSMoBN4NyyxcSmAClJJ+fNZkY6MPiYvVPKe+5VvepWLCmneVD9s
   c5k/xv+Mazc9Y2niaw2gpHiQ+eQ1gVD7pMSjMZfEC3eaxzc1Jy+19Gxrs
   eDnqAjOTVjkpTSJ/RX0a+VeSwmVxAiL7vMOg9dh/DD3BHzlQJOETw+cRi
   1IiLfZ3qt5pD601+avu+zKBO7yrj9FIvdYljZPb1rLm1NmEMrfsSZhSul
   Q==;
X-CSE-ConnectionGUID: 9t8oaghvQM+6stiWZQOA4g==
X-CSE-MsgGUID: vkI45o85QLCFOomNqt7Q7Q==
X-IPAS-Result: =?us-ascii?q?A0BhAwAfEl5q/5H/Ja1aglmDS19CSZQpgiEDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWwIBAzIBGAEbIiAxKysRCIMCAYJ0AxG9FoIsgQGDKAGBVNs6F?=
 =?us-ascii?q?YE4hT+IIHWEfCcbG4FyhH6CYQKBSgeGVASCDRV6EoN1hSqIR0iBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgTqBAoR0Ix8DOX+BL3VKdy1qE?=
 =?us-ascii?q?heBJoISAoE7AgcDCxgNSBEsNxQZBD5uB408I4I/ATAMUQEHJFx7Ji8YkyCQH?=
 =?us-ascii?q?YIeoRIKKIN1jCGVOhozqmyZCI4KlWgLDVCEaYFoPIFDDwdwFTuCZwlKGQ+SI?=
 =?us-ascii?q?8hFPDUCCTICBwIHDgMLkWkBJoFWAQE?=
IronPort-Data: A9a23:KMXuy6+rivmZxLjvvDpeDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mFJXWiPafqIY2v2f9slPtnj/ElTsJWByIRlGVM4+ShEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThMs//rRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnId0f8+l3H1hrt
 qIDNDEyXCmkrr65lefTpulE3qzPLeHxN48Z/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0An1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYOPIoPXHZ8F9qqej
 nzF3jikBUFHDfi05x2C91S1mrD2whquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:m2F6Y6mpIS7qh1ek+juWkwIIbrHpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:X55cVW3arbsbqCOgYywxmbxfS9x1dXTSzGnpBgzmEnpod4+sbnbM9/Yx
X-Talos-MUID: 9a23:SVcADQZbKBAPmeBTqTzN2GxlZJpRx4+AL0cIt4wa5PDbDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="512075028"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:19:45 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 61FEF180001D4
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:19:45 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 7EDB2CC037D; Mon, 20 Jul 2026 17:49:43 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 00/10] expat: Security fixes
Date: Mon, 20 Jul 2026 17:46:05 +0530
Message-Id: <20260720121615.2520859-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260710130809.2817559-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241377

From: Deepak Rathore <deeratho@cisco.com>

This v2 series backports security fixes for Expat 2.7.5 in Wrynose.
The listed CVEs affect versions before 2.8.2, so this series carries
the relevant upstream fixes instead of upgrading the stable-branch
recipe.

Changes in v2:
- Regenerate the patch mails with the Wrynose subject prefix:
  [wrynose][PATCH v2 nn/10].
- Drop the Wrynose-only stdint.h include from CVE-2026-56403_p2.patch
  and CVE-2026-56410_p1.patch because current Wrynose already provides
  it through expat.h via OE-Core commit 21042df15008.
- Remove the now-unnecessary Backport Changes note from
  CVE-2026-56403_p2.patch and keep only the remaining 2.7.5 context
  note for CVE-2026-56410_p1.patch.
- Refresh all the patches on top of latest wrynose branch merge commit.

- CVE-2026-56403: Signed integer overflow in storeAtts namespace URI
  construction, with related xcsdup overflow hardening from the same
  upstream pull request. Fixed by adding overflow guards before length
  conversion, allocation, and copy operations.
  Upstream: https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
            https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15

- CVE-2026-56408: copyString could overflow while calculating the
  allocation size for a copied string. Fixed by adding the upstream
  allocation overflow guard while keeping the Wrynose 2.7.5 copyString
  structure.
  Upstream: https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817

- CVE-2026-56404: addBinding could hit signed integer overflow while
  calculating namespace binding lengths. Fixed by adding upstream
  length and allocation bounds checks in the binding path.
  Upstream: https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164

- CVE-2026-56405: getAttributeId could hit signed integer overflow
  while sizing attribute ID storage. Fixed by applying the upstream
  overflow checks around the attribute name allocation.
  Upstream: https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0

- CVE-2026-56410: xmlwf resolveSystemId could overflow while joining
  base and system identifiers. Fixed by guarding both the length sum
  and the allocation multiplication.
  Upstream: https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347
            https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea

- CVE-2026-56406: XML_GetBuffer was missing the overflow protection
  already used by XML_Parse. Fixed by adding the XML_Index overflow
  check, with the prerequisite XML_INDEX_MAX helper backported first.
  Upstream: https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd
            https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d

- CVE-2026-56409: xmlwf output path construction could overflow while
  joining output directory and file name components. Fixed by adding
  upstream bounds checks before allocation.
  Upstream: https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e

- CVE-2026-56411: xmlwf notation list allocation could overflow while
  sizing the notation table. Fixed by applying the upstream allocation
  checks.
  Upstream: https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5

- CVE-2026-56407: Entity textLen handling could exceed signed integer
  limits. Fixed by capping entity textLen before storing it in the
  signed field.
  Upstream: https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13

- CVE-2026-56132: Shared DTD scaffolding could store past the
  scaffIndex allocation after parser-specific group sizes diverged.
  Fixed by tracking scaffIndexSize separately, growing scaffIndex from
  its actual allocation size, and backporting the regression test and
  related follow-up cleanups.
  Upstream: https://github.com/libexpat/libexpat/commit/3a4eaf47af8fd7abda38ea2c08308c91152061f3
            https://github.com/libexpat/libexpat/commit/58400483d7c97be316d7a77739c0a6af5d55932e
            https://github.com/libexpat/libexpat/commit/353919b3b9f2174073a557ac7d517a5f3cd0cbbf
            https://github.com/libexpat/libexpat/commit/bca93b4ba9e15fd84425568d772b69baebf790e4
            https://github.com/libexpat/libexpat/commit/08baa7ef9d168b99094249998fd78f8d190526e5

Deepak Rathore (10):
  expat: fix CVE-2026-56403
  expat: fix CVE-2026-56408
  expat: fix CVE-2026-56404
  expat: fix CVE-2026-56405
  expat: fix CVE-2026-56410
  expat: fix CVE-2026-56406
  expat: fix CVE-2026-56409
  expat: fix CVE-2026-56411
  expat: fix CVE-2026-56407
  expat: fix CVE-2026-56132

 .../expat/expat/CVE-2026-56132_p1.patch       | 90 +++++++++++++++++++
 .../expat/expat/CVE-2026-56132_p2.patch       | 63 +++++++++++++
 .../expat/expat/CVE-2026-56132_p3.patch       | 77 ++++++++++++++++
 .../expat/expat/CVE-2026-56132_p4.patch       | 63 +++++++++++++
 .../expat/expat/CVE-2026-56132_p5.patch       | 58 ++++++++++++
 .../expat/expat/CVE-2026-56403_p1.patch       | 83 +++++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 40 +++++++++
 .../expat/expat/CVE-2026-56404.patch          | 47 ++++++++++
 .../expat/expat/CVE-2026-56405.patch          | 32 +++++++
 .../expat/CVE-2026-56406-dependent.patch      | 58 ++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 37 ++++++++
 .../expat/expat/CVE-2026-56407.patch          | 44 +++++++++
 .../expat/expat/CVE-2026-56408.patch          | 36 ++++++++
 .../expat/expat/CVE-2026-56409.patch          | 53 +++++++++++
 .../expat/expat/CVE-2026-56410_p1.patch       | 40 +++++++++
 .../expat/expat/CVE-2026-56410_p2.patch       | 41 +++++++++
 .../expat/expat/CVE-2026-56411.patch          | 47 ++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        | 17 ++++
 18 files changed, 926 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

-- 
2.35.6

