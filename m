Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A8EE94105
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 19:13:57 +0000 (UTC)
Received: from bgl-iport-1.cisco.com (bgl-iport-1.cisco.com [72.163.197.25])
 by mx.groups.io with SMTP id smtpd.web11.2807.1696619632294859761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 12:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=PDlfVyba;
 spf=pass (domain: cisco.com, ip: 72.163.197.25, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2813; q=dns/txt; s=iport;
  t=1696619632; x=1697829232;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=If4SrcaIGIgIdkYQuSX/Nn1bewkW8c7ByamPDcCm2a0=;
  b=PDlfVybatPcZdHTT6sCZxrZ1bHhMyf4m31PRJVaLKAeLnJRttdrBjk3G
   vl2MZOBV/ddnVgg8hr5KMg+CvAXNvmGQPZ8CCGbXDdt4oqIK8+fX5q/Sz
   Iy4Q7lRvfE+Mjh2j3gmHKGyL/rw2jaVf5nCYUAaRmAk1KvSdMZYaa/di2
   4=;
X-CSE-ConnectionGUID: vlOmUbT5QXeEIuDfgwUwpw==
X-CSE-MsgGUID: KvHILkpZSmqoZcWSK2doEQ==
X-IronPort-AV: E=Sophos;i="6.03,204,1694736000"; 
   d="scan'208";a="18846854"
Received: from vla196-nat.cisco.com (HELO bgl-core-1.cisco.com) ([72.163.197.24])
  by bgl-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 19:13:48 +0000
Received: from bgl-ads-3120.cisco.com (bgl-ads-3120.cisco.com [173.39.57.7])
	by bgl-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 396JDmVW003765
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 6 Oct 2023 19:13:48 GMT
Received: by bgl-ads-3120.cisco.com (Postfix, from userid 1784405)
	id 57FEECC1280; Sat,  7 Oct 2023 00:43:48 +0530 (IST)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Shinu Chandran <shinucha@cisco.com>
Subject: [[OE-core][dunfell][PATCH] libpcre2 : Follow up fix CVE-2022-1586
Date: Sat,  7 Oct 2023 00:43:45 +0530
Message-Id: <20231006191345.3426504-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 173.39.57.7, bgl-ads-3120.cisco.com
X-Outbound-Node: bgl-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 19:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188782

CVE-2022-1586 was originally fixed by OE commit
https://github.com/openembedded/openembedded-core/commit/7f4daf88b71f
through libpcre2 commit
https://github.com/PCRE2Project/pcre2/commit/50a51cb7e672

The follow up patch is required to resolve a bug in the initial fix[50a51cb7e672]
https://github.com/PCRE2Project/pcre2/commit/d4fa336fbcc3

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-1586
https://security-tracker.debian.org/tracker/CVE-2022-1586

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
 .../libpcre2/CVE-2022-1586-regression.patch   | 30 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch
new file mode 100644
index 0000000000..42ee417fe7
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch
@@ -0,0 +1,30 @@
+From 5d1e62b0155292b994aa1c96d4ed8ce4346ef4c2 Mon Sep 17 00:00:00 2001
+From: Zoltan Herczeg <hzmester@freemail.hu>
+Date: Thu, 24 Mar 2022 05:34:42 +0000
+Subject: [PATCH] Fix incorrect value reading in JIT.
+
+CVE: CVE-2022-1586
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/d4fa336fbcc3]
+
+(cherry picked from commit d4fa336fbcc388f89095b184ba6d99422cfc676c)
+Signed-off-by: Shinu Chandran <shinucha@cisco.com>
+---
+ src/pcre2_jit_compile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
+index 493c96d..fa57942 100644
+--- a/src/pcre2_jit_compile.c
++++ b/src/pcre2_jit_compile.c
+@@ -7188,7 +7188,7 @@ while (*cc != XCL_END)
+     {
+     SLJIT_ASSERT(*cc == XCL_PROP || *cc == XCL_NOTPROP);
+     cc++;
+-    if (*cc == PT_CLIST && *cc == XCL_PROP)
++    if (*cc == PT_CLIST && cc[-1] == XCL_PROP)
+       {
+       other_cases = PRIV(ucd_caseless_sets) + cc[1];
+       while (*other_cases != NOTACHAR)
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
index 3e1b001c32..53277270d2 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://CVE-2022-1586.patch \
+           file://CVE-2022-1586-regression.patch \
 	    file://CVE-2022-1587.patch \
 	    file://CVE-2022-41409.patch \
 "
-- 
2.28.0


