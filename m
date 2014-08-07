Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 908D170276
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:41:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s77Df1dr015324
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 06:41:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 06:41:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 06:40:56 -0700
Message-ID: <226b1ec38d61574b52cbe6c932a4e25ac99b243b.1407418718.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407418718.git.liezhi.yang@windriver.com>
References: <cover.1407418718.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] logrotate: fix recompile error
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
make: *** No rule to make target `/path/to/sysroot/4.9.0/include/stddef.h', needed by `logrotate.o'.  Stop.

This happens when upgrade gcc from 4.9.0 to 4.9.1, and the .depend isn't
regenerated when recompile, the content of the .depend are:

[snip]
logrotate.o: /path/to/sysroot/4.9.0/include/stddef.h
[snip]

And Makefile includes the .depend file if it exists, so there would be
errors when /path/to/sysroot/4.9.0/include/stddef.h doesn't exist.

Remove .depend will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/logrotate/logrotate_3.8.7.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
index b386b85..3a6a228 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
@@ -18,6 +18,11 @@ SRC_URI[sha256sum] = "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00
 
 EXTRA_OEMAKE = ""
 
+do_compile_prepend() {
+    # Make sure the recompile is OK
+    rm -f ${B}/.depend
+}
+
 do_install(){
     oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
-- 
1.7.9.5


