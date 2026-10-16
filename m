Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E34CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15273.1792129268347065025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QdUARnnQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3311; q=dns/txt;
  s=iport01; t=1792129268; x=1793338868;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yiBhWg9A+PLH3q+l9R2FTMdXK/G9GdMP5Mnooul3pr0=;
  b=QdUARnnQctn5VCzKnj6m3lVVxD9BPA2qMFbB+bqrccqSNPENwxYSJAk8
   ckqLrZAfutm0V2fBLhjo1FQDk+I1XPJcwkKVXXL9DLaJpAot+MmtuOuFZ
   kEsk2gHdki93IGC9X1mHH/IFueIX9HhzaSRVbvHaily1KVrqbaezOQU7I
   4nkEub+pJVND1JQNNJCh8FXeTmL9LDk1UTZSX8IokPho7It7j0+na3Iti
   KKp28Ff8Yk/kxs/+LIeFUXQqlzie1Mecc1qcDn+kbfEck+Df2BjVGEvN6
   Cnl49WAgP3TAwCAFsabSfeJYN47KDxTtOGtywi37OYOOhO6s5Tem0Vr62
   A==;
X-CSE-ConnectionGUID: 3B8gRv0sQgKjV2geKbjGnw==
X-CSE-MsgGUID: ORIYqNRoTMOf1YJQWM2B8Q==
X-IPAS-Result: =?us-ascii?q?A0BXAwCGuNFq/4r/Ja1aglmDTGBDSZQpoECBfg8BAQEPN?=
 =?us-ascii?q?xoEAQGTHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JBLARgBG4Eeg0YBgnQDvQmCLIEBgykBgVTZSoF0FYE4jWN2hHwnG4FJRIR+i?=
 =?us-ascii?q?wgEgxwSlyFIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJlgQ8HglCld?=
 =?us-ascii?q?aEPhCiMIpU6GjOqb5kIpAxNhGmBaDyBWTMaCBsVgyIJShkP4H4nMgI7AQEHA?=
 =?us-ascii?q?gcOAwuBaJF+AQE?=
IronPort-Data: A9a23:F+oZM6Kril4Uypj1FE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS0GEAy
 DYWDGvUPvncY2P3LtAlYInl9EoO6sOGx9FgSlQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN01JhE5B5NA4d94ImNwr
 /MVCzoPQRac0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Sojx5nYj/7DLovgf2hinTXeDxDo1XTrq0yi4TW5FEqjuG9aouJJ7RmQ+1ypGepv
 0T8+FjcJR9DBf6m9h/f2CKV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:dTo296l50w5x3bMGiTIEJEx2LPnpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:woSMxmPN5vkK4u5DAwM3+3QKQtscfV7f8i3fLmyyC0lvV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A8maIJw4hQbfztTe8osvA9COJxoxP2YWfEWY3lqk?=
 =?us-ascii?q?jnMfdBA5JBBLHpmSOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536182945"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:07 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 7DC2018000283
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 2265ACC1611; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 0/27] python3-git: Security fixes
Date: Thu, 15 Oct 2026 22:40:39 -0700
Message-Id: <20261016054106.210444-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247931

Backport 27 GitPython security fixes covering 28 CVEs to the python3-git
3.1.43 recipe on wrynose. The series adds the fixes as patches and updates
the recipe to apply them.

CVE-2026-78678 and CVE-2026-78679 are addressed together. The CVE-2026-76222
fix includes a regression correction and follow-up patch, and the CVE-2026-87819
fix is carried in two patches. The patches retain upstream references.

Yogita Urade (27):
  python3-git: fix CVE-2026-67326
  python3-git: fix CVE-2026-67323
  python3-git: fix CVE-2026-67325
  python3-git: fix CVE-2026-67324
  python3-git: fix CVE-2026-67322
  python3-git: fix CVE-2026-69097
  python3-git: fix CVE-2026-73625
  python3-git: fix CVE-2026-73623
  python3-git: fix CVE-2026-73624
  python3-git: fix CVE-2026-73622
  python3-git: fix CVE-2026-73621
  python3-git: fix CVE-2026-73620
  python3-git: fix CVE-2026-73619
  python3-git: fix CVE-2026-76221
  python3-git: fix CVE-2026-76220
  python3-git: fix CVE-2026-76219
  python3-git: fix CVE-2026-76218
  python3-git: fix CVE-2026-76217
  python3-git: fix CVE-2026-76222
  python3-git: fix CVE-2026-78678 CVE-2026-78679
  python3-git: fix CVE-2026-78677
  python3-git: fix CVE-2026-78676
  python3-git: fix CVE-2026-78675
  python3-git: fix CVE-2026-87817
  python3-git: fix CVE-2026-87818
  python3-git: Fix CVE-2026-87819
  python3-git: fix CVE-2026-100689

 .../python/python3-git/CVE-2026-100689.patch       |  90 +++++
 .../python/python3-git/CVE-2026-67322.patch        | 167 +++++++++
 .../python/python3-git/CVE-2026-67323.patch        | 356 +++++++++++++++++++
 .../python/python3-git/CVE-2026-67324.patch        | 101 ++++++
 .../python/python3-git/CVE-2026-67325_p1.patch     |  49 +++
 .../python/python3-git/CVE-2026-67325_p2.patch     |  50 +++
 .../python/python3-git/CVE-2026-67326.patch        | 108 ++++++
 .../python/python3-git/CVE-2026-69097.patch        |  48 +++
 .../python/python3-git/CVE-2026-73619.patch        |  58 +++
 .../python/python3-git/CVE-2026-73620.patch        | 130 +++++++
 .../python/python3-git/CVE-2026-73621.patch        |  72 ++++
 .../python/python3-git/CVE-2026-73622.patch        |  60 ++++
 .../python/python3-git/CVE-2026-73623.patch        |  53 +++
 .../python/python3-git/CVE-2026-73624.patch        | 139 ++++++++
 .../python/python3-git/CVE-2026-73625.patch        |  59 +++
 .../python/python3-git/CVE-2026-76217.patch        | 179 ++++++++++
 .../python/python3-git/CVE-2026-76218.patch        |  94 +++++
 .../python/python3-git/CVE-2026-76219.patch        | 155 ++++++++
 .../python/python3-git/CVE-2026-76220.patch        |  67 ++++
 .../python/python3-git/CVE-2026-76221.patch        |  44 +++
 .../python3-git/CVE-2026-76222-regression.patch    |  39 ++
 .../python/python3-git/CVE-2026-76222_p1.patch     | 120 +++++++
 .../python/python3-git/CVE-2026-76222_p2.patch     |  47 +++
 .../python/python3-git/CVE-2026-78675.patch        |  47 +++
 .../python/python3-git/CVE-2026-78676.patch        |  54 +++
 .../python/python3-git/CVE-2026-78677.patch        |  86 +++++
 .../CVE-2026-78678_CVE-2026-78679.patch            | 181 ++++++++++
 .../python/python3-git/CVE-2026-87817.patch        | 394 +++++++++++++++++++++
 .../python/python3-git/CVE-2026-87818.patch        |  55 +++
 .../python/python3-git/CVE-2026-87819_p1.patch     |  77 ++++
 .../python/python3-git/CVE-2026-87819_p2.patch     | 139 ++++++++
 meta/recipes-devtools/python/python3-git_3.1.43.bb |  31 ++
 32 files changed, 3349 insertions(+)

--
2.35.6

