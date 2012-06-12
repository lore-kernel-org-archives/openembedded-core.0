Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SeSyo-0002Fw-Ft
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:26:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jun 2012 08:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164690808"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.133])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2012 08:15:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 08:15:26 -0700
Message-Id: <1339514126-23855-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 1/1] busybox: Add check for wifi/bluetooth to enable rfkill
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
X-List-Received-Date: Tue, 12 Jun 2012 15:26:02 -0000

rfkill is a usefull tool when you have a device with bluetooth and wifi enabled

[YOCTO #2494]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 5b83d32..83b25b4 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -57,6 +57,11 @@ def features_to_busybox_settings(d):
 	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
 	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
+	busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
+	busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, rem)
+	machine_features = d.getVar('MACHINE_FEATURES', True).split()
+	busybox_cfg('wifi', machine_features, 'CONFIG_RFKILL', cnf, rem)
+	busybox_cfg('bluetooth', machine_features, 'CONFIG_RFKILL', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_uclibc_settings(d)}
-- 
1.7.7.6



