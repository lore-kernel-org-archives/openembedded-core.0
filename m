Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UZk3i-0008Nl-MM
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 17:44:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2013 08:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,629,1363158000"; d="scan'208";a="333236752"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.247])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2013 08:26:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 08:26:04 -0700
Message-Id: <1367940364-4345-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH dylan & master] rpm: ensure __mkdir_p matches __mkdir
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
X-List-Received-Date: Tue, 07 May 2013 15:44:07 -0000

They differ at times because one is set from the db_cv_path_mkdir and the other is
found during config time for the host (/usr/bin/mkdir), in the macros we should just
use __mkdir for the __mkdir_p variant.

[YOCTO #4452]

Signed-off-by: Saul Wold <sgw@linux.intel.com>

---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 7d2cba4..24f0d3c 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -359,6 +359,7 @@ FILES_${PN}-staticdev = " \
 do_configure() {
 	# Disable tests!
 	echo "all:" > ${S}/tests/Makefile.am
+	sed -e 's/@__MKDIR_P@/%{__mkdir} -p/' -i ${S}/macros/macros.in
 
 	( cd ${S}; ${S}/autogen.sh )
 
-- 
1.8.1.4



