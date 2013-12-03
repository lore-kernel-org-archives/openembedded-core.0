Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD8886C72D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 13:47:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB3DlA4G004030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 05:47:10 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 05:47:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2013 21:46:58 +0800
Message-ID: <ae7e0f907b72ad9af0a078bdf317a7eb10315c7f.1386078157.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386078157.git.hongxu.jia@windriver.com>
References: <cover.1386078157.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/2] dhclient-script: let resolv.conf and resolv.conf.dhclient on the same direcotry
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
X-List-Received-Date: Tue, 03 Dec 2013 13:47:12 -0000
Content-Type: text/plain

Even though '/etc' is on the readonly partition, it's possible that
/etc/resolv.conf is on a separate writable partition.

In this situation, we should make sure the temp file resolv.conf.dhclient
on the same direcotry.

[YOCTO #5624]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |  1 +
 ...ript-let-resolv.conf-and-resolv.conf.dhcl.patch | 74 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index ad82b57..d8376aa 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -16,6 +16,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://site.h \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
+	   file://dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch \
 	   file://dhclient.conf file://dhcpd.conf"
 
 inherit autotools
diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch
new file mode 100644
index 0000000..db56f70
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch
@@ -0,0 +1,74 @@
+dhclient-script: let resolv.conf and resolv.conf.dhclient on the same direcotry
+
+Even though '/etc' is on the readonly partition, it's possible that
+/etc/resolv.conf is on a separate writable partition.
+
+In this situation, we should make sure the temp file resolv.conf.dhclient
+on the same direcotry.
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/linux |   24 +++++++++++++-----------
+ 1 file changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 6f8ea4b..fbc6324 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -27,27 +27,29 @@ ip=/sbin/ip
+ 
+ make_resolv_conf() {
+   if [ x"$new_domain_name_servers" != x ]; then
+-    cat /dev/null > /etc/resolv.conf.dhclient
+-    chmod 644 /etc/resolv.conf.dhclient
++    sysconfdir=`dirname $(readlink -f '/etc/resolv.conf')`
++    cat /dev/null > $sysconfdir/resolv.conf.dhclient
++    chmod 644 $sysconfdir/resolv.conf.dhclient
+     if [ x"$new_domain_search" != x ]; then
+-      echo search $new_domain_search >> /etc/resolv.conf.dhclient
++      echo search $new_domain_search >> $sysconfdir/esolv.conf.dhclient
+     elif [ x"$new_domain_name" != x ]; then
+       # Note that the DHCP 'Domain Name Option' is really just a domain
+       # name, and that this practice of using the domain name option as
+       # a search path is both nonstandard and deprecated.
+-      echo search $new_domain_name >> /etc/resolv.conf.dhclient
++      echo search $new_domain_name >> $sysconfdir/resolv.conf.dhclient
+     fi
+     for nameserver in $new_domain_name_servers; do
+-      echo nameserver $nameserver >>/etc/resolv.conf.dhclient
++      echo nameserver $nameserver >>$sysconfdir/resolv.conf.dhclient
+     done
+ 
+-    mv /etc/resolv.conf.dhclient /etc/resolv.conf
++    mv $sysconfdir/resolv.conf.dhclient $sysconfdir/resolv.conf
+   elif [ "x${new_dhcp6_name_servers}" != x ] ; then
+-    cat /dev/null > /etc/resolv.conf.dhclient6
+-    chmod 644 /etc/resolv.conf.dhclient6
++    sysconfdir=`dirname $(readlink -f '/etc/resolv.conf')`
++    cat /dev/null > $sysconfdir/resolv.conf.dhclient6
++    chmod 644 $sysconfdir/resolv.conf.dhclient6
+ 
+     if [ "x${new_dhcp6_domain_search}" != x ] ; then
+-      echo search ${new_dhcp6_domain_search} >> /etc/resolv.conf.dhclient6
++      echo search ${new_dhcp6_domain_search} >> $sysconfdir/resolv.conf.dhclient6
+     fi
+     shopt -s nocasematch 
+     for nameserver in ${new_dhcp6_name_servers} ; do
+@@ -59,11 +61,11 @@ make_resolv_conf() {
+       else
+ 	zone_id=
+       fi
+-      echo nameserver ${nameserver}$zone_id >> /etc/resolv.conf.dhclient6
++      echo nameserver ${nameserver}$zone_id >> $sysconfdir/resolv.conf.dhclient6
+     done
+     shopt -u nocasematch 
+ 
+-    mv /etc/resolv.conf.dhclient6 /etc/resolv.conf
++    mv $sysconfdir/resolv.conf.dhclient6 $sysconfdir/resolv.conf
+   fi
+ }
+ 
+-- 
+1.7.9.5
+
-- 
1.8.1.2


