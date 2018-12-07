Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D59986C4B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 06:35:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB76ZmGB019848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2018 22:35:48 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Dec 2018 22:35:47 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Dec 2018 14:43:07 +0800
Message-ID: <0fcf3f2435a19978e629b2903020a9a8f8a819a0.1544164496.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1544164496.git.Qi.Chen@windriver.com>
References: <cover.1544164496.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa/selftest/context: ensure log directory exists
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
X-List-Received-Date: Fri, 07 Dec 2018 06:35:47 -0000
Content-Type: text/plain

Ensure log directory exists to avoid the following error.

  FileNotFoundError: [Errno 2] No such file or directory: '/.../build-selftest/tmp/log/oe-selftest-results-20181207043431.log'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/context.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c521290..c56e53d 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -108,6 +108,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         logdir = os.environ.get("BUILDDIR")
         if 'LOG_DIR' in bbvars:
             logdir = bbvars['LOG_DIR']
+        bb.utils.mkdirhier(logdir)
         args.output_log = logdir + '/%s-results-%s.log' % (self.name, args.test_start_time)
 
         super(OESelftestTestContextExecutor, self)._process_args(logger, args)
-- 
1.9.1


