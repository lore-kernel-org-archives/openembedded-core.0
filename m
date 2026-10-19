Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5150FCCF2DF
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:43:33 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28813.1792392205794689588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GZoMZf6a;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1773; q=dns/txt;
  s=iport01; t=1792392205; x=1793601805;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p8l+xOoIcYHsel5kDcH1+nSQYAy4AhyZtANx52pIaZ8=;
  b=GZoMZf6aeYFvJL2l5Qvs9zMsxZtaaZdoQpTwejwEWLYctPBuBPqB9qhR
   QDr1DF5GqdKFP9Gqbg6TkMqmbSxz6CACyVbkQGYDVTsRbcE0PI2v87dZt
   zg6Cif6nbOw+fyeGlLZPbuzkLanjqDLXOipyk1Wm2mp56BMJZ798DB58v
   7nDObBAIl6KtCAymVGaHuDFda3LGDHRvVSAMVVkAvpd0Q0qtDj4d3NjaB
   muqjLzwWhlmOBfWu/u4pBAN3h4L5eOW9X2lGJuHpm9w8f7itQtVujKDhF
   mfqhabLvw4tkq4K1+cCgUfGeXgW8X5jG6iroKEkuUiAkQroLmFY2kntd6
   Q==;
X-CSE-ConnectionGUID: yT4p5cJrQIWfvckSROr1Gg==
X-CSE-MsgGUID: uTmDKcqzQfSv88UTwUnTfQ==
X-IPAS-Result: =?us-ascii?q?A0BdAwBsu9Vq/4r/Ja1aglmDTGBDSZNZAaEPgX4PAQEBD?=
 =?us-ascii?q?y4PFAQBAYUFjhcCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBUBBDEBGAEtMFgERIMCAYJ0AxG9dYIsgQGDKQE5AYEa2z4VgTiFQ?=
 =?us-ascii?q?IgjdoR8JxsbgXKEfoJhBYIqhXgEgiJ6EoJdlFpIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JB00YD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSKh6CZYEPK4IsEZMnkj6hDwoog3aMIo0+h3waM6pvmQiOC?=
 =?us-ascii?q?pZQhGmBaDyBWXAVgyIJShkPlzfJRycyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:vXO3MqsbTjlYZLG8GhpWtXXDS+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTvQaamPamP3KI1zPImz80NS6pHSzNdiTQs5qn0zRX8WgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra+Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw69orGTxF1
 +YhCQ8DcBuAvNiR2uuURbw57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHRGp0MxhzC+
 Aoq+UzkPhQ2F9eG2wOLyWz81tLzgh79ZIwrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:co1bnqFKySFvsJEVpLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:9+TgGGwNWbICsi/ivM2zBgUFJpw9L3b/1k7xHEGmAmVScpqPEHCfrfY=
X-Talos-MUID: 9a23:9e9uGgRdlBYkp91xRXTxuDROF8xx8Z2gM15dwag6pPSCCSJJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="537010226"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 06:43:24 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id C7B1E180001E7;
	Mon, 19 Oct 2026 06:43:24 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 46AC2CC1611; Sun, 18 Oct 2026 23:43:24 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 0/5] curl: backport security fixes
Date: Sun, 18 Oct 2026 23:43:15 -0700
Message-Id: <20261019064320.3978613-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248132

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport five security fixes to curl 8.19.0 on Wrynose.
The series addresses CVE-2026-8926, CVE-2026-11564,
CVE-2026-80255, CVE-2026-82208, and CVE-2026-80231.

This series is based on Jaipaul Cheernam's Wrynose patch
for CVE-2026-80230 [1]. Apply that patch first. The five
commits here add the remaining fixes on top of it.

[1] https://lists.openembedded.org/g/openembedded-core/message/248025

Darsh Kelaiya (5):
  curl: fix CVE-2026-8926
  curl: fix CVE-2026-11564
  curl: fix CVE-2026-80255
  curl: fix CVE-2026-82208
  curl: fix CVE-2026-80231

 .../curl/curl/CVE-2026-11564.patch            | 132 +++++++++++
 .../curl/curl/CVE-2026-80231.patch            | 212 ++++++++++++++++++
 .../curl/curl/CVE-2026-80255-dependent.patch  | 139 ++++++++++++
 .../curl/curl/CVE-2026-80255.patch            | 125 +++++++++++
 .../curl/curl/CVE-2026-82208.patch            |  52 +++++
 .../curl/curl/CVE-2026-8926-dependent.patch   | 140 ++++++++++++
 .../curl/curl/CVE-2026-8926_p1.patch          | 100 +++++++++
 .../curl/curl/CVE-2026-8926_p2.patch          |  84 +++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   8 +
 9 files changed, 992 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11564.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80231.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-82208.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch

-- 
2.35.6


