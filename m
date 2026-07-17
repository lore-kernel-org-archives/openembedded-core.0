Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0BCC4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:04:57 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7795.1784268291989127846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jGy9Kn4l;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6756; q=dns/txt;
  s=iport01; t=1784268292; x=1785477892;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TdrD7mXr4NvJK2CtaEJPRiosCvNHRTaCvvaLkE3+lsY=;
  b=jGy9Kn4l9pFmIl58dVsMmwU3lLXpm4U+MOV+lx+MUZ7eRd53gOEt6XR9
   47IS0hfj0BtDhwd9N7wbvgvxrKRLmbJ3SqONr/DK4uE/fv2NZJd2oGD/Q
   5mT1eHqZEq6UntVRHxyzANMpYXWyw3P04Mienkj+J+MS/uRXWpYsw2pU8
   moTvs6wS0VsVmrnPQXrtzdLfw6cQa6OZ9eX9TUWWR9Qv8Ec2ZJaE21b6L
   OEYUboDi2c5VK4LS2kDTr1Klh+BDTNC6tOtAWZGGYrEby+TTlmNIEbx0y
   WHD9qhuzcTX7oMNCkuZoBmDHlGEKOwN3UKtZtv4dMzSHpGOtI01HCirZM
   A==;
X-CSE-ConnectionGUID: rKPN3uMzQUaR7TlqWQcO3w==
X-CSE-MsgGUID: pmPktkMmTE6viBCyytxn7Q==
X-IPAS-Result: =?us-ascii?q?A0BbAwBIxVlq/4z/Ja1aglmDS19CSZNZAU+CIZ4egX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD+OGgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYcTARgBG0JcPAiDAgGCdAMRvUuCLIEBgygBgVTbOhWBOIU/iCB1h?=
 =?us-ascii?q?HwnGxuBcoR+gmECgUoHhlQEgg0VehKDdIUriFpIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQwbBwWBHYE6gQCEdiMfAzl/gS91SnctahIXgU6CFIE+A?=
 =?us-ascii?q?wsYDUgRLDcUGwQ+bgeNSCOCPwEwXQEHJAWBUlUYkyCQHYIeoRIKKIN1jCGVO?=
 =?us-ascii?q?hozqmyZCI4KlXMNUIRpgWg8gUMPB3AVO4JnCUoZD5IjzkA8NQIJMgIHAgcOA?=
 =?us-ascii?q?wuRaQEmB4FPAQE?=
IronPort-Data: A9a23:qq/AEqmMDg/LJW2PLPdC2G7o5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJDWDTM/iLYGajKd8iO96x/RxT7MfXyIdmGVBorCxnF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsvzb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZc7wsAsHERcz
 MEREm8xagm8vumRm63uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKII4XWHJQPxxrwS
 mTu52HBAQ0ZEdmj5GSb81iHl/7TjSWkYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:3/BW2q1u9fIcGqOt7ZWJ/QqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A/eDQumnWQHjNefcbLdw9qVrzj+/XOWf+9FGLPmq?=
 =?us-ascii?q?qMFtgcuKpTUavwahDyNU7zg=3D=3D?=
X-Talos-MUID: 9a23:neVUAgS7JvIDbkyeRXT0gQlhKMRN5piDVl4Mu74XqtWUM3NJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="511419214"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:04:51 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id A7EFB180001C7
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:04:50 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id ED33BCC037D; Fri, 17 Jul 2026 11:34:47 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 0/10] expat: Security fixes
Date: Fri, 17 Jul 2026 11:34:27 +0530
Message-Id: <20260717060437.2910653-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241139

From: Deepak Rathore <deeratho@cisco.com>

This series backports security fixes for Expat 2.6.4 in Scarthgap.
The listed CVEs affect versions before 2.8.2, so this series carries
the relevant upstream fixes instead of upgrading the stable-branch
recipe.

- CVE-2026-56403: Signed integer overflow in storeAtts namespace URI
  construction, with related xcsdup overflow hardening from the same
  upstream pull request. Fixed by adding overflow guards before length
  conversion, allocation, and copy operations.
  Upstream: https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
            https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15

- CVE-2026-56408: copyString could overflow while calculating the
  allocation size for a copied string. Fixed by adding the upstream
  allocation overflow guard while keeping the Scarthgap 2.6.4 loop
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

- CVE-2026-56406: XML_ParseBuffer was missing the overflow protection
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
  checks and adapting cleanup to the Scarthgap 2.6.4 code path.
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

Validation:
- Built expat successfully after applying the full series.
- Built core-image-minimal successfully with ptest packages enabled.

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

 .../expat/expat/CVE-2026-56132_p1.patch       | 80 +++++++++++++++++
 .../expat/expat/CVE-2026-56132_p2.patch       | 60 +++++++++++++
 .../expat/expat/CVE-2026-56132_p3.patch       | 74 ++++++++++++++++
 .../expat/expat/CVE-2026-56132_p4.patch       | 60 +++++++++++++
 .../expat/expat/CVE-2026-56132_p5.patch       | 56 ++++++++++++
 .../expat/expat/CVE-2026-56403_p1.patch       | 81 ++++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 52 +++++++++++
 .../expat/expat/CVE-2026-56404.patch          | 45 ++++++++++
 .../expat/expat/CVE-2026-56405.patch          | 30 +++++++
 .../expat/CVE-2026-56406-dependent.patch      | 59 +++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 34 ++++++++
 .../expat/expat/CVE-2026-56407.patch          | 41 +++++++++
 .../expat/expat/CVE-2026-56408.patch          | 33 ++++++++
 .../expat/expat/CVE-2026-56409.patch          | 51 +++++++++++
 .../expat/expat/CVE-2026-56410_p1.patch       | 46 ++++++++++
 .../expat/expat/CVE-2026-56410_p2.patch       | 39 +++++++++
 .../expat/expat/CVE-2026-56411.patch          | 50 +++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        | 17 ++++
 18 files changed, 908 insertions(+)
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

