Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91373C54EBC
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 20:30:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.29595.1673123399861311882
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jan 2023 12:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=f0KFzg8b;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 1C2D7FF805;
	Sat,  7 Jan 2023 20:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1673123397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RHp99D5WXnW6gH2bSfWXNuMF4LRdf9hFfMks+IuCVrs=;
	b=f0KFzg8bbXIDRwbG4wktK7xp0gRoansutdycNQiwffhi3JoOt8CzAuXJ0/jSaR9qKUk1r6
	bsUvQMbh7JODXMB8pNKvA6XPfqPQvFye4luuHvT2WqimdJOmzFWeVvnzpX7gXNrB0y96bi
	zafF/IkIM/VawWzqaMBSCdQhYTR/vAZQIGGa8UQ3cJmbgPSNSeZWaG1/qty2E1AdX+Rd3v
	oeN5T4TNRhcVbsh4DjJmmLCTPm0ISrG6fJ9oGKdkZKxA26CYcRbEpW+1MTqdYzGLXwt+pf
	W2EF7EoSrNeDZglkVEkSmOBAimObjyq+cbcTlJ7YRS4BFsA29QErJoarUl/73Q==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Gomez <daniel@qtec.com>,
	Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [kirkstone][PATCH] gtk-icon-cache: Fix GTKIC_CMD if-else condition
Date: Sat,  7 Jan 2023 12:29:28 -0800
Message-Id: <20230107202928.3036831-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 20:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175622

From: Daniel Gomez <daniel@qtec.com>

GTKIC_CMD variable gets the wrong assignation leading into a post
install script error. Fix if-else condition in GTKIC_CMD variable
to assign gtk4-update-icon-cache when GTKIC_VERSION is 4 but
gtk-update-icon-cache when is 3.

Also, rename gtk-update-icon-cache-3.0.0 to gtk-update-icon-cache-3.0
to match the gtk-update-icon-cache binary name deployed in
meta/recipes-gnome/gtk+/gtk+3.inc.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/classes/gtk-icon-cache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 6808339b90..f999b891f3 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -3,7 +3,7 @@ FILES:${PN} += "${datadir}/icons/hicolor"
 GTKIC_VERSION ??= '3'
 
 GTKPN = "${@ 'gtk4' if d.getVar('GTKIC_VERSION') == '4' else 'gtk+3' }"
-GTKIC_CMD = "${@ 'gtk-update-icon-cache-3.0.0' if d.getVar('GTKIC_VERSION') == '4' else 'gtk4-update-icon-cache' }"
+GTKIC_CMD = "${@ 'gtk4-update-icon-cache' if d.getVar('GTKIC_VERSION') == '4' else 'gtk-update-icon-cache-3.0' }"
 
 #gtk+3/gtk4 require GTK3DISTROFEATURES, DEPENDS on it make all the
 #recipes inherit this class require GTK3DISTROFEATURES
-- 
2.38.2


