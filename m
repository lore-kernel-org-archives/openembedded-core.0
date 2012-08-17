Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T2QwC-00052f-RR
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 20:06:25 +0200
Received: from mail110-va3-R.bigfish.com (10.7.14.247) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Fri, 17 Aug 2012 17:54:25 +0000
Received: from mail110-va3 (localhost [127.0.0.1])	by
	mail110-va3-R.bigfish.com (Postfix) with ESMTP id 1014A2047F	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:54:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail110-va3 (localhost.localdomain [127.0.0.1]) by mail110-va3
	(MessageSwitch) id 1345226059915123_22901;
	Fri, 17 Aug 2012 17:54:19 +0000 (UTC)
Received: from VA3EHSMHS003.bigfish.com (unknown [10.7.14.250])	by
	mail110-va3.bigfish.com (Postfix) with ESMTP id 181013E013B	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:54:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS003.bigfish.com
	(10.7.99.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 17 Aug 2012 17:54:12 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Fri, 17 Aug 2012 12:54:11 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7HHs7Yu003779 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 10:54:11 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 12:54:07 -0500
Message-ID: <1345226047-25896-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] cross-localedef-native_2.16.bb: fix for CentOS 5.X
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
X-List-Received-Date: Fri, 17 Aug 2012 18:06:25 -0000
Content-Type: text/plain

| gcc -isystem/home/mattsm/git/poky/build-master/tmp/sysroots/x86_64-linux/usr/include -isystem/home/mattsm/git/poky/build-master/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DNOT_IN_libc=1 -DNO_SYSCONF -DNO_UNCOMPRESS -DLOCALE_PATH='"/usr/local/lib/locale:/usr/local/share/i18n"' -DLOCALEDIR='"/usr/local/lib/locale"' -DLOCALE_ALIAS_PATH='"/usr/local/share/locale"' -DCHARMAP_PATH='"/usr/local/share/i18n/charmaps"' -DREPERTOIREMAP_PATH='"/usr/local/share/i18n/repertoiremaps"' -DLOCSRCDIR='"/usr/local/share/i18n/locales"' -DNOT_IN_libc -DIN_GLIBC_LOCALEDEF -Iglibc/locale/programs -I./include -Iglibc/locale -I. -I. -include ./include/always.h -Wall -Wno-format -c -o ld-address.o glibc/locale/programs/ld-address.c
| In file included from glibc/locale/programs/localedef.h:24,
|                  from glibc/locale/programs/ld-address.c:30:
| ./include/locale.h:6: error: conflicting types for 'locale_t'
| glibc/locale/xlocale.h:42: error: previous declaration of 'locale_t' was here
| make: *** [ld-address.o] Error 1
| ERROR: oe_runmake failed

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../eglibc/cross-localedef-native_2.16.bb          |    9 +++++++--
 .../eglibc/eglibc-2.16/fix_for_centos_5.8.patch    |   18 ++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
index 47f0834..a79a276 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
@@ -13,10 +13,15 @@ LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=98a1128c4b58120182cbea3b1752d
 inherit native
 inherit autotools
 
-PR = "r0"
+# pick up an eglibc-2.16 patch
+FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
+
+PR = "r1"
 SRCREV="19383"
 EGLIBC_BRANCH="eglibc-2_16"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
+	   file://fix_for_centos_5.8.patch;patchdir=.. \
+	  "
 S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
 
 do_unpack_append() {
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch b/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
new file mode 100644
index 0000000..7618c99
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Inappropriate [other]
+
+This is a hack to fix building the locale bits on an older
+CentOs 5.X machine
+
+Index: eglibc-2_16/libc/locale/programs/config.h
+===================================================================
+--- eglibc-2_16.orig/libc/locale/programs/config.h
++++ eglibc-2_16/libc/locale/programs/config.h
+@@ -19,6 +19,8 @@
+ #ifndef _LD_CONFIG_H
+ #define _LD_CONFIG_H	1
+ 
++#define DUMMY_LOCALE_T
++
+ /* Use the internal textdomain used for libc messages.  */
+ #define PACKAGE _libc_intl_domainname
+ #ifndef VERSION
-- 
1.7.9.7




