Return-Path: <aleksey.smirnov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E23CC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 11:53:01 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.18449.1707306769483774144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 03:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=O7I9igGm;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=bdX/0vnG;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: aleksey.smirnov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com C2F89C0006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1707306766; bh=3pVS4USe9Upac6z/Y7ltvhRI5clv1wtc5blE9MV8v9g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=O7I9igGm78+jAc45JFtoedOsy1m4FXfYFIu6lzyRGSB7Q6Oo0z0n+l2Tn89eK7bvz
	 4IUA6HWTVFj8NW+Te/vWAYsdq+HS68LeaYofZVIwseoit4bm4N5Q9yv6kKzV/EVqnY
	 1iuNspuckMLYVoMPFcWrdAjUF9dPzahQrQSwcf86a2NJhEBWbv858ZBC0CifKNa/tU
	 K2AblsnpjdgRBRo6XkEJXqy/Ru1uF5uNc7Nsq+gW0Y7mAlqf6pk/lsXwsQzUgJ9MKk
	 EfP31/hE2Brt5h0vVOU3fBiWEF5lEIa92BQbOPmTcsMKJm+MaE+zveDDhmF87osFPc
	 7SaNKPliYCPYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1707306766; bh=3pVS4USe9Upac6z/Y7ltvhRI5clv1wtc5blE9MV8v9g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=bdX/0vnG8vShYwXK40i93q04lkr+/+43Tffo/4fFmRStNtR0ldX46FXpZokdU9BJw
	 U2aoFEY+vAo3N/ugZ3eWQzRLwcwskDXEQ6hmThoCaM/Nl9cY/MiRePFvePfW12RVCK
	 zdL57ZkqT8QaTI8Jnn7+1NW/N17SEZ73oOC/hwr/uV8HCttbi1JTACfh5DrRY2rHMC
	 y7RW6Dvo9pMV8tOG92FQY1kq+CnO/xJmudTO+Dzjfp90xKVF/ZipKguxQBE+rrWjXs
	 nGbJ/gKGElGSCAVL3GeXTbeZtlNCog2Kz4NptlQbcdO6a/1N6ccARW1VFjF8YiVb/T
	 MLfrHsVHqQqqQ==
From: Aleksey Smirnov <aleksey.smirnov@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Aleksey Smirnov <aleksey.smirnov@yadro.com>
Subject: [PATCH] busybox: Explicitly specify tty device for serial consoles
Date: Wed, 7 Feb 2024 14:51:06 +0300
Message-ID: <20240207115106.2231484-1-aleksey.smirnov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 11:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195054

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


