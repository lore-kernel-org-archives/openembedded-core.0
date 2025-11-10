Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19988CD13D2
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 07:06:22 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42752.1762758375418164927
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 23:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpFO5J0C;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso1752779a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 23:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762758375; x=1763363175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6KmOy72ev5kiNdg9VZMuRCxkkqXW/GlaB81Wm/Cwzo=;
        b=RpFO5J0CA/Hhz6Iiuk4OiBH8XyxcV6iJ7v59WA6uf0WszQmPSHzJuQcOIQyv6TUkeS
         8wf6rYb/OlrYMU/yXD0CUDwd7y6980zmlroo66l+NfmnVaaaP0emy8yUVvjB9H7fjGnS
         JvM1E8k0G9cvGeqe/I8NYpr3wluVtXR/erLFYh6FW+drx+pUKcqpqK7QsXMJ+lAmFUaa
         LkCPmOiq//S7lt3zZVRHy8niKVr6RyadKfEWA/0wBLv+/c0vSVVfytuAIApFjkhceumL
         2TimJuPJwGhQkdrCsTsTZ2ztS1Q8/pAnErexnZAkYFN7NGpVo3CARcc/ve5bTGn/cq8Y
         LspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758375; x=1763363175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r6KmOy72ev5kiNdg9VZMuRCxkkqXW/GlaB81Wm/Cwzo=;
        b=ghjcd/rQTFv8Rv2zfoE9WiTphD8B7jQCMUM3lFAu5dKbNcEqYl2DTSohfOak3wvqTi
         d8mPaLogUxx7CmZvaUTLD+fUMfLrSRcj/ud0oJTZRbC6pEn/c9HCjR9Hnu2PbchToxhx
         yC8okYs+6jk0Os4G4Gcql9Q6WHIEaRphrZod+868s6xuqgRNym727iufFzgUkfP2jB6A
         a0hjWpBGQc0yoykacDLhaGU7t+yASiptYD0V9CT6HkJPLIfEhF6YWLJUMPU3lONbBEAj
         SDP6WNf27q7hCTRuvvN5bfJvpN9F7yp/i6tLg8tOCR5DLHwLVFA3NW6CRLtJmEZPgtH0
         hdsQ==
X-Gm-Message-State: AOJu0YxG3sitRk8XCnkvhTVHz3039ItV2ihdSRZ3WhmSkFeMnt83UBMT
	ax2Cvj02M9J+3cD6c/jmHuuqRVUEZ6xg/BJhfxBy2EogH0ZmHx1FgRAZpE+FRQ==
X-Gm-Gg: ASbGnctghbJZVv/9XeuFF6QE1VyPw4QwxJu4Do1IMpYbTpzRE+UTPMptQ5cAdZVl46x
	wPmze1GybKm7tCb7drCAMO7P8X/J0awlsU5hP2HEIodMbzsA6XkVVX9udmvwaNL1gfRIaGd9f6o
	8VABY8QQ9zSokttlnLHh+pLqZ40DiISQWHxOjW8Z8Y7mb7FjSeVsH4BtEO+9lnx2chlkyPlYw+T
	9hpvtf6cBF8XGj6+epQcqmIoOlMJvEy5kVOdbDqjlOgXM555tsCQfEt68SFrOPZulT9+S/sIB1P
	jSg1oskNMkFDIm4SEhyZZZAgjmVlerbiNl3DkDpvwQ1ngxGJrHV6dKg5LxngPk1GRKpg7KXOFns
	ChtEQ2FsUvxvCLx8aZUM0lk+CNO7whS3QGOOuGHtO6QGMOLXY6+mKnnWWtDU0CNAxcyqwXwWVzl
	R7KOm1QNJLZbVmlzQ5WsXpZ8GG
X-Google-Smtp-Source: AGHT+IFRQtW29Czfa70+b78t5osIpql+E+4a62zAGT5DEZzeqUvuZZHwreYxri0liIQXmoeHWKFsow==
X-Received: by 2002:a17:90b:4c4a:b0:340:ff7d:c26 with SMTP id 98e67ed59e1d1-3436cbb6581mr11109709a91.16.1762758374502;
        Sun, 09 Nov 2025 23:06:14 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba901c3817csm11511337a12.30.2025.11.09.23.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:06:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][walnascar][PATCH 2/3] ghostscript: patch CVE-2025-59799
Date: Mon, 10 Nov 2025 20:06:03 +1300
Message-ID: <20251110070604.444927-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110070604.444927-1-ankur.tyagi85@gmail.com>
References: <20251110070604.444927-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 07:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226101

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-59799

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ghostscript/CVE-2025-59799.patch          | 42 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
new file mode 100644
index 0000000000..9b982c7a80
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
@@ -0,0 +1,42 @@
+From 0acc06d00aaa267ae10cce6060e983eafb067d86 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 6dab38fb211f15226c242ab7a83fa53e4b0ff781)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ devices/vector/gdevpdfm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/devices/vector/gdevpdfm.c b/devices/vector/gdevpdfm.c
+index d1237c91a..c120ba1ae 100644
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
+@@ -859,6 +861,8 @@ pdfmark_put_ao_pairs(gx_device_pdf * pdev, cos_dict_t *pcd,
+             char buf[30];
+             int d0, d1;
+ 
++            if (Action[1].size > 29)
++                return_error(gs_error_rangecheck);
+             memcpy(buf, Action[1].data, Action[1].size);
+             buf[Action[1].size] = 0;
+             if (sscanf(buf, "%d %d R", &d0, &d1) == 2)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index f8454f82ba..a8347283be 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
            file://CVE-2025-59798.patch \
+           file://CVE-2025-59799.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"

