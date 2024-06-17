Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED066C41513
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.54577.1718625937725962990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z92arfrr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-704189f1225so3786429b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625937; x=1719230737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKFl5Z5a8iTPNO9ej9L1o48yVxPbDIkfIbgEFMxt5X4=;
        b=z92arfrrqpG3FqUi3MOpwEPyxIv8vDpYSr443P/FUztwwjVFf5AvjJ6WdKEcA+iv2J
         azdze+CvYiCUo6AJszAJ0+7Stm1N3CPmR2hs29kr9xz41+GOpYJ/466ry+si3NperFlr
         +CdSpKPDPEqQhCo3DAvK2d62m38DH2GaKwGwzdY+1zXOy5zQIpG6x2buY/MRcEryJxr3
         ZqpOwSzZB3jybYv6SLuKJYyVfhsfAKWQYuwusiaOobmewH27yqzxz5HWjj5fdIF+x6Z4
         nxKiIsNAa1rprLDyi0POZ4h40pMJnnl6XmHAp1rPCDn5iKoQ1AS2sFDKiqFEZhvJGk2k
         Ec1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625937; x=1719230737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKFl5Z5a8iTPNO9ej9L1o48yVxPbDIkfIbgEFMxt5X4=;
        b=mgTejVYGldbOfSZC5hCwW/rRw1zcEONhNdxfR4h6SRmjnKC//ngSCZT/JXXEzSv6Qi
         iqy9JqP29zcBMmfUiwQu1YDhfehEDJZV4XasERYub2Ho2Uv0cCm8chNy2DzLjQLP6SqB
         2AXyi1VwQCp3v90gww5zjx87IuJrPQQX/fot9cx/ipGs+jidvUaR/jv4DwElVVIvSWL7
         WTmoOqKB6tUNi66WCvTP5V4u5i63JPYRykoAGBh0wpD3UmRG3lFJr/+fG7NUtsEHMgjd
         We391X7ZsbT7scp4g0eqUv/ZsLZioiPZJ7sxklT7jxLyRLOHxv57VYMmLeNL8Ngkz+U1
         5sew==
X-Gm-Message-State: AOJu0YyqZkZxphot3Gbjvjoy+viaKAD7SSMX/7xZTEw4CsQn+DdaOWQY
	2SLRszP4uBOcHrvEu+JkA/r5XC8Jyafa+2reY0RZokrHCfqedSG8RSy79kPlvqSjQl62HzzetHH
	01Xc=
X-Google-Smtp-Source: AGHT+IGimgGsSuILY6YTAE+MFFpka6o5QSEgBJP/bMrN+QF8rOR0cOWbrE7Em8DlNydK1hV+y5jgNA==
X-Received: by 2002:a05:6a00:2da1:b0:6f6:7a1a:5b8c with SMTP id d2e1a72fcca58-705d711fa5dmr12030564b3a.18.1718625936875;
        Mon, 17 Jun 2024 05:05:36 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/22] cdrtools-native: Fix build with GCC 14
Date: Mon, 17 Jun 2024 05:04:44 -0700
Message-Id: <748d5f637f5aff3bc110b156cc3cb8e008f284c9.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200817

From: Zoltan Boszormenyi <zboszor@gmail.com>

Add a patch to fix do_configure with GCC 14.
Disable building cdda2wav because it doesn't build with GCC 14.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fbe1766abb00edeb8ec9a0c8bdb4e723be4f352)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cdrtools/cdrtools-native_3.01.bb                |  6 +++++-
 .../cdrtools/cdrtools/gcc14-fix.patch               | 13 +++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index bf8be1ad0c..b9cb59032a 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -13,7 +13,8 @@ DEPENDS += "gnu-config-native"
 SRC_URI = " \
 	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${PV}.tar.bz2 \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
-        file://riscv64-linux-gcc.rul \
+	file://riscv64-linux-gcc.rul \
+	file://gcc14-fix.patch \
 	"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
@@ -27,6 +28,9 @@ export ac_cv_prog_CC = "${CC}"
 inherit native
 
 do_configure() {
+        # cdda2wav does not build with GCC 14
+        rm -f ${S}/TARGETS/55cdda2wav
+
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/autoconf
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/autoconf
         install -m 0644 ${WORKDIR}/riscv64-linux-gcc.rul ${S}/RULES/
diff --git a/meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch b/meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch
new file mode 100644
index 0000000000..ce02bb8bcf
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch
@@ -0,0 +1,13 @@
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Inappropriate [native]
+--- cdrtools-3.01/autoconf/configure~	2015-07-06 23:41:27.000000000 +0200
++++ cdrtools-3.01/autoconf/configure	2024-05-01 09:37:40.897253690 +0200
+@@ -1205,7 +1205,7 @@
+ #line 1206 "configure"
+ #include "confdefs.h"
+ 
+-main(){return(0);}
++int main(){return(0);}
+ EOF
+ if { (eval echo configure:1211: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
-- 
2.34.1


