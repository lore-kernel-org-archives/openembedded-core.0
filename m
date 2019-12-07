Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E961E7C89C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 18:40:56 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x13so4072853plr.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2019 10:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8f3wOXpic+9ezHoa627DES1kdu7hPp45PEJWdQz2zAA=;
	b=sBMZCg/79RBhlM3OIjtETiHxThaKR4CkBzeuP4wOSz+4owx/Gwy0+f81uoXE63G9Hq
	qOZFNV820RvJ8le3G1b/K9N2XJIm1jksZD00huNr8l9R1ZGUNMgmpwrZ6zEVd94VLf4R
	2O784iHawYCCWs5ehoODjiKBWDvFRKe/g8T6xScLUWXskTDcqLx6cp1BuWMz3XdcwsNM
	iEQZLuTlKScBKSwhJTVYg1XIfMnwbo0kRCz7dd/AehKON3UaXuNMMgxC+UlRXMI66ylj
	Eln8HPkzmPz+2mTLKc0V4f9oc6uF19baIJKdGYGd4EcPu6KxwcB5uf+u331Q04p2+AfL
	f+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8f3wOXpic+9ezHoa627DES1kdu7hPp45PEJWdQz2zAA=;
	b=j9/bpBVE7cP2RvjHe++JsVvGynVoMgI+1l6Y7ixI9ILZJmnjqPEiZepHUNo9fQAyIJ
	mbicEtrrFScOzc+7aPk41OtF4eap8d19yXMQ5BBG7dOjOTQdaArx+ph28Y3iu1SuG5Hp
	Ar88n6cse34MMVf3F2cAmEpkQ8S8th6LMOFZCOtnFOBkeJtqmf//Dt4MrGJLClFaFrFM
	LRxt8gubctlOqTP56oDKudawx2D9DdOE996xP119pFtq9I/WoD05cIlEHaO0DQJqDpwB
	IUXs9txcTDofpTQ3SYRHvfK4LS9asMPt7gdgM/2oeN/RgpRbnn3tg7M0SCpG7O4O7qFT
	q0uA==
X-Gm-Message-State: APjAAAXb+MvIQLH0RH/DqTr/Rw5vs7qE6T+llgvRUT0O4WAxkHHMedFj
	XJTdevxnJiC8ugKHR+PJQegSxce/o0k=
X-Google-Smtp-Source: APXvYqzYBz41bbjV/XTxWR4yySmC2Q7aWauW0x01thI8wanZnAHfy0n6W8GWURb7bVtEQOHb3b/5Nw==
X-Received: by 2002:a17:902:5a04:: with SMTP id
	q4mr8269844pli.302.1575744056341; 
	Sat, 07 Dec 2019 10:40:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	b73sm22129519pfb.72.2019.12.07.10.40.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 10:40:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2019 10:40:42 -0800
Message-Id: <20191207184042.3826637-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207184042.3826637-1-raj.khem@gmail.com>
References: <20191207184042.3826637-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sysklogd: Fix 2.0.3 upgrade fallouts on musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Dec 2019 18:40:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-Remove-__BEGIN_DECLS-__END_DECLS.patch | 44 +++++++++++++++++++
 .../0002-include-sys-types.h-for-off_t.patch  | 29 ++++++++++++
 meta/recipes-extended/sysklogd/sysklogd.inc   |  2 +
 3 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-Remove-__BEGIN_DECLS-__END_DECLS.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0002-include-sys-types.h-for-off_t.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-Remove-__BEGIN_DECLS-__END_DECLS.patch b/meta/recipes-extended/sysklogd/files/0001-Remove-__BEGIN_DECLS-__END_DECLS.patch
new file mode 100644
index 0000000000..b2d45c0a0a
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-Remove-__BEGIN_DECLS-__END_DECLS.patch
@@ -0,0 +1,44 @@
+From 8c7995ac8da99eed55bf5410c558b1f0a74998d0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Dec 2019 10:27:28 -0800
+Subject: [PATCH 1/2] Remove __BEGIN_DECLS/__END_DECLS
+
+The __BEGIN_DECLS and __END_DECLS are internal identifiers in glibc and
+are not defined in any standard. Using them fails build on musl
+libc, its better to avoid them
+
+Upstream-Status: Submitted [https://github.com/troglobit/sysklogd/pull/10]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/syslog.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/syslog.h b/src/syslog.h
+index 4fb7627..120a18f 100644
+--- a/src/syslog.h
++++ b/src/syslog.h
+@@ -221,7 +221,9 @@ struct syslog_data {
+     .log_mask = 0xff, \
+ }
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ void	openlog    (const char *, int, int);
+ void	closelog   (void);
+ 
+@@ -245,7 +247,9 @@ void	syslogp_r  (int, struct syslog_data *, const char *, const char *,
+ 		    const char *, ...);
+ void	vsyslogp_r (int, struct syslog_data *, const char *, const char *,
+ 		    const char *, va_list);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #else /* !__KERNEL__ */
+ 
+-- 
+2.24.0
+
diff --git a/meta/recipes-extended/sysklogd/files/0002-include-sys-types.h-for-off_t.patch b/meta/recipes-extended/sysklogd/files/0002-include-sys-types.h-for-off_t.patch
new file mode 100644
index 0000000000..799a7a4c4c
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0002-include-sys-types.h-for-off_t.patch
@@ -0,0 +1,29 @@
+From 10cff4ba2d09b30f8f1967f910e8ab08447a8add Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Dec 2019 10:31:04 -0800
+Subject: [PATCH 2/2] include sys/types.h for off_t
+
+Fixes
+error: unknown type name 'off_t'
+
+Upstream-Status: Submitted [https://github.com/troglobit/sysklogd/pull/10]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/compat.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/compat.h b/src/compat.h
+index a867636..1ef1bf0 100644
+--- a/src/compat.h
++++ b/src/compat.h
+@@ -34,6 +34,7 @@
+ #include <pthread.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/types.h>
+ 
+ /*
+  * The following macro is used to remove const cast-away warnings
+-- 
+2.24.0
+
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index b90911af2b..07edf40326 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -14,6 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
+           file://0001-Remove-__BEGIN_DECLS-__END_DECLS.patch \
+           file://0002-include-sys-types.h-for-off_t.patch \
            file://sysklogd \
            "
 S = "${WORKDIR}/git"
-- 
2.24.0


