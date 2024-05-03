Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7DAC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 10:26:47 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.9299.1714732001455870272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 03:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cvmcqxHF;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51bae805c56so10273827e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714732000; x=1715336800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ3kagYWkZWJa6hhv5AXLdJ0uAIIhb3ShlDJ3ch9NuA=;
        b=cvmcqxHF2+ROQ2vc41DVKUVAN1VxrLOEVf5TNEYzxVXGszsvF/EidVl5pSZ9Pasya8
         OZjGzIPpEyGc9YEqVMeVc+J/k+i3qNCle+fITUVKNJLYxPSB8OfYClz5gR4Qn70GIbVz
         h/ck9GsYD0t71mz8bbuhsOO6MW/dBVQi7naZ7s68Fi2Z+nm7rOvRF3cBTU9BInFDlO0N
         cP+dPYj9ArHFjuu/18UJNavIIywMwrP+AmI0zW1V2Bl5Ts/zc823hnSDQ8Yj9uRbpu+O
         1pG4yhYPZHmwvMrpzB1p/9aH4JSToOXXJEdLyc1dGPwCfS4hiAfQ/srLFavQkdBvq3tZ
         ipdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714732000; x=1715336800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJ3kagYWkZWJa6hhv5AXLdJ0uAIIhb3ShlDJ3ch9NuA=;
        b=EXKYW0mjZz3EFjGv+dYRoRsMVLiVUYd0hx2HRMAkGj/3otHDzvzsqqdCqBo7QmPAcA
         1wzDIeTkBGvfeoE4JvThipSrqFVQG9xhiA2nBupM7vnrslSFWx2+Kp0pEIRzhdm1zm7h
         fqmNSlmhu/nS+BfYEMpNpZwdv3ykbGGzhLZsebtk5dW8+Xe2DEJGD413VfyU8MCdX6fA
         IGi9r7xHaId9mKgpFgStykeXgLebdwaB4SrDOnuwGJOhKdsz56z6oHguEEarrVs87XXs
         LfmUqeSm3HGmEmAcLSw5K2Jg41GyLE0/FpLvbaKZzvH0hz/4sxMP387erry8/2Ezni40
         Rbuw==
X-Gm-Message-State: AOJu0Yx+In4YSWOShoAaoClFPFFuelLyMTUf8Er3YAylckApCWM1Q3KX
	JO9vjcxg6q3MbEvzxYxipS82c/ek6cjXK3vvhC7M9KznUimg2yUkvG5gPH5YhNP019QElrYRIAa
	iGZI=
X-Google-Smtp-Source: AGHT+IHY8sGvH3MMHCVtYPH+23zQwYlfTZ50YprUWVYdBrXW7hpGfp5IA3yW817vFRKOXwoP/AHoxw==
X-Received: by 2002:ac2:43bc:0:b0:51b:e46c:19fd with SMTP id t28-20020ac243bc000000b0051be46c19fdmr1424358lfl.18.1714731999631;
        Fri, 03 May 2024 03:26:39 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id j5-20020a056512108500b0051b29477815sm494425lfg.166.2024.05.03.03.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 03:26:38 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] openssl: fix pkg-config file libdir from /usr back to /usr/lib
Date: Fri,  3 May 2024 13:26:24 +0300
Message-Id: <20240503102624.594443-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198969

openssl update from 3.2.1 to 3.3.0 changed pkg-config generators
and libdir changed from /usr/lib to /lib. This breaks builds
of recipes which use openssl pkg-config files for library install
etc paths. For example meta-security tpm2-openssl fails to build:

ERROR: mc:trs-qemuarm64:tpm2-openssl-1.1.1-r0 do_package: QA Issue: tpm2-openssl: Files/directories were installed but not shipped in any package:
  /usr/ossl-modules/tpm2.so

Affected pkg-config files are: libssl.pc, openssl.pc and libcrypto.pc

Fix this by hard coding LIBDIR variable to "lib". Prefix should
be correctly used as before.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../openssl/openssl_pkg-config_libdir.patch   | 31 +++++++++++++++++++
 .../openssl/openssl_3.3.0.bb                  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.patch b/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.patch
new file mode 100644
index 0000000000..e3b4249a69
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.patch
@@ -0,0 +1,31 @@
+openssl: fix pkg-config file libdir from /usr back to /usr/lib
+
+openssl update from 3.2.1 to 3.3.0 changed pkg-config generators
+and libdir changed from /usr/lib to /lib. This breaks builds
+of recipes which use openssl pkg-config files for library install
+etc paths. For example meta-security tpm2-openssl fails to build:
+
+ERROR: mc:trs-qemuarm64:tpm2-openssl-1.1.1-r0 do_package: QA Issue: tpm2-openssl: Files/directories were installed but not shipped in any package:
+  /usr/ossl-modules/tpm2.so
+
+Affected pkg-config files are: libssl.pc, openssl.pc and libcrypto.pc
+
+Fix this by hard coding LIBDIR variable to "lib". Prefix should
+be correctly used as before.
+
+Upstream-Status: Inappropriate [configuration change]
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
+--- a/exporters/build.info
++++ b/exporters/build.info
+@@ -19,7 +19,7 @@ DEPEND[openssl.pc]=libcrypto.pc libssl.pc
+ DEPEND[""]=openssl.pc
+ 
+ GENERATE[../installdata.pm]=../util/mkinstallvars.pl \
+-    "PREFIX=$(INSTALLTOP)" BINDIR=bin "LIBDIR=$(LIBDIR)" \
++    "PREFIX=$(INSTALLTOP)" BINDIR=bin LIBDIR=lib \
+     INCLUDEDIR=include APPLINKDIR=include/openssl \
+     "ENGINESDIR=$(ENGINESDIR)" "MODULESDIR=$(MODULESDIR)" \
+     "PKGCONFIGDIR=$(PKGCONFIGDIR)" "CMAKECONFIGDIR=$(CMAKECONFIGDIR)" \
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
index 2cdaf4c75d..5ee8375ebc 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            file://bti.patch \
+           file://openssl_pkg-config_libdir.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


