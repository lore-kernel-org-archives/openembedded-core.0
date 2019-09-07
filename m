Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 12DDA7F2EA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 12:55:33 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d1so5098785pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=u8lp7i37cSk0/0/sH+X1aVlppT55dFEoHFiLL43Fvzk=;
	b=BYOU4sPyQvRj4cpg5vTIlSZmX88saH9nZ2q/YhwsSFYBfuAvwu+2BvwihHFLSKXa6n
	dK7kYO9xcQg0kLlrG2FKtIgJxgy2zQQ5cyzb976bqFPVO4yFwzUFb7p1GCLljfN21+M5
	0/lAsRP98INtCH0P1tLMMDaMUXRjNGs1x6y3ycT8IbhF9M6R25ajGrj8kxzCwN40nQKy
	Xyy3J0SC3nsTCfodOztUFb2m00b3gLIRq4i85e8k6+e64Bf3Rxxvl0OziQ42isUoeVnd
	OnZ5xGlfTjIymQMkNYLw9VLzj8OBSJGOWrwpZqVYQcdnUiyMVk9KSP9ulavwMTPIebHS
	XRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=u8lp7i37cSk0/0/sH+X1aVlppT55dFEoHFiLL43Fvzk=;
	b=qNVf1sE1jsmAsSjZq2/A+ZHiWI86xf60bm9jkss/QaEWhCnokKm3RuN3hB53RS98DO
	zbfxkNoZSLCZYCklMuVH6zG8p9UgWzC3bRDjM9/qv/0d7ApvFssNDlWY8TLUvZhadTe+
	/eU0I2kgbp2Y2wr1PLuOFUjnn/B/SF83b1UMmwL7xRomTb6dzmXHd4pz94ceGsxDWbVu
	vxzRvF2mK+4o/DFfIDksIGwuBRlKd92rfWVUQ9Ab0OGTP0cn/Qq5VUz29wMD6HE9y0qy
	rizjaW8Qg4tHZ7c99PE8KSh/fRnBMHHbvQ3OuJwpbZg+jNG+tRyuuh1oyKel8uo/bvCO
	pqIQ==
X-Gm-Message-State: APjAAAUsehsNB99tqXQV+IGw8+FQLLFmjTy1Q57+jCEK43LTUK8gM3FE
	tI/fmI1+TqQgO71zTtQ3AIIBWm1ilnWQrw==
X-Google-Smtp-Source: APXvYqyCc1Tyih7TEFcBfrvZN5AmUNdr50C1OMm9wg/5+N0uSXWjWmra6I+CP6eU06gYCQO+JOkI2Q==
X-Received: by 2002:a63:7b18:: with SMTP id w24mr12451369pgc.328.1567860934739;
	Sat, 07 Sep 2019 05:55:34 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	v12sm8860329pff.40.2019.09.07.05.55.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 05:55:34 -0700 (PDT)
Date: Sat, 07 Sep 2019 12:55:06 +0000
Message-Id: <20190907125506.17536-4-nathan@nathanrossi.com>
In-Reply-To: <20190907125506.17536-1-nathan@nathanrossi.com>
References: <20190907125506.17536-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 4/7] oeqa/selftest/context.py: Change -t/-T args to be optional
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
X-List-Received-Date: Sat, 07 Sep 2019 12:55:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Change the -t/-T args to be optional so that they can be used together
with the existing -r/-a/... args to run a more flexible filtering of
test tags.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/context.py | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 47de08e3f2..3126ada716 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -61,12 +61,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         group.add_argument('-r', '--run-tests', required=False, action='store',
                 nargs='+', dest="run_tests", default=None,
                 help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
-        group.add_argument('-t', '--run-only-tags', action='store',
-                nargs='+', dest="run_only_tags", default=None,
-                help='Run all (unhidden) tests which match any of the specified tags.')
-        group.add_argument('-T', '--run-exclude-tags', action='store',
-                nargs='+', dest="run_exclude_tags", default=None,
-                help='Run all (unhidden) tests excluding any that match any of the specified tags.')
 
         group.add_argument('-m', '--list-modules', required=False,
                 action="store_true", default=False,
@@ -83,7 +77,14 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         parser.add_argument('--machine', required=False, choices=['random', 'all'],
                             help='Run tests on different machines (random/all).')
-        
+
+        parser.add_argument('-t', '--select-tags', dest="select_tags",
+                nargs='*', default=None,
+                help='Filter all (unhidden) tests to any that match any of the specified tags.')
+        parser.add_argument('-T', '--exclude-tags', dest="exclude_tags",
+                nargs='*', default=None,
+                help='Exclude all (unhidden) tests that match any of the specified tags. (exclude applies before select)')
+
         parser.set_defaults(func=self.run)
 
     def _get_available_machines(self):
@@ -155,10 +156,17 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         copyfile(self.tc_kwargs['init']['config_paths']['bblayers'], 
                 self.tc_kwargs['init']['config_paths']['bblayers_backup'])
 
-        if args.run_only_tags:
-            self.tc_kwargs['load']['tags_filter'] = lambda tags: not tags or not any(tag in args.run_only_tags for tag in tags)
-        if args.run_exclude_tags:
-            self.tc_kwargs['load']['tags_filter'] = lambda tags: any(tag in args.run_exclude_tags for tag in tags)
+        def tag_filter(tags):
+            if args.exclude_tags:
+                if any(tag in args.exclude_tags for tag in tags):
+                    return True
+            if args.select_tags:
+                if not tags or not any(tag in args.select_tags for tag in tags):
+                    return True
+            return False
+
+        if args.select_tags or args.exclude_tags:
+            self.tc_kwargs['load']['tags_filter'] = tag_filter
 
         self.tc_kwargs['run']['skips'] = args.skips
         self.tc_kwargs['run']['processes'] = args.processes
---
2.23.0.rc1

