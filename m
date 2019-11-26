Return-Path: <kergoth@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id D50F17FCBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:07:00 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id g6so125666plp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SAKHRDhCtyQX0ou6jtqaZXZLPghYa1bc55AbMtgQyJw=;
	b=Qj12HWl9oQFgdfdq6TL9UKTXrb4lDv14FqpoeGQRLxX4xRVcknaYYmLzSio/bnLAQH
	XOuTOIXrKvM8OhM+zLh9TI/jjzyb3VnCvBYYdVaKtoGw2TnTUoPNxLew79Yv+NVVj7fV
	ialVes0am0X2KRT3QJ5s7xZDDdB/vSeR2V5o+GmkBkSTS8e7tXreJpBLpw5REaoC6VPb
	w1D8xl3HCfa6RFImNXomVg4IHAmHUsUvfS2bEEaJQY5vOTtbcKIPevqhJmCnUMuC2n4W
	tfI4JPCq7Dnz5+RH6Zezq4iMXlKm/nVbXiV+JvRZuZfk9WtjDenlT7600ZHnsvYVLfSv
	TirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SAKHRDhCtyQX0ou6jtqaZXZLPghYa1bc55AbMtgQyJw=;
	b=D1ivrknizfcOhX+7IeLAvDfBPwbDJ2FbVuJ64jOv0FSTUzXd3EnCztcPenKWcgBEcw
	SLaHPImz1h1w6vDkOp+nbYO1q7x0geDfKMhuLpp6Hbv/l0B0+Hj7bJgnwRR8TAlEuteT
	7nPBRs58s79Osziif90nvQs1oA5+Bjmxu5eON3lz+pot7BBlxHnJfr470NHe0MJPVhM2
	xtydxG9EEM3K/rI4I18U460T/IuNuZt/fxAehTW4RisA6MUO9RlL6gjKbC2SEK3o5xgb
	m9XvZ4VUQsFzK8oPaB5abW61nwVr4exsDR6w48h7SgcC4tlbpbRvhrV1L+M5TDyTLJ0s
	5dKA==
X-Gm-Message-State: APjAAAX5aZ2ALlrnDuBvuv13jSOrBNHAVCDTUQWwHq/8w0VMxJL3gjbN
	BcQ+hakfYHFuF39Jl6RU9HKujPBb4K0=
X-Google-Smtp-Source: APXvYqw0f/8c7o86kfPlsQeiFs7exx0nhekGzM1m+oB/RTOCB3uk+cb+Bn4/twxARCRqzrMrH866aQ==
X-Received: by 2002:a17:90a:bb94:: with SMTP id
	v20mr492056pjr.62.1574791621720; 
	Tue, 26 Nov 2019 10:07:01 -0800 (PST)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	v15sm13171989pfe.44.2019.11.26.10.06.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Nov 2019 10:07:00 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 23:08:29 +0500
Message-Id: <20191126180829.25680-3-kergoth@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20191126180829.25680-1-kergoth@gmail.com>
References: <20191126180829.25680-1-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 3/3] libcap-ng: add pthread library if header is found
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
X-List-Received-Date: Tue, 26 Nov 2019 18:07:01 -0000

From: Christopher Larson <chris_larson@mentor.com>

If the pthread.h header is found, make sure library containing
"pthread_atfork" is added to the list of libraries against which to
link. On some hosts (e.g. openSUSE 15.1) "-lpthread" needs to be
explicitly added in order for the code to compile correctly.

We already had a workaround for this for native builds, but using some
external toolchains, we can be bit by this for the target recipe as
well.

Most of this is courtesy Trevor Woerner <twoerner@gmail.com>, via his
patch at stevegrubb/libcap-ng#10, the last thanks to Khem Raj.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/libcap-ng/libcap-ng.inc       |  2 ++
 ...-configure.ac-add-library-if-header-found.patch | 30 ++++++++++++++++++++++
 ...ap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch | 24 +++++++++++++++++
 meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb |  1 -
 4 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch

diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index aec83896e4d..002915ad48b 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://python.patch \
+           file://0001-configure.ac-add-library-if-header-found.patch \
+           file://0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch \
 "
 
 SRC_URI[md5sum] = "57dc267e2949cdecb651a929f9206572"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch b/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
new file mode 100644
index 00000000000..0fcb032f903
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
@@ -0,0 +1,30 @@
+From 0230e2e374bb71aed0181ccd9ebd13c0c5125a5d Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Fri, 25 Oct 2019 17:01:20 -0400
+Subject: [PATCH] configure.ac: add library if header found
+
+If the pthread.h header is found, make sure library containing
+"pthread_atfork" is added to the list of libraries against which to link.
+On some hosts (e.g. openSUSE 15.1) "-lpthread" needs to be explicitly added
+in order for the code to compile correctly.
+
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 63088f4..639b464 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,7 +56,9 @@ AC_CHECK_HEADERS(sys/xattr.h, [], [
+ 	AC_CHECK_HEADERS(attr/xattr.h, [], [AC_MSG_WARN(attr/xattr.h not found, disabling file system capabilities.)])
+ 	])
+ AC_CHECK_HEADERS(linux/securebits.h, [], [])
+-AC_CHECK_HEADERS(pthread.h, [], [AC_MSG_WARN(pthread.h not found, disabling pthread_atfork.)])
++AC_CHECK_HEADERS(pthread.h,
++	[AC_SEARCH_LIBS(pthread_atfork, pthread)],
++	[AC_MSG_WARN(pthread.h not found, disabling pthread_atfork.)])
+ 
+ AC_C_CONST
+ AC_C_INLINE
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch b/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
new file mode 100644
index 00000000000..7eb950f159c
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
@@ -0,0 +1,24 @@
+From d95c4018ad57c37f6272dbedfa5217776567c329 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 26 Nov 2019 22:34:34 +0500
+Subject: [PATCH] Wrap pthread_atfork usage in HAVE_PTHREAD_H
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ src/cap-ng.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/cap-ng.c b/src/cap-ng.c
+index 35fcd7a..97a3dbd 100644
+--- a/src/cap-ng.c
++++ b/src/cap-ng.c
+@@ -166,7 +166,9 @@ static void deinit(void)
+ static void init_lib(void) __attribute__ ((constructor));
+ static void init_lib(void)
+ {
++#ifdef HAVE_PTHREAD_H
+ 	pthread_atfork(NULL, NULL, deinit);
++#endif
+ }
+ 
+ static void init(void)
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
index a9a046571fa..6e6de454940 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
@@ -3,7 +3,6 @@ require libcap-ng.inc
 inherit lib_package autotools
 
 EXTRA_OECONF += "--without-python --without-python3"
-LDFLAGS_append_class-native = " -pthread"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.11.1


