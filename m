Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62F8771AD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 02:40:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAO2e9gh020060
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 18:40:09 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 23 Nov 2016 18:40:08 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2016 10:40:05 +0800
Message-ID: <7221ce1bca413a4e650d5d5882b1e496476e4ebc.1479955151.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1479955151.git.dengke.du@windriver.com>
References: <cover.1479955151.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: fix can't create diff tarball
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
X-List-Received-Date: Thu, 24 Nov 2016 02:40:08 -0000
Content-Type: text/plain

When enable:
	ARCHIVER_MODE[src] = "configured"
	ARCHIVER_MODE[diff] = "1"

There is no "diff" tarball created, just "configured" tarball created, in log
file: log.do_unpack_and_patch, it said that directory doesn't exist.

This is because when enable "diff" and "configured", system use create_diff_gz and
do_ar_configured function respectively.

In do_ar_configured function, it use create_tarball function, and the create_tarball
use the function:

	bb.utils.mkdirhier(ar_outdir)

So when creating "configured" tarball, there was no "directory doesn't exist" problem
and it was created successfully.

In create_diff_gz function, it didn't create the directory "ar_outdir", so it can't create
"diff" tarball, and throw the problem that directory doesn't exit.

So we should add the

	bb.utils.mkdirhier(ar_outdir)

to function create_diff_gz in archiver.bbclass.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/classes/archiver.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9239983..abe6f2b 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -290,6 +290,7 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     dirname = os.path.dirname(src)
     basename = os.path.basename(src)
     os.chdir(dirname)
+    bb.utils.mkdirhier(ar_outdir)
     out_file = os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF', True))
     diff_cmd = 'diff -Naur %s.orig %s.patched | gzip -c > %s' % (basename, basename, out_file)
     subprocess.call(diff_cmd, shell=True)
-- 
2.7.4


