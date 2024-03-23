Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32D2C54E67
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 19:53:10 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.16376.1711223588302920660
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 12:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=qvZbuvso;
 spf=pass (domain: limonsoftware.com, ip: 209.85.160.43, mailfrom: anibal@limonsoftware.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-22215ccbafeso1555161fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 12:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1711223587; x=1711828387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chgZ3O58JbwNv2ayukDyFinhmjpObi+l0lpg/bJ/j84=;
        b=qvZbuvsokCebD1ia6e4W/2PagEXfi6pRVeMYDpBw87OALGcwsmLxJUJByJqB3o4pSq
         1vcJxQcCkzbU9pm14TwUJpmbswZ6KcE88NkIhlnSg7InyWLwuMuXx3Qvv/yG5PTx5BeP
         AroIRffMkWeb1k776H9/xiw3G0UTWM1g7/U2FjFxZ6WwFzyD9c5C1hOT6yyXv2N/NHSK
         R6NLtbZHAh49JZhSODDyVb/kR6jsKAf5kTmppIrE4YlLtyz/I5uomxfztM4rQOuj/AhB
         65fOrmqT525oZP6gKOEtk6kq2U2UUUKXV6rCsO1G9MIHMBpOQYq1+flL2yITWt4VojeC
         mLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711223587; x=1711828387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chgZ3O58JbwNv2ayukDyFinhmjpObi+l0lpg/bJ/j84=;
        b=RNhbsOiSsC67/Wq2hxIU4FJ4Ms3nYqg504/A4deXdk8U1jq+rRPyyLW6TJJ1N0YvA8
         e6ZkcYunNZuONLbCgAEjP0ylRINlbL/19wXHyhT0ZWoj2f2EYmzW190mV9zO+qYKK1zn
         H9483DXJ+wS5/b8P061JVH5Fw8Qcl1euCWGjawk/skulUcOIipe7m1+bdiAkEB5SrrMQ
         31zb6n/yTFFrBvr7zGh371tBlyYlir7lfwXspvUdkT+IHy9IZbuNFEZCplhBfgmw05tj
         xwIW6ntLlIR+bzOCq7XuY9Qqw0QAY750/fNsmgBeu++u8icCnfNq9ekaFnkyk6HZaoGY
         m98g==
X-Gm-Message-State: AOJu0YzDDelsUoAdmrBNIuKGlv3lRdPe9/MZ1x7TsRNS8Dc57hvv4/u4
	dQpbKRO2fm1DqiitYKzTiiDyFGr/zmFxzDuNFYb7+Y3j4qovD2uS3gN44ghj+kDPw+a2MWoCxPN
	W
X-Google-Smtp-Source: AGHT+IE43ZP5Cfd+uMRDkL9/QFdaIinalpaiRYJWiIsOtS7KoMvfRYv8qte0DOoOKr/Ui5ZI/b2cvw==
X-Received: by 2002:a05:6871:520f:b0:21e:e476:9170 with SMTP id ht15-20020a056871520f00b0021ee4769170mr3680363oac.43.1711223587450;
        Sat, 23 Mar 2024 12:53:07 -0700 (PDT)
Received: from blackbox.. (fixed-189-203-87-105.totalplay.net. [189.203.87.105])
        by smtp.gmail.com with ESMTPSA id et13-20020a0568705ccd00b0022a0bedad96sm440475oab.12.2024.03.23.12.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 12:53:07 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH 1/2] wic: bootimg-partition allow to set var to get boot files
Date: Sat, 23 Mar 2024 13:53:03 -0600
Message-ID: <20240323195304.2909926-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 19:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197470

This is a generic functionality that takes a set of files and create a
boot parition based on IMAGE_BOOT_FILES var, allow to sepcify the
variable name so a BSP plugin can extend this and re-use the
functionality.

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 58f6da72c3..1071d1af3f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -32,6 +32,7 @@ class BootimgPartitionPlugin(SourcePlugin):
     """
 
     name = 'bootimg-partition'
+    image_boot_files_var_name = 'IMAGE_BOOT_FILES'
 
     @classmethod
     def do_configure_partition(cls, part, source_params, cr, cr_workdir,
@@ -56,12 +57,12 @@ class BootimgPartitionPlugin(SourcePlugin):
             else:
                 var = ""
 
-            boot_files = get_bitbake_var("IMAGE_BOOT_FILES" + var)
+            boot_files = get_bitbake_var(cls.image_boot_files_var_name + var)
             if boot_files is not None:
                 break
 
         if boot_files is None:
-            raise WicError('No boot files defined, IMAGE_BOOT_FILES unset for entry #%d' % part.lineno)
+            raise WicError('No boot files defined, %s unset for entry #%d' % (cls.image_boot_files_var_name, part.lineno))
 
         logger.debug('Boot files: %s', boot_files)
 
-- 
2.43.0


