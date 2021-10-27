Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71752C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456754"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456754"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:08 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617078"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/36] package: Ensure pclist files are
 deterministic and don't use full paths
Date: Wed, 27 Oct 2021 23:16:16 +0800
Message-Id: 
 <59655c76c395ffaae0342458a6a2ce0494b8e1a6.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157524

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently the pkgconfig pclist files contain full paths which are build
host specific and the order of entries is not deterministic.

Fix both these issues so the files are deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e422e29bca4af3ab4073e04490f38b05cd7c38c0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/package.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e3f0a7060b..5e51b89184 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2079,12 +2079,12 @@ python package_do_pkgconfig () {
     for pkg in packages.split():
         pkgconfig_provided[pkg] = []
         pkgconfig_needed[pkg] = []
-        for file in pkgfiles[pkg]:
+        for file in sorted(pkgfiles[pkg]):
                 m = pc_re.match(file)
                 if m:
                     pd = bb.data.init()
                     name = m.group(1)
-                    pkgconfig_provided[pkg].append(name)
+                    pkgconfig_provided[pkg].append(os.path.basename(name))
                     if not os.access(file, os.R_OK):
                         continue
                     with open(file, 'r') as f:
@@ -2107,7 +2107,7 @@ python package_do_pkgconfig () {
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
         if pkgconfig_provided[pkg] != []:
             with open(pkgs_file, 'w') as f:
-                for p in pkgconfig_provided[pkg]:
+                for p in sorted(pkgconfig_provided[pkg]):
                     f.write('%s\n' % p)
 
     # Go from least to most specific since the last one found wins
-- 
2.31.1


