Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.3208.1586407290900494247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 21:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RB6o30+7;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bkylerussell@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id j4so2741037qkc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6lcaZx203dSOEaeqmvHencgPpI1LzkAxDdmLjUIzj7Y=;
        b=RB6o30+7iry8UKufILYJojJKUKlHxvJK1j/dF9Swo9lOWs0vj8qJhb+vsCmGBdmpcf
         3v5nRlVcDBM+kWdQhlMstdJezzsvEbcj+l1wxMYxDpqDY7aPPOdgEmGiEwM1R1x4qYSW
         RTOD//1Wp4zwhLL1Jd4tqRKUhTIvYZjA/n8XfBFXAbOpKbM3mvHjny7KLhHQ8g3jsqvu
         xFPoXbTUEdN4HvFxnVeblqXTHxeP9Suxo3eqY7Z3P81rmjoW7xl5IP7tmKfUZC24YWRo
         ZPI/CawDq24t49GNCYA60lsIefFo0+s9UT0PkNWEqWN4/+KWXTRGV3x8zvmbL0YiOHzx
         3tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6lcaZx203dSOEaeqmvHencgPpI1LzkAxDdmLjUIzj7Y=;
        b=MG7EA6O5hRmbyi1Mc87ImU+y0ARtaXXj2lfDo9JTsluiu2joo1LwF6uGpjJbfRBXQ8
         c/SU1P4AXYQB6+/M7QW5Fb7PuC87bstRm9HqF2dJwEeyK1lj7+Ksux5ZAu4WjCoKjswG
         CqsKKhvUqJ6JOYIbsY0+GocTKtpTqX0i5dkbbYnD4rJ3fGQHCPxNtQl1sL5dB6RAs1j/
         y3ynQxGvzYQZLHdzoiYE6eA9U6PCLqs0YgmcSxe0M5LmeFpq6+OQ3/T9ycFz2RcSgknV
         s4K+G43Wjd56Fkjy5i4dFuSauHDJk4oozAkrAxN9lpEmx83D1i6EyIa531Kn6t0+dEGX
         KA7Q==
X-Gm-Message-State: AGi0Puaj4p9/34vDX57yhW3GJFkJFca1/kvYoxBKyLYXgTu4RvZhmjq6
	CAO+sXKUJxSvyLq+NH9Qf0HyIqO/2Fc=
X-Google-Smtp-Source: APiQypKEEEHqBKuCzpIbdpPwY3xuKQVXj7ZkQf8eIQLzFCdvdeunZG04Pc8fN0xYzt+1K/LPkvGClQ==
X-Received: by 2002:a37:a555:: with SMTP id o82mr9072235qke.397.1586407289826;
        Wed, 08 Apr 2020 21:41:29 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.cinci.rr.com ([2605:a000:160c:8831:dc9a:14dd:5a5b:9f19])
        by smtp.gmail.com with ESMTPSA id x66sm15854131qka.121.2020.04.08.21.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 21:41:29 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: wesley.lindauer@gmail.com,
	Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH 1/1] patch: don't strip GitApplyTree patches
Date: Thu,  9 Apr 2020 00:41:16 -0400
Message-Id: <20200409044116.27070-2-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409044116.27070-1-bkylerussell@gmail.com>
References: <20200409044116.27070-1-bkylerussell@gmail.com>

Don't pass a path removal parameter to git am/git apply since GitApplyTree
always applies patches from the root of the git repo, not from each
individual patchdir (like quilt).

GitApplyTree uses `git rev-parse --show-toplevel` to find the root of
the repo no matter which patchdir is passed into the GitApplyTree instance.
In most cases, this works fine when applying patches since the three-way
merge can figure out where the patch should be applied to existing files
based on the history, even if the file paths are excessively stripped.

An exception to this occurs if a patch adds a new file to the repo
and a custom ${S} has been set to a subdirectory of the repo such
that the patch requires a non-default striplevel parameter.

When processed by GitApplyTree, the patch will have its striplevel
parameter given to git even though it's applied at the root of the
tree.

For example, consider a patch that adds a new file src/foo to a repo.

  --- /dev/null
  +++ b/src/foo
  @@ -0,0 +1 @@
  +new file test

The recipe sets S = "${WORKDIR}/git/src" and the patch is added to SRC_URI
using "striplevel=2" since the default patch tool, quilt, applies each
patch at its patchdir, which defaults to ${S}.

When the GitApplyTree patch class is used (for example, through devtool),
the root of the repo is passed to git as the work tree, in addition to the
path removal paramter.  In the case above, GitApplyTree creates
${WORKDIR}/git/foo instead of ${WORKDIR}/git/src/foo.

Interestingly enough, you can take a more typical patch example that only
changes existing files (instead of adding a new file) and remove the -3
argument from the git am/git apply commands issued by GitApplyTree.  In
this scenario, the patch will also fail to apply because the path removal
arg is still being passed, and the resulting path does not exist.

Since GitApplyTree always applies from the root of the repo, it should
ignore any striplevel arguments.
---
 meta/lib/oe/patch.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2b1eee1003..2e45a7ef89 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -517,7 +517,7 @@ class GitApplyTree(PatchTree):
             try:
                 shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot]
                 self.gitCommandUserOptions(shellcmd, self.commituser, self.commitemail)
-                shellcmd += ["am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
+                shellcmd += ["am", "-3", "--keep-cr"]
                 return _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at the end
@@ -534,7 +534,7 @@ class GitApplyTree(PatchTree):
                 runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
 
                 # Fall back to git apply
-                shellcmd = ["git", "--git-dir=%s" % reporoot, "apply", "-p%s" % patch['strippath']]
+                shellcmd = ["git", "--git-dir=%s" % reporoot, "apply"]
                 try:
                     output = _applypatchhelper(shellcmd, patch, force, reverse, run)
                 except CmdError:
-- 
2.17.1

