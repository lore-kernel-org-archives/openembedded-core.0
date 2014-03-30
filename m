Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3D206E7CC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 20:48:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2UKmkF1002605
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 13:48:46 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 30 Mar 2014 13:48:45 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 30 Mar 2014 13:48:45 -0700
Message-ID: <1396212525-17229-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] openssh: build without libbsd
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
X-List-Received-Date: Sun, 30 Mar 2014 20:48:46 -0000
Content-Type: text/plain

We do not DEPEND on libbsd, so we do not want to
build with it just because libutil.h is found by configure.
As noted in the patch, specifying --disable-libutil to
configure does not work, so we provide "cached" configure
variables.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
index 247309c..99183a0 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -69,6 +69,12 @@ EXTRA_OECONF = "--with-rand-helper=no \
                 --sysconfdir=${sysconfdir}/ssh \
                 --with-xauth=/usr/bin/xauth"
 
+# Since we do not depend on libbsd, we do not want configure to use it
+# just because it finds libutil.h.  But, specifying --disable-libutil
+# causes compile errors, so...
+#
+CACHED_CONFIGUREVARS += "ac_cv_header_bsd_libutil_h=no ac_cv_header_libutil_h=no"
+
 # This is a workaround for uclibc because including stdio.h
 # pulls in pthreads.h and causes conflicts in function prototypes.
 # This results in compilation failure, so unless this is fixed,
-- 
1.7.3.4


