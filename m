Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3CCCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:35 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15610.1792131564069746027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QViBk5ya;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3404; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qW9373qpKUB35qvYSl/EgXxzTTZwjon0uZ2DLKYYuhk=;
  b=QViBk5yaJVVCZcoWl8r/Nqi5SLlSSAzlHC08TovyYYhE4L+EeFvBedzt
   0wWJXuUUtloMAAJLJS6wPZM75UydVCcTWyclGOgqGXSHUiycz4mk5rcei
   wOmW8f3AK3ZTGt0jjzIkGwOZUJlaPFxiXwUAfT9OcmFkHjtYpD7C1BoW2
   fvq2KBUiYv0RGAPQXsS56Iku3Yydo6iGW6gS66R20qf0e1d1TcHYx+5rA
   HCUXoY12hrlaHsV3Ya4Vh7msNDh4BOMGAtZ1aEJIeXtiZhG+4zjjUeCL8
   g0rFAg4e692XQw/AnRUGr5Ue5Hnj8tLIMsxeUbhp8IKUalrnlzQ6UVQ6Y
   Q==;
X-CSE-ConnectionGUID: 5qouyMk/RvOrVkbLOXX8dg==
X-CSE-MsgGUID: QOszDEg5QEeoJ58IWhuYqQ==
X-IPAS-Result: =?us-ascii?q?A0BKAgDpwNFq/4r/Ja1aHgE8DA4LgVmCV3VgQ0mUKYIhA?=
 =?us-ascii?q?54cgX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDE?=
 =?us-ascii?q?bx2gXkzgQGDKQE/AgJAAVDYSxBvgWgBCxQBgTiFQIgjXRgBhHwnG4FJRIEVg?=
 =?us-ascii?q?2mBBYFcAgIYiAsEgxwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?hQeghg7Ej0bCS0BK4JKBqVRoQ+EKIwilToaM4VbpRQLmH2OCpZPhGmBaDyBW?=
 =?us-ascii?q?TMaCBsVgyIJShkPjjmDa4UTUch2JzICCTIBAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:Tolbya7N05Uor1M51QglPwxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mdOXjyFb6rfamShKNF2b9++pBkOupOGyINgSVE5qC09Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eYJQf5/dSAiZ06
 9sCFjMHSjezt7K6z+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4SKIIbVHp49ckCwn
 0Xd7UjUDUwjGdGY62fV002sm97WpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rAnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:aDL4j68NmaWeD/XM02Juk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:oe/TSW+4mCp5IaB8pdKVvxMNHd00V36a9mn3OXG7A0JOeI3FRVDFrQ==
X-Talos-MUID: 9a23:4llgwwqxa0yy+VVwkEAezwhFL9VEzqvzMW0Alrdb6+i7NTFBIg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536722733"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 92B291800028F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id ECDC8CC124E; Thu, 15 Oct 2026 23:19:22 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 08/27] python3-git: fix CVE-2026-73623
Date: Thu, 15 Oct 2026 23:19:03 -0700
Message-Id: <20261016061922.843414-9-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247980

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/ffcb5359e87619f4fe4a70a4aff5f08c5580ba97
[2] https://www.cve.org/CVERecord?id=CVE-2026-73623

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73623.patch   | 54 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
new file mode 100644
index 0000000000..ebfa4a1fab
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
@@ -0,0 +1,54 @@
+From 915629fa543e06f6066441f8ba13c68f89304104 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 04:43:26 +0200
+Subject: [PATCH 16/38] fix: reject unsafe clone templates
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
+- Omit upstream regression test changes because the current
+  PyPI source archive does not include its test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit ffcb5359e87619f4fe4a70a4aff5f08c5580ba97)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 0440a92d..0d4fae8a 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -140,6 +140,8 @@ class Repo:
+         # Can override configuration variables that execute arbitrary commands:
+         "--config",
+         "-c",
++        # Can install hooks that execute during clone:
++        "--template",
+     ]
+     """Options to ``git clone`` that allow arbitrary commands to be executed.
+ 
+@@ -150,6 +152,9 @@ class Repo:
+     The ``--config``/``-c`` option allows users to override configuration variables like
+     ``protocol.allow`` and ``core.gitProxy`` to execute arbitrary commands:
+     https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---configltkeygtltvaluegt
++
++    The ``--template`` option can install hooks that execute during clone:
++    https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---templatetemplate-directory
+     """
+ 
+     unsafe_git_archive_options = [
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 18132b8af9..959186eeee 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -29,6 +29,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-67322.patch \
             file://CVE-2026-69097.patch \
             file://CVE-2026-73625.patch \
+            file://CVE-2026-73623.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


