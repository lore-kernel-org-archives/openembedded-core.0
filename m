Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2284C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 22:50:57 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.12419.1640127055740975491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 14:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MRfFcq4A;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1640127056;
  x=1671663056;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8VoWIewvBsqPCBFPb6kJCqK/P4bRx1RNZgMzyHQtmBc=;
  b=MRfFcq4AsEWJrPbydEtpNd0R7K6VcVejH5EcqMZxfyjxBQR9+h/ZSvZT
   pDfMq6TB8CiJ3E5qBgr1GZSAHLrQDmjr4VRwr5PKh4apHuSFRpaapDUf3
   TUm/mexZENHRj+Fs1LR50OfCA5b5/oXVz3/9c0+n2vmQ8bMcpaYo2ICf8
   odCei9C7+KfrXryoBwOcoMrApmtKOx0wwFsOK3MFI09DWqIMLFtGXoM5K
   CYWMP2m2VzoOzSjlES1ATkJEk+RHt01ApReF2d5XZ3jKRymzPoNapWUPp
   Byx8WWdFiFl6qw8k84Hj9Cvb9L+JZzEdFGRuc+G8qzmlnoG5d5l82Ph6F
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] tzdata: Remove no longer relevant RCONFLICTS:${PN}
Date: Tue, 21 Dec 2021 23:50:50 +0100
Message-ID: <20211221225050.13953-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 22:50:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159932

Remove RCONFLICTS:${PN} for the packages from the timezones recipe,
which was replaced by tzdata in OE-Classic in 2007...

Also remove a commented timezone (pacificnew), which has actually never
been added to TZONES.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

These changes were part of the second version of the patches I sent
earlier, but the first version of those patches was actually merged
instead.

 meta/recipes-extended/timezone/tzdata.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index cc1caff124..7f4322d867 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -13,7 +13,6 @@ TZONES = " \
     africa antarctica asia australasia europe northamerica southamerica \
     factory etcetera backward \
 "
-# pacificnew
 
 # "slim" is the default since 2020b
 # "fat" is needed by e.g. MariaDB's mysql_tzinfo_to_sql
@@ -201,9 +200,3 @@ CONFFILES:tzdata-core = "${sysconfdir}/localtime ${sysconfdir}/timezone"
 ALLOW_EMPTY:${PN} = "1"
 
 RDEPENDS:${PN} = "${TZ_PACKAGES}"
-RCONFLICTS:${PN} = " \
-    timezones timezone-africa timezone-america timezone-antarctica \
-    timezone-arctic timezone-asia timezone-atlantic timezone-australia \
-    timezone-europe timezone-indian timezone-iso3166.tab timezone-pacific \
-    timezone-zone.tab \
-"

