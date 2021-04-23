Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.10313.1619186400533100960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yVhOk9DX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so1316068pjv.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8Fa2w7ojsOW7oPJcYncVsey+MHMia68TvSUAsOfb/QY=;
        b=yVhOk9DX8XOU5sa0/LVVHYY59xtZUtz7R50sVvRaLo7sObO2dXYrVZXSyjQL9c5N6H
         1+1rPZb7xKP7LBh/YtpLIHnp0naykh0cW3oy3wGDe7Mtnl03xJFsrCXIurbNcv7JgbtB
         HIfhWhwu9wfKzWO5/3A3byKBdLAM5WX7P9ZzsEY6xiQWBAj2jsPOXv/cYxAHMD+4LipH
         MLknJhGpe35iJGHtA7C3b/aMS+5n8AC52vDI3w3bFiI+8bc3KsoQrUM4IXbfm9tvPdpu
         NbJ2qn2P5+2E1wFXh+drtHc+35etJnRmK0emRPuNk1Hl3FOpAKaXKpL04ScAMG0gbSnY
         7qFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Fa2w7ojsOW7oPJcYncVsey+MHMia68TvSUAsOfb/QY=;
        b=roPoNShRc0lXRNLuJvFLTsIwG67gg2iSi3lz94hR1/fo4SkBevanHPd1bYbouoof07
         KrQ7qR73n8naY41HAz/ij93Z2nqQDG1+9ZsM+4dBuKdvXO7CfQFFj4+/608sXurk6vse
         jdzU50w9lcFCJO3hBdJ13ryFta3wwjLIt1MTWw5F8SZ5QYaK5pzKMQDI6BD58Tdb42Vj
         B4efzNhDcvj3e0zRzvCLKp02GlC3//rkWtSj7hjWkn+UvzGgUZQqH/AXV5lsgBE6T5R4
         3glwuaNtXkc/r+i5+MpDaon+EXWiztwjZs0chBOwT8rGc2gzV1HinCPdLyCZ7CryPeDp
         FZFw==
X-Gm-Message-State: AOAM531oir1c3OOH79i62/8GfhK6zkz+QyrW+K8JecpUOrtjJJWj5zBp
	7xf3ekXievKBQJPqidHznFkew1uZ8DuD2EWYJIY=
X-Google-Smtp-Source: ABdhPJymP9y5IgOWBU77xb/qvrDajPz9HMABHSjzKzMNyNjvYp+9b0iH6m0TPhhZGnRX7iwN5tWORQ==
X-Received: by 2002:a17:902:7689:b029:eb:3d5f:ae58 with SMTP id m9-20020a1709027689b02900eb3d5fae58mr3804522pll.39.1619186399575;
        Fri, 23 Apr 2021 06:59:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.06.59.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 06:59:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/19] Revert "externalsrc: Detect code changes in submodules"
Date: Fri, 23 Apr 2021 03:58:44 -1000
Message-Id: <5c374996745816fcbbafbde75f10f4b6e41479b2.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Douglas Royds <douglas.royds@taitradio.com>

This reverts commit 4525310d49d115a37705f04ac5c03d639e5e8f8c.

Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

The (undocumented) git submodule--helper returns a path
for each submodule relative to the top of the repo.
Don't add submodules that are not within our EXTERNALSRC subtree.

If we unpack one git repo inside another, like this:

    SRC_URI = "git://${GIT_SERVER}/repo1;name=repo1;destsuffix=repo1 \
               git://${GIT_SERVER}/repo2;name=repo2;destsuffix=repo1/repo2 \
               "

Git status reports, for repo1:

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
	repo2/

If we run `devtool modify` on this recipe, do_patch runs with:

    PATCHTOOL = "git"
    PATCH_COMMIT_FUNCTIONS = "1"

The `patch_task_postfunc` (patch.bbclass, line 82) runs a `git add .` on the
top-level repo1, leaving the checkout in an invalid state. The following git
warning does not appear in the log:

    $ git add .
    warning: adding embedded git repository: repo2
    hint: You've added another git repository inside your current repository.
    hint: Clones of the outer repository will not contain the contents of
    hint: the embedded repository and will not know how to obtain it.
    hint: If you meant to add a submodule, use:
    hint:
    hint: 	git submodule add <url> repo2
    hint:
    hint: If you added this path by mistake, you can remove it from the
    hint: index with:
    hint:
    hint: 	git rm --cached repo2
    hint:
    hint: See "git help submodule" for more information.

    $ git submodule status
    fatal: no submodule mapping found in .gitmodules for path 'repo2'

No further git submodule commands can be run on the checkout.

We could enhance the `patch_task_postfunc` to look for any embedded git
checkouts and add them as submodules, but this seems unnecessary complexity for
an obscure edge-case. Although the git repo is left in an invalid state with
respect to the submodules, it still serves the purpose required by devtool:
To take further commits, and generate patch files from them.

We are still able to run these commands to examine any submodules,
where git submodule--helper reports paths relative to the top of the checkout:

    $ git ls-files --stage | grep ^160000
    160000 5feee12d6e974dd8c0614cf5b593380b046439a5 0   repo2

    $ git submodule--helper list
    160000 5feee12d6e974dd8c0614cf5b593380b046439a5 0   repo2

When a recipe sets EXTERNALSRC to a subdirectory of the git checkout, we test
for the existence of the reported submodule paths within the EXTERNALSRC
directory.

The latest versions of git submodule--helper accept a path to a subdirectory and
correctly report no submodules within that subdirectory. Regrettably, we still
support git versions that don't accept a path to a subdirectory.

[YOCTO #14333]

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2055718fdd19f925e236d67823017323bbd92a4b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index d1ca11303d..1d7300d65b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -216,16 +216,14 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            submodule_helper = subprocess.check_output(['git', 'submodule', 'status'], cwd=s_dir, env=env).decode("utf-8")
+            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
             for line in submodule_helper.splitlines():
-                module_relpath = line.split()[1]
-                if not module_relpath.split('/')[0] == '..':
-                    module_dir = os.path.join(s_dir, module_relpath)
-                    proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
-                    proc.communicate()
-                    proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
-                    stdout, _ = proc.communicate()
-                    git_sha1 += stdout.decode("utf-8")
+                module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
+                proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                proc.communicate()
+                proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                stdout, _ = proc.communicate()
+                git_sha1 += stdout.decode("utf-8")
             sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
-- 
2.25.1

