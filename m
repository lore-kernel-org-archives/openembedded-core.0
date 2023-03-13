Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AB5C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:59:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18601.1678712351715060336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66279152B;
	Mon, 13 Mar 2023 05:59:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C9503F64C;
	Mon, 13 Mar 2023 05:59:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] resulttool: add log --list-ptest
Date: Mon, 13 Mar 2023 12:59:08 +0000
Message-Id: <20230313125908.893096-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313125908.893096-1-ross.burton@arm.com>
References: <20230313125908.893096-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178448

Add a convenience argument to the log subcommand to list all of the
ptest logs in a testresults file.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/resulttool/log.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.p=
y
index eb3927ec82a..621c6c4bacc 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -34,6 +34,9 @@ def log(args, logger):
         return 1
=20
     for _, run_name, _, r in resultutils.test_run_results(results):
+        if args.list_ptest:
+            print('\n'.join(sorted(r['ptestresult.sections'].keys())))
+
         if args.dump_ptest:
             for sectname in ['ptestresult.sections', 'ltpposixresult.sec=
tions', 'ltpresult.sections']:
              if sectname in r:
@@ -86,6 +89,8 @@ def register_commands(subparsers):
     parser.set_defaults(func=3Dlog)
     parser.add_argument('source',
             help=3D'the results file/directory/URL to import')
+    parser.add_argument('--list-ptest', action=3D'store_true',
+            help=3D'list the ptest test names')
     parser.add_argument('--ptest', action=3D'append', default=3D[],
             help=3D'show logs for a ptest')
     parser.add_argument('--dump-ptest', metavar=3D'DIR',
--=20
2.34.1


