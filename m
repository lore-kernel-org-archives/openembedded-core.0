Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B98C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:08 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456751"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456751"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:07 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617075"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:06 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/36] rpm: Ensure compression parallelism isn't
 coded into rpms
Date: Wed, 27 Oct 2021 23:16:15 +0800
Message-Id: 
 <16d6f01eced9e6de5068056aea07a08ec9dfb659.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157523

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't want the compression thread numbers to be encoded into the rpm
since this results in the rpm not being deterministic. Add a patch
from Alex Kanavin which addresses this issue (was queued for rpm 4.17
but we need to fix this with 4.16 too).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ba0bf50c72f2506dfa507559c49a70e16cd5124)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...not-insert-payloadflags-into-.rpm-me.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
new file mode 100644
index 0000000000..79b168257e
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
@@ -0,0 +1,28 @@
+From 2d351c666f09cc1b9e368422653fb42ac8b86249 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 31 Aug 2021 10:37:05 +0200
+Subject: [PATCH] build/pack.c: do not insert payloadflags into .rpm metadata
+
+The flags look like '19T56' where 19 is the compression level
+(deterministic), and 56 is the amount of threads (varies from one
+host to the next and breaks reproducibility for .rpm).
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ build/pack.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/pack.c b/build/pack.c
+index 932cb213e..b45d0726f 100644
+--- a/build/pack.c
++++ b/build/pack.c
+@@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)
+ 	    headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR, compr);
+ 	buf = xstrdup(rpmio_flags);
+ 	buf[s - rpmio_flags] = '\0';
+-	headerPutString(pkg->header, RPMTAG_PAYLOADFLAGS, buf+1);
++	headerPutString(pkg->header, RPMTAG_PAYLOADFLAGS, "");
+ 	free(buf);
+     }
+ exit:
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index 7c03b41fc8..0b58a24b99 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            file://0001-tools-Add-error.h-for-non-glibc-case.patch \
+           file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            "
 
 PE = "1"
-- 
2.31.1


