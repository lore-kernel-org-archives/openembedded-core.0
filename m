Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACC6788D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:06:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FE6MPX018563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 14:06:25 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7w-0002Qu-Gy; Thu, 15 Mar 2018 06:41:04 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:40:57 -0700
Message-Id: <1521121262-9269-8-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [pyro][PATCH 08/13] libtirpc: stop dropping in NIS headers
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
X-List-Received-Date: Thu, 15 Mar 2018 14:06:27 -0000

From: Ross Burton <ross.burton@intel.com>

libtirpc prior to 1.0.2 assumed that the system provided nis.h but this isn't
always true.  Until now we've been using a tarball of the missing files from
Gentoo, but libtirpc 1.0.2 added a copy of nis.h to the sources so this isn't
required anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
index 94fd5f9..07e4c79 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
-           ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://export_key_secretkey_is_set.patch \
            file://0001-replace-__bzero-with-memset-API.patch \
            file://0001-include-stdint.h-for-uintptr_t.patch \
@@ -23,19 +22,13 @@ SRC_URI_append_libc-musl = " \
                              file://Use-netbsd-queue.h.patch \
                            "
 
-SRC_URI[libtirpc.md5sum] = "d5a37f1dccec484f9cabe2b97e54e9a6"
-SRC_URI[libtirpc.sha256sum] = "723c5ce92706cbb601a8db09110df1b4b69391643158f20ff587e20e7c5f90f5"
-SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
-SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
+SRC_URI[md5sum] = "d5a37f1dccec484f9cabe2b97e54e9a6"
+SRC_URI[sha256sum] = "723c5ce92706cbb601a8db09110df1b4b69391643158f20ff587e20e7c5f90f5"
 
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
 
-do_configure_prepend () {
-        cp -r ${WORKDIR}/tirpc ${S}
-}
-
 do_install_append() {
         chown root:root ${D}${sysconfdir}/netconfig
 }
-- 
2.7.4


