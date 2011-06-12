Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVcCR-0001kv-SS
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 06:23:00 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1810995pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 21:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=WdFcKwjldKZIREvdHdyhCIg1aywGAyAT5+Qz4Sy2yxw=;
	b=BqCewzoADoh6Koo5Z0snLkAhXnAtZrCuEyYQdkBHQ1zZGu8nppOKZ6B1qezTR6zQyu
	ODb7Xipfjbl/qi0UOZmv60RkZSqfCoW14wjvne5HsyGx/HQ5lB3vlYH09MSkEQfarB1d
	qwaiFXRjdMHW+evjWB83EI7tzfG+lJZRdq6EM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OKNWzQLGBPGqdrXMJY8kI+k9b0mRbCvS2DEc7j7tFIIZSX9jMHNx6TH4fIzpz27abf
	O/2wraneTiExgfIvXxbn7oIl5wUUWGMhUcp08UcemRK4pcbgXJCkuz5TfIKk4oWVcl+1
	oRtgTGqY3lA6YZ/Z7jz6W61flxj7MJ0BWIS4A=
Received: by 10.68.57.105 with SMTP id h9mr1638941pbq.221.1307852379253;
	Sat, 11 Jun 2011 21:19:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm3579520pbb.18.2011.06.11.21.19.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 21:19:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 21:19:06 -0700
Message-Id: <fdf926e72bb7f615d97a8738a178ecf92b6c1647.1307852182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
References: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
In-Reply-To: <cover.1307852182.git.raj.khem@gmail.com>
References: <cover.1307852182.git.raj.khem@gmail.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: [PATCH 5/6] uclibc: remove redundant python code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Jun 2011 04:23:00 -0000

From: Phil Blundell <pb@pbcl.net>

This chunk of python code has been around for a while (witness the
comment about gcc 3.4.0) and predates the availability of
COMPATIBLE_HOST.  Rewrite it using a more modern idiom.

Signed-off-by: Phil Blundell <philb@gnu.org>
Acked-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 2bf3017..06c0f5d 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -36,21 +36,11 @@ cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/site_config_libc; \
 sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}/site_config_libc/libc.so; \
 "
 
-#
 # For now, we will skip building of a gcc package if it is a uclibc one
 # and our build is not a uclibc one, and we skip a glibc one if our build
 # is a uclibc build.
-#
-# See the note in gcc/gcc_3.4.0.oe
-#
+COMPATIBLE_HOST = ".*-uclibc.*"
 
-python __anonymous () {
-    import bb, re
-    uc_os = (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) != None)
-    if not uc_os:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   bb.data.getVar('TARGET_OS', d, 1))
-}
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-intermediate \
-- 
1.7.4.1



