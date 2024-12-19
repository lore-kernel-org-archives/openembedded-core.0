Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0675E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 11:17:42 +0000 (UTC)
Received: from smtp-out.freemail.hu (smtp-out.freemail.hu [46.107.16.225])
 by mx.groups.io with SMTP id smtpd.web10.127086.1734607051752261266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 03:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@freemail.hu header.s=20181004 header.b=zmfZNqw1;
 spf=pass (domain: freemail.hu, ip: 46.107.16.225, mailfrom: egyszeregy@freemail.hu)
Received: from localhost.localdomain (catv-178-48-208-49.catv.fixed.vodafone.hu [178.48.208.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4YDSgr3vTqzJTB;
	Thu, 19 Dec 2024 12:17:28 +0100 (CET)
From: egyszeregy@freemail.hu
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH] systemd: Add WATCHDOG_RUNTIME_SEC optional variable
Date: Thu, 19 Dec 2024 12:16:15 +0100
Message-ID: <20241219111615.601-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.47.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1734607049;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 11:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208905

	s=20181004; d=freemail.hu;

	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;

	l=1751; bh=SOtVjpovb8GEQjj/6PhL652jcamo2arPKAPsCBAMAC4=;

	b=zmfZNqw1S+s5YL85QDtiX5EGp84S7r1i8qrxR6Ehp3UIZzqiicCTn4k6qBs8A/fh

	0AUTtZZWyFcBvE9P9NU636rQpR/PQ36AlqughUhps3uc4VtBlrSLS2OohIBGCptREdc

	it9VhTWZgOc3xbKZDb0LEmdwRSzP4wVn9IVvY1GDX1YA0MUvXFeLnVSzybvqLygbTMB

	RhHRAVakbL8+xakvUC+5+bbaZ0Ewn/qx9YIpZ2wUqhxnHDB1Z5pD1UqR77jSybUPNLs

	l9srkJar4ywaEJiMDTzIRAHCXV16F+kyrvQowG+lEWNDt1xhCRY5XY/Dcj/jHt4sDUO

	jyWyaMXngw==
Content-Transfer-Encoding: quoted-printable

From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>

To make use of the hardware watchdog it is sufficient to set
the RuntimeWatchdogSec=3D option in /etc/systemd/system.conf.
It defaults to 0 (i.e. no hardware watchdog use). Set it to
a value like 20s and the watchdog is enabled.

ref: https://0pointer.de/blog/projects/watchdog.html
Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
---
 meta/recipes-core/systemd/systemd_256.9.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_256.9.bb b/meta/recipes-co=
re/systemd/systemd_256.9.bb
index a9224915c6..84888b88f1 100644
--- a/meta/recipes-core/systemd/systemd_256.9.bb
+++ b/meta/recipes-core/systemd/systemd_256.9.bb
@@ -266,6 +266,11 @@ EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kexec =
\
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??=3D "60"
=20
+# To make use of the hardware watchdog it is sufficient to set WATCHDOG_=
RUNTIME_SEC
+# (RuntimeWatchdogSec=3D option in /etc/systemd/system.conf) to a value =
like 20s
+# and the watchdog is enabled. (defaults is no hardware watchdog use)
+WATCHDOG_RUNTIME_SEC ??=3D ""
+
 do_install() {
 	meson_do_install
=20
@@ -383,6 +388,11 @@ do_install() {
 			${D}/${sysconfdir}/systemd/system.conf
 	fi
=20
+	if [ -n "${WATCHDOG_RUNTIME_SEC}" ]; then
+		sed -i -e 's/#RuntimeWatchdogSec=3Doff/RuntimeWatchdogSec=3D${WATCHDOG=
_RUNTIME_SEC}/' \
+			${D}/${sysconfdir}/systemd/system.conf
+	fi
+
 	if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', =
d)}; then
 		if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_libdir}/systemd/netwo=
rk/99-default.link; then
 			sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${nonarch_libdir}/systemd/netw=
ork/99-default.link
--=20
2.47.1.windows.1


