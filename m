Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955C3CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:37 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2247.1762203576661307495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dI0Jg1UU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7930132f59aso6891515b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203576; x=1762808376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuXNNoOnf/N4PPPt3nT3XdSn8s9ATKupZLau7hbXZOI=;
        b=dI0Jg1UUNcNE7AIoc74r6K9S43BFack0DyFagaeWjO1CPGguDGa8bfWfqiTLVQrmf6
         6Bj2/hVtyQXMcpnhcGER0W1Is76ljhdONqotRlT58WtoI/QKO+vOmb6lFcmOaJMk3N0v
         W+2K/LLJDiKjqTaf8+dSCyU0162DhOFbQj/yb2uayujxobYHiaHYG1rIttXu+zg61TJ9
         uuBiN7+hW6h/lMhaJdvesBtY98VPME/jwAooOBpBzmg8cIMUfk4zR4RcLa52TNtqZnIt
         6ixz8Dh5+Wf2T1Fobu3Bp3rBWGRlSlrVAnyb6dv7c7kgQIybIoI0kn0rZVx30FliDCPy
         wNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203576; x=1762808376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuXNNoOnf/N4PPPt3nT3XdSn8s9ATKupZLau7hbXZOI=;
        b=NT/OB2eHj+2+kHcNK79Ebdf7NZeMvvUYWr7ibb9p14Op10xEuCZ1va7uU/cGLYn1Jx
         8uOFQTfk9gQIoPbHGS/sWwVymeIwNxQBfXh0q7dp5/3ICbGaPwLFsypAIRvSxqT34rMh
         XZawJq3Bq4RkWuFaJIIOnSgSqzPS01kKj95mWIjpvzX5FG2tbQTgVynAn36H1A9ZmqtM
         kbdb1s3X2+sqxEd6wMtnJG/V7OKE7jgO3cIlTW4TPuSCbh78dIFG7E2MxQkQkYpll1h6
         aCO/afQFR8B6iUNeosWFnDIzjAcrNYWbxfpU2Sm83KmbQTY0LR7ObgafYtfrYIADufnJ
         WGRw==
X-Gm-Message-State: AOJu0YwVjpWhlf/lYN97St+sgwEBYMi2UhNvm0QzO33+d2TifmgjuhbH
	MzLRT1h65hhK0V1lIkjVEPYuQtav5zkzbYqkpzTIatL3qmv57BT8Qa1khIbDbJ3o6L0N0JxUQks
	dztLsnvI=
X-Gm-Gg: ASbGncuqZ+8vX2mvAX6AVXbN8YPju/6ybwf84nCK76IAQdf0v6acuASFMLrU28QWCl9
	P57pP4tqQkSE0zCnns4SANYrHBww4PDIAdaJQUGc5y0X3Hm3ovaSJhygKB9i0wEpNGAQYDBJptG
	/VTPt9Vhff3gCwZfH0311iQk26gjl36NIpeAgIZf9aAgQ7D2F8tRUiWtF2K1NqLyc04oAp/Cwqd
	sZ/snF+tXTB/gZFKWmTSA2cL6szPMtfvPOhYC9I/0L/I4adiux0dPM6l3bwUa6yLgLUg+MS1R0e
	MZxEoRXZ1ic6B92o/acI3PsJkKPFD2/ARnIpVL+xLc6GRHi9vLsN4ZxOBtKusietwqzLmMfct1B
	jMXYwMfFB2ETs1HCd/6+2mLEDyEawNrJTdiDTB/MmIsPvg0nZlOgcFDKDdta50zqxIPcCWOp8Xq
	mwsMTz9TpqlFpi
X-Google-Smtp-Source: AGHT+IFCAfsTsQfJFmWpqDo3qsb8pCrwwdbN/59NZEumdWcJIY+zV+/uoqBoftvnfCdezg3C82PMJQ==
X-Received: by 2002:a05:6a20:a10c:b0:341:4171:b5ae with SMTP id adf61e73a8af0-348cce0aa9emr17587081637.52.1762203575925;
        Mon, 03 Nov 2025 12:59:35 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] binutils: patch CVE-2025-11413
Date: Mon,  3 Nov 2025 12:59:12 -0800
Message-ID: <8d1a830c713a299f67fc512ed8bc0be21be4b9f0.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762203396.git.steve@sakoman.com>
References: <cover.1762203396.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225701

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

Note that there were two patches for this, first [1] and then [2].
The second patch moved the original patch to different location.
Cherry-pick of second patch is successful leaving out the code removing
the code from first location, so the patch attached here is not
identical to the upstream commit but is identical to applying both and
merging them to a single patch.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=1108620d7a521f1c85d2f629031ce0fbae14e331
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=72efdf166aa0ed72ecc69fc2349af6591a7a19c0

(From OE-Core rev: 98df728e6136d04af0f4922b7ffbeffb704de395)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/binutils/CVE-2025-11413.patch    | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 39f2827f78..d5ad3c0ecb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -85,5 +85,6 @@ SRC_URI = "\
      file://0046-CVE-2025-11081.patch \
      file://0047-CVE-2025-8225.patch \
      file://CVE-2025-11412.patch \
+     file://CVE-2025-11413.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch
new file mode 100644
index 0000000000..bfd1be7787
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch
@@ -0,0 +1,38 @@
+From 72efdf166aa0ed72ecc69fc2349af6591a7a19c0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 25 Sep 2025 10:41:32 +0930
+Subject: [PATCH] Re: elf: Disallow the empty global symbol name
+
+sparc64-linux-gnu  +FAIL: selective2
+sparc64-linux-gnu  +FAIL: selective3
+
+	PR ld/33456
+	* elflink.c (elf_link_add_object_symbols): Move new check later
+	to give the backend add_symbol_hook a chance to remove symbols
+	with empty names.
+
+CVE: CVE-2025-11413
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=72efdf166aa0ed72ecc69fc2349af6591a7a19c0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elflink.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 0a0456177c2..5c8b822e36a 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -4931,6 +4931,13 @@ elf_link_add_object_symbols (bfd *abfd, struct bfd_link_info *info)
+ 	    continue;
+ 	}
+ 
++      if (name[0] == '\0')
++	{
++	  _bfd_error_handler (_("%pB: corrupt symbol table"), abfd);
++	  bfd_set_error (bfd_error_bad_value);
++	  goto error_free_vers;
++	}
++
+       /* Sanity check that all possibilities were handled.  */
+       if (sec == NULL)
+ 	abort ();
-- 
2.43.0


