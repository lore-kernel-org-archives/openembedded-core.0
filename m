Return-Path: <yocto@nkent.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD1DC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 08:51:04 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64605.1782982261595988758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 01:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@otiv.ai header.s=google header.b=e2+S/GRd;
 spf=pass (domain: otiv.ai, ip: 209.85.221.50, mailfrom: nathan@otiv.ai)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47488efcf30so928556f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=otiv.ai; s=google; t=1782982260; x=1783587060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WjtOBgq+wBbH9BOC/GPgI2o6Q+46nPqfzjQS4fXOA8=;
        b=e2+S/GRdWL3E0Bta9PwVFqIpYsOI0wXmNQR+xB9Y9X9yauadRfSN2DKPrl1L6F7tkD
         zcK1q700se5Sqyw+0pCsE+KccYXSycjQBXeDcTeeWVisOYdnuXl+d9CkeUzmDKVSKZsd
         2tt4Hcays6gtGip+ZeOGCVJbiMYo/v4REXQN/q9BQz0pHGOIO9HoQ1gVCVDvJqxqrq8Q
         8kTiy475wnb/k8JVKOPMhF5cGodXhPhbph0sXDFsepp1ZEHHJJzOzt4i/7QyaNqd/Od0
         /7kdaCKcwtX3Ggogv3Uu16VQb7j3uEQSWGRXOesRjP6rAdlQ4Qn0wJEwDmTfeWnPC8Bf
         BFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782982260; x=1783587060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WjtOBgq+wBbH9BOC/GPgI2o6Q+46nPqfzjQS4fXOA8=;
        b=mgSub/R6ApUnJ5c/NcGNTv/JMzt7dlzKyGYNYfEOf8jB5jkNPvC7lVZcAduhucqf+N
         ICkp85+vJWo2uVJSQLeH2zTQHXO48XQOnf0sv92umIS1pBL9uHHtGjFNJzFCkV/oFLOF
         D9zOCpqcFvexvry9grNnk2+Sg1skl2JQWS/oKHzjtSJnvMsuwepvyFCK8ocMQehZVa79
         DxmILqFwORpKDMVEh2cdIMyYf6HakFa+2kwiYTBXYeYx4xor33CQj1KPrkCbhvjcp1+r
         0+SNhbUQyGOLjWfIC8JdbVUkyS964AB2iQZYEcoeoYD5vsApb5M/zCLLfSWvPihdY1Gi
         8KlQ==
X-Gm-Message-State: AOJu0YwFQ8ThK7NTtRW65T6etkjyQDUZUAGDWC3UelEJ4aZEMl4yNkGy
	/LJLfnPL5kHH+wFTuUDxjyMtFs6nPpCF/ib98YYsHVvE2e+Ici6rPnED0nD0OSm8HZFEgEXxZYP
	ozYw6aJ8=
X-Gm-Gg: AfdE7cktN0bKi31RQtPIWMQXztgnckIBfIXD/322HR1TygbUHFbsosL6U+0ChNFX7WJ
	pDNcJNiTKpdTmFpZbs8eI5W8Z4ymdOAksNYd9lKClIF6aC6Te/riNqMwO5Fd5i6t6KfsEmHIR4H
	3ctBhCfEPqQu1U4gPzEbRlMooDMP0NcbBGLmrBBvDmXDE5P5f+1gY0LKYDfx8bEbyysRfU8m/NY
	h/06TM6H6GC4vodpvoGX5YLotj1TInBg1psCntt5NaLCN/yHZvXR+EAwltMDhJfufY7W5Q4dxVi
	ISNaxn4yEU+bi30sFLuXyVZ102jK6rOfeiljzm+zV2zVHZGBY2ZNeLgpyV54nqVjx3KjCdI0+3L
	Zn7tP/rETGYeU9La4zGvGw0dl52jqenKRdZ1y8KYoMoONXv1Y3GYOt49uNjfr0s+2r++JfUlY2b
	VTrhDmfS322tb8Gy3j9rQtpnbJfD+YXAwWC4A4bYrym47XCni3IQMEEpO37Q3ozPxATG1HshdBb
	g8=
X-Received: by 2002:a05:6000:18a4:b0:465:ba53:a006 with SMTP id ffacd0b85a97d-477588e7d03mr7682785f8f.23.1782982259810;
        Thu, 02 Jul 2026 01:50:59 -0700 (PDT)
Received: from nkent02 (2a02-1811-e507-d800-de56-e30c-805-27e7.ip6.access.telenet.be. [2a02:1811:e507:d800:de56:e30c:805:27e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm6693727f8f.2.2026.07.02.01.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:50:59 -0700 (PDT)
From: Nate Kent <nathan@otiv.ai>
To: openembedded-core@lists.openembedded.org
Cc: Nate Kent <nathan@otiv.ai>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][patch] sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers
Date: Thu,  2 Jul 2026 10:50:43 +0200
Message-ID: <20260702085043.260955-1-nathan@otiv.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240026

[YOCTO #16321]

In version 1.9.17p2, the line that the recipe uses to add the 'wheel'
group to the sudoers file does not exist. This updates the sed usage to
the actual line in question.

Signed-off-by: Nate Kent <nathan@otiv.ai>
Tested-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76231f202a437be221c2580d4fa0fc100c453e92)
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index c934dfdce2..90672ed7af 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -34,7 +34,7 @@ do_install:append () {
 		install -D -m 644 ${WORKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 		if ${@bb.utils.contains('PACKAGECONFIG', 'pam-wheel', 'true', 'false', d)} ; then
 			echo 'auth       required     pam_wheel.so use_uid' >>${D}${sysconfdir}/pam.d/sudo
-			sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
+			sed -i 's/# \(%wheel ALL=(ALL:ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
 		fi
 	fi
 

