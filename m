Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDAEC48BF3
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 21:10:42 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.9659.1708117833602092952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 13:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=bYjbohNU;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E70AB240101
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 22:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708117831; bh=LuBEZ5cJg1lNwNxLGBwoi6Or/g1UdiAV6WlIFP3OodQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=bYjbohNU8GVJPImfrq9DBGtux/h2HXN+udl1n0S7qszhaXzCU+HBiB8Y2+OL6rCoD
	 8ot8gGxIlHXaa92+GLbJgWYSqhHwe7lwypwAG6L0K6FkGin2kcN0enqisVDDFu9d+7
	 LW0o11qGRCRy0MIow4Aou2PjgggCOobNrAF9IjYjKkgZQcShJWFkH9hrBmB14xYX81
	 WSdKMwLRlMqpnN41vP/+d0US2bo8tLYQoN5hCytXwY0gYw0t83qKzuqHkDez0VcygZ
	 mAKmpP5O6UoneKz4irDsw9NPOHL/wtzmuilS50FAQTYaM7mOWC3oSx5kMnC41bNz58
	 94M7XJjox33Yg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Tc4Mq2WqMz6tw3;
	Fri, 16 Feb 2024 22:10:31 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] patchtest: add stronger indication for failed tests
Date: Fri, 16 Feb 2024 21:10:21 +0000
Message-Id: <20240216211021.17863-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 21:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195808

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Do not only log that there has been an issue but add WARNING before for l=
ocal
runs. Hopefully this helps to avoid that people reading the log to quickl=
y miss
issues.

Fixes [YOCTO #15389]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
v2:
Fix commit message.

 scripts/patchtest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index d0dc6e8fac..3163420220 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -164,9 +164,9 @@ def run(patch, logfile=3DNone):
     if premerge_result =3D=3D 2 and postmerge_result =3D=3D 2:
         logger.error('patchtest: No test cases found - did you specify t=
he correct suite directory?')
     if premerge_result =3D=3D 1 or postmerge_result =3D=3D 1:
-        logger.error('patchtest: At least one patchtest caused a failure=
 or an error - please check')
+        logger.error('WARNING: patchtest: At least one patchtest caused =
a failure or an error - please check')
     else:
-        logger.error('patchtest: All patchtests passed')
+        logger.error('OK: patchtest: All patchtests passed')
     print('-------------------------------------------------------------=
---------\n')
     return premerge_result or postmerge_result
=20
--=20
2.39.2


