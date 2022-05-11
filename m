Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1017DC4321E
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=MM26K4xx;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237874; x=1683773874;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lzjsAohWb8JWnaoxgldZBtNwd37JP96uPdbnkjtWD8Y=;
  b=MM26K4xxoPrWmyoMJimPhmk+LRBWRrNx9DCImDB7rl8krAYwgUUitvLX
   zG+2rKr+Nf9y5Wm9ET8/sCJuLdJHpwOUTBsZAmIxs5YMWhRS2vuye5I49
   Cf/g7NQbz8nPNtpO7yaMxLb+oCV3/AWxT3ShwaC8uR5f9W2Z1Hx3tCD9g
   HG1NNLrzVYWyTpbtcjXcpQLE8pfsuTKXSlZuMYwcAAvwFf+Ip14iyoPWo
   c2UuTD82JLs4ejmcsCGCWE1x24Xovc9jbJD4+xNLc9JLsS/UAYxhn+0r2
   TURAhNlxEvU6smQHwAusNDtzR1Wv+CcClGBz2ELYjd5QPwEdgs+bs5v14
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106042"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106042"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754791"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:53 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/17] scripts: Make git intercept global
Date: Wed, 11 May 2022 10:57:25 +0800
Message-Id: 
 <2863b1237128906bccf7d2e9ecb739afb395fe4e.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165478

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous minimially invasive git intercept simply isn't enough. For example,
meson used in the igt-gpu-tools recipe hardcodes the path to git in the configure
step so at install time, changing PATH has no effect.

There are lots of interesting things we could do to try and avoid problems but
making the git intercept and dropping fakeroot privs for git global is probably
the least worst solution at this point. It will add slight overhead to git calls
but we don't make many so the overall impact is likely minimal.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af27c81eaf68ee681dcd9456a74cca6a9ab40bf6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/{git-intercept => }/git | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{git-intercept => }/git (100%)

diff --git a/scripts/git-intercept/git b/scripts/git
similarity index 100%
rename from scripts/git-intercept/git
rename to scripts/git
-- 
2.35.3


