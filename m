Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TB6ek-00059j-Jn
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:16:14 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 10 Sep 2012 09:03:21 -0700
Received: by wibhn17 with SMTP id hn17so1956480wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 09:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=OY39N19jInFforOavuIkeSpjrwp8IOvrs+I9XvPW15Y=;
	b=L85ID9Dx3SDclYcdyo2RbJeoIigrSWdpZ0y5D4nLsoZd5JAgSaX0EM9cy23EnRAI2v
	4oppNTCgAxPtbv8BA/IDG/kImtihoOtGcq5t+8NxhnKYenSvpy3iOS5Lrl4UIACXEAaf
	dFDdLmicOsH4LPC/Qo9CBqHzBIn+ahFgCd8APzc4s5fV4nPsUrn8dbEMVcViJugMpzYA
	yXk6K+F8PkvLohONZSZvCWex8pH0t04kjNENGzgOxMRMOM++vT/fGDYjb9je1l04dBOH
	W8hNKpspOv3ANuZf0q2nIqLgvzEIBAfT9xcgXQfnmVpaeRDbtA9SB2CdX7vnJ+xlHOGV
	XXvA==
Received: by 10.180.106.97 with SMTP id gt1mr18176455wib.5.1347292989496;
	Mon, 10 Sep 2012 09:03:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w7sm17753742wiz.0.2012.09.10.09.03.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 09:03:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 17:02:22 +0100
Message-Id: <1347292942-7241-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlN4tExTOt7amUt3fVPwFfFhmGVw9A33wMZkTuuQn2eDsOOcTsC2xaqGUkgVNxJEL6h44Y9
Subject: [PATCH] webkit-gtk: work around Make bug by re-running make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 16:16:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GNU make 3.82 has a bug where it drops required dependencies.
https://bugs.webkit.org/show_bug.cgi?id=79498 is the WebKitGTK+
bug, and http://savannah.gnu.org/bugs/?30653 is the GNU Make bug.

Work around this by running make again if it fails just in case the failure is
due to the bug.

Based on a patch by Andreas Müller <schnitzeltony@googlemail.com>.

[ YOCTO #2816 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
index cf4129d..8beb6eb 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
 
+PR = "r1"
+
 # Choice of language backends - icu has issues on Big Endian machines so use pango
 ICU_LIB = "icu"
 ICU_LIB_powerpc = "pango"
@@ -77,6 +79,26 @@ do_configure_append() {
 	done
 }
 
+# A dirty hack for GNU make 3.82 bug which means it drops required
+# dependencies. https://bugs.webkit.org/show_bug.cgi?id=79498 is the WebKitGTK+
+# bug, and http://savannah.gnu.org/bugs/?30653 is the GNU Make bug.  This is
+# fixed in Make CVS, so 3.83 won't have this problem.
+do_compile() {
+    if [ x"$MAKE" = x ]; then MAKE=make; fi
+    bbnote ${MAKE} ${EXTRA_OEMAKE} "$@"
+    for error_count in 1 2 3; do
+        bbnote "Attempt $error_count of 3"
+        exit_code=0
+        ${MAKE} ${EXTRA_OEMAKE} "$@" || exit_code=1
+        if [ $exit_code = 0 ]; then
+            break
+        fi
+    done
+    if [ ! $exit_code = 0 ]; then
+        die "oe_runmake failed"
+    fi
+}
+
 do_install_append() {
 	rmdir ${D}${libexecdir}
 }
-- 
1.7.10



