Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDA756FFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 16:44:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBAGiiXn013772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 08:44:45 -0800 (PST)
Received: from yow-kscherer-d1.wrs.com (128.224.56.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 10 Dec 2015 08:44:44 -0800
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Dec 2015 11:44:42 -0500
Message-ID: <1449765882-15910-3-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449765882-15910-1-git-send-email-konrad.scherer@windriver.com>
References: <1449765882-15910-1-git-send-email-konrad.scherer@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] signing-keys: Use GPG_PATH as keyring location if it is defined
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

While experimenting with signing rpms, I attempted to import the keys
into a temporary keyring and set GPG_PATH to the temporary keyring.
This fails because the gpg export call cannot find the requested key
in the default keyring.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/recipes-core/meta/signing-keys.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index c19a5fe..ecfcfd0 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -26,8 +26,11 @@ def export_gpg_pubkey(d, keyid, path):
     bb.utils.mkdirhier(os.path.dirname(path))
     gpg_bin = d.getVar('GPG_BIN', True) or \
               bb.utils.which(os.getenv('PATH'), "gpg")
-    cmd = '%s --batch --yes --export --armor -o %s %s' % \
-          (gpg_bin, path, keyid)
+    cmd = gpg_bin
+    if d.getVar('GPG_PATH', True):
+        cmd += " --homedir %s" % d.getVar('GPG_PATH', True)
+    cmd += ' --batch --yes --export --armor -o %s %s' % (path, keyid)
+
     status, output = oe.utils.getstatusoutput(cmd)
     if status:
         raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
-- 
2.6.3


