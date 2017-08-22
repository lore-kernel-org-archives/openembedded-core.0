Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 444D67829F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:23:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M1NJBo028938
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:23:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 18:23:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 18:23:09 -0700
Message-ID: <b49c3d0bbad29c28b6b6584f72176673de4f253f.1503364879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503364879.git.liezhi.yang@windriver.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/9] utils/logparser.py: fix section check
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
X-List-Received-Date: Tue, 22 Aug 2017 01:23:18 -0000
Content-Type: text/plain

The section might be None or '', so use "if section" for it.

Fixed:
File "/buildarea/lyang1/poky/meta/lib/oeqa/utils/logparser.py", line 113, in log_as_files
    prefix += section
TypeError: Can't convert 'NoneType' object to str implicitly

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/utils/logparser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 4355ce0..0670627 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -109,7 +109,7 @@ class Result(object):
             prefix = ''
             for x in test_status:
                 prefix +=x+'.'
-            if (section != ''):
+            if section:
                 prefix += section
             section_file = os.path.join(target_dir, prefix)
             # purge the file contents if it exists
-- 
2.10.2


