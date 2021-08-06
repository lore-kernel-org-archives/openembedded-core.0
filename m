Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.2466.1628240329627177853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 01:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CYMyHOqg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id h13so10145007wrp.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3aF9XPiInpF4X7OCi+N4Ebsx4U73VbQfGL3QkVU1KvE=;
        b=CYMyHOqgck1RO2mtcEumF9Q6iQXCgVpf9qxQlPiUI80jFwEusu+0Cl2Xq94fcB8OC+
         +8ukryRTuGF67s3tu6PwCxjqxMNmggTzjkVAh1KLxl424RAM7C7ovi9GjfYXLGDZw02K
         DDRpfVk1a8pdeQhcDFcEl4e7OdeZ2wb1Wut0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3aF9XPiInpF4X7OCi+N4Ebsx4U73VbQfGL3QkVU1KvE=;
        b=azcpFVqqqQt4NleQQsLY5GDNI/QxqSsqw47xCyfSTkizyPCBjRQ6lvd01YZK9gPdrf
         PpexomOmtcLNscJnlZ02TRQXKfkiJ/atKVKXCRYUFSZZSyDnjkjBoy2J5QuZLGBztg0W
         UGKOzGasxTLK7OkvvQDwsh5KzJH8CWxMvmLW0hJ5vrIq244KZP6Ohyzt7DXlQawfDPPV
         Fe6D0CplbNDoHHObVdv+h3eK9IWIjdn4S3tGKKTJrTWPSg4WCFXSyttZgtU/uqAOla7S
         /UCgf8llSBqJaCKplCd6fhzCmvCY0Tyil96GTrFHpGdNi04meG9QZIfKbujVWYVCHDT0
         Bg/A==
X-Gm-Message-State: AOAM5316DMUXBLYpGo86WWbN3w0/I8UDRffiMMgaWpI7efAWayB4lo8v
	Hobg0Sz6+MIrIVB1mbSYopLQbqIGMqKWRQ==
X-Google-Smtp-Source: ABdhPJwEVYP2tE7pLcVGCjCWep3GWp7HGc7ttwWR/+rOQ8FR202hc0EQo7kkcwpRunrjD+DgpNMAzg==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr9599086wrp.101.1628240327950;
        Fri, 06 Aug 2021 01:58:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id q17sm8775331wre.3.2021.08.06.01.58.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 01:58:47 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtool: Fix lto option passing for reproducible builds
Date: Fri,  6 Aug 2021 09:58:46 +0100
Message-Id: <20210806085846.3599565-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If lto is enabled, we need the prefix-map variables to be passed to the linker.
Add these to the list of options libtool passes through.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtool/libtool-2.4.6.inc                 |  1 +
 .../libtool/libtool/lto-prefix.patch          | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/lto-prefix.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index c1cbceb51fd..6748d7468e7 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-automake.patch \
+           file://lto-prefix.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/lto-prefix.patch b/meta/recipes-devtools/libtool/libtool/lto-prefix.patch
new file mode 100644
index 00000000000..2bd010b8e48
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/lto-prefix.patch
@@ -0,0 +1,22 @@
+If lto is enabled, we need the prefix-map variables to be passed to the linker.
+Add these to the list of options libtool passes through.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: libtool-2.4.6/build-aux/ltmain.in
+===================================================================
+--- libtool-2.4.6.orig/build-aux/ltmain.in
++++ libtool-2.4.6/build-aux/ltmain.in
+@@ -5424,9 +5424,10 @@ func_mode_link ()
+       # --sysroot=*          for sysroot support
+       # -O*, -g*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
+       # -stdlib=*            select c++ std lib with clang
++      # -f*-prefix-map*      needed for lto linking
+       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
+       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
+-      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*)
++      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-f*-prefix-map*)
+         func_quote_for_eval "$arg"
+ 	arg=$func_quote_for_eval_result
+         func_append compile_command " $arg"
-- 
2.30.2

