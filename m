Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.9434.1616275770722967891
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rvP84FO2;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id y200so8332858pfb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 14:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7H1LSOnooHmOLSIEmk5BXYC8dL9+GV9BoXfgrzNzRQI=;
        b=rvP84FO2UNSnww6+MtuDoUiX6uuj5ZasKurYX6ilrCBvPNUCXe9ObS98V2iqEVCbeu
         YOl/Y9KUQu0JzC+9PWz+u5oeFWjNH6awSiV/IPjoBBrbvsD5vWDEqwEfPDAelERmRZPf
         bAWsj+U2k4BPKdM+i37zdAxFnbquw1t96DqqjB4szqnrYGA3nEtCwKSr+s6Z5vMjOkOW
         OaMAsELjrwTZFxwlTTkA7Xdg7c8ASKV8v7OdxjNGoQsbogDl1CmNoR0MbT0hQw9qsS/m
         xDO1dWX27JljOF1gTbqcT90b2eUDzap3B7xIGeOWGVV37le3vh+2W9rkJ7e4gqMs9JN+
         N+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7H1LSOnooHmOLSIEmk5BXYC8dL9+GV9BoXfgrzNzRQI=;
        b=MZckDeTf0x2Hh4ELC/XrtVyed3L7tah8pCB2HGknPeziC2CCmBZJRmQDpfL/tnZGrj
         Iz2ldzle/HU17GAO5NRPkCVTvsBJ3Q2REzTzZYbE9xX2pHLk/DUQNoO6e/SpHLR9HkIc
         b4HkVPo3UH/GJDYxhEhnRHEkbOddOPmwAXisMpjOpOPH21+cZDC7zTPbVunlea+Uw3QL
         AL8yD3BMOykMV3YmSFm8nwftT1VC/bDcY7x0Xi89kMZr78dDdkJtd9k2bDbRFM647jzZ
         vtTSti/YQvPZ2I16IwSyMZ8QRueztfQXR3v2Zze9eoHdFQQztjsgel2PXYft3DJYQY2Z
         6kcQ==
X-Gm-Message-State: AOAM533Qf3spNB7w/jutu325wQxxVXTytrcFtLrrQpG6XCrdTprMNbGp
	Zm5K3AFZ3EFBVpgZTio492vrzNHFQCN8aA==
X-Google-Smtp-Source: ABdhPJxAm2+sCIcm7UAaRs6QLg7k77kQJJN6PkvejiG7i3Y2DOZdQlaIxM/RbXCLT9OKXc+6xyiFLw==
X-Received: by 2002:a63:c601:: with SMTP id w1mr16179570pgg.11.1616275769965;
        Sat, 20 Mar 2021 14:29:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id t12sm8592407pga.85.2021.03.20.14.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:29:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] apt: Support old resolver as fallback
Date: Sat, 20 Mar 2021 14:29:26 -0700
Message-Id: <20210320212926.2465567-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all C libraries implement the new resolver APIs e.g. musl, therefore
keep the old interfaces around and choose using __RES version macro
which is meant for this kind of work.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...vrec-Keep-support-for-older-resolver.patch | 44 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.2.2.bb        |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch b/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch
new file mode 100644
index 0000000000..94d67a87ac
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch
@@ -0,0 +1,44 @@
+From f98c12b9f04ef3a9daec822c210044095b41a0ac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 Mar 2021 12:33:34 -0700
+Subject: [PATCH] srvrec: Keep support for older resolver
+
+Some C libraries e.g. musl do not implement the new res_n* APIs
+therefore keep the old implementation as fallback and check __RES
+version macro to determine the API level
+
+Upstream-Status: Submitted [https://github.com/Debian/apt/pull/129]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Julian Andres Klode <julian.klode@canonical.com>
+---
+ apt-pkg/contrib/srvrec.cc | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/apt-pkg/contrib/srvrec.cc b/apt-pkg/contrib/srvrec.cc
+index 4ca208273..3eb5f1d4c 100644
+--- a/apt-pkg/contrib/srvrec.cc
++++ b/apt-pkg/contrib/srvrec.cc
+@@ -62,6 +62,7 @@ bool GetSrvRecords(std::string name, std::vector<SrvRec> &Result)
+    unsigned char answer[PACKETSZ];
+    int answer_len, compressed_name_len;
+    int answer_count;
++#if __RES >= 19991006
+    struct __res_state res;
+ 
+    if (res_ninit(&res) != 0)
+@@ -71,6 +72,12 @@ bool GetSrvRecords(std::string name, std::vector<SrvRec> &Result)
+    std::shared_ptr<void> guard(&res, res_nclose);
+ 
+    answer_len = res_nquery(&res, name.c_str(), C_IN, T_SRV, answer, sizeof(answer));
++#else
++   if (res_init() != 0)
++      return _error->Errno("res_init", "Failed to init resolver");
++
++   answer_len = res_query(name.c_str(), C_IN, T_SRV, answer, sizeof(answer));
++#endif //__RES >= 19991006
+    if (answer_len == -1)
+       return false;
+    if (answer_len < (int)sizeof(HEADER))
+-- 
+2.31.0
+
diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
index b838495da8..7ee661d4c8 100644
--- a/meta/recipes-devtools/apt/apt_2.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
@@ -10,8 +10,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Disable-documentation-directory-altogether.patch \
            file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
+           file://0001-srvrec-Keep-support-for-older-resolver.patch \
            "
-     
+
 SRC_URI_append_class-native = " \
            file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
-- 
2.31.0

