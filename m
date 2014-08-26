Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 155A86ACBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 17:18:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7QHIKgv010898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 10:18:20 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 26 Aug 2014 10:18:20 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Aug 2014 10:18:19 -0700
Message-ID: <1409073499-25853-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: add revision to git tarfile name
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
X-List-Received-Date: Tue, 26 Aug 2014 17:18:22 -0000
Content-Type: text/plain

When archiving original source, insert the first 10
characters of srcrev, after stripping off any
AUTOINC+, into the filename for tarfiles created
from directories.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/archiver.bbclass |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 35e5411..9f0ed57 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -136,7 +136,7 @@ python do_ar_original() {
     bb.note('Archiving the original source...')
     fetch = bb.fetch2.Fetch([], d)
     for url in fetch.urls:
-        local = fetch.localpath(url).rstrip("/");
+        local = fetch.localpath(url)
         if os.path.isfile(local):
             shutil.copy(local, ar_outdir)
         elif os.path.isdir(local):
@@ -146,7 +146,12 @@ python do_ar_original() {
             fetch.unpack(tmpdir, (url,))
 
             os.chdir(tmpdir)
-            tarname = os.path.join(ar_outdir, basename + '.tar.gz')
+            # We split on '+' to chuck any annoying AUTOINC+ in the revision.
+            try:
+                src_rev = bb.fetch2.get_srcrev(d).split('+')[-1][:10]
+            except:
+                src_rev = 'NOREV'
+            tarname = os.path.join(ar_outdir, basename + '.' + src_rev + '.tar.gz')
             tar = tarfile.open(tarname, 'w:gz')
             tar.add('.')
             tar.close()
-- 
1.7.3.4


