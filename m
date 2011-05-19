Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QND4S-0006bL-77
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 01:56:05 +0200
Received: by pwj9 with SMTP id 9so1523121pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 16:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=bi7coqZK8QBVMlXqm6dquZsqkzeMQrVbYusq6zBK610=;
	b=T/dnzzO6DnhOAxoWXJ2cfHOGh1KXdgjY/pFoRi/U5c8X2TBA79PVHv3sk6WFQVW3r+
	wIG0nvlZE4pKbHtCpsFbEa8FY5jyBr2/LK540+IBdqrAZbnG+Z+O1pgg6rgXbLapbSre
	e7B3gDJQnuAI49xYYTCRnRklMukkvUY+wmzfw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hKQ5rs5l9Msn6/mfxc5ZAd5l2/qInJcJ0EF6Az6jV2fiCABMXU8YNWRxZiiDpPNLAu
	N/JsyZvLFO0HO6Yofiujk1wuVIVNktEIH5PrVxNscAUTBNWHQm4tHIFluGfALHKAgNes
	AhM3ZEOl2xf/bq8fSLVzLOZOoF+gWNu1z9IdE=
Received: by 10.68.0.106 with SMTP id 10mr5824219pbd.434.1305849174904;
	Thu, 19 May 2011 16:52:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z5sm2067303pbb.5.2011.05.19.16.52.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 16:52:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 16:52:31 -0700
Message-Id: <38adb15a5907afe05abebbc455f420ab2f458b3e.1305848960.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <0a1ad440f372eec668b742c775188249c9609f11.1305848960.git.raj.khem@gmail.com>
References: <0a1ad440f372eec668b742c775188249c9609f11.1305848960.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305848960.git.raj.khem@gmail.com>
References: <cover.1305848960.git.raj.khem@gmail.com>
Subject: [PATCHv2 2/2] opkg-utils: Synchronise with OE
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
X-List-Received-Date: Thu, 19 May 2011 23:56:05 -0000

Import mtime-int.patch from OE commit
c81990aecae3bdf70a7c924699776b248ab7a006

Pass LDFLAGS to linker to avoid missing GNU_HASH QA errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opkg-utils/opkg-utils/mtime-int.patch          |   29 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    7 +++-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
new file mode 100644
index 0000000..fdbce21
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
@@ -0,0 +1,29 @@
+Convert mtime to int before comparing it
+
+The st_mtime attribute (which is a float) is compared against a value
+from the timestamp database, which was stored as an integer there.
+
+When working on a filesystem with precise timestamps the comparision
+will fail nearly everytime hence.
+
+Although it might be possible to enhance the database to store the
+fractional part too, this will complicate things more than we would
+gain by this change.
+
+Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+
+Upstream-Status: Pending
+
+Index: opkg-utils/opkg-make-index
+===================================================================
+--- opkg-utils.orig/opkg-make-index
++++ opkg-utils/opkg-make-index
+@@ -100,7 +100,7 @@ for filename in files:
+      pkg = None
+      fnameStat = os.stat(filename)
+      if old_pkg_hash.has_key(basename):
+-          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
++          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
+             if (verbose):
+                sys.stderr.write("Found %s in Packages\n" % (filename,))
+             pkg = old_pkg_hash[basename]
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index 0db6f80..79cee2e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -9,10 +9,12 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
-           file://index-ignore-filenotfound.patch"
+           file://index-ignore-filenotfound.patch \
+           file://mtime-int.patch \
+           "
 
 S = "${WORKDIR}/opkg-utils"
 
@@ -24,3 +26,4 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.4.1



