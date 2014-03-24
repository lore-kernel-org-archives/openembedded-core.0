Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC19D6FAFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 05:33:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2O5Xni2027119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Mar 2014 22:33:49 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 23 Mar 2014 22:33:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 13:39:27 +0800
Message-ID: <2a59c1ff1d02cc72a4e82420dd055516b1ac8faa.1395639299.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395639298.git.liezhi.yang@windriver.com>
References: <cover.1395639298.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 2/3] archiver.bbclass: emit patch series files for original src
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
X-List-Received-Date: Mon, 24 Mar 2014 05:33:50 -0000
Content-Type: text/plain

Emit patch series files for original src so that the user knows how to
apply the patch orderly.

[YOCTO #5113]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9aa9335..8d8e7c4 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -150,6 +150,19 @@ python do_ar_original() {
             tar = tarfile.open(tarname, 'w:gz')
             tar.add('.')
             tar.close()
+
+    # Emit patch series files for 'original'
+    bb.note('Writing patch series files...')
+    for patch in src_patches(d):
+        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
+        patchdir = parm.get('patchdir')
+        if patchdir:
+            series = os.path.join(ar_outdir, 'series.subdir.%s' % patchdir.replace('/', '_'))
+        else:
+            series = os.path.join(ar_outdir, 'series')
+
+        with open(series, 'a') as s:
+            s.write('%s -p%s\n' % (os.path.basename(local), parm['striplevel']))
 }
 
 python do_ar_patched() {
-- 
1.8.3.1


