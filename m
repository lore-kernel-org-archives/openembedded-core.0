Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.1354.1585676813224997111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 10:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id l25so23998531qki.7
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 10:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=XKACpooL5KeCzPZtnFdDwgRvNN62rPBgeBAMlXx2OZo=;
        b=ZbgRtzPEl2JFlVpgW/DAnqOGRbh+XNrm4b+XCb0nnKTuLf3drDnivpYGOkrg7f/pVP
         973EFv+cVMA96+tLufFYqBkvFW4fblMXfCCSss1/oS9px25GHXwtO5Nc4nUY8xbEWmx5
         Z2cZKH0Nj6iRpy6cCtM0GpS6i+ykZy3Zz8vK5GVqWpruno58/m5QKACGC8uJOPXRV4nY
         Gx8eaxgnv2nYVp3zQLkTQO5ccWP6B5StqRlquta65QjTjnIiC20wLGj5hZDaqhqQIiff
         sejb/IteTky7x5WkqgZSKuC3O+tDaYQIUNXcJzN1HqTZnZFfNbhTip7AXwF+bYiNQ8GS
         bv8w==
X-Gm-Message-State: ANhLgQ3JVszhiCUHMwDAnEm3N3EwUf8LBPBjE05BPdGwrsky0z8Sm6zl
	J+gESXADGHzGB+npUZSbWt7AMMGaDqU=
X-Google-Smtp-Source: ADFU+vvtWxfsE4GcCqbvLaFxXOAkOAgsQjcD1au0HpXsD0SFtaj+JZGGf55oGL6+KR2INJk1AgNanA==
X-Received: by 2002:a37:9b16:: with SMTP id d22mr6130953qke.318.1585676811959;
        Tue, 31 Mar 2020 10:46:51 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.114.167])
        by smtp.gmail.com with ESMTPSA id t6sm13405005qkd.60.2020.03.31.10.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 10:46:51 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Tom Rini <trini@konsulko.com>,
	Stefano Babic <sbabic@denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Add UBOOT_LOCALVERSION_AUTO support
Date: Tue, 31 Mar 2020 14:46:41 -0300
Message-Id: <20200331174641.1094071-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Add the Git revision used for the build. It is very useful especially when
using custom or vendor U-Boot forks so we can map a binary to a specific
source revision. Valid values are "0" or "1".

This is based on a class which has been in use in `meta-freescale` BSP
for years and has been very useful especially for custom U-Boot releases
as it allow we to know the exact Git revision used for the binary.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/u-boot/u-boot.inc | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b13db224732..39d35500e11 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -24,6 +24,11 @@ PACKAGECONFIG[openssl] = ",,openssl-native"
 # file already exists it will not be overwritten.
 UBOOT_LOCALVERSION ?= ""
 
+# Add the Git revision used for the build. It is very useful especially when
+# using custom or vendor U-Boot forks so we can map a binary to a specific
+# source revision. Valid values are "0" or "1".
+UBOOT_LOCALVERSION_AUTO ?= "0"
+
 # Some versions of u-boot use .bin and others use .img.  By default use .bin
 # but enable individual recipes to change this value.
 UBOOT_SUFFIX ??= "bin"
@@ -84,6 +89,19 @@ do_configure () {
             oe_runmake -C ${S} O=${B} oldconfig
         fi
         merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
+
+        if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
+            if [ "${UBOOT_LOCALVERSION_AUTO}" = "1" ]; then
+                # Add GIT revision to the local version
+                head=`cd ${S} ; git rev-parse --verify --short HEAD 2> /dev/null`
+                printf "%s%s%s" "${UBOOT_LOCALVERSION}" +g $head > ${S}/.scmversion
+                printf "%s%s%s" "${UBOOT_LOCALVERSION}" +g $head > ${B}/.scmversion
+            else
+                printf "%s" "${UBOOT_LOCALVERSION}" > ${S}/.scmversion
+                printf "%s" "${UBOOT_LOCALVERSION}" > ${B}/.scmversion
+            fi
+        fi
+
         cml1_do_configure
     else
         DEVTOOL_DISABLE_MENUCONFIG=true
@@ -99,12 +117,6 @@ do_compile () {
 	unset CFLAGS
 	unset CPPFLAGS
 
-	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-	then
-		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
-		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
-	fi
-
     if [ -n "${UBOOT_CONFIG}" ]
     then
         unset i j k
-- 
2.26.0

