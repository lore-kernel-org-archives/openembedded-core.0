Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FC3C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 10:23:53 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.70164.1698575028232038749
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 03:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GX+K8Onm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32dcd3e5f3fso2395280f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 03:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698575026; x=1699179826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BUc08OnVglwr6zj8bfYzENDLdYD1QdbfGeTvemveZzc=;
        b=GX+K8OnmHAI2hkSffEU1tV9w1wcMXIYYS/c1NEclGXHPNzk3okvisDbyX2GMb/rKl8
         7r2HFeDP06jkEEE0zTsufVLr0iJnvh6p1gISGJZpw/AiDEaLU/nJWlWCcBUwu/38z1XK
         leNgj3/TBfXFm126JXcAg4E2yZzulez1SW5YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698575026; x=1699179826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUc08OnVglwr6zj8bfYzENDLdYD1QdbfGeTvemveZzc=;
        b=t3RKDV9T2z7W2sOSsAi/9wjNu8KYiDT02sfMtJ47S7uVV/G/YGPGHbNhvxfc+LFxHq
         Bw56IFiQm9hsbi+/T5Q4vsAIshTKejrN4dVakXp/5m2Uw/HgkK5o4CZ6puyWi6FkSa8a
         IUiBoI5OozojtzH33kqchRBmgEpeAYhdulCl8iIckW4M5wp8+ubKDWuKVRaP0X0u+zn+
         qZFqUsRAwH5IY41Z2Psc/CKLDOG78VLo5cYVWiiFzr/+OFqWY+W2Eg9bQrvxX2KllUxJ
         yAjbKsX83hpdobfQtE1nBjDKZRROV4MBI48joyp8tey0Wh7Fj/Zv5kE5sRLT15eAj259
         mOsg==
X-Gm-Message-State: AOJu0Yz3nO0uTLkTxMrn+bHb6c5x7xRq/9TsbxBDuTtnDcLzj9r9VqU6
	0PCTGuk1HaBVd0PWQ2jE+qwKdpCKqL/ES+bhfIA=
X-Google-Smtp-Source: AGHT+IE7ysYqJLrReXwJLH+i/VVAvVOV/zMAR7Ahm0YqiqMueDQC3CTXYVgOjpF2vryO/uVdIFP3Mw==
X-Received: by 2002:a05:6000:2a5:b0:32f:7a65:da66 with SMTP id l5-20020a05600002a500b0032f7a65da66mr3322352wry.44.1698575025985;
        Sun, 29 Oct 2023 03:23:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:561a:25f9:86bc:16b4])
        by smtp.gmail.com with ESMTPSA id m8-20020adffe48000000b0032d87b13240sm5702769wrs.73.2023.10.29.03.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 03:23:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: Drop machines support
Date: Sun, 29 Oct 2023 10:23:44 +0000
Message-Id: <20231029102344.1879648-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 10:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189770

The machines option to oe-selftest isn't used in our CI and is never likely to
be, we focus and execute testing explictly. The YOCTO #15247 is about how
this code doesn't interact well with build directory cleanup and at this point
I think we should just remove the option/code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/case.py    | 12 --------
 meta/lib/oeqa/selftest/context.py | 50 +------------------------------
 2 files changed, 1 insertion(+), 61 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 54d90c78ac5..da35b25f68e 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -117,10 +117,6 @@ class OESelftestTestCase(OETestCase):
                 if e.errno != errno.ENOENT:
                     raise
 
-        if self.tc.custommachine:
-            machine_conf = 'MACHINE ??= "%s"\n' % self.tc.custommachine
-            self.set_machine_config(machine_conf)
-
         # tests might need their own setup
         # but if they overwrite this one they have to call
         # super each time, so let's give them an alternative
@@ -178,19 +174,11 @@ class OESelftestTestCase(OETestCase):
         self.logger.debug("Writing to: %s\n%s\n" % (dest_path, data))
         ftools.write_file(dest_path, data)
 
-        if not multiconfig and self.tc.custommachine and 'MACHINE' in data:
-            machine = get_bb_var('MACHINE')
-            self.logger.warning('MACHINE overridden: %s' % machine)
-
     def append_config(self, data):
         """Append to <builddir>/conf/selftest.inc"""
         self.logger.debug("Appending to: %s\n%s\n" % (self.testinc_path, data))
         ftools.append_file(self.testinc_path, data)
 
-        if self.tc.custommachine and 'MACHINE' in data:
-            machine = get_bb_var('MACHINE')
-            self.logger.warning('MACHINE overridden: %s' % machine)
-
     def remove_config(self, data):
         """Remove data from <builddir>/conf/selftest.inc"""
         self.logger.debug("Removing from: %s\n%s\n" % (self.testinc_path, data))
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 5a09aeedffe..01ed360e1ff 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -70,7 +70,6 @@ class OESelftestTestContext(OETestContext):
     def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None, keep_builddir=None):
         super(OESelftestTestContext, self).__init__(td, logger)
 
-        self.machines = machines
         self.custommachine = None
         self.config_paths = config_paths
         self.newbuilddir = newbuilddir
@@ -160,12 +159,6 @@ class OESelftestTestContext(OETestContext):
             return NonConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir, self.bb_vars)
 
     def runTests(self, processes=None, machine=None, skips=[]):
-        if machine:
-            self.custommachine = machine
-            if machine == 'random':
-                self.custommachine = choice(self.machines)
-            self.logger.info('Run tests with custom MACHINE set to: %s' % \
-                    self.custommachine)
         return super(OESelftestTestContext, self).runTests(processes, skips)
 
     def listTests(self, display_type, machine=None):
@@ -205,9 +198,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         parser.add_argument('-j', '--num-processes', dest='processes', action='store',
                 type=int, help="number of processes to execute in parallel with")
 
-        parser.add_argument('--machine', required=False, choices=['random', 'all'],
-                            help='Run tests on different machines (random/all).')
-
         parser.add_argument('-t', '--select-tag', dest="select_tags",
                 action='append', default=None,
                 help='Filter all (unhidden) tests to any that match any of the specified tag(s).')
@@ -222,20 +212,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         parser.add_argument('-v', '--verbose', action='store_true')
         parser.set_defaults(func=self.run)
 
-    def _get_available_machines(self):
-        machines = []
-
-        bbpath = self.tc_kwargs['init']['td']['BBPATH'].split(':')
-
-        for path in bbpath:
-            found_machines = glob.glob(os.path.join(path, 'conf', 'machine', '*.conf'))
-            if found_machines:
-                for i in found_machines:
-                    # eg: '/home/<user>/poky/meta-intel/conf/machine/intel-core2-32.conf'
-                    machines.append(os.path.splitext(os.path.basename(i))[0])
-
-        return machines
-
     def _get_cases_paths(self, bbpath):
         cases_paths = []
         for layer in bbpath:
@@ -266,7 +242,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             args.list_tests = 'name'
 
         self.tc_kwargs['init']['td'] = bbvars
-        self.tc_kwargs['init']['machines'] = self._get_available_machines()
 
         builddir = os.environ.get("BUILDDIR")
         self.tc_kwargs['init']['config_paths'] = {}
@@ -414,30 +389,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         rc = None
         try:
-            if args.machine:
-                logger.info('Custom machine mode enabled. MACHINE set to %s' %
-                        args.machine)
-
-                if args.machine == 'all':
-                    results = []
-                    for m in self.tc_kwargs['init']['machines']:
-                        self.tc_kwargs['run']['machine'] = m
-                        results.append(self._internal_run(logger, args))
-
-                        # XXX: the oe-selftest script only needs to know if one
-                        # machine run fails
-                        for r in results:
-                            rc = r
-                            if not r.wasSuccessful():
-                                break
-
-                else:
-                    self.tc_kwargs['run']['machine'] = args.machine
-                    return self._internal_run(logger, args)
-
-            else:
-                self.tc_kwargs['run']['machine'] = args.machine
-                rc = self._internal_run(logger, args)
+             rc = self._internal_run(logger, args)
         finally:
             config_paths = self.tc_kwargs['init']['config_paths']
 
-- 
2.39.2


