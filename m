Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B13B65C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 12:44:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA1CilgH030578
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2016 05:44:48 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Nov 2016 05:44:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Nov 2016 05:44:46 -0700
Message-ID: <07270c9fd68b8a4a4154458ad01d44da1c66291a.1478004257.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1478004257.git.liezhi.yang@windriver.com>
References: <cover.1478004257.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass:buildpaths: open() file with 'rb'
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
X-List-Received-Date: Tue, 01 Nov 2016 12:44:47 -0000
Content-Type: text/plain

open() is default to 'rt' which may cause decoding errors when open
binary file:
$ bitbake xcursor-transparent-theme
[snip]
Exception: UnicodeDecodeError: 'utf-8' codec can't decode byte 0xfd in position 18: invalid start byte
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1d73778..a5c93f3 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -647,8 +647,8 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
         return
 
     tmpdir = d.getVar('TMPDIR', True)
-    with open(path) as f:
-        file_content = f.read()
+    with open(path, 'rb') as f:
+        file_content = f.read().decode('utf-8', errors='ignore')
         if tmpdir in file_content:
             package_qa_add_message(messages, "buildpaths", "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
 
-- 
2.9.0


