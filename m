Return-Path: <aleksey.smirnov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01DBC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 10:13:46 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.14704.1707387219148585582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 02:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=S21bLfgn;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=azOHZz7F;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: aleksey.smirnov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 6E701C0008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1707387216; bh=ZHrgcONSx6MXOIGY3nZHpE1NopQtb00Jz2cjtbURNzs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=S21bLfgn2UB0dJwy5Lg8VyBzR9lXdgpVzVO9cwlf51Uupo1iiVDhM8QvfpUIdS5kB
	 WDq5W02ZMyrFRkPEJAnVbCNwg8iaE9EzLUtb+0CMfm167zP4UOwThU592LA6eqQ2ka
	 xaLsekKc/2WrMIXeRR07UJujhw1cL1oCrpo+m3bep2mxiZcZWKuZKZzSJavLiBVcSG
	 E45RJc7JJf18e8b0d9A70p5t1CoC6wepWf3wsv/tngMenp6cuaNFzJWXpsFfCynnvC
	 5j/Cg0AoQnoKIQ6sYT5AjyIY04QEZ77gd7ruyR2pTScDCGF86DQptZI98Eren3A0Dh
	 AAAb9CBNZ3Gig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1707387216; bh=ZHrgcONSx6MXOIGY3nZHpE1NopQtb00Jz2cjtbURNzs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=azOHZz7FTBhWVqEdYI0Zcigd2/wWZM2f7FRd7zBAxYYzTmGiMVKpj+HMr3kFyYmu7
	 ulup/0Aeg9rnQhDaTaASOHNs8B7SjoCvClDw3T+eR6fLaPQNaxozhuLl0Lyf2/2Cw0
	 gtg4VOzceR28cbsCX67z+8iJDun0uMvmIlBOSpkBJFy1mF/FKZucI8M45hUJmT1G97
	 8+QyPCUvI8mYH9zPRDu5/tH6HPKgN8HcrEq1tKkSWljOH9oBS1EbfOggggyv8HBmo9
	 /Fk8SHScriMj0HJhQAqv0zJr3UiqBAR6X7r3/K//6fQ+vsfGG+c6e9CRn0rAr1pwUW
	 eKKgEE8DLRnLw==
From: Aleksey Smirnov <aleksey.smirnov@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Aleksey Smirnov <aleksey.smirnov@yadro.com>
Subject: [PATCH] configuration: add Power8 tune to PowerPC architecture
Date: Thu, 8 Feb 2024 13:11:56 +0300
Message-ID: <20240208101156.735389-1-aleksey.smirnov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 10:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195125

Description: now we can tune our build only for power7 or power9
processor for PowerPC arch, this patch add posibility to choose power8 tu=
ne.

Signed-off-by: Aleksey Smirnov <aleksey.smirnov@yadro.com>
---
 .../machine/include/powerpc/tune-power8.inc   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/conf/machine/include/powerpc/tune-power8.inc

diff --git a/meta/conf/machine/include/powerpc/tune-power8.inc b/meta/con=
f/machine/include/powerpc/tune-power8.inc
new file mode 100644
index 0000000000..ee10f2428f
--- /dev/null
+++ b/meta/conf/machine/include/powerpc/tune-power8.inc
@@ -0,0 +1,31 @@
+DEFAULTTUNE ?=3D "ppc64p8le"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[power8] =3D "Enable IBM Power8 specific processor optimization=
s"
+TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'power8', ' -mcp=
u=3Dpower8', '', d)}"
+
+AVAILTUNES +=3D "ppcp8 ppc64p8 ppcp8le ppc64p8le"
+
+TUNE_FEATURES:tune-ppcp8 =3D "m32 fpu-hard power8 altivec bigendian"
+BASE_LIB:tune-ppcp8 =3D "lib"
+TUNE_PKGARCH:tune-ppcp8 =3D "ppcp8"
+PACKAGE_EXTRA_ARCHS:tune-ppcp8 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerpc} =
ppcp8"
+
+TUNE_FEATURES:tune-ppc64p8 =3D "m64 fpu-hard power8 altivec bigendian"
+BASE_LIB:tune-ppc64p8 =3D "lib64"
+TUNE_PKGARCH:tune-ppc64p8 =3D "ppc64p8"
+PACKAGE_EXTRA_ARCHS:tune-ppc64p8 =3D "${PACKAGE_EXTRA_ARCHS:tune-powerpc=
64} ppc64p8"
+
+TUNE_FEATURES:tune-ppcp8le =3D "m32 fpu-hard power8 altivec"
+BASE_LIB:tune-ppcp8le =3D "lib"
+TUNE_PKGARCH:tune-ppcp8le =3D "ppcp8le"
+PACKAGE_EXTRA_ARCHS:tune-ppcp8le =3D "${PACKAGE_EXTRA_ARCHS:tune-powerpc=
le} ppcp8le"
+
+TUNE_FEATURES:tune-ppc64p8le =3D "m64 fpu-hard power8 altivec"
+BASE_LIB:tune-ppc64p8le =3D "lib64"
+TUNE_PKGARCH:tune-ppc64p8le =3D "ppc64p8le"
+PACKAGE_EXTRA_ARCHS:tune-ppc64p8le =3D "${PACKAGE_EXTRA_ARCHS:tune-power=
pc64le} ppc64p8le"
+
+# glibc configure options to get power8 specific library
+GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', 'power8',=
 '--with-cpu=3Dpower8', '', d)}"
--=20
2.30.2


