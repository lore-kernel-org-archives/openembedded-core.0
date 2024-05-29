Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7CDC25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 23:13:16 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.3438.1717024387978633209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 16:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=TYEDQkq+;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 86E54240101
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 01:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1717024385; bh=iDLbLRRZq8HmA5tA/JYrhX5GTgwnM/+7wHMeOj5aAZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=TYEDQkq+yLpTMS+8SldbAYSJh7tjGSAuibVQbu15MrlQ3TdVKvEKKJlng1+dloky8
	 /SBZyE2TrIUhJKiUmeJ8exWm0aB4PPj/9S6yPVmwNe8MeG+L8EOybOOOWVY9Shw3Vh
	 aOWtAKorRo4IvLoEoksGICPzHYIBzu35GD/AKIuXDUATQaaHzYYYcSQ/KDq3Bfmp0T
	 RQv4PJv7/11wz14vZocGZUd8eThi/y+XzcERVgf78yWpmzogI2Rn7KomGurwMDd3nS
	 vAF5YyVaoIYCBPlGelzgyg6bEOP2e4tH6yzaRqrOwjp+iEhns8bJ89qlRJ43ciOIvY
	 8awpJlUWL33wg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VqQCh51f6z9rxB;
	Thu, 30 May 2024 01:13:04 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] tzdata: Add tzdata.zi to tzdata-core package
Date: Wed, 29 May 2024 23:12:52 +0000
Message-Id: <20240529231252.325820-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 23:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200012

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Additionally build and package tzdata.zi info file, as e.g. Systemd expec=
ts it
to be present.

[YOCTO #15172]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-exte=
nded/timezone/tzdata.bb
index dd1960ffa7..30175740d7 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -20,7 +20,8 @@ do_configure[cleandirs] =3D "${B}"
 B =3D "${WORKDIR}/build"
=20
 do_compile() {
-	for zone in ${TZONES}; do
+    oe_runmake -C ${S} tzdata.zi
+    for zone in ${TZONES}; do
 		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo -L /dev/nu=
ll ${S}/${zone}
 		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo/posix -L /=
dev/null ${S}/${zone}
 		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo/right -L $=
{S}/leapseconds ${S}/${zone}
@@ -37,6 +38,7 @@ do_install() {
 	cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
 	cp -pP "${S}/leapseconds" ${D}${datadir}/zoneinfo
 	cp -pP "${S}/leap-seconds.list" ${D}${datadir}/zoneinfo
+	cp -pP "${S}/tzdata.zi" ${D}${datadir}/zoneinfo
=20
 	# Install default timezone
 	if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
@@ -141,6 +143,7 @@ FILES:tzdata-core +=3D " \
     ${sysconfdir}/timezone \
     ${datadir}/zoneinfo/leapseconds \
     ${datadir}/zoneinfo/leap-seconds.list \
+    ${datadir}/zoneinfo/tzdata.zi \
     ${datadir}/zoneinfo/Pacific/Honolulu \
     ${datadir}/zoneinfo/America/Anchorage \
     ${datadir}/zoneinfo/America/Los_Angeles \
--=20
2.39.2


