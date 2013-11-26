Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9666D76F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:42:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQ8gZfp000153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 00:42:36 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 26 Nov 2013 00:42:35 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2013 16:42:33 +0800
Message-ID: <1385455353-24032-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH] lsof: add contingency for when EGLIBCVERSION is not set
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
X-List-Received-Date: Tue, 26 Nov 2013 08:42:36 -0000
Content-Type: text/plain

From: Paul Gortmaker <paul.gortmaker@windriver.com>

commit 8c38bc022de209187f31952ae02313dd3104f4c6 ("lsof: define
linux C library type when using eglibc") tries to avoid the
built in tests that determine EGLIBC version (since they
are not reliable in cross builds) and handed in the EGLIBCVERSION
directly.  However this is only happening if EGLIBCVERSION is
set.  And that is only true if we are sourcing the include file
meta/conf/distro/include/tcmode-default.inc  -- which we won't
be with custom toolchain.  So we've been implicitly relying on
the broken lsof tests.

So, to ensure we don't end up using the broken lsof tests,
add a contingency for the case where EGLIBCVERSION is not
set.  This will be suitable for a single release, since
the version will be unchanging.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-extended/lsof/lsof_4.87.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
index 5676cd9..582697b 100644
--- a/meta/recipes-extended/lsof/lsof_4.87.bb
+++ b/meta/recipes-extended/lsof/lsof_4.87.bb
@@ -34,6 +34,9 @@ do_configure () {
                 LINUX_CLIB=`echo ${EGLIBCVERSION} |sed -e 's,\.,,g'`
                 LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
                 export LINUX_CLIB
+        else
+                LINUX_CLIB="-DGLIBCV=215"
+                export LINUX_CLIB
         fi
 	yes | ./Configure ${LSOF_OS}
 }
-- 
1.8.3


