Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJmGZ-0005vO-OG
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 15:46:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3GDbQjG019407
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 06:37:26 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Apr 2012 06:37:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 21:38:13 +0800
Message-ID: <27a3639fa7498452e22f8b0b1a03c100ddb98014.1334583221.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334583221.git.liezhi.yang@windriver.com>
References: <cover.1334583221.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] autoconf-nativesdk: fix builds on fedora 17
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
X-List-Received-Date: Mon, 16 Apr 2012 13:46:52 -0000
Content-Type: text/plain

Generally distros keep perl at /sur/bin/perl
Fedora 17 also has /bin/perl

this causes autoconf-nativesdk build on such distros to put perl
interpreter path in the perl scripts as /bin/perl

But we set perl location for target as /usr/bin/perl

This mismatch of perl path causes failure of rootfs image creation
like this:

| error: Failed dependencies:
|       /bin/perl is needed by autoconf-nativesdk-2.68-r6.x86_64.rpm
NOTE: package meta-toolchain-gmae-1.0-r7: task do_populate_sdk: Failed

The second sed command is for such a case:

eval 'case $# in 0) exec /bin/perl -S "$0";; *) exec /bin/perl -S "$0" "$@";; esac'

This line has two "/bin/perl" and we can't use a line number to tell
sed which line it is since the line numbers in different files are
defferent.

[YOCTO #2304]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |   16 +++++++++++++++-
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 80a5d92..3ae98c8 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -17,6 +17,20 @@ SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
 
 inherit autotools
 
+PERLPATH = "${bindir}/perl"
+PERLPATH_virtclass-native = "/usr/bin/perl"
+PERLPATH_virtclass-nativesdk = "/usr/bin/perl"
+
 do_install_append() {
-	rm -rf ${D}${datadir}/emacs
+    rm -rf ${D}${datadir}/emacs
+
+    # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+    # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+    for i in autoheader autom4te autoreconf autoscan autoupdate ifnames; do
+        if [ -f ${D}${bindir}/$i ]; then
+            sed -i -e '1s,#!.*perl,#! ${PERLPATH},' \
+            -e 's,exec .*/bin/perl \(.*\) exec .*/bin/perl \(.*\),exec ${PERLPATH} \1 exec ${PERLPATH} \2,' \
+            ${D}${bindir}/$i
+        fi
+    done
 } 
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index f1b506a..8d466e0 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r6"
+PR = "r7"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.1



