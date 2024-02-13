Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905CFC48BEB
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 21:43:47 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.26108.1707860622710747217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 13:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=exopcT04;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ce2aada130so4130449a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707860622; x=1708465422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmKCpNlDMxzUHuK1VRENusIalaAwmkaA6uT6qe9XjvM=;
        b=exopcT04ox695bP4KMRqwOv1z3bo7NVmr37PpVNx3eWt4Mn0wdosIKfY4874CyWWco
         mI0Zjvz8i+pLSWoKqWwe5K1HIQs6cNIOCYG/oMuVDvBEKkZHWzRxmyecq7+wnZ3TrheV
         X5tWp58rbUC/38xjEzOkQGy/XkYBYGR7Nri3fhEf2LvTFpUO1KPyUzoxKSGdugvyyXGU
         QuF5Yzx13qsCTIrR/OgIb0eWdEHuEsptcrSWh8eNNX9aoroQpohL3vZPJXJoKycExOjN
         HICc6hNKzMKycE3WcalcTyPV197Rsr3CqLQRnNyBAbEmVYH/SgfahLmYGyDHkwPc77KI
         GNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860622; x=1708465422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmKCpNlDMxzUHuK1VRENusIalaAwmkaA6uT6qe9XjvM=;
        b=bQ4Lgc/xoQfdgShO7FiiImRBPccXkz4KhQ+OkwE5s0HcLpn76Nswh9P3bUSoWxq5vk
         NX3lh7/lQpfI689vPYDaFQuiu8xIr6uuSfPfAmFG2e0WoNIH2S6gBPdybmnbRZyXpdAV
         bjMNkuvPXWdXWXN3unk6ZSz72+TKYB7NQsdRhxyaon5sCXBz5v8q9vI0M/3RExKO+iu6
         tHa2FqHh6fo51+mqEi48SKt7hlqUO6Y/i0qEfiJGxlP9D/RRalHfImZ0ZV19DhsL1z7e
         TSOzXgG3zX3sIff4RBxmsBc9ns57EG5BIZJmwE1y00lgnGrMH75ACrno/+zNlIVJJ6Xl
         v7lA==
X-Gm-Message-State: AOJu0YxWa9MEh7067Z0gvoDCgVsdaoC5huaSSydQL8Kysv6WKcIvuXD8
	t3vCXTLvbG71yY4i044TDM7whRSfcEQszZVDbeWH4xanQqYcX+bBs2oWz5d8fXnFS0/SphTjg8H
	R
X-Google-Smtp-Source: AGHT+IEbuDO3UWheKuNCyw0u+h1Mo+Bw38jBD04vK9dmGjprCtAh3Qfraa7I3ApGDWLYuR9u0lZ/yA==
X-Received: by 2002:a05:6a20:d70f:b0:19e:99fd:2946 with SMTP id iz15-20020a056a20d70f00b0019e99fd2946mr1050184pzb.2.1707860621956;
        Tue, 13 Feb 2024 13:43:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a0018a500b006e04efcfbc2sm7767327pfh.74.2024.02.13.13.43.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:43:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] ghostscript: Backport fix for CVE-2020-36773
Date: Tue, 13 Feb 2024 11:43:23 -1000
Message-Id: <1a25a8ebedf39f1a868fcf646684b2eeaa67301f.1707860435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707860435.git.steve@sakoman.com>
References: <cover.1707860435.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195432

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;h=8c7bd787defa071c96289b7da9397f673fddb874]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2020-36773.patch          | 109 ++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2020-36773.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-36773.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-36773.patch
new file mode 100644
index 0000000000..ea8bf26f3f
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-36773.patch
@@ -0,0 +1,109 @@
+From 8c7bd787defa071c96289b7da9397f673fddb874 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Wed, 20 May 2020 16:02:07 +0100
+Subject: [PATCH] txtwrite - address memory problems
+
+Bug #702229 " txtwrite: use after free in 9.51 on some files (regression from 9.50)"
+Also bug #702346 and the earlier report #701877.
+
+The problems occur because its possible for a single character code in
+a PDF file to map to more than a single Unicode code point. In the case
+of the file for 701877 the character code maps to 'f' and 'i' (it is an
+fi ligature).
+
+The code should deal with this, but we need to ensure we are using the
+correct index. In addition, if we do get more Unicode code points than
+we expected, we need to set the widths of the 'extra' code points to
+zero (we only want to consider the width of the original character).
+
+This does mean increasing the size of the Widths array to cater for
+the possibility of more entries on output than there were on input.
+
+While working on it I noticed that the Unicode remapping on little-
+endian machines was reversing the order of the Unicode values, when
+there was more than a single code point returned, so fixed that at
+the same time.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;h=8c7bd787defa071c96289b7da9397f673fddb874]
+CVE: CVE-2020-36773
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ devices/vector/gdevtxtw.c | 26 ++++++++++++++++----------
+ 1 file changed, 16 insertions(+), 10 deletions(-)
+
+diff --git a/devices/vector/gdevtxtw.c b/devices/vector/gdevtxtw.c
+index 87f9355..bddce5a 100644
+--- a/devices/vector/gdevtxtw.c
++++ b/devices/vector/gdevtxtw.c
+@@ -1812,11 +1812,11 @@ static int get_unicode(textw_text_enum_t *penum, gs_font *font, gs_glyph glyph,
+ #else
+         b = (char *)Buffer;
+         u = (char *)unicode;
+-        while (l >= 0) {
+-            *b++ = *(u + l);
+-            l--;
+-        }
+ 
++	for (l=0;l<length;l+=2, u+=2){
++	    *b++ = *(u+1);
++	    *b++ = *u;
++	}
+ #endif
+         gs_free_object(penum->dev->memory, unicode, "free temporary unicode buffer");
+         return length / sizeof(short);
+@@ -1963,7 +1963,7 @@ txtwrite_process_plain_text(gs_text_enum_t *pte)
+                           &penum->text_state->matrix, &wanted);
+         pte->returned.total_width.x += wanted.x;
+         pte->returned.total_width.y += wanted.y;
+-        penum->Widths[pte->index - 1] = wanted.x;
++        penum->Widths[penum->TextBufferIndex] = wanted.x;
+ 
+         if (pte->text.operation & TEXT_ADD_TO_ALL_WIDTHS) {
+             gs_point tpt;
+@@ -1984,8 +1984,14 @@ txtwrite_process_plain_text(gs_text_enum_t *pte)
+         pte->returned.total_width.x += dpt.x;
+         pte->returned.total_width.y += dpt.y;
+ 
+-        penum->TextBufferIndex += get_unicode(penum, (gs_font *)pte->orig_font, glyph, ch, &penum->TextBuffer[penum->TextBufferIndex]);
+-        penum->Widths[pte->index - 1] += dpt.x;
++	penum->Widths[penum->TextBufferIndex] += dpt.x;
++	code = get_unicode(penum, (gs_font *)pte->orig_font, glyph, ch, &penum->TextBuffer[penum->TextBufferIndex]);
++	/* If a single text code returned multiple Unicode values, then we need to set the
++	 * 'extra' code points' widths to 0.
++	 */
++	if (code > 1)
++	    memset(&penum->Widths[penum->TextBufferIndex + 1], 0x00, (code - 1) * sizeof(float));
++	penum->TextBufferIndex += code;
+     }
+     return 0;
+ }
+@@ -2123,7 +2129,7 @@ txt_add_fragment(gx_device_txtwrite_t *tdev, textw_text_enum_t *penum)
+     if (!penum->text_state->Widths)
+         return gs_note_error(gs_error_VMerror);
+     memset(penum->text_state->Widths, 0x00, penum->TextBufferIndex * sizeof(float));
+-    memcpy(penum->text_state->Widths, penum->Widths, penum->text.size * sizeof(float));
++    memcpy(penum->text_state->Widths, penum->Widths, penum->TextBufferIndex * sizeof(float));
+ 
+     unsorted_entry->Unicode_Text = (unsigned short *)gs_malloc(tdev->memory->stable_memory,
+         penum->TextBufferIndex, sizeof(unsigned short), "txtwrite alloc sorted text buffer");
+@@ -2136,7 +2142,7 @@ txt_add_fragment(gx_device_txtwrite_t *tdev, textw_text_enum_t *penum)
+     if (!unsorted_entry->Widths)
+         return gs_note_error(gs_error_VMerror);
+     memset(unsorted_entry->Widths, 0x00, penum->TextBufferIndex * sizeof(float));
+-    memcpy(unsorted_entry->Widths, penum->Widths, penum->text.size * sizeof(float));
++    memcpy(unsorted_entry->Widths, penum->Widths, penum->TextBufferIndex * sizeof(float));
+ 
+     unsorted_entry->FontName = (char *)gs_malloc(tdev->memory->stable_memory,
+         (strlen(penum->text_state->FontName) + 1), sizeof(unsigned char), "txtwrite alloc sorted text buffer");
+@@ -2192,7 +2198,7 @@ textw_text_process(gs_text_enum_t *pte)
+         if (!penum->TextBuffer)
+             return gs_note_error(gs_error_VMerror);
+         penum->Widths = (float *)gs_malloc(tdev->memory->stable_memory,
+-            pte->text.size, sizeof(float), "txtwrite temporary widths array");
++            pte->text.size * 4, sizeof(float), "txtwrite temporary widths array");
+         if (!penum->Widths)
+             return gs_note_error(gs_error_VMerror);
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 9712871e7f..e57f592892 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -45,6 +45,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-36664-1.patch \
                 file://CVE-2023-36664-2.patch \
                 file://CVE-2023-43115.patch \
+                file://CVE-2020-36773.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


