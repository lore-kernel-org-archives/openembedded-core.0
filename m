Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.20740.1599740706051203615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xr4k9Wpn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id z4so6501251wrr.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OJ1lTMnxhyuzNsg2CJzZBFuZ0IsmsjZBVtPVqWZlg70=;
        b=Xr4k9WpnjOTpuIWlxzrB36GY67JjscaFU+gpztKDDhLQa4vKRnNdP30nYwrPoyCjpc
         hPrDObarBpqMAnC/VsVmdTF4wjJ2eRKRr5Il2ekAuF216zHTfusMnXBYrNglXKyDKt6u
         MwnZ+EyKzqq9DnPqUfz+RXf4X8J3Crs1sWAGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJ1lTMnxhyuzNsg2CJzZBFuZ0IsmsjZBVtPVqWZlg70=;
        b=GZI+mYtr0+ZZPRUTPAERiRDh06lgXEPO3b02zOZZe1Myy25EM9+XWjxMajv+Ezkzat
         w1sR8PXREz1125X1yvTacfpUWxa2t83FBfM7Ip64GuO6jr7k8qnHU5PmBaV6Uron3oFv
         C++3gp9QasBdVjamhjr49NXLoX1IUv3sNNxvTSktWJCi/ij+v4hjOlJLAUPNYBkfDk0N
         cElOkC+fGxXQ4zBQQKKvLAekiPghm6TOIWNSmQMRR6nZsms49qH/c909qTeo3ZHsDTBz
         AX0+TSpLmB1cf05IRrmgw/KKqCAbJpufPn1nKHdWyNu1R5/lsSdGc2YcUhcRi43wYnGI
         nfaQ==
X-Gm-Message-State: AOAM533oZxLILExfJPaChn/CBhJsdmpGlLaJBk/mISFTo9ot4nkyPwkX
	EmLDRQlkpeXYCiAMMrPB/ImABg2OdK8Kug==
X-Google-Smtp-Source: ABdhPJyEE/1c64CchEXnAVmcvBy4cYKE200NflYNnc5osebPKH9hlqf2f3b1dT6A+OBz1dmJ3i9AuA==
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr8579389wrt.267.1599740704183;
        Thu, 10 Sep 2020 05:25:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:25:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jaewon Lee <jaewon.lee@xilinx.com>,
	Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Subject: [PATCH][thud 28/29] Adding back wrapper and using OEPYTHON3HOME variable for python3
Date: Thu, 10 Sep 2020 13:24:32 +0100
Message-Id: <20200910122433.2040293-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jaewon Lee <jaewon.lee@xilinx.com>

Adding back the python wrapper and adding a patch to use OEPYTHON3HOME
instead of PYTHONHOME if set, for python3.

If we add back the wrapper as is, we would see the following error that
we also see in Thud:

ImportError: No module named site
OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python
v3.
Please upgrade your python v2

This is because python3 would've set PYTHONHOME to use nativesdk
python3 libraries but when the oe-buildenv-internal script tries to call
python2 for the py_v27_check, there will be no python2 libraries in the
PYTHONHOME directory.
In other words, bitbake needs host python2 and the env variable set from
the wrapper contaminates the env and host python2 won't be able to find
its libraries

Creating another variable OEPYTHON3HOME and using this in the python3
wrapper to allow for a way to set a different paths for python3 and
python2

[YOCTO #13208]

(From OE-Core rev: 75d2a85e24ef9a2bf0e218521944523f0ff281e0)

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ON3HOME-is-set-use-instead-of-PYTHON.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb |  6 +++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch

diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
new file mode 100644
index 00000000000..48d4f73e9c6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
@@ -0,0 +1,35 @@
+From ffe7797637f08cd6ee4c82e2d67462c5e194d30a Mon Sep 17 00:00:00 2001
+From: Jaewon Lee <jaewon.lee@xilinx.com>
+Date: Thu, 25 Apr 2019 15:34:26 -0700
+Subject: [PATCH] main.c: if OEPYTHON3HOME is set use instead of PYTHONHOME
+
+There is one variable PYTHONHOME to determine where libraries are coming
+from for both python2 and python3. This becomes an issue if only one has
+libraries in the specified PYTHONHOME path, but they are using the same
+PYTHONHOME. Creating another variable OEPYTHON3HOME to allow for a way
+to set a different path for python3
+
+Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
+RP: Backported to 3.5.6 (code totally different to original path for 
+later python versions)
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+---
+ Modules/main.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+Index: Python-3.5.6/Python/pylifecycle.c
+===================================================================
+--- Python-3.5.6.orig/Python/pylifecycle.c
++++ Python-3.5.6/Python/pylifecycle.c
+@@ -864,7 +864,9 @@ Py_GetPythonHome(void)
+ {
+     wchar_t *home = default_home;
+     if (home == NULL && !Py_IgnoreEnvironmentFlag) {
+-        char* chome = Py_GETENV("PYTHONHOME");
++        char* chome = Py_GETENV("OEPYTHON3HOME");
++        if (!chome)
++            chome = Py_GETENV("PYTHONHOME");
+         if (chome) {
+             size_t size = Py_ARRAY_LENGTH(env_home);
+             size_t r = mbstowcs(env_home, chome, size);
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index b2f8a3d034f..4633a3d239e 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -50,6 +50,10 @@ SRC_URI += "\
             file://CVE-2019-9636.patch \
            "
 
+SRC_URI_append_class-nativesdk = " \
+           file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
+           "
+
 inherit multilib_header python3native update-alternatives qemu ptest
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
@@ -184,7 +188,7 @@ do_install() {
 }
 
 do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} OEPYTHON3HOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 SSTATE_SCAN_FILES += "Makefile"
-- 
2.25.1

