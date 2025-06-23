Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8030CC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:26:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.21152.1750688790342508255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 07:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e8ktRZHO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a575a988f9so2081730f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750688788; x=1751293588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvAgVj1nB56AxYmVE6JYIyvrzt8wUcV9sbE9yf4N96w=;
        b=e8ktRZHO0jLMHy6WzlK69k0aU91WVR/CzaxYt3/gEWwCuvFjTVBc35IRge/KJegljV
         E/g8p1YyC4hu5Qf4cNdwSNAqGlazXIhLdvCrr41jB6IzqnPI2zHZOBc+BSp5KyWh84eX
         Sp+hyaOd2SH4iMSzK62+Wa1fnzDYum5bU20bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688788; x=1751293588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvAgVj1nB56AxYmVE6JYIyvrzt8wUcV9sbE9yf4N96w=;
        b=R8nxp3b9XQ7s9zSLRVeORdj8GF+yh/IzdfB2+3JZTnYTDV1d9cG1h1rXM/NGwmCYbp
         +2YzU7iw/lMsITTKXPwEY1/rIrUmMaVN0XyYygxbxRtPOoqnbTOvdhry1QZ/gPgP8P0Y
         09X/t8vBnOscRpZ9om5a8LH47pujhZPMS7hNTZbNl0Ethu7Zx+66yKhSvI+WjNHYqaCF
         dkc2Qgk8xSvW7x9Sr3zClluErf2Lj+ZJ/dbQcR1CxRC2/lrfeQHgdRiBbPKOxfoeJGjn
         5BBFWTGSDHBblPsb5iay3TTP0F67GYfTlfruA0Pr7F6BgW4jEvKvN6oWvxx+zAMzgaHA
         ta/A==
X-Gm-Message-State: AOJu0YwB6uZ+yok3G02B5WqFxwNK5eTLMOpMd4u9bi/rDkJERgkFyEXf
	PwcD/zzx/pNtwKIHZDCtwpktH8JVcorfErjK0UUbku0JdNMs8zjdDCbj1REuYObd9DMS2Mh5xLd
	AUQHR
X-Gm-Gg: ASbGnctl3GP8DalrBNmBwcv7OlwrohwjDT+TXHjYKOv6YOvVVycx8LbsH5IRHwng+0x
	GqMXuWcULltJYVQQ/H3dImJyF1yDg6JKPlJqLXUoRLuSNUikcesfb0tKoV2O63FhO3iM1rIZasQ
	RvSUeaNKKG5BVLJQ7giPs80iDsh9COxx9h+64tg9Aw+YWLUutZBU0qFOoAzXDrfYxUIm/HllIoB
	cAqJ9mE/2yl5lSCZmZ4UwaII5HuY46sph9rcvtFe+4HsOHfU/QruKaPQDJI3On8sRgNbV3RCp2b
	VFFv8YUGJ+DdhjVNGrXEI0o3wDokqIZaPfkgfmZE259MizOsEgqvU0itbdRkN8PXsQs3MlW7vB3
	zniS0RlwelEdFXQ==
X-Google-Smtp-Source: AGHT+IF28rDdkn7gspQ2QKlsQIrqKs3zh0MK5PQvnzwSDA8uo7DYOILv6pREim5VcsCKuItMBtH2cA==
X-Received: by 2002:a05:6000:4313:b0:3a4:d939:62fc with SMTP id ffacd0b85a97d-3a6d12a0e5bmr9836596f8f.22.1750688788256;
        Mon, 23 Jun 2025 07:26:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c4be:6247:aa7b:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd642sm109318875e9.21.2025.06.23.07.26.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:26:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] image_types_wic: Fix file-checksums for missing files in search path
Date: Mon, 23 Jun 2025 15:26:26 +0100
Message-ID: <20250623142626.2914459-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 14:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219213

When we tell bitbake about file-checksums, we need to tell it both the files
we look at that exist, but also the ones we looked for but aren't present.

This means that if files appear earlier in the search path, bitbake can then
do the correct things like updating the taskhash and re-running the recipe/task.

In this case, wic was only signalling file presence. This patch adds in the
files it looked at but didn't find too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 740ed946f8f..6180874a4cc 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -57,6 +57,16 @@ def wks_search(files, search_path):
             if searched:
                 return searched
 
+def wks_checksums(files, search_path):
+    ret = ""
+    for f in files:
+        found, hist = bb.utils.which(search_path, f, history=True)
+        ret = ret + " " + " ".join(h + ":False" for h in hist[:-1])
+        if found:
+            ret = ret + " " + found + ":True"
+    return ret
+
+
 WIC_CREATE_EXTRA_ARGS ?= ""
 
 IMAGE_CMD:wic () {
@@ -98,7 +108,7 @@ do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
-WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+WKS_FILE_CHECKSUM = "${@wks_checksums(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
 

