Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F9DE82CDB
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 21:07:15 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.157.1695848833127224824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 14:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gbOU/iXK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2023092721071056bb25fad56143db6d-n_b3rq@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2023092721071056bb25fad56143db6d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 27 Sep 2023 23:07:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eerYddPLeF4x9ulNXm6WT0Baf5Hp8JMlPQSXb4sY27g=;
 b=gbOU/iXKqHfEJyipVBWKl0glKGCesLY8lP0UKCOa0R85JZYOwkm1ResxTiBMgyydCoYUJE
 S6hrJfISsyi+Lq4BMZqSfLHnT5Ar95VEWGu+h8d13rKB4PYAVyek0yOC0Qw2dTRC4kiXc074
 09JweE8nHmeWMaaIDnEjuT8ARNIf4=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] json-c: define CVE_VERSION
Date: Wed, 27 Sep 2023 23:06:32 +0200
Message-Id: <20230927210632.15296-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 21:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188344

From: Peter Marko <peter.marko@siemens.com>

Recently NVD updated all CVEs for json-c and old fixed
cves are reported in some older yocto branches.
NVD match clause now includes full tag name including
date which is "greater" than tag without additional numbers.

Define CVE_VERSION identical to full tag also on master to
avoid future CVEs to be reported incorrectly.
Put it close to hash so recipe update patch includes this line.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/json-c/json-c_0.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
index b7b596212f..f4b7a32cea 100644
--- a/meta/recipes-devtools/json-c/json-c_0.17.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
@@ -9,6 +9,9 @@ SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6"
 
+# NVD uses full tag name including date
+CVE_VERSION = "0.17-20230812"
+
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
-- 
2.30.2


