Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB9A71E5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:04 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id u18so1667314plq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FasmtPzxSAm+lK97VMOjRgoDA+9lSQPesdvXjxh7c5g=;
	b=cRdeyNE5J4IMSeoAUxxovx6/T8+dTbvUJhh/Hx4lq9lSkBOo9l3zE37YBdhMcXxzFe
	Y7ZqWP9+pJQDZT6OQmEp8Gu4Ah8/M+4aPN54sNd4mSNvHyzIZU7E73EcBWCgqpZk6LXF
	MSPmRbEhY8ppfjAa/D3HdYN2h6cpk+swJKpzW7+pljBvu5Y33AFL8uodauc2B9C7J1ey
	VS//dREp5cmdySY21xzugPMwrtEbt3iKPWpFpNmbEcze0M/VznsbeAiSyqEmRSM9NcuO
	qhC4h1YRfE0IqaECrdZpkennOrSI1J+IOEBokia8FltWS7ivDRLt5rFNrsgOFTEptif7
	IhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FasmtPzxSAm+lK97VMOjRgoDA+9lSQPesdvXjxh7c5g=;
	b=XbMMJzzNyhpizY05uIfNScPUarZJhT4SWwOHLSeaJTdRLc/AxJuhYjn1P4F0FlfGpD
	EDbUXJbnJUAHF3835xVQV4qyJVYr8f53EJvidnxSfEKmDrdFfqyc7dOe4epNlfoWoPWj
	NTEq/AsaWPr3Z43N+L9JmkVVrHSiVgkDuUpmLwAUwjoZ1v/v87jOEINERTflORCwO1H+
	6GBBXUtzZ7Ba6FqzPIHNqyIRsw1hEhzYSviU/SXzfrGX05bJ71kaxZf0VmjA2CSm3UFz
	lOstexWw0dhwQoWl+S0advQVKQFZ/yhqAAP4CuEhzFrGj/ImVI0tcYWpVMNvvTchaHTX
	TwXg==
X-Gm-Message-State: AA+aEWZOjHh5to5zvrxlJ7/23yU5OhwPgsKEnCuf28yNc06tTzUdPBYl
	cVh74/mOxbc/mV/H62wpiA03YSF1
X-Google-Smtp-Source: AFSGD/VGApgPNZ7Ga5fkVcC0G1BcUsGZybfDU05D2ilfcH2ZinxAbvwVMGxemaOvzRMYw6CbmQ0f7A==
X-Received: by 2002:a17:902:4:: with SMTP id 4mr471892pla.20.1544737146065;
	Thu, 13 Dec 2018 13:39:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:12 -0800
Message-Id: <81f7315958b11e9388b63b682e8e0e0fec74118c.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 04/45] oeqa/selftest/signing: Skip tests if gpg isn't found
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:05 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Raising an assertionError in the class setup isn't a particuarly good way to
indicate gpg isn't installed. Instead skip the tests if the required binary
isn't present. For the signing tests we do require it to be present and can't
use a prebuilt one.

(From OE-Core rev: 2d486af97e51b9daa9c40482c31d637c9ab4ae79)

(From OE-Core rev: 65403bb556f7e3132722288a62ef36631af0b557)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index a750cfc..28afcdc 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -15,23 +15,18 @@ class Signing(OESelftestTestCase):
     pub_key_path = ""
     secret_key_path = ""
 
-    @classmethod
-    def setUpClass(cls):
-        super(Signing, cls).setUpClass()
+    def setup_gpg(self):
         # Check that we can find the gpg binary and fail early if we can't
         if not shutil.which("gpg"):
-            raise AssertionError("This test needs GnuPG")
+            self.skipTest('gpg binary not found')
 
-        cls.gpg_dir = tempfile.mkdtemp(prefix="oeqa-signing-")
+        self.gpg_dir = tempfile.mkdtemp(prefix="oeqa-signing-")
+        self.track_for_cleanup(self.gpg_dir)
 
-        cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
-        cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
+        self.pub_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.pub")
+        self.secret_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.secret")
 
-        runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
-
-    @classmethod
-    def tearDownClass(cls):
-        shutil.rmtree(cls.gpg_dir, ignore_errors=True)
+        runCmd('gpg --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path))
 
     @OETestID(1362)
     def test_signing_packages(self):
@@ -46,6 +41,8 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
+        self.setup_gpg()
+
         package_classes = get_bb_var('PACKAGE_CLASSES')
         if 'package_rpm' not in package_classes:
             self.skipTest('This test requires RPM Packaging.')
@@ -111,6 +108,8 @@ class Signing(OESelftestTestCase):
         builddir = os.environ.get('BUILDDIR')
         sstatedir = os.path.join(builddir, 'test-sstate')
 
+        self.setup_gpg()
+
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
         self.add_command_to_tearDown('rm -rf %s' % sstatedir)
 
-- 
2.7.4


