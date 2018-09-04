Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B7B3B74500
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 08:25:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w848Pajh024594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Sep 2018 01:25:36 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 4 Sep 2018 01:25:35 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2018 16:25:33 +0800
Message-ID: <1536049533-17773-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] dhcp: make dhclient to get configuration for other programs
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
X-List-Received-Date: Tue, 04 Sep 2018 08:25:36 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Make dhclient to run /etc/dhcp/dhclient.d/*.sh, and get the configuration
for ntp, nis or other programes

These codes are from redhat rpm package.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/dhcp/dhcp-add-exec-script-function.patch  | 90 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |  1 +
 meta/recipes-connectivity/dhcp/files/dhclient.conf |  1 +
 3 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch b/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch
new file mode 100644
index 0000000..1809b78
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/dhcp-add-exec-script-function.patch
@@ -0,0 +1,90 @@
+From 36a4423d82291f6e01ee26a6f5bf0b5d0d75d07e Mon Sep 17 00:00:00 2001
+From: Li Wang <li.wang@windriver.com>
+Date: Fri, 17 Jul 2015 14:31:49 +0800
+Subject: [PATCH] [PATCH] dhcp: add exec script function
+
+Make dhclient to run /etc/dhcp/dhclient.d/*.sh, and get the configuration
+for ntp, nis or other programes
+
+These codes are from redhat rpm packages.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ client/scripts/linux | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index e9ea379..716d7e8 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -31,6 +31,8 @@
+ # overwirte this line to use a fake ip-echo tool. It's also convenient
+ # if your system holds ip tool in a non-standard location.
+ ip=/sbin/ip
++ETCDIR="/etc/dhcp"
++export SAVEDIR=/var/lib/dhcp
+ 
+ # update /etc/resolv.conf based on received values
+ # This updated version mostly follows Debian script by Andrew Pollock et al.
+@@ -182,6 +184,20 @@ exit_with_hooks() {
+     exit $exit_status
+ }
+ 
++execute_client_side_configuration_scripts() {
++# execute any additional client side configuration scripts we have
++    if [ "${1}" == "config" ] || [ "${1}" == "restore" ]; then
++        for f in ${ETCDIR}/dhclient.d/*.sh ; do
++            if [ -x "${f}" ]; then
++                subsystem="${f%.sh}"
++                subsystem="${subsystem##*/}"
++                . "${f}"
++                "${subsystem}_${1}"
++            fi
++        done
++    fi
++}
++
+ # This function was largely borrowed from dhclient-script that
+ # ships with Centos, authored by Jiri Popelka and David Cantrell
+ # of Redhat. Thanks guys.
+@@ -325,10 +341,12 @@ case "$reason" in
+ 
+         # update /etc/resolv.conf
+         make_resolv_conf
++        execute_client_side_configuration_scripts "config"
+ 
+         ;;
+ 
+     EXPIRE|FAIL|RELEASE|STOP)
++        execute_client_side_configuration_scripts "restore"
+         if [ -n "$alias_ip_address" ]; then
+             # flush alias IP
+             ${ip} -4 addr flush dev ${interface} label ${interface}:0
+@@ -464,6 +482,7 @@ case "$reason" in
+            [ "${new_dhcp6_domain_search}" != "${old_dhcp6_domain_search}" ]; then
+             make_resolv_conf
+         fi
++        execute_client_side_configuration_scripts "config"
+ 
+         ;;
+ 
+@@ -476,6 +495,7 @@ case "$reason" in
+         ${ip} -6 addr change ${cur_ip6_address}/${cur_ip6_prefixlen} \
+             dev ${interface} scope global preferred_lft 0
+ 
++        execute_client_side_configuration_scripts "config"
+         ;;
+ 
+     EXPIRE6|RELEASE6|STOP6)
+@@ -487,6 +507,7 @@ case "$reason" in
+         ${ip} -6 addr del ${old_ip6_address}/${old_ip6_prefixlen} \
+             dev ${interface}
+ 
++        execute_client_side_configuration_scripts "restore"
+         ;;
+ esac
+ 
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
index 159abbc..85ceaba 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0009-remove-dhclient-script-bash-dependency.patch \
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
             file://0013-fixup_use_libbind.patch \
+            file://dhcp-add-exec-script-function.patch \
 "
 
 SRC_URI[md5sum] = "18c7f4dcbb0a63df25098216d47b1ede"
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
2.7.4


