Return-Path: <esa.jaaskela@suomi24.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EE2C53200
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 19:25:00 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16042.1785093894322166229
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 12:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: illegal base64 data at input byte 231" header.i=@suomi24.fi header.s=MBO0001 header.b=Uvas8rnS;
 spf=pass (domain: suomi24.fi, ip: 80.241.56.152, mailfrom: esa.jaaskela@suomi24.fi)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h7Wrf3t5YzKq5v;
	Sun, 26 Jul 2026 21:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suomi24.fi; s=MBO0001;
	t=1785093890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5N3GXGJ0d4DDWQxJBcUYt08MLlFTM9KSuF2Rr6th/tA=;
	b=Uvas8rnSHqf+qVWm24PTcZmzT2BkhsDyO9B+nHdX5ROsYkutwQi3Mzr4dpOfN64xlfnP7s
	PxRA8H37JZCA05BC7eLM0AewyLk/TWCdOYCwMc3mfiippfUvmnKjYGymRWE8PSct/uasCR
	IoA1cUgW/xwLOZMldSvJoPjQAqtZPklJ/2eKnwqmg2/4AKUQmAlBPPbnsRcXgofE+TG2q9
	SRQ9uGAcD7iafo+LKs2x7uk9VRXBY0DuoC8lDR7WD3ht89+64guF5fcxb5ZrIl8lbDcpoA
	U5XHAH0mpR2rg0sZjMKWnHRNEpcwmT65PuIRF8oPKyer2gjVj13PTz2KW+uyBg==
From: Esa Jaaskela <esa.jaaskela@suomi24.fi>
To: openembedded-core@lists.openembedded.org
Cc: Esa Jaaskela <esa.jaaskela@suomi24.fi>
Subject: [PATCH] volatile-binds: order systemd-timesyncd after /var/lib
Date: Sun, 26 Jul 2026 22:24:41 +0300
Message-ID: <20260726192441.3129628-1-esa.jaaskela@suomi24.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 19:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242018

systemd-timesyncd stores its clock file under /var/lib/systemd/timesync,
so it can fail to save state if it starts before the volatile /var/lib
is mounted. Add it to the Before=3D and WantedBy=3D entries already used =
for
systemd-random-seed.service.

Signed-off-by: Esa Jaaskela <esa.jaaskela@suomi24.fi>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/re=
cipes-core/volatile-binds/volatile-binds.bb
index 857bcc93ff..613e750c17 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -57,10 +57,11 @@ ${@d.getVar('VOLATILE_BINDS').replace("\\n", "\n")}
 END
=20
     if [ -e "$var_lib_servicefile" ]; then
-        # As the seed is stored under /var/lib, ensure that this service=
 runs
-        # after the volatile /var/lib is mounted.
-        sed -i -e "/^Before=3D/s/\$/ systemd-random-seed.service/" \
-               -e "/^WantedBy=3D/s/\$/ systemd-random-seed.service/" \
+        # The random seed and the timesyncd clock file are stored under
+        # /var/lib, so ensure that those services run after the volatile
+        # /var/lib is mounted.
+        sed -i -e "/^Before=3D/s/\$/ systemd-random-seed.service systemd=
-timesyncd.service/" \
+               -e "/^WantedBy=3D/s/\$/ systemd-random-seed.service syste=
md-timesyncd.service/" \
                "$var_lib_servicefile"
     fi
 }
--=20
2.47.3


