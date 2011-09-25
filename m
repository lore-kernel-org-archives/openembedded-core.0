Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R7rDo-0002oW-CC
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 18:06:28 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3Vkg016368 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:31 +0100
X-Quarantine-ID: <D3omkz9zpzze>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D3omkz9zpzze
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:30 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3QtL016313
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:27 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R7r4g-0005X6-Uv
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 16:57:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 16:56:59 +0100
Message-Id: <6a2515b919fe6d4a7d58c39112c17111b133e27e.1316963134.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
References: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
References: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/9] autotools.bbclass: Set the dynamic linker search path for libtool correctly
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
X-List-Received-Date: Sun, 25 Sep 2011 16:06:28 -0000

libtool obtains the search path from /etc/ld.so.conf and hardcodes /usr/lib
and /lib. This results in host contamination and variable sets of RPATH
values ending up in binaries.

By exporting the correct values for all autotools recipes we avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass |    2 ++
 meta/classes/native.bbclass    |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 8f65b70..f213c18 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -31,6 +31,8 @@ export CONFIG_SITE = "${@siteinfo_get_files(d)}"
 acpaths = "default"
 EXTRA_AUTORECONF = "--exclude=autopoint"
 
+export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir}"
+
 def autotools_set_crosscompiling(d):
 	if not bb.data.inherits_class('native', d):
 		return " cross_compiling=yes"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 9a41f19..5e45aed 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -69,6 +69,9 @@ exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 
 libdir = "${STAGING_DIR_NATIVE}${libdir_native}"
 
+# Libtool's default paths are correct for the native machine
+lt_cv_sys_lib_dlsearch_path_spec[unexport] = "1"
+
 NATIVE_PACKAGE_PATH_SUFFIX = ""
 bindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
-- 
1.7.5.4



