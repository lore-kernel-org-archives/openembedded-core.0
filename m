Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8EED87F2DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:58:05 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b10so3067078plr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=FcHPaQ6nuvQUTH5VycQagQ0curYwbXNcXF2YOIKEW+c=;
	b=TsiHlSBMnweY+oxfJwgBDK76LkCMeFXR5iYOW9QzXnPgAySI8zoZHsogTb2nJVDVp0
	WPBO41UvnkhLPh/0grvug6KAwI5C6v1d4Nw0oMclc211GVp+cwSZ+UkGmO1R78poMfJr
	ykbwbMoOBsy7JS97tHcdJjSw20f1ZsDll5ge9/AGspea+Z+IgcVhSytk/oe/puRci5tD
	NvPUeuQeeROnbhVB80u2k3562tRSI53i/TPjrpekyfVHvCfETzGdO5c1/tJmg6HGhb7j
	LrZJt0Og3xmpIjayNTmWTolhRgV4LPBlINNU8nZXTwQBOgFAEOSC40wJjSZ64aU+s/wA
	wUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=FcHPaQ6nuvQUTH5VycQagQ0curYwbXNcXF2YOIKEW+c=;
	b=V5BzdJy5N1pYSBhi+68/No0UtldkC0mokxdII0yH4XXuC9UxPb8+SLFJCrl3UthV1W
	GrzPwKIORiON9vPKcnjrdgtzFUjaUCjiyusL0p9EGP7FmABUd3h2uliwh31PQed+AbY9
	Ukxk2xZJ+cwYYda8FFsdrO+PK6H4r2TQzDSz1aVE7rRuSjVnoK4lSyOLg+uYqmzkb41Y
	3DMqoC6sSMG2K3fvyfa8nMlJJBLgSbx2SEeMZTnCaFqqWVQ/H6uVHtlrTTByBO8YcwTV
	eTNJmk3Ezeuw4gQU0fKZ4BwsqkUuQA9UrkaIOe6lOWwhZdI1HVdGalAXiR8UfCI1RWml
	/AmQ==
X-Gm-Message-State: APjAAAXVooRDbrvikfYaCCpABE1q0kXyyD5eTdUGbRIOfMv5tHwjuAet
	yoZyZ/gmEAa3MMypkrkWe3+1g7PoQkSdWQ==
X-Google-Smtp-Source: APXvYqxMjW4gGfq9U4K2IqGTS/OJgk+D47kRDhsLysegxTWL7quEXoAINWP+3RwX7IJv4sFks8bnZQ==
X-Received: by 2002:a17:902:1ab:: with SMTP id
	b40mr36234344plb.136.1567529886335; 
	Tue, 03 Sep 2019 09:58:06 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	s5sm97589pjo.26.2019.09.03.09.58.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:58:05 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-9-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 09/12] oeqa/selftest: Add test run filtering based on test tags
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
X-List-Received-Date: Tue, 03 Sep 2019 16:58:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add '--run-only-tags' for running tests which match any of the provided
tags, and '--run-exclude-tags' for running all tests except those that
have any of the provided tags.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- New
---
 meta/lib/oeqa/selftest/context.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index d279994ddf..47de08e3f2 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -61,6 +61,12 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         group.add_argument('-r', '--run-tests', required=False, action='store',
                 nargs='+', dest="run_tests", default=None,
                 help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
+        group.add_argument('-t', '--run-only-tags', action='store',
+                nargs='+', dest="run_only_tags", default=None,
+                help='Run all (unhidden) tests which match any of the specified tags.')
+        group.add_argument('-T', '--run-exclude-tags', action='store',
+                nargs='+', dest="run_exclude_tags", default=None,
+                help='Run all (unhidden) tests excluding any that match any of the specified tags.')
 
         group.add_argument('-m', '--list-modules', required=False,
                 action="store_true", default=False,
@@ -149,6 +155,11 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         copyfile(self.tc_kwargs['init']['config_paths']['bblayers'], 
                 self.tc_kwargs['init']['config_paths']['bblayers_backup'])
 
+        if args.run_only_tags:
+            self.tc_kwargs['load']['tags_filter'] = lambda tags: not tags or not any(tag in args.run_only_tags for tag in tags)
+        if args.run_exclude_tags:
+            self.tc_kwargs['load']['tags_filter'] = lambda tags: any(tag in args.run_exclude_tags for tag in tags)
+
         self.tc_kwargs['run']['skips'] = args.skips
         self.tc_kwargs['run']['processes'] = args.processes
 
---
2.23.0.rc1

