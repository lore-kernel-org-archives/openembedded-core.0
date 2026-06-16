Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9179CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:40:48 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156151.1781620843478037624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 07:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=dJMv3OfH;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=dJMv3OfH;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1781620828;
	bh=V+NB8PGGvkFPppG2nDJbJd4b7rVk4NVgHXnrUjm3pvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJMv3OfHoQTGG3bvyYBb0yQgKv5fRB+WXH/+29SN3gCKfvAGlepw2wloCSPAV9Wtw
	 gBo0H1myPIxoOS0Z6Z4u5431opMDk4Sn6Stdrd2T8JldBiQ0wlHhiQv5JaGl1sKxB7
	 axUCEfoNX/7HYVlA76yw/PfhaAuLlrx/HuqOvdNtmkPc9RLl6yeOLkiENWDpNyGgbQ
	 ciOIiHPBqG7kdxCfQAVMJJu16VTNTAGZ9HGXe0MAvqdg9afa/gnVqtuNN3mg7GeuQN
	 qBEWBF+78FN5Y5NbReVMIrcehHc56UbxG46N/tQJ/LzyOTNs64BJMmkGT8y9NXWywZ
	 iDdcefczRi9fQ==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id A20635F9D3
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1781620828;
	bh=V+NB8PGGvkFPppG2nDJbJd4b7rVk4NVgHXnrUjm3pvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJMv3OfHoQTGG3bvyYBb0yQgKv5fRB+WXH/+29SN3gCKfvAGlepw2wloCSPAV9Wtw
	 gBo0H1myPIxoOS0Z6Z4u5431opMDk4Sn6Stdrd2T8JldBiQ0wlHhiQv5JaGl1sKxB7
	 axUCEfoNX/7HYVlA76yw/PfhaAuLlrx/HuqOvdNtmkPc9RLl6yeOLkiENWDpNyGgbQ
	 ciOIiHPBqG7kdxCfQAVMJJu16VTNTAGZ9HGXe0MAvqdg9afa/gnVqtuNN3mg7GeuQN
	 qBEWBF+78FN5Y5NbReVMIrcehHc56UbxG46N/tQJ/LzyOTNs64BJMmkGT8y9NXWywZ
	 iDdcefczRi9fQ==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 916F05F921
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:40:28 +0200 (CEST)
From: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCtzel?= <andreas.muetzel@emlix.com>
Subject: [PATCH 3/3] overlayfs: inherit permissions from lower
Date: Tue, 16 Jun 2026 16:40:19 +0200
Message-ID: <20260616144043.3303124-3-andreas.muetzel@emlix.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616144043.3303124-1-andreas.muetzel@emlix.com>
References: <20260616144043.3303124-1-andreas.muetzel@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 14:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238907

When creating the upperdir of an overlayfs, inherit not only the
ownership but also the permissions from the lowerdir.

Signed-off-by: Andreas M=C3=BCtzel <andreas.muetzel@emlix.com>
---
 meta/files/overlayfs-create-dirs.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/overlayfs-create-dirs.sh b/meta/files/overlayfs-c=
reate-dirs.sh
index 9f38ad7648..c22536598c 100644
--- a/meta/files/overlayfs-create-dirs.sh
+++ b/meta/files/overlayfs-create-dirs.sh
@@ -8,4 +8,5 @@ mkdir -p ${datamountpoint}/upper${lowerdir}
 mkdir -p ${datamountpoint}/workdir${lowerdir}
 if [ -d "$lowerdir" ]; then
     chown $(stat -c "%U:%G" ${lowerdir}) ${datamountpoint}/upper${lowerd=
ir}
+    chmod $(stat -c "%a" ${lowerdir}) ${datamountpoint}/upper${lowerdir}
 fi
--=20
2.54.0


