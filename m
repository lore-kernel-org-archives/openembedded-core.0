Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA2765CD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:41:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s77Df23c026636
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 06:41:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 06:41:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 06:40:57 -0700
Message-ID: <23b2c7b7f2af01df48b3565d263c98d5f95741f0.1407418718.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407418718.git.liezhi.yang@windriver.com>
References: <cover.1407418718.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] kexec-tools: fix recompile error
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
NOTE: make -j 32
make: *** No rule to make target `/path/to/sysroot/4.9.0/include/stddef.h', needed by `kexec/kexec.o'.  Stop.

This happens when upgrade gcc from 4.9.0 to 4.9.1, and the kexec/kexec.d
isn't regenerated when recompile, the content of it are:

[snip]
kexec/kexec.o: /path/to/sysroot/4.9.0/include/stddef.h
[snip]

And Makefile includes the kexec/kexec.d file if it exists, so there
would be errors when /path/to/sysroot/4.9.0/include/stddef.h doesn't
exist.

Remove kexec/kexec.d and other similar files will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools.inc |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index 50b448c..7e3b7ad 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -15,3 +15,14 @@ inherit autotools-brokensep
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux|freebsd.*)'
 
 INSANE_SKIP_${PN} = "arch"
+
+do_compile_prepend() {
+    # Remove the '*.d' file to make sure the recompile is OK
+    for dep in `find ${B} -type f -name '*.d'`; do
+        dep_no_d="`echo $dep | sed 's#.d$##'`"
+        # Remove file.d when there is a file.o
+        if [ -f "$dep_no_d.o" ]; then
+            rm -f $dep
+        fi
+    done
+}
-- 
1.7.9.5


