Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TFT8t-00031V-4d
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:05:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TFSwZ-00020x-Ng
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 18:52:39 +0200
Message-ID: <1348332621.4444.219.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 17:50:21 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] sqlite3: enable USE_PREAD
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
X-List-Received-Date: Sat, 22 Sep 2012 17:05:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This gives a small but measureable performance improvement for
I/O heavy workloads.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-support/sqlite/sqlite3.inc       |    4 ++++
 meta/recipes-support/sqlite/sqlite3_3.7.13.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 0cc5d65..70841f8 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -17,6 +17,10 @@ export config_TARGET_LINK = "${CCLD}"
 export config_TARGET_CFLAGS = "${CFLAGS}"
 export config_TARGET_LFLAGS = "${LDFLAGS}"
 
+# pread() is in POSIX.1-2001 so any reasonable system must surely support it
+BUILD_CFLAGS += "-DUSE_PREAD"
+TARGET_CFLAGS += "-DUSE_PREAD"
+
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
 
 FILES_${PN} = "${bindir}/*"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb b/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
index 4e050a3..48b50ac 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
@@ -2,7 +2,7 @@ require sqlite3.inc
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071300.tar.gz"
 S = "${WORKDIR}/sqlite-autoconf-3071300"
-- 
1.7.9





