Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CCAC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 00:21:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2196.1685492479119173999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 17:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B824140C30
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:21:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GPvvaaI9jRQ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2023 00:21:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7177408CD
	for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:21:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id EF65A16392A;
	Tue, 30 May 2023 20:20:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] bitbake.conf: Add SRCPV to BB_HASH_CODEPARSER_VALS
Date: Wed, 31 May 2023 00:21:16 +0000
Message-Id: <20230531002116.2033252-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181968

Also add SRCPV to the list of BB_HASH_CODEPARSER_VALS for code parser
cache handling. Otherwise an empty SRC_URI in the list triggers this
exception:

bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expressio=
n was ${@bb.fetch2.get_srcrev(d)} which triggered exception
 FetchError: Fetcher failure: SRCREV was used yet no valid SCM was found =
in SRC_URI
The variable dependency chain for the failure is: SRCPV -> UBOOT_LOCALVER=
SION -> do_compile

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b527dc564e..e28df7478f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -962,7 +962,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc deps depends \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdepta=
sk \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename l=
ineno \
     progress mcdepends number_threads"
-BB_HASH_CODEPARSER_VALS =3D "LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D1234 T=
IME=3D1234 PV=3D0.0-1 PN=3Dno-pn METADATA_REVISION=3D1234 SRC_URI=3D "
+BB_HASH_CODEPARSER_VALS =3D "LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D1234 T=
IME=3D1234 PV=3D0.0-1 PN=3Dno-pn METADATA_REVISION=3D1234 SRC_URI=3D SRCP=
V=3D1234"
=20
 MLPREFIX ??=3D ""
 MULTILIB_VARIANTS ??=3D ""
--=20
2.25.1


