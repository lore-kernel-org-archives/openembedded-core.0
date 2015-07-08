Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A25773F9E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 03:08:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t68382SL004813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 20:08:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Jul 2015 20:08:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 11:07:12 +0800
Message-ID: <1436324832-25173-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dhcp: add exec script when dhclient run
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
X-List-Received-Date: Wed, 08 Jul 2015 03:08:03 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

make dhclient-script to call ntp/nis script to get the extra data from server

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../dhcp/dhcp/dhcp-add-exec-script-function.patch  | 93 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |  1 +
 meta/recipes-connectivity/dhcp/files/dhclient.conf |  1 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch b/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch
new file mode 100644
index 0000000..40faba3
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch
@@ -0,0 +1,93 @@
+dhclient: add exec script function
+
+Upstream-Status: Pending
+
+make dhclient to call /etc/dhcp/dhclient.d/*.sh
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ client/scripts/linux |   23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 3c3575e..4ea1e4f 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -24,6 +24,7 @@
+ 
+ # 'ip' just looks too weird.  /sbin/ip looks less weird.
+ ip=/sbin/ip
++ETCDIR="/etc/dhcp"
+ 
+ make_resolv_conf() {
+   if [ x"$new_domain_name_servers" != x ]; then
+@@ -84,6 +85,20 @@ exit_with_hooks() {
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
+@@ -201,11 +216,14 @@ if [ x$reason = xBOUND ] || [ x$reason = xRENEW ] || \
+     route add -host $alias_ip_address $interface:0
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
+     ifconfig $interface:0- inet 0
+@@ -277,7 +295,7 @@ if [ x$reason = xBOUND6 ] ; then
+ 
+   # Check for nameserver options.
+   make_resolv_conf
+-
++  execute_client_side_configuration_scripts "config"
+   exit_with_hooks 0
+ fi
+ 
+@@ -297,6 +315,7 @@ if [ x$reason = xRENEW6 ] || [ x$reason = xREBIND6 ] ; then
+     make_resolv_conf
+   fi
+ 
++  execute_client_side_configuration_scripts "config"
+   exit_with_hooks 0
+ fi
+ 
+@@ -308,6 +327,7 @@ if [ x$reason = xDEPREF6 ] ; then
+   ${ip} -f inet6 addr change ${new_ip6_address}/${new_ip6_prefixlen} \
+        dev ${interface} scope global preferred_lft 0
+ 
++  execute_client_side_configuration_scripts "config"
+   exit_with_hooks 0
+ fi
+ 
+@@ -316,6 +336,8 @@ if [ x$reason = xEXPIRE6 -o x$reason = xRELEASE6 -o x$reason = xSTOP6 ] ; then
+     exit_with_hooks 2;
+   fi
+ 
++  execute_client_side_configuration_scripts "restore"
++
+   ${ip} -f inet6 addr del ${old_ip6_address}/${old_ip6_prefixlen} \
+ 	dev ${interface}
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


