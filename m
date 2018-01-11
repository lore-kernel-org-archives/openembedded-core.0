Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 1356 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jan 2018 15:56:47 UTC
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
	by mail.openembedded.org (Postfix) with ESMTP id D136E787C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:56:47 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1eZers-0004Y0-FN
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Jan 2018 16:34:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9zgcTEuxMRYZRvxKG/apTWLVfODDqNCWYVq7l1I3sUg=;
	b=DEgfN/+8p3xEZQdoWhgN/uQkss
	03WcSpBvm1oz6/yJqco4h/RO0bk55oDBpVD4ZcMFNdqB2RhErd6oyux4+vqAnxbFRjVBLysG7Ik60
	HhhqsU/bSge4eLzDmdKMNKphPa8TXHN1MVYtZYDvbOwbpgtxoOplBaE0FXbEYRKrGtxSeMgNTKG9B
	biZj/o/+GPEV6mgNgxq90+LI3A4kaGhGj417mqX0QBO9Reogps8RcoVKJuxnA0BFTkLvuT4aGT5RU
	MYvF8WnTTrhGYXKVrdn8lsDpiAoA6nIprd1u+UCjbwdQgj+I3KGZ214fCD7Q+J1Fo982lgmrjn83Q
	/Qx/4Rzw==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1eZero-0003Nn-PS; Thu, 11 Jan 2018 16:34:10 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 16:33:50 +0100
Message-Id: <20180111153350.25645-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report-Back: Spamchecker on "prspamd4.pr.hu" has DOESN'T believe this
	is spam.
	pts rule name              description  (score: __SCORE__ points)
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 1.0000]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 1.0000]
	-1.2 AWL AWL: Adjusted score from AWL reputation of From: address
	Preview: When downgrading a package or using a substitute with lower
	version, the way to do it is adding or increasing PE. But it didn't help
	dependant packages because the shlib records didn't contain PE,
	only PV. [...]
X-Scan-Signature: 8f5da0c40d649b22aaae3fc58f517802
X-Spam-Tracer: backend.mail.pr.hu 2.3 20180111153410Z
Subject: [PATCH] Record PE value for shlib dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 15:56:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When downgrading a package or using a substitute with lower version,
the way to do it is adding or increasing PE. But it didn't help
dependant packages because the shlib records didn't contain PE, only PV.

Let's add the PE value into these records for packages where it's set.

The in-memory variables storing the versions use the PE:PV notation
but the on-disk files must use something else because the : character
is already used as field delimiter in the package.list files storing
these shlib records. Use # instead in the files, so the file format
doesn't change. Conversion occurs on reading/writing the package.list
files.

Signed-off-by: Zoltán Böszörményi <zboszor@pr.hu>
---
 meta/classes/package.bbclass | 6 +++++-
 meta/lib/oe/package.py       | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7dc759699f..966c059851 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1686,6 +1686,10 @@ python package_do_shlibs() {
         if not pkgver:
             pkgver = ver
 
+        pkgpe = d.getVar('PE')
+        if pkgpe:
+            pkgver = pkgpe + ':' + pkgver
+
         needed[pkg] = []
         sonames = list()
         renames = list()
@@ -1714,7 +1718,7 @@ python package_do_shlibs() {
                     if old_pkg != pkg:
                         bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s[0], pkg, pkgver))
                 bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s[0]))
-                fd.write(s[0] + ':' + s[1] + ':' + s[2] + '\n')
+                fd.write(s[0] + ':' + s[1] + ':' + s[2].replace(':', '#', 1) + '\n')
                 if s[0] not in shlib_provider:
                     shlib_provider[s[0]] = {}
                 shlib_provider[s[0]][s[1]] = (pkg, pkgver)
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1e5c3aa8e1..d19fe7312d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -258,7 +258,7 @@ def read_shlib_providers(d):
                     s = l.strip().split(":")
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
-                    shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
+                    shlib_provider[s[0]][s[1]] = (dep_pkg, s[2].replace('#', ':', 1))
     return shlib_provider
 
 
-- 
2.14.3


