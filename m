Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D98AC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 15:44:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.133805.1680709460332477792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 08:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D14740C21
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Apr 2023 15:44:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEv2e57fBRp9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2023 15:44:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C6F940C24
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Apr 2023 15:44:19 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 55EBA1637F9;
	Wed,  5 Apr 2023 11:43:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/2] grep: upgrade 3.9 -> 3.10
Date: Wed,  5 Apr 2023 15:44:09 +0000
Message-Id: <20230405154409.4035459-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405154409.4035459-1-denis@denix.org>
References: <20230405154409.4035459-1-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 15:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179741

This is to announce grep-3.10, a stable release,
fixing a bug with -P and \d. TL;DR, grep-3.9 would do this:

  $ LC_ALL=3Den_US.UTF-8 grep -P '\d' <<< =D9=A0=D9=A1=D9=A2=D9=A3=D9=A4=D9=
=A5=D9=A6=D9=A7=D9=A8=D9=A9
  =D9=A0=D9=A1=D9=A2=D9=A3=D9=A4=D9=A5=D9=A6=D9=A7=D9=A8=D9=A9

It should print nothing, like it has always done.
For more detail, see https://lists.gnu.org/r/bug-grep/2023-03/msg00005.ht=
ml

Thanks to Paul Eggert for catching the \D variant and to Bruno Haible
for assiduously tending gnulib and for testing grep on so many
different systems.

There have been 12 commits by 2 people in the 17 days since 3.9.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-extended/grep/{grep_3.9.bb =3D> grep_3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/grep/{grep_3.9.bb =3D> grep_3.10.bb} (94%)

diff --git a/meta/recipes-extended/grep/grep_3.9.bb b/meta/recipes-extend=
ed/grep/grep_3.10.bb
similarity index 94%
rename from meta/recipes-extended/grep/grep_3.9.bb
rename to meta/recipes-extended/grep/grep_3.10.bb
index 3c39a5fb56..33fd64d27e 100644
--- a/meta/recipes-extended/grep/grep_3.9.bb
+++ b/meta/recipes-extended/grep/grep_3.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
=20
 SRC_URI =3D "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "abcd11409ee23d4caf35feb422e53bbac867014cfeed313b=
b5f488aca170b599"
+SRC_URI[sha256sum] =3D "24efa5b595fb5a7100879b51b8868a0bb87a71c183d02c4c=
602633b88af6855b"
=20
 inherit autotools gettext texinfo pkgconfig
=20
--=20
2.25.1


