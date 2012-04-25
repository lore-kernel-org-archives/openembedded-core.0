Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mpnorman@gmail.com>) id 1SMzrY-0004wD-Qs
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 12:54:21 +0200
Received: by dakh32 with SMTP id h32so2164116dak.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BfvhgFDZUimSb3Qwf8ybofeAiLGuK4uYBsHYUF7W83Q=;
	b=0t+qyNAQRTr9eSz5KzUjdiZEYlYDrkczGhIBy4Bn8JRM9qCyv8KG4td2HXvJCd48+6
	FzQg+Y0u+aCor1O5oWpI1yO4XuWI/H1kHxpm/EZ0Vc0tEDg2oKSdPQcVokRGd3M3xUiZ
	8YuQdZ8CRd9CTMp/VuPl9tKfGfBCCVhif/wcZM5nYRLgRjxky85xgN9xQumw/u0dzf5w
	UG/D9k7VMtby/oIgzOYE1gupLZusKv8Z9ZEGPS/nrLFyBic0qLa2FfoXMI8OpzG2ny2m
	ikYZoy47Oia/UYob8fnCUaxA9T0tDxqlyUrUXVL93Zm0TYlccli3TzRxYPX80aj2gjNe
	gTjA==
Received: by 10.68.129.130 with SMTP id nw2mr2655643pbb.133.1335350684090;
	Wed, 25 Apr 2012 03:44:44 -0700 (PDT)
Received: from localhost.localdomain (182-239-169-239.ip.adam.com.au.
	[182.239.169.239])
	by mx.google.com with ESMTPS id y3sm20192463pbh.59.2012.04.25.03.44.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Apr 2012 03:44:41 -0700 (PDT)
From: Mark Norman <mpnorman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 20:14:20 +0930
Message-Id: <1335350660-4043-1-git-send-email-mpnorman@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH v2] uclibc SDK not including libpthread_nonshared.a
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
X-List-Received-Date: Wed, 25 Apr 2012 10:54:21 -0000

Modified the uclibc PACKAGES list order to ensure the uclibc-dev package is
processed before uclibc-staticdev to allow *_nonshared.a libraries to be
packaged in the uclibc-dev package.  The *_nonshared.a libraries are required
by the SDK.
---
 meta/recipes-core/uclibc/uclibc.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 893d8fd..f5b6bf7 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -13,7 +13,7 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r6"
+INC_PR = "r7"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
@@ -48,9 +48,9 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
-PACKAGES =+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm"
-PACKAGES =+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
+# Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
+# *_nonshared.a libraries to be packaged in the uclibc-dev package.
+PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN} ${PN}-doc ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
 
 FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
 FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
-- 
1.7.1



