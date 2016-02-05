Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ADB8976EBF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 10:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u15Aqggb028171 for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Feb 2016 10:52:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2YqHQ1T8XfZw
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 10:52:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u15AqdLq028167
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Feb 2016 10:52:41 GMT
Message-ID: <1454669559.27087.276.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Feb 2016 10:52:39 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] e2fsprogs: Ensure we use the right mke2fs.conf when restoring from sstate
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
X-List-Received-Date: Fri, 05 Feb 2016 10:52:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we don't do this, we can use an mke2fs.conf from a different path which
may contain incompatible flags and lead to obtuse build failures such as:

Invalid filesystem option set: has_journal,extent,huge_file,flex_bg,metadata_csum,64bit,dir_nlink,extra_isize

To fix this, wrap the mke2fs binary and its hardlinks and point at the
correct configuration file.

In particular this fixes conflicts between master and jethro builds
affecting the main autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index 48af43b..9ade1ff 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -50,12 +50,27 @@ do_install () {
 	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
 }
 
+# Need to find the right mke2fs.conf file
+e2fsprogs_conf_fixup () {
+	for i in mke2fs mkfs.ext2 mkfs.ext3 mkfs.ext4 mkfs.ext4dev; do
+		create_wrapper ${D}${base_sbindir}/$i MKE2FS_CONFIG=${sysconfdir}/mke2fs.conf
+	done
+}
+
 do_install_append_class-target() {
 	# Clean host path in compile_et, mk_cmds
 	sed -i -e "s,ET_DIR=\"${S}/lib/et\",ET_DIR=\"${datadir}/et\",g" ${D}${bindir}/compile_et
 	sed -i -e "s,SS_DIR=\"${S}/lib/ss\",SS_DIR=\"${datadir}/ss\",g" ${D}${bindir}/mk_cmds
 }
 
+do_install_append_class-native() {
+	e2fsprogs_conf_fixup
+}
+
+do_install_append_class-nativesdk() {
+	e2fsprogs_conf_fixup
+}
+
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
 RRECOMMENDS_e2fsprogs = "e2fsprogs-mke2fs e2fsprogs-e2fsck"
 



