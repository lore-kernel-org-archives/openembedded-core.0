Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1848461473
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:56:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01IEuJNt009054
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Feb 2020 06:56:19 -0800 (PST)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 18 Feb 2020 06:56:19 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 09:56:18 -0500
Message-ID: <20200218145618.3286796-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] concurrencytest.py: add outSideTestaddSkip for subunit
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
X-List-Received-Date: Tue, 18 Feb 2020 14:56:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13663

When running oe-selftest in concurrency mode (e.g. with oe-selftest
--run-tests oescripts.OEPybootchartguyTests -j 4), if a skip occurred
during setUpClass() rather than within individual tests, the entire
suite would show "UNKNOWN" as each test's result. This is because
subunit doesn't know how to handle skips outside of individual tests.
An example of where this occurs is when running the above call to
oe-selftest in concurrency mode on a host machine that does not have
python3-cairo installed.

Patch subunit inside concurrencytest.py to provide a method called
outSideTestaddSkip, which will allow subunit to correctly detect the
skip in setUpClass().

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 71ec0df5fa..71e1a9e872 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -146,6 +146,20 @@ def outSideTestaddError(self, offset, line):
 
 subunit._OutSideTest.addError = outSideTestaddError
 
+# Like outSideTestaddError above, we need an equivalent for skips 
+# happening at the setUpClass() level, otherwise we will see "UNKNOWN" 
+# as a result for concurrent tests
+#
+def outSideTestaddSkip(self, offset, line):
+    """A 'skip:' directive has been read."""
+    test_name = line[offset:-1].decode('utf8')
+    self.parser._current_test = subunit.RemotedTestCase(test_name)
+    self.parser.current_test_description = test_name
+    self.parser._state = self.parser._reading_skip_details
+    self.parser._reading_skip_details.set_simple()
+    self.parser.subunitLineReceived(line)
+
+subunit._OutSideTest.addSkip = outSideTestaddSkip
 
 #
 # A dummy structure to add to io.StringIO so that the .buffer object
-- 
2.24.1


