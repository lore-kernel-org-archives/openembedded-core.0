Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8528B78293
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 22:08:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t138so462454wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 15:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=93/flN4xnFvBfBcVqDukPHVRVCuGMDw+uTTny03PbZo=;
	b=MeMF2Xe6B2x3JQ0wUY+19/gITTOdh35MFG6ehENkTI1LGB9VWcSOWj6QE5o3Aw8h5c
	4KR2v2eay2DR4QB6TyHeMBogj136ZXbafLqKgPFyrlp9VT15eo2BGVzWMwRNNZ6IHeet
	X4CvgQPXa6+UEEpfwpfyqVzLP6ZEcQ7BsdqQRhrv/2Srom8c1hAoVKXeyj254k5N1TRS
	D7IwjjmwrneBU3Xwdmmu2PmTAEv20Ctyc8OjKvuDFp6yvDVx9lkjO2Rk7NeHNa3QP2rm
	kb5GrBEg/YMCGghJL7g2jbAcEDAzBABx/bqgFbfw92U1TTG8lBaRt6UzcNK0KQTVsg7D
	Pm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=93/flN4xnFvBfBcVqDukPHVRVCuGMDw+uTTny03PbZo=;
	b=C9n/2zCK6qNNWSRaZUXJvS5HQOqoUqyyosRycfH3quE2eMIi360cQ3T9tgkDsOT0qu
	XzPLxWjwOoCwJ5HwrdvZTghzs1QjQAdoEy2DNSa0xU3+bLBGQI28P+qAulXdOKeBwBp6
	3GrqVmeQQ6m1mNSn4yJx5vpaH+S9NknYVLkdigeUVmvVOtUg4lR2z0jbFLEvrUbR1YHu
	bLyaHtFmaMz8+ISLrMdbjVmz7AZzYBqi6rzhEGEIYCimhGAtQ3L18z9wD02sKuW2RLRv
	vWf/3j+XeHqcoL1QqkdwvavC9a2b6n+1JRTvEvuPZdWYe9hz12eG+Vfz0nvbCijI1C43
	sDGA==
X-Gm-Message-State: AHYfb5gOyLYBKpQ+lLTCE0nchmQcxjPwW0/QfWaSV3RcCzXYH+8KQQEP
	VXcHS31chWwxmOUn
X-Received: by 10.28.144.68 with SMTP id s65mr462127wmd.175.1503439717786;
	Tue, 22 Aug 2017 15:08:37 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id f9sm304775wmf.9.2017.08.22.15.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Aug 2017 15:08:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 00:10:20 +0200
Message-Id: <20170822221020.10779-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <CA+chaQf=yHdsWXEZyDFQ9KsHDvpYY24G8ACGkd4Q3oBOdFVgZw@mail.gmail.com>
References: <CA+chaQf=yHdsWXEZyDFQ9KsHDvpYY24G8ACGkd4Q3oBOdFVgZw@mail.gmail.com>
Subject: [PATCHv2] grub2: fix build on gcc where _FORTIFY_SOURCE is defined
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
X-List-Received-Date: Tue, 22 Aug 2017 22:08:37 -0000

* e.g. with gentoo gcc-7.1 they define _FORTIFY_SOURCE by default with:
  https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo/src/patchsets/gcc/7.1.0/gentoo/10_all_default-fortify-source.patch?view=markup
  which results in following error while building grub-efi-native:
  ./config-util.h:1504:48: error: this use of "defined" may not be portable [-Werror=expansion-to-defined]
               || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
                                                  ^~~~~~~~~~~~~~~
  this part comes from gnulib and it's used only for Apple and BSD,
  so we can ignore it, but we cannot add -Wno-error=expansion-to-defined
  because this warning was introduced only in gcc-7 and older gcc
  will fail with:
  cc1: error: -Werror=expansion-to-defined: no option -Wexpansion-to-defined
  use #pragma to work around this

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

v2: this version works on hosts with older gcc, tested on Ubuntu-16.04
    with gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4)

 .../grub/files/fix.build.with.gcc-7.patch          | 39 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/fix.build.with.gcc-7.patch

diff --git a/meta/recipes-bsp/grub/files/fix.build.with.gcc-7.patch b/meta/recipes-bsp/grub/files/fix.build.with.gcc-7.patch
new file mode 100644
index 0000000000..f35df97bfc
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/fix.build.with.gcc-7.patch
@@ -0,0 +1,39 @@
+* e.g. with gentoo gcc-7.1 they define _FORTIFY_SOURCE by default with:
+  https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo/src/patchsets/gcc/7.1.0/gentoo/10_all_default-fortify-source.patch?view=markup
+  which results in following error while building grub-efi-native:
+  ./config-util.h:1504:48: error: this use of "defined" may not be portable [-Werror=expansion-to-defined]
+               || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
+                                                  ^~~~~~~~~~~~~~~
+  this part comes from gnulib and it's used only for Apple and BSD,
+  so we can ignore it, but we cannot add -Wno-error=expansion-to-defined
+  because this warning was introduced only in gcc-7 and older gcc
+  will fail with:
+  cc1: error: -Werror=expansion-to-defined: no option -Wexpansion-to-defined
+  use #pragma to work around this
+
+Upstream-Status: Pending (should be fixed in gnulib which is then rarely updated in grub)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr grub-2.02.old/m4/extern-inline.m4 grub-2.02/m4/extern-inline.m4
+--- grub-2.02.old/m4/extern-inline.m4	2016-02-28 15:22:21.000000000 +0100
++++ grub-2.02/m4/extern-inline.m4	2017-08-22 19:26:45.213637276 +0200
+@@ -39,6 +39,10 @@
+    OS X 10.9 has a macro __header_inline indicating the bug is fixed for C and
+    for clang but remains for g++; see <http://trac.macports.org/ticket/41033>.
+    Assume DragonFly and FreeBSD will be similar.  */
++#pragma GCC diagnostic push
++#if __GNUC__ >= 7
++#pragma GCC diagnostic ignored "-Wexpansion-to-defined"
++#endif
+ #if (((defined __APPLE__ && defined __MACH__) \
+       || defined __DragonFly__ || defined __FreeBSD__) \
+      && (defined __header_inline \
+@@ -50,6 +52,7 @@
+                 && defined __GNUC__ && ! defined __cplusplus))))
+ # define _GL_EXTERN_INLINE_STDHEADER_BUG
+ #endif
++#pragma GCC diagnostic pop
+ #if ((__GNUC__ \
+       ? defined __GNUC_STDC_INLINE__ && __GNUC_STDC_INLINE__ \
+       : (199901L <= __STDC_VERSION__ \
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 240a1f9286..a56fbe7bf8 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -17,6 +17,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
+	   file://fix.build.with.gcc-7.patch \
 "
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
-- 
2.14.1


