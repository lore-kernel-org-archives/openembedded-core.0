Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxqv-0004Kv-Td
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752115"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:18:49 -0800
Message-Id: <b6787f5d6e181d8c39cce7b050e261d1a1d1b075.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 003/113] classes/rootfs_rpm: handle recommends in query functions
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:06 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Implement list_package_recommends() for rpm, and filter out the
"suggests" (RPM's equivalent of recommends) in list_package_depends().

Respectively, these changes fix buildhistory handling of recommends for
RPM (so that they are included in the image graphs) and also prevents
failures during do_rootfs with buildhistory enabled if a recommend is
unsatisfied.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 5fd45d7..966b074 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -174,7 +174,9 @@ get_package_filename() {
 list_package_depends() {
 	pkglist=`list_installed_packages`
 
-	for req in `${RPM_QUERY_CMD} -q --qf "[%{REQUIRES}\n]" $1`; do
+	# REQUIRE* lists "soft" requirements (which we know as recommends and RPM refers to
+	# as "suggests") so filter these out with the help of awk
+	for req in `${RPM_QUERY_CMD} -q --qf "[%{REQUIRENAME} %{REQUIREFLAGS}\n]" $1 | awk '{ if( and($2, 0x80000) == 0) print $1 }'`; do
 		if echo "$req" | grep -q "^rpmlib" ; then continue ; fi
 
 		realpkg=""
@@ -193,7 +195,7 @@ list_package_depends() {
 }
 
 list_package_recommends() {
-	:
+	${RPM_QUERY_CMD} -q --suggests $1
 }
 
 install_all_locales() {
-- 
1.7.6.4



