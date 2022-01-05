Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F147BC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:33 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.1733.1641395973368105348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=OVfDFjh6;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395973; x=1672931973;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+F2nRPAbmyHeo5ccAnuxnzamNTBpy3eib5nGkwVRlOk=;
  b=OVfDFjh6fVGQOSjjIYYrnLk6yr9QZ+a5zoYnGfMBbbGYF1jx4/GfaUMw
   FuAvPDw1mWcW8O6I7Az43GZ3g+mlIBIGHX7VA3XUxquixtH9fFjqrlS+K
   eoABcZyjBZgGk0A6Uf3iXgZVZaRKNi///zOZGZYHcaJAKMd3a2F95n+9D
   gJRUpjPAACqHbDxnjtSzIhUjWJdu+pmW5orIbpzl/1gtP5p6V8C1C47aR
   jC3aUvCtFDr1CCKT7MHyImWokJtLAGadP5Ie15eMciTqV/onFBq+w5Sil
   2X48vc4BafYIgDv0sLiuvsD6By+dIhLGsw2Q22gLd4ojJOt2R2UKoCjQu
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223147024"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="223147024"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128703"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/24] selftest: skip virgl test on centos 8
 entirely
Date: Wed,  5 Jan 2022 23:18:40 +0800
Message-Id: 
 <125f62204a14ff11becb6db9d412d1abece930aa.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160205

From: Steve Sakoman <steve@sakoman.com>

With the sdl frontend, qemu isn't able to even boot fully,
so let's skip the test early.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 74bb94a7d249b5c53f3e1d15688a3a323fc8e828)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index b20c5b427b..668e978f17 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -185,6 +185,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Debian 9')
         if distro and distro == 'centos-7':
             self.skipTest('virgl isn\'t working with Centos 7')
+        if distro and distro == 'centos-8':
+            self.skipTest('virgl isn\'t working with Centos 8')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
-- 
2.33.1


