Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B52BCD80DB
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:50:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.92071.1696945812060532909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 06:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=MDvPyVXp;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso53408795e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696945810; x=1697550610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fI9UM6tfLozec4/yaWAfGoxC+LBvcvJMLK0Auwsbb4E=;
        b=MDvPyVXpfHf3G8wruEdekL036EOZqJQsaBzs1lji2aiEqWv30ncFEEq2DUpNgPIu5i
         17dADv4Y70g+i7Op2j+qwN3PX7mu3FwDMErFoRiMDrJx8O6UtzpekmO/wcrvEa3tf4h8
         /Kr+Ac1IS9LARK9DPYP+e4Ffwu+nPWDlDCVM+nBlHQcci8aPJlWFKvUQK8q6NFewaXXR
         3y7GBII9UPcXn7qaKmt3XpAS2qV8A+uWhY6E035nOy0FP6nMtwbw1YJo7Zg0ycbAjzeo
         hxcQkGzefaBDGAHIHz/5edC1f0+DxpxS3fQsVfLxcM7t2nWN8BlucySdaeHdJqinBTJR
         koUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945810; x=1697550610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fI9UM6tfLozec4/yaWAfGoxC+LBvcvJMLK0Auwsbb4E=;
        b=lGo9mZ4k58tTseN+iQ+J+MX/lHlv0x9ijsRakUTx4Wg3V3yjdkQPs2L0CjpwajuNtE
         RMHMPK84FqphvKc0TAm9T0r2IpvhOmIotcPJ0QxhRwteG6XodSd4R6Z2/x8+iFSIEOTs
         ZTFa+VQXaIjISmArIXqQIpop6LV+WS4NbhO1jdM9C6SIJjxuWwwUaIL60WqiEjK0+ZLC
         wIoKF9BuwTxIX+Wu6w0d5t8hEF91hEu2MkJcrf0pgF4YfuQLaQ0dm5/nnvE99WiFqpkM
         oxRVCiGDcBmQCSsSTz4cMlsioBQQxxzOe6rLJ78mnHOt+CZemHOhkEAvQcXFrtQ5J48O
         nUsQ==
X-Gm-Message-State: AOJu0YwrdVWFYpSeCgVR2RM0/+jHdPcFK3Yd52bmKDI6RfPVCruSKOJQ
	NgUTilB4Fq7XT5JotZ+c2/xUz0OyuElevjUEglg=
X-Google-Smtp-Source: AGHT+IGypVGm98fAw5EvtNv+uJ8M1wNSJUtiojPcMnxRecgn1q+KMduwwawZTP0jXIKDI6NJKdADuw==
X-Received: by 2002:a5d:5911:0:b0:324:e284:fab8 with SMTP id v17-20020a5d5911000000b00324e284fab8mr17376948wrd.39.1696945810094;
        Tue, 10 Oct 2023 06:50:10 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c14-20020adfed8e000000b00317b0155502sm12716070wro.8.2023.10.10.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:50:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 1/4] insane: Add unimplemented-ptest infrastructure
Date: Tue, 10 Oct 2023 15:49:28 +0200
Message-Id: <20231010134931.3994720-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231010134931.3994720-1-yoann.congal@smile.fr>
References: <20231010134931.3994720-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 13:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188893

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
 meta/classes-global/insane.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 5743d91240..c40bae7e3d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1348,6 +1348,15 @@ python do_qa_patch() {
         if msg:
             oe.qa.handle_error("patch-status", msg, d)
 
+    ###########################################################################
+    # Check for missing ptests
+    ###########################################################################
+    srcdir = d.getVar('S')
+    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+        pass
+    elif bb.data.inherits_class('ptest', d):
+        bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


