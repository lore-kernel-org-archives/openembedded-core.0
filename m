Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E623A60FA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 15:52:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r94FqtfX027792
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 08:52:55 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Fri, 4 Oct 2013 08:52:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Oct 2013 10:48:19 -0500
Message-ID: <1380901699-18760-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] run-postinst: Ensure that the postinsts are ordered
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
X-List-Received-Date: Fri, 04 Oct 2013 15:52:55 -0000
Content-Type: text/plain

The postinst files were being generated using purely the name of the package,
this unfortunately meant the run order would be based on the name of the
package and not the order in which it was installed on the filesystem.

If package A requires package Z to be fully installed, this causes a problem.

Note:

rpm - as the rpm based install proceeds the order is defined and captured.
      so the problem is resolved there.

ipk - this unfortunately does not appear to solve the problem for ipk, as
      the status file is not ordered in any appreciable way.  This does not
      cause any regressions however and sets the stage for a proper fix.

deb - this -may- fix the deb install.  Early testing indicates at least some
      ordering to the status file.  But it's unclear if it completely resolves
      the issue.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass | 14 ++++++++++----
 meta/classes/rootfs_deb.bbclass  |  7 ++++++-
 meta/classes/rootfs_ipk.bbclass  |  7 ++++++-
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 98aa98b..36bad09 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -391,6 +391,10 @@ EOF
 	fi
 
 	# Construct install scriptlet wrapper
+	# Scripts need to be ordered when executed, this ensures numeric order
+	# If we ever run into needing more the 899 scripts, we'll have to
+	# change num to start with 1000.
+	#
 	cat << EOF > ${WORKDIR}/scriptlet_wrapper
 #!/bin/bash
 
@@ -406,11 +410,13 @@ export NATIVE_ROOT=${STAGING_DIR_NATIVE}
 if [ \$? -ne 0 ]; then
   if [ \$4 -eq 1 ]; then
     mkdir -p \$1/etc/rpm-postinsts
+    num=100
+    while [ -e \$1/etc/rpm-postinsts/\${num}-* ]; do num=\$((num + 1)); done
     name=\`head -1 \$1/\$3 | cut -d' ' -f 2\`
-    echo "#!\$2" > \$1/etc/rpm-postinsts/\${name}
-    echo "# Arg: \$4" >> \$1/etc/rpm-postinsts/\${name}
-    cat \$1/\$3 >> \$1/etc/rpm-postinsts/\${name}
-    chmod +x \$1/etc/rpm-postinsts/\${name}
+    echo "#!\$2" > \$1/etc/rpm-postinsts/\${num}-\${name}
+    echo "# Arg: \$4" >> \$1/etc/rpm-postinsts/\${num}-\${name}
+    cat \$1/\$3 >> \$1/etc/rpm-postinsts/\${num}-\${name}
+    chmod +x \$1/etc/rpm-postinsts/\${num}-\${name}
   else
     echo "Error: pre/post remove scriptlet failed"
   fi
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 0161f7a..b1c52f9 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -107,9 +107,14 @@ delayed_postinsts () {
 }
 
 save_postinsts () {
+	# Scripts need to be ordered when executed, this ensures numeric order
+	# If we ever run into needing more the 899 scripts, we'll have to
+	# change num to start with 1000.
+	num=100
 	for p in $(delayed_postinsts); do
 		install -d ${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts
-		cp ${IMAGE_ROOTFS}/var/lib/dpkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts/$p
+		cp ${IMAGE_ROOTFS}/var/lib/dpkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts/$num-$p
+		num=`echo \$((num+1))`
 	done
 }
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index a37ab14..b0805dc 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -106,9 +106,14 @@ delayed_postinsts () {
 }
 
 save_postinsts () {
+	# Scripts need to be ordered when executed, this ensures numeric order
+	# If we ever run into needing more the 899 scripts, we'll have to
+	# change num to start with 1000.
+	num=100
 	for p in $(delayed_postinsts); do
 		install -d ${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts
-		cp ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts/$p
+		cp ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts/$num-$p
+		num=`echo \$((num+1))`
 	done
 }
 
-- 
1.8.1.2.545.g2f19ada


