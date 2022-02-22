Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C20CC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13723.1645542509609922511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RYH7ZYWG;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542514; x=1677078514;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mEfjL9GKd5I+LFP6IM+DzvL75XMPun36gReiZlrCCU4=;
  b=RYH7ZYWGLxqlPkHO/AIAt8htik8ooxItK8kXComGiSg1JGI0NMs/G3rb
   /n0AqL4MpLOjbxtf40gvey52U+hE4shNNWLtrOhPvyqxmjppLrS8IHrS7
   QxPSoEtkj05C6gy6RvLa3ODjiRQhJS0dn7HlXt75t3w3iHuW0acxEW5yO
   bVAun5FlyzitdKYJws8EgIEdQcze99E55v5W/+RPB+1isg3lJPhHpUKX0
   QXb3S/YpnEiHh0253rILQ9zf7cz9yx50YYYJKTwg/shI9PCVXFV07O9LB
   jVKDLBsz9lV/0Y7cVBjr4i2xcMyNBTGkS4wWtYQMAWf5sFuGicY/npnMS
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305124"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305124"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258643"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 18/38] devtool: deploy-target: Remove stripped
 binaries in pseudo context
Date: Tue, 22 Feb 2022 23:07:19 +0800
Message-Id: 
 <23b0efb5428343b395a3abf76c84b21b08bbc33c.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162154

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


