Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AFDA979AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 08:41:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2018 01:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,367,1534834800"; d="scan'208";a="271454755"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.232])
	by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2018 01:41:18 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 16:41:11 +0800
Message-Id: <20181011084111.11619-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011084111.11619-1-anuj.mittal@intel.com>
References: <20181011084111.11619-1-anuj.mittal@intel.com>
Subject: [PATCH 3/3] systemd: add ALTERNATIVE for reboot
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
X-List-Received-Date: Thu, 11 Oct 2018 08:41:39 -0000

reboot is provided by busybox too. Add ALTERNATIVE to ensure that there
are no conflicts when both are installed.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 194efb5b94..7ed932141d 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -447,7 +447,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${base_sbindir}/runlevel \
                 ${base_sbindir}/telinit \
                 ${base_sbindir}/resolvconf \
-                ${base_sbindir}/reboot \
+                ${base_sbindir}/reboot.systemd \
                 ${base_sbindir}/init \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
@@ -556,12 +556,15 @@ python __anonymous() {
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
-ALTERNATIVE_${PN} = "resolv-conf"
+ALTERNATIVE_${PN} = "resolv-conf reboot"
 
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
 
+ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
+ALTERNATIVE_PRIORITY[reboot] = "100"
+
 pkg_postinst_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-- 
2.17.1


