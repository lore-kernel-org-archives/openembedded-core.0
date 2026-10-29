Received: from outbound6.mail.transip.nl (outbound6.mail.transip.nl [136.144.136.128])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17522.1793295052849942754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=VgJkp9Xh;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.128, mailfrom: jeroen@myspectrum.nl)
Received: from submission11.mail.transip.nl (unknown [10.103.8.162])
	by outbound6.mail.transip.nl (Postfix) with ESMTP id 4jFrqF4hWpzwLGwD
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 18:30:49 +0100 (CET)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission11.mail.transip.nl (Postfix) with ESMTPSA id 4jFrqC5kXkz3R3nyt;
	Thu, 29 Oct 2026 18:30:47 +0100 (CET)
Received: from yellow.myspectrum.nl (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 7B2D420072;
	Thu, 29 Oct 2026 17:30:45 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Thu, 29 Oct 2026 18:30:39 +0100
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [OE-core][PATCH] lrzsz: disable Werror (fix clang 23 build)
Date: Thu, 29 Oct 2026 18:30:17 +0100
Message-ID: <20261029173017.225745-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission11.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1793295047; h=from:subject:to:cc:date:
 mime-version; bh=RHEB/80zqAHzVEVc8jdbCBNlv88kZXKf922V6prbkXc=;
 b=VgJkp9XhCm8RVxBRqqRYxS+IEaWdO5m06n8jQxXzV8jkj5b7UC7U22vzMZSgzNQp8qNB55
 4MlZYGz1Xv+xgdT62rIFZlgosQxFR6yAvzK25cJkv3chTQaElhzpo5kPEs2IAkRnjoGG+y
 4vAQ9Bnm/VPsOkSTBS90y4SdDHhcN4sSyharyeqBqvfakUmJe0R33SLamIwDkKQ6CRaxmk
 kNR+LVrb+OdstjYMUo1Ig4RsiEp8287Zm6nvdQ/LEiUvaqcXxiXgXaxmWVKMeE9QPpl3g+
 gtkm2WQf4TFIwlGJrH+MzZVzNC/2O8PM9kBZCg9wS8tuS7EzhFy0UF1Xa6QZSw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248969
Content-Type: text/plain; charset="utf-8"

From: Jeroen Hofstee <jhofstee@victronenergy.com>

When compiling with clang, the build errors with:

src/zm.c:37:12: error: variable 'Crc32' set but not used [-Werror,-Wunuse=
d-but-set-global]

This is caused by -Werror being ebabled by default in combination with
some harmless unused globals. This is an alternative to [1] (which
removes the unused globals) by disabling Werror instead.

[1] https://lore.kernel.org/openembedded-core/20261028011006.1704070-1-kh=
em.raj@oss.qualcomm.com/

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb b/meta/recipes-bsp/lr=
zsz/lrzsz_0.13.1.bb
index 521cedf789..5b7005917b 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] =3D "112f91059fbd118e016d800c1a5c5a1=
702e965d8b9bfbda6015e44e20b
=20
 UPSTREAM_CHECK_URI =3D "http://ohse.de/uwe/software/lrzsz.html"
=20
+EXTRA_OECONF =3D "--disable-Werror"
+
 inherit autotools gettext
=20
 do_install() {
--=20
2.53.0

