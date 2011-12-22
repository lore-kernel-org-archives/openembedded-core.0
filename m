Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdmQZ-0003fv-61
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 18:27:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Dec 2011 09:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89454791"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.57])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2011 09:20:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 17:20:23 +0000
Message-Id: <c87d0a54bb0e9eeea2395f4a2ee1f4d038d2b855.1324574345.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324574345.git.paul.eggleton@linux.intel.com>
References: <cover.1324574345.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324574345.git.paul.eggleton@linux.intel.com>
References: <cover.1324574345.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/rootfs_rpm: handle recommends in query functions
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
X-List-Received-Date: Thu, 22 Dec 2011 17:27:35 -0000

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
1.7.5.4



