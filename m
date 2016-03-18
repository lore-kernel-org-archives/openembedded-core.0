Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4440465C8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 12:19:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2ICJDOC025283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 05:19:13 -0700
Received: from obsrwr.corp.ad.wrs.com (128.224.125.134) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 18 Mar 2016 05:19:12 -0700
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Mar 2016 14:21:25 +0200
Message-ID: <1458303685-16358-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dhcpd: create dhcpd user for dhcp dameon
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
X-List-Received-Date: Fri, 18 Mar 2016 12:19:14 -0000
Content-Type: text/plain

This patch enables the functionality for dhcpd service to be started
with dhcp uid and gid.

Test steps:

Step 1: Assign ip to interface
ifconfig eth0 192.168.1.1

Step 2: Edit /etc/dhcp/dhcpd.conf:
default-lease-time 600;
max-lease-time 7200;
option subnet-mask 255.255.255.0;
subnet 192.168.1.0 netmask 255.255.255.0 {
        option broadcast-address 192.168.1.255;
        range 192.168.1.88 192.168.1.88;
        option routers 192.168.1.0;
}

Step 3: Edit /etc/default/dhcp-server:
INTERFACES="eth0"

Step 4: Check uid and gid of running dhcpd process
$ ps -eo user:19,group:19,cmd | grep dhcpd
dhcp        dhcp        /usr/sbin/dhcpd eth0 -user dhcp -group dhcp

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc          | 6 +++++-
 meta/recipes-connectivity/dhcp/files/init-server | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 9c4233b..5703f1e 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -24,7 +24,10 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
 UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
-inherit autotools systemd
+inherit autotools systemd useradd
+
+USERADD_PACKAGES = "${PN}-server"
+USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir /var/run/${PN} --shell /bin/false --user-group ${PN}"
 
 SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay"
 SYSTEMD_SERVICE_${PN}-server = "dhcpd.service dhcpd6.service"
@@ -39,6 +42,7 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
                 --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
                 --with-libbind=${STAGING_LIBDIR}/ \
+		--enable-paranoia \
                "
 
 do_install_append () {
diff --git a/meta/recipes-connectivity/dhcp/files/init-server b/meta/recipes-connectivity/dhcp/files/init-server
index 34c2085..5e693ad 100644
--- a/meta/recipes-connectivity/dhcp/files/init-server
+++ b/meta/recipes-connectivity/dhcp/files/init-server
@@ -20,7 +20,7 @@ case "$1" in
 		echo -n "Starting DHCP server: "
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
 		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases	
-		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $INTERFACES
+		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $INTERFACES -user dhcp -group dhcp
 		echo "."
 		;;
 	stop)
-- 
1.9.1


