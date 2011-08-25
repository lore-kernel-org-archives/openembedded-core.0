Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1QwaRG-0008IT-QB
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 15:57:46 +0200
Received: by wyf19 with SMTP id 19so1774649wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=y+UdsslaXtzAVVtCEWmci4Yk5VIwlH7N2BfvuP1nQww=;
	b=fZWnn4DN3VvwVvBRniwPJ1h8zNkZpZ89dwY8AB/tKTAdsKPKKA28TQ9eHf0r+ubIdp
	o2wghhbv1YlytB3ZWk0u3AqWP9oCDQ/J5QHw/FBjpimCSxM4YzHWJTeassvK9sKZmt4a
	qgFlQd8zi0430SYJDwk/57Pq7aRyk9acdiWqo=
Received: by 10.216.184.131 with SMTP id s3mr5831989wem.59.1314280379169;
	Thu, 25 Aug 2011 06:52:59 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id y52sm384004wec.21.2011.08.25.06.52.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Aug 2011 06:52:58 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2011 17:52:47 +0400
Message-Id: <1314280367-22179-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] opkg-utils: ignore packages disapperaring filelist generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Aug 2011 13:57:46 -0000

Package files disappearing during index generation don't cause a fatal
error. Make package file disappearing during filelist generation also
a non-fatal error.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../opkg-utils/no-ioerror-during-filelist.patch    |   31 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
 2 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/no-ioerror-during-filelist.patch

diff --git a/meta/recipes-devtools/opkg-utils/no-ioerror-during-filelist.patch b/meta/recipes-devtools/opkg-utils/no-ioerror-during-filelist.patch
new file mode 100644
index 0000000..dc85cb6
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/no-ioerror-during-filelist.patch
@@ -0,0 +1,31 @@
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Subject: Ignore IOError errors while populating filelist
+Upstream-Status: Pending/Not-Applicable
+
+While populating Packages.filelist there is a possibility that the package file
+will disappear while reading. So ignore errors during filelist generation.
+
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+Index: opkg-utils/opkg-make-index
+===================================================================
+--- opkg-utils.orig/opkg-make-index	2011-08-25 16:45:41.000000000 +0400
++++ opkg-utils/opkg-make-index	2011-08-25 17:38:57.000000000 +0400
+@@ -197,7 +197,15 @@
+ names = packages.packages.keys()
+ names.sort()
+ for name in names:
+-     for fn in packages[name].get_file_list():
++     try:
++          fnlist = packages[name].get_file_list()
++     except OSError, e:
++          sys.stderr.write(e)
++          continue
++     except IOError, e:
++          sys.stderr.write(e)
++          continue
++     for fn in fnlist:
+           (h,t) = os.path.split(fn)
+           if not t: continue
+           if not files.has_key(t): files[t] = name+':'+fn
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index fd2b5e6..7659465 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -8,12 +8,13 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
            file://index-ignore-filenotfound.patch \
            file://mtime-int.patch \
            file://add-license-field.patch \
+           file://no-ioerror-during-filelist.patch \
            "
 
 S = "${WORKDIR}/opkg-utils"
-- 
1.7.2.5



