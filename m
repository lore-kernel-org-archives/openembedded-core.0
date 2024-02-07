Return-Path: <aleksey.smirnov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAF8C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 11:30:11 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.18159.1707305406509764231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 03:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=SLppZr4f;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=ru5cdLsf;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: aleksey.smirnov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com ED73EC0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1707305402; bh=3pVS4USe9Upac6z/Y7ltvhRI5clv1wtc5blE9MV8v9g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=SLppZr4fk1W+NQ1mU1W9ghz6tuGcBZe3Gqr4Q9FcvvZd+GR4uZjGdXwl6xCtqB+bg
	 WT2ev1HLGkocxdiv588OV+DkVawXTswAbMXtbJlSmvM8oKK3X/WJBjJUHjtEjUa/E9
	 XIwu26cTW1UMGGBsHuT2sW0/x9Zn5Ho7ORuoAsISWLod4FH0suru+cqCxmT/koGWZH
	 SF+D0MMyj06jN2F1a9q/ZPVtAi6W7uVICxrAck8lo6HeU/tfa09EZ6RjWvoQP/gd0l
	 ld0kERlaocM82zy8ti5vF39Vo9jeueOixqtEjldB+wk5mXmvq3ILwRzESffVegFMSN
	 fqZWkeOnRmOVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1707305402; bh=3pVS4USe9Upac6z/Y7ltvhRI5clv1wtc5blE9MV8v9g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ru5cdLsfMkvfyKjFyXYYsMWvYl8kPoRSKjC9ARoH/5d4Gf5jaXV5bGDyqWe3sQiio
	 YJpYu+I/zirU3DmAuf4fOnXJV8SuKqdNR/TxjbEBK38bmrMqr8kJrgIZHE2ePKntL1
	 qKP+baIdzO/PvNk5PE000dtPECyOpJk19bV4pIzpOAyfChvOX5WzZERTtVdh0aU32p
	 kIsCdk2DA6YYyc/c/F0FzgQE9p1imj7FfiyiJZGAm2NB1n+FMiBjCiPQmSmOk5jDA7
	 s3f0XlR23KDDS537Bq0zbJi9grFjuF47FZCCLE0qG4PqReG/2RPr03zkx0TAcUfVWm
	 nZKFVucvgxCYQ==
From: Aleksey Smirnov <aleksey.smirnov@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Aleksey Smirnov <aleksey.smirnov@yadro.com>
Subject: [PATCH] Explicitly specify tty device for serial consoles
Date: Wed, 7 Feb 2024 14:28:14 +0300
Message-ID: <20240207112814.2022696-1-aleksey.smirnov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 11:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195051

Description: In case of two or more consoles are in inittab,
and not specified tty device for first one, some keys works improperly,
ex: arrows, backspace, pgup/pgdown; The patch is fixes this issue.

Signed-off-by: Aleksey Smirnov <aleksey.smirnov@yadro.com>
---
 meta/recipes-core/busybox/busybox-inittab_1.36.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb b/meta/r=
ecipes-core/busybox/busybox-inittab_1.36.1.bb
index 8ee88b6aef..6904a91930 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
@@ -23,7 +23,7 @@ do_install() {
         device=3D$(echo $s | cut -d\; -f 2)
         label=3D$(echo $device | sed -e 's/tty//' | tail --bytes=3D5)
=20
-        echo "::respawn:${sbindir}/ttyrun $device ${base_sbindir}/getty =
$speed $device" >> ${D}${sysconfdir}/inittab
+        echo "$device::respawn:${sbindir}/ttyrun $device ${base_sbindir}=
/getty $speed $device" >> ${D}${sysconfdir}/inittab
     done
=20
 	if [ "${USE_VT}" =3D "1" ]; then
--=20
2.30.2


