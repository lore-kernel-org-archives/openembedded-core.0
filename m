Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3A0CCA48B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:40:06 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15545.1792129204792065441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=I4o4Wv/U;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1635; q=dns/txt;
  s=iport01; t=1792129204; x=1793338804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XtSP+SU5gLOfB2n5GD7esaiE2kWXjKE+4ishE/ai7Zo=;
  b=I4o4Wv/UlXK1r4WdU7+1qY/xek+dGVVbtFuiHOzCMidfafa4XAj9IqY3
   qQGCAUSY2eK5UJ75UDTRxoLWzCr1zdJpTfjQXeiMclqbAbdDdLZZ2u2li
   I3YcJS5WoMiSlyCj3scfJEOnu1UVQXuRk+kMYzp+GKFzUz2z4Q8llb34s
   YMZHtu+CNKwQ8eSsCoRj2oGajGIhWdUWnuBvZn/VjB44qSBDRFq427p73
   42Te7m5uDxLdGoe1MyIgiKiw9MAGK2eX8IXW0YsZjDJJLbnlZ5xezjFTF
   92ix1eRy7/h2m/mhO2fTko8gfcnbCk5zzpt9E3qOMmiIOurIyNUurL3sw
   Q==;
X-CSE-ConnectionGUID: tN/KK5zaRW+oVL/iYGUDog==
X-CSE-MsgGUID: 52icrzJ4TfuWTh1jdB0S/g==
X-IPAS-Result: =?us-ascii?q?A0BdAwAUt9Fq/4r/Ja1aglmDTGBDSZNZAYJwnh+Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY4XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZckBUrCwEYAS0wJjYdASaDAgGCdAO9FoF5M4EBgykB3RIVgTiFQIgjd?=
 =?us-ascii?q?oR8JxsbgXKEfoQKgQaFeASCInoSlyFIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLBQjF?=
 =?us-ascii?q?RkEPm4HkhQegmV7FHtzUBmTNUWRe6EPCiiDdowilToaM6pvmQikWYRpgWg8g?=
 =?us-ascii?q?VlwFYMiCUoZD45g0h4nMgI7AgcCBw4DC5FogX4BAQ?=
IronPort-Data: A9a23:D3Cw0KB4hg2l2xVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD0r3jdSz
 2sYDGqEP63cNmagctEnYI++8k8GvpGAztBmOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf8hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE39MpL2JrL4QixaVwP0UJ9
 M03FRwKYUXW7w626OrTpuhEnM8vKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE/BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEqjuG9aoSLIrRmQ+0IxEeTv
 HDko1j3Hy4mNIWdxRDdyTWj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOH9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:EorglaCB9fowZQvlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:FazSiW9ktYyYo3fKWYSVv1IyXeMGL2/U9kiTJHGcTmdYZ4C5TlDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Aw6HSLQ3zbDov0H170p/o7oQSYzUjvv6vA1ofs8k?=
 =?us-ascii?q?6tdS7CSwpOTu31A/wTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536182660"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:40:03 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 128CD18000331;
	Fri, 16 Oct 2026 05:40:02 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3C671CC1611; Thu, 15 Oct 2026 22:40:01 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [Internal Review][OE-core][wrynose][PATCH 0/3] python3: upgrade to 3.14.8 and backport security fixes
Date: Thu, 15 Oct 2026 22:39:41 -0700
Message-Id: <20261016053944.3835603-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247930

From: Darsh Kelaiya <dkelaiya@cisco.com>

Upgrade Python 3.14.7 to 3.14.8 on Wrynose and backport fixes for
CVE-2025-15367 and CVE-2026-87910.

The 3.14.8 release addresses CVE-2026-19445, CVE-2026-19553,
CVE-2026-19672, CVE-2026-15310, CVE-2026-15806 and CVE-2026-17084.
The new test_append_limited_history ptest fails with the default
libedit backend on musl. Patch 1 skips only that test on musl while
the libedit interaction remains unresolved.

Patch 2 rejects control characters in POP3 commands to prevent command
injection. This changes behavior for clients whose passwords contain
those characters: they must replace the credentials and handle the new
ValueError as a credential error.

Patch 3 fixes tarfile extraction so a filter rejecting a link fallback
is honored. It also includes the upstream Windows test correction.

Darsh Kelaiya (2):
  python3: fix CVE-2025-15367
  python3: fix CVE-2026-87910

Vijay Anusuri (1):
  python3: upgrade 3.14.7 -> 3.14.8

 .../python/python3/CVE-2025-15367.patch       | 66 +++++++++++++
 .../python/python3/CVE-2026-87910_p1.patch    | 98 +++++++++++++++++++
 .../python/python3/CVE-2026-87910_p2.patch    | 55 +++++++++++
 .../{python3_3.14.7.bb => python3_3.14.8.bb}  |  8 +-
 4 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-15367.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-87910_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-87910_p2.patch
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.8.bb} (98%)

-- 
2.35.6

