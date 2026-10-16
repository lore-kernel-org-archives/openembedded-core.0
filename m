Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CACCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15275.1792129268839428503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gD9p5yII;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10195; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=C3qg4eGi8QmH+wUse0UKTH4lDI9j9nOGRi66QbW02hg=;
  b=gD9p5yIIbqcxmUtTvHD6qTMi0GWd04wwZe33qDYjgiLMcg7tWzH1XFqD
   ktfysvLxiT0FXQ4uD8B7w2QOroqpsFe8iNOWNgwrwoIvPdGESyFfbaTqQ
   2LpgALkByx2W1PA3MwNgChC0Er73O42NEMFF9CcXD/a6Hvzs4BuyKzDri
   x/xuO45Oi5YJnTIe5mVXdl4TNtQN7PxmjdX/X9SxWUHv1BVCYtqf+YFoc
   N+Y6mc7o/qOJFEaKeLLuMDA+6g+lFSfrMLRWP5DawTTfwmEOQOTGqZ9Gd
   u+MUXvcnLaBfPALjXGCRaFrqLJnirvzL6NCzmJq0FhylAkouz7Yfzlgdn
   A==;
X-CSE-ConnectionGUID: 2jil8o37To6pR57gACsGdQ==
X-CSE-MsgGUID: N8BkGIb3ThS+CoJIKpMVsA==
X-IPAS-Result: =?us-ascii?q?A0BKAgCGuNFq/4r/Ja1RCYJZgld1YENJlCmBNWwDkx6Kf?=
 =?us-ascii?q?hSBag8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgjoDNwMRv?=
 =?us-ascii?q?HiBeTOBAYMpAT8CQ1DYSxBvgWgBCxQBgTiFQIgjXRgBRIQ4JxuBSUSBFYNpg?=
 =?us-ascii?q?QVLAYEQAQGBKwEICgEHhl8EgxwSgVqBTZN6SIEeA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeSFB6BXRYlRgcBPBs2ASUGFz+BNQiTTgIIkBWCIaEPhCiMIpU6G?=
 =?us-ascii?q?jOEBIFXkkCSVAuYfY4KlWcxN4RpgWg8aV4LBzMaCBsVgyIJShkPjjmBY4IIg?=
 =?us-ascii?q?X+DZWzICicyAgkyAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:cBOQpq37j6cdrDucMfbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzQOx
 2cXDTiHb/2MZmKjet5/YIrgo0kG7ZPSyoRnHANv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGVkM3Od0foblLBj9Wz
 6FHJxkmdT+PvrfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsi+ayaIuLJ4PiqcN9uBayp
 U3n9T/FAipZH9u96Bmd10y3r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:fQuqxqEpzLN+xTFgpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:GxTQXmF9aMRRHojBqmI99k8QSsd+LUHakm/qfhC3IE1yZ7GsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ARCKZgQ2Ce9EpwR7pt9RQAGwkizUjxfSEC28sm84?=
 =?us-ascii?q?6u/LHHitSGhSFqQqsa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536709657"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 63E22180001D6
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id B80FFCC8C93; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 26/27] python3-git: Fix CVE-2026-87819
Date: Thu, 15 Oct 2026 22:41:05 -0700
Message-Id: <20261016054106.210444-27-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247953

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/751473a5f3221d6f989291cbebcc404353fd3ba8
[2] https://github.com/gitpython-developers/GitPython/commit/bc63b027e2fc737e2ec0222bfa764e1aa76a427f
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-87819

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-git/CVE-2026-87819_p1.patch       |  77 ++++++++++
 .../python3-git/CVE-2026-87819_p2.patch       | 139 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   2 +
 3 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
new file mode 100644
index 0000000000..9dfbb6ccc6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
@@ -0,0 +1,77 @@
+From 47e0d430af6885ceeaa38a8c5517efac872b70b4 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 11 Aug 2026 14:18:25 +0200
+Subject: [PATCH] fix: parse actor identities without regular expressions
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
+- Omitted test/test_actor.py because the current PyPI source 
+  archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 751473a5f3221d6f989291cbebcc404353fd3ba8)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/util.py | 24 ++++++++----------------
+ 1 file changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/git/util.py b/git/util.py
+index 9619937c..9a698e6d 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -772,10 +772,6 @@ class Actor:
+     committers and authors or anything with a name and an email as mentioned in the git
+     log entries."""
+ 
+-    # PRECOMPILED REGEX
+-    name_only_regex = re.compile(r"<(.*)>")
+-    name_email_regex = re.compile(r"(.*) <(.*?)>")
+-
+     # ENVIRONMENT VARIABLES
+     # These are read when creating new commits.
+     env_author_name = "GIT_AUTHOR_NAME"
+@@ -820,18 +816,14 @@ class Actor:
+         :return:
+             :class:`Actor`
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
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch
new file mode 100644
index 0000000000..a92f5e7738
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch
@@ -0,0 +1,139 @@
+From 0d63f66a673cfcad25a1fd85f56177d19a1b6547 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Fri, 28 Aug 2026 08:37:50 +0200
+Subject: [PATCH] fix: restore Actor.name_email_regex (#2220)
+
+<!-- agent -->
+GitPython 3.1.60 removed the Actor.name_email_regex class attribute while
+replacing internal actor parsing, which broke downstream consumers such as
+python-semantic-release.
+
+Bring back the historical compiled pattern for downstream compatibility,
+but emit DeprecationWarning whenever the class member is accessed. The warning
+explains its quadratic behavior on long malformed strings and points callers to
+the public Actor(name, email) constructor when fields are separate, or direct
+string parsing when they are not.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+
+Add public Actor.from_string constructor (#2220)
+
+Promote the existing actor identity parser to Actor.from_string while retaining _from_string as a compatibility alias. Point the name_email_regex deprecation warning to the new public constructor or Actor(name, email).
+
+Validation:
+- actor-related test/test_actor.py and test/test_util.py cases: 12 passed
+- ruff check and format checks passed
+- basedpyright git/util.py: no errors
+
+Co-authored-by: Codex GPT-5 <codex@openai.com>
+
+Address review feedback about Actor subclasses
+
+Review feedback: Actor.from_string() should preserve the class on which the public classmethod is called instead of always returning a base Actor.
+
+Construct through cls on both parsing paths and cover subclass construction directly.
+
+Validation:
+- actor-related test/test_actor.py and test/test_util.py cases: 13 passed
+- ruff check and format checks passed
+- basedpyright git/util.py: no errors
+
+Address review feedback about constructor typing
+
+Review feedback: Actor.from_string() constructs subclasses at runtime but its Actor return annotation prevents type checkers from preserving subclass-specific members.
+
+Use the project existing Python 3.7-compatible bound TypeVar pattern so the declared return type follows cls.
+
+Validation:
+- actor-related test/test_actor.py and test/test_util.py cases: 13 passed
+- ruff check and format checks passed
+- basedpyright git/util.py: no errors
+
+CVE: CVE-2026-87819
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/bc63b027e2fc737e2ec0222bfa764e1aa76a427f]
+
+Backport Changes:
+- Omitted test/test_actor.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does not 
+  run it.
+
+Co-authored-by: Codex GPT-5 <codex@openai.com>
+(cherry picked from commit bc63b027e2fc737e2ec0222bfa764e1aa76a427f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/util.py | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/git/util.py b/git/util.py
+index 9a698e6d..16cd25ef 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -80,6 +80,7 @@ from typing import (
+     Sequence,
+     Tuple,
+     TYPE_CHECKING,
++    Type,
+     TypeVar,
+     Union,
+     cast,
+@@ -108,6 +109,7 @@ from git.types import (
+ 
+ T_IterableObj = TypeVar("T_IterableObj", bound=Union["IterableObj", "Has_id_attribute"], covariant=True)
+ # So IterableList[Head] is subtype of IterableList[IterableObj].
++T_Actor = TypeVar("T_Actor", bound="Actor")
+ 
+ _logger = logging.getLogger(__name__)
+ 
+@@ -767,11 +769,27 @@ class CallableRemoteProgress(RemoteProgress):
+         self._callable(*args, **kwargs)
+ 
+ 
++class _DeprecatedActorNameEmailRegex:
++    _pattern = re.compile(r"(.*) <(.*?)>")
++
++    def __get__(self, _instance: Any, _owner: Any) -> Pattern[str]:
++        warnings.warn(
++            "Actor.name_email_regex is deprecated and will be removed in GitPython 4.0.0 because searching long "
++            "malformed strings with it can take quadratic time. Use Actor.from_string() to parse actor identities, "
++            "or Actor(name, email) when the fields are already separate.",
++            DeprecationWarning,
++            stacklevel=2,
++        )
++        return self._pattern
++
++
+ class Actor:
+     """Actors hold information about a person acting on the repository. They can be
+     committers and authors or anything with a name and an email as mentioned in the git
+     log entries."""
+ 
++    name_email_regex = _DeprecatedActorNameEmailRegex()
++
+     # ENVIRONMENT VARIABLES
+     # These are read when creating new commits.
+     env_author_name = "GIT_AUTHOR_NAME"
+@@ -805,7 +823,7 @@ class Actor:
+         return '<git.Actor "%s <%s>">' % (self.name, self.email)
+ 
+     @classmethod
+-    def _from_string(cls, string: str) -> "Actor":
++    def from_string(cls: Type[T_Actor], string: str) -> T_Actor:
+         """Create an :class:`Actor` from a string.
+ 
+         :param string:
+@@ -820,10 +838,12 @@ class Actor:
+         left_bracket = line.find("<")
+         right_bracket = line.find(">", left_bracket + 1)
+         if left_bracket >= 0 and right_bracket >= 0:
+-            return Actor(line[:left_bracket].rstrip(), line[left_bracket + 1 : right_bracket])
++            return cls(line[:left_bracket].rstrip(), line[left_bracket + 1 : right_bracket])
+ 
+         # Assume the best and use the whole string as name.
+-        return Actor(string, None)
++        return cls(string, None)
++
++    _from_string = from_string
+ 
+     @classmethod
+     def _main_actor(
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 9e12fb4f1e..13bcc5bbdc 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -49,6 +49,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78675.patch \
            file://CVE-2026-87817.patch \
            file://CVE-2026-87818.patch \
+           file://CVE-2026-87819_p1.patch \
+           file://CVE-2026-87819_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


