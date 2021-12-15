Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC504C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:26 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.41583.1639581647592616080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 07:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=c9a6j8mb;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639581648;
  x=1671117648;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jvi/T2Z/Ve97fjFnkQUJ8iQyLXuXNmhnQrE5qlNUOlM=;
  b=c9a6j8mbNRfHYtoNEIIAFqoKWETbfTL8SWwRzWhje/SzZ7DHJ2TNZYQG
   HXACsCIvGYXyaZvw4Hg+1NvSeFsI+vbJdGPEJn9hwyto+ndPCYtmby5iM
   x2w5MJoi41wxW75fcibstyR3HSdZs0zJQL9ccsQYLjAfWCumgyc+TuT5X
   goeRhhOYZGGC9KHbKV/fSFs4QTXZDohSsOwEf432/crAC18Z4QuwQMjxN
   CffWyuZmJoeayRNei1GMZ4B1gtXryJvzmzu40d3vRieevpRX/On7lOFdA
   /Bb9lLk7oKXg9EETgDyGdofmcUL3e7NABSLrQtxc60g2ppqi2IvNJr9gv
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] tzdata: Make it compatible with devtool modify
Date: Wed, 15 Dec 2021 16:20:39 +0100
Message-ID: <20211215152041.21726-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159728

This avoids the following build error after having run `devtool modify
tzdata`:

  cp: cannot stat '.../qemux86-64/workspace/sources/tzdata//usr': No
  such file or directory

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index c2b019922a..09cb14a855 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -35,8 +35,8 @@ do_compile () {
 }
 
 do_install () {
-        install -d ${D}/$exec_prefix ${D}${datadir}/zoneinfo
-        cp -pPR ${S}/$exec_prefix ${D}/
+        install -d ${D}$exec_prefix ${D}${datadir}/zoneinfo
+        cp -pPR ${WORKDIR}$exec_prefix ${D}${base_prefix}
         # libc is removing zoneinfo files from package
         cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
         cp -pP "${S}/zone1970.tab" ${D}${datadir}/zoneinfo

