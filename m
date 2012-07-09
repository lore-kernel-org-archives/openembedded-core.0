Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMi-00065Z-N4
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292891"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:47:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:29 -0700
Message-Id: <436793644ca9b3ccb9c39fca3141970e9cecd463.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/41] sanity.bbclass: the tmpdir can't be longer than 410
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:15 -0000

From: Robert Yang <liezhi.yang@windriver.com>

There will be errors when the length of the tmpdir is longer than 410:

1) Longer than 420:
Can't exec "/bin/sh": Argument list too long at /usr/lib/perl/5.10/IO/File.pm line 66.

This error happens on both Ubuntu 10.04 and 10.10 when the pkg needs run
"autoreconf", this is because it passes many files with absolute path to
aclocal, aclocal passes them to perl, this is a limitation of the perl
on Ubuntu 10.04 and 10.10, and the perl-native is not ready at this very
early stage.

2) Longer than 490:
bitbake/lib/bb/persist_data.py", line 197, in connect(database=...)
    >    return sqlite3.connect(database, timeout=5, isolation_level=None)
OperationalError: unable to open database file

This error happens on Ubuntu 10.04, 10.10 and Fedora 17. This is because
the length of the database in sqlite3 module (host's) can't be longer
than 490 (or little smaller). The python-native is not ready at this
very early stage.

The 2 errors are host related, I think that limit the length of the
TMPDIR to 410 is OK for most of the build, rarely build sets TMPDIR's
longer than 410.

[YOCTO #2434]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6ed1e6f..765958e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -171,6 +171,11 @@ def check_create_long_filename(filepath, pathname):
         return "Failed to create %s directory in which to run long name sanity check: %s.\n" % (pathname, strerror)
     return ""
 
+def check_path_length(filepath, pathname, limit):
+    if len(filepath) > limit:
+	return "The length of %s is longer than 410, this would cause unexpected errors, please use a shorter path.\n" % pathname
+    return ""
+
 def check_connectivity(d):
     # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
     # using the same syntax as for SRC_URI. If the variable is not set
@@ -453,6 +458,9 @@ def check_sanity(sanity_data):
     tmpdir = sanity_data.getVar('TMPDIR', True)
     sstate_dir = sanity_data.getVar('SSTATE_DIR', True)
 
+    # The length of tmpdir can't be longer than 410
+    messages = messages + check_path_length(tmpdir, "TMPDIR", 410)
+
     # Check saved sanity info
     last_sanity_version = 0
     last_tmpdir = ""
-- 
1.7.7.6



