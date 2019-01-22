Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FBCC7C043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 09:01:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0M91EmN028500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 01:01:14 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 22 Jan 2019 01:01:13 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2019 17:09:50 +0800
Message-ID: <53719d8d2e0a0170e53055066bc507e068081999.1548147637.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1548147637.git.Qi.Chen@windriver.com>
References: <cover.1548147637.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] eSDK.py: unset BBPATH and BUILDDIR to avoid eSDK failure
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
X-List-Received-Date: Tue, 22 Jan 2019 09:01:13 -0000
Content-Type: text/plain

When executing eSDK test case, the following error appears.

  WARNING: attempting to use the extensible SDK in an environment
  	   set up to run bitbake - this may lead to unexpected
	   results. Please source this script in a new shell session
	   instead.

  FileExistsError: [Errno 17] File exists: '/.../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/selftest-esdk-fcuyzsqu/tmp/sysroots/x86_64/bin/pigz' -> '/.../tmp/hosttools/pigz'

So unset these two vars to avoid messing things up.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/eSDK.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index d7aef93..7798706 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -31,7 +31,7 @@ class oeSDKExtSelfTest(OESelftestTestCase):
         if not 'shell' in options:
             options['shell'] = True
 
-        runCmd("cd %s; . %s; %s" % (tmpdir_eSDKQA, env_eSDK, cmd), **options)
+        runCmd("cd %s; unset BBPATH; unset BUILDDIR; . %s; %s" % (tmpdir_eSDKQA, env_eSDK, cmd), **options)
 
     @staticmethod
     def generate_eSDK(image):
-- 
1.9.1


