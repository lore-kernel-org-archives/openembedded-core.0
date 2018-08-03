Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id F20AD746A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 17:30:21 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id p12-v6so3608065pfh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kcRdCS48VQgvtIwNSy/lZeViLlV5xrn/RBzA1ehFkxQ=;
	b=tWzBLGC5rDTFvPQETjMQM1B5gA7S8lpoZm9IK6G3/d48k/QTU45W50Ba3nJ5052MhO
	GCGHC5BFtnQaT0rkqVHvAib1EDklZvUfYXTPn+nHYl2zg2+ARw0ek3JBPnvmDCSWaSMu
	cLxzLVIIh+EihmRPPurBI68mMkHkWJYIZjNx5RDZ9ftV/zGm6VueJxTcbARyNHpv5Jum
	HD4QserOjSd4AM09FEn6WcmgHKz/03uZhMrjassuj0PZYd39T/rG72lbLLfU804dnU7H
	MWRsDwQsjCuWNWVhPJhyyOPluSBPXBk550bnFIaBw+qWKjCu15oNuc/N6h76Bl1mckvy
	k6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kcRdCS48VQgvtIwNSy/lZeViLlV5xrn/RBzA1ehFkxQ=;
	b=Yhfuyd2ACmQNVvF0Dhv0qmPoRHEEqwfaff8HewT4ln7AQMeTs4L7dcJaS1cAwkU6fC
	Qwj4m8fsw+IYLGK3CFZ/pOTvKepffSQzaB5A1vIYeQRHn50C9bNAz1FQSatDRsdJvk63
	fPjG0BELj/l23k045E94rhNayyHZIMYqqppgrPlBOsgOP7juEoRrCmX52djJfMeAnS1Z
	79mwG9ep5HRh3eP1/cW9zga4nKdGSmorkDsljnhuXngpyO6xIYF8XeZMkYeQJh73WTHr
	TcWD2nQG5f3V+GlKlEhh5hg8RZbU7Donbcal/46N5jMBCRRsA4zyKiGnhkpQUKy6agBO
	Wz2A==
X-Gm-Message-State: AOUpUlEZa6J06DQV6eJiLMwy0bgywl8MBWz+9kTigKnkydczOHaOUrQ6
	LOGln3MZawws2iT5Ns9PWVV5IQm2
X-Google-Smtp-Source: AAOMgpeONzG8+8U3eEvmvmfuTPlI1ApJPZdQfnAwkbIRcaDjRE63mlwwwzNt7g8HtwLy6NiDWNzkxw==
X-Received: by 2002:a63:af14:: with SMTP id
	w20-v6mr4793991pge.47.1533317422653; 
	Fri, 03 Aug 2018 10:30:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm10506185pfi.89.2018.08.03.10.30.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Aug 2018 10:30:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2018 10:30:14 -0700
Message-Id: <20180803173014.20748-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] libidn2: Fix charset.alias issue with musl
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
X-List-Received-Date: Fri, 03 Aug 2018 17:30:22 -0000

Fixes
ERROR: libidn2-2.0.5-r0 do_package: QA Issue: libidn2: Files/directories were installed but not shipped in any packag
e:
  /usr/lib/charset.alias
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or del
ete them within do_install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...charset_alias-when-building-for-musl.patch | 23 +++++++++++++++++++
 meta/recipes-extended/libidn/libidn2_2.0.5.bb |  4 +++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch

diff --git a/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000000..ace50bbfde
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,23 @@
+Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: libidn2-2.0.5/unistring/Makefile.am
+===================================================================
+--- libidn2-2.0.5.orig/unistring/Makefile.am
++++ libidn2-2.0.5/unistring/Makefile.am
+@@ -293,7 +293,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
index aaf9ecd7e7..0d7bddbc7f 100644
--- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
                     file://src/idn2.c;endline=16;md5=0283aec28e049f5bcaaeee52aa865874 \
                     file://lib/idn2.h.in;endline=27;md5=c2cd28d3f87260f157f022eabb83714f"
 
-SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
+           file://Unset-need_charset_alias-when-building-for-musl.patch \
+          "
 SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
 SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
 
-- 
2.18.0


