Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U8FAp-0003Jf-3G
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 20:17:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1KJ17Co011701
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2013 11:01:07 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 20 Feb 2013 11:01:05 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 13:31:11 -0600
Message-ID: <1361388671-29678-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] rootfs_rpm.bbclass: Reorder feed priority based on multilib image setting
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
X-List-Received-Date: Wed, 20 Feb 2013 19:17:50 -0000
Content-Type: text/plain

[ YOCTO #3915 ]
[ CQID: WIND00404309 ]

When doing a multilib image build, such as bitbake lib32-core-image-sato, the
system needs to reorder the priority level of the feeds.  If it does not
reorder the priorities, then 64-bit items can be selected by the automatic
dependency resolution in Smart.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_rpm.bbclass | 11 ++++++++++-
 meta/classes/rootfs_rpm.bbclass       | 13 +++++++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 00a3ab4..0595aa7 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -55,18 +55,27 @@ populate_sdk_rpm () {
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
 
 	# List must be prefered to least preferred order
+	default_extra_rpm=""
 	INSTALL_PLATFORM_EXTRA_RPM=""
 	for i in ${MULTILIB_PREFIX_LIST} ; do
 		old_IFS="$IFS"
 		IFS=":"
 		set $i
 		IFS="$old_IFS"
+		mlib=$1
 		shift #remove mlib
 		while [ -n "$1" ]; do
-			INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $1"
+			if [ "$mlib" = "${BBEXTENDVARIANT}" ]; then
+				default_extra_rpm="$default_extra_rpm $1"
+			else
+				INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $1"
+			fi
 			shift
 		done
 	done
+	if [ -n "$default_extra_rpm" ]; then
+		INSTALL_PLATFORM_EXTRA_RPM="$default_extra_rpm $INSTALL_PLATFORM_EXTRA_RPM"
+	fi
 	export INSTALL_PLATFORM_EXTRA_RPM
 
 	package_install_internal_rpm
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 5651243..920380e 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -62,18 +62,27 @@ fakeroot rootfs_rpm_do_rootfs () {
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
 
 	# List must be prefered to least preferred order
+	default_extra_rpm=""
 	INSTALL_PLATFORM_EXTRA_RPM=""
 	for i in ${MULTILIB_PREFIX_LIST} ; do
 		old_IFS="$IFS"
 		IFS=":"
 		set $i
 		IFS="$old_IFS"
+		mlib=$1
 		shift #remove mlib
-		while [ -n "$1" ]; do  
-			INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $1"
+		while [ -n "$1" ]; do
+			if [ "$mlib" = "${BBEXTENDVARIANT}" ]; then
+				default_extra_rpm="$default_extra_rpm $1"
+			else
+				INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $1"
+			fi
 			shift
 		done
 	done
+	if [ -n "$default_extra_rpm" ]; then
+		INSTALL_PLATFORM_EXTRA_RPM="$default_extra_rpm $INSTALL_PLATFORM_EXTRA_RPM"
+	fi
 	export INSTALL_PLATFORM_EXTRA_RPM
 
 	package_install_internal_rpm
-- 
1.8.1.2.545.g2f19ada



