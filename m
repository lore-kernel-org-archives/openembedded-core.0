Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CB0CCF2C7
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15899.1792131564223008482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Z40AE3Ut;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4974; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jyn/KNkCJVd0aNkSFBYTyY7pjyOTuOZwma7Wme6eC3U=;
  b=Z40AE3UtwP9Qw3OWgGbR6hU3xoGCCXcfQxAutfrSS9Q0FyI/xIWe0N/a
   cO0pA4MJaxSCEdv4jfUZBoHAfQ9A17TDO9yTDGX2tcvc/6RegB8/HszHJ
   zQROtHZ9sJW7Ui4AJgB1thxfZem8Csi14A4HEYWlPbPXTNBZ0KzHc5bNx
   iLRnwNtYKxcjC1xMQrS9tCqnBdGD36TOBenNJvMpZOvNIk/gH4VBdIrAm
   y71/AV3lEy/Mp9YqhIevehUVVFOF6DTly8tUA/vXYP9XLbbmmfQbKhlRm
   q9hkfE1Izk18fSokPBDILCRfLLezJil60pYeeCN4dYx8Y94tAV4ekGKGW
   w==;
X-CSE-ConnectionGUID: 7XJGF4/2Ry2UNV08xob0rA==
X-CSE-MsgGUID: P+jApF9cSJ6u0jKUEKVZ8Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgBrwNFq/4v/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx2gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAICG?=
 =?us-ascii?q?IgLBIINgQ8SgVoelSlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoFyJ?=
 =?us-ascii?q?jsSAR4eUQEQG4FadqVRoQ+EKIwilToaM4VbpRQLmH2OCpUzgRyEaYFoPIFED?=
 =?us-ascii?q?gczGggbFYMiCUoZD445g2uFE1HIdicyAgkyAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:H6o/LKlmUYCfad4z6Vwo3bDo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWW/Vb/jZZmf3fth0O4++phkHu5eByYBjTlQ9/i4xFFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdIo2MlZXSYUz
 +1CFRYzNkCTgOju2pvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYGLI43RFZgI9qqej
 lqF/U3hLEARD/7B1GKH0U+BpdH9zRquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:R8VqEqmTgo+r8uugn4Vt7kYCKHvpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:E+uP22FBGn8E0hYLqmI4xGw7NJxiKEfMlkr2HRfoGWFjEKe8HAo=
X-Talos-MUID: 9a23:ilczSgjMPZjjxOtcYaHdFsMpDIRqyryAWUs2s8sb48unCAFTBQXNtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536193855"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id ECCC318000348
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 2F9ABCBEF8B; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 17/27] python3-git: fix CVE-2026-76218
Date: Thu, 15 Oct 2026 23:19:12 -0700
Message-Id: <20261016061922.843414-18-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247974

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/d9ddb55bdc66ffe8c9932fe460e6b8c8211e47c7
[2] https://www.cve.org/CVERecord?id=CVE-2026-76218

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76218.patch   | 91 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
new file mode 100644
index 0000000000..a9de5abba2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
@@ -0,0 +1,91 @@
+From 7c287bb0e4044b0f0fd8c6423a0b2a2cc05468e4 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 02:48:01 +0000
+Subject: [PATCH 25/38] Guard unsafe git init options
+
+<!-- agent -->
+GHSA-9rj7-rf2p-w77r reports that Repo.init forwarded git-init
+options without applying GitPython's unsafe-option policy. A regression
+showed template and abbreviated option spellings reached Git without an
+UnsafeOptionError and could create the destination before validation.
+
+Add a git-init denylist for template installation and separate Git
+directory redirection, check keyword options before any path or directory
+mutation, and provide the standard explicit allow_unsafe_options escape
+hatch. This preserves trusted uses while rejecting untrusted forwarding by
+default.
+
+An audit against Git cf5497b14c5a24f10c13f7e0ee85cb95af13ea6a
+(v2.55.0.windows.3-16-gcf5497b14c) confirmed that init and clone are the
+built-in commands that consume repository template directories. Clone,
+clone_from, and submodule cloning already share the guarded clone helper;
+the similarly named commit option only reads a commit-message template.
+
+Validated with the focused init regression, the clone/init unsafe-option
+suite, 185 config/Git/index/clone tests, Ruff, and basedpyright.
+
+CVE: CVE-2026-76218
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/d9ddb55bdc66ffe8c9932fe460e6b8c8211e47c7]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit d9ddb55bdc66ffe8c9932fe460e6b8c8211e47c7)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py |   18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 7142f220..772beb75 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -133,6 +133,14 @@ class Repo:
+     re_author_committer_start = re.compile(r"^(author|committer)")
+     re_tab_full_line = re.compile(r"^\t(.*)$")
+ 
++    unsafe_git_init_options = [
++        # Can install hooks that execute during later Git commands:
++        "--template",
++        # Redirects the repository metadata to a caller-controlled path:
++        "--separate-git-dir",
++    ]
++    """Options to :manpage:`git-init(1)` that permit unsafe code execution or I/O."""
++
+     unsafe_git_clone_options = [
+         # Executes arbitrary commands:
+         "--upload-pack",
+@@ -1256,6 +1264,7 @@ class Repo:
+         mkdir: bool = True,
+         odbt: Type[GitCmdObjectDB] = GitCmdObjectDB,
+         expand_vars: bool = True,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "Repo":
+         """Initialize a git repository at the given path if specified.
+@@ -1279,11 +1288,20 @@ class Repo:
+             can lead to information disclosure, allowing attackers to
+             access the contents of environment variables.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options to be used, such as ``--template`` and
++            ``--separate-git-dir``.
++
+         :param kwargs:
+             Keyword arguments serving as additional options to the git-init command.
+ 
+         :return: ``git.Repo`` (the newly created repo)
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=cls.unsafe_git_init_options,
++            )
+         if path:
+             path = expand_path(path, expand_vars)
+         if mkdir and path and not osp.exists(path):
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index a56970cc84..883bd418b1 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -38,6 +38,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-76221.patch \
             file://CVE-2026-76220.patch \
             file://CVE-2026-76219.patch \
+            file://CVE-2026-76218.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


