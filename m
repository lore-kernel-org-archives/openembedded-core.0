Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CEF2777351
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543536"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:30 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:12 +0200
Message-Id: <1486734151-28331-5-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: [PATCH 04/23] base-files: support merged /usr
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:30 -0000

From: Joshua Lock <joshua.g.lock@intel.com>

When the usrmerge DISTRO_FEATURE is enabled don't create /bin, /lib{32,64}
and /sbin. Instead, link them to the equivalent directories in /usr

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index d138005..9e2c0b7 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -32,8 +32,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 docdir_append = "/${P}"
 dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
 dirs2775 = ""
-dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
-           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
+dirs755 = "/boot /dev ${sysconfdir} ${sysconfdir}/default \
+           ${sysconfdir}/skel /mnt /proc ${ROOT_HOME} /run \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
@@ -42,8 +42,8 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
            /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
            ${localstatedir}/volatile/log \
-           /home ${prefix}/src ${localstatedir}/local \
-           /media"
+           /home ${prefix}/src ${localstatedir}/local /media \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '', '/bin /lib /sbin', d)}"
 
 dirs755-lsb = "/srv  \
                ${prefix}/local ${prefix}/local/bin ${prefix}/local/games \
@@ -105,6 +105,21 @@ do_install () {
 		ln -sf volatile/$d ${D}${localstatedir}/$d
 	done
 
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '1', '0', d)}" = "1" ] ; then
+		lnr ${D}${base_bindir} ${D}/bin
+		lnr ${D}${base_sbindir} ${D}/sbin
+		lnr ${D}${base_libdir} ${D}/${baselib}
+		if [ "${baselib}" != "lib" ]; then
+			lnr ${D}${nonarch_base_libdir} ${D}/lib
+		fi
+                # create base links for multilibs
+		multi_libdirs="${@d.getVar('MULTILIB_VARIANTS')}"
+		for d in $multi_libdirs; do
+			install -m 0755 -d ${D}/${exec_prefix}/$d
+			lnr ${D}/${exec_prefix}/$d ${D}/$d
+		done
+	fi
+
 	ln -snf ../run ${D}${localstatedir}/run
 	ln -snf ../run/lock ${D}${localstatedir}/lock
 
-- 
2.7.4


