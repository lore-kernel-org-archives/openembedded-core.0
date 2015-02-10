Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7693965CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 19:08:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1AJ82fw017330
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 11:08:02 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Feb 2015 11:08:01 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Feb 2015 14:07:50 -0500
Message-ID: <1423595270-24814-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Subject: [PATCH] avahi-ui: set S before doing an include ("require").
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
X-List-Received-Date: Tue, 10 Feb 2015 19:08:04 -0000
Content-Type: text/plain

It is unclear when this started, but the build error seen was:

| sed: can't read poky/build/tmp/work/core2-64-poky-linux/avahi-ui/0.6.31-r11.0/avahi-0.6.31/configure.ac: No such file or directory
| WARNING: poky/build/tmp/work/core2-64-poky-linux/avahi-ui/0.6.31-r11.0/temp/run.do_configure.20542:1 exit 2 from
|   sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i poky/build/tmp/work/core2-64-poky-linux/avahi-ui/0.6.31-r11.0/avahi-0.6.31/configure.ac
| ERROR: Function failed: do_configure (log file is located at poky/build/tmp/work/core2-64-poky-linux/avahi-ui/0.6.31-r11.0/temp/log.do_configure.20542)
ERROR: Task 7531 (poky/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb, do_configure) failed with exit code '1'

Note that avahi-ui doesn't have a source pkg of its own and just
uses the avahi one.  So the fail happens because it tries to find
configure in the S path of:

		core2-64-poky-linux/avahi-ui/0.6.31-r11.0
instead of:
		core2-64-poky-linux/avahi/0.6.31-r11.0

This tells us that it is using the autoset value of S instead of
the manually overridden one.  Looking in the bb, we see that the
manual set of S was done _after_ the include; once we move it
to be _before_ the include ("require"), the problem goes away.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index eea4d70fabf1..3000fb85c93b 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
+S = "${WORKDIR}/avahi-${PV}"
+
 require avahi.inc
 
 inherit python-dir pythonnative
@@ -20,8 +22,6 @@ DEPENDS += "avahi gtk+ libglade"
 
 AVAHI_GTK = "--enable-gtk --disable-gtk3"
 
-S = "${WORKDIR}/avahi-${PV}"
-
 PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc python-avahi avahi-discover avahi-discover-standalone"
 
 FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
-- 
2.2.1


