Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3F3373179
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7FAEN013859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:10 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:39 -0800
Message-ID: <c44d41b0dec7457c4347a00b21d8b5bd24a9b887.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 31/40] devtool: upgrade: fix removing other recipes from workspace on reset
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:09 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

If you did a "devtool add" followed by "devtool upgrade" and then did
a "devtool reset" on the recipe you upgraded, the first recipe would
also be deleted from the workspace - this was because we were
erroneously adding the entire "recipes" subdirectory and its contents to
be tracked for removal on reset. Remove the unnecessary call to
os.path.dirname() that caused this.

(From OE-Core master rev: 65354e066f87df7d3138adceb22d6a05d1685904)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/standard.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c5c647b..d9b624d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -456,7 +456,7 @@ def _add_md5(config, recipename, filename):
             f.write('%s|%s|%s\n' % (recipename, os.path.relpath(fn, config.workspace_path), md5))
 
     if os.path.isdir(filename):
-        for root, _, files in os.walk(os.path.dirname(filename)):
+        for root, _, files in os.walk(filename):
             for f in files:
                 addfile(os.path.join(root, f))
     else:
-- 
1.7.9.5


