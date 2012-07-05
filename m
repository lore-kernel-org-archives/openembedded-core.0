Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Smi3E-0005bq-UN
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 11:08:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q658vZgR025162
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2012 01:57:35 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 5 Jul 2012 01:57:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2012 16:57:33 +0800
Message-ID: <f60e1ac7831879919453664410fb6ad7b2cefdc7.1341462183.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1341462182.git.liezhi.yang@windriver.com>
References: <cover.1341462182.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] sanity.bbclass: the tmpdir can't be longer than 410
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
X-List-Received-Date: Thu, 05 Jul 2012 09:08:41 -0000
Content-Type: text/plain

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
1.7.1



