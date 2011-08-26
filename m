Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1QwwrX-0006e2-6r
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 15:54:23 +0200
Received: by bkbzu17 with SMTP id zu17so2653066bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Mf41b1ynwUKMuEhzyQEwZkiI/wav7bra/Djp5s+sqYM=;
	b=wnpaw+EKf1b1twHUDrs/advdM3mYynr0z1ajOWy7RbZR1pkdm8/kkAZ4FpCdQ1yckV
	zbiuCwMvvncFTqvDqwnZdNJXD1je8+svBqZjU89xJbxtIIS97I8RfqDJQkR9dDUTiW/P
	Rh+VM+xRJdYfTIxG0ljXi8Hg70ApYsIZ4sY88=
Received: by 10.204.135.24 with SMTP id l24mr596548bkt.276.1314366573769;
	Fri, 26 Aug 2011 06:49:33 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id h18sm477675bkr.34.2011.08.26.06.49.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 06:49:32 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 17:49:25 +0400
Message-Id: <1314366565-9185-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [V2] opkg-utils: ignore packages disapperaring filelist generation
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
X-List-Received-Date: Fri, 26 Aug 2011 13:54:23 -0000

Package files disappearing during index generation don't cause a fatal
error. Make package file disappearing during filelist generation also
a non-fatal error.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../opkg-utils/index-ignore-filenotfound.patch     |   17 +++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    2 +-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
index 3664df6..f0f0fcf 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
@@ -54,3 +54,20 @@ Index: opkg-utils/opkg-make-index
  if packages_filename:
       sys.stdout.close()
       sys.stdout = old_stdout
+@@ -197,7 +197,15 @@
+ names = packages.packages.keys()
+ names.sort()
+ for name in names:
+-     for fn in packages[name].get_file_list():
++     try:
++          fnlist = packages[name].get_file_list()
++     except OSError, e:
++          sys.stderr.write("Package %s disappeared on us!\n" % (name))
++          continue
++     except IOError, e:
++          sys.stderr.write("Package %s disappeared on us!\n" % (name))
++          continue
++     for fn in fnlist:
+           (h,t) = os.path.split(fn)
+           if not t: continue
+           if not files.has_key(t): files[t] = name+':'+fn
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index fd2b5e6..e04b74a 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
            file://index-ignore-filenotfound.patch \
-- 
1.7.2.5



