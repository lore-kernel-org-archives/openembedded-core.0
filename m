Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D84FFD8FDA
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:39:42 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75834.1772127579861345581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSZTQ5Fm;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d4be94eeacso676472a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127579; x=1772732379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=iSZTQ5FmesYyEcvxmRwH66IN22Vo0/jZaC6wU27PXv1yJqJGp0n7MQM57JXGN25V/L
         x/jcaEHP9f9T+tMgu6qZcc6+Z81+iW0QTGOm2QTvVsYmiL3MorsiGLlbewYvaqdLoZ3l
         6QTz6USfaz3UzfzlHDq7tPz5b1uDgt0tZCyWuyrSuJcBTDgiaQs8B+E20hZMhtcpuk7K
         wAvj+VsYi0tIsIpsElnzTMkwIjAOg4UhwgB1d4L9/Ye3XJn2vBdtE3egYBLITTHnR0uK
         +T2KRYsorj3pAgHIe0oGiBd8qDXmidd43+cx2ZWnhVZbN+i0YzGAWaiN5GnWcEkjYFE7
         0kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127579; x=1772732379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=svIZ9N1nZDRNObj4VbdmTP3Q+znj4oAqS6tEGXRZWu8r2RybOpTLV8ocFa69V6ihiI
         rUseuszVFy6TEvFYo5LY8Mx+2MxgNfhzRZW83XvLIGYOSAvIsE2WVP+7kRZm6/zwHA+x
         ZYw4uqrr/46L95c9CpybPGapqIh5C/TapNVPcrY0d8hxz12nTfmjyhrTpmvrXiKTRPga
         mKGnFEjnHCDSE62N+/m2IqQTtRdo8gAjgylZTEgvCLIipnC0xU/NLbLMVlz6+hyOVhVa
         52AHp0mkCyBTvbmXJgubPI8RxWU+85voLDliVK66K4gT3WR0RUta66b6p4xOOOtlEtF2
         tXTA==
X-Gm-Message-State: AOJu0YwPDHqvGaQAbLrOcyNmejgNNMDQzmaYUam4gRqzfuax99fOB4xK
	L5iP2KoSv0jX2fccuJskHz/v10JByD7lGvIOQIomjjwaMHBhid1UTNJ1Am0h/A==
X-Gm-Gg: ATEYQzzE1Y3tPqE+JsKRn+5+vDxSr9GCuPdpnnXZHpaufvbt3wORwrZLNob6Wp9pshD
	8MBWzGvNF1ee9LgeVdBEBWvA0JFE33L51xmzLxSdRRbHJ/gORiLT4QpvrEcFAdlhVwPsGP4cW+0
	I073VasbogZoC1VLAXApNwjQUWs50t+Rkv0y2pll9MNixpAYLDpQcnndrIkFuaHZs/v8KurR6h9
	YyFhx2J8VKsoxS5H6js1+oyvodV+xpvVbWK+DEEUMO9QBbROn1dz2FILOIRq5sDcMTJ/KeeCmx9
	D3srSNwTz4UBPkHe2KrW59RFtu7fhblqSdbpA5XofiCB2XR9NGUQ0sON9pzb6PoysBx9w8NIECm
	Ug8LSBGpnM8NC/NV5zUcyEYUNASg5Q4LhCqlSdBwRBw8r7ofI1j2DoRQOVVNF0QcbSBjghYK79P
	Rpkuz987ool3TSOojFEtv2QUjc7zUJsrA=
X-Received: by 2002:a05:6830:6c15:b0:7cf:d8c1:8e19 with SMTP id 46e09a7af769-7d586f561d7mr1436198a34.25.1772127578980;
        Thu, 26 Feb 2026 09:39:38 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm2173027a34.23.2026.02.26.09.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:39:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 8/8] spdx_common: Check for dependent task in task flags
Date: Thu, 26 Feb 2026 10:33:09 -0700
Message-ID: <20260226173930.2847872-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226173930.2847872-1-JPEWhacker@gmail.com>
References: <20260224230234.679049-1-JPEWhacker@gmail.com>
 <20260226173930.2847872-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232054

Checks that the task being used to detect dependencies is present in at
least one dependency task flag of the current task. This helps prevent
errors where the wrong task is specified and never found.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx_common.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 72c24180d5..3aaf2a9c8b 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -96,6 +96,17 @@ def collect_direct_deps(d, dep_task):
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
 
+    # Check that the task is listed one of the task dependency flags of the
+    # current task
+    depflags = (
+        set((d.getVarFlag(current_task, "deptask") or "").split())
+        | set((d.getVarFlag(current_task, "rdeptask") or "").split())
+        | set((d.getVarFlag(current_task, "recrdeptask") or "").split())
+    )
+
+    if not dep_task in depflags:
+        bb.fatal(f"Task {dep_task} was not found in any dependency flag of {pn}:{current_task}")
+
     for this_dep in taskdepdata.values():
         if this_dep[0] == pn and this_dep[1] == current_task:
             break
-- 
2.53.0


