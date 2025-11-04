Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EDCCCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:13 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19546.1762267691226942738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ns54QLP7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34029cee97fso5780649a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762267690; x=1762872490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWMrCqZDVM1pCIy0fxqiOWOY/jsUo39b+EEb6K82VLc=;
        b=Ns54QLP7S0dKndyPDY8oUV2cSs3nuh7G29TLBl1zXwVzTupddYv/P0WdmB3lp+kyBE
         zonqJXP/aX4Q0Y9XsTZAEXs3o6ZgN2qgdp3hyr48dvyouXrOQ4KELPFVShgNo5xPc9Zu
         I2XZ9NKFnS8x4v4rvR7HEsYucCWy/8zgoYTVQiXeFzQXyGrhA5alFRq+O3M1eNQ+fo1V
         dCinlDDtrUQm7hZdTks+TZ3qrONZ3tPHmaYbu8Tmj3W38UWYMuJAHaL1NlkOqEfEtiWB
         o/xRlERU03AHQYrg7XNGLlxxNRFfjgkV1oWSApjXNCCyGyb1dL1iiB60Wt31/WnNnaKd
         bK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267690; x=1762872490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWMrCqZDVM1pCIy0fxqiOWOY/jsUo39b+EEb6K82VLc=;
        b=CWzlhedYl4BghRdLnKJUD+vjmbHV/Z3Y0zWlEvDcFhqU3iVG24dA/0/a5p43K5ZXxr
         k1C1AaWY1cZatATi9wgFivC4RUgjsLUdjXMdrprTZbmTDRj8gXxwmNxFfdbkWyQ5b1AF
         FFMo/p56e7DlrDfXPjPUtmEh1/BrdlUjCz1cMU198o860EpZnn5TKi0Uok+2RHVcFVIF
         srsU0AAApGhdilxesCapNMuEhkRFvElGnbtx9W5uGfbZ1OpxkwwwAeqkAqCezhFerEXk
         sAltL8govs5k6BKHG2LSTeIfDgViTr7EhKM3yxFx2iIM6cvPsDs5/oxTxcWpaPa9OvLg
         BuPg==
X-Gm-Message-State: AOJu0Yynu+YneSGnvv8pK1cSAzbouTkcevNmn1meSUZ+rb3rABsYNkIC
	b/lkFNY+G0e294YUc9gSVM56i2ypXFHzYl9cLtJ/kgyohUczZJoujRDI4bu0fG2HfXQn3wso80j
	C09QXrKE=
X-Gm-Gg: ASbGncukggmgdwaQ2s1d+PT9miJJNZBxVJdXfdRmO0V/juVnFJ8Sr1w3l3BnpFKzS+F
	VGjRj6ahvHIJ57fNanabmLYtNT6edEo5SHemP3LRVMxn1bi9IlaBBe3qdBRkOiRhxhfPZTW36gF
	3Tpt/tPX3+1ya7vzTsCk0stc0hDppH2mgs6J1dMxuAz2fhmxWbOenhb/KnD9zYoLuet/w98yyjd
	Lw2fqddQipvROdRoBaoob4zqQQw0IGbh8n7CMHtWjoDrPFLne0Gk2jcqiRHrOs9m7xk/c5RYb30
	6fwYabqWX1HeiIV6J06DpJXNN56WBSTieBRy9ipy+fgAi31yus+qpVqRc6zp/AvWJvpqYAtloTx
	EWQA6ZAoG0s/MjRA+DgQRUOFDXjq6lRV+HYEJSDRm9d/GslHZiDhkU9LbX8WaqhM4PGA=
X-Google-Smtp-Source: AGHT+IE/Q+gLb3S54Jnt09En9sq7qoMuJRflXKcxx7z+ipMOVnJYIvUYCXJTiaQkGvTPmf8E20KbiA==
X-Received: by 2002:a17:90b:5407:b0:340:b152:65c0 with SMTP id 98e67ed59e1d1-340b1527aeemr16558377a91.26.1762267690270;
        Tue, 04 Nov 2025 06:48:10 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1f4f:a6d3:d9bf:780d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm1341481a91.14.2025.11.04.06.48.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:48:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/7] binutils: patch CVE-2025-11413
Date: Tue,  4 Nov 2025 06:47:55 -0800
Message-ID: <b220cccdab44bc707d2c934a3ea81d20b67d14b0.1762267481.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762267481.git.steve@sakoman.com>
References: <cover.1762267481.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225730

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
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-11413.patch    | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index b13c31717d..60b0d03ccd 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -65,5 +65,6 @@ SRC_URI = "\
      file://0027-CVE-2025-8225.patch \
      file://CVE-2025-11414.patch \
      file://CVE-2025-11412.patch \
+     file://CVE-2025-11413.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch
new file mode 100644
index 0000000000..a7697d247f
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
+@@ -5015,6 +5015,13 @@ elf_link_add_object_symbols (bfd *abfd, struct bfd_link_info *info)
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


