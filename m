Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104E9C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:02:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3708.1784113366765036452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZiMKPuKr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057BD1477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E78093F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784113366; bh=vAiIThzblVpoP+BXA9BZGFc8tBgWLzMatqC84UT5AFE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZiMKPuKrfyjOL+eBGHgVa2f5zQyDkQoMGq1Shl6ieJdplPz85xKueMANUkSDQpZVh
	 el6p/TBWZ4KUJJM5QtdMZ9KNALPwbq74ZAnVd30UzIQ52sV30kg9kPciMmnxSe2eRI
	 7Xzfm2Md8c8JkTrJ/drhQbV8KqFsfkhqQIpiU0gI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] msmtp: remove LSB-specific overrides
Date: Wed, 15 Jul 2026 12:02:37 +0100
Message-ID: <20260715110237.1692760-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715110237.1692760-1-ross.burton@arm.com>
References: <20260715110237.1692760-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240947

The linuxstdbase override was used by the poky-lsb distribution, which
aimed to be compatible with the Linux Standard Base specification.

LSB is long-dead and poky-lsb was removed back in 2018 with the thud
release[1].

Clarify the recipe by removing this obsolete alternative.

[1] meta-yocto 00fdefff55 ("poky-altcfg: Replace poky-lsb with poky-altcf=
g")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/msmtp/msmtp_1.8.32.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.32.bb b/meta/recipes-e=
xtended/msmtp/msmtp_1.8.32.bb
index 548c94aaaf6..7f39f66f65a 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
@@ -18,10 +18,6 @@ inherit gettext autotools update-alternatives pkgconfi=
g
 EXTRA_OECONF +=3D "--without-libsecret --without-libgsasl --without-libi=
dn"
=20
 ALTERNATIVE:${PN} =3D "sendmail"
-# /usr/lib/sendmial is required by LSB core test
-ALTERNATIVE:${PN}:linuxstdbase =3D "sendmail usr-lib-sendmail"
 ALTERNATIVE_TARGET[sendmail] =3D "${bindir}/msmtp"
 ALTERNATIVE_LINK_NAME[sendmail] =3D "${sbindir}/sendmail"
-ALTERNATIVE_TARGET[usr-lib-sendmail] =3D "${bindir}/msmtp"
-ALTERNATIVE_LINK_NAME[usr-lib-sendmail] =3D "/usr/lib/sendmail"
 ALTERNATIVE_PRIORITY =3D "100"
--=20
2.43.0


