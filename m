Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAll-0001pg-3u
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2011 00:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="913034138"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2011 00:24:33 -0700
Message-Id: <f9bd3b00b4e5546b8531469bb953e9fafc9078d6.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 10:46:02 +0800
Date: Fri, 22 Apr 2011  0:24:33 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 04/33] avahi: Upgrade to 0.6.30 (from 0.6.28)
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:13 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This upgrade fix the one security issue:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1002
[YOCTO #975] fixed.

This should be included in the Bernard point-release.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 .../avahi/{avahi_0.6.28.bb => avahi_0.6.30.bb}     |    6 +++---
 .../avahi/files/initscript.patch                   |    2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.28.bb => avahi_0.6.30.bb} (82%)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 6d4b830..b2fa8ca 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -24,7 +24,7 @@ RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
 SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
         file://00avahi-autoipd \
         file://99avahi-autoipd \
-        file://initscript.patch;patch=1"
+        file://initscript.patch"
 
 inherit autotools pkgconfig update-rc.d gettext
 
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.28.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
similarity index 82%
rename from meta/recipes-connectivity/avahi/avahi_0.6.28.bb
rename to meta/recipes-connectivity/avahi/avahi_0.6.30.bb
index 6e034b0..1084c04 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.28.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
 RDEPENDS_avahi-daemon = "sysvinit-pidof"
-PR = "r2"
+PR = "r0"
 
 EXTRA_OECONF += "--disable-gtk3"
 
@@ -15,5 +15,5 @@ FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
 		       ${sysconfdir}/dhcp3/*/avahi-autoipd"
 
-SRC_URI[md5sum] = "d0143a5aa3265019072e53ab497818d0"
-SRC_URI[sha256sum] = "a0d80aac88212b9f9d5331c248091d3c9c9209f0e41985421636ebd14230fc91"
+SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
+SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
diff --git a/meta/recipes-connectivity/avahi/files/initscript.patch b/meta/recipes-connectivity/avahi/files/initscript.patch
index f76a965..193889e 100644
--- a/meta/recipes-connectivity/avahi/files/initscript.patch
+++ b/meta/recipes-connectivity/avahi/files/initscript.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/initscript/debian/avahi-daemon.in b/initscript/debian/avahi-daemon.in
 index 30a2c2f..b5848a8 100755
 --- a/initscript/debian/avahi-daemon.in
-- 
1.7.1



