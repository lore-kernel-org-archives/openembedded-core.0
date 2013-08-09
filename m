Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 4FAF66B0D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 03:09:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,843,1367942400"; 
   d="scan'208";a="8159618"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 09 Aug 2013 11:06:45 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r7939lAY001837
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 11:09:47 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013080911082174-555629 ;
	Fri, 9 Aug 2013 11:08:21 +0800 
Message-ID: <52045D74.2040703@cn.fujitsu.com>
Date: Fri, 09 Aug 2013 11:09:40 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/09 11:08:21,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/09 11:08:22,
	Serialize complete at 2013/08/09 11:08:22
Subject: [PATCH]lsof: avoid creating directory ${DL_DIR}/${WORKDIR}/lsof_${PV}
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
X-List-Received-Date: Fri, 09 Aug 2013 03:09:50 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

lsof: avoid creating directory ${DL_DIR}/${WORKDIR}/lsof_${PV}.

Set LOCALSRC as SRC_URI will make do_unpack mkdir ${DL_DIR}/${WORKDIR}/lsof_${PV},
it's not good while multiuser sharing ${DL_DIR}.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

---
 meta/recipes-extended/lsof/lsof_4.87.bb |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
index 2f425aa..222ede8 100644
--- a/meta/recipes-extended/lsof/lsof_4.87.bb
+++ b/meta/recipes-extended/lsof/lsof_4.87.bb
@@ -10,17 +10,16 @@ SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 SRC_URI[md5sum] = "80e2a76d0e05826db910ec88e631296c"
 SRC_URI[sha256sum] = "dfdd3709d82bc79ccdf3e404b84aafa9aede5948642a824ecaefd0aac589da2c"
 
-LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
 
-LIC_FILES_CHKSUM = "file://${S}/00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
+LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
 
-python do_unpack () {
-    bb.build.exec_func('base_do_unpack', d)
-    src_uri = d.getVar('SRC_URI')
-    d.setVar('SRC_URI', '${LOCALSRC}')
-    bb.build.exec_func('base_do_unpack', d)
-    d.setVar('SRC_URI', src_uri)
+python do_unpack_append () {
+    bb.build.exec_func('do_unpack_realsrc', d)
+}
+
+do_unpack_realsrc () {
+	tar x --no-same-owner -f ${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar -C ${WORKDIR}
 }
 
 export LSOF_OS = "${TARGET_OS}"
-- 
1.7.7


