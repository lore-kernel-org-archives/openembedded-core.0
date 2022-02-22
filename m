Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E054C43217
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13723.1645542509609922511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bcT3dUQh;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542511; x=1677078511;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zODHPFL2iVTm5ciykAKtXrEITtS543VB8SB8RR0L7VA=;
  b=bcT3dUQhwjZ5wKtgUe5eUYs/7z5iBvxvPrV19rxaYKtJspUYm4vIV/yq
   nCcWn4PsT2RSeTDpkypvR4FQLAEofl8hnCKJONDi+dmXDRKnvfmEO1Ehb
   BWc0CfVgTYnUXwYcqUz82MJ/YvaGazHoEliBagNHYdyAqi9+TcW8KxlRa
   5KXJC0aTk/6XnCH6Y69jMtqSfj3ttqxp+lBnrgdfwMPWNILjsYplz0ZhM
   YUPPtxRuOb/4sb9dZB9GLp2t6NTxrAKHQEDMYO4jm9bC1u35XGqBWAtzg
   pJGW4R89chjRuB4zEXroxEWZgt8mAUugZWSLuMivFneV6bNGwwRdg3wEf
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305098"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305098"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258597"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 15/38] recipetool: Fix circular reference in SRC_URI
Date: Tue, 22 Feb 2022 23:07:16 +0800
Message-Id: 
 <1deb4e4b13fa37a480bddd5ab930fcdfe0475761.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162150

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
index 63e7f0658b..b4b1f817f1 100644
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


