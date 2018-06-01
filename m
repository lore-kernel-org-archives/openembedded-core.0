Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD3FD74FDD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 05:02:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w51521Et029376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 22:02:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 22:02:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jun 2018 13:03:05 +0800
Message-ID: <72e132a705ac88779eb7c0121b1b0453c2d74413.1527829100.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527829099.git.Qi.Chen@windriver.com>
References: <cover.1527829099.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/14] oeqa/core/decorator/data.py: fix skipIfNotInDataVar
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
X-List-Received-Date: Fri, 01 Jun 2018 05:02:01 -0000
Content-Type: text/plain

The var might not be set, resulting in unexpected error.

  RESULTS - multilib.MultilibTest.test_check_multilib_libc - Testcase 1593: ERROR

The above error is due to MULTILIBS being not set, which is the default
for OE. This patch fixes this problem.

Also, the debugging message in skipIfNotInDataVar is currently confusing.
Instead of
DEBUG: Checking if 'MULTILIBS' value is in 'multilib:lib32' to run the test
it should be
DEBUG: Checking if 'MULTILIBS' value contains 'multilib:lib32' to run the test

This patch also fixes it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/core/decorator/data.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index ff7bdd9..31c6dd6 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -61,10 +61,10 @@ class skipIfNotInDataVar(OETestDecorator):
 
     attrs = ('var', 'value', 'msg')
     def setUpDecorator(self):
-        msg = ('Checking if %r value is in %r to run '
+        msg = ('Checking if %r value contains %r to run '
               'the test' % (self.var, self.value))
         self.logger.debug(msg)
-        if not self.value in self.case.td.get(self.var):
+        if not self.value in (self.case.td.get(self.var) or ""):
             self.case.skipTest(self.msg)
 
 @registerDecorator
-- 
1.9.1


