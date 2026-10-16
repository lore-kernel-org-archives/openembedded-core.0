Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F07CCF2C9
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:35 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15612.1792131564472441473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aWNTyXNM;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6976; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Z3aprRDK9i4kQnMS0A4pWCCWxvu1bfw+iXQZ+f1o9MM=;
  b=aWNTyXNMYQA7WmUUJazSMuGy6SHYc0mC49RaOetkiqYAPQ+jHXIvUeEw
   fZfbe/BB5C1Y98MJvoQoHEkV79YmMl+c7JSuXu/nwmGmCQEUmhJLJAbfD
   ddXd2VVyqZyWnbOXsPdNlRvZ3nQKj1crjylzRsqhztMEd8W7854EfeNOi
   JgVSu3L5Qzq+6QQgRW5HF9NfK57SF4lgdKfyyhPR1AxWLZnFbvwSUU6NM
   iDaLh6WLYMYzwFs9FVamCE1AcaynChvtBwvHaef2i5MmTxCI2BrVhSZaP
   JXQtdNT7JCoWWwOqlPNbXksHEK89mLM17aebwmfZEaNWp5DBnE7vFGmwG
   g==;
X-CSE-ConnectionGUID: 8JHpJmfOSy2dBIJRny9ecA==
X-CSE-MsgGUID: HNVpWVK2TcKMWFKFi907dQ==
X-IPAS-Result: =?us-ascii?q?A0BKAgBrwNFq/5D/Ja1RCYJZgld1YENJlCmBNWwDkx6Kf?=
 =?us-ascii?q?hSBag8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRv?=
 =?us-ascii?q?HaBeTOBAYMpAT8CQ1DYSxBvgWgBCxQBgTiFQIgjXRgBRIQ4JxuBSUSBFYNpg?=
 =?us-ascii?q?QWBXAICGIERAQgKAYZmBIMcEoFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IUHoIYRgc9GzYBJQYXgXSTVgIIkBWCIaEPhCiMIpU6GjOEBIFXkkCSV?=
 =?us-ascii?q?AuYfY4KlWcxN4RpgWg8aXAzGggbFYMiCUoZD445g2uFE1FsyAonMgIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:sM8VGqtFZkAduxnZvAUKvtxft+fnVAFfMUV32f8akzHdYApBsoF/q
 tZmKW/QO66PYWLye9kgat6z9kkAv8SDx9NiSlNtq3xnHyNAgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwqsRXGUNL+
 9sjOWoBRDGhveSnkb+wY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIIYHRHpkMzhnwS
 mTu30LHGi4kF4ajwhmgzVyPqO6exXz3YddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:+mHSQK8FqxLTVWyRXjRuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:TGfH6m7STgoalbSpEtsspGw0AuIgfFrm3S3cCW6aM2B4GbCeYArF
X-Talos-MUID: =?us-ascii?q?9a23=3A+QdFvA4rnTwP5ZAfmN1pG09RxoxIxZq2N34uy6k?=
 =?us-ascii?q?NmOy7Gw9eOmbF0ziOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535334187"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 0C86E180003C5
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:24 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 6218DCBEF78; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 26/27] python3-git: fix CVE-2026-87819
Date: Thu, 15 Oct 2026 23:19:21 -0700
Message-Id: <20261016061922.843414-27-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247978

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/751473a5f3221d6f989291cbebcc404353fd3ba8
[2] https://github.com/gitpython-developers/GitPython/commit/bc63b027e2fc737e2ec0222bfa764e1aa76a427f
[3] https://www.cve.org/CVERecord?id=CVE-2026-87819

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-git/CVE-2026-87819_p1.patch       | 78 +++++++++++++++++++
 .../python3-git/CVE-2026-87819_p2.patch       | 58 ++++++++++++++
 .../python/python3-git_3.1.42.bb              |  2 +
 3 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
new file mode 100644
index 0000000000..46ce789834
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
@@ -0,0 +1,78 @@
+From dc8a898eb74ac5614c7ca013de21e30e8dac2e17 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 11 Aug 2026 14:18:25 +0200
+Subject: [PATCH 37/38] fix: parse actor identities without regular expressions
+
+<!-- agent -->
+GHSA-g5vv-9gxw-82hx reports quadratic backtracking when an actor
+identity contains a long unterminated email delimiter.
+
+Add a regression that exercises a 20,000-character malformed identity,
+then replace both actor regexes with direct delimiter scans following
+Git's first-opening, first-closing delimiter behavior. Keep GitPython's
+whole-string fallback when either delimiter is absent.
+
+Reference Git baseline cf5497b14c5a24f10c13f7e0ee85cb95
+ident.c::split_ident_line and its invalid-committer cases in
+t/t9300-fast-import.sh. Also reference gix-actor's signature decoder and
+lenient identity tests.
+
+CVE: CVE-2026-87819
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/751473a5f3221d6f989291cbebcc404353fd3ba8]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 751473a5f3221d6f989291cbebcc404353fd3ba8)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/util.py |   24 ++++++++----------------
+ 1 file changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/git/util.py b/git/util.py
+index d3eaeb8b..292d5671 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -756,10 +756,6 @@ class Actor:
+     can be committers and authors or anything with a name and an email as
+     mentioned in the git log entries."""
+ 
+-    # PRECOMPILED REGEX
+-    name_only_regex = re.compile(r"<(.*)>")
+-    name_email_regex = re.compile(r"(.*) <(.*?)>")
+-
+     # ENVIRONMENT VARIABLES
+     # These are read when creating new commits.
+     env_author_name = "GIT_AUTHOR_NAME"
+@@ -802,18 +798,14 @@ class Actor:
+ 
+         :return: Actor
+         """
+-        m = cls.name_email_regex.search(string)
+-        if m:
+-            name, email = m.groups()
+-            return Actor(name, email)
+-        else:
+-            m = cls.name_only_regex.search(string)
+-            if m:
+-                return Actor(m.group(1), None)
+-            # Assume the best and use the whole string as name.
+-            return Actor(string, None)
+-            # END special case name
+-        # END handle name/email matching
++        line = string.partition("\n")[0]
++        left_bracket = line.find("<")
++        right_bracket = line.find(">", left_bracket + 1)
++        if left_bracket >= 0 and right_bracket >= 0:
++            return Actor(line[:left_bracket].rstrip(), line[left_bracket + 1 : right_bracket])
++
++        # Assume the best and use the whole string as name.
++        return Actor(string, None)
+ 
+     @classmethod
+     def _main_actor(
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch
new file mode 100644
index 0000000000..6ae8f9fa2b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch
@@ -0,0 +1,58 @@
+From 9dbeb7f4547045013db152c84d7dbacbdf12bc62 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Fri, 28 Aug 2026 08:37:50 +0200
+Subject: [PATCH] Restore deprecated Actor regex compatibility
+
+Keep the existing name_email_regex attribute available for Scarthgap
+callers while warning about its quadratic behavior on malformed input.
+The parser continues to use the CVE fix's delimiter scan.
+
+CVE: CVE-2026-87819
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/bc63b027e2fc737e2ec0222bfa764e1aa76a427f]
+
+Backport Changes:
+- Keep the Scarthgap Actor._from_string API and fold only the deprecated
+  regex shim; Actor.from_string was added after 3.1.42.
+- Omit the upstream regression tests because the current PyPI source
+  archive does not include its test suite.
+
+(cherry picked from commit bc63b027e2fc737e2ec0222bfa764e1aa76a427f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/util.py |   15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/git/util.py b/git/util.py
+index 292d5671..d2f1915b 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -751,11 +751,26 @@ class CallableRemoteProgress(RemoteProgress):
+         self._callable(*args, **kwargs)
+ 
+ 
++class _DeprecatedActorNameEmailRegex:
++    _pattern = re.compile(r"(.*) <(.*?)>")
++
++    def __get__(self, _instance: Any, _owner: Any) -> Pattern[str]:
++        warnings.warn(
++            "Actor.name_email_regex is deprecated because matching long malformed strings can take quadratic time. "
++            "Use Actor._from_string() to parse actor identities, or Actor(name, email) when the fields are separate.",
++            DeprecationWarning,
++            stacklevel=2,
++        )
++        return self._pattern
++
++
+ class Actor:
+     """Actors hold information about a person acting on the repository. They
+     can be committers and authors or anything with a name and an email as
+     mentioned in the git log entries."""
+ 
++    name_email_regex = _DeprecatedActorNameEmailRegex()
++
+     # ENVIRONMENT VARIABLES
+     # These are read when creating new commits.
+     env_author_name = "GIT_AUTHOR_NAME"
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 71275b0861..0102e8c329 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -49,6 +49,8 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-78675.patch \
             file://CVE-2026-87817.patch \
             file://CVE-2026-87818.patch \
+            file://CVE-2026-87819_p1.patch \
+            file://CVE-2026-87819_p2.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


