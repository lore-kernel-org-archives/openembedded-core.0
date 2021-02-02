Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: L7r8UMJq0pK3DHfzv6s2tfI6K+dyob5kj8Gtq4lTwDS/OwUNgfUdb2idwVopS7gk6wF9L66w0W
 dT1TSoIBfEFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876901"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876901"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:27 -0800
IronPort-SDR: zcsueMHr0eViB19BeGwie785KF/OCoxFQTHn4nzG7gVQiAnBmseUA0w6tV+wwm8ccLYdOy+tTG
 lOTbpB9ZDXdA==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360942"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/25] externalsrc: Detect code changes in submodules
Date: Tue,  2 Feb 2021 13:33:55 +0800
Message-Id: <6d8a58b11117372fdbf0a86fbc6698ee509fc816.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

The srctree_hash was calculated only from main source directory ignoring
changes in submodules.

[YOCTO #13748]

Use submodule--helper to determine all submodules, and calculate hash
from all git tree objects names combined.

(From OE-Core rev: 50ff9afb3990bcf60b4fa1f937506cb84028c32d)

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9385670add6e630cebef758a30af17d3e57fcdfb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/externalsrc.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 7a7d31e311..64e94e3301 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -190,6 +190,7 @@ def srctree_hash_files(d, srcdir=None):
     import shutil
     import subprocess
     import tempfile
+    import hashlib
 
     s_dir = srcdir or d.getVar('EXTERNALSRC')
     git_dir = None
@@ -214,7 +215,16 @@ def srctree_hash_files(d, srcdir=None):
             env = os.environ.copy()
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
-            sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
+            git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
+            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
+            for line in submodule_helper.splitlines():
+                module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
+                proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                proc.communicate()
+                proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                stdout, _ = proc.communicate()
+                git_sha1 += stdout.decode("utf-8")
+            sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
-- 
2.29.2

