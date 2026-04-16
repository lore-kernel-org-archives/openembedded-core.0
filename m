Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A65AF88079
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:32 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7713.1776322101949303778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=a99T2Eta;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43d74086e5bso3154207f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322100; x=1776926900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAr4fTMWwU+MyfZAnRmFaZ/19JNM+e3XSkkF7nKjfgE=;
        b=a99T2EtayJorkrn0dH0epSePINodFWTdN1ZDwyjRHZEyqp78wyMwPZHrPSh35BzuCp
         fnJ17hzu7+GWL+OxhrN+fh91Rb7REm5KxXkrRFgvE1i8qN6MMlM7V4S9Hpprwpq9uVUn
         9jWDPVCvVZMmHP6mlGQHxrGJ5sMFxxxbKV+/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322100; x=1776926900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LAr4fTMWwU+MyfZAnRmFaZ/19JNM+e3XSkkF7nKjfgE=;
        b=UHwRteswP203+xhTSf3+vRQEYxVuA+MX3ii8UHayWxBcfgxsPmB9oPqLW7Kr3Dw0Dv
         BEqI+d6Aasg61r9fxGMyIojg8dZUC5cgvo5zREF6q5t0MpISt/O/g5aCaZpm3+74ltmy
         1Vwds/oql2xQNkgOGeMKNb5skzC+CcUtRYPVJunZjGSryizP5R5V6iophr2i/4Qx0wa3
         iRMukUq+EjtEb8zxVvLlRzRoezggIzqyzSu5Cl3jGUYecu67Gs9kjCx6Dc65L9bp5G15
         hBW+2U5o1I7Og1+a7Ulyjs8wAZlWtuf1auTxcDGn2LaaZYBk0yTDskiMLrcL6kdBQ9ZI
         N5yg==
X-Gm-Message-State: AOJu0YwNxjo757ADPfPnT7s6jFVtqBmYug6Uv+XHlF00uzQJtWwCQMmL
	d10Ef1SvUEVL/+506af+7hIjLa1qsmWZzvOF0CcZLWu3bLSLQeMEKmfK5x1/L85dVYVwp8QdXtj
	zQ7hfS5fYNBbA
X-Gm-Gg: AeBDieun+9pZ9fpub4P5dl6XGnKmQXCPCaPHB5Oez+8TdxSogjf2xP+Rcx/nodgBC5N
	bLU9iaZSVMU4OmYJpOOdWIyXkCcu2iX/b+uwtvlxlzw+tMFyqcx6hQWNoufAAuLzIJV9s38gjFi
	vErAxeSovyAi7iB3c5ajTrtYVM7WSVUA1vnyu141Hkn82x1ZpvntDOgItsaQw0f/uoCjGAfT7X8
	DHduS6+dnXH6JE2wGEyuwJmeq378rKhan94SHSazeXl5AMeoe5K4B0s7btivAXoZ5PTyqBCpztQ
	KWiwGFgn4rotN/YCkjtSrFX23tL+DLg8hXTEKogc1u6iCpmnIfLnu13I0BEyQwxJcjjPVCG+8oc
	BRa18y+Vn/CVafbCx6y4BCuBQpmLG1chyuVD4knbWSxt8jVouzlfn1pcJHAeAT6hgz+1ICgI5sR
	SB1Msef3dBrUr8HklBiiSpqX1c5wLAnMc98CvM8yluAhlXY79qrvrJwV5g4pYMkpBTe1VTwWX3L
	plF+zmhuxC+uqVpvi3cOv2yUa4pxIQE0tdgD15hhjC6WKs8
X-Received: by 2002:a05:6000:250c:b0:43d:7125:e79f with SMTP id ffacd0b85a97d-43d7125e7f1mr25957425f8f.47.1776322099912;
        Wed, 15 Apr 2026 23:48:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/47] binutils: Fix CVE-2025-69649
Date: Thu, 16 Apr 2026 08:47:05 +0200
Message-ID: <e11b78d960f445c6796e83579c822b0b34cbf17a.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235346

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69649

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/binutils/CVE-2025-69649.patch    | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index a2bb278b438..94b7ca54cb8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -50,4 +50,5 @@ SRC_URI = "\
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
+     file://CVE-2025-69649.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 00000000000..05b382ea526
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,41 @@
+From cc53801dff2ba4bc62eaa666b3b7d9401232089c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+	PR 33697
+	* readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+(cherry picked from commit 66a3492ce68e1ae45b2489bd9a815c39ea5d7f66)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/readelf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 8f188e8c3e2..8d28b1c30e4 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -9621,13 +9621,11 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found = false;
+ 
+-      for (i = 0, section = filedata->section_headers;
+-	   i < filedata->file_header.e_shnum;
+-	   i++, section++)
+-	{
++      section = filedata->section_headers;
++      if (section != NULL)
++	for (i = 0; i < filedata->file_header.e_shnum; i++, section++)
+ 	  if (display_relocations (section, filedata))
+ 	    found = true;
+-	}
+ 
+       if (! found)
+ 	{
+-- 
+2.35.6
+

