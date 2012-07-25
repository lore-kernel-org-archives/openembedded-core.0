Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Su91G-0006r2-Tj for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 23:21:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6PL9qTo014872
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 22:09:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14144-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 22:09:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6PL9hFZ014866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 22:09:45 +0100
Message-ID: <1343250583.29991.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2012 22:09:43 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] base/perlnative/pythonnative/gzipnative: Add a new variable to enable easier handling of native path issues
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
X-List-Received-Date: Wed, 25 Jul 2012 21:21:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If something is listed in ASSUME_PROVIDED but also manually built (like bzip2-native and
bzip2-replacement-native), we need to ensure that the installed binaries are only accessed
for things which list the provider in DEPENDS.

This patch adds a generic mechanism to handle this instead of everything reinventing the
wheel. EXTRANATIVEPATH += "perl-native" will ensure that ${STAGING_BINDIR_NATIVE}/perl-native
is added to PATH.

This means that:

a) Such providers should install to ${bindir}/xxx-native
b) Should PROVIDE += "xxxx-replacement-native"
c) That users should DEPEND on xxx-replacement-native and have EXTRANATIVEPATH += "xxx-native"

This patch enables this at the core level, the bzip2 recipe still needs adjusting to work
like this along with adjustment of the users of bzip2-replacement-native (python-native?).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 6532d10..5fdb96c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -74,6 +74,15 @@ FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/$
 # in the context of the location its used (:=)
 THISDIR = "${@os.path.dirname(d.getVar('FILE', True))}"
 
+def extra_path_elements(d):
+    path = ""
+    elements = (d.getVar('EXTRANATIVEPATH', True) or "").split()
+    for e in elements:
+        path = path + "${STAGING_BINDIR_NATIVE}/" + e + ":"
+    return path
+
+PATH_prepend = "${@extra_path_elements(d)}"
+
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
diff --git a/meta/classes/gzipnative.bbclass b/meta/classes/gzipnative.bbclass
index 4a41143..007e32c 100644
--- a/meta/classes/gzipnative.bbclass
+++ b/meta/classes/gzipnative.bbclass
@@ -1,3 +1,3 @@
-PATH_prepend = "${STAGING_BINDIR_NATIVE}/pigz-native:${STAGING_BINDIR_NATIVE}/gzip-native:"
+EXTRANATIVEPATH += "pigz-native gzip-native"
 DEPENDS += "gzip-native"
 
diff --git a/meta/classes/perlnative.bbclass b/meta/classes/perlnative.bbclass
index 2211b72..cc8de8b 100644
--- a/meta/classes/perlnative.bbclass
+++ b/meta/classes/perlnative.bbclass
@@ -1,3 +1,3 @@
-PATH_prepend = "${STAGING_BINDIR_NATIVE}/perl-native:"
+EXTRANATIVEPATH += "perl-native"
 DEPENDS += "perl-native"
 OECMAKE_PERLNATIVE_DIR = "${STAGING_BINDIR_NATIVE}/perl-native"
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index bc346da..7886207 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -1,3 +1,3 @@
 PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
-PATH_prepend = "${STAGING_BINDIR_NATIVE}/python-native:"
+EXTRANATIVEPATH += "python-native"
 DEPENDS += " python-native "





