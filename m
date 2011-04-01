Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W18-00056w-CW
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:26 +0200
Received: by gwb11 with SMTP id 11so1296067gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=8DKq7LTivD/RGLQiEedKoBvQw2utHKtJMeL7P0DqOdo=;
	b=Zc0QoJvxx0GeWZoM387LjRf/qvFwRWelL2VTB7JvVYgr+wfyoodtGaCR1vAWimtBjs
	+RnXJsMditxn0l5Y0M/PvdFw/e3kFOA1nrr8sctuOaZpKiRKK5s202RRG9NX/EFvYvA+
	qkv1MlLhoo/oaI2WhQRasqqD/8ug0EYHK9FRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QmJT2eyQ6K8kBWWfRUYxif3GFRL9Cony5zZj/6Tv3lQqmuh4SyLmp1wt2lHC0MRmTZ
	a/pVV5jM56rpYLu+fPfQM1qDfbRS8eAQRoWwCAiuZIuunFUsh1604kSO/60f+4XwHrGi
	7n2Hh/wF2OJEOH5BGGNNzN4svmcXOpQvZ3T6M=
Received: by 10.91.202.13 with SMTP id e13mr3944267agq.33.1301632164953;
	Thu, 31 Mar 2011 21:29:24 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 35sm1898151ano.11.2011.03.31.21.29.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:15 -0700
Message-Id: <95edfecd7cd1e99ac5b901096b729e19d2a63e6d.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 21/46] liboil_0.3.17.bb: Enable x86_64 unaligned memory access
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:26 -0000

Patch imported from OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../liboil-0.3.17/fix-unaligned-whitelist.patch    |   17 +++++++++++++++++
 meta/recipes-support/liboil/liboil_0.3.17.bb       |    6 ++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch

diff --git a/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch b/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
new file mode 100644
index 0000000..79d53b6
--- /dev/null
+++ b/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
@@ -0,0 +1,17 @@
+Upstream: https://bugs.freedesktop.org/show_bug.cgi?id=31358
+
+configure: fix whitelisting of x86_64 unaligned memory access
+
+Fix typo in whitelist so cross-compile works for x86_64.
+
+--- liboil-0.3.17/m4/as-unaligned-access.m4.orig	2009-02-26 14:40:08.000000000 -0500
++++ liboil-0.3.17/m4/as-unaligned-access.m4	2010-11-03 12:19:55.000000000 -0400
+@@ -9,7 +9,7 @@
+         _AS_ECHO_N([(blacklisted) ])
+         as_cv_unaligned_access=no
+ 	;;
+-      i?86*|x86_64|amd64|powerpc*|m68k*|cris*)
++      i?86*|x86_64*|amd64*|powerpc*|m68k*|cris*)
+         _AS_ECHO_N([(whitelisted) ])
+         as_cv_unaligned_access=yes
+ 	;;
diff --git a/meta/recipes-support/liboil/liboil_0.3.17.bb b/meta/recipes-support/liboil/liboil_0.3.17.bb
index fe8a22f..f342a82 100644
--- a/meta/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta/recipes-support/liboil/liboil_0.3.17.bb
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ad80780d9c5205d63481a0184e199a15 \
                     file://testsuite/trans.c;endline=29;md5=380ecd43121fe3dcc0d8d7e5984f283d"
 
 DEPENDS = "glib-2.0"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
-           file://no-tests.patch;patch=1"
+           file://no-tests.patch \
+           file://fix-unaligned-whitelist.patch \
+          "
 
 SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"
 SRC_URI[sha256sum] = "105f02079b0b50034c759db34b473ecb5704ffa20a5486b60a8b7698128bfc69"
-- 
1.7.4.1



