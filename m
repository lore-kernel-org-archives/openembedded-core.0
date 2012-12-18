Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tkvtr-0006aP-2w
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:03:55 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 03:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="258889612"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2012 03:48:08 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 13:48:41 +0200
Message-Id: <a7bd5cfbd554648ae549d869c10dba0f6ecfd977.1355830852.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
Subject: [PATCH v2 1/7] bitbake.conf: add nonarch_base_lib variable
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
X-List-Received-Date: Tue, 18 Dec 2012 12:03:55 -0000

Adapt stagging.bbclass to this change

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/staging.bbclass | 4 ++++
 meta/conf/bitbake.conf       | 1 +
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 82624cb..1a078b4 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -50,6 +50,10 @@ sysroot_stage_dirs() {
 	then
 		sysroot_stage_libdir $from${base_libdir} $to${base_libdir}
 	fi
+	if [ -d $from${nonarch_base_libdir} ]
+	then
+		sysroot_stage_libdir $from${nonarch_base_libdir} $to${nonarch_base_libdir}
+	fi
 	sysroot_stage_dir $from${datadir} $to${datadir}
 	# We don't care about docs/info/manpages/locales
 	rm -rf $to${mandir}/ $to${docdir}/ $to${infodir}/ ${to}${datadir}/locale/
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index be3bfc2..a2d3abe 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -21,6 +21,7 @@ export exec_prefix = "/usr"
 export base_bindir = "${base_prefix}/bin"
 export base_sbindir = "${base_prefix}/sbin"
 export base_libdir = "${base_prefix}/${baselib}"
+export nonarch_base_libdir = "${base_prefix}/lib"
 
 # Architecture independent paths
 export datadir = "${prefix}/share"
-- 
1.7.11.7



