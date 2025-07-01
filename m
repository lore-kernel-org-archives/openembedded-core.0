Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2143FC8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:34:31 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.4665.1751355261154454984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DFwkUsmQ;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b553e33e6so26291581fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751355259; x=1751960059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXfpXT9vFjV4Ijv0D8UWy+lop4TnY9hd5VtpLJWVxXo=;
        b=DFwkUsmQBSBAIAbyhS5GiFeUfB8RL2MiOSlTZPAL3QcBF3LQKPaAs+f4xW1EbCGTbE
         W6RlN4rCHpjWwuX5Gb7EB8QneaCXEDzsH/mb8aqbCK4knN8amdMZq8WC0ogk0dK3XUZV
         NhUFZttR/XHi9bffOpTRnq8uHAyjX3y21ZAOKnzHrHeb2d+C8LspDwj0K+Cnl8ryIfL8
         CCs3Te/qBv9Sjc6YszOxnPjOUTVqdKy9K5xjsTwW7ud5DrWtPm428QYwgjTEs4DHcYjK
         vbtTXjXt3731vuokts1jvq7MGHKdXpKphnugAkbFP90qZceCYH0Vpe+kppr2XIgNy2uG
         L9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355259; x=1751960059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXfpXT9vFjV4Ijv0D8UWy+lop4TnY9hd5VtpLJWVxXo=;
        b=PIuNUE3wwGO7NBT50z4UDNrp1b7ShNJKjZKpEXxCMWof/xAMjr/mAG38Jz+anMCJsW
         +kGBh2J871ljdaF0yCxZNEY8bkcSOafl93aNgdZ8uoLdtGkeSMqnucWHNOKVXIIkQ16W
         +ZruyNmqepoXiJy6Wodmz3djNXew1bq0yDTyhJeuX1zzNISVc6AZN7F09QZOdtAJn0tj
         lsRy+CpBgGntQsBVixubmpsgQ2H88bOpxGVf0CvLyMQZKF6yWhodwcAeB0hFtdlkWsvk
         QozNFflMmcL/hAswBQylzVB+c35LWGa93+GcLYOFS8gBtweyIi4Nke47SU3mH54uDTj9
         aZDg==
X-Gm-Message-State: AOJu0Yzmd1Nmi9OCLLjY676Z1MC07iR8NYjpXWIdIOSLDVGyfnCVpOQa
	B+IrljGRadPKVHoFFayTIgK9lq6f4MYmbQEmQpLyX3mvXDy8fOkuCBfSjghAz0LYjhJAWJup+Ev
	S9JELboo=
X-Gm-Gg: ASbGncuc9dzUlyOdhoyk81frhoryYkh17Lgcf/3Q5wyLcMWb6kodmbr06QhM4aNxiLu
	znmNA0OvwrZlduBVKr52gJGRKqONQ/tjG9n8Q1ROeKO11RbJxvbSOGmaP3ZBMTJVVrLF3IGpyGR
	jMuSyVdABCt/BF8zLs1W4cYpKXVgX1BYu/c3ja484MqRNcUzINaO0wBDCWT/Cv7Qk89ae7+bk3b
	985ftK/r6U5CZq1ZqG7ycje+Rp65bbdaolbY3i8BPWMCyA3/BL4SRJj8ZBCwXXYeYac6iTPjREn
	UGijL1/SCMAc3uaIptyTnDBw8xRU4Zx1j19KonyJ384U+0JB1zh/uh32yhDg2Nkumht9VykGBPw
	GHRxPKB/jcw005K/FY879Ig25Ot14ykFjIu029zI=
X-Google-Smtp-Source: AGHT+IGrWF23x5qlhJ/2XP1E8r47snZvItFEYy/Ns4GqFxVfPRyKQTATixJcEdrILXi7hAVb4rLEmQ==
X-Received: by 2002:a2e:a22b:0:b0:32a:7d61:ded0 with SMTP id 38308e7fff4ca-32cdc5186aamr40590221fa.19.1751355259085;
        Tue, 01 Jul 2025 00:34:19 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2dead99sm15268581fa.22.2025.07.01.00.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:34:18 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 5/6] testexport.bbclass: use image suffix in testexport tar ball name
Date: Tue,  1 Jul 2025 10:33:58 +0300
Message-ID: <20250701073359.979368-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701073359.979368-1-mikko.rapeli@linaro.org>
References: <20250701073359.979368-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219552

testexport.tar.gz is image specific. Thus add same image name
suffix to the tar ball name. For example genericarm64 machine
core-image-minimal image tar ball changes name from
testexport.tar.gz to testexport-core-image-minimal-genericarm64.tar.gz

This way testexport from multiple images can exists in the same
directory.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testexport.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 843d777e3bb9..3005fc0dfa52 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -136,8 +136,12 @@ def copy_needed_files(d, tc):
             if dir == '__pycache__':
                 shutil.rmtree(os.path.join(subdir, dir))
 
+    image_basename = d.getVar('IMAGE_BASENAME')
+    image_machine_suffix = d.getVar('IMAGE_MACHINE_SUFFIX')
+
     # Create tar file for common parts of testexport
-    testexport_create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
+    testexport_create_tarball(d, "testexport-%s%s.tar.gz" %
+        (image_basename, image_machine_suffix), d.getVar("TEST_EXPORT_DIR"))
 
     # Copy packages needed for runtime testing
     test_paths = get_runtime_paths(d)
@@ -149,7 +153,7 @@ def copy_needed_files(d, tc):
         export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR"), "packages")
         oe.path.copytree(test_pkg_dir, export_pkg_dir)
         # Create tar file for packages needed by the DUT
-        testexport_create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE"), export_pkg_dir)
+        testexport_create_tarball(d, "testexport_packages%s.tar.gz" % image_machine_suffix, export_pkg_dir)
 
     # Copy SDK
     if d.getVar("TEST_EXPORT_SDK_ENABLED") == "1":
-- 
2.43.0


