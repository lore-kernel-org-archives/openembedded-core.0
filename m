Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72471CCF9E5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 18:07:57 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.15393.1761502073196012067
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 11:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PLXlH3a4;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so4048191a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761502072; x=1762106872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WcaBR5sXZqsA8KkRi2DD3Ahm0QMMTHBjL/2KCXh670=;
        b=PLXlH3a4CiFYxwo4GkAlhBKjPJYA3kX5SWz4bKPqx/wzftRYTbpo92Pem2KyOXT19V
         DW2QJ20iqEOpbN2voes8yKlNP9KpmzfCWKzMofQjfjYDkj4JwPhxD4pg5phvMUMy++ed
         eeozMc0s68kw16D3Eaj+pnCP+hovwg6CcAeDIuPOPyewz3xqCvW9KTXHybJAh0SynMYW
         5yGCh7eKIm32Uqlj2OKHyURD0bxfTvShh5PiSCAjaXZWgT8gWIavshrDVg1x0UY5IFTP
         Yczx1VT+1W9/2mm+SHJtVeMWLxRm3y3yQMzefsBG5vEOfH5lEaW2GOkyzxpNG9CyZce7
         rDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761502072; x=1762106872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WcaBR5sXZqsA8KkRi2DD3Ahm0QMMTHBjL/2KCXh670=;
        b=p05/cw0YciQ7B5QGaUipHG8KbM2WgrYlxSGyJdxNnK6wcOOcQF8A8YCL9T0d/3Uoq+
         P1IjdL04F7INkVgVeAaQh2sIgdmvYvToBBUwn0JVsCKhrsLKf68uTS4X8lJ30nnWFk+U
         zT8UZt1Dzitnmpr9Rg81XwiSQ5GwaTNXSEvObUbDWRQTUNgBDlhTJ21BYfE2/dKvDUvZ
         hKAEjoYLY8m3fhFEY5c181d3d6WlRtcd0FKFl8m9vUnwmeoL8WyqKw+zBd1sE4plPmli
         BQsTo950mYWnY+nbR5JmrHcDbkte8rn/ctgHHRvsBN8w1GAV1h/8dyu147a0a6+xqtJm
         avQw==
X-Gm-Message-State: AOJu0YzxuonPb4uaJTq5vQQsLvtc1/FtO0eK1drKnfsCPqCtd1SogmPt
	ysCuYBy6ZI5RJ77lsaH336h5KSHzknhr7PijIgsKhXPgaspu3gvxsBt9tNz/9p9H
X-Gm-Gg: ASbGncvVcKD5agc99e+ndyPAQJWE0aX+H8oOU2WYDBiaM/B844PF0HAky2IAYThd+hW
	Y4z14tefJrMa5Kd1pNHGMh+Mxu8bQk+IOcl4Yu0P8NDbEHoOAdFONjg7QOv96BG1QqPnUIvPKf7
	Z5XNehEoTx+wTITZP3TmcqyFKSfxDM4re2LJZdp3iQizyDRiSJJWrXs6dZm0vUUvvR+HJ9BFAUu
	Wcj5oHRyzlkcT6MqNEMW9JE6qH10wm1gaAxhC0mDUV8HwaC12UtVXjadm56gacaacTF5BAWa/Hr
	1TYWfu0hlKlnSIUp0+y6K7EgUi3Q0gFDEL4C68HCmK7QhOZoDdb1xyF4/FfIa27PdBvb1fa440b
	xeY2UTQ5UUilXnsePRDb6k+3Gdc6a3uRrJQpVTHElJy0zjLRzFUUtqP5c2/qz0Gsu7o39gFxFPf
	2cuPesYVLSk6RDmbMEhcdi3CEBnd+xnpmFVcp4CAsbFgTzhuXz1WQFgJoK8G/H+Q==
X-Google-Smtp-Source: AGHT+IH9dSsbuZZosaKQLtI/IoGj/hf9YYOS+R4J3tSBql4yXGzi2t7i+QIH2f/VDM6ltOGYD7XiEw==
X-Received: by 2002:a17:903:944:b0:292:b0d0:2ef1 with SMTP id d9443c01a7336-29489e10dd5mr116065185ad.18.1761502072175;
        Sun, 26 Oct 2025 11:07:52 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4113fsm54871745ad.90.2025.10.26.11.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:07:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] elfutils: Do not suppress stringop-overflow warning on build hosts
Date: Sun, 26 Oct 2025 11:07:48 -0700
Message-ID: <20251026180748.2624488-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026180748.2624488-1-raj.khem@gmail.com>
References: <20251026180748.2624488-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 18:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225317

stringop-overflow is a gcc specific option and when we try to use non-gcc
compiler as host compiler e.g. clang, this causes several configure tests to fail
because clang reports this as an option it does not understand and bails out

error: unknown warning option '-Werror=stringop-overflow'; did you mean '-Werror=shift-overflow'? [-Werror,-Wunknown-warning-option]

One of the failing tests is the check for PIC support in compiler and results
in errors during compilation like

/usr/bin/ld: libelf_pic.a(elf_error.os): relocation R_X86_64_TPOFF32 against `global_error' can not be used when making a shared object; recompile with -fPIC

and elfutils-native failing to build with clang as host compiler

This patch was added to support version of fedora in 2022 and the error
has since been addressed in glibc [1]

This is effectively reverting bb76fe2baf00b0874d221445c9fba4481740024f

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=29141

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the problem by removing offending option

 meta/recipes-devtools/elfutils/elfutils_0.193.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.193.bb b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
index 29a8ee5af63..85aef7881b4 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.193.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
@@ -33,8 +33,6 @@ EXTRA_OECONF = "--program-prefix=eu-"
 # Only used at runtime for make check but we want deterministic makefiles for ptest so hardcode
 CACHED_CONFIGUREVARS += "ac_cv_prog_HAVE_BUNZIP2=yes"

-BUILD_CFLAGS += "-Wno-error=stringop-overflow"
-
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"


