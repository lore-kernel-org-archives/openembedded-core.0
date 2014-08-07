Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC6E270A36
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:41:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s77Df3UT015332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 06:41:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 06:41:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 06:41:00 -0700
Message-ID: <d895646f84514037ac6db0cf32f45bb137f566a8.1407418718.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407418718.git.liezhi.yang@windriver.com>
References: <cover.1407418718.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] syslinux: fix reinstall error
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
X-List-Received-Date: Thu, 07 Aug 2014 13:41:03 -0000
Content-Type: text/plain

Fixed:
make: *** No rule to make target `/path/to/sysroot/4.9.0/include/stdarg.h', needed by `cpio.o'.  Stop.
make: *** Waiting for unfinished jobs....
ERROR: oe_runmake failed

This happens when upgrade gcc from 4.9.0 to 4.9.1, and the .cpio.o.d isn't
regenerated when recompile (the compile happens when do_install), the content
of it are:

[snip]
cpio.o: /path/to/sysroot/4.9.0/include/stdarg.h
[snip]

And Makefile includes the .cpio.o.d file if it exists, so there would be
errors when /path/to/sysroot/4.9.0/include/stdarg.h doesn't exist.

Remove .*.d (a few .d files, its Makefile uses this wildcard) will fix
the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.01.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index e8a1fd4..2377cc0 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -45,6 +45,10 @@ do_configure() {
 }
 
 do_compile() {
+	# Make sure the recompile is OK.
+	# Though the ${B} should always exist, still check it before find and rm.
+	[ -d "${B}" ] && find ${B} -name '.*.d' -type f -exec rm -f {} \;
+
 	# Rebuild only the installer; keep precompiled bootloaders
 	# as per author's request (doc/distrib.txt)
 	oe_runmake CC="${CC} ${CFLAGS}" LDFLAGS="${LDFLAGS}" firmware="bios" installer
-- 
1.7.9.5


