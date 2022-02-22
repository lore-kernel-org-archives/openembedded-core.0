Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA84C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:51 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13729.1645542530232186642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=OeXRJlQ1;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542530; x=1677078530;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xth8bw45ElH+4ohqm7kqwBC9UAVibLW5ted3PhG8ecY=;
  b=OeXRJlQ1c8fCwl1cxPhdA7Wilg4oMtPnm5DCBHCW4ULYtA4BkQf4rfAY
   6WdcFCYbuPinl7hnjFyyd2UPCFN8ee3Ztfc4jctfFLTsoBWSZ4SQFQ1z2
   Cykqh5Tak2drXhcUnKB6hpAqaxIiLfewiz1CW9WGbUB2QTWf5s9WLFxiX
   TwchbD8SMZt/qcL6LuNJfT7vNQbzlf7u4t6IJ4AUvfJflwXWth7yg0J8b
   1Lc1Eioua6B6TsJBZYYtEekd7hQo79wGuv+WUnDvT2T0JKwXo0oE4rRCz
   k7svU06w7tpHxkogaOd8RQq0ToGJm01o+2QouRyjuFlFmchwqyPyJTJAR
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305266"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305266"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258772"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:32 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 29/38] oeqa/buildtools: Switch to our webserver
 instead of example.com
Date: Tue, 22 Feb 2022 23:07:30 +0800
Message-Id: 
 <31a415d1ddd5201dbce717c3a6508868161608a9.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162164

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similarly to the sanity connectivity check, switch away from example.com
for the buildtools tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed10f3c2b4c678069fe1cee73f79f6e388c7777e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/sdk/buildtools-cases/https.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/sdk/buildtools-cases/https.py
index 134879aab3..35e549eb40 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/https.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/https.py
@@ -13,8 +13,8 @@ class HTTPTests(OESDKTestCase):
     """
 
     def test_wget(self):
-        self._run('env -i wget --debug --output-document /dev/null https://www.example.com')
+        self._run('env -i wget --debug --output-document /dev/null https://yoctoproject.org/connectivity.html')
 
     def test_python(self):
         # urlopen() returns a file-like object on success and throws an exception otherwise
-        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://www.example.com/")\'')
+        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://yoctoproject.org/connectivity.html")\'')
-- 
2.35.1


