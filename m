Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id B84C772701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:14 +0000 (UTC)
Received: by pdev10 with SMTP id v10so8542894pde.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Hm8DGE7F74Bj1/2sFlwt4jrOmMc5R8csqXGAx7dOcUs=;
	b=PJ4zb1Okf+f21hJ7OsNMjx8ywCjJMC3TJa0/5zvevcYbZCdZEeApuBryLvTHFRNdmb
	dl9SpuoPteQqPNZ8rDDjQCDQv2lKyxBaTYJptxiS3PwQs9E/bmyCQXcVKeDKMku0JB5I
	A6GwGPFYKwV5GcvhAMV/WYeAGkdNB8ppkB+SHoEyjwbYb2UwvjmqzRwGXBULPI/N8+un
	cpnv/FMACFhWx3dtuVNgIsy9HNt+gjUBImq78HV4XvHwbQ8i/APWDUTbpl/GlbeaL8Lm
	VthVozOQebrD/dawV181Qm6uOW7FdNgnxMdKefQeKTmZv1wbAymjCeumdrebB1pZHb2w
	wKjQ==
X-Received: by 10.70.23.229 with SMTP id p5mr6821725pdf.88.1423152255742;
	Thu, 05 Feb 2015 08:04:15 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:09 -0800
Message-Id: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 01/61] glibc: Fix up minimal build with libc-libm
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:24 -0000

From: Saul Wold <sgw@linux.intel.com>

This addresses 2 issues discovered trying to build a minimal libc with
libm option.  By default nscd was always being built and without inet
enabled there were missing symbols.

[YOCTO #7108]

(From OE-Core rev: 89649881bcd0e76d6ee7c85c30e75bb01e1c004f)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch | 3 ++-
 meta/recipes-core/glibc/glibc_2.20.bb                        | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 7136253..332b8f7 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -4205,7 +4205,8 @@ Index: git/nss/getent.c
  D(gshadow)
 -D(hosts)
 +DN(hosts)
- D(initgroups)
+-D(initgroups)
++DN(initgroups)
 -D(netgroup)
 -D(networks)
 +DN(netgroup)
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index 9dd5e67..f67fbfd 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -90,9 +90,12 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-selinux \
                 --enable-obsolete-rpc \
                 --with-kconfig=${STAGING_BINDIR_NATIVE} \
+                --disable-nscd \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-inet-anl', '--enable-nscd', '--disable-nscd', d)}"
+
 
 do_patch_append() {
     bb.build.exec_func('do_fix_readlib_c', d)
-- 
1.9.1


