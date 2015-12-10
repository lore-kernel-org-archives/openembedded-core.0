Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACE36FFDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 16:44:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBAGiigH010305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 08:44:44 -0800 (PST)
Received: from yow-kscherer-d1.wrs.com (128.224.56.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 10 Dec 2015 08:44:43 -0800
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Dec 2015 11:44:41 -0500
Message-ID: <1449765882-15910-2-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449765882-15910-1-git-send-email-konrad.scherer@windriver.com>
References: <1449765882-15910-1-git-send-email-konrad.scherer@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] signing-keys: Create destination path for exported keys
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
X-List-Received-Date: Thu, 10 Dec 2015 16:44:45 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

When testing the do_export_public_keys function using
  bitbake -c do_export_public_keys signing-keys
the destination path for the exported keys does not exist
and the gpg export call fails.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/recipes-core/meta/signing-keys.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index cc401f3..c19a5fe 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -22,6 +22,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 def export_gpg_pubkey(d, keyid, path):
     import bb
+    import os.path
+    bb.utils.mkdirhier(os.path.dirname(path))
     gpg_bin = d.getVar('GPG_BIN', True) or \
               bb.utils.which(os.getenv('PATH'), "gpg")
     cmd = '%s --batch --yes --export --armor -o %s %s' % \
-- 
2.6.3


