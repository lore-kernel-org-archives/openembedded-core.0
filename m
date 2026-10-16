Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E9FCCF2C6
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:18 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15274.1792129268537946542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WEIM+W72;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3764; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BLsnZyGBsWCsayrkfyNM0mq7mcmfqPR1fAlPCyh25tM=;
  b=WEIM+W72mQ5WF1ScROn0Mf7Kt0cr3JC+pKB5/usY0QGne9HvD6wajaE6
   eZoO33rkc4z2qdL4xUi0IsuHwUL+YLbHHkrGBWGt3qbRSulyshFawc/HI
   9OI2FfL0A+U+LnZ7ldSR38wcT6M9+9MMJrYpecZSDGDTaFm+dBj15o2yY
   lNwKW01xQLW4DQ+pPnRF9k5ItzfmF2whZbZOMFYYuOWj1bvsLZi+OXzJq
   fBSC3CccRR1XZ2alf+VgEZHkiiUfFynmc/cq6CVn20JxzxVwoW/TavSQa
   WjeWmGjTpCoeNTXW9jV4S3U2xnGKeEhXcLeRcbquaCPyyN5qW2WCUentq
   g==;
X-CSE-ConnectionGUID: 3jarvX8PSdm/TjsFXGYEYw==
X-CSE-MsgGUID: JJP+0KEtTZG897M3OhKlrQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgAeuNFq/4r/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOeHIF+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3A?=
 =?us-ascii?q?xG8eIF5M4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWDa?=
 =?us-ascii?q?YEFgVwBAYglBIINgQ8SgVqBA4QLkDlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IUHoIYTT1RASuCO5MokB2CIaEPhCiMIpU6GjOqbwuYfY4Klk+EaYFoP?=
 =?us-ascii?q?IFHCwczGggbFTuCZwlKGQ+OOYNrgX+DZch2JzICBgMyAQEHAgcOAwuBaJACL?=
 =?us-ascii?q?YFPAQE?=
IronPort-Data: A9a23:WKc2mKyxod7CeuzJCPZ6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUFx
 2QXCGiPbvnYZ2LxKo9xa4rk8E5V75CHx95jTgE9+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBo0NJcGyrZPOm1Ls
 sAaMx49QSGutv3jldpXSsE07igiBNPgMIVavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bM3WjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeOzbIWNIYzaLSlTtmS6n
 iGe3EnlPiM1ZI3A7GGi8lGonNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:hBj0Ba9E73lA60MmMJduk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:tENbt2z5jeGviVcLDcQRBgVPGMk/bE2N9EzcJgiEC31HeJKkZG6PrfY=
X-Talos-MUID: 9a23:GHQb3AQp2KrPmGSFRXTOpgkhbORF/5icJxBczrBdnMmnMTZJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536470388"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id EA07B180001D6
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 47E22CBEF98; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 07/27] python3-git: fix CVE-2026-73625
Date: Thu, 15 Oct 2026 22:40:46 -0700
Message-Id: <20261016054106.210444-8-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247940

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/e8d0fbf774d1f6baa3b481adfe48bd262e43b453
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73625

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73625.patch   | 59 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
new file mode 100644
index 0000000000..6fcdfc88b4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
@@ -0,0 +1,59 @@
+From ef95f1434023af72deabaf91e7154260d4625271 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:39:00 +0200
+Subject: [PATCH] fix: validate split short-option values
+
+<!-- agent -->
+
+Single-character keyword arguments are transformed into an option token and
+a separate value token. The unsafe-option candidate builder only checked the
+keyword name, allowing an option-like value to bypass guards shared by clone,
+remote, revision, blame, and archive operations.
+
+Include dash-prefixed values only when short options are actually split,
+including sequence values, while preserving bare values and the non-splitting
+compatibility path.
+
+Git baseline a23bace9 defines clone -n and --upload-pack as distinct options,
+matching the argv boundary this validation now preserves.
+
+Refs GHSA-r9mr-m37c-5fr3.
+
+CVE: CVE-2026-73625
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/e8d0fbf774d1f6baa3b481adfe48bd262e43b453]
+
+Backport Changes:
+- Omitted test/test_git.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does 
+  not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit e8d0fbf774d1f6baa3b481adfe48bd262e43b453)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 58d219e3..e2c4bf73 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -806,11 +806,18 @@ class Git(metaclass=_GitMeta):
+             option for option in cls._unpack_args([arg for arg in args if arg is not None]) if option.startswith("-")
+         ]
+         if kwargs:
++            split_single_char_options = kwargs.get("split_single_char_options", True)
+             for key, value in kwargs.items():
+                 values = value if isinstance(value, (list, tuple)) else (value,)
+                 if any(value is True or (value is not False and value is not None) for value in values):
+                     key = str(key)
+                     options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
++                    if len(key) == 1 and split_single_char_options:
++                        options.extend(
++                            str(value)
++                            for value in values
++                            if value is not True and value not in (False, None) and str(value).startswith("-")
++                        )
+         return options
+ 
+     class AutoInterrupt:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 781ec512cc..551b47fc39 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67324.patch \
            file://CVE-2026-67322.patch \
            file://CVE-2026-69097.patch \
+           file://CVE-2026-73625.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


