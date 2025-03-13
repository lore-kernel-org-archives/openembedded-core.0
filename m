Return-Path: <d.makhnin@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C394C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:27:51 +0000 (UTC)
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
 by mx.groups.io with SMTP id smtpd.web10.16256.1741876063793850744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=XHzRLpvW;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=M9bXNzCa;
 spf=pass (domain: yadro.com, ip: 89.207.88.253, mailfrom: d.makhnin@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 0358BE0004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1741876061; bh=STjL5FsrX5yBm7Czw7VKg9zbmD/tdNim/aUfNdyIbD4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XHzRLpvWwmik/DlOHuaFaSQrP7hPV+38D310DkcU9fxoxrnS1HJz7PQvC1zorp22h
	 XJbntARLgvCGFlmFBZ0DKvpw0ts09OHJgrUz0Ue+0NAbOOPOA49GEEucZ3hRZXw4Zg
	 4693p7oc+8i/8AgqaKjByYjCngxQ6qfhOkaxGIuIh4qu+vy0s56npLnA7L/A35ZABv
	 PtnDN+M0lk1u9wsbMdTVOFHTePUG+FJVLKswpSwUL+9oGEPKbM0TRXP5rdbi02/ept
	 QuOGX9bVF1yfxtU9FdSWv7dYdjIMKdg2QaHKCM5DljnXRxXvpuzHCCMj/jbOSpbpmQ
	 5gmDNWv1N6GCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1741876061; bh=STjL5FsrX5yBm7Czw7VKg9zbmD/tdNim/aUfNdyIbD4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=M9bXNzCapXVbnzNACHzAdlp83DdlOemTAQUogDLt9TpAhmlX/NxGXV0Mwy3YUOOmW
	 uuI7Xap8DehQBpeXqzVVXI5rTNhHF9GklPEGMKvqvfXijqKC44o4c/fiyBhvA02ImK
	 JIDb4g8j49atwKaoOjNLsKO6fMTMxexQ/KfW39SGsWKKsfSUr1KwtSP5JYRYEmzYQS
	 WBhcS/wZ3v8eb2c2LJaVqT3hdsRWMA8XaorcGf6nMuQSq2+T6km0qewxfYObTKojpE
	 qNLjPBntCZ622SOaoGSiGRSzQFagJzLAEUuJwn3fdiCQ44Qro7GpTZoDCm0yktVIKX
	 XxRXPPiXkE8qA==
From: Dmitry Makhnin <d.makhnin@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Dmitry Makhnin <d.makhnin@yadro.com>
Subject: [PATCH] waf-samba: using python variable from python3native.bbclass
Date: Thu, 13 Mar 2025 17:27:20 +0300
Message-ID: <20250313142720.957159-1-d.makhnin@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 T-EXCH-12.corp.yadro.com (172.17.11.143)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212777

Waf-samba.bbclass inherits python3native.bbclass
which has the variable PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/=
python3".
This allows this variable to be used in do_compile instead of python3.

Signed-off-by: Dmitry Makhnin <d.makhnin@yadro.com>
---
 meta-networking/classes/waf-samba.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/=
classes/waf-samba.bbclass
index 79acacc989..cb78ce6b0d 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -113,7 +113,7 @@ do_configure() {
=20
 do_compile[progress] =3D "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 do_compile () {
-    python3 ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d, '=
-j%d', limit=3D64)}
+    $PYTHON ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d, '=
-j%d', limit=3D64)}
 }
=20
 do_install() {
--=20
2.30.2


