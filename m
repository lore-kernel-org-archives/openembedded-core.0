Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6F15779F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 18:55:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7FItZbl022926
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:55:35 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 11:55:34 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 11:55:34 -0700
Message-ID: <20170815185534.118522-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] systemd: Fix rootfs transaction error when PACKAGECONFIG has polkit
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
X-List-Received-Date: Tue, 15 Aug 2017 18:55:35 -0000
Content-Type: text/plain

The systemd 234 added some files to the polkit directory and the
directory the files live in must be owned by the polkitd user, else
you will receive the following error when the rootfs is being
assembled:

Error: Transaction check error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs of polkit-0.113-r0.15.core2_64 and systemd-1:234-r0.0.core2_64

The fix similar to other packages such as libvirt where the user must
exist and the directory must be created with the proper attributes.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index ad7fc99b90..4560cf4175 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -245,6 +245,14 @@ do_install() {
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
+
+       # If polkit is setup fixup permissions and ownership
+       if [ "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit', '', d)}" = "polkit" ] ; then
+           if [ -d ${D}${datadir}/polkit-1/rules.d ] ; then
+               chmod 700 ${D}${datadir}/polkit-1/rules.d
+               chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+           fi
+       fi
 }
 
 do_install_ptest () {
@@ -308,6 +316,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--sy
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
 USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
 
-- 
2.11.0


