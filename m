Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 568297DD9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 10:10:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f204so1660698wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4saRLX/VTEp+Eg4QWijwApZerfhZ1Qh3S0IuhW9DXYI=;
	b=zwNLPg+ZJZwqdihsmiNzcvWT9LbEKKYfHZY9zcNQMki2Kfw/5e8vvYB7vrVfJ9Q93H
	vAKNaVhdN+fWwE12ynMQLvct+jez6ddpm7Mq9p8TYeCl/PWCRY4dbicGN6BvFqLJPXPT
	0bHfkynbClgOA5eJ4KCof/pUP7sXGDtBpkStc4Fv1g4XsS55h0z7HgYDU8DcZ3nsmBu5
	J2VGC21pNTErQxKz01Cs/0hlsd7Qi1LunZyZSLCYnB7dFVd/covUuwiiZw2VnD62EgHJ
	/wWFkcGA03wR4L0gQXBuy2QKPAGI1exQMaLpAJrBitkWpSuapzgkVhNnAZyZ2KRvyp4z
	5kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4saRLX/VTEp+Eg4QWijwApZerfhZ1Qh3S0IuhW9DXYI=;
	b=idmESUGczzncgdm8Z4+nGRt5XkGyAp3ggA5prdQWpjtV3ORN46YvZ1VIq+o5Cy+I+F
	g7z6zFoXkLlGVPiHPWURmom5/m1p9lzf8inHR4Ame0AYiyCwdZbtX+F9z3Ilyx9QDYfA
	5x7LXtZUxHRYetJDtEUMjV1wer4MLJZLSczgmJiiWekZigSQlHPasoQw4EdHwBqPeRLd
	2PlI7rjavtj/00aVb9wZ0Xc51IIzhBWCZznrpdOS4+dbnD6aaXqCwuIIoOInxiKck6hi
	A1Uo8B2venjymzsG3qbCeD+YAUdhJTgHNn5vjO9w5d6J0IhbV+nJ4DIB9lFI1smxnti6
	ff+g==
X-Gm-Message-State: APjAAAUORFpcT3btlmOtRyK3WqK4xU/xJYfpQ0e02qaSsP8QaPh0y+3g
	/esArjdEm+MrAuYFH+/x0lcWIQ1IUvUdOg==
X-Google-Smtp-Source: APXvYqzavyZkpjjhhDvp6jK/bKa0ihyjFkp+938qL+Pc3DZ1Wju7CXDiuYIg2kcBy52vgpBWb8Ua2A==
X-Received: by 2002:a7b:c057:: with SMTP id u23mr22167163wmc.29.1559729402635; 
	Wed, 05 Jun 2019 03:10:02 -0700 (PDT)
Received: from localhost.localdomain.it
	(host57-224-static.7-79-b.business.telecomitalia.it. [79.7.224.57])
	by smtp.gmail.com with ESMTPSA id h1sm2284108wrt.20.2019.06.05.03.10.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jun 2019 03:10:02 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 12:09:48 +0200
Message-Id: <20190605100948.21810-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.17.2
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] bluez5: fix obex packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jun 2019 10:10:02 -0000

Ship some obex files in the appropriate obex package. This fixes boot
error:
[FAILED] Failed to start Bluetooth OBEX service.
that was caused by the obex.service being shipped in the main package,
rather than the -obex (that includes obexd).

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 93d1b4d8b0..a4c2f3a816 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -119,7 +119,10 @@ FILES_${PN}-dev += " \
 
 FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
                     ${exec_prefix}/lib/systemd/user/obex.service \
+                    ${systemd_system_unitdir}/obex.service \
+                    ${sysconfdir}/systemd/system/multi-user.target.wants/obex.service \
                     ${datadir}/dbus-1/services/org.bluez.obex.service \
+                    ${sysconfdir}/dbus-1/system.d/obexd.conf \
                    "
 SYSTEMD_SERVICE_${PN}-obex = "obex.service"
 
-- 
2.17.2


