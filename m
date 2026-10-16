Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003B9CCF2C9
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:19 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15556.1792129268499960934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KS5r6GkG;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3428; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OQK68m8DrIcmmF5KziU1fdDIpf22yqE+e3LdZvl3L7c=;
  b=KS5r6GkGK1wmR8Q3sTVyDHaFxbQ00Lt/qtu39cjpd6mO/JarY5IxPIQk
   EWZ0dgJkL0XKueC/dP11hq1qGpxvC4O+FFTCRAvzmVJp3Wg+Ud21+qITd
   Lr9beN8FeXPS+YKqN3Dz7neO+YlnfTUOfST59b3CWWZ/IGXkxqWQS6t4w
   NrBb2Z5ywFUx3cT8rLWFsrWFOXX1hSu0ZR+AgWRFjvK3Zi2681i+lvPrO
   PjWH40qBeCaR4Gcrdq23emH9d8iMu3Qu12f68cL6JZmssthwHFSxLU+h9
   DdF4MtDEXr+7kXPok0GElRVUEZOnNhKfmQwShjntnNy9D27SQIYPUar4C
   Q==;
X-CSE-ConnectionGUID: oiThnxBWRYWcwLBxvd0jHw==
X-CSE-MsgGUID: ksH9N37mTneimdfrXYWW2w==
X-IPAS-Result: =?us-ascii?q?A0BKAgCRt9Fq/4r/Ja1aHgE8DA4LgVmCV3VgQ0mUKYIhA?=
 =?us-ascii?q?54cgX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDE?=
 =?us-ascii?q?bx3gXkzgQGDKQE/AgJAAVDYSxBvgWgBCxQBgTiFQIgjXRgBhHwnG4FJRIEVg?=
 =?us-ascii?q?2mBBYFcAQECiCMEgxwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?hQeghg7Ej0bCS0BK4JKBqVRoQ+EKIwilToaM4VbpRQLmH2OCpZPhGmBaDyBR?=
 =?us-ascii?q?wsHMxoIGxWDIglKGQ+OOYNrgX+DZch2JzICCTIBAQcCBw4DC4FokAItgU8BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:G2znKqrn1ABG5XGkpvgY1h270rpeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmDOvvZZGL2ed0kYIjg/RwC78XdxodgSgY9/3hkFClH8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uF2PWFI5
 dYnEgEyZQ+nrfKozOq5avY506zPLOGzVG8ekmtrwTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWPrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fUH58KwRjCz
 o7A12fiIkA8b4Oa9TyI83egiPX/rBzEAp1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:OqHtIagyri2vaPheie29L101sHBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AlvU4c2t4DUmyzrff6NGIWUu46Isic0Hdymf6HHW?=
 =?us-ascii?q?JNm12bJeFV1PI+oN7xp8=3D?=
X-Talos-MUID: 9a23:EAA3NgkkHVz2ha7CgLeQdnphL+c5xf/xDXwLnJQDt8eeBR1PBG2C2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536227762"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id EC8BE18000283
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 4EF3ECBEFAB; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 08/27] python3-git: fix CVE-2026-73623
Date: Thu, 15 Oct 2026 22:40:47 -0700
Message-Id: <20261016054106.210444-9-yurade@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247938

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/ffcb5359e87619f4fe4a70a4aff5f08c5580ba97
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73623

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73623.patch   | 53 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
new file mode 100644
index 0000000000..56c2582ce3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
@@ -0,0 +1,53 @@
+From 3621c3099fef859e91f9f960707902018a370978 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:43:26 +0200
+Subject: [PATCH] fix: reject unsafe clone templates
+
+<!-- agent -->
+
+Treat git clone --template as unsafe because caller-controlled
+templates can install hooks that execute during clone.
+
+Add regression coverage for both direct option and keyword forms.
+
+References GHSA-6p8h-3wgx-97gf.
+Validated against Git baseline a23bace9.
+
+CVE: CVE-2026-73623
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/ffcb5359e87619f4fe4a70a4aff5f08c5580ba97]
+
+Backport Changes:
+- Omitted test/test_clone.py because the current PyPI 
+  source archive does not include the test suite and 
+  the python3-git recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit ffcb5359e87619f4fe4a70a4aff5f08c5580ba97)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index d661f036..2776c19e 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -148,6 +148,8 @@ class Repo:
+         # Can override configuration variables that execute arbitrary commands:
+         "--config",
+         "-c",
++        # Can install hooks that execute during clone:
++        "--template",
+     ]
+     """Options to :manpage:`git-clone(1)` that allow arbitrary commands to be executed.
+ 
+@@ -158,6 +160,9 @@ class Repo:
+     The ``--config``/``-c`` option allows users to override configuration variables like
+     ``protocol.allow`` and ``core.gitProxy`` to execute arbitrary commands:
+     https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---configltkeygtltvaluegt
++
++    The ``--template`` option can install hooks that execute during clone:
++    https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---templatetemplate-directory
+     """
+ 
+     unsafe_git_archive_options = [
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 551b47fc39..d996d4f9f5 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67322.patch \
            file://CVE-2026-69097.patch \
            file://CVE-2026-73625.patch \
+           file://CVE-2026-73623.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


