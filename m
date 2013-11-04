Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 28CF26D472
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 14:38:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA4EcB4w028332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2013 06:38:11 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 4 Nov 2013 06:38:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2013 06:40:06 +0800
Message-ID: <50d08f9838c43df14de5c2700e08779e102cfc1f.1383604532.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1383604532.git.liezhi.yang@windriver.com>
References: <cover.1383604532.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] sanity.bbclass: move conf/sanity_info into TMPDIR
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
X-List-Received-Date: Mon, 04 Nov 2013 14:38:09 -0000
Content-Type: text/plain

Move conf/sanity_info into TMPDIR, otherwise, when we reset TMPDIR to
another dir, the SANITY_VERSION from conf/sanity_info and
sanity_data.getVar('SANITY_VERSION', True) are still the same, so that
the check_sanity_version_change() would not rerun.

Another fix is that we can move the TMPDIR/saved_tmpdir to conf dir, but
that will make we can't reset the TMPDIR.

[YOCTO #5442]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b8e5b02..5f085ee 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -694,7 +694,7 @@ def check_sanity(sanity_data):
     last_sanity_version = 0
     last_tmpdir = ""
     last_sstate_dir = ""
-    sanityverfile = sanity_data.expand("${TOPDIR}/conf/sanity_info")
+    sanityverfile = os.path.join(tmpdir, "sanity_info")
     if os.path.exists(sanityverfile):
         with open(sanityverfile, 'r') as f:
             for line in f:
-- 
1.8.3.1


