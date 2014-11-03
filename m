Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF9E65C87
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 07:38:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA37c0ji023814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Nov 2014 23:38:00 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 2 Nov 2014 23:38:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<qi.chen@windriver.com>
Date: Mon, 3 Nov 2014 15:37:55 +0800
Message-ID: <afef7088ee50cfc2be2d08f16ddd8fe087a1c490.1415000039.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415000039.git.hongxu.jia@windriver.com>
References: <cover.1415000039.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: add network config while networkd supported
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
X-List-Received-Date: Mon, 03 Nov 2014 07:38:02 -0000
Content-Type: text/plain

While networkd supported, we add network config which starts
dhcp by default.

And the customers could edit it according their own requirements.
(dhcp or static ip...)

It refers:
https://wiki.archlinux.org/index.php/systemd-networkd

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/systemd/systemd/oe-core.network | 8 ++++++++
 meta/recipes-core/systemd/systemd_216.bb          | 6 ++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/oe-core.network

diff --git a/meta/recipes-core/systemd/systemd/oe-core.network b/meta/recipes-core/systemd/systemd/oe-core.network
new file mode 100644
index 0000000..fcaefc2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/oe-core.network
@@ -0,0 +1,8 @@
+[Match]
+Name=eth*
+
+[Network]
+DHCP=v4
+
+[DHCPv4]
+UseHostname=false
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 6d3e47f..dae1cb8 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -37,6 +37,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
+           file://oe-core.network \
            ${@bb.utils.contains('PACKAGECONFIG', 'resolved', '', 'file://0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch', d)} \
           "
 
@@ -137,6 +138,11 @@ do_install() {
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 
+	# While networkd enabled, it start dhcp by default
+	if ${@bb.utils.contains('PACKAGECONFIG','networkd','true','false',d)}; then
+		install -m 0755 ${WORKDIR}/oe-core.network ${D}${sysconfdir}/systemd/network
+	fi
+
 	# Create symlinks for systemd-update-utmp-runlevel.service
 	install -d ${D}${systemd_unitdir}/system/graphical.target.wants
 	install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
-- 
1.9.1


