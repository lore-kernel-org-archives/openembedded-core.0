Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D54CCA491
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:33 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15610.1792131564069746027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Lw4qYCMN;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3781; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0naZzD3bcH4rYcSwc0NBegEeVEYGvILAJ2kFWfJ66ZE=;
  b=Lw4qYCMNlYKHMtFWJP/jrSEaimQJzXwi3qso3zfnXx9RetPmkSAd8Oei
   CicgRAz2Ras9bm3xDMY0m+gx57MnEEND7l7XGCDZNi8zunhfRZNpT09Rq
   o7BxQ5CaLAHXv27tOPJRQA2jzOr735EDb881549u1bJ6t6sMoNFpKx5CX
   W+2Tz+crWhIjdgJjxZTrA7Ds20DhY75KAB5vw4iIp3Od5AVNXyExDdv+J
   0nWzWw5Vw7QzK4w9vmvub+odfyoev904M6LxM/TL+duHAHETHebPhy0Bc
   7Crdp+yRYohzoWDZTMUSgyryrYMT5TLSDX5z5ewVBMGAVZHB23iyhUZoi
   w==;
X-CSE-ConnectionGUID: qxKWhZuMSRalOxf18Hyy/Q==
X-CSE-MsgGUID: FtCTsLzySoKgIl1ChGlgHQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgDpwNFq/5L/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx2gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAICG?=
 =?us-ascii?q?IENhn4EgxwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeghhMA?=
 =?us-ascii?q?S0QUQErgk4spSehD4QojCKVOhozhASBV5JAklQLmH2OCpZPhGmBaDyBWTMaC?=
 =?us-ascii?q?BsVgyIJShkPjjmDa4UTUch2JzICCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:0cVENq/luXwVHMfSNjpcDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WtKC2qCO/6PYTHzKYx2PIjg900F7JKEydY3GwtspHpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kvLa4n+tRqJFp0/
 Pg/OD5UPjCSlqWPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Mn1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW2boWPIIPRFa25mG62u
 kn65EDrEyodF9O+zWOu8l2oic/2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:pQVTfKs7GI6+frxLXpbn3PHH7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:XEUoG2BDk9G+SN76EzB313EUKN0ASUfUyFDALRboKXd4D4TAHA==
X-Talos-MUID: 9a23:ebePogbevjTDeOBTmSPHuCpGJtZT5IehKURUupUpv8akDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536722738"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 076C6180005A6
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:24 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 4B400CC12A9; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 22/27] python3-git: fix CVE-2026-78676
Date: Thu, 15 Oct 2026 23:19:17 -0700
Message-Id: <20261016061922.843414-23-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247985

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/4b4e47fc1224e23b0c8ee7220a7192818f2e4abb
[2] https://www.cve.org/CVERecord?id=CVE-2026-78676

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-78676.patch   | 55 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
new file mode 100644
index 0000000000..7547158173
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
@@ -0,0 +1,55 @@
+From 414dab405a73c62e70306afc79de3529a1f2a4d0 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 12:22:31 +0200
+Subject: [PATCH 30/38] fix: preserve multiline config values when writing
+
+<!-- agent -->
+GitConfigParser decoded valid multiline values into embedded newlines, but
+_write() serialized those newlines as indented physical lines. Rewriting an
+otherwise unchanged config could therefore change its meaning to Git.
+
+Serialize resident multiline values with Git-compatible escapes inside a
+quoted continuation, preserving GitPython read compatibility while keeping
+each option structurally intact. This addresses GHSA-284h-m62q-gf8w.
+
+The regression starts with an inert multiline value, performs an unrelated
+write, and verifies with both GitPython and git config that it remains one
+value and does not create another option.
+
+Git baseline: config.c parse_value() and write_pair() at cf5497b14c5a escape
+embedded LF as \\n rather than emitting it as a physical config line.
+
+CVE: CVE-2026-78676
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/4b4e47fc1224e23b0c8ee7220a7192818f2e4abb]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 4b4e47fc1224e23b0c8ee7220a7192818f2e4abb)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py |    6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/git/config.py b/git/config.py
+index ff88bd18..cc7091dd 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -665,7 +665,11 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+                     continue
+ 
+                 for v in values:
+-                    fp.write(("\t%s = %s\n" % (key, self._value_to_string(v).replace("\n", "\n\t"))).encode(defenc))
++                    value = self._value_to_string(v)
++                    if any(char in value for char in '\n\t\b\\"'):
++                        value = value.replace("\\", "\\\\").replace('"', '\\"')
++                        value = '"%s\\\n"' % value.replace("\n", "\\n").replace("\t", "\\t").replace("\b", "\\b")
++                    fp.write(("\t%s = %s\n" % (key, value)).encode(defenc))
+                 # END if key is not __name__
+ 
+         # END section writing
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 56d55b14c4..813dd5a3f3 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -45,6 +45,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-76222_p2.patch \
             file://CVE-2026-78678_CVE-2026-78679.patch \
             file://CVE-2026-78677.patch \
+            file://CVE-2026-78676.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


