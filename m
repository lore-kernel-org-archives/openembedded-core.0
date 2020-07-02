Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: w+spKBX+xwfFGDJYdhEv8ut26Y7KZ6L9sicrgaddjOx6cPiwl8h6jLv3qWKqv5qniczvVY2dJu
 oVHtBR0kbxQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628860"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628860"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:33 -0700
IronPort-SDR: YKmu9VtPLjF3ELuArUSiZolAu5Dz4ApcuwDhJqTI2nNIJWlLJt9z7iB9wIZCnAWS91J+RKtKlq
 aj4CpZamNw+Q==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801730"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:32 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 09/10] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
Date: Thu,  2 Jul 2020 08:54:11 +0800
Message-Id: <d449e6b536c197b6723dab1d61e989706c14f19c.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <pkj@axis.com>

Rewrite relocatable_native_pcfiles() so that it can handle that any of
the checked pkgconfig directories are empty without causing an
exception.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f9c5df6dc1c13e9b05ff1b47ad84ad339f6779a4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.25.4

