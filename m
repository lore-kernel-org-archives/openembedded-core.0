Return-Path: <dan.dedrick@gmail.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id B52FA6006E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 20:15:46 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id c9so16972028itj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 12:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=flpSbUlP/CpS/uLdXS8D0C2IV+sn3WUDPSHMZEZ5pQI=;
	b=lbc45ngRy2wTPU39/pOVryk87WvxNZ402P+ldcqyKdRlzZ4fNObssxJulAKarEE1FD
	3nqhMLdmvekWdKpG0dLkMOFjhQdcWoAbpbNO6hrVvUq1cwhiGe1UODt3bh8VarkLifx6
	CoqlJq40uQUXMgbf5aQMp9iWdGgagLGhmVmU+4VYO2kISgNjtcU2HYiUxkB9neQ/Lad2
	SqqjGoemvqI3JtQefWCtHwz4LfD023mmbmKuN5vTPst6Sk1pBgnXLAi/m8+fqhkbIjg+
	CjDPwXfYCYpYFCNwXtRfdYtlRpMhdJSXGaH9IYQFhc8rPLv9szYUKv1hdXZfBvmqxSj1
	yLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=flpSbUlP/CpS/uLdXS8D0C2IV+sn3WUDPSHMZEZ5pQI=;
	b=iXOEA70hR7qShbFcJPP0OLYBUdo/1sTXmUTfxMSaMKnH/zg547BlN8Zq8ijJ+HsHqd
	AADorRYYVjgpXQmRH3ycidQaf9Qg1NP3k/S9MBJBx542h3SJni8g0TpiaxVmUNpxvSHo
	mpbfb264Pc3xmpoHcjsPDQY3DggMbfdkpSJYHQ5B0ufonh6gzWr+Oj8ehsuCIFdD/4kP
	J7yCQdppwlit9wbmUa+NB0y8yEekYjcM5LFSuPApSMXaOELmZRwmT1ce/bKb/yO3tRuF
	WDcjukkgwHIcwrAXG0lKn1QpUgByFrJWKf9pvTudSzFd6kGZOv8rvUyDGhLjVe9jkwmo
	ZN1g==
X-Gm-Message-State: AJcUukddeyJ7LAr5wPWQ+SJ0cBRaIqDex7JgK/VqrMCvBQ4MduuvmFud
	vcmkR13r047/hXTChgPbFZDWI6mA
X-Google-Smtp-Source: ALg8bN6ElOZsu7fYeQOWfhkrHq5PFDUyzNKx5tB7FicRAS51LOB9XLHqRgQp7Oz41oBwnGBIM691NA==
X-Received: by 2002:a02:77c1:: with SMTP id
	g184mr16843881jac.140.1548101747399; 
	Mon, 21 Jan 2019 12:15:47 -0800 (PST)
Received: from dargo.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id m7sm6205659itk.38.2019.01.21.12.15.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 12:15:46 -0800 (PST)
From: Dan Dedrick <dan.dedrick@gmail.com>
X-Google-Original-From: Dan Dedrick <ddedrick@lexmark.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2019 15:15:27 -0500
Message-Id: <20190121201527.52834-1-ddedrick@lexmark.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] devtool: improve git repo checks before check_commits logic
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
X-List-Received-Date: Mon, 21 Jan 2019 20:15:46 -0000
Content-Transfer-Encoding: 8bit

The check_commits logic assumes that both devtool-base and args.branch
exist in the git repo that it is operating on. In order to prevent
errors at that point it's best to first ensure that both of these refs
actually exist. If they don't both exist then the check_commits logic
should just be skipped, as it would be if the repo wasn't originally
checked out by devtool.

Previously if a user removed the args.branch branch from their devtool
cloned repo this code would crash on adding the repo with -n. The crash
would look like this:

Traceback (most recent call last):
  File "/home/ddedrick/src/poky/scripts/devtool", line 344, in <module>
    ret = main()
  File "/home/ddedrick/src/poky/scripts/devtool", line 331, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/ddedrick/src/poky/scripts/lib/devtool/standard.py", line 812, in modify
    (stdout, _) = bb.process.run('git log devtool-base..%s' % branch, cwd=srctree)
  File "/home/ddedrick/src/poky/bitbake/lib/bb/process.py", line 178, in run
    raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
bb.process.ExecutionError: Execution of 'git log devtool-base..devtool' failed with exit code 128:
fatal: ambiguous argument 'devtool-base..devtool': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
---
 scripts/lib/devtool/standard.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d14b7a6543..328b5cf02e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -769,9 +769,13 @@ def modify(args, config, basepath, workspace):
             check_commits = True
         else:
             if os.path.exists(os.path.join(srctree, '.git')):
-                # Check if it's a tree previously extracted by us
+                # Check if it's a tree previously extracted by us. This is done
+                # by ensuring that devtool-base and args.branch (devtool) exist.
+                # The check_commits logic will cause an exception if either one
+                # of these doesn't exist
                 try:
                     (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=srctree)
+                    bb.process.run('git rev-parse %s' % args.branch, cwd=srctree)
                 except bb.process.ExecutionError:
                     stdout = ''
                 if stdout:
-- 
2.20.1


