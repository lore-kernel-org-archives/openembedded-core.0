Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37863CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:16:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8562.1790756210224820762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=r3M66sUJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7EF381A1081
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D6AB60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C75D103298B0;
	Wed, 30 Sep 2026 10:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zcdJB2KguwSFQOScfVSpdhW0Jr8rsUfEFiVeQvKdVqU=;
	b=r3M66sUJ4Qhf3tnKWkvvo7k3Lnv83h0WUMkz7xTm8gPqC1MdNfIE6ofL0HN3FIFg8yoUZ3
	BMfAU/n/F1kIk3LsAQUJB8t2NTOxCQRMKYDL2lyepCm2yw/SNVx2Uf2gvZsSa6OkDuiVU8
	UxqlNgy8Qkro+4MTChw2XkceYc1Oo9ZfW5juMCkLw11cUAdXmj9tpZBV+ViDZqs2K8SyOW
	tH3Q0woKqSQE+a7Pm62qIpopG0JkFTxzKa9+3/DNxiO2YaGh2EnwH+xUf6e6JqOQDUT4mA
	zkOYrxS97Kl38qzNdieZUZxV1QfC2Yd/1M/wFsRlVf2rlwA1M2P8Zx88uGtrEQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:29 +0200
Subject: [PATCH 04/24] python3-wcwidth: upgrade 0.8.3 -> 0.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-4-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=2879;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=qCfvvquB8ZNjvZmSIo9E95aYXH1RO8P09552Jp5WTa0=;
 b=IXnDfiM7MiPJSsSpV+KL7/IvaK7GyJdmoLXWajGsFqJNKsM6EVqacWMSiEDDWhH36TKrO5djM
 frNew+XmrqkB5pgqFvGnygYlrod1eKcUrFPfVkYPm4rXg1/vOWARai4
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246928

Changelog:

0.9.1 2026-09-23
- Bugfix width() in Python and libwcwidth mis-measured CSI sequences
  over 64 bytes, a 0.9.0 release regression!
- Performance improvement of ~15% for many Python API functions when
  using default arguments like ambiguous_width and term_program.

0.9.0 2026-09-23
- New Optional CPython extension using libwcwidth, improving performance
  10-58x.
- Drop Support for Python 3.8.

0.8.5 2026-09-23
- Bugfix CJK hyphen break positions for wrap().

0.8.4 2026-09-17
- Bugfix clip() hangs with OSC 8 hyperlinks in some conditions.
- Bugfix width of ITU T.416 colon-format SGR color parameters.
- Bugfix width of OSC 66 text sizing sequences without a text field.
- Bugfix width(), ljust(), rjust(), center(), clip() and
  strip_sequences() treated ESC ( LF as text instead of a character set
  designation (rare).
- Bugfix clip() painter's algorithm and "tab expansion" should be
  spaces.
- Changed iter_graphemes() clustering rule GB9c for Unicode 18.0.
- Changed ambiguous_width arguments are now clamped to allowed range (1,
  2).
- Changed wrap() now raises ValueError for a width of zero or less,
  matching stdlib textwrap. Previously wrap('=E5=A5=B3', 0) returned ['=E5=
=A5=B3'].
- Changed clip() arguments start=3D0 and end=3D-1 become optional.
- Updated tables for Unicode version 18.0.
- Updated ucs-detect data files used in some automatic tests are no
  longer distributed.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-wcwidth_0.8.4.bb =3D> python3-wcwidth_0.9.1.bb} | 8 =
++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.8.4.bb b/meta=
/recipes-devtools/python/python3-wcwidth_0.9.1.bb
similarity index 55%
rename from meta/recipes-devtools/python/python3-wcwidth_0.8.4.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
index 8ac99afc3ec0..e7156a79eefb 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.8.4.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
@@ -4,12 +4,16 @@ HOMEPAGE =3D "https://github.com/jquast/wcwidth"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db15979c39a2543892fca8cd86b4b5=
2cb"
=20
-SRC_URI[sha256sum] =3D "2dae09efa25253ae2874188e86d6861af3b1652aef4118cd=
f3f0bda288a957fb"
+SRC_URI[sha256sum] =3D "5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8=
459f27031bef0af5"
=20
 inherit pypi python_hatchling ptest-python-pytest
=20
 do_install_ptest:append() {
-      cp ${S}/pyproject.toml ${D}${PTEST_PATH}/
+      cp ${S}/pyproject.toml ${S}/setup.py ${D}${PTEST_PATH}/
+      cp -r ${S}/libwcwidth ${D}${PTEST_PATH}/libwcwidth
+
+      # Remove pre-release tests, require authentication with github
+      rm ${D}${PTEST_PATH}/tests/test_check_release.py
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"

--=20
2.47.3


