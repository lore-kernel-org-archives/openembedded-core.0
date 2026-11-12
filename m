Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8467.1794467843963348118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=iUuvs+1/;
 spf=pass (domain: geanix.com, ip: 109.224.244.119, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794467841; x=1794727041;
	bh=AQSN2Kdx8yze62ZZLPonUAvMCjgnen3tyCQu5OLExDA=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iUuvs+1/ABnUL6vRk39V2NqZWNyUQ2xIGQKmt2rm/8JpR8xkjyQGAYQeqg5vFIwKh
	 Otq9xlmbu9XTL/MHbJgL3IENb9TAsMD7QJduZ4NYMJ1EqISdZZlOy54HIkaKDl24cq
	 stbaGShnvaXpukD5GWFKRbVYWIYchJug8TRbD50nzwLon4BRZ57c3JC36AOjvbZNKy
	 eKl+zHPR7Ze1IaF12Xo5VJE2llBImn2RpHTiesDjLPFaawCN1XZIdIE3PRBsjlnTRU
	 JjeQnigyX/ISZU52Epzj37fKtQjS5orvIEbbqlWPu+muqw6SyCveeVZ3sMGHj4i0Wp
	 itHL07A5dXF4g==
Date: Thu, 12 Nov 2026 07:17:16 +0000
To: openembedded-core@lists.openembedded.org
From: Sean Nyekjaer <sean@geanix.com>
Subject: INCOMPATIBLE_LICENSE
Message-ID: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 39153b5f4d9cfb5be484a590bff04fad79bd58b0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 07:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250075

Hi,

Our customer forbids GPLv3 on the device:

  INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*"

(I originally had INCOMPATIBLE_LICENSE:class-target, expecting it to
keep the restriction away from native/SDK tooling, but it makes no
difference, see below.)

Images build fine, but do_populate_sdk on the same image fails:

  ERROR: os-rootfs-1.0-r0 do_populate_sdk: Some packages cannot be
  installed into the image because they have incompatible licenses:
          binutils-cross-canadian-aarch64 (GPL-3.0-only)
          gcc-cross-canadian-aarch64 (GPL-3.0-only)
          gdb-cross-canadian-aarch64 (GPL-3.0-only LGPL-3.0-only)
          nativesdk-autoconf (GPL-3.0-or-later)
          nativesdk-bison (GPL-3.0-only)
          nativesdk-m4 (GPL-3.0-only)
          nativesdk-readline (GPL-3.0-or-later)
          ... (15 packages in total)

The only supported workaround I found is to list every host package
in INCOMPATIBLE_LICENSE_EXCEPTIONS:

  INCOMPATIBLE_LICENSE_EXCEPTIONS +=3D " \
      gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
      gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
      gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}:LGPL-3.0-only \
      nativesdk-m4:GPL-3.0-only \
      ...
  "
  ERROR_QA:remove =3D "license-exception"
  WARN_QA:append =3D " license-exception"

This works but is there a smarter solution?

/Sean


