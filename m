Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FA4CA600B
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 12:09:37 +0000 (UTC)
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14162.1791461374901898652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 05:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=Ven1bFJQ;
 spf=pass (domain: geanix.com, ip: 79.135.106.112, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1791461372; x=1791720572;
	bh=cn6TGiB8kbQb0eOMo8I8ebUeX4QlqEM5wBWURXLcye4=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ven1bFJQ4pzMVbkCAUqX59gPyuc4KcrsraLOcPOKx7vMDslC+3PdDBSt/OooNPjpD
	 oDjYW8hknw6DiJ5Df7MFIWNjQFrw40wOQvaGXU3we/Xgn+tfSy4/nKXhfu+02lvD4+
	 Oydo/SIeWt0nU5n3EmsL4yYrxOfx3CBRYxdMq4F8drR7ScotZplSFXutnvDuGKIK58
	 dTIjiedFMuNr4qFMrbwPQF6DvpK6Xdk2jy3HHw+vhb9mjPsVZm616SP+ZfoCpgjPnw
	 NriW3239BuyDFAU2tf9TIuwVNdnq+QIf55CMB8OHVFaG/ScHCDXFIoUwSXGVyLMsdA
	 H5MKS7jlbbdZw==
X-Pm-Submission-Id: 4j0phB1CCBz1DF72
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH] systemd: merge group members from /etc/group and nss-systemd
Date: Thu,  8 Oct 2026 14:09:26 +0200
Message-ID: <20261008120926.541493-1-martin@geanix.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 12:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247429

When systemd is configured with userdb and nss integration, it provides
group memberships in **addition** to those recorded in /etc/group. For
those additional memberships to be considered by nss, the group database
must be configured to merge the result from both /etc/group and the
systemd nss plugin.

Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
---
 meta/recipes-core/systemd/systemd_261.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-co=
re/systemd/systemd_261.3.bb
index 0901736e7c9e..7506b6a1368d 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -897,7 +897,7 @@ pkg_postinst:${PN}:libc-glibc () {
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; t=
hen
 		sed -e 's#\(^passwd:.*\)#\1 systemd#' \
-			-e 's#\(^group:.*\)#\1 systemd#' \
+			-e 's#\(^group:.*\)#\1 [SUCCESS=3Dmerge] systemd#' \
 			-e 's#\(^shadow:.*\)#\1 systemd#' \
 			-i $D${sysconfdir}/nsswitch.conf
 	fi
--=20
2.55.0


