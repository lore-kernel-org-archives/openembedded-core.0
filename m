Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.2137.1596611015383592773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 00:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qnhRUKAk;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id w19so11740436plq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 00:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZhYfUQsKy7VH/dfykZQm5vkbBZgyGSA0tKW0C2jiA0=;
        b=qnhRUKAkjTQTylJuZJ3wBvkvLxvk1ffqh5gbILQVYO2ymr39u91KfFrVNIAE28jFD0
         DXnjq3VsBHRo3f7JRFOxKLYVmyvAK4rCb63qZby2Y3WNn0f2lrFC27mac3DuGQTX4Qbu
         HIZP+SoO1cduyfGUwOD/5nlM6g6wuoaCSHh6BtK3P2aMrtUzdouWqiNc9dq2qXH1hSPh
         Xd9Qya2fA4J2Wvue5T7cJBOK7Z0VfEZIrdkRzDqoJwVeQpWOUfvpOc3rKj5hwHRcWCqk
         ZNm69Ks0lPCrS5jii8jGHBNOF3nNwliLOuSgmHGUnT/o645xT31wocYqMYpCgokwq9c7
         mcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZhYfUQsKy7VH/dfykZQm5vkbBZgyGSA0tKW0C2jiA0=;
        b=mXOxWcwVI7idfnlJjVud+e00jpIOZfGxEYC4KVDrel9KFyRFkYJhXPjgzF8tYzlzKl
         7ijvUMQyfm9xfF677S2BleX6t0dUtLrTyScJiL6kHjHVUM/+MNoDdoFLlJXTH96zC1B6
         FUab/HfFd5CvG/e47l5BPUdhEJANdHf79K/krNfjLHHHvGDKgptpBOegJnDqeGgighf3
         Sluq4qoH3tEJu6sbjrLvSKb/yvah4FMKhyZmAs65y2xG9ROCtwvZN16u7r/TCHNpMP/n
         9X+c+A6TpvpgNcCXSnq5T6y1GAZrrZ9bt4Qm0b41a8G0ExkrFsTPa6WuKznjKewWADxz
         Qj1g==
X-Gm-Message-State: AOAM53228qi4a/62ldjiTP3NoWpphycuxpRHF+AjFaXcBimT9CZtHzA8
	DjMnzo6T0CJwuuxVAGgZX65WCAcm+cw=
X-Google-Smtp-Source: ABdhPJzBxS1ziYou9OeSmnoZvP8BiV/Qb4kn6JSRCY8H5QiVPAji2XmZHrm3yuvSk0JH4z5F6cm4IQ==
X-Received: by 2002:a17:902:8eca:: with SMTP id x10mr1820115plo.129.1596611014123;
        Wed, 05 Aug 2020 00:03:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id f77sm1903924pfa.216.2020.08.05.00.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 00:03:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] minicom: Fix build when using -fno-common
Date: Wed,  5 Aug 2020 00:03:26 -0700
Message-Id: <20200805070326.1052906-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc10 defaults to -fno-common which flags the multiple global variables
as errors, these patches ( from fedora ) fixes the issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...erfluous-global-variable-definitions.patch | 35 ++++++++++++++++
 ...erfluous-global-variable-definitions.patch | 37 ++++++++++++++++
 ...erfluous-global-variable-definitions.patch | 42 +++++++++++++++++++
 .../recipes-extended/minicom/minicom_2.7.1.bb |  3 ++
 4 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
 create mode 100644 meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
 create mode 100644 meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch

diff --git a/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
new file mode 100644
index 0000000000..4c6e249315
--- /dev/null
+++ b/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
@@ -0,0 +1,35 @@
+From b65152ebc03832972115e6d98e50cb6190d01793 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
+Date: Mon, 3 Feb 2020 13:18:13 +0100
+Subject: [PATCH 1/3] Drop superfluous global variable definitions
+
+The file minicom.c, by including the minicom.h header, already defines
+the global variables 'dial_user' and 'dial_pass'. The object file
+minicom.o is always linked to dial.o. Thus the definitions in dial.c
+can be dropped.
+
+This fixes linking with gcc 10 which uses -fno-common by default,
+disallowing multiple global variable definitions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dial.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/dial.c b/src/dial.c
+index eada5ee..d9d481f 100644
+--- a/src/dial.c
++++ b/src/dial.c
+@@ -146,8 +146,6 @@ static int newtype;
+ /* Access to ".dialdir" denied? */
+ static int dendd = 0;
+ static char *tagged;
+-char *dial_user;
+-char *dial_pass;
+ 
+ /* Change the baud rate.  Treat all characters in the given array as if
+  * they were key presses within the comm parameters dialog (C-A P) and
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
new file mode 100644
index 0000000000..1740051e0a
--- /dev/null
+++ b/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
@@ -0,0 +1,37 @@
+From 924bd2da3a00e030e29d82b74ef82900bd50b475 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
+Date: Mon, 3 Feb 2020 13:18:33 +0100
+Subject: [PATCH 2/3] Drop superfluous global variable definitions
+
+The only place where the EXTERN macro mechanism is used to define the
+global variables 'vt_outmap' and 'vt_inmap' is minicom.c (by defining
+an empty EXTERN macro and including the minicom.h header). The file
+vt100.c already defines these variables. The vt100.o object file is
+always linked to minicom.o. Thus it is safe not to define the
+variables in minicom.c and only declare them in the minicom.h header.
+
+This fixes linking with gcc 10 which uses -fno-common by default,
+disallowing multiple global variable definitions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/minicom.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/minicom.h b/src/minicom.h
+index 061c013..0f9693b 100644
+--- a/src/minicom.h
++++ b/src/minicom.h
+@@ -141,7 +141,7 @@ EXTERN int sbcolor;     /* Status Bar Background Color */
+ EXTERN int st_attr;	/* Status Bar attributes. */
+ 
+ /* jl 04.09.97 conversion tables */
+-EXTERN unsigned char vt_outmap[256], vt_inmap[256];
++extern unsigned char vt_outmap[256], vt_inmap[256];
+ 
+ /* MARK updated 02/17/95 - history buffer */
+ EXTERN int num_hist_lines;  /* History buffer size */
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
new file mode 100644
index 0000000000..58cd58eda8
--- /dev/null
+++ b/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
@@ -0,0 +1,42 @@
+From a4fc603b3641d2efe31479116eb7ba66932901c7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
+Date: Mon, 3 Feb 2020 13:21:41 +0100
+Subject: [PATCH 3/3] Drop superfluous global variable definitions
+
+The only place where the EXTERN macro mechanism is used to define the
+global variables 'portfd_is_socket', 'portfd_is_connected' and
+'portfd_sock_addr' is minicom.c (by defining an empty EXTERN macro and
+including the minicom.h header). The source file sysdep1_s.c already
+defines these variables. The sysdep1_s.o object file is always linked
+to minicom.o. Thus it is safe to drop the definitions from minicom.c
+and only declare the variables in the minicom.h header.
+
+This fixes linking with gcc 10 which uses -fno-common by default,
+disallowing multiple global variable definitions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/minicom.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/minicom.h b/src/minicom.h
+index 0f9693b..1e7cb8c 100644
+--- a/src/minicom.h
++++ b/src/minicom.h
+@@ -113,9 +113,9 @@ EXTERN char *dial_user;     /* Our username there */
+ EXTERN char *dial_pass;     /* Our password */
+ 
+ #ifdef USE_SOCKET
+-EXTERN int portfd_is_socket;	/* File descriptor is a unix socket */
+-EXTERN int portfd_is_connected;	/* 1 if the socket is connected */
+-EXTERN struct sockaddr_un portfd_sock_addr;	/* the unix socket address */
++extern int portfd_is_socket;	/* File descriptor is a unix socket */
++extern int portfd_is_connected;	/* 1 if the socket is connected */
++extern struct sockaddr_un portfd_sock_addr;	/* the unix socket address */
+ #define portfd_connected ((portfd_is_socket && !portfd_is_connected) \
+                            ? -1 : portfd)
+ #else
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index 1e6f1317eb..03034864c8 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -11,6 +11,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
            file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
+           file://0001-Drop-superfluous-global-variable-definitions.patch \
+           file://0002-Drop-superfluous-global-variable-definitions.patch \
+           file://0003-Drop-superfluous-global-variable-definitions.patch \
           "
 
 SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
-- 
2.28.0

