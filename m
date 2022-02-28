Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC291C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:27 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Q8ZAhKAk;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056887; x=1677592887;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mEfjL9GKd5I+LFP6IM+DzvL75XMPun36gReiZlrCCU4=;
  b=Q8ZAhKAkMmPa0sq7WUKVU88E1WKZzLgBG3hQZfe8u58uaPtHnoZCq8qF
   nuV69/HRI5InHPjCuBn8zcoiiUpaeMIu0o11mMu47UslyhgwbuyAqqSLj
   1T3hyYJhL/I/7tOtnHK4cKgIfKIfNxEcBkKGS4BznoelITKb5vpN7iY3J
   tbdMbKHA4dd0hC8uIbpoFY5dxVxVRDSVqyaCWtBTLyLXbZnEV4/qQAR8Q
   PODCmhAihNTiCskJx7LRtWKD2cYFzdEGI4UgoO5vl90lcVGFjZsiQBZPL
   wq0NxVp4AGBNOO5ewJeoPLWWCByf/QkEBCj2okWPEckKtj5jZfUnFA0gh
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857333"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857333"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:23 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092709"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 29/39] devtool: deploy-target: Remove stripped
 binaries in pseudo context
Date: Mon, 28 Feb 2022 22:00:19 +0800
Message-Id: 
 <c17205c6fea6b7805786e3168a2c6c702f8f4b2e.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162485

From: Florian Amstutz <florian.amstutz@scs.ch>

deploy-target may fail the second time with "pseudo abort" because
devtool-deploy-target-stripped is deleted outside of pseudo's fakeroot
context.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2338a33b690b0bbe279cde3f73764911b239cb50)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/deploy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 833322571f..e14a587417 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -170,7 +170,7 @@ def deploy(args, config, basepath, workspace):
             srcdir = recipe_outdir
             recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'devtool-deploy-target-stripped')
             if os.path.isdir(recipe_outdir):
-                bb.utils.remove(recipe_outdir, True)
+                exec_fakeroot(rd, "rm -rf %s" % recipe_outdir, shell=True)
             exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
             os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
             oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
-- 
2.35.1


