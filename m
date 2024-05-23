Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA3AC25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 12:55:08 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.14606.1716468894448184292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 05:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=IzT2gHzr;
 spf=pass (domain: protonmail.com, ip: 185.70.43.16, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716468892; x=1716728092;
	bh=BXUXBeQte28p7YF7PgzoG1jY/vMQnrJZkIqfRmgusM4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IzT2gHzr5lkQegZHUKajAbZm9NwEMJ8N8pVdEK3sH3hjMaeLMgLblg8LrGKFxrcIX
	 t8tdNxOYGaM7ZCXYeZanVMzmc0ipubZxLEIytD+ela8Al0rmjDrYZUt8OZtRxcGtmy
	 9OsamZ0B3HUyHVxOkGdy24Nq4U0grirIPqInnPctdnToODPNsBFnjGMT4mzDezRua0
	 kuYkWI3MMewThs75kuinkTpJtjcJZW0JNa2ezxGkPsWrNNRuO/+Nl1kZfaMrfeat1w
	 V5prwan11Baex+b6YlbcqZnysbbOv9BUxN72hjv8hkovYepP612sAlsr5SJParKMHv
	 gZc3as+waC65Q==
Date: Thu, 23 May 2024 12:54:47 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk
Subject: [PATCH] insane.bbclass: use HOST_ARCH to check for 32-bit symbols
Message-ID: <20240523125441.45922-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
X-Pm-Message-ID: f9616b60dd1e9c416658e39694a3b20221eaa4ba
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 12:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199789

Using OVERRIDES in the check generates false positives in some
scenarios, for example when building binaries for an SDK supposed to run
on a 64-bit host. Therefore, it is more correct to use HOST_ARCH for the
check instead.

    $ bitbake -c do_package_qa gcc-cross-canadian-arm
    (...)
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'localtime=
'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'fcntl'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'lstat'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'wait4'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'gettimeof=
day'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'stat'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'fstat'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'ioctl'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'time'
    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/b=
in/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-bit api 'gmtime'
    Suppress with INSANE_SKIP =3D "32bit-time"

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 99736830b9a8..bd2328601676 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -515,8 +515,7 @@ def check_32bit_symbols(path, packagename, d, elf, mess=
ages):
     Check that ELF files do not use any 32 bit time APIs from glibc.
     """
     thirtytwo_bit_time_archs =3D {'arm','armeb','mipsarcho32','powerpc','x=
86'}
-    overrides =3D set(d.getVar('OVERRIDES').split(':'))
-    if not (thirtytwo_bit_time_archs & overrides):
+    if d.getVar('HOST_ARCH') not in thirtytwo_bit_time_archs:
         return
=20
     import re

base-commit: 50f78cb9de68cd4317f34321dfdb06d72ce5d3c6
--=20
2.45.1



