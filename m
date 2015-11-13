Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 06A4C77288
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:22:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD8M2x9028158
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:22:02 -0800 (PST)
Received: from pek-jliu7-d1.corp.ad.wrs.com (128.224.162.138) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 00:22:01 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 16:21:46 +0800
Message-ID: <1447402906-31562-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] archiver.bbclass: add bbappend when do_ar_recipe kernel and gcc packages
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
X-List-Received-Date: Fri, 13 Nov 2015 08:22:06 -0000
Content-Type: text/plain

bbappend files are not included in the archiver during do_ar_recipe.
Find and put them into the tarball.

Signed-off-by: Jian Liu <jian.liu@windriver.com>

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 1d17fc5..ccb5b09 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -369,6 +369,16 @@ python do_ar_recipe () {
     bb.utils.mkdirhier(outdir)
     shutil.copy(bbfile, outdir)
 
+    pn = d.getVar('PN', True)
+    bbappend_files = d.getVar('BBINCLUDED', True).split()
+    # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
+    # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
+    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
+    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
+    for file in bbappend_files:
+        if bbappend_re.match(file) or bbappend_re1.match(file):
+            shutil.copy(file, outdir)
+
     dirname = os.path.dirname(bbfile)
     bbpath = '%s:%s' % (dirname, d.getVar('BBPATH', True))
     f = open(bbfile, 'r')

