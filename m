Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06681E6917A
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:23:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.28639.1732292627453601411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gxwqL7+I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3824446d2bcso1930859f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732292625; x=1732897425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI7zBU+aOfZbapXryM/wpEJezmBX/uoLpUWFLEN+lUY=;
        b=gxwqL7+IAVIna/V9XK8uKXj1PVyK9Njiz3TpE7jrKSO4gy08KvfJYq8EeG3tzkYRnT
         d0/d8CIfG4ERE9i8YU43ZDyWLNMOiUxcsFbcp2R/9rgURmMjzirFbOEIlqFn/iUKojPW
         6aIlRE1a7Wz4fJbHNOSYvZbBW0WVS9T4e/NrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292625; x=1732897425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yI7zBU+aOfZbapXryM/wpEJezmBX/uoLpUWFLEN+lUY=;
        b=dOP9vSC6xtHTUio8er3KlBcm0qxJ+5WKHjr8hfhTImZ/nDqRBY6FeIOKUJjXbzg6H0
         dvnpks1LyxTJdF8G2gD8zG77uZjN6G5rh8m6YRFiHb2b/rQ1ODWEH4pBXsvqb9ird7Ce
         DRaJGxLC2drxTSHM78QBUMOVFwVwheslqOeph26TXtn0/AmPac7grE74hn4V4FjMOhWQ
         7YOu1y/6l1WbJZuVDdwCshaKoWCPWDvhHoZHihViHj5TzwkB9dRIel1FpxOqm/wrbk3r
         0dpap09HU2A9GvABbLJAv3XfWrN1PznA0OGRMVceqPWSqLkCwMcCs+RP4+OtKvFQZPO9
         /ZCw==
X-Gm-Message-State: AOJu0YynJkClv2LlYbXETNKIZNxdSMBTFCh+qDtu38mWKKFsd6S9jIDE
	NeADsVRepmu99Wf7LacFSQJAZojafEkP3+iAbDrrmcYBPRKCgbnDrev0Bw5jT2ItLHZwOogcw8C
	h
X-Gm-Gg: ASbGncsHIqgB3pxBrJmlYzEeCBe4/Edicf+2WbDl/QqKrur4SimhJDgkiPosjpSgKQ/
	mcj11V9OKqXkpTwUCdl2esN6pVzOtlhSm4F32wYJa/o+AQU23aA9DErGYaIW1hHIXE9oIUiWFBr
	DTzdC9roOS4dF/kPawe8p52Z8QlGi5D6ETT2rfpufIsKmHvUlll1WV45QoEqzD2dmgyde58IkGc
	Vm1/CQkod1C+rPK0nol22lxv18fV5zk3WyzRmA88XDHqSjfyLVKFbc+HSmAGdQq9UrstIy1nTTL
	IE4=
X-Google-Smtp-Source: AGHT+IFq3VTmxWgji251bz4UGsDtiQV7j7gWNvPyLVeKzzfvJlc3U1hjrRowv7gV/FWuxhmu5+0iFA==
X-Received: by 2002:a05:6000:18ac:b0:382:3afd:1258 with SMTP id ffacd0b85a97d-38260b3ccbemr3491736f8f.8.1732292625467;
        Fri, 22 Nov 2024 08:23:45 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm100686595e9.24.2024.11.22.08.23.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:23:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] resulttool: Add --logfile-archive option to store mode
Date: Fri, 22 Nov 2024 16:23:36 +0000
Message-ID: <20241122162340.2770780-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
References: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207632

Storing the log files inside the testresults git repo isn't scaling and isn't
really appropriate use of a git repository. Allow these to be optionally stored
in a separate filesystem location so the git repo can remain managable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/store.py | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 903e29627ab..578910d234d 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -74,12 +74,25 @@ def store(args, logger):
 
             logger.info('Storing test result into git repository %s' % args.git_dir)
 
-            gitarchive.gitarchive(tempdir, args.git_dir, False, False,
+            excludes = []
+            if args.logfile_archive:
+                excludes = ['*.log', "*.log.zst"]
+
+            tagname = gitarchive.gitarchive(tempdir, args.git_dir, False, False,
                                   "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
                                   False, "{branch}/{commit_count}-g{commit}/{tag_number}",
                                   'Test run #{tag_number} of {branch}:{commit}', '',
-                                  [], [], False, keywords, logger)
+                                  excludes, [], False, keywords, logger)
 
+            if args.logfile_archive:
+                logdir = args.logfile_archive + "/" + tagname
+                shutil.copytree(tempdir, logdir)
+                for root, dirs,  files in os.walk(logdir):
+                    for name in files:
+                        if not name.endswith(".log"):
+                            continue
+                        f = os.path.join(root, name)
+                        subprocess.run(["zstd", f, "--rm"], check=True, capture_output=True)
     finally:
         subprocess.check_call(["rm", "-rf",  tempdir])
 
@@ -107,3 +120,5 @@ def register_commands(subparsers):
                               help='add extra test environment data to each result file configuration')
     parser_build.add_argument('-r', '--revision', default='',
                               help='only store data for the specified revision')
+    parser_build.add_argument('-l', '--logfile-archive', default='',
+                              help='directory to separately archive log files along with a copy of the results')

