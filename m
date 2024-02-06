Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D7AC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 06:17:23 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.16079.1707200235462733446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 22:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=ooDuKltX;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 97EEE240103
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Feb 2024 07:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707200233; bh=eORgkBH091Nj7WltqEezbalTj+CD52O65MgLC20rBpw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ooDuKltXnh78qL0E+47yJI4t+UIeQ/S8LN98UuLt7AtYBgiJLV9kB5EFpjUoBV54G
	 oMgJtHC6Bo/JaDPwBKUzSvgwXLs1Vo8QttdeE2etAWd83g8d4drFesOuWyLy8G46Xd
	 s1LyvWG/an7ZCFX3an9FjL3ifzYglcFVc2jh2SX24pGO8KTxhq33Ojep8CyVeXCNT9
	 xdvc0N0YkFmwsGYYe6/Nits72ApR29H0W6mXWHzt0/CmR1D2X6TNEnYARVcgge3CAv
	 wzt+VRief56TqjPKcgDM54fGhqnxxVKZSuWu4lvzJkjg5w5bvrBRX59eDTbZ8Rdubx
	 ss0bvTMMpluAA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TTY1h5ZkFz6tyG;
	Tue,  6 Feb 2024 07:17:12 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] gnutls: print log if ptest fails
Date: Tue,  6 Feb 2024 06:17:01 +0000
Message-Id: <20240206061701.3947297-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 06:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194971

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

There are AB-INT issues with the gnutls tests and the test for naked-aler=
ts is
failing. Tweak the run-ptest script to save the error log to obtain more =
infos
for debugging. Related to [YOCTO 15352].

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-support/gnutls/gnutls/run-ptest | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-=
support/gnutls/gnutls/run-ptest
index 84948f487d..17e26eae70 100644
--- a/meta/recipes-support/gnutls/gnutls/run-ptest
+++ b/meta/recipes-support/gnutls/gnutls/run-ptest
@@ -58,6 +58,8 @@ cd tests
 max_njobs=3D$(grep -c ^processor /proc/cpuinfo)
 njobs=3D0
=20
+set +e
+
 for t in *; do
     [ -x $t ] || continue
     [ -f $t ] || continue
@@ -80,6 +82,14 @@ passed=3D$(grep -c PASS ${LOG})
 failed=3D$(grep -c FAIL ${LOG})
 total=3D$(expr ${passed} + ${failed} + ${skipped})
=20
+if [ ${failed} -ne 0 ]; then
+    echo
+    echo "Tests failed for gnutls, log is:"
+    echo "--------------------"
+    cat ${LOG}
+    echo
+fi
+
 echo
 echo "gnutls test summary:"
 echo "--------------------"
--=20
2.39.2


