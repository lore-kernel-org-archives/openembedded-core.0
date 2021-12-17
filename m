Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6390FC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:16:29 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.1342.1639707387944769855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QcUg2Por;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639707388;
  x=1671243388;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HyY0WnKCmuXljEIV2vEJKWvvlk+dzzig8GqlYVH8QW4=;
  b=QcUg2PorCBtxMC3ph5bls9t4RV7FYHF+CExTXKjDdUU/K7H3lDiIur7v
   cM37JNYC+ZeNTttXJzCdy8O+DmnwO+PN1rRjv6DoGwmnrt35MOSJa/RV4
   7uNpNFUs3MrOpFQgDtUUNSaZwgklyD55uquHqYvmgBXLA3Eb39Amh/y3k
   bQIc7ojrHQktgOp6ITOVoP68WRqoizAWPZlLcH0bwX0yIqHDMeOnGZXTe
   JoetnaiqFq8QX7Eljyj6zomYPA3NzJTp8RzSpxoEE0IbuKs+LsVIqv+8N
   Abhc8wHblqEYdVHyn3zq+iA91zknwekvw6PhwMSwPT6orGfj7gVXgdHn6
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/3] tzdata: Make it compatible with devtool modify
Date: Fri, 17 Dec 2021 03:16:16 +0100
Message-ID: <20211217021618.30887-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 02:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159814

This avoids the following build error after having run `devtool modify
tzdata`:

  cp: cannot stat '.../qemux86-64/workspace/sources/tzdata//usr': No
  such file or directory

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

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

