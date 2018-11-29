Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E931C6C253
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:17:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l9so1656899wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 04:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6O4S0ZPO4JyvkzQbPxcaT7JtIiuZrof/+SggYUIYdJ8=;
	b=CTRT59iwtRpcTz6IHyp3W9DZfYtqSpV018/q7uOzNjVzHeBCACbhXCQvYejrQwj3cn
	9r/r1LdpPAtFtzUuQTAgq8rJWMWFA/OikybMCcedVMjvrF3Tmwd+xaMX4PaXj448mRkp
	efDxuG6gmSTobpq8S8ccP9EW8AqX9CoXuVM1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6O4S0ZPO4JyvkzQbPxcaT7JtIiuZrof/+SggYUIYdJ8=;
	b=A4DbILw18ttpcE8KzfFD0fqunj13nAb6JRjdici76w4GENbcUSA4domYIJEYfqXtq7
	E08sqLzZ93HceosR1W8/HgUg3W20IPy3OLpS1fwIi/q/Yq/oESiwOVfBNgiH6J+OODpr
	oOp0R4kV790ulwt0y0jzYjC01DRmnE+GPVt8Co4L/W5wW2ejRxPjfy8EwEYqHDur+J1O
	bqm48ruGA/YyIv/HnCzuK7uKvOoiBUoBrOg+dNGeZGqec5vcWgZPfq92pYX7bG2H2zdH
	x0+CVvW1ltf1vFAYrnqrty2UVIj8t3GfgKvnYHvJqH49Je9YEYxRlb7mVRvusCTSB658
	VWLQ==
X-Gm-Message-State: AA+aEWbkXkafb4UFPnbpqqETfbe6M8Ck6LAZEgQSmEASpqqHrM9xLaqQ
	fIn9AzfK41dwXzlJCBHywBwLt5JM8nY=
X-Google-Smtp-Source: AFSGD/UKv44LR4LZe/68MHgrDZ+KEqlKwJAjKIEi7/GshDcGMHFKsYkGAHblrSq0IAGuwfArScVljA==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr1193612wrp.242.1543493870482; 
	Thu, 29 Nov 2018 04:17:50 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 5sm2717625wmw.8.2018.11.29.04.17.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 04:17:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:17:44 +0000
Message-Id: <20181129121744.10052-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
References: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] oeqa/selftest/context: Improve log file handling
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
X-List-Received-Date: Thu, 29 Nov 2018 12:17:50 -0000
Content-Transfer-Encoding: 8bit

The existing logfile is simply placed in the current directory. Since the test
changes cwd to BUILDDIR, the symlink to the log can be placed in an invalid
directory. We also see trackbacks if the symlink is invalid.

Improve things by:

* Placing logs in LOG_DIR (or BUILDDIR if unset).
* Using a full path to the log meaning the log and link are placed in the same directory.
* Using lexists instead of exists so invalid symlinks are handled correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index dab72688299..c5212903276 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -101,10 +101,15 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
     def _process_args(self, logger, args):
         args.test_start_time = time.strftime("%Y%m%d%H%M%S")
-        args.output_log = '%s-results-%s.log' % (self.name, args.test_start_time)
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
@@ -114,7 +119,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         elif args.list_tests:
             args.list_tests = 'name'
 
-        self.tc_kwargs['init']['td'] = get_bb_vars()
+        self.tc_kwargs['init']['td'] = bbvars
         self.tc_kwargs['init']['machines'] = self._get_available_machines()
 
         builddir = os.environ.get("BUILDDIR")
@@ -304,7 +309,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
             output_link = os.path.join(os.path.dirname(args.output_log),
                     "%s-results.log" % self.name)
-            if os.path.exists(output_link):
+            if os.path.lexists(output_link):
                 os.remove(output_link)
             os.symlink(args.output_log, output_link)
 
-- 
2.19.1


