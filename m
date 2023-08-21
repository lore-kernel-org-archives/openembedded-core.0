Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43578EE49A6
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:04:24 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.100])
 by mx.groups.io with SMTP id smtpd.web10.9243.1692619459674839394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=UTxhc6v/;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.100, mailfrom: jasper@fancydomain.eu)
From: Jasper Orschulko <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1692619453;
	bh=Nzk8SbMGMUm/UtgLIOcx/5pcm6Hd5DQtKCR6kCCwKAI=;
	h=From:To:Cc:Subject;
	b=UTxhc6v/yuhjARyYvJUNVMhqpX/qnvA1Y/7OihL5CWsZILSJONeRg//uiwoVauw7t
	 x5WfB3RewlFHeJuIeN9mbu0EaGBi/QbIdyg1R5woBilmnHrnfu9aOBwT1TkHQd0lc9
	 ElvLe/K6VFV150RRfQ+FExwJx0iykcWOQbwwQu/myWsxiq0cPE/E1BV1WqYJYtuyYc
	 xW3o7FsAn010rCZIsTN0Ek55CvBgYt6KuW+MJe74M9k1H8VjsUbVwjYgPCMNU60Aut
	 NDJLETkr/l65BOxI5pM4AM3BXwbel6IC72SVUuay0Ycnxl+vCR9dwUPHUCAAsN9iPR
	 A9P50KspUVLOw==
To: openembedded-core@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [PATCH] cve_check: Fix cpe_id generation
Date: Mon, 21 Aug 2023 14:02:30 +0200
Message-ID: <20230821120230.29184-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 12:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186433

Use "*" (wildcard) instead of "a" (application)in cpe_id generation,
as the product is not necessarily of type application, e.g.
linux_kernel, which is of type "o" (operating system).

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 5bf3caac47..3979d521d1 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -156,7 +156,7 @@ def get_cpe_ids(cve_product, version):
         else:
             vendor =3D "*"
=20
-        cpe_id =3D 'cpe:2.3:a:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, pro=
duct, version)
+        cpe_id =3D 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, pro=
duct, version)
         cpe_ids.append(cpe_id)
=20
     return cpe_ids
--=20
2.41.0


