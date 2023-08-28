Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396E1C83F18
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 12:48:59 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.12526.1693226928445806681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 05:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=N0H8+qAQ;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gS71PDMljRsaLXsXf+5y7YCOtc9jQJJnpMPaMlCx5os=; b=N0H8+qAQtL5L2ICs8eQVCJBaQT
	wLB7MzzRCg3zTHE/0sKTj7m8SSwPmg+VhBNHzeV9qxFrbQ/3EZ+b1UQNi2H+HQA8/TPQ4DFOKil2t
	jqeUFO8SNG9QdePJH/hEO708yGUvMbnu3DbbojY1Ra+E+HXcEZlgLs2NB68YYhDIXznAdMs97HZ5i
	740CMrE6sQKuV/r7iENxV6mp+gy02ZYmo9JHlTAMuI18HOrWDkJVD9okb2C8S40j/8CWuxLkgJ5FL
	tt5Wi4NlltFRGqUoatq3V2PDiU2kGAJBQw/QMDya1oknrz07CPTHVREpsjFkU6CwrQdjSYou8ns+S
	Y6hMCaPQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1qabfi-0009GS-Gs; Mon, 28 Aug 2023 14:48:46 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1qabfi-000BNd-3Q; Mon, 28 Aug 2023 14:48:46 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [RFC PATCH 3/5] ninja: build modified version with GNU Make jobserver support
Date: Mon, 28 Aug 2023 14:48:27 +0200
Message-ID: <20230828124834.376779-3-martin@geanix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828124834.376779-1-martin@geanix.com>
References: <20230828124834.376779-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27014/Mon Aug 28 09:38:26 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 12:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186825

Ninja doesn't (yet) support the GNU Make jobserver out of the box, but
there is a pull request adding that support[1]. Switch the SRC_URI and
SRCREV to point at the source of that pull request, to make ninja play
nicely together with the recently added jobserver class.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 .../ninja/{ninja_1.11.1.bb => ninja_1.12.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ninja/{ninja_1.11.1.bb => ninja_1.12.0.bb} (84%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
similarity index 84%
rename from meta/recipes-devtools/ninja/ninja_1.11.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.12.0.bb
index 8e297ec4d4..9abdd40a92 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
+SRCREV = "c9e21dbbc4c746ba397c0f9bec5f65c99f783c08"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
+SRC_URI = "git://github.com/stefanb2/ninja.git;branch=topic-issue-1139-part-3-jobserver-fifo;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.41.0


