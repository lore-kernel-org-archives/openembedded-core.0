Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C757378294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:23:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M1NHnw028935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:23:17 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 18:23:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 18:23:06 -0700
Message-ID: <b8f10c572f7abe9a8ce325e34c172b080fccdebd.1503364879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503364879.git.liezhi.yang@windriver.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/9] oeqa/utils/logparser.py: add skip status
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
X-List-Received-Date: Tue, 22 Aug 2017 01:23:15 -0000
Content-Type: text/plain

Some test cases maybe skipped, let's parse it.

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/utils/logparser.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index b377dcd..4355ce0 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -9,7 +9,7 @@ from . import ftools
 # A parser that can be used to identify weather a line is a test result or a section statement.
 class Lparser(object):
 
-    def __init__(self, test_0_pass_regex, test_0_fail_regex, section_0_begin_regex=None, section_0_end_regex=None, **kwargs):
+    def __init__(self, test_0_pass_regex, test_0_fail_regex, test_0_skip_regex, section_0_begin_regex=None, section_0_end_regex=None, **kwargs):
         # Initialize the arguments dictionary
         if kwargs:
             self.args = kwargs
@@ -19,12 +19,13 @@ class Lparser(object):
         # Add the default args to the dictionary
         self.args['test_0_pass_regex'] = test_0_pass_regex
         self.args['test_0_fail_regex'] = test_0_fail_regex
+        self.args['test_0_skip_regex'] = test_0_skip_regex
         if section_0_begin_regex:
             self.args['section_0_begin_regex'] = section_0_begin_regex
         if section_0_end_regex:
             self.args['section_0_end_regex'] = section_0_end_regex
 
-        self.test_possible_status = ['pass', 'fail', 'error']
+        self.test_possible_status = ['pass', 'fail', 'error', 'skip']
         self.section_possible_status = ['begin', 'end']
 
         self.initialized = False
-- 
2.10.2


