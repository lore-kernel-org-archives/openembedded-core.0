Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jeffrey.honig@windriver.com>) id 1UBHOc-0003p0-GF
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 05:16:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r212JBIE028396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 18:19:11 -0800 (PST)
Received: from jch-schlepp.wrs.com (172.25.32.253) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Thu, 28 Feb 2013 18:19:10 -0800
Received: from schlepp.honig.net (schlepp.honig.net [127.0.0.1])	by
	jch-schlepp.wrs.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	r212J9Qk003801	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=NOT)	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 21:19:10 -0500
Received: from schlepp.honig.net (jch@localhost)	by schlepp.honig.net
	(8.14.4/8.14.4/Submit) with ESMTP id r212J9AX003798	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 21:19:09 -0500
To: <openembedded-core@lists.openembedded.org>
From: Jeffrey Honig <jeffrey.honig@windriver.com>
Organization: Wind River Systems, Inc.; Trumansburg, NY  USA
X-Mailer: MH-E 8.4+bzr; nmh 1.3; GNU Emacs 24.3.50
Date: Thu, 28 Feb 2013 21:19:09 -0500
Message-ID: <3796.1362104349@schlepp.honig.net>
Sender: <Jeffrey.Honig@windriver.com>
MIME-Version: 1.0
Subject: [oe] [PATCH]: Resolve sysvinit and util-linux conflicting man pages.
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
X-List-Received-Date: Fri, 01 Mar 2013 04:16:37 -0000
Content-Type: text/plain

From: Jeffrey C Honig <jeffrey.honig@windriver.com>

[ CQID: WIND00404316 ]

Use alternatives mechanism to prevent sysvlinux and util-linux
man pages from causing conflicts.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb    |   11 ++++++++++-
 meta/recipes-core/util-linux/util-linux.inc       |    9 +++++++++
 meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 0a11139..e64b67a 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r10"
+PR = "r11"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
@@ -45,6 +45,15 @@ ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
 ALTERNATIVE_${PN}-pidof = "pidof"
 ALTERNATIVE_LINK_NAME[pidof] = "${base_bindir}/pidof"
 
+ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
+
+ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
+ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
+ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
+ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
+ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
+ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
+
 PACKAGES =+ "sysvinit-pidof sysvinit-sulogin"
 FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
 FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 10439c0..c91f4a3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -154,6 +154,15 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 
+ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
+
+ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
+ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
+ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
+ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
+ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
+ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
+
 # There seems to be problem, atleast on nslu2, with these, untill they are
 # fixed the busybox ones have higher priority
 ALTERNATIVE_PRIORITY[hwclock] = "10"
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
index dd95573..f91784b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.22"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.9.5





