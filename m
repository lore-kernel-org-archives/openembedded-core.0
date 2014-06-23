Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBD1B6FC0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 02:33:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5N2XDjU014867
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jun 2014 19:33:13 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 22 Jun 2014 19:33:13 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jun 2014 10:32:52 +0800
Message-ID: <89ff3aaad229d018851347dcda7d8c0e7cea6429.1403490121.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403490121.git.kai.kang@windriver.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 5/5] iptables: update init script and bb file
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
X-List-Received-Date: Mon, 23 Jun 2014 02:33:12 -0000
Content-Type: text/plain

Update path of command iptables in init script that we put it in
/usr/sbin rather than /sbin. Then update bb file to install init script,
configure and rules files.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/iptables/iptables/iptables.init |  4 ++--
 meta/recipes-extended/iptables/iptables_1.4.21.bb     | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables/iptables.init b/meta/recipes-extended/iptables/iptables/iptables.init
index 01057dd..3f9ce23 100755
--- a/meta/recipes-extended/iptables/iptables/iptables.init
+++ b/meta/recipes-extended/iptables/iptables/iptables.init
@@ -33,8 +33,8 @@ VAR_SUBSYS_IPTABLES=/var/lock/subsys/$IPTABLES
 # only usable for root
 [ $EUID = 0 ] || exit 4
 
-if [ ! -x /sbin/$IPTABLES ]; then
-    echo -n $"${IPTABLES}: /sbin/$IPTABLES does not exist."; warning; echo
+if [ ! -x /usr/sbin/$IPTABLES ]; then
+    echo -n $"${IPTABLES}: /usr/sbin/$IPTABLES does not exist."; warning; echo
     exit 5
 fi
 
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index ba4e8e4..a6fe55f 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -28,6 +28,10 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
+           file://iptables.init \
+           file://iptables-config \
+           file://iptables.rules \
+           file://ip6tables.rules \
           "
 
 SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
@@ -50,3 +54,18 @@ do_configure_prepend() {
 	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
 	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
 }
+
+do_install_append() {
+	install -d -m 755 ${D}${sysconfdir}/init.d
+	install -m 755 ${WORKDIR}/iptables.init ${D}${sysconfdir}/init.d/iptables
+	install -m 755 ${WORKDIR}/iptables.init ${D}${sysconfdir}/init.d/ip6tables
+	sed -i -e 's;iptables;ip6tables;g' -e 's;IPTABLES;IP6TABLES;g' ${D}${sysconfdir}/init.d/ip6tables
+
+	install -d -m 755 ${D}${sysconfdir}/sysconfig
+	install -m 755 ${WORKDIR}/iptables-config ${D}${sysconfdir}/sysconfig
+	install -m 755 ${WORKDIR}/iptables-config ${D}${sysconfdir}/sysconfig/ip6tables-config
+	sed -i -e 's;iptables;ip6tables;g' -e 's;IPTABLES;IP6TABLES;g' ${D}${sysconfdir}/sysconfig/ip6tables-config
+
+	install -m 755 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/sysconfig/iptables
+	install -m 755 ${WORKDIR}/ip6tables.rules ${D}${sysconfdir}/sysconfig/ip6tables
+}
-- 
1.9.1


