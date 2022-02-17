Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99834C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:33 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=AcVyC16j;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107513; x=1676643513;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wSZ6ofls9lphTaDFJrT/xPi10EaQyZoOIHQRDO6JgkY=;
  b=AcVyC16jCxPu4I952nf2yVAJydtJ6JR/oitSY2rkRSiJKdgd2JondnXp
   bzzLlTTUon2ZDcVRYU+PqinB9kUHWHw9kaKl91SVgO/exEsVc/O08bavZ
   nVt7c9SSM4ED0QIxoM+7qGchBvJO3mlpG/Lxy3yv8NcKKHOvSBzEHB8bR
   uvxMeSu8dnvs3NNcjVhICHdgMstN3DKuWARR5Dg7dzgo5zDpyDJD5aoZJ
   q/zXjI7hBCPTJvPjeMhSui5Fj34RXFymjupCm08SRK9B4HFT8gJLzkF5b
   tUAIzgtnSenrxhldeIUJrXFXTUZwGm6vNARZ7rRbpuJueYXWrFRZ4bAmC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250617959"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250617959"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249227"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/14] recipetool: Fix circular reference in
 SRC_URI
Date: Thu, 17 Feb 2022 22:18:12 +0800
Message-Id: 
 <5e5874d9b8f954771edb4ee3725bb31c1c5a70f2.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161803

From: Saul Wold <Saul.Wold@windriver.com>

When creating a new recipe.bb file for a binary, don't use BP which
includes the version information, instead use BPN which is just the
name base Package Name.

Since PB is not specified, it takes the default:
PV = "1.0+git${SRCPV}"

But SRCPV is defined in terms of the SRC_URI, which leads to infinite
recursion (traceback below). Here are the pertinent variables which
cause the recursion:

SRC_URI = "git://github.com/lvc/abi-dumper;protocol=https;subdir=${BP}"
BP = "${BPN}-${PV}"
PV = "1.0+git${SRCPV}"
SRCPV = "${@bb.fetch2.get_srcrev(d)}"

def get_srcrev(d, method_name='sortable_revision'):
    # ... trimmed
    scms = []
    fetcher = Fetch(d.getVar('SRC_URI').split(), d)
    # ... trimmed

[YOCTO #14040]

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3b8d43fc53ee13d39abc3b2a1f706a97fcf752aa)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index e8e71fabfd..b9f9c80367 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -435,7 +435,7 @@ def create_recipe(args):
         if args.binary:
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
-            fetchuri += ';subdir=${BP}'
+            fetchuri += ';subdir=${BPN}'
         srcuri = fetchuri
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
-- 
2.35.1


