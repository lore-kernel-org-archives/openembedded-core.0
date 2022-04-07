Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81AEC38A06
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.7279.1649341919989851272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PxuQqBvw;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id n6so11176080ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i4pbzDou9TUfrZVwrfyGy2fH7Lhv0uHXesZngN17k7w=;
        b=PxuQqBvwJZDGYhibF7mpRQRm5ikZc43Ul2/myaYqnvDsCoIjgvpNfeb568869B35/p
         dw87oClPftANRb0Uqovj33VTS4wm/XAC0T8Aj1Kmj609HrVitq5NCbdKFBRNaAUj1SJR
         vghBt3hsiFHLv8W8t+tMaL4PIhvZSA5hEUiULRa1KsAXsfq/f88retVZFnrmIEcnvqez
         MgEcsBRYzIdmWqcZR1us0FcFc11NRnab7BBRXBkcw4+fd2OwjW2N90aEHMRn0G+b2zCW
         wDoKSMKcOznOM4oJ+5HopO5hSAmlUT2NmNs/tRTSbLI5MYXBB1zKw6Q2x7A1CmtprPdB
         AcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i4pbzDou9TUfrZVwrfyGy2fH7Lhv0uHXesZngN17k7w=;
        b=bn5FdELg5OBB52UIV+9ZwD14UoVwvkczzufLtfLsKnRCgNzGxEsf8ZmRPJl2NXXQtd
         FiU7W00YVimzIpRLv4Lh1PHRXmfBA0noJkkJeYdZao5orvI7+xrOzF/eeQUwD0nN58/s
         t+DIW49o5ga11aKd07ELMcw9CXrgOj6sa42zuBFBFOn92YH9qhn0QXDpJUBeVnxMcqhK
         GRkxvkN/O/KxISqYETIDDjFWPJxQ1Va99p74PrZVv8eULI1lKPlbmYYduSx641PC32Ft
         s5KtoS9S4gepjfMNjA9cnUPTJXtUJpLgIjktZK6C0bX2pYro+wHRyuEV2F2McjUsdnGB
         ce5Q==
X-Gm-Message-State: AOAM530EIxJffLnohfaZrF8zXRbNlEQU82LxzaX8BQeQSmPlyAcSFtZ7
	CRbASUYh3zUGym98pv+2jnCRHZ5DKrWU6A==
X-Google-Smtp-Source: 
 ABdhPJw556mzbJoTWpvflnDya1qTEncHvOQYMjpiFGBvoVvgQf5nOmIATJy/rf/RmLjPilxCcwPemw==
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id
 hd15-20020a170907968f00b006dba3c5ae3emr14011480ejc.770.1649341917994;
        Thu, 07 Apr 2022 07:31:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 s4-20020a170906a18400b006db0a78bde8sm7751322ejy.87.2022.04.07.07.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:31:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] license_image.bbclass: close package.manifest file
Date: Thu,  7 Apr 2022 16:31:50 +0200
Message-Id: <20220407143150.2397737-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164111

* fixes:
  NOTE: Executing write_package_manifest ...
  DEBUG: Executing python function write_package_manifest
  /OE/build/oe-core/openembedded-core/meta/classes/license_image.bbclass:23: ResourceWarning: unclosed file <_io.TextIOWrapper name='/OE/build/oe-core/tmp-glibc/deploy/licenses/core-image-minimal-qemux86-64/package.manifest' mode='w+' encoding='UTF-8'>
    'w+').write(output)
  ResourceWarning: Enable tracemalloc to get the object allocation traceback
  DEBUG: Python function write_package_manifest finished

[YOCTO #14772]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license_image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 0a5ea0a2fb..7e1d0e08a9 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -19,8 +19,8 @@ python write_package_manifest() {
 
     pkgs = image_list_installed_packages(d)
     output = format_pkg_list(pkgs)
-    open(os.path.join(license_image_dir, 'package.manifest'),
-        'w+').write(output)
+    with open(os.path.join(license_image_dir, 'package.manifest'), "w+") as package_manifest:
+        package_manifest.write(output)
 }
 
 python license_create_manifest() {
-- 
2.35.1


