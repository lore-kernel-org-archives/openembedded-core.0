Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6234EC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 02:42:13 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.9584.1707360129023396366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 18:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kYSC3DY0;
 spf=pass (domain: mvista.com, ip: 209.85.210.42, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e1226b30ffso699880a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 18:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1707360127; x=1707964927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrlD+UXDRrs5Yq30cPgiksPnaoM06Im/B7m9nbR9RNo=;
        b=kYSC3DY0gs5JDjm61iZ/CcGWUTLytwAKD0S8/t7xbaj34ax+ce0CsvvUWFqFAyGZP7
         cxk0Zp1+Jq82FgF3qM2t3zxPIv8WqplzIDdT9mRFnF2puywwS9EcqjnPIpM02W3N9Gkq
         AUAa3/hx+4XNhH61cZRryIC0q+9RHEBGxLZCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707360127; x=1707964927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrlD+UXDRrs5Yq30cPgiksPnaoM06Im/B7m9nbR9RNo=;
        b=fzzdakw1TX0folWp5a8d3vRVrGf1l91O9pKvkCb7a8yxRWTdRWl+O/P0K/qmdkgBL2
         OG53p/xZ789gHkhVSpj9AyxI14FwBrmFIV8X/8HomMaNvjTS+pDtGTjwURTqjdeqR2q4
         VTj2MZTACuNsalJkbRiulFw/u/quLQpdZE6uW3GjRdcMbMP+UIlDvKkQCUn1CGsiLetw
         jQ0PWOdGv2Cr6VTgkLVNkKdcB2TWvkRVe3n9tj7hSeE7+PwwQDXqEhisDDNJaPR84275
         u+GtKUPVH04L5hXFWzrDF4O5mTq6za3uJKUqOGcQumwhGb2nyvB58KY9AQDXpsj+O9mm
         1A5A==
X-Gm-Message-State: AOJu0Ywcta/9vjriKm5I8liUxI+sKZPbp3llXsapcyExmq83E9ZijRO/
	BGHv0qhVlbC5Ux6XPNUFmqrlafNAsOTvqFarS1c1sROccGAIWOLjf8iVOZ1+W8CVeiYPkAvKxyU
	V
X-Google-Smtp-Source: AGHT+IH8vjXFyJaQuSnA9m0TD65l7L0fqdTubTx+0o+qG3UDd2FdOpLzeDbLd4Pwe5Vn3LAVxOiuBw==
X-Received: by 2002:a05:6870:434f:b0:218:edd0:439b with SMTP id x15-20020a056870434f00b00218edd0439bmr7955147oah.28.1707360127449;
        Wed, 07 Feb 2024 18:42:07 -0800 (PST)
Received: from MVIN00020.mvista.com ([106.212.230.13])
        by smtp.gmail.com with ESMTPSA id e26-20020a63745a000000b005d64d09acffsm2386119pgn.72.2024.02.07.18.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 18:42:06 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] ghostscript: Backport fix for CVE-2020-36773
Date: Thu,  8 Feb 2024 08:09:47 +0530
Message-Id: <20240208023947.6140-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 02:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195096

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;h=8c7bd787defa071c96289b7da9397f673fddb874]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


