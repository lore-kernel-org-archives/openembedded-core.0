Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5A6E6D803
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 08:52:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s258qtvn012309
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Mar 2014 00:52:55 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 5 Mar 2014 00:52:54 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Mar 2014 16:52:49 +0800
Message-ID: <5dd65618f76bdc0e159bd98762a5ea9f639223be.1394009171.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394009171.git.hongxu.jia@windriver.com>
References: <cover.1394009171.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] dhcp-client: fix invoke dhclient-script failed on Read-only file system
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
X-List-Received-Date: Wed, 05 Mar 2014 08:52:55 -0000
Content-Type: text/plain

In read-only file system, '/etc' is on the readonly partition,
and '/etc/resolv.conf' is symlinked to a separate writable
partition.

In this situation, we should use shell variable to instead of
the temp file '/etc/resolv.conf.dhclient'.

[YOCTO #5624]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...dhclient-script-drop-resolv.conf.dhclient.patch | 70 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb    |  3 +-
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
new file mode 100644
index 0000000..99ad91c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
@@ -0,0 +1,70 @@
+dhclient-script: drop resolv.conf.dhclient
+
+Even though '/etc' is on the readonly partition, it's possible that
+/etc/resolv.conf is on a separate writable partition.
+
+In this situation, we should drop the temp file resolv.conf.dhclient,
+use shell variable instead.
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/linux | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 6f8ea4b..b369bef 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -27,27 +27,27 @@ ip=/sbin/ip
+ 
+ make_resolv_conf() {
+   if [ x"$new_domain_name_servers" != x ]; then
+-    cat /dev/null > /etc/resolv.conf.dhclient
+-    chmod 644 /etc/resolv.conf.dhclient
++    resolv_conf=""
+     if [ x"$new_domain_search" != x ]; then
+-      echo search $new_domain_search >> /etc/resolv.conf.dhclient
++      resolv_conf="search ${new_domain_search}\n"
+     elif [ x"$new_domain_name" != x ]; then
+       # Note that the DHCP 'Domain Name Option' is really just a domain
+       # name, and that this practice of using the domain name option as
+       # a search path is both nonstandard and deprecated.
+-      echo search $new_domain_name >> /etc/resolv.conf.dhclient
++      resolv_conf="search ${new_domain_name}\n"
+     fi
+     for nameserver in $new_domain_name_servers; do
+-      echo nameserver $nameserver >>/etc/resolv.conf.dhclient
++      resolv_conf="${resolv_conf}nameserver ${nameserver}\n"
+     done
+ 
+-    mv /etc/resolv.conf.dhclient /etc/resolv.conf
++    echo -e "${resolv_conf}" > /etc/resolv.conf
+   elif [ "x${new_dhcp6_name_servers}" != x ] ; then
+     cat /dev/null > /etc/resolv.conf.dhclient6
+     chmod 644 /etc/resolv.conf.dhclient6
++    resolv_conf=""
+ 
+     if [ "x${new_dhcp6_domain_search}" != x ] ; then
+-      echo search ${new_dhcp6_domain_search} >> /etc/resolv.conf.dhclient6
++      resolv_conf="search ${new_dhcp6_domain_search}\n"
+     fi
+     shopt -s nocasematch 
+     for nameserver in ${new_dhcp6_name_servers} ; do
+@@ -59,11 +59,11 @@ make_resolv_conf() {
+       else
+ 	zone_id=
+       fi
+-      echo nameserver ${nameserver}$zone_id >> /etc/resolv.conf.dhclient6
++      resolv_conf="${resolv_conf}nameserver ${nameserver}$zone_id\n"
+     done
+     shopt -u nocasematch 
+ 
+-    mv /etc/resolv.conf.dhclient6 /etc/resolv.conf
++    echo -e "${resolv_conf}" > /etc/resolv.conf
+   fi
+ }
+ 
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
index 08db41b..d823350 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
@@ -1,11 +1,10 @@
 require dhcp.inc
 
-PR = "r1"
-
 SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fix-external-bind.patch \
             file://link-with-lcrypto.patch \
             file://fixsepbuild.patch \
+            file://dhclient-script-drop-resolv.conf.dhclient.patch \
            "
 
 SRC_URI[md5sum] = "f68e3c1f00a9af5742bc5e71d567cf93"
-- 
1.8.1.2


