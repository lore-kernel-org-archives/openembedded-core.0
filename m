Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Song.Li@windriver.com>) id 1U8rmY-00087c-KG
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 13:31:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1MAqlWN025274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2013 02:52:47 -0800 (PST)
Received: from pek-usp-11.wrs.com (128.224.163.66) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 22 Feb 2013 02:52:47 -0800
From: <Song.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Feb 2013 18:52:19 +0800
Message-ID: <1361530339-13824-1-git-send-email-Song.Li@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] pakcage.bbclass:use a better way to cut -dev/-dbg suffix
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
X-List-Received-Date: Fri, 22 Feb 2013 12:31:34 -0000
Content-Type: text/plain

From: "Song.Li" <Song.Li@windriver.com>

In pakcage.bbclass,function replace('-dev', '') is
used to cut '-dev' suffix. but it will cause the
name "lib32-device-dev" to "lib32ice",
so change it to [:-4].

Signed-off-by: Song.Li <Song.Li@windriver.com>
---
 meta/classes/package.bbclass |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 77b3b4a..b9ac0e6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1634,9 +1634,9 @@ python package_depchains() {
                 #bb.note("Skipping %s" % depend)
                 continue
             if depend.endswith('-dev'):
-                depend = depend.replace('-dev', '')
+                depend = depend[:-4]
             if depend.endswith('-dbg'):
-                depend = depend.replace('-dbg', '')
+                depend = depend[:-4]
             pkgname = getname(depend, suffix)
             #bb.note("Adding %s for %s" % (pkgname, depend))
             if pkgname not in rreclist and pkgname != pkg:
@@ -1655,9 +1655,9 @@ python package_depchains() {
                 #bb.note("Skipping %s" % depend)
                 continue
             if depend.endswith('-dev'):
-                depend = depend.replace('-dev', '')
+                depend = depend[:-4]
             if depend.endswith('-dbg'):
-                depend = depend.replace('-dbg', '')
+                depend = depend[:-4]
             pkgname = getname(depend, suffix)
             #bb.note("Adding %s for %s" % (pkgname, depend))
             if pkgname not in rreclist and pkgname != pkg:
-- 
1.7.9.5



