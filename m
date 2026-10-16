Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A54CCF2CE
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:35 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15610.1792131564069746027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NRoNSpbH;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6743; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZQqPNM+qr7Dvl1ExF5CDWnYPWgMromlqKcavUZVsUTE=;
  b=NRoNSpbHbgVipb93S+Ei0asnJqe8y5Jhbuk64gV1hFO71q7gbtlklY5n
   ZxvwRm2coqFBOKRy3peT0KTcWvsaca1Ayw1RHc3u/pGjiYIodsX5IjB78
   2bETZ3nf/OkhHQL7fEt61Mpr3gqtswqmR515O9hmKv4yobgot8ET2QfjZ
   OgSoSNPizTN5h61f8pqKypnm3l4Pd89nKKks8x1/Z6tJNJjgNuU2GYpxz
   IX24xGcBO58MU16YCXFDVNBo4/hPUs3v78A9ACNhhEFIRNF7/3kAgKW1R
   muFsTA2md5j5LgswfZ79e1qYrzLSze7CG8mBtcX0R8yY2ZxwnGUA9Yipj
   A==;
X-CSE-ConnectionGUID: 13uANjqvTvy6vacVEHBIYA==
X-CSE-MsgGUID: cfsqRvs9SQOWMCh37CUf5g==
X-IPAS-Result: =?us-ascii?q?A0BcAgDpwNFq/4v/Ja1aHgEBCxIMggULgld1YENJA5Qmg?=
 =?us-ascii?q?iEDi2WSN4F+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIvIAsjCBmDAgGCO?=
 =?us-ascii?q?gM3AxG8doIsgQGDKQE/AkNQ2EsNA2+BaAELFAGBOIVAgn+FJF0YAYR8JxuBS?=
 =?us-ascii?q?USEfoEFgRpCAgIYgQ2GfgSDHBKBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeSFB6BcyVNASwQUQEKIYFNCD6UCY9kgiGBNZ5pcYQojCKPPoV8GjOqb?=
 =?us-ascii?q?wuYfY4KhAmRMS1ohGmBaDyBWTMaCBsVgyIJShkPjjmDa4UTUch2JzICBgMyA?=
 =?us-ascii?q?QEHAgcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:INwY2qo1+BNAFqqgp7sI7U9nVDNeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmOa/7bNDD1KIojOtu29BgO7J7VzYU3QQtp+yswFn8S9ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0r8sHEho9
 +UGFC4cMA6KjNyb4Jiae8A506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fUGp8PwRzIz
 o7A12/3GQggKsfO8gOizVeHhrSQth71BY1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn288Vte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:eKl0wKiUNP+BuBB+09ohmo6xunBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:WvHmS21LbUKfzBqWbUWc6rxfQ5s4W1vf1WnsPV7mF29idpC1Y36h0fYx
X-Talos-MUID: 9a23:4McxaAZW4dnHZeBTvDH3nQt8L5ZT2oORLWsNysothsfZOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536722728"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 383B01800022B
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id D2033CC12A9; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 03/27] python3-git: fix CVE-2026-67325
Date: Thu, 15 Oct 2026 23:18:58 -0700
Message-Id: <20261016061922.843414-4-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247971

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/2ab051697940144545a14d2f4a639c6409c3187f
[2] https://github.com/gitpython-developers/GitPython/commit/181e8ede7543dbbdcee92756cea260f675316c63
[3] https://www.cve.org/CVERecord?id=CVE-2026-67325

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-git/CVE-2026-67325_p1.patch       | 50 +++++++++++++++++
 .../python3-git/CVE-2026-67325_p2.patch       | 53 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  2 +
 3 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
new file mode 100644
index 0000000000..7c49ff0543
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
@@ -0,0 +1,50 @@
+From 2375813d552210675950e73cbdad1baec3be8d74 Mon Sep 17 00:00:00 2001
+From: abhiprd2000 <8292aniarc@gmail.com>
+Date: Thu, 9 Jul 2026 21:22:50 +0530
+Subject: [PATCH 09/38] Reject abbreviated forms of unsafe git options
+
+CVE: CVE-2026-67325
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/2ab051697940144545a14d2f4a639c6409c3187f]
+
+Backport Changes:
+- Omit upstream regression test changes because the current 
+  PyPI source archive does not include its test suite.
+
+(cherry picked from commit 2ab051697940144545a14d2f4a639c6409c3187f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py |   17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index c09d47ba..e965c586 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -563,13 +563,20 @@ class Git(LazyMixin):
+         arbitrary commands, this are blocked by default.
+         """
+         # Options can be of the form `foo`, `--foo`, `--foo bar`, or `--foo=bar`.
++        # Git accepts any unambiguous prefix of a long option, so an abbreviated
++        # spelling such as `--upl` for `--upload-pack` must be rejected too. An
++        # option is unsafe if its canonical name is a prefix of any blocked
++        # option's canonical name.
+         canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
+         for option in options:
+-            unsafe_option = canonical_unsafe_options.get(cls._canonicalize_option_name(option))
+-            if unsafe_option is not None:
+-                raise UnsafeOptionError(
+-                    f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
+-                )
++            candidate = cls._canonicalize_option_name(option)
++            if not candidate:
++                continue
++            for canonical, unsafe_option in canonical_unsafe_options.items():
++                if canonical.startswith(candidate):
++                    raise UnsafeOptionError(
++                        f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
++                    )
+ 
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch
new file mode 100644
index 0000000000..6fcbb20d48
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch
@@ -0,0 +1,53 @@
+From de30c364114907e1cb240ea8ce0e7aadd9ef32b2 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 13:45:42 +0200
+Subject: [PATCH 10/38] Address review feedback about unsafe option
+ abbreviations
+
+The prefix check could reject otherwise allowed one-letter short options when an unrelated blocked long option began with the same character. Keep exact matches for every spelling, but restrict prefix matching to explicit long options and multi-character kwargs.
+
+This addresses the review comment: single-letter short options and kwargs must not be treated as long-option abbreviations. It also adds coverage for abbreviated unsafe kwargs so both clone validation paths remain protected.
+
+Reviewd-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+
+CVE: CVE-2026-67325
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/181e8ede7543dbbdcee92756cea260f675316c63]
+
+Backport Changes:
+- Omit upstream regression test changes because the current 
+  PyPI source archive does not include its test suite.
+
+(cherry picked from commit 181e8ede7543dbbdcee92756cea260f675316c63)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index e965c586..8e8cd0c5 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -566,12 +566,20 @@ class Git(LazyMixin):
+         # Git accepts any unambiguous prefix of a long option, so an abbreviated
+         # spelling such as `--upl` for `--upload-pack` must be rejected too. An
+         # option is unsafe if its canonical name is a prefix of any blocked
+-        # option's canonical name.
++        # option's canonical name. Only long options and multi-character kwargs
++        # can be abbreviations; single-character short options remain exact-match
++        # only.
+         canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
++        options_are_kwargs = all(not option.startswith("-") for option in options)
+         for option in options:
+             candidate = cls._canonicalize_option_name(option)
+             if not candidate:
+                 continue
++            unsafe_option = canonical_unsafe_options.get(candidate)
++            if unsafe_option is not None:
++                raise UnsafeOptionError(f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it.")
++            if not (option.startswith("--") or (options_are_kwargs and len(candidate) > 1)):
++                continue
+             for canonical, unsafe_option in canonical_unsafe_options.items():
+                 if canonical.startswith(candidate):
+                     raise UnsafeOptionError(
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index f3d2c9de80..a36a0faa29 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -23,6 +23,8 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-42215_p2.patch \
             file://CVE-2026-67326.patch \
             file://CVE-2026-67323.patch \
+            file://CVE-2026-67325_p1.patch \
+            file://CVE-2026-67325_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


