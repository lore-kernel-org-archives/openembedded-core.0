Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9449460017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 08:38:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2N8c5W5030353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 01:38:05 -0700
Received: from pek-wkang-u14.corp.ad.wrs.com (128.224.162.238) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Mar 2016 01:38:04 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Mar 2016 16:35:48 +0800
Message-ID: <1458722149-12730-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] relocate_sdk: fixed .gccrelocprefix section handling
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
X-List-Received-Date: Wed, 23 Mar 2016 08:38:07 -0000
Content-Type: text/plain

When fixing paths for .gccrelocprefix section, it will corrupt the next
entry during updating the current one if "new_prefix" length is more
than "DEFAULT_INSTALL_DIR", this problem is obvious on the code, but it's
only found when install sdk onto a net file system.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 scripts/relocate_sdk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 992db5c..ceca1f2 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -166,6 +166,7 @@ def change_dl_sysdirs():
                 while (offset + 4096) <= sh_size:
                     path = f.read(4096)
                     new_path = old_prefix.sub(new_prefix, path)
+                    new_path = new_path.rstrip(b("\0"))
                     # pad with zeros
                     new_path += b("\0") * (4096 - len(new_path))
                     #print "Changing %s to %s at %s" % (str(path), str(new_path), str(offset))
-- 
1.9.1


