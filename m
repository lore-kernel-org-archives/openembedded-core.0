Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XOCdQggKAIR6+pNWRNY19xmNls7/U1+nF5RegCobctw36bf1zb1hXfAj5Wp2HeppfykKrdfI/8
 Lcl0BnSAB1EQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876879"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876879"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:19 -0800
IronPort-SDR: CEtdrITmUxwLGv3fKmtrqexy2WE9Kv7YSLeVXvSnr4j3BQw35tAiFLzdCW+d7UJxxjaiqmaO8K
 vBrSnQWralxg==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360891"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/25] externalsrc: Fix parsing error with devtool non-git sources
Date: Tue,  2 Feb 2021 13:33:48 +0800
Message-Id: <1da57e92812a1025d975204797b761a3be3998aa.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If srcdir is under poky directory (e.g. devtool poky/build/workspace/sources)
and is not a git repository then ${@srctree_hash_files(d)} will run "git
rev-parse --git-dir" and detect poky directory as git-dir and run "'git', 'add',
'-A', '.'], cwd=s_dir" trying to add srcdir but build dir is in .gitignore and
latest git will fail with "The following paths are ignored by one of your
.gitignore files: build" which will end with "ExpansionError during parsing".

In this commit I added a check if git_dir is the same as git-dir from
TOPDIR (which will detect poky directory) and if yes, then treat srcdir
as non-git sources.

(From OE-Core rev: 95fbac8dcad6c93f4c9737e9fe13e92ab6befa09)

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28bdfe0066cb3c41d6471af75dabcc573e319688)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/externalsrc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index dd09395788..7a7d31e311 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -197,6 +197,10 @@ def srctree_hash_files(d, srcdir=None):
     try:
         git_dir = os.path.join(s_dir,
             subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        top_git_dir = os.path.join(s_dir, subprocess.check_output(['git', '-C', d.getVar("TOPDIR"), 'rev-parse', '--git-dir'],
+            stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        if git_dir == top_git_dir:
+            git_dir = None
     except subprocess.CalledProcessError:
         pass
 
-- 
2.29.2

