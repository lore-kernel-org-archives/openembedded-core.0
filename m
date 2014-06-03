Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 404766FA51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 01:56:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s531u3jZ010397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 18:56:03 -0700 (PDT)
Received: from PEK-WKANG-D1.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 2 Jun 2014 18:56:03 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jun 2014 09:55:25 +0800
Message-ID: <1401760525-17167-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] fetch2/svn.py: fix Unable to fetch URL bug
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
X-List-Received-Date: Tue, 03 Jun 2014 01:56:09 -0000
Content-Type: text/plain

For svn source, when download a revsion on branches, if the download
revsion < the branch created time revsion, then it will fail.

The detail description reference the Yocto Project bugzilla, please see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=6258

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 lib/bb/fetch2/svn.py |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/bb/fetch2/svn.py b/lib/bb/fetch2/svn.py
index 8847461..75e21df 100644
--- a/lib/bb/fetch2/svn.py
+++ b/lib/bb/fetch2/svn.py
@@ -98,7 +98,8 @@ class Svn(FetchMethod):
             suffix = ""
             if ud.revision:
                 options.append("-r %s" % ud.revision)
-                suffix = "@%s" % (ud.revision)
+                #follow this line can make the fetch fail when download a revsion on branches if the download revsion < the branch created time revsion.
+                #suffix = "@%s" % (ud.revision)
 
             if command == "fetch":
                 svncmd = "%s co %s %s://%s/%s%s %s" % (ud.basecmd, " ".join(options), proto, svnroot, ud.module, suffix, ud.module)
-- 
1.7.9.5


