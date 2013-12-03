Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1A46DF27
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 13:47:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB3DlDc5012543
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 05:47:13 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 05:47:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2013 21:46:59 +0800
Message-ID: <8985e61776a6fa13ea27697aeb12bf56cb851a12.1386078157.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386078157.git.hongxu.jia@windriver.com>
References: <cover.1386078157.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] dhclient-script: override make_resolv_conf for read-only fs
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
X-List-Received-Date: Tue, 03 Dec 2013 13:47:16 -0000
Content-Type: text/plain

When dhclient-script starts, the client script first defines a shell
function, make_resolv_conf , which is later used to create the
/etc/resolv.conf file.

But the read-only filesystem didn't permit the modification, so override
the default behaviour and redefine this function in the enter hook script.

http://linux.about.com/library/cmd/blcmdl8_dhclient-script.htm
[YOCTO #5624]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |  6 ++++-
 .../dhcp/files/readonly-dhclient-enter-hooks       | 31 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index d8376aa..58715be 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -16,6 +16,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://site.h \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
+	   file://readonly-dhclient-enter-hooks \
 	   file://dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch \
 	   file://dhclient.conf file://dhcpd.conf"
 
@@ -52,6 +53,7 @@ do_install_append () {
 		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
 	fi
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
+	install -m 0755 ${WORKDIR}/readonly-dhclient-enter-hooks ${D}${sysconfdir}/dhclient-enter-hooks
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
@@ -67,7 +69,9 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
 
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf \
+                     ${sysconfdir}/dhclient-enter-hooks \
+"
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks b/meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks
new file mode 100644
index 0000000..c43e81f
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks
@@ -0,0 +1,31 @@
+is_on_read_only_partition () {
+    FILE=$1
+    dir=`dirname $(readlink -f "$FILE")`
+    while true; do
+        if [ ! -d "$dir" ]; then
+            echo "ERROR: $dir is not a directory"
+            exit 1
+        else
+            for flag in `awk -v dir=$dir '{ if ($2 == dir) { print "FOUND"; split($4,FLAGS,",") } }; \
+                END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
+                [ "$flag" = "FOUND" ] && partition="read-write"
+                [ "$flag" = "ro" ] && { partition="read-only"; break; }
+            done
+            if [ "$dir" = "/" -o -n "$partition" ]; then
+                break
+            else
+                dir=`dirname $dir`
+            fi
+        fi
+    done
+    [ "$partition" = "read-only" ] && echo "yes" || echo "no"
+}
+
+# If resolv.conf on the readonly partition, we should override make_resolv_conf
+if [ `is_on_read_only_partition /etc/resolv.conf` = "no" ]; then
+    return
+fi
+
+make_resolv_conf(){
+    :
+}
-- 
1.8.1.2


