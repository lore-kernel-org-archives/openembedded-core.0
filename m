Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.1129.1586200911959051714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 12:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HUmQQFec;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id n17so945639lji.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 12:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2I6ZtkAODQCnNG5pwxAAgTYsb1mBj2cTTGzvZd2zXfs=;
        b=HUmQQFec5xHRub7Jq2Q3vLqNp/Gq7wzJCJZkDvlBldFf5tzPQziv7lM+kapmzCRMGk
         jRLVTe0taAUpSD0fsOUgcPMoMgSbSOPInln+9rwUXnUD3LeNwwO53/QYCMEMYu9zLcHq
         NhBR004OdbzAGb53z7WlU9q/mbwIehux9lyGid/NNwji6lfjiF8uvVktUkZ/C2EzUaXD
         hpd59lsOOCbjWzZheQcDSk37Fa1bLSEjXEAi9e27DmrToSoZrZx1gbHxSLb3t+cN1Hlj
         v0P8AuZhrMbKn6tKC4gHLND4ri3j/NfKvLohfFTKdHVegnGc+iGmrY/kJECPT2i0lbFj
         xhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2I6ZtkAODQCnNG5pwxAAgTYsb1mBj2cTTGzvZd2zXfs=;
        b=rdKzs6xDXk7LycO+0NkC1lSzzuU6Ot20af81fHeF0euklMZhES1N0yww5ZcusBlTPp
         O+t+gG6fENQjfaLIoKj+A4VJ3Gc1Mr3mBohrEx0XOyAlyH5VGFm/1stidu/68DsWwnjm
         zsBlO8jOwXs99bzb3a8aE15+M09kHO60EzTIrPe3JVEvaXgCZwyBdC7ua6WfqMDfkmXd
         i85+RXXdtLDNPSky6eSaOcVCp5O1GKGYXsUAXQzbgH3/O+gLerusmQrkkjZp3ss/mHKU
         5abl1nJcqR7XKPlysGiMC6NOurM8v/HfPLUWAJVHlSPrzP9mKNqYBfd2NQtFpEqJymfN
         sUgg==
X-Gm-Message-State: AGi0PuYTGTlgp1wuktGww6O5aVhDRnTFQmmsgtAl5FjOWGlZrAxBItq3
	6IqxHhggIlv55N14ge3PaxJ/0ffz/80=
X-Google-Smtp-Source: APiQypLQ6iQ9UvWnwS1RtRgqy8hJd+ZUCY2bvTrwL9bTe5eSCEDv7bzFZiHh9DFPoZKKzhnEhIc/8Q==
X-Received: by 2002:a05:651c:22e:: with SMTP id z14mr493129ljn.64.1586200909918;
        Mon, 06 Apr 2020 12:21:49 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id r23sm10633870ljh.34.2020.04.06.12.21.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 06 Apr 2020 12:21:49 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH] u-boot: support merging .cfg files for UBOOT_CONFIG
Date: Mon,  6 Apr 2020 21:22:16 +0200
Message-Id: <20200406192216.23434-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

U-boot recipe supports .cfg files in SRC_URI, but they would be merged
to .config during do_configure only when UBOOT_MACHINE is set, we
should also support merging .cfg files for UBOOT_CONFIG.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 188e5295cf..9126fafe0b 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -77,7 +77,21 @@ def find_cfgs(d):
     return sources_list
 
 do_configure () {
-    if [ -z "${UBOOT_CONFIG}" ]; then
+    if [ -n "${UBOOT_CONFIG}" ]; then
+        unset i j
+        for config in ${UBOOT_MACHINE}; do
+            i=$(expr $i + 1);
+            for type in ${UBOOT_CONFIG}; do
+                j=$(expr $j + 1);
+                if [ $j -eq $i ]; then
+                    KCONFIG_CONFIG=${S}/configs/${config%_*}_defconfig merge_config.sh -m ${S}/configs/${config%_*}_defconfig ${@" ".join(find_cfgs(d))}
+                    oe_runmake -C ${S} O=${B}/${config} ${config}
+                fi
+            done
+            unset  j
+        done
+        unset  i
+    else
         if [ -n "${UBOOT_MACHINE}" ]; then
             oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
         else
@@ -114,7 +128,6 @@ do_compile () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    oe_runmake -C ${S} O=${B}/${config} ${config}
                     oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
                     for binary in ${UBOOT_BINARIES}; do
                         k=$(expr $k + 1);
-- 
2.26.0

