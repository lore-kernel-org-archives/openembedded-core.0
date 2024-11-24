Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12DDE668AB
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 12:39:39 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.66083.1732451978359100622
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 04:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GIqJqbZF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241124123935d4e6168adb3d456c28-mmnpd4@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241124123935d4e6168adb3d456c28
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 13:39:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fofM22kGgtNYhNCYn7Nf2TeWZ2K46hTx/mg40fC1oz0=;
 b=GIqJqbZF9WbeSwzjIN19RG/hjFOvE9RkTYvAbomuPNVFDKv7dR/tWhCR4aGBj6zozRh1vL
 p5h0+c8fk+TVtQmINTxDhziY27nAZWG+TaCarWoWMzN1LKAxaLI/spM5gNF/mWj4k7QY8Dvq
 SVu2sm+ftsMDE8fYm4KUzGcjdya4Te4NbifvzVqh+wkvs80IB5v8N3xQf2o6yxQ8MmUM3URM
 /lOXIXK9rb1teKUYR4flmpnzZfZJC1EG0EAVyemG8wWmKnKiVD5eLFP/yeMW2wlKIBWtB7iW
 jEMmYkKqeogb0/nzZq2XdIYoAw840DKVF21G0ERuSHmpy/OFbSrVQY2g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH v2] builder: set CVE_PRODUCT
Date: Sun, 24 Nov 2024 13:38:45 +0100
Message-Id: <20241124123845.19545-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 12:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207701

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: change vendor from yocto to yoctoproject

 meta/recipes-graphics/builder/builder_0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 52c9351f93..709a0b4608 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -28,4 +28,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-CVE_STATUS[CVE-2008-4178] = "cpe-incorrect: This CVE is for an unrelated builder"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yoctoproject:builder"
-- 
2.30.2


