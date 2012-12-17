Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TkX1n-00046J-Hk
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 10:30:27 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2012 01:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,299,1355126400"; d="scan'208";a="265310960"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2012 01:15:46 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:16:17 +0200
Message-Id: <a8da5e399939e72526f228aaa8a61e0454ad4a9a.1355732782.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
Subject: [PATCH 1/7] bitbake.conf: add nonarch_base_lib variable
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
X-List-Received-Date: Mon, 17 Dec 2012 09:30:28 -0000

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



