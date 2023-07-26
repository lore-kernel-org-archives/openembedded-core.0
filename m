Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBBEC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 16:22:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.15664.1690388543744120259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 09:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nlEf1+eV;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690388547; x=1721924547;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=L7iCDKh1NMoOE0vC0zhF0rFuFdljNvS+YGH2hDLYfME=;
  b=nlEf1+eVIx+ppTt0YdYT7cPxguohQFwtdbc8Mliuht+0v19qObAxeSKA
   gZeQ8BkcQNeOqCZnAnjXCd6uQ6M328j0w4AXRI8SSKkCCIKyeRIexomgS
   Khax/QEFb5i+pshShSsUJD/SFIH/MGRDEbKrI6ufQxQbu57poXHnYqxA8
   TWa4aaUn5Yf9jERQy/ATP0mm0mVZy48ygw5zhX3+EBKAxLH0K/W5f7uXI
   wF7j/HPy6HZwFUMxFiVdEzx2PUGNyBlAKAJnDxjZHucFxPuDs1IYHWzGg
   eNfJkFa57NMZi6zYoGgpmlf/y6RutTriH6isc7qsjaehg2d0ItIOe7Vdj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347676157"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="347676157"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816745743"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="816745743"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.246])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 09:22:26 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] selftest/cases/glibc.py: switch to using NFS over TCP
Date: Thu, 27 Jul 2023 00:22:09 +0800
Message-ID: <20230726162209.131855-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162209.131855-1-anuj.mittal@intel.com>
References: <20230726162209.131855-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 16:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184895

This provides a more reliable test execution when running tests that
write a large buffer/file and significantly reduces the localedata test
failures.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index c300aef913..924df6c5a6 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -45,7 +45,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         with contextlib.ExitStack() as s:
             # use the base work dir, as the nfs mount, since the recipe directory may not exist
             tmpdir = get_bb_var("BASE_WORKDIR")
-            nfsport, mountport = s.enter_context(unfs_server(tmpdir))
+            nfsport, mountport = s.enter_context(unfs_server(tmpdir, udp = False))
 
             # build core-image-minimal with required packages
             default_installed_packages = [
@@ -74,7 +74,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # setup nfs mount
             if qemu.run("mkdir -p \"{0}\"".format(tmpdir))[0] != 0:
                 raise Exception("Failed to setup NFS mount directory on target")
-            mountcmd = "mount -o noac,nfsvers=3,port={0},udp,mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
+            mountcmd = "mount -o noac,nfsvers=3,port={0},mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
             status, output = qemu.run(mountcmd)
             if status != 0:
                 raise Exception("Failed to setup NFS mount on target ({})".format(repr(output)))
-- 
2.41.0


