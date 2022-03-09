Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299C6C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 06:48:04 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.3066.1646808483142510102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 22:48:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SpROoQ+3;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 fs4-20020a17090af28400b001bf5624c0aaso1511016pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 22:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lvCdLxTfj2Ucgpt3sap5jon0q0NDWTAUrbibFfmUE8Q=;
        b=SpROoQ+3ZVNAmiYGBCHS2FRIVyYvDAHE+80bXMWUe1uu7pOKg3jNfTfKrHj//HXRDa
         IFLfWbiFYwAbzYEBz7biV2dI62LiejKNy27/LS4VgdlXmXcuAs6H+2OSCq02PyxWAGGk
         j8s/zUhg29jDjlPwxi4C+e+UCczx5hZnj/rwObhu+2Y2vOBrRyQoDz+BMTJamlonWIG9
         o+Q6nJYknkSoWTb61DWjVGD6rmHrX7E25qcmPIGeamX2LwnqDq2O41l6OjtM1YVavO2Z
         ZE+mtmzsr0i99W8xECsuqOtGjpDOuSVod9mO5uhW+q2PYzNLrsVdLm8l7/RPPoUePJ7E
         l/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lvCdLxTfj2Ucgpt3sap5jon0q0NDWTAUrbibFfmUE8Q=;
        b=DI69XHtG2TfXoX8ezQXmjpu3EDWvQ8lfwvq4G8exiZUSOj2T1+6u1akWDK8fPcb0VD
         0BhQk35+GddjcFPUeE08Lp49SMbMy/jTqGo66aCtvu5G9ICgjE5S6DiLZtVW9Jvgety/
         lQfD8mMjCw4n+ebXxuWzyvniSIE6/112WvI4iIyDSzcv7bWKbblTcqDOdA8jz25cSLxx
         cIuBOBtJQT5sM2OoyKm46DyP7EHPM9+nQLBxVV5uGw8maHE4ptjxISKkFdwrznjL8RSW
         SqgaeC2w6LjVXwJwuEcQgaUhsen7XZHlE3LZSY2S9XfcSb5np/PNRnEzxElyNWAFixfw
         GQLg==
X-Gm-Message-State: AOAM530UwN6tjw5ncHp05tW3ldbv/Z5pcBypmRub31G7pQZUsKsVD4k3
	xjdenmwV6sZOc3WlFzg2j20cQYjCn6h8yA==
X-Google-Smtp-Source: 
 ABdhPJz/SBQCDY3UvX1y7+WyZVziiiU2VEaBfssn3Pc7EDy8JrlbbHMCoG8zSGimPsIdANs/76A+lQ==
X-Received: by 2002:a17:902:6b4a:b0:14d:474f:4904 with SMTP id
 g10-20020a1709026b4a00b0014d474f4904mr21424796plt.122.1646808482261;
        Tue, 08 Mar 2022 22:48:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a62830a000000b004f73c34f2e8sm1237053pfe.165.2022.03.08.22.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 22:48:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] zip: Pass ldflags to configure tests using linking
Date: Tue,  8 Mar 2022 22:47:58 -0800
Message-Id: <20220309064758.1716951-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220309064758.1716951-1-raj.khem@gmail.com>
References: <20220309064758.1716951-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 06:48:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162950

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...LAGS-and-LDFLAGS-when-doing-link-tes.patch | 88 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch
new file mode 100644
index 00000000000..475a653f287
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch
@@ -0,0 +1,88 @@
+From ab5df4826c4a532da78828b72a2751c899e27ef2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Mar 2022 22:31:21 -0800
+Subject: [PATCH] configure: Use CFLAGS and LDFLAGS when doing link tests
+
+Some case link flags contain important flags which are required during
+linking, link fails otherwise without them, which can result in
+configure detection go wrong, ensure these flags are used along with CC
+when tests involve linking
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix/configure | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 1bc698b..1d9a9bb 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -517,14 +517,14 @@ for func in rmdir strchr strrchr rename mktemp mktime mkstemp
+ do
+   echo Check for $func
+   echo "int main(){ $func(); return 0; }" > conftest.c
+-  $CC $BFLAG -o conftest conftest.c >/dev/null 2>/dev/null
++  $CC $CFLAGS $LDFLAGS $BFLAG -o conftest conftest.c >/dev/null 2>/dev/null
+   [ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNO_`echo $func | tr '[a-z]' '[A-Z]'`"
+ done
+ 
+ 
+ echo Check for memset
+ echo "int main(){ char k; memset(&k,0,0); return 0; }" > conftest.c
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ [ $? -ne 0 ] && CFLAGS="${CFLAGS} -DZMEM"
+ 
+ 
+@@ -533,7 +533,7 @@ cat > conftest.c << _EOF_
+ #include <string.h>
+ int main() { int a; int b = 0; memmove( &a, &b, sizeof( a)); return a; }
+ _EOF_
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ [ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNEED_MEMMOVE"
+ 
+ 
+@@ -542,7 +542,7 @@ cat > conftest.c << _EOF_
+ #include <string.h>
+ int main() { strerror( 0); return 0; }
+ _EOF_
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ [ $? -ne 0 ] && CFLAGS="${CFLAGS} -DNEED_STRERROR"
+ 
+ echo Check for errno declaration
+@@ -563,7 +563,7 @@ cat > conftest.c << _EOF_
+ int main() { return closedir(opendir(".")); }
+ _EOF_
+ 
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+   OPT=""
+   for lib in ndir dir ucb bsd BSD PW x dirent
+@@ -583,9 +583,9 @@ fi
+ 
+ echo Check for readlink
+ echo "int main(){ return readlink(); }" > conftest.c
+-$CC -o conftest conftest.c >/dev/null 2>/dev/null
++$CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+-  $CC -o conftest conftest.c -lseq >/dev/null 2>/dev/null
++  $CC $CFLAGS $LDFLAGS -o conftest conftest.c -lseq >/dev/null 2>/dev/null
+   [ $? -eq 0 ] && LFLAGS2="${LFLAGS2} -lseq"
+ fi
+ 
+@@ -661,7 +661,7 @@ elif [ -f /xenix ]; then
+ elif uname -X >/dev/null 2>/dev/null; then
+ # SCO shared library check
+   echo "int main() { return 0;}" > conftest.c
+-  $CC -o conftest conftest.c -lc_s -nointl >/dev/null 2> /dev/null
++  $CC $CFLAGS $LDFLAGS -o conftest conftest.c -lc_s -nointl >/dev/null 2> /dev/null
+   [ $? -eq 0 ] && LFLAGS2="-lc_s -nointl"
+ else
+   SYSTEM=`uname -s 2>/dev/null` || SYSTEM="unknown"
+-- 
+2.35.1
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 0547cd5c53a..07a67b96348 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://zipnote-crashes-with-segfault.patch \
            file://0001-configure-use-correct-CPP.patch \
            file://0002-configure-support-PIC-code-build.patch \
+           file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.35.1


