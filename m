Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA92C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:04:19 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.5494.1716368649689995033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=PJ2+Bg+k;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=ndW8oiTaH6xGztp6eh1yJsQVKAmjC8XJsjTQy64g6Wo=; b=PJ2+Bg+kwhBznFHJ79cm0xp1H5
	8e7atHcM6/yPh3bnTNu3R3kl0KHX/70idlsBLwykVqqbIPWBGFYaHSz8XLEw7FXS/yyDxOfp3a+4z
	rdQ3vPumSqu6FO7akQBFHqQ4ENKuSiYwIko5AwkQZyTYbCf/D9AXavvs+zO1jHzUKpHfH9N1ichCQ
	St/eUBMhsP+SwOtG6Bb9OVsaxouCpz3QBNYwNKfkLOmfPK7BzJYTz+0zEAe2C0wuOTzIT+H8KIKoD
	w/zm7S3y1JmeNrSpY1Udlsap0EcysMKCtueC///eQC5MkmYRvExOtJ9e6cdueRNP0kwfqiI68yWhH
	24AbK0uQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s9htH-000MfB-3C; Wed, 22 May 2024 11:04:07 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s9htG-0007QK-2K;
	Wed, 22 May 2024 11:04:06 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 1/2] ell: upgrade 0.64 -> 0.65
Date: Wed, 22 May 2024 11:03:49 +0200
Message-ID: <20240522090350.2513076-1-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27283/Wed May 22 10:29:37 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199692

Remove do_configure:prepend() that creates build-aux, as that isn't
needed.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/recipes-core/ell/{ell_0.64.bb => ell_0.65.bb} | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta/recipes-core/ell/{ell_0.64.bb => ell_0.65.bb} (82%)

diff --git a/meta/recipes-core/ell/ell_0.64.bb b/meta/recipes-core/ell/ell_0.65.bb
similarity index 82%
rename from meta/recipes-core/ell/ell_0.64.bb
rename to meta/recipes-core/ell/ell_0.65.bb
index c4f16905fd..9b559caf8a 100644
--- a/meta/recipes-core/ell/ell_0.64.bb
+++ b/meta/recipes-core/ell/ell_0.65.bb
@@ -15,8 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "760f3901078409f66cadf1bb24c8bdc60f13d53f6dd66b88631221d2494f8405"
-
-do_configure:prepend () {
-    mkdir -p ${S}/build-aux
-}
+SRC_URI[sha256sum] = "9ee7ac57b188d391cead705d3596a6d3240341786475149db297782a52269aa5"
-- 
2.44.0


