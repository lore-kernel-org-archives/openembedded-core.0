Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF022C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 08:44:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.96185.1701765882110783122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 00:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=rgjba3Fu;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66eso35197825e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 00:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701765880; x=1702370680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu8Wkh+a+0pk8VNk+zEvAuFdaqzBOkBJD4KEL9X4WLw=;
        b=rgjba3FufgxRUSIcsL+nD6YQcYOQlO5H+Qhaqli8O+GA38N0efw/fFA9yReweqHM93
         O7U490fuMulWQYCnHD0XsPy9rNh29/BrzyA8AoOvCvwB2tPu4DMg9X0tjK9Q2u6riaA4
         EOb979I35dv1cffK8isST0JUOq3jwdy5e7RImByDR+2cEtO1OAGdyQIv1p2aterajix6
         8dYzBXnFCAJ8iMlg31IafGA961WOXb/R9bkb+n/KMyOX11m1S+Zb+QJAa34oSNYz4t6r
         m3aM7+9hAiwlft62Nwg8bGOwgeLz4dStlm5pRfrTm3GKiHA02d5jBVu40nSKE1WE3ubt
         ZNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701765880; x=1702370680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zu8Wkh+a+0pk8VNk+zEvAuFdaqzBOkBJD4KEL9X4WLw=;
        b=IiQxCqp7hC705bvIZ3YHJialB1yBZpCjgjdn8LEl/hLVbz5ALukW12OOAAY1hpAXYb
         lDhpHLqaoL8N3sbwf3j0/RJOdaItVLaBRgn32AYSRtWXfl8lUIQAsQEWFhmTK5XiZJWG
         H6BZysQd4nvCUQ/jKRh1wiCZe1A5K6cy/SPGAuCfcYwwTboHfTYScgan/9xtSdZqNmGn
         OzlMSEMcRNeC0hUeb8IDKKKbgsndbstC1QtbrXyC6q3bhLSW0ZV5szPbozgrutBYmhDZ
         v/yf9LIgjTkG3kFRn8OzJ27l2sZeh6WGZEOsgoYTpxdsJJlJGDENwYy8nsfS20WUhV/9
         kRGw==
X-Gm-Message-State: AOJu0YxEF0vmwHT4cgHDg7PIHXa0SQUzTkE725wJ9bTH9v9Du2zkFXpL
	bwdX5rydngLGJIR7roepFMieCnEQs5lSvIQef4w=
X-Google-Smtp-Source: AGHT+IEPTTS7TmvErpygKxtXiFu4M7opYwsZ9//bVk+X0tXOIRhzv/uqvh5QLLA85BpFgYehHTawMw==
X-Received: by 2002:a7b:c5c6:0:b0:40b:5e21:ec24 with SMTP id n6-20020a7bc5c6000000b0040b5e21ec24mr239481wmk.86.1701765879933;
        Tue, 05 Dec 2023 00:44:39 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ay10-20020a05600c1e0a00b0040b397787d3sm21705216wmb.24.2023.12.05.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 00:44:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] lib/oe/patch: handle creating patches for CRLF sources
Date: Tue,  5 Dec 2023 09:44:18 +0100
Message-Id: <20231205084418.2008541-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 08:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191808

Using devtool to patch CRLF based sources creates patch files which have
mixed end of lines : LF for headers and CRLF for source context and
modified lines.

Python open(..., newline=None) (default for newline arg)does detect
end-of-line in this mixed file but only outputs LF EOL data. This
result in patch files that does not apply on the original sources.

Switching to open(..., newline='') allows to detect end-of-line but keep
the original end-of-line intact. This generate correct patches for CRLF
based sources.

Fixes [YOCTO #15285]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: Rebased to solve conflicts with 900129cbdf
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index e4bb5a7839..d5ad4f3dc1 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -478,7 +478,7 @@ class GitApplyTree(PatchTree):
                             patchlines = []
                             outfile = None
                             try:
-                                with open(srcfile, 'r', encoding=encoding) as f:
+                                with open(srcfile, 'r', encoding=encoding, newline='') as f:
                                     for line in f:
                                         if line.startswith(GitApplyTree.patch_line_prefix):
                                             outfile = line.split()[-1].strip()
-- 
2.30.2


