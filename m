Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89B1E60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 20:53:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9GKr3mW025165
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 13:53:04 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 13:53:03 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 13:53:03 -0700
Message-ID: <1413492783-4423-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver: fix truncation of src_rev
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
X-List-Received-Date: Thu, 16 Oct 2014 20:53:06 -0000
Content-Type: text/plain

In trying to eliminate AUTOINC+ from revision strings,
we accidently truncated the strings to almost guarantee
information from SRCREV_FORMAT, when supplied, would be
lost.  So, we now only delete any AUTOINC+'s from the string.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/archiver.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 058ba63..b598aa3 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -146,9 +146,9 @@ python do_ar_original() {
             fetch.unpack(tmpdir, (url,))
 
             os.chdir(tmpdir)
-            # We split on '+' to chuck any annoying AUTOINC+ in the revision.
+            # We eliminate any AUTOINC+ in the revision.
             try:
-                src_rev = bb.fetch2.get_srcrev(d).split('+')[-1][:10]
+                src_rev = bb.fetch2.get_srcrev(d).replace('AUTOINC+','')
             except:
                 src_rev = 'NOREV'
             tarname = os.path.join(ar_outdir, basename + '.' + src_rev + '.tar.gz')
-- 
1.7.3.4


