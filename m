Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web12.8164.1621599637486262805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 05:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mBZqZjVk;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id w15so23692924ljo.10
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZC4lHLL738QaEl0f2D2HrKXJuNoj5XABan58ItqKdaU=;
        b=mBZqZjVkvL2i9tOr5QNTCJg9CvalLgaMTopKlfxZYASX4Y80MMzr0fhpROUFRBs0Ue
         9/rh+7RWjm1YTw2Nh4J+DRmivmGAhJHiDBnsJcd52SRENhkINuwrwb94jkI4bIrFa1R+
         dEDB3mUZv7Q8ZE+d2QEdunJV8fbn1mVwb0ZLZ6CxcdxcOVb+J8puQ2bvfx1VZ7At8WBk
         CY6nnHlRKlXm28B2IiwQtheGY6+4Ski/gFEj0O3+6E6l5RKi+V/tpXYJq9Xfjj2tZyok
         tQIfA7dpWvENFD5JQHBiZGDhDRCloNuCcOFxCywt12xL0GmdxEa26RqQ5+WwjTn03GGs
         fr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZC4lHLL738QaEl0f2D2HrKXJuNoj5XABan58ItqKdaU=;
        b=KFCjF0yCEdccpI7g8FJgcKxHoOTUVXzi7SHIhIXryDTCZbSLoKRu2GzObxri+riGmd
         9XgS4i2ONwdasqvRIDuyTDdDqsFGx/+uVDnBdwN9KH4uuKhd4gzFSV19g9/bSWN2atDp
         Dono7rPQ2poq6BeexPwc85E2kY1F+c6mTI51qIRB3UBBWWh8hhPgoHlQYkLSko3ul5/U
         uyOe/z/v6emfV+jhrGmHo4WvsIwanabyl9lA4peR//Z8SGlnwtHQZpc3O+bOJVuTMSo+
         OOK+WlW38DknPuZffd8Em1rZMh2tOC1oAyN6mKsPSYzQySM9vjuC0imiunWx2ESPgmgF
         /DzQ==
X-Gm-Message-State: AOAM531hLqnhT2EwkbSNH9NeL0aS3d50M+kqcTuD9YxNotSXQQ/tR+H1
	HmHmlLmidOvRAv+MmFUeIP/GLGw8cNs=
X-Google-Smtp-Source: ABdhPJwdSXkVgM4dSNfE7s3nr66wHTxkVRyBXP5l3RQ5FLGDRi+/OzrDf+wny4jOAacu/LtT8AErpw==
X-Received: by 2002:a2e:7a17:: with SMTP id v23mr6638377ljc.99.1621599635491;
        Fri, 21 May 2021 05:20:35 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m90-129-203-26.cust.tele2.se. [90.129.203.26])
        by smtp.gmail.com with ESMTPSA id g15sm626355ljl.38.2021.05.21.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 05:20:35 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] kernel-fitimage.bbclass: fix wrong separators
Date: Fri, 21 May 2021 14:20:32 +0200
Message-Id: <20210521122032.196712-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Change to use '-' rather than '@' as separators.

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

