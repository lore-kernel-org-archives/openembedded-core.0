Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924B1C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 17:46:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.31994.1660758382082331458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 10:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T5GBul0e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id j26so4772218wms.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 10:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=ELwBE+3zlY9+idOMhTpZDYO2benKrwgj01QEZPqQQ4U=;
        b=T5GBul0ePPI9Q5MjrDiCF14NGV5RC0+ulrXzlDxZTJlXuBguaacOvpte61ul7TlVkp
         UrQcOcgKvv4gI9freAq9bVfWAELLkZjBK7svTGX9topm4XG9A4MPclU0LK5KPOX2kbMA
         VxQRGIqMpi/PLp9cMsOEbvW67UsocWiNfnxDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=ELwBE+3zlY9+idOMhTpZDYO2benKrwgj01QEZPqQQ4U=;
        b=2WlmbKLwoF0H0nja2ZThaRvX3WKJmDIwH3phAwNa1/rGpPyAa2MSFpgCUA0mV3TAq4
         iAwvZCsrIvbdTjItNUMzbAzjWbZEuPrKAHzE/XaPlZCB1t1fvGk5DwPUps5V/VsqmCsD
         dYCzf99gHJoCVboUpDl5w3IMzMfpgegOw2jVKmIwolCErwPa7rNdOa5BRa3Y4LwB5zTf
         qmJ/CjMGcyGOVwDIUkWcxMyvjJ5g1rENZHZxDUIOya0754zotgGdX7Iymyhtv8ASHXDO
         DQivK8WTxy/+o6O93G/bVMBW9D/sjnUo8SjL68dZUsZBn6JU5T0sjzwQ6guK7Ej3zHqh
         dzFg==
X-Gm-Message-State: ACgBeo2l1Q/28x7S4r1XGTb3pLoQB5acwcpMzfS/MUy7JzIseiJXO1p1
	A5TFX5BQtSDBN6x21v3BhYcb34DEJGf7kQ==
X-Google-Smtp-Source: 
 AA6agR5gaVqbyDF5ptWbyX1R9cd5cEd1h9BZTTWRh8hyolLLkQIaGl1F8qHvCLMFBC/B5ybL1F/L9A==
X-Received: by 2002:a05:600c:4e11:b0:3a5:bfd3:a899 with SMTP id
 b17-20020a05600c4e1100b003a5bfd3a899mr2823683wmq.185.1660758380163;
        Wed, 17 Aug 2022 10:46:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 s4-20020adfdb04000000b002211fc70174sm15717564wri.99.2022.08.17.10.46.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 10:46:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] valgrind: Update to match debug file layout changes
Date: Wed, 17 Aug 2022 18:46:17 +0100
Message-Id: <20220817174617.1874788-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817174617.1874788-1-richard.purdie@linuxfoundation.org>
References: <20220817174617.1874788-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 17:46:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169499

Update the recpie to match the recent debug files layout change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/valgrind/valgrind_3.19.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.19.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.19.0.bb
index 69915de5057..4b21b74e902 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.19.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.19.0.bb
@@ -239,8 +239,8 @@ do_install_ptest() {
 
     # As the binary isn't stripped or debug-splitted, the source file isn't fetched
     # via dwarfsrcfiles either, so it needs to be installed manually.
-    mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
-    install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
+    mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/none/tests/
+    install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/none/tests/
 }
 
 # avoid stripping some generated binaries otherwise some of the tests will fail
-- 
2.34.1


