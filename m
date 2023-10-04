Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B485E7B610
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:58:12 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.17463.1696424282051212132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=a6C602si;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32336a30d18so1921581f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696424280; x=1697029080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LL0lU1WxPb6eLOOZ3FlWP//ATeEGa+5zN82WXIslFwQ=;
        b=a6C602si6V3HF+Ed4hBglcbv4A29l2XVKrWz6hbQLSY+qF20CdoqDnvtd+lNV1OnFH
         PPpjhz/zXA/epZqRpleXtTfge5OdPiK++IovqmWTwtujCuahHapIb5H8zQP7ikFtkCYI
         VjD8F95hxIc6L0gsnA9JTDL4ug9Llz7i+zqrPldY1z1FcaWFGGEXI5rshnhDf5aKoAl+
         VdMhBRsc+o2jkxZgodoAubewiEHmhiImMMjL+1lAuAayrtvtqFWUSUVv/9uDQSQzwb8A
         XZOe7b/bO4U1khktqsWuc3fspfenpjy7MOtaAKNQ1DcVsh2CuNw9x0ZwUGXncaylINY/
         qsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424280; x=1697029080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LL0lU1WxPb6eLOOZ3FlWP//ATeEGa+5zN82WXIslFwQ=;
        b=uSFmrBsz4LyN/+jwDersgbSk0P+SxD6m6jyb5vngR9lpJfBcJGT0gCDF0TPiXTXZQN
         VfQOJDFhoHh0fjWyktqHZc1DAile6ATOrGYTaKg3PVWOHQwMLxIiXSIa2cr5/rVW8BBa
         KDZiPGZrlNupUClUaQ6+JJswE19LnCKHk7rr7c54ANMalXw/ui2T9W67mojRMUm+Ykp5
         BnHIZS84UUpw7JKqzFOfKNhHcYk5stwbj2Ez4zqPlJh2t1t9Fmhf/jjlejnEki1SN/iH
         Gw5Gk3OcQAE8ivcFjLBD8PkAdadfRavoi7ST3ZgXLp0t/43RiuUNqO7yU4VCHwyFzio+
         CeeQ==
X-Gm-Message-State: AOJu0YzRw5g8PlThoFGu0h2SIrTd0T0OOb3nnvU8ICC+rgeve4sq/h8t
	ujmHM2WIir1UQAkVHi40z0oZqlgWnB0FFK11Qdk=
X-Google-Smtp-Source: AGHT+IGKs1kosZGSOHof0VRJzSFrjWZQ32FRKORNrzAQ8gHgQBxGIjS4xBya5sHV56GLiSVNqQqiXw==
X-Received: by 2002:adf:f44e:0:b0:324:84cd:5e67 with SMTP id f14-20020adff44e000000b0032484cd5e67mr1863920wrp.6.1696424280165;
        Wed, 04 Oct 2023 05:58:00 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id j16-20020a056000125000b00326f5d0ce0asm3958763wrx.21.2023.10.04.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:57:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 1/4] insane: Add unimplemented-ptest infrastructure
Date: Wed,  4 Oct 2023 14:57:28 +0200
Message-Id: <20231004125731.1785803-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231004125731.1785803-1-yoann.congal@smile.fr>
References: <20231004125731.1785803-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188681

From: Jérémy Rosen <jeremy.rosen@smile.fr>

This infrastructure will use heuristics to detect when package sources seem
to have unit tests implemented but no ptest have been implemented in the
recipe.

No heuristics have been implemented at this point, only the infrastructure
to skip the test when ptest are implemented.

This is part of python_do_qa_patch since we need the sources in their final
state but do not need any configuration done

A missing-ptest QA test already existed but it was used for a different
purpose and overridden by ptest.bbclass. Thus, a new QA keyword was added

Note: The QA test is not enabled by default and may be enabled to hunt
down potential ptests with:
  WARN_QA += "unimplemented-ptest"

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 5743d91240..857f0a3736 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1348,6 +1348,18 @@ python do_qa_patch() {
         if msg:
             oe.qa.handle_error("patch-status", msg, d)
 
+    ###########################################################################
+    # Check for missing ptests
+    ###########################################################################
+    srcdir = d.getVar('S')
+    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+        pass
+    elif any(override in ["class-native", "class-nativesdk", "class-cross-canadian"] for override in d.getVar('OVERRIDES').split(':')):
+        # These cases are forcibly disabled in ptest.bbclass, so don't report missing ptest for them
+        bb.note("Package %s QA: skipping unimplemented-ptest: ptests disabled for this recipe class" % d.getVar('PN'))
+    elif bb.data.inherits_class('ptest', d):
+        bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


