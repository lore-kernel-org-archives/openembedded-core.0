Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.9710.1616277000906674764
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WjEGOZSX;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id v186so6083101pgv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 14:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7H1LSOnooHmOLSIEmk5BXYC8dL9+GV9BoXfgrzNzRQI=;
        b=WjEGOZSXDyxtxBzBMuz5IBT1bNRWAdNLfSBRLG4GEJ13WfXaxNKuuKemdizOIIhtnj
         OMG70nVioa/zpqZiggTrx5VRaiYr3loxcdgcQt7b2BzOpMeWsMnKN8WBXBM82dkGt6ip
         jGhgvrbS/7Xo0m+/TlMnNm0791SmsUktZxqKFOKjZgxFSC/ce7U8KSNBEgXqTPbbZYeK
         BTjKQ+7I+zDzdWMvbdnqj9iM5heHAwQ/RmJgLSCn9Khy1uvHfyjOX/aS2YKEauJ5GQKs
         VFXB1t5+YRZXFnPCJtRigOzlCg6/Rplsx/l0iomFMbKuh43plJL8GDiC7CXC3Pa80JKr
         s4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7H1LSOnooHmOLSIEmk5BXYC8dL9+GV9BoXfgrzNzRQI=;
        b=dKTFyjIGCrpbYVVBen6vlP+St/UDxTMBZL0Ctl1flrnRiqPLH/7JUhSddDqbgm0doW
         bTpjBq9blmCPXVIogdi89yzZBdLza4YFAT38L+WsRA1GxVyQJWR/lPZOsl4qhDdWMc8d
         kRqWah2OU0MRdT11K9ZoS7aahA5hkR4hZPd+Bfa7UG6cb9CgwtVw7X/gvo+ZeBXHHRoP
         zuCPqKh5JQNtYZUVlqYJ+yCOEm8pY80TaKC/NpHEOObxC79rCEDYXykpEeS+UOhdCrNx
         zCapLmR1mf1lmxHDQ61rHJhxMM/OgWCbRCXVRP1k+xMk0rfOo8jrIx2C5H1dUpMLDP1L
         EZ5g==
X-Gm-Message-State: AOAM533NRt7wWrwdl95DIpXe+5t1VP7KpLg2IWWbLUD14mZsfphpSO22
	H8YM/LmBJNb7+zd5Bhelr18H1CCu38bNng==
X-Google-Smtp-Source: ABdhPJxM3+7/Jpg0UMwn+pu6Q2Ux2pew09sxI66Z1uGrMRbaQul1XkMs5sPUaCjeoQCwu3QOFrvEeg==
X-Received: by 2002:a65:640d:: with SMTP id a13mr450587pgv.272.1616277000269;
        Sat, 20 Mar 2021 14:50:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id q25sm9212316pfh.34.2021.03.20.14.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:49:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2 2/3] apt: Support old resolver as fallback
Date: Sat, 20 Mar 2021 14:49:55 -0700
Message-Id: <20210320214956.2477142-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210320214956.2477142-1-raj.khem@gmail.com>
References: <20210320214956.2477142-1-raj.khem@gmail.com>
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

