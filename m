Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1TlXFd-00061m-GH
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 04:56:54 +0100
Received: from mail5-db3-R.bigfish.com (10.3.81.241) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Thu, 20 Dec 2012 03:11:55 +0000
Received: from mail5-db3 (localhost [127.0.0.1])	by mail5-db3-R.bigfish.com
	(Postfix) with ESMTP id 1381846024D	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 03:11:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1de0h1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1155h)
Received: from mail5-db3 (localhost.localdomain [127.0.0.1]) by mail5-db3
	(MessageSwitch) id 1355973112727794_6193;
	Thu, 20 Dec 2012 03:11:52 +0000 (UTC)
Received: from DB3EHSMHS021.bigfish.com (unknown [10.3.81.241])	by
	mail5-db3.bigfish.com (Postfix) with ESMTP id AC20644014B	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 03:11:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS021.bigfish.com
	(10.3.87.157) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 20 Dec 2012 03:11:51 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Thu, 20 Dec 2012 03:11:50 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	qBK3BnGQ006890; Wed, 19 Dec 2012 20:11:49 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 21:11:49 -0600
Message-ID: <1355973109-1967-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 03:56:55 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

libm-err-tab.pl will parse all the files named "libm-test-ulps"
in the given dir recursively. To avoid parsing the one in
${S}/.pc/ (it does exist after eglibc adds aarch64 support,
${S}/.pc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch/ports/sysdeps/
aarch64/libm-test-ulps), run libm-err-tab.pl with specific dirs
in ${S}.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |   36 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
new file mode 100644
index 0000000..a8463ea
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -0,0 +1,36 @@
+From 713d822908d1b2ae8403af7f9375c7054ed3dd49 Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Wed, 19 Dec 2012 04:39:57 -0600
+Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+
+libm-err-tab.pl will parse all the files named "libm-test-ulps"
+in the given dir recursively. To avoid parsing the one in
+${S}/.pc/ (it does exist after eglibc adds aarch64 support,
+${S}/.pc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch/ports/sysdeps/
+aarch64/libm-test-ulps), run libm-err-tab.pl with specific dirs
+in ${S}.
+
+Upstream-Status: inappropriate [OE specific]
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ manual/Makefile |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/manual/Makefile b/manual/Makefile
+index 6fddff0..7af242e 100644
+--- a/manual/Makefile
++++ b/manual/Makefile
+@@ -109,7 +109,8 @@ $(objpfx)libm-err.texi: $(objpfx)stamp-libm-err
+ $(objpfx)stamp-libm-err: libm-err-tab.pl $(wildcard $(foreach dir,$(sysdirs),\
+ 						     $(dir)/libm-test-ulps))
+ 	pwd=`pwd`; \
+-	$(PERL) $< $$pwd/.. > $(objpfx)libm-err-tmp
++	$(PERL) $< $$pwd/../ports > $(objpfx)libm-err-tmp
++	$(PERL) $< $$pwd/../sysdeps >> $(objpfx)libm-err-tmp
+ 	$(move-if-change) $(objpfx)libm-err-tmp $(objpfx)libm-err.texi
+ 	touch $@
+ 
+-- 
+1.7.9.7
+
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index c35d94c..2dcaceb 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r19"
+PR = "r20"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2;name=tarball \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
@@ -32,6 +32,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21
            http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0003-Adding-AArch64-support-to-elf-elf.h.patch;name=patch3 \
            file://tzselect-sh.patch \
            file://tzselect-awk.patch \
+           file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
           "
 
 SRC_URI[tarball.md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
-- 
1.7.9.7




