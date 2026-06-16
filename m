Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA3BCD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 06:31:52 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148032.1781591506978816286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Esfv78uX;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4637; q=dns/txt;
  s=iport01; t=1781591507; x=1782801107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lreMcbvLhwfUEYDJDibfmVGPKqhcEA3vlY8vD1jTHMo=;
  b=Esfv78uXuO9GafMM1wTv9Y8CDxXs3pm6Dty4WBQ83y9WEptJUrYShU9X
   0zSXcRcB4lvCiwQLKtsCl6U3WJjrxk2yr3tWjktY6otQMJdSPJAGYRsZ5
   AJmmbIQ52DyD+Y4UyYWI6AogS8Uo6410xcGq11XYpQ4XS2zvgJ1mheBhc
   EydZIAANdu0MjMbMbuZXAn1neeQPITKu+uIbOHpyiG+uR9sK/YKw8UK9A
   gKZ/tJxvhS3LtHkc7YlFDo/efmZz/eaNCvSj+bZS16jkid0FtjHxMuHQ0
   RTsSU/aoHFjeE9sWCkuCeujjt2uU9I0q+3SL9/B2ii8Q5Zpz5U+FIdlXM
   g==;
X-CSE-ConnectionGUID: hg91Xty/Sd2A54QY2Tigmg==
X-CSE-MsgGUID: BXxcWzM4Qt6sGUTQM+o6FQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgBK7TBq/4v/Ja1aHgEBCxIMggULgld0X0JJlkueH?=
 =?us-ascii?q?oF+DwEBAQ9EDQQBAYRARo1BAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgE1ARgBLSwBAgECWh0GIYMCAYJzAgERsWaCLIEBg?=
 =?us-ascii?q?ygBMQUJAkNQ2ywBCxQBBYEzhT+DHAGFAlsYAYR8JxsbgXKEfoEFgVwBAYEnh?=
 =?us-ascii?q?n4EgiKBDIFaGAaPG0iBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbB?=
 =?us-ascii?q?wWBHoIPgQWFDyMfAzl/gW+BJWdmFTA1gQEBER8KOgMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?GUXD4FLcnsTASuBG4EiPaUooQ8KKIN1jCGVOhozhVulEZkIizeCU5U0gRyEa?=
 =?us-ascii?q?IFoPIFHCwdwFYMiCUoZD444g2uBf8ZDJDUCCTIBAQcCBwEBCwEDC4FokACBf?=
 =?us-ascii?q?QEB?=
IronPort-Data: A9a23:576Po65wpETsuUJNiGnPeAxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jcZDT2CPquLN2r9Ktt+ao+z/RgA7ZXWyNI2GgVk+SA8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNtvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ePYJJo9ZrECZ1+
 aYxdWw0X0q/hu2zz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYeUrsUIMpWcOOAnWHiaD1Aq1u9rqss6G+Vxwt0uFToGIaEJ4faFJgFxi50o
 Ersz3TyPQM/aOWDlyGqz06Vo6zIww3CDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:F6pKpa+AE/seWt3IhT9uk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HLoB17726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ876U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:4yTyy2AnTgLydXH6EylopRckBtFiSXGH5SqMGn7iNWdmTbLAHA==
X-Talos-MUID: 9a23:WEGEbQhjXZvXGYHTYiTXosMpHvd46Ju8LRw0jcsdlPS4DAkzPGmztWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,207,1774310400"; 
   d="scan'208";a="495389580"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Jun 2026 06:31:45 +0000
Received: from sjc-ads-3321.cisco.com (sjc-ads-3321.cisco.com [171.68.249.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id C0AE818000206;
	Tue, 16 Jun 2026 06:31:45 +0000 (GMT)
Received: by sjc-ads-3321.cisco.com (Postfix, from userid 1839047)
	id 68805CC1243; Mon, 15 Jun 2026 23:31:45 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 1/2] libsolv: Fix CVE-2026-9150
Date: Mon, 15 Jun 2026 23:31:35 -0700
Message-Id: <20260616063136.2772168-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3321.cisco.com [171.68.249.19];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.19, sjc-ads-3321.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238868

From: Shubham Pushpkar <spushpka@cisco.com>

This patch applies the upstream fix as referenced in [1], using the CVE advisory shown in [2].
[1] https://github.com/openSUSE/libsolv/commit/c5b5db52aebde00bdeacecf4d0569c217ab3187d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-9150

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../libsolv/0001-Fix-CVE-2026-9150.patch      | 71 +++++++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-Fix-CVE-2026-9150.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Fix-CVE-2026-9150.patch b/meta/recipes-extended/libsolv/libsolv/0001-Fix-CVE-2026-9150.patch
new file mode 100644
index 0000000000..d1f02b8956
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-Fix-CVE-2026-9150.patch
@@ -0,0 +1,71 @@
+From 5393983e5b71808151fea4b895a0952ab6bd8a48 Mon Sep 17 00:00:00 2001
+From: Petr Písař <ppisar@redhat.com>
+Date: Wed, 22 Apr 2026 09:18:29 +0200
+Subject: [PATCH 1/2] Fix a buffer overflow when copying SHA-384/512 checksum
+ from a Debian repository
+
+When parsing Debian repository, control2solvable() copies a package
+checksum string from the repository into a stack-allocated "char
+checksum[32 * 2 + 1]" array.
+
+If the repository defined a SHA384 or SHA512 tag, a buffer overflow
+occured (as can be seen when compiling libsolv with CFLAGS='-O0 -g
+-fsanitize=address') because those tag values are longer:
+
+    $ cat /tmp/Packages
+    Package: p
+    Version: 1
+    Architecture: all
+    SHA512: 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
+
+    $ /tmp/b/tools/deb2solv -r /tmp/Packages
+    =================================================================
+    ==3695==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7b685ecf0071 at pc 0x7f6861683722 b
+    p 0x7fff37e3e7a0 sp 0x7fff37e3df60
+    WRITE of size 129 at 0x7b685ecf0071 thread T0
+        #0 0x7f6861683721 in strcpy.part.0 (/lib64/libasan.so.8+0x83721) (BuildId: 80bfc4ae44fdec6ef5fecfb01e2b57d28660991c)
+        #1 0x7f6861d7f34d in control2solvable /home/test/libsolv/ext/repo_deb.c:491
+        #2 0x7f6861d804ea in repo_add_debpackages /home/test/libsolv/ext/repo_deb.c:622
+        #3 0x000000400fd5 in main /home/test/libsolv/tools/deb2solv.c:134
+        #4 0x7f686123c680 in __libc_start_call_main (/lib64/libc.so.6+0x3680) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+        #5 0x7f686123c797 in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3797) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+        #6 0x000000400694 in _start (/tmp/b/tools/deb2solv+0x400694) (BuildId: a3350337819a51edd0c75293970d3458b5033bc9)
+
+    Address 0x7b685ecf0071 is located in stack of thread T0 at offset 113 in frame
+        #0 0x7f6861d7de2a in control2solvable /home/test/libsolv/ext/repo_deb.c:365
+
+      This frame has 1 object(s):
+        [48, 113) 'checksum' (line 371) <== Memory access at offset 113 overflows this variable
+
+This patch fixes it by enlarging the buffer to accomodate the longest
+supported digest string.
+
+This flaw was introduced with c8164bfecf2ba8bcf4c24329534d3104f19da73c
+commit ("[ABI BREAKAGE] add support for SHA224/384/512").
+
+Reported by Aisle Research.
+
+CVE: CVE-2026-9150
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/c5b5db52aebde00bdeacecf4d0569c217ab3187d]
+
+(cherry picked from commit c5b5db52aebde00bdeacecf4d0569c217ab3187d)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ ext/repo_deb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/repo_deb.c b/ext/repo_deb.c
+index d400f959..25eaf8cb 100644
+--- a/ext/repo_deb.c
++++ b/ext/repo_deb.c
+@@ -368,7 +368,7 @@ control2solvable(Solvable *s, Repodata *data, char *control)
+   char *p, *q, *end, *tag;
+   int x, l;
+   int havesource = 0;
+-  char checksum[32 * 2 + 1];
++  char checksum[64 * 2 + 1];
+   Id checksumtype = 0;
+   Id newtype;
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
index 201059323a..2b1b079ce1 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
@@ -10,6 +10,7 @@ DEPENDS = "expat zlib zstd"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
+           file://0001-Fix-CVE-2026-9150.patch \
 "
 
 SRCREV = "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"
-- 
2.35.6


