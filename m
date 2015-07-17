Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 230A065CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 06:33:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H6XPNL005754
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:33:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 16 Jul 2015 23:33:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jul 2015 14:31:49 +0800
Message-ID: <1437114709-26291-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][resend][v2] dhcp: make dhclient to get configuration for other programs
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
X-List-Received-Date: Fri, 17 Jul 2015 06:33:27 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Make dhclient to run /etc/dhcp/dhclient.d/*.sh, and get the configuration
for ntp, nis or other programes

These codes are from redhat rpm package.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../dhcp/dhcp/dhcp-add-exec-script-function.patch  | 101 +++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |   1 +
 meta/recipes-connectivity/dhcp/files/dhclient.conf |   1 +
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch b/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch
new file mode 100644
index 0000000..73b3ce4
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch
@@ -0,0 +1,101 @@
+[PATCH] dhcp: add exec script function
+
+Upstream-Statue: Pending
+
+Make dhclient to run /etc/dhcp/dhclient.d/*.sh, and get the configuration
+for ntp, nis or other programes
+
+These codes are from redhat rpm packages.
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ client/scripts/linux | 25 ++++++++++++++++++++++++-
+ 1 file changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 232a0aa..bdb5e22 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -24,6 +24,8 @@
+ 
+ # 'ip' just looks too weird.  /sbin/ip looks less weird.
+ ip=/sbin/ip
++ETCDIR="/etc/dhcp"
++export SAVEDIR=/var/lib/dhclient
+ 
+ make_resolv_conf() {
+   if [ x"$new_domain_name_servers" != x ]; then
+@@ -80,6 +82,20 @@ exit_with_hooks() {
+   exit $exit_status
+ }
+ 
++execute_client_side_configuration_scripts() {
++# execute any additional client side configuration scripts we have
++    if [ "${1}" == "config" ] || [ "${1}" == "restore" ]; then
++        for f in ${ETCDIR}/dhclient.d/*.sh ; do
++            if [ -x ${f} ]; then
++                subsystem="${f%.sh}"
++                subsystem="${subsystem##*/}"
++                . ${f}
++                "${subsystem}_${1}"
++            fi
++        done
++    fi
++}
++
+ # Invoke the local dhcp client enter hooks, if they exist.
+ if [ -f /etc/dhclient-enter-hooks ]; then
+   exit_status=0
+@@ -198,11 +214,14 @@ if [ x$reason = xBOUND ] || [ x$reason = xRENEW ] || \
+     ${ip} -4 route add ${alias_ip_address} dev ${interface} >/dev/null 2>&1
+   fi
+   make_resolv_conf
++  execute_client_side_configuration_scripts "config"
+   exit_with_hooks 0
+ fi
+ 
+ if [ x$reason = xEXPIRE ] || [ x$reason = xFAIL ] || [ x$reason = xRELEASE ] \
+    || [ x$reason = xSTOP ]; then
++  execute_client_side_configuration_scripts "restore"
++
+   if [ x$alias_ip_address != x ]; then
+     # Turn off alias interface.
+     ${ip} -4 addr flush dev ${interface} label ${interface}:0
+@@ -281,7 +300,7 @@ if [ x$reason = xBOUND6 ] ; then
+ 
+   # Check for nameserver options.
+   make_resolv_conf
+-
++  execute_client_side_configuration_scripts "config"
+   exit_with_hooks 0
+ fi
+ 
+@@ -299,6 +318,7 @@ if [ x$reason = xRENEW6 ] || [ x$reason = xREBIND6 ] ; then
+     make_resolv_conf
+   fi
+ 
++  execute_client_side_configuration_scripts "config"
+   exit_with_hooks 0
+ fi
+ 
+@@ -310,6 +330,7 @@ if [ x$reason = xDEPREF6 ] ; then
+   ${ip} -f inet6 addr change ${new_ip6_address}/${new_ip6_prefixlen} \
+        dev ${interface} scope global preferred_lft 0
+ 
++  execute_client_side_configuration_scripts "config"
+   exit_with_hooks 0
+ fi
+ 
+@@ -318,6 +339,8 @@ if [ x$reason = xEXPIRE6 -o x$reason = xRELEASE6 -o x$reason = xSTOP6 ] ; then
+     exit_with_hooks 2;
+   fi
+ 
++  execute_client_side_configuration_scripts "restore"
++
+   ${ip} -f inet6 addr del ${old_ip6_address}/${old_ip6_prefixlen} \
+ 	dev ${interface}
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
index b4a05fc..a73d31f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fixsepbuild.patch \
             file://dhclient-script-drop-resolv.conf.dhclient.patch \
             file://replace-ifconfig-route.patch \
+            file://dhcp-add-exec-script-function.patch \
            "
 
 SRC_URI[md5sum] = "5a284875dd2c12ddd388416d69156a67"
diff --git a/meta/recipes-connectivity/dhcp/files/dhclient.conf b/meta/recipes-connectivity/dhcp/files/dhclient.conf
index 0e6dcf9..0f7d42f 100644
--- a/meta/recipes-connectivity/dhcp/files/dhclient.conf
+++ b/meta/recipes-connectivity/dhcp/files/dhclient.conf
@@ -17,6 +17,7 @@
 #supersede domain-name "fugue.com home.vix.com";
 #prepend domain-name-servers 127.0.0.1;
 request subnet-mask, broadcast-address, time-offset, routers,
+	nis-domain, nis-servers, domain-search, ntp-servers,
 	domain-name, domain-name-servers, host-name,
 	netbios-name-servers, netbios-scope;
 #require subnet-mask, domain-name-servers;
-- 
1.9.1


