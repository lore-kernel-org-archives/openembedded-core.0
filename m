Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FA8E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 14:41:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13373.1771425671283763677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 06:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aM7+RIqO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48371bb515eso62045945e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771425669; x=1772030469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A5nRvvZVpPWKz19jQhKw48mQtRLYpV0R+RVnvK1jqQs=;
        b=aM7+RIqOim+GHTf8llaGVgeD+hSIj2vWOJrBPqsx5HElshzLtvwu4ca8g+/kNETt7o
         keI4W8NylK/msiY0N50ikJQhDAbcw2u6J89ZJaZGZqpDL54HIuG73EZz64z1zXu95EHb
         nWUAh4JQwYg4SG/xydg9obhdzorxDa31P4BtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771425669; x=1772030469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5nRvvZVpPWKz19jQhKw48mQtRLYpV0R+RVnvK1jqQs=;
        b=HYEZ/IFoLD1gjd7qAzqUMI+J6l1vmYNImPDGNW+OrhO6SOq2pwTMdrKwYcLRD+OJvh
         O9V8SxnQGDp2Y7dKBdWiiP6PXoGNyL7vyB7wZp9DqZnN1Ujl0IdXvk1rzGgpFO0lR9tK
         0AF7K8jW5zEamEAnKN8juF9L9YnqpLKXWqlb3SFpzMc3RSuGB+igB9gQ3igUw7Ch3OWQ
         EOwlvbhqpuE9pjVPPQLQvFDhlgmCD9qoxslv4VXCbHl5kOMoeoQNYSFin9FCZu1ssT2v
         RcVgShyRrpUqKabBEmvRBebXPn5D3/QKBrYC8SfT9MVfqXwwpxPv45d+ICjgrDFULOw3
         812Q==
X-Gm-Message-State: AOJu0YwYF87iXwB8e+5/vLDA/y0gzams3Gr/VCQj8jjvvB0A/Uv/Bs2q
	ELZVMmRN9fzCOHpH+mKApoHTN+KQR6zL7wD4Xws87ySJaQlg2a7nq9GlIxVvReA03edn2om1s5+
	CbGBw4Ew=
X-Gm-Gg: AZuq6aIk9PckLMmfKRtHjNEhphTBC5MigDWlMAp4RgnWoflUsSznGssEvCCc1u6F/Tb
	VAosvYcnCkNKTgyFdN2lpzGX3RqyXTNoFX77N5uYX0D1dJBEye7Uuv5V7XQhLdTSmiHz4sXFPRl
	np3bGTwb2G3WozDsKr7OE+YNKEjCemIpHq5KBYpdKK3GPyp7lgR+wU/16yjwzFOEVdHglQ490vp
	H/d5fJIy/IqkKJHAJ0Sm4SzvVy4LkPlgXMQAKcOnroFZBWSpMCqI7NiQ8QLuqTvj6+yUjsZ1gHO
	Geli7EWUFTEg7OyWgaRi7eTYvWXyOZOP+5g5Eq2WHcIP1ikE5ri4kdGYAy3mPsXAoVfGocrBLNJ
	oIY9Fnr1i7gSo5G3LJpyEGPEQibkt6PxRZWvYhy1kyM8Mp4puhtlrWcVJywXPWHWaDT+RR7PNyA
	GeOB2nMqYmCx32LkM2bGvAuuqyXlIvVOmLXqm406EK1XzppaU0y3k=
X-Received: by 2002:a05:600c:8b25:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-48398b5d5f1mr34453765e9.23.1771425668957;
        Wed, 18 Feb 2026 06:41:08 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9512:ec90:a2a2:6501])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dfb4bd4sm538037105e9.7.2026.02.18.06.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 06:41:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] native: Fix DISTRO_FEATURES backfill handling in native case
Date: Wed, 18 Feb 2026 14:41:06 +0000
Message-ID: <20260218144107.2679786-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 14:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231307

Currently, features listed in DISTRO_FEATURES_FILTER_NATIVE are not supported
for DISTRO_FEATURES_BACKFILL as the two variables interact badly. We now have
need to add some features to backfill which are in the filter_native case.

This patch fixes the handling by appuing the backfill, then zeroing the variable
once they are applied. This leads to them being correctly filtered.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index b3411d20ca2..d109907841c 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -130,8 +130,10 @@ python native_virtclass_handler () {
     # Set features here to prevent appends and distro features backfill
     # from modifying native distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
+    oe.utils.features_backfill("DISTRO_FEATURES", d)
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
+    d.setVar("DISTRO_FEATURES_BACKFILL", "")
 
     classextend = e.data.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:

