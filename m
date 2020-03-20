Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 09A2361B77
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=1662; q=dns/txt; s=axis-central1;
	t=1584727463; x=1616263463;
	h=from:to:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=v4eW+o6vVe2ZtnLGCoJ54oV9aWveMdiWFJHgxdconmk=;
	b=dozWWHscZy0WwbDEBSO/3D78V4Z/HeCACcu3epDiK/8uDIB1wGEBx9E+
	ebaXBh9skyppCv7ckUopMC5VhZru7FnwO/iy86eiOQ8MazhvXserAde1y
	vyvgP2B0/2UbOwJhw/juKJPvJAVc1B6fHUYztt4HOzKCRo5zLUaxzfcJ3
	3ReSf+2qP3nJbXYxCPxxs1I7AVygnloJ2VdF8fJ6JRrMaJYOQ1OpJkgDM
	DN5HqC50iPuJCZL8DOdD3Ylo/7Ig2l5voZ3c+/9bPdGQejjW5m9c8isXX
	FCnIOM4IZl5wdIG9hwqodB0zw7A4DSbdu8vJL9itnPx/PdyrvnJlJu/ks A==;
IronPort-SDR: a5Bb9/xVBhbVkFAyGgMf7The3bdngRJ4nXVvCsnIaucsEJM9qDrZabbjmfEdg67fu2mFWw3iS7
	yuEsOxJhIe8wFnD6lQ4DhhUFj/eVjkq/8YfTZcJc1ILdp6SE55shZbYnQpJAwsQuCAiTKD6i9f
	fJvOvraZ4csOa4eMg1G+TYQDmTnpWrKNyfuWxeevTsW+qOCUZx3BMMoOHX9hqZLT+nY9NurYOw
	3y3wSr7xE1GDhILc6sK49yS/F71+4B9CQpE8i/ZEqtdGhl3dFowBPErZ3G4svBjD/fO530YFF6
	W5A=
X-IronPort-AV: E=Sophos;i="5.72,285,1580770800"; 
   d="scan'208";a="6750270"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2020 19:04:20 +0100
Message-ID: <20200320180420.32303-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [master][zeus][PATCH] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
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
X-List-Received-Date: Fri, 20 Mar 2020 18:04:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rewrite relocatable_native_pcfiles() so that it can handle that any of
the checked pkgconfig directories are empty without causing an
exception.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/relocatable.bbclass | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 582812c1cf..af04be5cca 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
     rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
 }
 
-relocatable_native_pcfiles () {
-	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
-		rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir') + "/pkgconfig")}
-		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
-	fi
-	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
-		rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadir') + "/pkgconfig")}
-		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
-	fi
+relocatable_native_pcfiles() {
+	for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
+		files_template=${SYSROOT_DESTDIR}$dir/*.pc
+		# Expand to any files matching $files_template
+		files=$(echo $files_template)
+		# $files_template and $files will differ if any files were found
+		if [ "$files_template" != "$files" ]; then
+			rel=$(realpath -m --relative-to=$dir ${base_prefix})
+			sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
+		fi
+	done
 }
-- 
2.21.1


