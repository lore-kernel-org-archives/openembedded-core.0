Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D750749A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 08:05:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4885kYD017246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2018 01:05:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 8 May 2018 01:05:45 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2018 16:07:09 +0800
Message-ID: <ca99a33e28d5c01cd0cd64f24373ac52a016f9af.1525764187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1525764187.git.Qi.Chen@windriver.com>
References: <cover.1525764187.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] testsdkext: remove workspace/sources to avoid failure in case of multilib
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
X-List-Received-Date: Tue, 08 May 2018 08:05:46 -0000
Content-Type: text/plain

When multilib is enabled, there are multiple environment scripts, and the
test cases for eSDK are executed for each environment script.

And we will have the following problem when executing test cases for the
second environment script.

  ERROR: Source tree path /.../workspace/sources/librdfa already exists and is not empty

So after executing test cases for one environment, we clean up the sources
diretory to avoid such failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/testsdk.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 2e43343..54719a1 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -183,6 +183,9 @@ def testsdkext_main(d):
         if not result.wasSuccessful():
             fail = True
 
+        # Clean the workspace/sources to avoid `devtool add' failure because of non-empty source directory
+        bb.utils.remove(sdk_dir+'workspace/sources', True)
+
     if fail:
         bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
 
-- 
1.9.1


