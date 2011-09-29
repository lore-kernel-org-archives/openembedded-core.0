Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98RV-0000XN-W9
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:41:54 +0200
Received: from mail38-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:16 +0000
Received: from mail38-tx2 (localhost.localdomain [127.0.0.1])	by
	mail38-tx2-R.bigfish.com (Postfix) with ESMTP id 8CA635180BD	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:16 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail38-tx2 (localhost.localdomain [127.0.0.1]) by mail38-tx2
	(MessageSwitch) id 1317270076416845_23011;
	Thu, 29 Sep 2011 04:21:16 +0000 (UTC)
Received: from TX2EHSMHS022.bigfish.com (unknown [10.9.14.242])	by
	mail38-tx2.bigfish.com (Postfix) with ESMTP id 567481750050	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS022.bigfish.com
	(10.9.99.122) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:16 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:15 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAL4024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:15 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:09 -0500
Message-ID: <1317270070-14250-15-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 15/16] Fix sysklogd build on e500v2 cores
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
X-List-Received-Date: Thu, 29 Sep 2011 04:41:54 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../sysklogd/files/no-vectorization.patch          |   20 ++++++++++++++++++++
 meta/recipes-extended/sysklogd/sysklogd.inc        |    2 ++
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb     |    2 +-
 3 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/sysklogd/files/no-vectorization.patch

diff --git a/meta/recipes-extended/sysklogd/files/no-vectorization.patch b/meta/recipes-extended/sysklogd/files/no-vectorization.patch
new file mode 100644
index 0000000..c1cc042
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/no-vectorization.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate
+
+The compiler should not be generating vectorized instructions on this target.
+This is a work around until I can determine why this is occuring on this
+particular recipe
+
+Index: sysklogd-1.5/Makefile
+===================================================================
+--- sysklogd-1.5.orig/Makefile
++++ sysklogd-1.5/Makefile
+@@ -20,7 +20,8 @@
+ CC= gcc
+ #SKFLAGS= -g -DSYSV -Wall
+ #LDFLAGS= -g
+-SKFLAGS= $(RPM_OPT_FLAGS) -O3 -DSYSV -fomit-frame-pointer -Wall -fno-strength-reduce
++SKFLAGS= $(RPM_OPT_FLAGS) -O3 -DSYSV -fomit-frame-pointer -Wall -fno-strength-reduce \
++	-fno-tree-vectorize
+ # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
+ # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
+ # $(shell getconf LFS_SKFLAGS)
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 891dd3b..0b84dac 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -22,6 +22,8 @@ SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar
            file://syslog.conf \
            "
 
+SRC_URI_append_e500v2 = " file://no-vectorization.patch"
+
 INITSCRIPT_NAME = "syslog"
 CONFFILES_${PN} = "${sysconfdir}/syslog.conf.${PN}"
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb b/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
index f17c5a2..187c9f4 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
@@ -1,5 +1,5 @@
 require sysklogd.inc
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "e053094e8103165f98ddafe828f6ae4b"
 SRC_URI[sha256sum] = "6169b8e91d29288e90404f01462b69e7f2afb1161aa419826fe4736c7f9eb773"
-- 
1.7.6.1




