Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71BAC87FD3
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 01:05:03 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.9364.1754183094556013228
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 18:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=f5YLb/e3;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.160.181, mailfrom: anakin@childerhose.ca)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ab814c4f2dso48182021cf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 18:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754183093; x=1754787893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYCJ5X340z+j4Ru/sRPaeyXSM2gMASpW/0oUFQ/nQYs=;
        b=f5YLb/e3tRb5pfrhFeEZ2C6qpSDU57zjNMal7KNBoztjgqbUaTdykll8otLdO5tpnk
         8udzNNQRyE9PAgw7FMTbW4dSWdKBR6Htwy0dQI15EtfEd7lNHVBowjd4H7vGnqVEo9Wi
         leOeooPzcZLjaNwpUxg3gR1wiZP1OgNB5epM+gWXl+GIxDGZfzXcm8A0uaEu3PquvJ5u
         /Ibu9fSWf0+Ay4uwNK5I/gnJRnmp2NlTA+3Lmqx203hfDiorwWbjWUIQGnCxgAwN2efg
         8jGEeYpAwbQQB9EayDi7dqX3b+BpkN08+eLU3/B3clBrSbwbMYsoJAvYou9nI6a3QRLO
         ++og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754183093; x=1754787893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYCJ5X340z+j4Ru/sRPaeyXSM2gMASpW/0oUFQ/nQYs=;
        b=bYXOs/spXwcCJl+rsrPOayqHPTUm1cJnY54SdzHpvY52Yd1kx2ELBabyRr68SUUoiJ
         183nb7Vn778YLK9iUjfRhmu9RRKtHnMBZ+FLlDIyDwUZ8ubDfB03cmwvXeWoa2lPO8bX
         yYPGxxsk6/aW3A00pDmKnCzowdWRKpGF+xMRV3sNp1sAFYpAog7q+rzY0QSWr6s5nCJi
         dbK/adbrtuP3xrcAF96H2HkTYXyw0A/IB7jZ2pilIduhn+7yMb1QeFiT04ZP8RLNCj4W
         XqN5K8hX4T78Wxv+IjwjvM2lh6+aSa4oEePlXShmqrhNqKUZivUFJyFanAaSlOilfS7k
         NpgQ==
X-Gm-Message-State: AOJu0YwGOlDsnOVqKuZxglRbZrKbLs7BirlidwPO3WLmQLDdwU5jCc+1
	q0QIUU9sFnpqJYef78sMccsZ9qV+ClHIkvQDc/hiL5WZd2cZpP7Sl0K8mBAZ+C9hQ9Sd5YmcQD4
	329/0H4vDqw==
X-Gm-Gg: ASbGncse0bviZsNHeOMsqRtop56HZ1B5fX4MnvbSque5nJg18b5uht522oReU8Rc79K
	+wECVcRj1ILV8kD/07zvPqkm6Hjrub6/QCysAvuQjUnzajJZ1HeWrdkLzj7/Npb3YMivg+omrgp
	H5VzCV4+lK0kCD57B2nm6rXGIf4Xvh33QoLRSHHoeVdSNwsEudt13lMKWw8GmL9VG4WteC/zvJ/
	zAFe9ZM5laHDdrs85d5Iy+8RtX1JI9lHlN3aLRjmR36rE20EZd7LhwY2F1zRgELs1U/u3acPo6W
	99kFIT1ggzh0ZECGp7rPiS5HeJ8SETuHwRrnlQ2XZKoXAUn0UTAuxvsXrGAWkhFte0Hvt9uRUJc
	MtmHs83IwvCWHv6mr
X-Google-Smtp-Source: AGHT+IHzALZIS81dWRe9EFwjo9uk3CyE2SXh77MpyMcEkyqVO+c/+EXb4ToGAmGigFUc0GDjsbluXA==
X-Received: by 2002:a05:622a:5597:b0:4aa:ea4a:eddf with SMTP id d75a77b69052e-4af10994483mr70665081cf.27.1754183093169;
        Sat, 02 Aug 2025 18:04:53 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f594206sm389169685a.4.2025.08.02.18.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 18:04:52 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 1/3] clangd: add compile_commands.bbclass
Date: Sat,  2 Aug 2025 21:04:21 -0400
Message-ID: <20250803010422.21838-3-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803010422.21838-2-anakin@childerhose.ca>
References: <20250803010422.21838-2-anakin@childerhose.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 01:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221397

Add a class to link the ${B}/compile_commands.json file to
${S}/compile_commands.json to automatically configure the clangd
language server for build systems that generate a compile_commands.json
file.

Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>
---
 meta/classes-recipe/compile_commands.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes-recipe/compile_commands.bbclass

diff --git a/meta/classes-recipe/compile_commands.bbclass b/meta/classes-recipe/compile_commands.bbclass
new file mode 100644
index 0000000000..da8795647c
--- /dev/null
+++ b/meta/classes-recipe/compile_commands.bbclass
@@ -0,0 +1,18 @@
+#
+# Copyright Anakin Childerhose
+#
+# SPDX-License-Identifier: MIT
+#
+
+do_generate_compile_commands[doc] = "Add compile_commands.json to S for clangd language server"
+do_generate_compile_commands() {
+    if ! [ -f "${B}/compile_commands.json" ]; then
+        bbwarn "no compile_commands.json found"
+        return
+    fi
+
+    ln -sf ${B}/compile_commands.json ${S}/compile_commands.json || {
+        bbwarn "failed to link compile_commands.json to \${S}"
+    }
+}
+addtask generate_compile_commands after do_compile
-- 
2.50.1


