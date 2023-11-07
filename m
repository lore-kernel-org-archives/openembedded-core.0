Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A789CC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 09:17:32 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.6721.1699348646170114834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 01:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AV1AqZ0V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507bd19eac8so6993618e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 01:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699348644; x=1699953444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SukKMtWhFY+1zvy+9mUpwN7DE8SmVpEMgov6yx71VFw=;
        b=AV1AqZ0VPpvwOrKaPA6kd/fRFMCi4qrQUW4WaKgZgun+LElgyHiDsMthZ9YSVvaPiW
         d4dWi1DnGpjjtiajwKiROCksllQCh11KV5ckWKUuvXbt77xYgBF87ifZzFC7yoluj3Mh
         j+ZvZgSL0NhSJOzj7clUf/G0nU3EUd6XMHwbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699348644; x=1699953444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SukKMtWhFY+1zvy+9mUpwN7DE8SmVpEMgov6yx71VFw=;
        b=eEx2ZC7RioS4mcfmUEqLtF+dOFdpMsQSesBiuXxKwf80c3fryFP5SxqGz/UaIoNrvU
         foncEHO4AIf33pQog8CQh9X1TCL7cRsUKvwYxjBF9Akcl5zPnzYiLbWis5p4v8j8N998
         O1SY5tf3mbXraTC1BrrH7/G8DBcNCJYKYSwHsiKXATdue1PhoMakQjlqpjPnM9jivWCO
         Ms9JX/CrV99IuA8/JSFzUqyl7a0XsuHmoFkZB1c0ChXw/gMEcrtlPa7+/w8NcAcHExx0
         Udd+yQuAJmOj8+c3rW+tM/zJ3/0sbBVB8Cybdw+BBfDFhdfCFhcwG/ruL/5fPLeFcxud
         oRhg==
X-Gm-Message-State: AOJu0YwvhrwJAsw9e8nWHs03EAcHXdFNScOEEzwEnqmiSktUGbB7b1zO
	fXK1j88QxCCGJFa7kodAm/OBFQrjo5memLXK62Y=
X-Google-Smtp-Source: AGHT+IGnKpnrloi8wEPYByHD5RYK9l3g9QsegUYxrOS+La+83zhhaGaTcNmIxqfyJoSEzMSyCUZp2A==
X-Received: by 2002:a2e:a4c6:0:b0:2c0:2ab7:9ab1 with SMTP id p6-20020a2ea4c6000000b002c02ab79ab1mr22542570ljm.35.1699348643820;
        Tue, 07 Nov 2023 01:17:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e4a5:26c0:cc7e:6810])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b003fe61c33df5sm15121128wmq.3.2023.11.07.01.17.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 01:17:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] debianutils: Fix warnings
Date: Tue,  7 Nov 2023 09:17:22 +0000
Message-Id: <20231107091722.1299842-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 09:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190259

In the recent upgrade, which started to be installed as which.debianutils and the man
page was also renamed. Update the recipe to remove the now unneeded man page alternatives
and rename the binary to match what the code expects. This avoids warnings like:

WARNING: debianutils-5.14-r0 do_package: debianutils: alternative target (/usr/share/man/man1/which.1 or /usr/share/man/man1/which.1.debianutils) does not exist, skipping...
WARNING: debianutils-5.14-r0 do_package: debianutils: NOT adding alternative provide /usr/share/man/man1/which.1: /usr/share/man/man1/which.1.debianutils does not exist
WARNING: debianutils-5.14-r0 do_package: debianutils: alt_link == alt_target: /usr/share/man/man1/which.1 == /usr/share/man/man1/which.1

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/debianutils/debianutils_5.14.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/debianutils/debianutils_5.14.bb b/meta/recipes-support/debianutils/debianutils_5.14.bb
index f6ca8a6fdda..deec8d1fe84 100644
--- a/meta/recipes-support/debianutils/debianutils_5.14.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.14.bb
@@ -31,6 +31,7 @@ do_install:append() {
             mv ${D}${bindir}/$app ${D}${base_bindir}/$app
         done
     fi
+    mv ${D}${bindir}/which.debianutils ${D}${bindir}/which
 }
 
 # Note that we package the update-alternatives name.
@@ -47,9 +48,6 @@ ALTERNATIVE:${PN} = "add-shell installkernel remove-shell savelog which"
 ALTERNATIVE_PRIORITY_${PN}-run-parts = "60"
 ALTERNATIVE:${PN}-run-parts = "run-parts"
 
-ALTERNATIVE:${PN}-doc = "which.1"
-ALTERNATIVE_LINK_NAME[which.1] = "${mandir}/man1/which.1"
-
 ALTERNATIVE_LINK_NAME[add-shell] = "${sbindir}/add-shell"
 ALTERNATIVE_LINK_NAME[installkernel] = "${sbindir}/installkernel"
 ALTERNATIVE_LINK_NAME[remove-shell] = "${sbindir}/remove-shell"
-- 
2.39.2


