Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCBE73DA2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 08:14:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,371,1427752800"; d="scan'208";a="74809604"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 05 May 2015 10:14:19 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.210.2; Tue, 5 May 2015 10:14:19 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.210.2; Tue, 5 May 2015 10:14:19 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 May 2015 10:14:01 +0200
Message-ID: <1430813641-24223-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH] zlib: minor symbolic link issue
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
X-List-Received-Date: Tue, 05 May 2015 08:14:20 -0000
Content-Type: text/plain

libz.so symbolic link created in ${libdir} is ../..//lib/libz.so.1.2.8
Make it cleaner and generic (idea comes from libcgroup recipe).

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-core/zlib/zlib_1.2.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index ca0ba3f..5e11f23 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -6,7 +6,6 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=fde612df1e5933c428b73844a0c494fd"
 
-
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
            file://Makefile-runtests.patch \
@@ -54,7 +53,8 @@ do_install_append_class-target() {
 		mkdir -p ${D}/${base_libdir}
 		mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
 		tmp=`readlink ${D}/${libdir}/libz.so`
-		ln -sf ../../${base_libdir}/$tmp ${D}/${libdir}/libz.so
+		rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
+		ln -sf ${rel_lib_prefix}${base_libdir}/$tmp ${D}/${libdir}/libz.so
 	fi
 }
 
-- 
1.9.1


