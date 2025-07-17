Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E494C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:56:01 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.40206.1752720958709177977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T2yTYcKY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so1143121a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720958; x=1753325758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6syUaQuyzTaWcwvLYzCpGg1KmKN7nGdhKdQqoyw/LLk=;
        b=T2yTYcKYdadEQ/zgKpg4+HVCgHQY2glS8xFYEi0Py6kgi76hjYNALma71LsBI9rIOb
         pF8slAVTMsj8uBL4IpGe3igHSwDRkfqG3NioreQk+SvLrRgQGwALGAKebR8mU15DBq3f
         HUlK9A9E4ovgBx6w3StpAXTvH9W0ETC4X+2R+76MIXvMubbUQzWRThjMVDd5FmmnTqjz
         +A1/siKIbrLGSnXDHvyBcUV1jnsNIILs9N1pptboRML9DJ8E9CvU/qFjb8ME/zhrHD14
         1IkPZzUxdQAd9MosOOy+NSVMSmexkNcoReJpoMaPiVCkSgb6PdivtbXXZBOvzh+s082/
         O6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720958; x=1753325758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6syUaQuyzTaWcwvLYzCpGg1KmKN7nGdhKdQqoyw/LLk=;
        b=EXZoe/Fg0SQ1H3z9c4wFmfMTxUUgVBj6oLZdur5mfknPTuhtBnm2TkjPH82iPUmslk
         Lrp4a9jukV//S0CJTqbmd3pIaxw5i4EkRrrWgpRn6X6fpjwsyGCiQS8D4Y0d0a3qu2nQ
         mFy7sI5xbIZBHE3HfYFuMxQUFRRKjLzWG2vZqOvVhjkEO4O5S0gjnJr1B45v7E1b3ixY
         OProuFUPbZbQ1A+u8idaeOflPbcGJG5IUb145r5vWqNjyBeC3gdUwXaBIcpiMrtKAMDr
         pArlq/havITQhxwINRuQ+CS+GVb6FWLChLXuDPIWDbYoHWOahoK7VwP5cdCsA5GYN0L+
         V9sA==
X-Gm-Message-State: AOJu0Yww5v5E3GzxK922+mGASOIEC3Y7gk1XIDsgRMfg5tONbBq02n1D
	DJuTEZ5pvYnW2/mOox+z/Dqw0ABkHRgm8wOEa8A0/33z2u8ko0q5s/LFl5r75f2mCjbwHbuxC6Z
	uqYu4
X-Gm-Gg: ASbGncsOWwQgUA1HrETD948IOTDSfDV0oBokAWCw1DKWy1wbDRD7Fi4AkoWFBfCPbQc
	XE1yBX40E5qKapcIUqaPNe2Sa9N5NsA+ci7cosf34/yLpLQOCIiZHYTtW+P1HDESkmgga2Fjoh+
	huc/rGcqpcCsRm4YMqhjtPOkJ88RcB7fQRteES7HOJMjejkSzb9kkblD4rRyD74beKrMjVjfj79
	W+RhPUipYY3iJ5i/zGp/QrRjGykAJK2JdV4X2JidNVOKY79CZMmPQylEKRdZ7o8wHSZ8gdkCyLK
	L79FjqSwusK99yoV5m2zrz+ikgBC58908qKWyGJXrwhgvMbapGgsKe5Nojh60IyZOhVRuso4tH1
	ktq7clNgSX1H5Sw==
X-Google-Smtp-Source: AGHT+IGyEHdRl2atcqgKfwFR+/zh1PRBS8mLNVHUFPLlmKOsqpzVFBjN7AsWVp12M3bGHpT+Fuoc5w==
X-Received: by 2002:a17:90b:2f06:b0:311:83d3:fd9c with SMTP id 98e67ed59e1d1-31cae8786c9mr2579909a91.0.1752720957860;
        Wed, 16 Jul 2025 19:55:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/13] binutils: Fix CVE-2025-7545
Date: Wed, 16 Jul 2025 19:55:33 -0700
Message-ID: <9730ddc98bd961d4e2b5b79fa60a2dde1d2a3301.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220496

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

objcopy: Don't extend the output section size
Since the output section contents are copied from the input, don't
extend the output section size beyond the input section size.

Backport a patch from upstream to fix CVE-2025-7545
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0019-CVE-2025-7545.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 0f0befe30e..8a26fe76f1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -43,5 +43,6 @@ SRC_URI = "\
      file://0016-CVE-2025-5244.patch \
      file://0016-CVE-2025-3198.patch \
      file://0018-CVE-2025-5245.patch \
+     file://0019-CVE-2025-7545.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch
new file mode 100644
index 0000000000..062d6721b6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-7545.patch
@@ -0,0 +1,39 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:36:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
+CVE: CVE-2025-7545
+
+Since the output section contents are copied from the input, don't
+extend the output section size beyond the input section size.
+
+	PR binutils/33049
+	* objcopy.c (copy_section): Don't extend the output section
+	size beyond the input section size.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objcopy.c b/binutils/objcopy.c
+index e2e6bd7e..3cbb3977 100644
+--- a/binutils/objcopy.c
++++ b/binutils/objcopy.c
+@@ -4634,6 +4634,7 @@ copy_section (bfd *ibfd, sec_ptr isection, bfd *obfd)
+ 	  char *to = (char *) memhunk;
+ 	  char *end = (char *) memhunk + size;
+ 	  int i;
++	  bfd_size_type memhunk_size = size;
+ 
+ 	  /* If the section address is not exactly divisible by the interleave,
+ 	     then we must bias the from address.  If the copy_byte is less than
+@@ -4653,6 +4654,11 @@ copy_section (bfd *ibfd, sec_ptr isection, bfd *obfd)
+ 	      }
+ 
+ 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
++
++          /* Don't extend the output section size.  */
++          if (size > memhunk_size)
++            size = memhunk_size;
++	  
+ 	  osection->lma /= interleave;
+ 	  if (copy_byte < extra)
+ 	    osection->lma++;
-- 
2.43.0


