Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.1160.1617290934599838520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=v8D8Cgbt;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id w70so2194072oie.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yHMM5XLq5h+aztNJCpl5Gqvct688rIwANAZmnMVXD+4=;
        b=v8D8Cgbtj/ej7BJP587EsoTaajw4AW2dFXKNVdiXrbUpqJjZlO/90A6iljREXXIdqi
         3yWuV9DAh4GAhjoOmW1kTDjmu+dJ8zJJgNeZ1lAD9PgOYJWfBbVSvyd1XD7OU7Dz5fI3
         f2V1764j9ANywcUdb3/sTBJ7X2/LDZx+sjRFma2HG4CdSAAOhIMa4VvpJVOpRDajC5hd
         CDmsDFsVEVZq9gys1ZFEf4LFkXjUfziHo1F2Tv20F+4s99Ubo7zBsb38ltZySbKnEaRe
         dXv4Od9SnwsF0c7MgUj1JTeaYDHOwn92Jlq/GqNA3RMqTlx+alL9oibXFIc8e/adZlGZ
         BZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yHMM5XLq5h+aztNJCpl5Gqvct688rIwANAZmnMVXD+4=;
        b=XwI57VsDPluMvIrAK5w+70v95r3wPDV9MA2cLeuWPoZJ6+1pJGdNwhKclvsEGqcvzl
         6YPquYFnq9LiqASxpiIDhLRCcsS9kIGSZetHUc4CjloSslP1Ko8WqWReXMVCLcwI4G/T
         qO5dnHVqkLCMNlQTTD58ppTMOmXyokcM5GnowZYT35SBRd6wrnRASMZU0Tx6cbtuK7i4
         Ufi9P9eYLfakHJQuSoxu3KZopaASyNSG2cO9N3cQNrqGr1m23wJOe05WNDR036AwMQ4J
         tOZfpdj4d0mSZn7c6l84aM9PLIO5gZcunL2mKYuVEuUVVUvo3ENFyxMpqwE73xe+Ft+h
         ENfQ==
X-Gm-Message-State: AOAM530CnO9tpWFXmpCiLF9VeFnzfPpnq3FJeaEF4GGrxcNvix4FOele
	aE7bZKge41dyawaOi/2KyrDDlRyl1S/RFxqoYqo=
X-Google-Smtp-Source: ABdhPJxG6IA+ytiiuybYHYmyii6UXo+U9OayUuiL7zrgtGHoYFnnR26RZbMU3Mtac4HYux5vIHPXWQ==
X-Received: by 2002:aca:ab53:: with SMTP id u80mr6340967oie.77.1617290933493;
        Thu, 01 Apr 2021 08:28:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.28.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:28:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/15] cryptodev-module: fix build failure with kernel v5.10
Date: Thu,  1 Apr 2021 05:27:36 -1000
Message-Id: <cd247306566313517b69b4ae321476b8ea9ab46f.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naveen Saini <naveen.kumar.saini@intel.com>

zc.c:77:8: error: too many arguments to function 'get_user_pages_remote'
|    77 |  ret = get_user_pages_remote(task, mm,
|       |        ^~~~~~~~~~~~~~~~~~~~~

Backported patch to fix it.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cryptodev/cryptodev-module_1.10.bb        |  1 +
 .../0001-Fix-build-for-Linux-5.9-rc1.patch    | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
index 6474599c45..e4f7d1e372 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
@@ -10,6 +10,7 @@ DEPENDS += "cryptodev-linux"
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
 file://0001-Fix-build-for-Linux-5.8-rc1.patch \
+file://0001-Fix-build-for-Linux-5.9-rc1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch
new file mode 100644
index 0000000000..cf1c04df9e
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch
@@ -0,0 +1,42 @@
+From 2f5e08aebf9229599aae7f25db752f74221cd71d Mon Sep 17 00:00:00 2001
+From: Joan Bruguera <joanbrugueram@gmail.com>
+Date: Fri, 14 Aug 2020 00:13:38 +0200
+Subject: [PATCH] Fix build for Linux 5.9-rc1
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=64019a2e467a288a16b65ab55ddcbf58c1b00187
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bce617edecada007aee8610fbe2c14d10b8de2f6
+          https://lore.kernel.org/lkml/CAHk-=wj_V2Tps2QrMn20_W0OJF9xqNh52XSGA42s-ZJ8Y+GyKw@mail.gmail.com/
+
+Signed-off-by: Joan Bruguera <joanbrugueram@gmail.com>
+
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/2f5e08aebf9229599aae7f25db752f74221cd71d]
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+
+---
+ zc.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/zc.c b/zc.c
+index a560db5..fdf7da1 100644
+--- a/zc.c
++++ b/zc.c
+@@ -76,10 +76,14 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 	ret = get_user_pages_remote(task, mm,
+ 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL);
+-#else
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 9, 0))
+ 	ret = get_user_pages_remote(task, mm,
+ 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL, NULL);
++#else
++	ret = get_user_pages_remote(mm,
++			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
++			pg, NULL, NULL);
+ #endif
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
+ 	up_read(&mm->mmap_sem);
+-- 
+2.17.1
+
-- 
2.25.1

