Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5F71762B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 07:24:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u127O8YI018177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Feb 2016 23:24:09 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 1 Feb 2016 23:24:07 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Feb 2016 15:24:14 +0800
Message-ID: <85bc5cc65e85550a8e008db4ea3434a652553ed5.1454397788.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454397788.git.Qi.Chen@windriver.com>
References: <cover.1454397788.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] signing-keys: add sstate task for do_export_public_keys
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
X-List-Received-Date: Tue, 02 Feb 2016 07:24:09 -0000
Content-Type: text/plain

Add sstate task for do_export_public_keys so that the installation of
extensible SDK does not fail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/signing-keys.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index d7aa79d..60f05cf 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -41,3 +41,11 @@ python do_export_public_keys () {
         signer.export_pubkey(d.getVar('PACKAGE_FEED_GPG_PUBKEY', True))
 }
 addtask do_export_public_keys before do_build
+
+SSTATETASKS += "do_export_public_keys"
+do_export_public_keys[sstate-inputdirs] = ""
+do_export_public_keys[sstate-outputdirs] = ""
+python do_export_public_keys_setscene () {
+    sstate_setscene(d)
+}
+addtask do_export_public_keys_setscene
-- 
1.9.1


