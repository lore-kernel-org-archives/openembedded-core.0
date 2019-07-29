Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-11.clustermail.de (good-out-11.clustermail.de
	[212.223.35.73])
	by mail.openembedded.org (Postfix) with ESMTP id 49BD67F242
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 11:37:31 +0000 (UTC)
Received: from [10.0.0.9] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1hs3y2-0000xT-69; Mon, 29 Jul 2019 13:37:32 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1hs3y2-0007FO-3x; Mon, 29 Jul 2019 13:37:26 +0200
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 29 Jul 2019 13:37:25 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jul 2019 13:37:02 +0200
Message-ID: <20190729113702.20541-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: [warrior][PATCH] package: Improve determinism
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
X-List-Received-Date: Mon, 29 Jul 2019 11:37:32 -0000
Content-Type: text/plain

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its possible in cases with multiple shlib providers we were not being
deterministic. Add in a couple of sorted() calls to fix the shlibs and
pkgconfig cases with this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 2 +-
 meta/lib/oe/package.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8b89fb1129..e67bb5bd97 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1924,7 +1924,7 @@ python package_do_pkgconfig () {
     for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = re.match(r'^(.*)\.pclist$', file)
             if m:
                 pkg = m.group(1)
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b59513227b..b8585d4253 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -265,7 +265,7 @@ def read_shlib_providers(d):
         bb.debug(2, "Reading shlib providers in %s" % (dir))
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = list_re.match(file)
             if m:
                 dep_pkg = m.group(1)
-- 
2.17.1


