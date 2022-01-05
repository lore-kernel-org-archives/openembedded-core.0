Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06426C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:09 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=eAC5xqnz;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395947; x=1672931947;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZPK96jKi3j3uQPomNy+dnCBTxAjgWVXbMMMHP52tNUU=;
  b=eAC5xqnz6IBvuJ4voImHH4Fa1lASNK2AQY3vCzAzgDm3OMr84ba+DqDk
   2AJIfFlx1AAQxbGsVuTHks1rKs9v1RcsYJjktzlg9qyqgfPchkVfU1HOk
   vwRGrpaEctuvMLHxcW/dpVifB+IzHbSdDNrX5aGEVJ0HYWNs9FiR9eoq9
   kcSz5zsRPbiO/4vNAOmCdTbWq2lWjmYBwJTrHK28Fuj7mkfXWU3P4hUQp
   DC/NgJoBMNZxaY1C0A+PgafezjSVIOCNMI2EgS3C98V6FHP3s7uGI8dfB
   /w/WsXc5nTmGKbBS6mWe29QqRvADXHpHW5Kpheq2gcoxRAaRkmWkjgfuA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742761"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742761"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128581"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:06 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/24] oeqa/selftest/bbtests: Use YP sources mirror
 instead of GNU
Date: Wed,  5 Jan 2022 23:18:25 +0800
Message-Id: 
 <1b5f26c5409c69a25914aad5b4553285fbb0c3a0.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160190

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The gnu sources server has been known to disappear. Use the YP sources
mirror instead. If that breaks, the autobuilder is broken anyway. This
should reduce test failures from upstream network issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5459e42f1a6be9c08f303653cc1f73514eca9ef)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit fb18fcbd2529555ab98297671e3e6f68a8fd6556)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index a8b6231d83..0a618bb9a6 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -163,7 +163,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        data = 'SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
+        data = 'SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
         result = bitbake('-f -c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
-- 
2.33.1


