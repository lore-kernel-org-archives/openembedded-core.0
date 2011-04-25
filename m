Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQz4-0003y8-P8
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:58:11 +0200
Received: by mail-px0-f178.google.com with SMTP id 1so1934504pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=/w1Uo1pGeoQCrcGbGEo1rld/Kvd4QFpHi+IYCw6LaLQ=;
	b=kxHzLRs/Noc9rlHDSszVThQnk/Z53tVGN7Z+rfy9+LLHDmpT5lxul9ZZmFt/Px0WHI
	aI/PA3sJFpbqOTonVa5zV4TdZwxPEmR1pviOUOd6yBsOvgKM/y8wgXUKld2TQ8GkOY9a
	OdNnocwuugJB1eF7znFlyLj3CjLKymtd/h9kc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HoMBfDbFSM5G572YH4NGp+y3bK3P1jMOKVcFm0jn9/5gzvbJMZfjoPifJJi+KFBrjP
	yKrexs34QuEM+tOJHrkLCRyrBTz1Xe/bUYLBeA27adwiLH8BxD/czratTG6sEbDZIC84
	NHhBAK7GRahWo+xKAEWqCtTy504cFqsb71fo4=
Received: by 10.143.178.10 with SMTP id f10mr2817743wfp.108.1303757744081;
	Mon, 25 Apr 2011 11:55:44 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z10sm8092937wfj.12.2011.04.25.11.55.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:38 -0700
Message-Id: <5215badec0007355e957daf9085a155e9bf87779.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 16/17] linux-tools.inc: Dummify do_compile_perf and do_install_perf for uclibc
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
X-List-Received-Date: Mon, 25 Apr 2011 18:58:11 -0000

Perf wants elfutils and elfutils on uclibc does not work due to
its usage of obstack_printf functionality missing from uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-tools.inc |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index d64c9be..ef81650 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -1,6 +1,11 @@
 # included by kernel recipes if they want to build/provide
 # perf functionality from their tree.
-
+do_compile_perf_libc-uclibc () {
+	:
+}
+do_install_perf_libc-uclibc () {
+	:
+}
 do_compile_perf() {
 	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} NO_NEWT=1 NO_DWARF=1
 }
@@ -14,6 +19,10 @@ do_install_perf() {
 addtask compile_perf after do_compile before do_install
 addtask install_perf after do_install before do_package
 
-do_compile_perf[depends] =  "virtual/libc:do_populate_sysroot"
-do_compile_perf[depends] =+ "elfutils:do_populate_sysroot"
-RDEPENDS_perf += "python perl elfutils"
+
+PERFDEPENDS = "virtual/libc:do_populate_sysroot elfutils:do_populate_sysroot"
+PERFDEPENDS_libc-uclibc = ""
+PERFRDEPENDS = "python perl elfutils"
+PERFRDEPENDS_libc-uclibc = ""
+do_compile_perf[depends] = "${PERFDEPENDS}"
+RDEPENDS_perf += "${PERFRDEPENDS}"
-- 
1.7.4.1



