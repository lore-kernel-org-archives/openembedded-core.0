Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E56CC43217
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.10087.1632927554721798137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="224613825"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="224613825"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="520858477"
Received: from zkeh-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.143.173])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/10] oeqa/buildproject: Ensure temp directories
 are cleaned up
Date: Wed, 29 Sep 2021 22:59:07 +0800
Message-Id: 
 <bccbcb6f13f574810ac3549aeabf90a45c483d8e.1632903759.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632903759.git.anuj.mittal@intel.com>
References: <cover.1632903759.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 14:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156466

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d10aff865120a5feecc42c24726bd119364e0188)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/buildproject.py | 3 +++
 meta/lib/oeqa/utils/targetbuild.py  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index e6d80cc8dc..dfb9661868 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -18,6 +18,7 @@ class BuildProject(metaclass=ABCMeta):
     def __init__(self, uri, foldername=None, tmpdir=None, dl_dir=None):
         self.uri = uri
         self.archive = os.path.basename(uri)
+        self.tempdirobj = None
         if not tmpdir:
             self.tempdirobj = tempfile.TemporaryDirectory(prefix='buildproject-')
             tmpdir = self.tempdirobj.name
@@ -57,6 +58,8 @@ class BuildProject(metaclass=ABCMeta):
         return self._run('cd %s; make install %s' % (self.targetdir, install_args))
 
     def clean(self):
+        if self.tempdirobj:
+            self.tempdirobj.cleanup()
         if not self.needclean:
              return
         self._run('rm -rf %s' % self.targetdir)
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 1055810ca3..09738add1d 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -19,6 +19,7 @@ class BuildProject(metaclass=ABCMeta):
         self.d = d
         self.uri = uri
         self.archive = os.path.basename(uri)
+        self.tempdirobj = None
         if not tmpdir:
             tmpdir = self.d.getVar('WORKDIR')
             if not tmpdir:
@@ -71,9 +72,10 @@ class BuildProject(metaclass=ABCMeta):
         return self._run('cd %s; make install %s' % (self.targetdir, install_args))
 
     def clean(self):
+        if self.tempdirobj:
+            self.tempdirobj.cleanup()
         self._run('rm -rf %s' % self.targetdir)
         subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
-        pass
 
 class TargetBuildProject(BuildProject):
 
-- 
2.31.1


