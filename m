Return-Path: <vrushti.dabhi@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C831CA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 06:34:36 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.web10.43966.1725431668923977441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 23:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=Sh7AZ41K;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: vrushti.dabhi@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2511; q=dns/txt;
  s=NAESA-Selector1; t=1725431669; x=1756967669;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uk7OnaTqrgclZG5SnE41T5mGzeagPXW51PXvkLLC3Zw=;
  b=Sh7AZ41KUE3tlhLmptgx51mUQeh4LT0acX2Fdt9waNDi9oiFPq9tDjzq
   CnA2sWzYABxBc8MtFObmgyCaReMSoviPZnIzJM6F3nWyTHn0vVRYiYL/s
   RmGo4X5H89c6xCXt0f6FBMM8blixeo/DcC6kjL5uK5Q26gtoQh8hHzdQE
   pyIS8XL2tFHLdZJnSjBZ4q5L0Bg4letCpMFV0+VqMaOz5pR6pzKqDEvUu
   f1Agfh+PgcEVYjZuGVI0pQoefGmOLYBgPsQyC/kGGcvz1hp/dBxsIbbef
   KocblxBCEcAiMBTWnOlBX4S9Vf5GXxZVolN0hRqLl7XgrswOOxFICsIpM
   w==;
X-CSE-ConnectionGUID: SEoNHQPhRwSytt1ex4SXTA==
X-CSE-MsgGUID: sZohEpfFTfSIEsLgY3DEBg==
X-IronPort-AV: E=Sophos;i="6.10,201,1719900000"; 
   d="scan'208";a="66314717"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 04 Sep 2024 00:34:27 -0600
Received: from AHMCPU2167.ap.corp.arrow.com ([172.25.9.210]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Wed, 4 Sep 2024 12:04:26 +0530
From: Vrushti Dabhi <vrushti.dabhi@einfochips.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Vrushti Dabhi <vrushti.dabhi@einfochips.com>
Subject: [kirkstone] [PATCH 1/2] sqlite3: CVE-ID correction for CVE-2023-7104
Date: Wed,  4 Sep 2024 12:04:09 +0530
Message-Id: <20240904063410.2206579-1-vrushti.dabhi@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Sep 2024 06:34:26.0673 (UTC) FILETIME=[7D01B610:01DAFE94]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 06:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204188

- The commit [https://sqlite.org/src/info/0e4e7a05c4204b47]
  ("Fix a buffer overread in the sessions extension that could occur when processing a corrupt changeset.")
  fixes CVE-2023-7104 instead of CVE-2022-46908.
- Hence, corrected the CVE-ID in CVE-2023-7104.patch.
- Reference: https://nvd.nist.gov/vuln/detail/CVE-2023-7104

Signed-off-by: Vrushti Dabhi <vrushti.dabhi@einfochips.com>
---
 meta/recipes-support/sqlite/files/CVE-2023-7104.patch | 10 ++++++----
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb         |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/sqlite/files/CVE-2023-7104.patch b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
index 25c6ba017c..5f3681070e 100644
--- a/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
+++ b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
@@ -1,18 +1,20 @@
-From 09f1652f36c5c4e8a6a640ce887f9ea0f48a7958 Mon Sep 17 00:00:00 2001
+From f388a0c44d2abdbd582686e511fef36c1b96ae43 Mon Sep 17 00:00:00 2001
 From: dan <Dan Kennedy>
 Date: Thu, 7 Sep 2023 13:53:09 +0000
 Subject: [PATCH] Fix a buffer overread in the sessions extension that could
  occur when processing a corrupt changeset.
 
 Upstream-Status: Backport [https://sqlite.org/src/info/0e4e7a05c4204b47]
-CVE: CVE-2022-46908
+CVE: CVE-2023-7104
+
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Vrushti Dabhi <vrushti.dabhi@einfochips.com>
 ---
  sqlite3.c | 18 +++++++++++-------
  1 file changed, 11 insertions(+), 7 deletions(-)
 
-diff --git a/ext/session/sqlite3session.c b/ext/session/sqlite3session.c
-index 9f862f2465..0491549231 100644
+diff --git a/sqlite3.c b/sqlite3.c
+index a16db27..0b979f7 100644
 --- a/sqlite3.c
 +++ b/sqlite3.c
 @@ -213482,15 +213482,19 @@ static int sessionReadRecord(
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index cece207eae..b3d5029365 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2022-46908.patch \
            file://CVE-2023-36191.patch \
            file://CVE-2023-7104.patch \
-"
+           "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
 # -19242 is only an issue in specific development branch commits
-- 
2.25.1


