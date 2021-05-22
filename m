Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.4375.1621671258762613255
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 01:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cRIa+GFT;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so8604319wmf.5
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9D2tfzN5KgYiNtYE2o3lTTgaONMLxd1BktNVNHMKB+Y=;
        b=cRIa+GFTmbvYG84qOQa8kD1SGzo/rMgLQzyB4GKY3Ybh8jDhk+CkNlXXV8v2CLAHMc
         vZ73n2/bKm4lUdhPDTId7GpKBV/lAIgjRRVAoAO/HFfXWXQqQzxqdcSaXcLjslkvLGqx
         nZlBAPhj+9Jm8sGp7dQ2EtcG1/0MAoa/i9jpKWSLmhesZaYHeTK0jflJAJ6NpTZ7wMZh
         AI5N+vKFQD7nJpxr6CvFJmVxw81hSo3tsUUfEhA646utOh1bz6nG53z5I50Pf2IRAHsV
         k9wFFwtM1lNnoB9yGkjPHHvQmESxYo1BBCh0wwXyfIw6ykfAc/fs2JWM9G4htduEtDQF
         6AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9D2tfzN5KgYiNtYE2o3lTTgaONMLxd1BktNVNHMKB+Y=;
        b=VRLVk9FB9UNkCX4HPdT5oyPuVd7B2uYx0dy1T+jpFG/a4nT4iJrKmJ8FCXX9Yal6FI
         mdkkBP/XC5RC1XLxh3o/kiZJiHtSg9SjhtZJPkKgKv5WfDiM4CYwinQc3zAtUijBpUog
         7G6+pt8RfdndnMgPu4noutIh9LMKg53yP6khvzZ6AnGVVwbDBEUBFhtIOsuG/9b9p+Qs
         i9htTsy2AQeBM7U6b7EcNLHU1MivEDgnwQSsTWukTiuKnywj1W2bWMeHtmeirotI2AGB
         cJCyxFLcsuMc0TgbD/qsG2KU/yLHi0TepBj7yt2EpaJL3Hews9JpE5BJAb1pIXz0E2fV
         viWw==
X-Gm-Message-State: AOAM532aFQi2efOwAyMTvuKITx6H16lJ8UyGsZens/8Y3QscUlKstcXm
	on/Lokx95n8DukrMFDI01KDKuhZmOFk=
X-Google-Smtp-Source: ABdhPJw2Q7c5zmKeuGvV71oqq9gq/k8FpImjyaNT7lwYc0z0NmGmaSRYFxWAq7QW1enxmTXg4OCDVg==
X-Received: by 2002:a7b:c446:: with SMTP id l6mr12139867wmi.75.1621671256970;
        Sat, 22 May 2021 01:14:16 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (m90-129-203-26.cust.tele2.se. [90.129.203.26])
        by smtp.gmail.com with ESMTPSA id p14sm4604350wrm.70.2021.05.22.01.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 01:14:16 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2] kernel-fitimage.bbclass: drop unit addresses from bootscr sections
Date: Sat, 22 May 2021 10:14:10 +0200
Message-Id: <20210522081410.11092-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

In commit 6047be9f:
[ kernel-fitimage: Don't use unit addresses on FIT ]

It had dropped unit addresses from FIT image but missed on bootscr
part.

Drop unit addresses from bootscr sections in this patch.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 5cfd8af99d..4858037706 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -217,13 +217,13 @@ fitimage_emit_section_boot_script() {
 	bootscr_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 
         cat << EOF >> ${1}
-                bootscr@${2} {
+                bootscr-${2} {
                         description = "U-boot script";
                         data = /incbin/("${3}");
                         type = "script";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
-                        hash@1 {
+                        hash-1 {
                                 algo = "${bootscr_csum}";
                         };
                 };
@@ -232,7 +232,7 @@ EOF
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${bootscr_sign_keyname}" ] ; then
 		sed -i '$ d' ${1}
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${bootscr_csum},${bootscr_sign_algo}";
                                 key-name-hint = "${bootscr_sign_keyname}";
                         };
@@ -383,7 +383,7 @@ fitimage_emit_section_config() {
 	if [ -n "${bootscr_id}" ]; then
 		conf_desc="${conf_desc}${sep}u-boot script"
 		sep=", "
-		bootscr_line="bootscr = \"bootscr@${bootscr_id}\";"
+		bootscr_line="bootscr = \"bootscr-${bootscr_id}\";"
 	fi
 
 	if [ -n "${config_id}" ]; then
-- 
2.29.0

