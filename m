Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72803C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 11:04:52 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web09.6174.1665659082781650496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 04:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@yadro.com header.s=mta-01 header.b=ZOvDM85u;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 92571411FF
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=mta-01; t=1665659078; x=
	1667473479; bh=q1S4WZkOGoPBlEWzMCcji7uqdPtIWVkfmWIxVK4DrMw=; b=Z
	OvDM85uOq6ajJGxG2B8dltVg0n8Dvfgzv1FNQohnL1bR28oiaZx9zsy67Q5j1yOI
	l5PXIK5RaBMHsSlbLBKyLmYmBr7VCG06OpCRtfPONM3/nX2eGjdBm+VB4XxpzjF6
	qkm4dGJJjc8U4BuKYV3Jr+I5ilTD9v7dD2e66mUzns=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qB6RMsWkP12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2022 14:04:38 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 7C54241203
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 14:04:35 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 13 Oct 2022 14:04:35 +0300
Received: from localhost.localdomain (172.22.3.32) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 13 Oct
 2022 14:04:34 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] wic: implement binary repeatable disk identifiers
Date: Thu, 13 Oct 2022 14:03:45 +0300
Message-ID: <20221013110345.871502-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.3.32]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 11:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171700

From: Sergei Zhmylev <s.zhmylev@yadro.com>

When SOURCE_DATE_EPOCH variable is set, binary repeatable build
is expected. This commit implements reproducable disk identifiers
in such a case using its value as a Random seed.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
index da483daed5..6faa16bf9b 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -310,7 +310,10 @@ class PartitionedImage():
                           # all partitions (in bytes)
         self.ptable_format =3D ptable_format  # Partition table format
         # Disk system identifier
-        self.identifier =3D random.SystemRandom().randint(1, 0xffffffff)
+        if os.getenv('SOURCE_DATE_EPOCH'):
+            self.identifier =3D random.Random(int(os.getenv('SOURCE_DATE=
_EPOCH'))).randint(1, 0xffffffff)
+        else:
+            self.identifier =3D random.SystemRandom().randint(1, 0xfffff=
fff)
=20
         self.partitions =3D partitions
         self.partimages =3D []
--=20
2.37.2


