Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA677FCAC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 01:52:02 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id q10so779662pfs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2020 17:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fqqq8p1gr1+vfSp1wHrOldv5bAYI7tRLM57HnWYVLTU=;
	b=JDvFihDOhbdYFRLFlaXe80hwp52XW1hJKLiR5mBRubVT8jYmF1HYc4N1oekW6LaozU
	NCpKcy82F/U4uJeC177CNOGJAxt1x9DxsRXm5rIXcgW/EHbLQ3UBps+llTHO8T1suKxQ
	A702O9LHlOA7KtzKhWQ46ko46etMb2XxfxTv2k/FydrjDJjO3YbhWXzN/NRYGkOIXghm
	syNqPnE8VUsTOYRR3BBhiozrFZSsG972nHLpiQyhlc0CzVtvudag9zCS/WmhVhQqzICh
	547tnIN+2mG+KXsFathms5PqyXs3RJihlgQjShVuaHuma9BBJ3lmSdPcEO+PTLJyRFaG
	jx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fqqq8p1gr1+vfSp1wHrOldv5bAYI7tRLM57HnWYVLTU=;
	b=mAnMktU5xtwuv4kOIcZ/s4CHNUj3m6l9Dc3oXPnz8jy+lQ6AQt9xJNYOBSWpcqxupf
	hQiL2I8NrJCGEMBxdOYa9VQSaLzeCvvljusuT4qq5qA7sTCw3cd5aFkxBtuU/nQayM/6
	NwExW/FCf7lfhcVolxJaznpA6v2hJtkzS8inUZwkT6a/K9x9sb7cNnGQIQSXVIinLI+u
	qrI6YoE29uHLy/XBlxVZ2P/5cqC0SKzrGPKxwnnm/ixFSrFrbfDEkBku3csb2mCW7Nr0
	Hr9y7eIEHALVRU2ED+bHrbewDimlA68XKyOUfXPHyXEWMFJm2QGLuJoRTrVmX+QxGFeN
	nk2g==
X-Gm-Message-State: APjAAAXmIeFtXdinOEJrYN7OgA5N5k/h+4K8khLHwz+aIDnWKjBq05v0
	aTBttqhFysqwEKmZo1cLL2rpISpnQK0=
X-Google-Smtp-Source: APXvYqyjAl1vAHM1NNjB9CZxVR3+8+b2FIIzpO1tBUcH8mf6bSBlkJlLW5csTWLvdVvQOzI028LPow==
X-Received: by 2002:a63:1a08:: with SMTP id a8mr2680318pga.425.1578448322596; 
	Tue, 07 Jan 2020 17:52:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	g22sm1010267pgk.85.2020.01.07.17.52.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 17:52:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2020 17:51:57 -0800
Message-Id: <20200108015157.3699714-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] openssh: Allow clock_nanosleep/clock_gettime64/clock_nanosleep_time64 syscall
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
X-List-Received-Date: Wed, 08 Jan 2020 01:52:02 -0000
Content-Transfer-Encoding: 8bit

Fixes connection denials with these syscalls being there on upcoming glibc 2.31 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...omp-Allow-clock_gettime64-in-sandbox.patch | 31 +++++++++++++++++++
 .../openssh-8.1p1-seccomp-nanosleep.patch     | 27 ++++++++++++++++
 .../openssh/openssh_8.1p1.bb                  |  2 ++
 3 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-seccomp-Allow-clock_gettime64-in-sandbox.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-8.1p1-seccomp-nanosleep.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-seccomp-Allow-clock_gettime64-in-sandbox.patch b/meta/recipes-connectivity/openssh/openssh/0001-seccomp-Allow-clock_gettime64-in-sandbox.patch
new file mode 100644
index 0000000000..78c493de86
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-seccomp-Allow-clock_gettime64-in-sandbox.patch
@@ -0,0 +1,31 @@
+From eae3e85322fa7c869f5822db4eda6348f2beb09e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 7 Jan 2020 16:26:45 -0800
+Subject: [PATCH] seccomp: Allow clock_gettime64() in sandbox.
+
+This helps sshd accept connections on mips platforms with
+upcoming glibc ( 2.31 )
+
+Upstream-Status: Accepted [https://github.com/openssh/openssh-portable/pull/161]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sandbox-seccomp-filter.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
+index 3ef30c9..999c46c 100644
+--- a/sandbox-seccomp-filter.c
++++ b/sandbox-seccomp-filter.c
+@@ -248,6 +248,9 @@ static const struct sock_filter preauth_insns[] = {
+ #ifdef __NR_clock_nanosleep_time64
+ 	SC_ALLOW(__NR_clock_nanosleep_time64),
+ #endif
++#ifdef __NR_clock_gettime64
++	SC_ALLOW(__NR_clock_gettime64),
++#endif
+ #ifdef __NR__newselect
+ 	SC_ALLOW(__NR__newselect),
+ #endif
+-- 
+2.24.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-8.1p1-seccomp-nanosleep.patch b/meta/recipes-connectivity/openssh/openssh/openssh-8.1p1-seccomp-nanosleep.patch
new file mode 100644
index 0000000000..7c9d61c26d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-8.1p1-seccomp-nanosleep.patch
@@ -0,0 +1,27 @@
+commit 7e929163ed40f9ce90060a3ca6df558c3d901379
+Author: Jakub Jelen <jjelen@redhat.com>
+Date:   Wed Nov 13 12:57:05 2019 +0100
+
+seccomp: Allow clock_nanosleep() to make OpenSSH working with latest glibc
+sandbox-seccomp: Allow clock_nanosleep on ARM
+
+Upstream-Status: Backport [https://github.com/tcely/openssh-portable/pull/258]
+                          [https://github.com/bobby0809/openssh-portable/pull/138]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com
+
+--- a/sandbox-seccomp-filter.c
++++ b/sandbox-seccomp-filter.c
+@@ -242,6 +242,12 @@ static const struct sock_filter preauth_
+ #ifdef __NR_nanosleep
+ 	SC_ALLOW(__NR_nanosleep),
+ #endif
++#ifdef __NR_clock_nanosleep
++	SC_ALLOW(__NR_clock_nanosleep),
++#endif
++#ifdef __NR_clock_nanosleep_time64
++	SC_ALLOW(__NR_clock_nanosleep_time64),
++#endif
+ #ifdef __NR__newselect
+ 	SC_ALLOW(__NR__newselect),
+ #endif
diff --git a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
index 024ebca402..f8be7ba178 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://openssh-8.1p1-seccomp-nanosleep.patch \
+           file://0001-seccomp-Allow-clock_gettime64-in-sandbox.patch \
            "
 SRC_URI[md5sum] = "513694343631a99841e815306806edf0"
 SRC_URI[sha256sum] = "02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff"
-- 
2.24.1


