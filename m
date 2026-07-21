Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9EDC44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 16:15:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26822.1784650521205886137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 09:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Fmzq07df;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C851152B
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:15:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4635A3F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784650520; bh=rzHMpjrfYyF8pdZq5nm0ivDRc8sQHbp1UD1B8L+3/vY=;
	h=From:To:Subject:Date:From;
	b=Fmzq07dfVVzhJ8HLU4+cSN7OeiJwuhqBnupjRm8XA20+THwy3sEJt+AS52rNZ5u7A
	 uenQauX9zeBF6uhI5QfS1NqgHrA96h3J87jGNpPEm/gjgnz2Fd6qVTivt0KauZKIDc
	 1B/4+Hz4+itOkqG+KoPBAYT298m37jLakUdlvFUg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Use native systemd-hwdb at rootfs time
Date: Tue, 21 Jul 2026 17:15:09 +0100
Message-ID: <20260721161511.2946619-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 16:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241554

Hi,

Originally based on work by Daniel Turull but rewritten quite a lot - bug=
s are
all mine - this builds on top of the systemd patches I sent a few days ag=
o to
build a native systemd-hwdb and then use that at rootfs time, instead of =
running
the target systemd-hwdb binary inside a qemu.

This needs pseudo master to work, so only works when pseudo has been upgr=
aded.

Ross

Ross Burton (2):
  systemd-tools-native: add systemd-hwdb
  systemd: no need to use qemu for hwdb update

 .../systemd/systemd-tools-native_259.5.bb     | 27 +++++++++----
 ...oot-from-filenames-when-generating-h.patch | 40 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.5.bb    |  6 +--
 scripts/postinst-intercepts/update_udev_hwdb  | 18 ++++-----
 4 files changed, 71 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-hwdb-strip-the=
-root-from-filenames-when-generating-h.patch

--=20
2.43.0


