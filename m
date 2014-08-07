Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3855F7064F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:41:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s77Df2Q1015329
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 06:41:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 06:41:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 06:40:58 -0700
Message-ID: <012b010569b03f8a29bf09ef53444d152d3683de.1407418718.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407418718.git.liezhi.yang@windriver.com>
References: <cover.1407418718.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] kernelshark: fix recompile error
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
make: *** No rule to make target `/path/to/sysroot/4.9.0/include/stddef.h', needed by `parse-events.o'.  Stop.
make: *** Waiting for unfinished jobs....
ERROR: oe_runmake failed

This happens when upgrade gcc from 4.9.0 to 4.9.1, and the
.parse-events.d isn't regenerated when recompile, the content of it are:

[snip]
parse-events.o: /path/to/sysroot/4.9.0/include/stddef.h
[snip]

And Makefile includes the .parse-events.d file if it exists, so there
would be errors when /path/to/sysroot/4.9.0/include/stddef.h doesn't
exist.

Remove .*.d (a few .d files, its Makefile uses this wildcard) will fix
the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index 9af91c9..99de97b 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -13,6 +13,11 @@ SRC_URI_append = "file://kernelshark-fix-syntax-error-of-shell.patch"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
 
+do_compile_prepend() {
+    # Make sure the recompile is OK
+    rm -f ${B}/.*.d
+}
+
 do_install() {
 	oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}" install_gui
 	rm ${D}${bindir}/trace-cmd
-- 
1.7.9.5


