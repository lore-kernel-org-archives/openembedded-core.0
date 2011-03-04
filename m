Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PvSSn-0005YH-KD
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 11:42:25 +0100
Received: by fxm8 with SMTP id 8so2002653fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 02:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=0wX4VPhpY9bV7EQbQu4NKoJKdSlF0jjya87NNc+4Y60=;
	b=Vv6CpOplqcLN3byqvSzvxnT59ioELfNfofDhDqr3PaCzGAxxWp4jC2hASqpcWHBXvY
	pAiyEapbUqkwLFwsQhYvqorF0lYHnPSzJ3eRd7wqTYkEIG8VWY3fATb8Y8VZvxc4QP/N
	R3GiJglhp0Rftvy5IuZ0IDOYqdTUsX42JwQFk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FGtFSYurOAcKxQveAeFfHI6mF+N9vUrC49Q6iEVvi0k03wvHJhtGidEaDDmbGjs6zh
	LL1/gIIvL5I9lKY4S6tOjuYwsJCp1yh0dZUTZPCuhAftLMsSUt4U8MJeYrbknzeHFtsk
	0Bo1AmW7w8Ij9VVNOrZ8fnQuOOLedQlSuaqHI=
Received: by 10.223.115.10 with SMTP id g10mr611437faq.6.1299235255642;
	Fri, 04 Mar 2011 02:40:55 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm257701fak.10.2011.03.04.02.40.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 02:40:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2011 11:40:47 +0100
Message-Id: <1299235247-5527-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] bitbake.conf: point PERSISTENT_DIR outside TMPDIR
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
X-List-Received-Date: Fri, 04 Mar 2011 10:42:25 -0000

* sanity check warning user that he still has peristent cache in old location
* similar patch was sent to OE, to keep PERSISTENT_DIR location consistent
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/030623.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sanity.bbclass |    8 ++++++++
 meta/conf/bitbake.conf      |    2 +-
 meta/conf/sanity.conf       |    1 +
 3 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 64af555..9a0dfcc 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -302,6 +302,14 @@ def check_sanity(e):
     elif oeroot.find (' ') != -1:
         messages = messages + "Error, you have a space in your POKYBASE directory path. Please move Poky to a directory which doesn't include a space."
 
+    #
+    # Check there isn't old persistent cache
+    #
+    persistent_dir = data.getVar('PERSISTENT_DIR', e.data, True)
+    persistent_cache_filename = data.getVar('SANITY_PERSIST_DATA_FILE', e.data, True)
+    if os.path.exists(tmpdir + '/cache/' + persistent_cache_filename):
+        messages = messages + "Error, persistent cache file '%s' exists in old location '%s', please migrate it to new location '%s' and merge them together if you have one for each MACHINE.\n" % (persistent_cache_filename, tmpdir + '/cache/', persistent_dir)
+
     if messages != "":
         raise_sanity_error(messages)
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 55db1ab..1fdd4c5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -270,7 +270,7 @@ FILESDIR = "${@bb.which(bb.data.getVar('FILESPATH', d, 1), '.')}"
 TMPDIR ?= "${TOPDIR}/tmp"
 CACHE = "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
 # The persistent cache should be shared by all builds
-PERSISTENT_DIR = "${TMPDIR}/cache"
+PERSISTENT_DIR = "${TOPDIR}/conf/persistent"
 LOG_DIR = "${TMPDIR}/log"
 CO_DIR = "${DL_DIR}"
 CVSDIR = "${CO_DIR}/cvs"
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index fcaed11..46b542d 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -6,6 +6,7 @@
 BB_MIN_VERSION = "1.8.10"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
+SANITY_PERSIST_DATA_FILE = "bb_persist_data.sqlite3"
 
 SANITY_VERSION = "1"
 POKY_CONF_VERSION  = "1"
-- 
1.7.4.1



