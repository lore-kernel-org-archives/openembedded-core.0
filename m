Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D35FCDD1BD
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:31:45 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.71804.1727451102479571524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 08:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=BXDki3yU;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=vESP0Pax;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: s.zhmylev@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com D8F92C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1727451098; bh=e6VdHNLp3FidATknS6O6dU3yJB8hs4uVlFtCm/frz5s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=BXDki3yU6ooKDvqMhu9aFYwjoZfJKq9B+zWWsoMaJaU3R7eSatPNjvNfYm9ugE/zM
	 8JUzbT2j29CSIThMnGkyIgvU767fsI+srKpW1eBSBLG55SvqcVb0LmuAAJqX2TaxyD
	 9DIexT3Jd/iwhqOdaCDhrLJ81kbdxu9L0tmyddOUPgzIJelA2sZ8ls/a5o2YTC6oKV
	 2e5JTUkB+Rru7gKli6uWQ6BEQtd1TupOcvOFKOm+lg0C+0QiRL0wE6UrxwC9P7fq/E
	 X94Q/roy2SSIL45Y12eItGG8EQXB5CzYSZyQgoF4LlxN34mXvroD2m1X3FogSWrjtr
	 VCQuEUMLEBxCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1727451098; bh=e6VdHNLp3FidATknS6O6dU3yJB8hs4uVlFtCm/frz5s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=vESP0PaxqVY8ML8NZfqkSNNSNfNCNyCcBgdm1TnxQq4IF6AFuluGL2toGPyhCyUyj
	 Vskj2ii6bbM/aTz9Y7R0xBewW1HiRsiSYSCuTeGZ4ODvitpx7zlZoFpggmTX0+moFB
	 a7YAJlUqBhxKls2s6jZvvayHaJmY1S/GQJGNZjwW0/p3YBPBwZoShYwxt1oG72Msn4
	 eGQ718N6+z5IZipxGDrXZkDkvNP/QTgBW3YOHhq4YL6O+HmmP2Mp0DcTGoWD6rIUES
	 KbCtykVM6b44wqqeWiPjF+UCluFb19XNP7bBdc7e1cpl5A61Tf36H1k4Z/BCNVQaEG
	 TagnP93JgM3Pw==
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] lsb-release: fix Distro Codename shell escaping
Date: Fri, 27 Sep 2024 18:31:20 +0300
Message-ID: <20240927153120.18236-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 15:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205028

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 meta/recipes-extended/lsb/lsb-release_1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-=
extended/lsb/lsb-release_1.4.bb
index 00d8183a4f1..a7039ea4d19 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -29,7 +29,7 @@ do_install() {
 	echo "DISTRIB_ID=3D${DISTRO}" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_RELEASE=3D${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-rel=
ease
 	if [ -n "${DISTRO_CODENAME}" ]; then
-		echo "DISTRIB_CODENAME=3D${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-=
release
+		echo "DISTRIB_CODENAME=3D\"${DISTRO_CODENAME}\"" >> ${D}${sysconfdir}/=
lsb-release
 	fi
 	echo "DISTRIB_DESCRIPTION=3D\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${=
D}${sysconfdir}/lsb-release
 }
--=20
2.43.0


