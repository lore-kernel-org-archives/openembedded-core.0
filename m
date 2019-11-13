Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 078587F687
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:48 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b19so1879502pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DzolUZAMoyP7RiMdU6PtAmNoNFdULRkL2OSW+mTTZHQ=;
	b=b8ZFjGcJJmANx8bPeVs9tJhWjXI1umnv6GpJDxcGWyfDhnTOb1jjLLbKYR0BI0/87J
	Mo4cTxDZ1iMDg2fUaSe+V43wfX807eyMZi3TA1GA97JBSzO/PDhdSSjhydxLEjNppBrt
	vrROn3bblT/VF7lVoP7ZSvPntIh7AMX7ZMnpPKJ04q7EQA+HKpUsH9+/ld8EyX6nbFWf
	IUrMvn00mUYNj4BKeVcPWRy4ZiHpY83rV7U8nsWcF+tnBIgIar98+i+ZoAQyHYAnUk8i
	1lGHojUiluf+eZeboyBVuC8zzY6kdBYt5pS/inDtr9V7wbl0hNiLRIstKMB0QUHl/xWM
	GXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DzolUZAMoyP7RiMdU6PtAmNoNFdULRkL2OSW+mTTZHQ=;
	b=kWaMECjjsRtNCHoAKwUJXCoIEBnA8yvk37v4NzJjX4LNJa3pIyf+gbjoIVAyyFqzJY
	Xc4JGDtJH3Ex60VKyqV+STdK9HpMESW2w7joRc1xxE3I+fY/nV/k8oPCUigSZQNqJJ57
	8kHwivD5NSxkBHsl5eXpWznte1IBzhcqICAUeXdsHnThKQUeW/r9L7TqGRZWDORlIiKJ
	sCv/8KcrbWN8lHEQ9G1Sj60Fz76xRp1QgEaP1OJzyJFE+jmRylgSalssxHmP0t+mJFCB
	1XjWFHXNdqi2hj3u18U1xcIBVrt1p7opxz7WjSoqwcDNGRaFvy3uktnA9ZjpbjVhMW53
	4e1w==
X-Gm-Message-State: APjAAAXpF2FEeCA8kwP4gpfqnDkLl39afsQHplOtmOsArowCoHN0tHz6
	mywhg3Nm146uUBhwdeXmqb6mAZPo
X-Google-Smtp-Source: APXvYqw4iK/R29n0vCHy3Vzm9ySpri6dt2RuhvlJFjwam+jR0GMhkTbTdaDTRIhk1xpDE5nUrRBsuw==
X-Received: by 2002:a63:3cd:: with SMTP id 196mr4357354pgd.150.1573658389830; 
	Wed, 13 Nov 2019 07:19:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:07 -0800
Message-Id: <025091692e73b78c36bd4095288b9f3fc7ee1811.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 04/25] devtool: Avoid failure for recipes with S == WORKDIR and no local files
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:49 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

When extracting the sources for a recipe that has S == WORKDIR and no
local files in the SRC_URI (which, e.g., can happen for a recipe with
a URI that has the unpack=false attribute), the extraction fails with
the following backtrace:

  Traceback (most recent call last):
    File ".../scripts/devtool", line 344, in <module>
      ret = main()
    File ".../scripts/devtool", line 331, in main
      ret = args.func(args, config, basepath, workspace)
    File ".../poky/scripts/lib/devtool/standard.py", line 762, in
    modify
      initial_rev, _ = _extract_source(srctree, args.keep_temp,
      args.branch, False, config, basepath, workspace,
      args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
    File ".../poky/scripts/lib/devtool/standard.py", line 647, in
    _extract_source
      bb.process.run('git %s commit -a -m "Committing local file
      symlinks\n\n%s"' % (' '.join(useroptions),
      oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
    File ".../poky/bitbake/lib/bb/process.py", line 178, in run
      raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
  bb.process.ExecutionError: Execution of 'git commit -a -m
  "Committing local file symlinks

  %% ignore"' failed with exit code 1:
  On branch devtool
  nothing to commit, working tree clean

This is because no files were found in the oe-local-files directory
and consequently no symbolic links were added using `git add`, but the
`git commit` command was still executed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/devtool/standard.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index aca74b1..dcb6bf9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -637,9 +637,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                         addfiles.append(os.path.join(relpth, fn))
                 if addfiles:
                     bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
-                useroptions = []
-                oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
-                bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+                    useroptions = []
+                    oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+                    bb.process.run('git %s commit -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
 
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
-- 
2.7.4


