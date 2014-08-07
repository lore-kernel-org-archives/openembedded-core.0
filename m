Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB3265CD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:40:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s77Df1nJ015320
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 06:41:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 06:41:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 06:40:54 -0700
Message-ID: <b8ae4347d122cf08af152190ee0c0897e29325f5.1407418718.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407418718.git.liezhi.yang@windriver.com>
References: <cover.1407418718.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] libnewt: fix recompile error
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
X-List-Received-Date: Thu, 07 Aug 2014 13:41:01 -0000
Content-Type: text/plain

Fixed:
NOTE: make -j 32
make: *** No rule to make target `/path/to/sysroot/4.9.0/include/stddef.h', needed by `test.o'.  Stop.

This happens when upgrade gcc from 4.9.0 to 4.9.1, and the .depend isn't
regenerated when recompile, the content of the .depend are:

[snip]
test.o: /path/to/sysroot/4.9.0/include/stddef.h
[snip]

And Makefile includes the .depend file if it exists, so there would be
errors when /path/to/sysroot/4.9.0/include/stddef.h doesn't exist.

Remove .depend will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/newt/libnewt_0.52.17.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.17.bb b/meta/recipes-extended/newt/libnewt_0.52.17.bb
index 09b017e..28d5cf1 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.17.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.17.bb
@@ -46,4 +46,9 @@ do_configure_prepend() {
     sh autogen.sh
 }
 
+do_compile_prepend() {
+    # Make sure the recompile is OK
+    rm -f ${B}/.depend
+}
+
 FILES_whiptail = "${bindir}/whiptail"
-- 
1.7.9.5


