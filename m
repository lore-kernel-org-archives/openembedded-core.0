Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8497.1618985195073168650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Zh7z7pzl6XHTRLPF3j/0zMFKmkZpAsLE6ZtMbuHRQueiAB85yMyhBnNXaXlQisHHzhrq6+DyGF
 tnbdxYW4z9ig==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195671523"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195671523"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:40 -0700
IronPort-SDR: BVMhE874au7ui4+sDGBB5PEsEkn8sYKVfLRSplMkZx1jRrOuu3D+xFzAZtPkavPuzAAEv7w3UQ
 39umlTzzPdOQ==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="385684440"
Received: from slow4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 6/8] externalsrc: Detect code changes in submodules
Date: Wed, 21 Apr 2021 14:06:18 +0800
Message-Id: <8e6d103e17debc93e0627b96c2910aadd14aab7f.1618984878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618984878.git.anuj.mittal@intel.com>
References: <cover.1618984878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Douglas Royds <douglas.royds@taitradio.com>

Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

The (undocumented) git submodule--helper returns a path
for each submodule relative to the top of the repo.
Don't add submodules that are not within our source subtree.

[YOCTO #14333]

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c18225d3ef94a41fc073ae87c163b68e6d46571)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/externalsrc.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index c7b2bf2f49..3d6b80bee2 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -220,11 +220,12 @@ def srctree_hash_files(d, srcdir=None):
             submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
             for line in submodule_helper.splitlines():
                 module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-                proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
-                proc.communicate()
-                proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
-                stdout, _ = proc.communicate()
-                git_sha1 += stdout.decode("utf-8")
+                if os.path.isdir(module_dir):
+                    proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                    proc.communicate()
+                    proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                    stdout, _ = proc.communicate()
+                    git_sha1 += stdout.decode("utf-8")
             sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
-- 
2.30.2

