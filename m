Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.928.1619398501109409766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bHoBpODPoG2aszvIhU524/+KtGb+AUYwfYMeitJ5Zge3uD0GcysrGfXyftyxqV4gcw2t/X9xwW
 tsORJ54x3QvQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818261"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818261"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:00 -0700
IronPort-SDR: uvH9uqS8Glzf5Ku8DS4RCwJlGUj8Dva6Jlt1yhy2rPyrMIjdIS5rOTsXj4LEhPhWEUSatCECbP
 dAVI8eJzigNQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067507"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 47/64] Revert "externalsrc: Detect code changes in submodules"
Date: Mon, 26 Apr 2021 08:53:18 +0800
Message-Id: <4d961d6b794b389f8a2d062d5e7c0ae1ddc49e36.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/externalsrc.bbclass | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 54cc7edbae..c7b2bf2f49 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -217,16 +217,14 @@ def srctree_hash_files(d, srcdir=None):
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
2.30.2

