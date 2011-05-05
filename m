Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtRX-0002ip-U5
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 09:57:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 May 2011 00:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="430914749"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 05 May 2011 00:55:06 -0700
Message-Id: <ace183894a5319cd73c94fd2653bbe52f29dca0b.1304581769.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Wed, 27 Apr 2011 17:34:17 +0100
Date: Thu, 05 May 2011  0:55:06 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 04/26] initscripts: remove -i from halt/reboot arguments and allow override
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
X-List-Received-Date: Thu, 05 May 2011 07:57:52 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Introduces a variable HALTARGS which specifies the arguments sent to
halt and reboot, and sets the default value to "-d -f", dropping the
previous -i (shut down all network interfaces before halt/reboot, which
causes a freeze with NFS root.)

Fixes [YOCTO #997].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/halt |    2 +-
 .../initscripts/initscripts-1.0/reboot             |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    9 ++++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/halt b/meta/recipes-core/initscripts/initscripts-1.0/halt
index 609b793..021d9be 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/halt
+++ b/meta/recipes-core/initscripts/initscripts-1.0/halt
@@ -24,6 +24,6 @@ then
 	hddown=""
 fi
 
-halt -d -f -i -p $hddown
+halt SED_HALTARGS -p $hddown
 
 : exit 0
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/reboot b/meta/recipes-core/initscripts/initscripts-1.0/reboot
index 4c55885..cf32e95 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/reboot
+++ b/meta/recipes-core/initscripts/initscripts-1.0/reboot
@@ -12,4 +12,4 @@
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
 echo -n "Rebooting... "
-reboot -d -f -i
+reboot SED_HALTARGS
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index d990925..720c252 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "makedevs"
 RDEPENDS_${PN} = "makedevs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r124"
+PR = "r125"
 
 SRC_URI = "file://functions \
            file://halt \
@@ -38,6 +38,13 @@ SRC_URI_append_arm = " file://alignment.sh"
 
 KERNEL_VERSION = ""
 
+HALTARGS ?= "-d -f"
+
+do_configure() {
+	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/halt
+	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/reboot
+}
+
 do_install () {
 #
 # Create directories and install device independent scripts
-- 
1.7.1.1



