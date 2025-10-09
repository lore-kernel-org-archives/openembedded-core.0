Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843A8CCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.9246.1760038295359619826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mOa9hJ1z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-796f9a8a088so1071119b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038295; x=1760643095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fzN/GGBcKliVop8aMkZV1uHzYUqAAMnDTCGFO5eIVs=;
        b=mOa9hJ1zL6oJH0xzs85FluUrDsImRRey/F3EZoVWu3Gn1HQv7TtUCO/n0/L7an1IT9
         ZnjITKapSC3UA1cTDQAtTZHSdw5WWACFK3s7J+A6jHJZo08pNoObbHFT4BPL4IEIanWf
         vFwH1E/oBlMgBdcq4W5zhDWR7llCP/nKDCykgeuoeTdYAAsGg2mxK8T3fAryykoEh09n
         kv0UlJ811M5gx154irWsD4CBEP+LKh7vCj6kePQI+E+x/v5QKc3/v1j0ShZYJPCqhY6i
         uo4D1rYSdOJT+ug8PaQA70PgmNEvy/cPNLJQzyIhbacK/6cee0cBw+h8NAMboidQU4Wu
         r3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038295; x=1760643095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fzN/GGBcKliVop8aMkZV1uHzYUqAAMnDTCGFO5eIVs=;
        b=L2PSm3r95Eb82fKkPZvjL5Df5ELRzqEEGc+08EFsXJdVa5wzYBXYZDzndzVKQHIn68
         eLaOpMzpdVlbpATBC7LzERUbU99vACNQ6n0VyFT3PeL7MZyEejJukjJr71OOPZbkq/Jy
         hIl9MRPqiaxu5q8vUGLKcsOnErR9sqxBi4UcGBRDBNA36xljJ+mwFc7OI0CRKwXXl59t
         zzxst1LkDGFQ6/ToI2sk+6FB12gfMHFI1OXPPDYrRaKgWusQK8XWgg5f18Wy3gWdl6m9
         tEbzRcbPN5VcDNh6ERaHlVLla4BWLRlOK11FsANvFdqAkcXfb/5Z0GtOAlCuJxOq3DmY
         yqNQ==
X-Gm-Message-State: AOJu0YzRSnHI92EgrPW5YGmXlWFhwIST4QkXJhbRhQUzOlfyZRKsXZEX
	wkvJtKbZWaAFdUvrY2OJNA5IprqZKI2jt/pENerPJNU9a0u5zZz0ZKYSEZ3oizWALAmwSj4xvO5
	+4S2n
X-Gm-Gg: ASbGncuUwegHhRmDiYwXgbLNs8FY4S+ZNgzPXltUX/41+yBCed2OiOejp6adO0UiRGq
	FWsk96BFyqmEE+HiSQAXtsZwuG9hls0EiToqYJ1fM+OD79jzcBWJTQ3/zfojXnVwvdThIWaDpC6
	bi6Xpw7Uq5T1k/a1GErchm+UzvQ+m6sIdKFnZZAfXmyyp304MtCFKGOebBd5WFnQKYqlOSBX/+q
	Zj2QHi0zK0IoS2I11xoNARmnZ1TdmomSGamFk/qKaIR6R85zmDZtUuWPCExJBaoSKdG5PwC9+na
	uFiLe40hJwAkjYaAFm8f3NRj5cFHuKD2ZmH6PrUG31+wlucdKdooSZmqdcc973QWOIwfiPyXtyE
	BI6mTlKZ0TcZVsqAItV7JSyUVNf4OWhd1Ou/1vw==
X-Google-Smtp-Source: AGHT+IFpZ3U7nnbdebdol5FlLE96xtBVVp/4gd2BBf0YUN6cAYbDrsHLSDTtR/jP+3WokNZrOecHxw==
X-Received: by 2002:a05:6a00:1895:b0:781:1f28:eae9 with SMTP id d2e1a72fcca58-79384f48925mr10112459b3a.3.1760038294476;
        Thu, 09 Oct 2025 12:31:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/24] ghostscript: patch CVE-2025-59799
Date: Thu,  9 Oct 2025 12:30:55 -0700
Message-ID: <10a51275bb0f62b018a6182953352ecf7aa3d220.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224630

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2025-59799.patch          | 41 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
new file mode 100644
index 0000000000..3badd82f22
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
@@ -0,0 +1,41 @@
+From 6dab38fb211f15226c242ab7a83fa53e4b0ff781 Mon Sep 17 00:00:00 2001
+From: Piotr Kajda <petermasterperfect@gmail.com>
+Date: Thu, 8 May 2025 11:37:09 +0100
+Subject: [PATCH] pdfwrite - bounds check some strings
+
+Bug #708517
+
+This differs very slightly from the proposed patch in the bug report, I
+had a quick scout through the C file and found another similar case.
+
+Both fixed here.
+
+CVE: CVE-2025-59799
+Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/6dab38fb211f15226c242ab7a83fa53e4b0ff781]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ devices/vector/gdevpdfm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/devices/vector/gdevpdfm.c b/devices/vector/gdevpdfm.c
+index 5aa3644e2..4b1d7d89c 100644
+--- a/devices/vector/gdevpdfm.c
++++ b/devices/vector/gdevpdfm.c
+@@ -199,6 +199,8 @@ pdfmark_coerce_dest(gs_param_string *dstr, char dest[MAX_DEST_STRING])
+ {
+     const byte *data = dstr->data;
+     uint size = dstr->size;
++    if (size > MAX_DEST_STRING)
++        return_error(gs_error_limitcheck);
+     if (size == 0 || data[0] != '(')
+         return 0;
+     /****** HANDLE ESCAPES ******/
+@@ -848,6 +850,8 @@ pdfmark_put_ao_pairs(gx_device_pdf * pdev, cos_dict_t *pcd,
+             char buf[30];
+             int d0, d1;
+ 
++            if (Action[1].size > 29)
++                return_error(gs_error_rangecheck);
+             memcpy(buf, Action[1].data, Action[1].size);
+             buf[Action[1].size] = 0;
+             if (sscanf(buf, "%d %d R", &d0, &d1) == 2)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index c9fcaa7a16..349c007e94 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -77,6 +77,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27836-2.patch \
                 file://CVE-2025-48708.patch \
                 file://CVE-2025-59798.patch \
+                file://CVE-2025-59799.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.43.0


