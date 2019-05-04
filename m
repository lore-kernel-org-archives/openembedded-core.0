Return-Path: <jpewhacker@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 32D867CFE9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 03:17:55 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id o65so4135009ywd.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 20:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cImnkCzFBPJnf8AkkomjEA5Un3dynQeTcM5XgFv+/Lg=;
	b=NzxMe/mx6pHT0r81KPKdI+74swbpePtKx9Bw3+SZTfh9XrX3QuE1WxYkme4Pc7w1nC
	/uXm0YuAxBwYHjXdIy4wTzkZko5buKR54KbD2n5YvCbdla8z+bjKCBllkCsI8nmMLUT4
	5zk/6EP68P1ap3TH7dh0wdYq7XwSxwq0JkAbYmX8CY6gLojnuRVfKsxSEaWORIjvjSbY
	ZG8JLwelvDfw4i817m/TS7am2nE6F+xiCKPx+h1CJ6BvQkmou06qJJXCzPLxxsT+r6iK
	dAvBdzvaRL9A9NDOG0C6KI7V5WHczYP0iTiazqFQd5in7aD0k6Q88wSochRorxeWk5Cu
	/Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cImnkCzFBPJnf8AkkomjEA5Un3dynQeTcM5XgFv+/Lg=;
	b=p00V5QkrrbHNTZscAiT5myztaMK921Bbscg6NYQXwtEfVpbY8M7Fn9QboQoNFOJc1Q
	uNpv49jDdGTvcLrFcnulA9NGQiWSBLZlXYvlElla6U0JiH5+9zEmgFPk/KNqegSMH9ta
	HxNPEPUn7yN53hQ3bINCTtIsEGgxqpV9S5p/H77pf8uknZe1uGRM25wjf8bcgG2WJKi1
	aU74a/Ag96ozhnBKTv0/MtiPeIp7kcyJqnzJ1gL7JHXFa4olH8PRy4RSjdAgXl5ejBRi
	oPENegU6MiiGzmW5wYnLOe5AJgphR5ByBIYrIp2eYi4aeDtSDGbY4xMRFLbxldMowZOl
	XHig==
X-Gm-Message-State: APjAAAVMnhAM9QQgb6+e2zs4UqX12ex7F9CzXipcuwRJ4Rf+E5sEpHU0
	ShWAXjKFhIXlQ+PYHmnDXEPZTq6JNt0=
X-Google-Smtp-Source: APXvYqztF9mCBXaXU6BXxRsp754FO9fq/Zg8FlJrupNoK02w4m4g2SsGNiG3Ti8LhyymkccjtHTYyA==
X-Received: by 2002:a25:a1e1:: with SMTP id a88mr9649563ybi.158.1556939875826; 
	Fri, 03 May 2019 20:17:55 -0700 (PDT)
Received: from localhost.localdomain
	([2605:a601:21d1:5200:620a:c230:ada8:3135])
	by smtp.gmail.com with ESMTPSA id l17sm29664ywm.31.2019.05.03.20.17.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 May 2019 20:17:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2019 22:17:52 -0500
Message-Id: <20190504031752.20918-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] resulttool: Add option to dump all ptest logs
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
X-List-Received-Date: Sat, 04 May 2019 03:17:55 -0000
Content-Transfer-Encoding: 8bit

Adds an option to dump all the ptest logs to individual files to a
specified directory.

[YOCTO #13331]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/resulttool/log.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index 5584f2d0a99..18830409035 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -30,6 +30,15 @@ def log(args, logger):
                 continue
             r = results[path][res]['result']
 
+            if args.dump_ptest:
+                if 'ptestresult.sections' in r:
+                    for name, ptest in r['ptestresult.sections'].items():
+                        if 'log' in ptest:
+                            dest = os.path.join(args.dump_ptest, '%s.log' % name)
+                            print(dest)
+                            with open(dest, 'w') as f:
+                                f.write(ptest['log'])
+
             if args.raw:
                 if 'ptestresult.rawlogs' in r:
                     print(r['ptestresult.rawlogs']['log'])
@@ -51,6 +60,8 @@ def register_commands(subparsers):
             help='the results file/directory/URL to import')
     parser.add_argument('--ptest', action='append', default=[],
             help='show logs for a ptest')
+    parser.add_argument('--dump-ptest', metavar='DIR',
+            help='Dump all ptest log files to the specified directory.')
     parser.add_argument('--raw', action='store_true',
             help='show raw logs')
 
-- 
2.20.1


