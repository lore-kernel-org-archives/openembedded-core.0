Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE3F26D576
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 101so1667750pld.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hKBbaFN3CpsmAG/4NxCMGFhrOZBeD00m4LmJe057frs=;
	b=FeiCnbFHgvg25WpmoIUHwSzLSrQQGLKUpTDyvwqZqo6Q7BO8CHluZVNbPM0UzpNNzE
	0p762ZiOShDxbmkZwEeN80gkshPQVsZGyYkrnYAJW82JsJeWz+NJhIbkqCHqdTD4izRs
	6P8gbhQKGaIEmmDVt5yHDrNjv2SimQewaBpdPGcboO2s7KqYSj7RggE9H7t7Tch5i0x5
	/pLlIHaCGxXnCbFyLlmkH+aOGgO1YrPPgOkG3pstzZefc0RqUXbscM/XIZA7sGoOmmyz
	MQQAaFmcX42sEh/o64VQx9FHTRl2iDgGWLsv1XZOb93tclIBGJyv1kZW6+A9ZlwsoLFW
	CnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hKBbaFN3CpsmAG/4NxCMGFhrOZBeD00m4LmJe057frs=;
	b=FMzoaL3FrbHaQRHH+FF+D66dsx9LDtBJUAhfSfn0E5KZV0ZvEScrSugmwB2TqGU1IF
	500BZvVU6K8/bnxDjuTK1GdtdmvG3/Q24eTH0DCCZYHqZ18NEBSiLfFxvo2/Vapi4amU
	tggXcLdRmN3crk+n5p3pJ39A92OBzdmkhbd/lHumRrZEoiLH1l/oV1CVd1+1v+oeiu0/
	TD7cHJEvAZJld/H6hu9INVlSMf8jPoNa/B30LTK+AdByXxlTFpQh8TkXW2K5rcHYywX7
	PUaCMLy3mx/4wV2DAXevqcMKIc6K2lWKtLmUxoJ6hOwp1SJ1aeD9+JjTQZv9iJP95v9D
	EWIA==
X-Gm-Message-State: AA+aEWZEUq6+Wh1KPAMI2QKvCfNRadBNfPZnPg0QO4GXJGocQ8o5z1dP
	wzzCHQ/fEIM9j10OM5x5GIwqs+gT
X-Google-Smtp-Source: AFSGD/V2TTGxW9X94Ssi3da8kdobarKnXjGYcMlu5OyxYvAjqrwJmZfHf3No8VZlsDRKynIWVtnqQQ==
X-Received: by 2002:a17:902:a50a:: with SMTP id
	s10mr415271plq.278.1544737169805; 
	Thu, 13 Dec 2018 13:39:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:32 -0800
Message-Id: <31d95385348a891da5a81fa62c08eba7eaabb918.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 24/45] oeqa/selftest/context: Improve log file handling
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:29 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The existing logfile is simply placed in the current directory. Since the test
changes cwd to BUILDDIR, the symlink to the log can be placed in an invalid
directory. We also see trackbacks if the symlink is invalid.

Improve things by:

* Placing logs in LOG_DIR (or BUILDDIR if unset).
* Using a full path to the log meaning the log and link are placed in the same directory.
* Using lexists instead of exists so invalid symlinks are handled correctly.

(From OE-Core rev: 750ece11bed0e62a11e0003d1d16a81f7c219761)

(From OE-Core rev: 9c4c3c876dd5d224133571fcad1095af1098ae1d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index cac049f..33316d3 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -96,11 +96,17 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         return cases_paths
 
     def _process_args(self, logger, args):
-        args.output_log = '%s-results-%s.log' % (self.name,
-                time.strftime("%Y%m%d%H%M%S"))
+
+        args.test_start_time = time.strftime("%Y%m%d%H%M%S")
         args.test_data_file = None
         args.CASES_PATHS = None
 
+        bbvars = get_bb_vars()
+        logdir = os.environ.get("BUILDDIR")
+        if 'LOG_DIR' in bbvars:
+            logdir = bbvars['LOG_DIR']
+        args.output_log = logdir + '/%s-results-%s.log' % (self.name, args.test_start_time)
+
         super(OESelftestTestContextExecutor, self)._process_args(logger, args)
 
         if args.list_modules:
@@ -110,7 +116,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         elif args.list_tests:
             args.list_tests = 'name'
 
-        self.tc_kwargs['init']['td'] = get_bb_vars()
+        self.tc_kwargs['init']['td'] = bbvars
         self.tc_kwargs['init']['machines'] = self._get_available_machines()
 
         builddir = os.environ.get("BUILDDIR")
@@ -270,7 +276,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
             output_link = os.path.join(os.path.dirname(args.output_log),
                     "%s-results.log" % self.name)
-            if os.path.exists(output_link):
+            if os.path.lexists(output_link):
                 os.remove(output_link)
             os.symlink(args.output_log, output_link)
 
-- 
2.7.4


