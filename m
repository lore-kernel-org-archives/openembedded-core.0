Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F30C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 08:05:14 +0000 (UTC)
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
 by mx.groups.io with SMTP id smtpd.web11.1946.1750233905691940433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 01:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=kWk7UZYV;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=kWk7UZYV;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.162, mailfrom: andrej.v@skyrain.eu)
Received: from localhost.localdomain ([178.143.45.236])
	by cmgsmtp with ESMTPSA
	id Rnmju6G0owQNXRnn4uVZ3o; Wed, 18 Jun 2025 10:05:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750233903; bh=Uw/v87GTyCB7vhNhlSui2uTSxIKXOzzoIYS+/EM/4Yo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=kWk7UZYV/6T13yyM1d/J9RGdxebFK4jnwXueg2ZLHGsM9FomYWvJdXWza1g7lTAFP
	 jlRzi3pfWFKVERavcqaa83AqIRVUtYLfes/Wy2dhavI0hftNfXBLcRKrGtyLabkrJG
	 gAPElnN6vM2XVLld4ktKfLL/MVHoaPJ371/Q6uu7o1SRVPt6sBRpHs6CSOzo4R+SOE
	 9sa3ALk0m+O6Dp8cJ15/Ek9Ri9nvtgIZ+nn1QoxXmNXASa9Y578QA9mdvMd6zUQd79
	 j1cZxkeHRgDlZrNFOvoBiF0GHyCmwcv4UxHWQEsDBj6rPYrbVTkEvRn5hyFBZ+rD63
	 oAHuvZZBgatnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750233903; bh=Uw/v87GTyCB7vhNhlSui2uTSxIKXOzzoIYS+/EM/4Yo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=kWk7UZYV/6T13yyM1d/J9RGdxebFK4jnwXueg2ZLHGsM9FomYWvJdXWza1g7lTAFP
	 jlRzi3pfWFKVERavcqaa83AqIRVUtYLfes/Wy2dhavI0hftNfXBLcRKrGtyLabkrJG
	 gAPElnN6vM2XVLld4ktKfLL/MVHoaPJ371/Q6uu7o1SRVPt6sBRpHs6CSOzo4R+SOE
	 9sa3ALk0m+O6Dp8cJ15/Ek9Ri9nvtgIZ+nn1QoxXmNXASa9Y578QA9mdvMd6zUQd79
	 j1cZxkeHRgDlZrNFOvoBiF0GHyCmwcv4UxHWQEsDBj6rPYrbVTkEvRn5hyFBZ+rD63
	 oAHuvZZBgatnQ==
From: Andrej Valek <andrej.v@skyrain.eu>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [oe][meta-oe][PATCH v3] dropbear: add xauth runtime recommends dependency on x11 DISTRO_FEATURE
Date: Wed, 18 Jun 2025 10:04:39 +0200
Message-Id: <20250618080439.274019-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605091828.50442-1-andrej.v@skyrain.eu>
References: <20250605091828.50442-1-andrej.v@skyrain.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIFaaJYYDnB6XmGc9YdI88d8JlJDa90ClPNXdyXRFazZVM3sT32khm+j2nHpT+o1wWCWW0affW1F1dDnAMKN0/c2DMH8pLFs0EvJCDjZe/9uVGBoYjLL
 5h4yZZ76B/RSPuvGfOCsbX0KI+6JWqlxpvylK6vCBdQ6EmIKrg3wFAit7n0O3qOIVaZ8r2Sb3/z/8qyn8zZN4NE3cLok5kDpvKC1zsIzNDpAv4oPTlkn38gk
 IVla0HXJ3J46zmkrgAjKAL5jckbOeA6UvCTyaTpvCE9jby1u7/fhYEzGjVEK0MJZ
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 08:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218979

Change enable-x11-forwarding PACKAGECONFIG to x11, while we can rely
directly on X11 DISTRO_FEATURE. Previously when enable-x11-forwarding was
used, the XAUTH_COMMAND failed due to missing xauth. So add xauth to
runtime recommends dependency and enable this behavior as default.

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
---
 meta/recipes-core/dropbear/dropbear_2025.88.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2025.88.bb b/meta/recipes-core/dropbear/dropbear_2025.88.bb
index f203763b17..72a886d907 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.88.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
@@ -48,10 +48,10 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
-PACKAGECONFIG[enable-x11-forwarding] = ""
+PACKAGECONFIG[x11] = ",,,,xauth"
 
 # This option appends to CFLAGS and LDFLAGS from OE
 # This is causing [textrel] QA warning
@@ -62,7 +62,7 @@ EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 
 do_configure:append() {
 	echo "/* Dropbear features */" > ${B}/localoptions.h
-	if ${@bb.utils.contains('PACKAGECONFIG', 'enable-x11-forwarding', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'true', 'false', d)}; then
 		echo "#define DROPBEAR_X11FWD 1" >> ${B}/localoptions.h
 	fi
 }
-- 
2.34.1


