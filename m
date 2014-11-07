Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA42A65D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:45:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA78jVxP028998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 00:45:31 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 00:45:30 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Nov 2014 16:47:19 +0800
Message-ID: <41d6a35dac417bcca956d3d1e1959d01fd2729ea.1415349978.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415349978.git.Qi.Chen@windriver.com>
References: <cover.1415349978.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nfs-utils: change owner/group of directories in do_install
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
X-List-Received-Date: Fri, 07 Nov 2014 08:45:37 -0000
Content-Type: text/plain

Previously, the owners/groups of directories like /var/lib/nfs/statd
are changed in the init script, /etc/init.d/nfscommon. This is actually
a workaround. We need to change them at do_install time.

This patch fixes the above problem by changing owners/groups at do_install
time.

Besides, configuration option '--with-staduser=nobody' is changed to be
'--with-statduser=rpcuser'. And /var/lib/nfs/statd/state is modified to have
permission 0644, just like other distros (ubuntu, fedora, etc.) do.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../nfs-utils/nfs-utils/nfscommon                  | 27 ----------------------
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  7 ++++--
 2 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
index 65fdd1d..992267d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
@@ -28,33 +28,7 @@ test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
 #----------------------------------------------------------------------
 # Startup and shutdown functions.
 #  Actual startup/shutdown is at the end of this file.
-#directories
-create_directories(){
-	echo -n 'creating NFS state directory: '
-	mkdir -p "$NFS_STATEDIR"
-	(	cd "$NFS_STATEDIR"
-		umask 077
-		mkdir -p rpc_pipefs
-		mkdir -p sm sm.bak statd
-		chown rpcuser:rpcuser sm sm.bak statd
-		test -w statd/state || {
-			rm -f statd/state
-			:>statd/state
-		}
-		umask 022
-		for file in xtab etab smtab rmtab
-		do
-			test -w "$file" || {
-				rm -f "$file"
-				:>"$file"
-			}
-		done
-	)
-	chown rpcuser:rpcuser "$NFS_STATEDIR"
-	echo done
-}
 
-#statd
 start_statd(){
 	echo -n "starting statd: "
 	start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
@@ -74,7 +48,6 @@ stop_statd(){
 #FIXME: need to create the /var/lib/nfs/... directories
 case "$1" in
   start)
-	create_directories
 	start_statd;;
   stop)
 	stop_statd;;
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 4933e10..37a2e1a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -56,7 +56,7 @@ SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 # --enable-uuid is need for cross-compiling
-EXTRA_OECONF = "--with-statduser=nobody \
+EXTRA_OECONF = "--with-statduser=rpcuser \
                 --enable-mountconfig \
                 --enable-libmount-mount \
                 --disable-nfsv41 \
@@ -92,7 +92,6 @@ do_compile_prepend() {
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${localstatedir}/lib/nfs/statd
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
 	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
 
@@ -108,6 +107,10 @@ do_install_append () {
 	# kernel code as of 3.8 hard-codes this path as a default
 	install -d ${D}/var/lib/nfs/v4recovery
 
+	# chown the directories and files
+	chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
+	chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
+
 	# the following are built by CC_FOR_BUILD
 	rm -f ${D}${sbindir}/rpcdebug
 	rm -f ${D}${sbindir}/rpcgen
-- 
1.9.1


