Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17299C43219
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=mEH66Bz0;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237876; x=1683773876;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Yx2+cAkURNkKYf2lyHKcyti/NbY7mkO0wPf+BKWGxFQ=;
  b=mEH66Bz0azLygUyP9m5KzFOaq+PLnz3XwclCOK+ziecNrnLbYUkEJxfm
   ywG4Zn1jIHdt4d73S+VhmrYyN35sZbrFdL1OjEitw5+mYU6OWKMEOg88J
   Tv+JSNUzVmi41TNDR5NMa8Ouo3rArXoFCILAQhspLELD48l1xk8ttrYae
   QucBpy4re2Ga/QP2IyZwgzNhjNEeDEmUSfADIeDCKwkiq4o3KyPKvZW78
   NKmBoZuuw1rychEXkz8Z8NcrWf+ZCLPTgHkkON2pzrr1XfUlyo2emdvVr
   lxEzUNKRyzuN/xeQtu+3PkUdytnKm7baIFUPQDeLXAl2+iZH25OjwyNny
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106052"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106052"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754799"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:54 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/17] scripts/git: Ensure we don't have circular
 references
Date: Wed, 11 May 2022 10:57:26 +0800
Message-Id: 
 <8b1d8ba7e1b2e4278c9127654a66336d2615e58b.1652231471.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/165479

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is horrible but I'm running out of better ideas. We hit circular reference
issues which we were trying to avoid in the core HOSTTOOLS code. When building
the eSDK, there can be two copies of the script.

Therefore assume git will never be in a directory called scripts. This
fixes eSDK build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27de610ac30d4c81352efc794df7e9b1060f7a68)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/git | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/git b/scripts/git
index 8adf5c9ecb..644055e540 100755
--- a/scripts/git
+++ b/scripts/git
@@ -10,7 +10,14 @@ os.environ['PSEUDO_UNLOAD'] = '1'
 
 # calculate path to the real 'git'
 path = os.environ['PATH']
-path = path.replace(os.path.dirname(sys.argv[0]), '')
+# we need to remove our path but also any other copy of this script which
+# may be present, e.g. eSDK.
+replacements = [os.path.dirname(sys.argv[0])]
+for p in path.split(":"):
+    if p.endswith("/scripts"):
+        replacements.append(p)
+for r in replacements:
+    path = path.replace(r, '/ignoreme')
 real_git = shutil.which('git', path=path)
 
 if len(sys.argv) == 1:
-- 
2.35.3


