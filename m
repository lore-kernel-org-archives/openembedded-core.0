Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190BAC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:45:06 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.1394.1717087498509957064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 09:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=rC9lPUEu;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id BFBEF240101
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 18:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1717087496; bh=RX4Ee28T6GsHtvTYB5jcspODOkKR+3/m6lZj/OJzeJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=rC9lPUEuS6ncTqhRN8FyfN7/V2yqvWO319NB/QS8cFC8UYJJ8TZT3gKgc58SOEI1e
	 Y826p5R+DTtCxk3AiLHnErmgBs5kKf6Nu/67FsglwV/VxpZaWXv00DollpBc23CLSo
	 puRJNKYoBLW+wxkG5edAFU19E1vrIC8F2i8Rxmo+IMs7iIM21BxLSRcr4UgBppBb/N
	 M7ZRduUM3Nm6z9s+0XFH75ACiIjyUI+IDNnjgoGv4D/56nocEpJFKazawVdnvXK5/4
	 REjwgssJAmCFJtAePQbaU1iNMqoheU7/lOEJl5LW5ovbA7W0k0fwSdlvKwbr10147k
	 rp1iJVARIOdhQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VqsYN0ZFNz9rxD;
	Thu, 30 May 2024 18:44:55 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2 1/2] tzdata: Add tzdata.zi to tzdata-core package
Date: Thu, 30 May 2024 16:44:48 +0000
Message-Id: <20240530164448.359623-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 16:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200035

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Additionally build and package tzdata.zi info file, as e.g. Systemd expec=
ts it
to be present.

[YOCTO #15172]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-exte=
nded/timezone/tzdata.bb
index dd1960ffa7..2099b05db8 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -20,6 +20,7 @@ do_configure[cleandirs] =3D "${B}"
 B =3D "${WORKDIR}/build"
=20
 do_compile() {
+	oe_runmake -C ${S} tzdata.zi
 	for zone in ${TZONES}; do
 		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo -L /dev/nu=
ll ${S}/${zone}
 		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo/posix -L /=
dev/null ${S}/${zone}
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


