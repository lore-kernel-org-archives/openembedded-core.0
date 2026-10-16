Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012CACCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:18 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15556.1792129268499960934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UnfkFAPO;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5149; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=t/vQBZjKsGxf4ZSDZPZp0GRkRX0z9Lf7/HyQ/1bNkNo=;
  b=UnfkFAPOIJUjn47L7RkuKnQ5jH8qi7dWSoBzOtZZfIG4zWuawAjdY29p
   Q36R+eP9thFi79dZ3kI6kGZVqgRPK3NBb9MfYwgU3NInoh9VXD8LTtHJb
   F/00xI+waW0P8xwdB4fXdgoBXTe6cmsNqfADmu5LUKU4SsamQgyHMXqB0
   or5kj7QTzIMF5mHEWr2nh2OndROnHhrb+14KJpRfLpwCF2XxlDIMMi8C2
   Ua1xLSLkWDblZsMrfhZPfTwrXpumzRWNBoqazNRTXx3FdYbgkz9VOPme9
   u8N4tNI+g9Vj8HHyF6pe3FBe/6sEdQvCrXjwSm10UYR1tvBhGzsBdmAXz
   w==;
X-CSE-ConnectionGUID: wrzSdSfDSV+sK77gDa+8NQ==
X-CSE-MsgGUID: A/azY6ncTSC3xHRcrNhlBQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgCRt9Fq/4z/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx3gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAEBi?=
 =?us-ascii?q?CUEgg2BDxKBWh6VKUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegXImO?=
 =?us-ascii?q?xIBHh5RARAbgVp2pVGhD4QojCKVOhozhVulFAuYfY4KlTOBHIRpgWg8gSgcA?=
 =?us-ascii?q?wsHMxoIGxWDIglKGQ+OOYNrgX+DZch2JzICCTIBAQcCBw4DC4FokAItgU8BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:mBPHz69OZ1oObt5LWvm0DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2QbUGyFOP3cZzGhetxxPN/go0xVuJCExoRhTwI4+XhEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kpJ58j9t15LVpwt
 uc7d28CQhnA18SPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Un1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW2boCPJYPUHq25mG6x4
 WvUzjr/CS0hH4eP6QCO6FSsgsX2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:kh6wXq4ApEEG/F/qNQPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:7AdVF2M+ANWYC+5DRzN1z0IvFOweTD7G7yiPLGOxSjZPcejA
X-Talos-MUID: 9a23:D9PgjwYIMZxCdOBTnnjllgA8MsxU2I/1GGA3mo8gu82uDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536227763"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 5427D180001EB
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 802A9CBEF7D; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 17/27] python3-git: fix CVE-2026-76218
Date: Thu, 15 Oct 2026 22:40:56 -0700
Message-Id: <20261016054106.210444-18-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247945

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/d9ddb55bdc66ffe8c9932fe460e6b8c8211e47c7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-76218

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76218.patch   | 94 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
new file mode 100644
index 0000000000..4cddebea8a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
@@ -0,0 +1,94 @@
+From e9a64de6632678594079cf3e020cbaff44b31615 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 4 Aug 2026 02:48:01 +0000
+Subject: [PATCH] Guard unsafe git init options
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
+- Omitted test/test_repo.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does 
+  not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit d9ddb55bdc66ffe8c9932fe460e6b8c8211e47c7)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+(cherry picked from commit 2d00b71e80c6faa95a5a93be712bb0b16d701e97)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/repo/base.py | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 4b783586..fd6d660d 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -141,6 +141,14 @@ class Repo:
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
+@@ -1345,6 +1353,7 @@ class Repo:
+         mkdir: bool = True,
+         odbt: Type[GitCmdObjectDB] = GitCmdObjectDB,
+         expand_vars: bool = True,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "Repo":
+         """Initialize a git repository at the given path if specified.
+@@ -1369,6 +1378,10 @@ class Repo:
+             information disclosure, allowing attackers to access the contents of
+             environment variables.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options to be used, such as ``--template`` and
++            ``--separate-git-dir``.
++
+         :param kwargs:
+             Keyword arguments serving as additional options to the
+             :manpage:`git-init(1)` command.
+@@ -1376,6 +1389,11 @@ class Repo:
+         :return:
+             :class:`Repo` (the newly created repo)
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=cls.unsafe_git_init_options,
++            )
+         if path:
+             path = expand_path(path, expand_vars)
+         if mkdir and path and not osp.exists(path):
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 6532a8d8fe..1fadd109dc 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76221.patch \
            file://CVE-2026-76220.patch \
            file://CVE-2026-76219.patch \
+           file://CVE-2026-76218.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


