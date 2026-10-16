Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E2FCCF2C8
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15610.1792131564069746027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PxAamFAi;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4124; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lxy8VCrHQYzFxr7ExFQ+R7gOFgTgTNkQE16utKmPmVU=;
  b=PxAamFAi7+77CMQ+chitS42z1SaOy2GZfKeniCApYsISUgUw+1RjL5PL
   PFTlaySNGDlGuf9WcK0pm70lpcAkmEs5NF9qqbv1UpJdrnQEe5UwOSD89
   9G8iP4+Cmoa2owFI2EJmKQFQ/Ysg05XIWSfH2/o4AnW9PxPnbpRkWT5Ls
   Gca/LyS0UEOz8/eUjiP2R8aI3hdRauSLjlKqFH0hnzMW4ETxBYMat9K+o
   X13GZV2v16h9gBdSxUOsqQ9ei5bTj+z2m2nASsv0GIOUTGEWbMXh2tLij
   xGBocXGWkfZE7WViZE+Bvffp5IXjxTwK+rxVApjOtQ439uZ+dxiqAshnX
   g==;
X-CSE-ConnectionGUID: CbcDELaFT1a/5CpZso6gtA==
X-CSE-MsgGUID: RApqbDGjTuqaJqYPTm9Hcw==
X-IPAS-Result: =?us-ascii?q?A0BIAgDpwNFq/5D/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx2gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAICG?=
 =?us-ascii?q?IgLBIMcEoFaGJUvSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CGE09U?=
 =?us-ascii?q?QEKIUaBGiVJkxWQHYIhoQ+EKIwilToaM4VbpRQLmH2OCpZPhGmBaDyBWTMaC?=
 =?us-ascii?q?BsVgyIJShkPjjmDa4UTUch2JzICCTIBAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:/OZQh66UmOHLZivuWgrhSwxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mUeX2vVPfvbZ2ajeIx+bI21oRkH7cOEzYRhTQFppH0yZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eFocT1stTCE9yr
 PVfdRsVXAuE2e2q6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4SKIIbVHp89ckCwn
 Eve5m7VLRMmKcWW6yO0yk6p18/EgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rBnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:S5IEG6hAWXj+LmvhLd5DptYSV3BQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:d5aZS2ONLxA4cu5DcyNs2GMwE+4ZK3SakVzIEVS/V2l1YejA
X-Talos-MUID: 9a23:z234WAhyWNy2QFmrd1lQqcMpDu5w+q6CJ0IxjIwPmdC1DRB1aheWk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536722732"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 8841D180003C5
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id E1D43CC124C; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 06/27] python3-git: fix CVE-2026-69097
Date: Thu, 15 Oct 2026 23:19:01 -0700
Message-Id: <20261016061922.843414-7-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247975

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/1ed1b924f4e2d2ee7bab296df77b978af21853f1
[2] https://www.cve.org/CVERecord?id=CVE-2026-69097

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-69097.patch   | 61 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
new file mode 100644
index 0000000000..9d472d3358
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
@@ -0,0 +1,61 @@
+From 128f8da8dac072f61427b5bf7801173915d69b85 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Mon, 20 Jul 2026 14:13:22 +0200
+Subject: [PATCH 14/38] fix: validate config section delimiters
+
+GHSA-3rp5-jjmw-4wv2 identified that configuration section names could alter the
+structure of serialized config despite the existing control-character checks.
+
+Reject unquoted closing section delimiters across all writer entry points
+while preserving valid delimiters inside quoted subsections and the
+existing option-name behavior. Add regression coverage for unsafe plain and
+quoted-subsection-shaped names as well as a valid quoted subsection.
+
+Git baseline: a23bace963d508bd96983cc637131392d3face18. Git config parsing
+treats an unquoted closing bracket as the end of a basic section header, while
+its extended form permits brackets inside a quoted subsection and requires a
+final bracket after the closing quote.
+
+CVE: CVE-2026-69097
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/1ed1b924f4e2d2ee7bab296df77b978af21853f1]
+
+Backport Changes:
+- Omit upstream regression test changes because the current 
+  PyPI source archive does not include its test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 1ed1b924f4e2d2ee7bab296df77b978af21853f1)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py |   16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/git/config.py b/git/config.py
+index 1df1415f..3015bb73 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -854,6 +854,22 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+     def _assure_config_name_safe(self, name: "cp._SectionName", label: str) -> None:
+         if isinstance(name, str) and UNSAFE_CONFIG_CHARS_RE.search(name):
+             raise ValueError("Git config %s names must not contain CR, LF, or NUL" % label)
++        if label == "section" and isinstance(name, str):
++            in_quotes = False
++            escaped = False
++            for index, char in enumerate(name):
++                if escaped:
++                    escaped = False
++                elif in_quotes and char == "\\":
++                    escaped = True
++                elif char == '"':
++                    if not in_quotes and (index == 0 or name[index - 1] not in " \t"):
++                        raise ValueError("Git config quoted subsection names must begin after whitespace")
++                    in_quotes = not in_quotes
++                elif char == "]" and not in_quotes:
++                    raise ValueError("Git config section names must not contain an unquoted closing bracket")
++            if in_quotes:
++                raise ValueError("Git config section names must not contain an unterminated quote")
+ 
+     @needs_values
+     @set_dirty_and_flush_changes
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index cbfdb5e757..c5cefeaee8 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -27,6 +27,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-67325_p2.patch \
             file://CVE-2026-67324.patch \
             file://CVE-2026-67322.patch \
+            file://CVE-2026-69097.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


