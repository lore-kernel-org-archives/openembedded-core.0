Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D64C79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:03 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34922.1788788159120239177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DSmZMtR1;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843e397f74so4423674f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788157; x=1789392957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zJgZMLX8ZA+2Wl0d4BeoaQVShEvOpQ3k8owcn1Dmk4Q=;
        b=DSmZMtR141FptUyXeoRH3FF3FII9Y2B+PGI0p6Tjw+mO271hKJzAYq0hUQUmNY1mmr
         CDA/748ypzjixL9oDG5+NZXJiAOBj9JtK85YRvecMkCsyGdS3jtIXX0UUu6iqtP1vZ+6
         bfJ8kNB7+5305plVarlv/h3bFcheaEu+khj0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788157; x=1789392957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zJgZMLX8ZA+2Wl0d4BeoaQVShEvOpQ3k8owcn1Dmk4Q=;
        b=TAALGbzgaWlAI9w+GwvIAjdn3nWJt5JXsh5jF6OpxKYfK50LSqtxeW7yzEfp2I6Wk5
         Z3jhzp1gRrg+owzTiaoVGLqt+E09zHWdx5lOtcX0FMnk8emDiqUHZczJQBKAtK09A5dB
         /tCRlqeJvt/3nlAQE1MdQmT4b9aPHNY3/AU6T4KE2Pr+B+t10tvXkeY1/HTV5hs7E0pI
         NkWXgXv/iBBqIOI4zGI36kYs8Fh8xrN4yPEhKDAXxHcQmhD4+paEMfwSC45aR6s+dXQw
         VOpvg/8sIwSn4ZRPd1MJsgDeg6shKXWRKTPactaioHjNFkLt32cyJXV44OpD/6oAPyWx
         vP6w==
X-Gm-Message-State: AFuF++lPd8xPPIKEPB3OgvuA96ItbnO/keOClMAkOPfHW2RUAVvwJO6G
	PeiC8zBN0ZuCeoX+1gytswiHXYKeDW97jWAFsfVDpsP5Cpf7yddFj3k/oRSbSHSTi4I18+C8OPV
	mWas3OIc=
X-Gm-Gg: AYBFou0YNgFy591JGUsSOqDLBEQitmB/F+X8PXug6n3VTF3beVmJv6iRp0vvGSGP7t7
	SQn0UU0N5FPYGlrpLnmQIQKeS8n12dywhvGBnVpEDApDDKCKWmfFS1TCbmlCRvLeh8OilQF40j+
	/Cx+1b8Dyw3F4pqy1i7UR4WKIWEIG0PNIWkSPOUYLnK8CmL9Ljr4pDGfVG2ziHsEY+ZwxTukgvb
	Os3FMGvOakm1Iwh0tUTFiCbX6UonzZ0jaYtkgvDHWULWXb5DTcbR6bJOH9X/tPVyg/5+idlK+9h
	ly7GJ+R8FRTmQ+cuDwpYj8xF0Q1jC2jVpYt7whbXr2FwQE3iEDLYXbNYBmiYy02rTKeYfllmFEz
	oPcydyfN6baho8UplYAByCNg8tum7VIibdHfNKItXintaDaCw4+aVOf1skml9+Iqj31qwvhRZrc
	rKqwnGMXUlRps4dX7+/t/MGYm8riGl3xmtRiE2os4afeXOYzCk27FJmRZA/xYuGTmGxiwUlgtze
	wF141V87P+lzWiOTlqeL44brcbUz1/wiDAmQ7q8ONzK/B5Ql+z/G1sOIXKPxKXz
X-Received: by 2002:a5d:4902:0:b0:484:4817:dcb8 with SMTP id ffacd0b85a97d-4857e51b03dmr28223957f8f.12.1788788157303;
        Mon, 07 Sep 2026 06:35:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/35] alsa-lib: patch CVE-2026-56109
Date: Mon,  7 Sep 2026 15:35:08 +0200
Message-ID: <1f7cd9a1c65bfc1a4dbba3830d7092acf02174fd.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245270

From: Peter Marko <peter.marko@siemens.com>

Pick patch listed in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../alsa/alsa-lib/CVE-2026-56109.patch        | 33 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.11.bb                   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
new file mode 100644
index 00000000000..6189d46e5dc
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
@@ -0,0 +1,33 @@
+From 536dd6f8affdf5197c12a63a71c92a70b2833cc0 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 8 Jun 2026 14:33:19 +0200
+Subject: [PATCH] conf: add missing return value check in parse_def()
+
+A malformed configuration may cause SIGSEGV.
+
+Link: https://lore.kernel.org/alsa-devel/CAGt8pqBU0p2voB+qHxWGcNJrKHAcBhAyHUUBPLBN-Yj_SiV6MQ@mail.gmail.com/
+Reported-by: Luigino Camastra <luigino.camastra@aisle.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+CVE: CVE-2026-56109
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/536dd6f8affdf5197c12a63a71c92a70b2833cc0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/conf.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/conf.c b/src/conf.c
+index b0dd6298..e1dba23d 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -1477,6 +1477,10 @@ static int parse_def(snd_config_t *parent, input_t *input, int skip, int overrid
+ 			endchr = ']';
+ 		}
+ 		c = get_nonwhite(input);
++		if (c < 0) {
++			err = c;
++			goto __end;
++		}
+ 		if (c != endchr) {
+ 			if (n)
+ 				snd_config_delete(n);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
index e86239ff871..068a727c67a 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
            file://0001-topology-correct-version-script-path.patch \
            file://CVE-2026-25068.patch \
+           file://CVE-2026-56109.patch \
            "
 SRC_URI[sha256sum] = "9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d"
 

