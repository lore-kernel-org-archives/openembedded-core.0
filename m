Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9268DCCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:29 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15278.1792129282730516981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S0R0lBfx;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6900; q=dns/txt;
  s=iport01; t=1792129283; x=1793338883;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=q3nVjgQwAP82VwQ2c11u995ZVQSiOyCWpgRLcwWn4MQ=;
  b=S0R0lBfxP4vovyiI+wu63RTvphYrWUezrcjtZpkOVR9FE1OTK66UeDQQ
   HEPLt9r7oHyz8UJMGyOIjHu68ETztKTsm6BSTm/6ReMZEekSs0ggD6NMV
   HxKDyOUNjmwsseXVIHTEC9y9r6nj6dBAh/P5sT+TRssQlZqDeXlKZBake
   /ZvSKNjj4nRX7H0RAL22Vc8DmxkMlLGnqWYPzD2xUDtRfiPo3Dtg3Tz39
   iT1JWHr58MzWrCEfvDWUP7PLX1QO5oBZa1BzwwcN//3xJvJmwd8Qeveun
   EITY6Q5hgNhfubAIc4zAfF2awZvlfewgnW6lOP3tKkjUEhzhAMXgoE5vK
   Q==;
X-CSE-ConnectionGUID: Cez3HmX8Sx+HVxnhDJFsMg==
X-CSE-MsgGUID: ZCfCYeWFSw6/MIg7163SRw==
X-IPAS-Result: =?us-ascii?q?A0DkAgCGuNFq/5H/Ja1aHgEBCxIMggULgld1YENJA5Qmg?=
 =?us-ascii?q?iEDi2WSN4F+DwEBAQ9EDQQBAYQ/RgKOFQImNQgOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLyALIwgZgwIBg?=
 =?us-ascii?q?joDNwMRvHiBeTOBAYMpAT8CQ1DYSw0Db4FoAQsUAYE4hUCCf4UkXRgBRIQ4J?=
 =?us-ascii?q?xuBSUSEfoEFgRpCAQGBJ4Z+BIMcEoFagQOUREiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4HkhQegXMlTQEsEFEBCiGBVT6UCY9kgiGBNZ5pcYQojCKPPoV8G?=
 =?us-ascii?q?jOqbwuYfY4KhAmRMS1ohGmBaQE6gUcLBzMaCBsVO4JnCUoZD445g2uBf4Nly?=
 =?us-ascii?q?HYnMgIGAzIBAQcCBw4DC4FokAACJgeBTwEB?=
IronPort-Data: A9a23:vriwRas/8kmL1PgHGjaUlEdNpefnVAFfMUV32f8akzHdYApBsoF/q
 tZmKTqFO/yMMWCgedEgPY+1/UgAv5aGzoI1SQo9rntmQ3sWgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0etlWkFLx
 awjOHMtUACFh86U7qmeRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtKYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIIIzSGJUJwh3wS
 mTuzU/3KSAXC/Kk1mTC11Oj2baRxhjBR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:IwvgvK+jFMPqXEAD2b9uk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:PsLpW2CAwb62+2v6EwJq5hU0H/B1SW2e7EnAJU+UK0hybbLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AmH0RNg6Hi47hRy0Hfdr6a1ozxoxayKqFOU0yv64?=
 =?us-ascii?q?Z5Y6hFCMvYmnGtw6oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528058443"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:07 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 89F8818000443
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 32600CBF203; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 03/27] python3-git: fix CVE-2026-67325
Date: Thu, 15 Oct 2026 22:40:42 -0700
Message-Id: <20261016054106.210444-4-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247956

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/2ab051697940144545a14d2f4a639c6409c3187f
[2] https://github.com/gitpython-developers/GitPython/commit/181e8ede7543dbbdcee92756cea260f675316c63
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-67325

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-git/CVE-2026-67325_p1.patch       | 49 ++++++++++++++++++
 .../python3-git/CVE-2026-67325_p2.patch       | 50 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
new file mode 100644
index 0000000000..94137ec994
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
@@ -0,0 +1,49 @@
+From 048f65847761514ebccf3cd8a889fef7a0068c07 Mon Sep 17 00:00:00 2001
+From: abhiprd2000 <8292aniarc@gmail.com>
+Date: Thu, 9 Jul 2026 21:22:50 +0530
+Subject: [PATCH] Reject abbreviated forms of unsafe git options
+
+CVE: CVE-2026-67325
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/2ab051697940144545a14d2f4a639c6409c3187f]
+
+Backport Changes:
+- Omitted test/test_clone.py because the current PyPI source 
+  archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+(cherry picked from commit 2ab051697940144545a14d2f4a639c6409c3187f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 016d476e38e84439dd325113b4a38133b6d768a0..d6afe26206dd86597cb7bddd653b1de6eca385d9 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -740,13 +740,20 @@ class Git(metaclass=_GitMeta):
+         arbitrary commands. These are blocked by default.
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
+     @classmethod
+     def _option_candidates(cls, args: Sequence[Any] = (), kwargs: Optional[Mapping[str, Any]] = None) -> List[str]:
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch
new file mode 100644
index 0000000000..5060a16ae3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch
@@ -0,0 +1,50 @@
+From 6de6760007664e5e9178b98e616d0b9edc959a53 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 13:45:42 +0200
+Subject: [PATCH] Address review feedback about unsafe option abbreviations
+
+The prefix check could reject otherwise allowed one-letter short options when an unrelated blocked long option began with the same character. Keep exact matches for every spelling, but restrict prefix matching to explicit long options and multi-character kwargs.
+
+This addresses the review comment: single-letter short options and kwargs must not be treated as long-option abbreviations. It also adds coverage for abbreviated unsafe kwargs so both clone validation paths remain protected.
+
+CVE: CVE-2026-67325
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/181e8ede7543dbbdcee92756cea260f675316c63]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_git.py because the current 
+  PyPI source archive does not include the test suite and the 
+  python3-git recipe does not run it.
+
+Reviewd-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 181e8ede7543dbbdcee92756cea260f675316c63)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index f3f08503..d90092c6 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -737,12 +737,20 @@ class Git(metaclass=_GitMeta):
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
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 72eb073196..76a21c670f 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -23,6 +23,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-44244_p2.patch \
            file://CVE-2026-67326.patch \
            file://CVE-2026-67323.patch \
+           file://CVE-2026-67325_p1.patch \
+           file://CVE-2026-67325_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


