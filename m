Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19F310FCAC0
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 18:16:24 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20254.1775067376487489375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 11:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LmuQi05G;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3435; q=dns/txt;
  s=iport01; t=1775067376; x=1776276976;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vmb0SO8FGM7SLDnqopgZeDWMhXyGkJVOYVkXKf5d2Ds=;
  b=LmuQi05GyCGcFASXuUi1NEzZ+91ByV8SON0CHB8QVWfQf3FEw9oAqPmT
   QiyAyOqEPs9IgnqTuEEcdQRUceaantxOCbIh0gyYwmQt9Gr5GopQPUcfi
   XjQ1vEPFtamh3+b4qUyQa8Jt+u5EApVthl8ko+n0RPqGJr1d29CNc9H1c
   wFbGnlVbB0eW84JyQOwUV4CU7Hj4jWFFE4IJEbRVHpclOmONorFzd3fnz
   GGpRQ86c50JxwF6O7gu8NeCZ1mZsQH1UJD7lXhz9HTXptV5kHuNd3VEvr
   QQAFQwqi7nyuoBVP/K/GcwZdaojkES2nsmg6Foj6cJqc/mK8RrXiKS7H/
   w==;
X-CSE-ConnectionGUID: kbVnvf7JTzaI6cP4gzw4GQ==
X-CSE-MsgGUID: pKFx7X95T727cXLG8KCDhw==
X-IPAS-Result: =?us-ascii?q?A0BCBwCuX81p/5T/Ja1aglmCSA9xXkNJA5ZInh2Bfw8BA?=
 =?us-ascii?q?QEPRA0EAQGFB40nAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBKgsBRiwDAQJaIyEbgmcBgnMDEbRzgXkzgQGDaAJDT?=
 =?us-ascii?q?9smAQsUAYE4hT6IHFsYAYR6JxsbgXKBFYNogQWBXAEBgScRhmwEgiJ6FIFhH?=
 =?us-ascii?q?oJBBoJNiV1IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBS4dcd?=
 =?us-ascii?q?G2BE4N+TgMLGA1IESw3FBsEPm4Hi3ApgjY9UQErXT4qZxGTAGmReqEOCiiDd?=
 =?us-ascii?q?IwelToaM4VbpRALmHuLNoJTllCEaIFoPIFHCwdwFYMiCUkZD444g2mBf8IaJ?=
 =?us-ascii?q?jILAzABBwIHDgKBc5AAASeBVQEB?=
IronPort-Data: A9a23:W+oA3qLiietqkNIHFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3zJTy
 WceDGuObqmDY2Gne4sibYi38htU7JeBnNRrSlQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9h2Ytajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1tBn8wI4NH2NplCEAQ/
 sREJyISMj+60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLo3kOCuiXDlfhVTqUmeouw85G27IAlZj+Cza4GIIoTRLSlTtl67i
 HKZzzWkPk5Aa9ev7RXV0VmAhvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:SwD7PK/iJc4pWlW2bshuk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoI0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: 9a23:s6Wt2m1+d6B/hRQSWzm1lrxfGcobdGPTk1XsMUaZV21RFLKHVgO/wfYx
X-Talos-MUID: 9a23:R/VougWYOs0mi0bq/CfPqiE9BJY13/v0V0s9tbpWmOKoNTMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,153,1770595200"; 
   d="scan'208";a="706335003"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Apr 2026 18:16:15 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 78A6818000148;
	Wed,  1 Apr 2026 18:16:15 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id F0A53CC12A6; Wed,  1 Apr 2026 11:16:14 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [Whinlatter] [PATCH v3 1/2] vim: Fix CVE-2026-25749
Date: Wed,  1 Apr 2026 11:15:47 -0700
Message-ID: <20260401181604.3148278-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 18:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234455

From: Anil Dongare <adongare@cisco.com>

Pick patch from [1] also mentioned in [2]
[1] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../vim/files/CVE-2026-25749.patch            | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/recipes-support/vim/files/CVE-2026-25749.patch
new file mode 100644
index 0000000000..8b04379b9b
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
@@ -0,0 +1,64 @@
+From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 5 Feb 2026 18:51:54 +0000
+Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in 'helpfile'
+ option handling
+
+Problem:  [security]: buffer-overflow in 'helpfile' option handling by
+          using strcpy without bound checks (Rahul Hoysala)
+Solution: Limit strncpy to the length of the buffer (MAXPATHL)
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
+
+CVE: CVE-2026-25749
+Upstream-Status: Backport [https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9]
+
+Backport Changes:
+- Excluded changes to src/version.c and runtime/doc/version9.txt
+  from this backport. This file only tracks upstream version increments.
+  We are applying a security fix, not a version upgrade. These changes
+  were skipped to maintain current package versioning and avoid merge conflicts.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tag.c                 | 2 +-
+ src/testdir/test_help.vim | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/tag.c b/src/tag.c
+index 6912e8743..a32bbb245 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -3348,7 +3348,7 @@ get_tagfname(
+ 	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf == NUL)
+ 		return FAIL;
+ 	    ++tnp->tn_hf_idx;
+-	    STRCPY(buf, p_hf);
++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
+ 	    STRCPY(gettail(buf), "tags");
+ #ifdef BACKSLASH_IN_FILENAME
+ 	    slash_adjust(buf);
+diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
+index dac153d86..f9e4686bb 100644
+--- a/src/testdir/test_help.vim
++++ b/src/testdir/test_help.vim
+@@ -222,4 +222,13 @@ func Test_helptag_navigation()
+ endfunc
+ 
+ 
++" This caused a buffer overflow
++func Test_helpfile_overflow()
++  let _helpfile = &helpfile
++  let &helpfile = repeat('A', 5000)
++  help
++  helpclose
++  let &helpfile = _helpfile
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c730f1d0cf..044117a57f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-25749.patch \
            "
 
 PV .= ".1683"
-- 
2.44.1


