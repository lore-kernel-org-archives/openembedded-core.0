Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B6ACD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:17:18 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16320.1781777177072321584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 03:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@otiv.ai header.s=google header.b=S8rtWPE0;
 spf=pass (domain: otiv.ai, ip: 209.85.167.46, mailfrom: nathan@otiv.ai)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ad522bddceso277072e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=otiv.ai; s=google; t=1781777175; x=1782381975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zN2PyQtlxc8Ju+NRChw7Tb3q9m2WV+bIT7kK4uaOr74=;
        b=S8rtWPE0NxuZAK5strazyowbaXJJANKnkKzVM/N/XZNP0C0+GPR3UOBiyxe/Gylmnr
         h90EMD2C1UpOn8UBlxC0ZspzaB2YaJ0oru1H/wo3oM894EPlMiXDglZNYAReV1XlzFwy
         7bznUyfZt0AAyy0dyMm88GIui68NeoApgt5GzJejisd+9abQae7ubUwNg32nA7MdKLpg
         HWDOZQAHpEBRMuRCMAWruA7c+n1aVLIUQFpEL+WxcRt03NV6UUw05eD4CfJafy1Ox5Ky
         p84lq19tfA78DcUuhCpHoma/JUfgXuaPF+sYu+LI26DUVIzyGsjfekv+XYA31rMeRG6L
         micQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777175; x=1782381975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN2PyQtlxc8Ju+NRChw7Tb3q9m2WV+bIT7kK4uaOr74=;
        b=e9NXIi6b94lnLqEWdsvzMEp2YMcQ1lcCfqHsgsVgdlrL0iC3aSQJoRvNKqSTCjXSAM
         fqj1qEhFXLHUei5eO5wFUneXxISyfg0UWgE9E+hZPydjcgVEED7xZW/LjTrKMEMWCyux
         QYEHBQYF+a0Zso9vhJLQmSU7vp9hnM2nPBMYR90yq197hBkK8ArzOgGyR2HW50mI2s9D
         H6ZiVg/z3BFstpjhktSqan9Nzzrn1dzpcKVHqmsHDYq8EqcaHV1xSdoVZwrFiQLHVeX2
         FrRkdFia0NwhP5c1xT9rDlw0MCpi0r7QwyoXqDgDtMKC4VydqKnqVh8LQNGYc63JB/6E
         26FQ==
X-Gm-Message-State: AOJu0Yyeij4veNAOcjY15waKBklCa1RtaywM7x6JiWWKjLnytb5Z2y9x
	l6ieQVgXHHnCkh5TVQP7zoI+kBymwjugeXFC7rhg+hMjIAZRP/EtyFvz4m8PsMlGYNQFEggbeBr
	zNj4B
X-Gm-Gg: AfdE7ckSPJJU+0mjppkJBPKDhr39a37IAFJs9gqR36CZiT8tyQ0cn6FmvLv4J0Pz7ke
	IFc8AwDIFyZma5LLj4cyCs2LYskK+/berVVuvn/mKZnAcDOOvZdn3nUv93ljRGlqyRXpvi+zzDX
	BJKQbsW3ytl2Xx86v6s4AjlETTU/KrWKjbSAHTLsIb0C1+yhlu2OUg7ApZT6sbl+SxPmoixEk3a
	Iz3DHDHFkdz+vrZPInAe37krpyvRH5MgbO+fOrA2QQswuFzMZIQoyKy+l5tY6U9yRiPYtVN26xB
	BbP3HEwTvRtbgA062AKR3E3WIi3NVJi5JAh/WvZT6Qan7be5NHDn4r336/IF0XgocHoUu4soxGk
	pekOATIg9wmmhBOcfbMRAErZXcmL1uNZxEcj+J4dSbYwPXDsTtvA5FvsdmmdK05JH6lsYPqDr2N
	gXlzTGK90xS4bdYXXHAd6fEN5iodfJ3mYC0kEVkHGqndl6zuJTf4EcZv6yMZH9lA10rVChy6H0b
	39d4Nf8zuPxmg==
X-Received: by 2002:a05:600c:3acf:b0:490:b9c3:6c69 with SMTP id 5b1f17b1804b1-4923a9eb39emr20852425e9.30.1781776829483;
        Thu, 18 Jun 2026 03:00:29 -0700 (PDT)
Received: from nkent02.otiv.ai (2a02-1811-e507-d800-de56-e30c-805-27e7.ip6.access.telenet.be. [2a02:1811:e507:d800:de56:e30c:805:27e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm64464072f8f.11.2026.06.18.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:00:29 -0700 (PDT)
From: Nate Kent <nathan@otiv.ai>
To: openembedded-core@lists.openembedded.org
Cc: Nate Kent <nathan@otiv.ai>
Subject: [PATCH] Update sed usage by 'pam-wheel' for sudoers
Date: Thu, 18 Jun 2026 11:59:43 +0200
Message-ID: <20260618095943.361698-1-nathan@otiv.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 12:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239081

Fixes Yocto Bug #16321

In version 1.9.17p2, the line that the recipe uses to add the 'wheel'
group to the sudoers file does not exist. This updates the sed usage to
the actual line in question.

Upstream-Status: Innappropriate [oe specific]
Signed-off-by: Nate Kent <nathan@otiv.ai>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 7dfa0cef6c..489c0db09d 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -37,7 +37,7 @@ do_install:append () {
 		install -D -m 644 ${UNPACKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 		if ${@bb.utils.contains('PACKAGECONFIG', 'pam-wheel', 'true', 'false', d)} ; then
 			echo 'auth       required     pam_wheel.so use_uid' >>${D}${sysconfdir}/pam.d/sudo
-			sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
+			sed -i 's/# \(%wheel ALL=(ALL:ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
 		fi
 	fi
 

