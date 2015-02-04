Return-Path: <alexandru.damian@intel.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id C5F966013C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 14:14:02 +0000 (UTC)
Received: by pdbft15 with SMTP id ft15so924087pdb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Feb 2015 06:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+aWkzIz9C2RDgAq5YKF2O07xcZodziVXsnu6/TUtBgw=;
	b=NNrelbEOhSQ7DN8VQeU5Q1Pn7W1QwvOuDnUNSTmzyGLUOI7rNJztmQYByYd7MI2KWR
	BX0rHUG9KPZLaskTO3+z/RfY3vXlUiHIARiAoM3PZhyocNZAWotgg3ThwdiH7YR62pip
	VfohQH8yl22m1lvC4RWEE37245HS3ubKGvpFUNduqz/M8k2B/UDcjqzXWSHtzvq+aldL
	G6BFxmA0E3PgsuucDIwwI4jB7LlYyJwLDpHGR58voEt/W6W5RWAOrUXnJtpbeY5VxOQJ
	mHFQaMOKuSJc59BjzTGEx8Ob1K6KPdMuqg7j32b2MHrFAHtDUHQVZDTIgdIhABU3Bzf1
	+BgQ==
X-Gm-Message-State: ALoCoQlQSUTGG8c1o4hr3wfRRIyNsZVDL5EB5FjhzO3G7BdAFHH/lpZeAhh20EGlM3ZkF6gkj5he
X-Received: by 10.70.49.43 with SMTP id r11mr44553463pdn.25.1423059244127;
	Wed, 04 Feb 2015 06:14:04 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id h2sm2215286pat.20.2015.02.04.06.14.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 06:14:03 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id AA0495622BF; Wed,  4 Feb 2015 14:14:00 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Feb 2015 14:13:57 +0000
Message-Id: <1423059237-10195-2-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423059237-10195-1-git-send-email-alexandru.damian@intel.com>
References: <1423059237-10195-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 2/2] scripts/oe-selftest: add command line option to list test classes
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
X-List-Received-Date: Wed, 04 Feb 2015 14:14:04 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

While trying to discover what tests are available, I felt the
need to be able to list all individual tests so I can run specific
tests.

This patch adds the "--list-classes" command line option that
lists the unit test classes and methods available.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 scripts/oe-selftest | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 74c998b..a04e9fc 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -66,6 +66,7 @@ def get_args_parser():
     group.add_argument('--run-tests', required=False, action='store', nargs='*', dest="run_tests", default=None, help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
     group.add_argument('--run-all-tests', required=False, action="store_true", dest="run_all_tests", default=False, help='Run all (unhidden) tests')
     group.add_argument('--list-modules', required=False, action="store_true", dest="list_modules", default=False, help='List all available test modules.')
+    group.add_argument('--list-classes', required=False, action="store_true", dest="list_allclasses", default=False, help='List all available test classes.')
     return parser
 
 
@@ -138,6 +139,9 @@ def main():
     parser = get_args_parser()
     args = parser.parse_args()
 
+    if args.list_allclasses:
+        args.list_modules = True
+
     if args.list_modules:
         log.info('Listing all available test modules:')
         testslist = get_tests(include_hidden=True)
@@ -147,6 +151,22 @@ def main():
             if module.startswith('_'):
                 info = ' (hidden)'
             print module + info
+            if args.list_allclasses:
+                try:
+                    import importlib
+                    modlib = importlib.import_module(test)
+                    for v in vars(modlib):
+                        t = vars(modlib)[v]
+                        if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
+                            print " --", v
+                            for method in dir(t):
+                                if method.startswith("test_"):
+                                    print " --  --", method
+
+                except (AttributeError, ImportError) as e:
+                    print e
+                    pass
+
 
     if args.run_tests or args.run_all_tests:
         if not preflight_check():
-- 
1.9.1


