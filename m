Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 848C77FA15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so3634762wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BBsuo2hOJ4ehNpQfkTBCG0dp/KtfljJQKl0ESedWIwE=;
	b=Ry6nLT98CHivwWoM0IM1CKaXQOJVHT9+9Iz0ABEP/tr+eUBWI+Lkiqn+MqbQ5uJ9qM
	DKKJ6b12fnPqPbkxoKB2013POwDeMXZ/mbcg1R4twK9J8/oo0TR6pPr+f+opiQ/MUIIZ
	/uZSmtwqR/tZ6EHKUbbqcFkby+117tMl192U2EOYjlL+5CYSfYb21TzBUGZJJCDlfiSp
	zcDAVKB0B90qTHGaVnlqBbV3EI/8ul0rIkQ2JEcrLpq7pdtb5HsFbw7FeKSk2/dn1X53
	CareDhD7Xl+UcRYGUw3KU3Pv7wtxbAiIVZPksOmW8wRNIy02veKcHjW8WUqA12+ZhM0H
	B24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BBsuo2hOJ4ehNpQfkTBCG0dp/KtfljJQKl0ESedWIwE=;
	b=HVUBR+o1a4nwBYX9Q8VXZ+uwyXAAkyxIdD51a0Lm2vSnBWQ6kc4vt7H//ZcEDa8f/J
	/GyyrYjnXk5myATHnfRscz6w3Ks5BBRV1bnhHzpPVmAflN3ZjtqHocawzSAJeMp3UkXa
	iieWF8pOFLxZEjARFUNdanVN9iWF+b+aThBrMhZOY2cQuKmWklfbjRsCAWFP95ndX+0p
	rM58aI0rJj/N7Ts+xeD8/FtO6EsHKZjMrd0d6wkm2USCLIxXll3haZoWJFWJcaUwtrC8
	rMOVSXAMIRoBuY9hDjtbURutVLbePaQB8gK9hxBw0Yms5c8HlMg8Yh/KYBb8NXNKIB6l
	ibtA==
X-Gm-Message-State: APjAAAXFR41a6LrL9h5SScDMUo22K6DXZszsIF0VuRIA0R0YxIlpwKlN
	WC/qqGWBdflwaoSYyZKlPyP3zuH3
X-Google-Smtp-Source: APXvYqwIsCvXEgfPGgsu07hyAs6bnUNwYV31qtL1beY1iynmO8mcjWfrY/VeRF5ZPYQdl8NfjJNi7Q==
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr8406613wmj.58.1576174494034;
	Thu, 12 Dec 2019 10:14:54 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:17 +0100
Message-Id: <20191212181436.1322-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/30] sysklogd: Fix 2.0.3 upgrade fallouts on musl
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:53 -0000

From: Khem Raj <raj.khem@gmail.com>

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
index 00000000000..b2d45c0a0a6
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
index 00000000000..799a7a4c4cd
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
index b90911af2b7..07edf403266 100644
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
2.17.1


