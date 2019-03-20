Return-Path: <Lu.Jiang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C55A7CE66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 09:42:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2K9gC6o025826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2019 02:42:12 -0700 (PDT)
Received: from ljiang0-OptiPlex-9020.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 20 Mar 2019 02:42:10 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 20 Mar 2019 17:39:29 +0800
Message-ID: <20190320093929.28688-5-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320093929.28688-1-lu.jiang@windriver.com>
References: <20190320093929.28688-1-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] relocatable: add file existence checking in relocatable_native_pcfiles
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
X-List-Received-Date: Wed, 20 Mar 2019 09:42:12 -0000
Content-Type: text/plain

Some package may create a ${libdir}/pkgconfig directory in its sysroot
without .pc file. It leads following error:
sed: can't read ${sysroot}/${libdir}/pkgconfig/*.pc: No such file or directory

To avoid this, add a file existence checking in relocatable_native_pcfiles()
before sed.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 meta/classes/relocatable.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 582812c1cf..eb9989d18c 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -7,11 +7,13 @@ python relocatable_binaries_preprocess() {
 }
 
 relocatable_native_pcfiles () {
-	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
+	filecnt=`ls -l ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc 2>/dev/null | wc -l`
+	if [ $filecnt -gt 0 ]; then
 		rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir') + "/pkgconfig")}
 		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
 	fi
-	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
+	filecnt=`ls -l ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc 2>/dev/null | wc -l`
+	if [ $filecnt -gt 0 ]; then
 		rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadir') + "/pkgconfig")}
 		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
 	fi
-- 
2.17.1


