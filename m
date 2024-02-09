Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012C8C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:28:57 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by mx.groups.io with SMTP id smtpd.web10.12893.1707488926564275819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=Vwk1Eu7Q;
 spf=pass (domain: 163.com, ip: 220.197.31.2, mailfrom: chen_heyun@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=b2Lxs
	a9wnQg+s+ktoC3n7MUGr4ttngyo/PL93u9S0/c=; b=Vwk1Eu7Q60Go/hY8FEwrA
	r1bYceQigMUvDXz4Sm1f2anXKZj5lKbNsBV5xxrcT/hkjMmi+sKhd15I/Oto+RtQ
	5PHEUEvnyQr4cDFuZ8cSgv0m2JQIdXb2ux2ZNbDUJwQtJn7Sni/RnCOApPuL+Ip0
	8KXVyTLbr8NC0Wj3p9BbLQ=
Received: from ubuntu.localdomain (unknown [119.86.47.226])
	by gzga-smtp-mta-g1-1 (Coremail) with SMTP id _____wD3n4GXNsZlgKYLAQ--.6173S2;
	Fri, 09 Feb 2024 22:28:40 +0800 (CST)
From: chenheyun <chen_heyun@163.com>
To: openembedded-core@lists.openembedded.org
Cc: chenheyun <chen_heyun@163.com>
Subject: [PATCH] Add user space utility:dropwatch
Date: Fri,  9 Feb 2024 06:28:38 -0800
Message-Id: <20240209142838.113213-1-chen_heyun@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wD3n4GXNsZlgKYLAQ--.6173S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryftFWruw4xGFW7WF13XFb_yoW8Xr4fpa
	yrCrn0kw48Gr12g3s7Cw17Kw1Sqw4vv34rA347X3yavFy5C345JrWFyryfWF1fGF4Syr4U
	Z3srXF4rWayxC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRVBTwUUUUU=
X-Originating-IP: [119.86.47.226]
X-CM-SenderInfo: xfkh0spkh130i6rwjhhfrp/1tbiVhd-RmV4H6EGoAAAs9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195219

we can enbale linux module(drop_monitor.ko),and use dropwatch
of user space utility to diagnose NetWorking packets are getting dropped.

Signed-off-by: chenheyun <chen_heyun@163.com>
---
 .../dropwatch/dropwatch_git.bb                | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 meta/recipes-extended/dropwatch/dropwatch_git.bb

diff --git a/meta/recipes-extended/dropwatch/dropwatch_git.bb b/meta/recipe=
s-extended/dropwatch/dropwatch_git.bb
new file mode 100755
index 0000000000..62a1eab777
--- /dev/null
+++ b/meta/recipes-extended/dropwatch/dropwatch_git.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2024 chenheyun <chen_heyun@163.com>=0D
+# Released under the MIT license (see COPYING.MIT for the terms)=0D
+=0D
+SUMMARY  =3D "User space utility to diagnose to NetWorking packets are get=
ting dropped"=0D
+DESCRIPTION =3D "Dropwatch is an utility to interface to the kernel to mon=
itor for dropped \=0D
+               network packets"=0D
+                   =0D
+HOMEPAGE =3D "https://github.com/nhorman/dropwatch/"=0D
+LICENSE =3D "GPLv2+"=0D
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50=
a"=0D
+DEPENDS =3D "libnl readline libpcap binutils"=0D
+=0D
+PV =3D "1.0.0"=0D
+=0D
+SRC_URI =3D "git://github.com/nhorman/dropwatch/;branch=3Dmaster;protocol=
=3Dhttps"=0D
+SRCREV =3D "853457b77dbc3d6665a379f3fe31ec53f11b6f61"=0D
+=0D
+S =3D "${WORKDIR}/git"=0D
+=0D
+inherit autotools pkgconfig gettext=0D
+=0D
+BBCLASSEXTEND =3D "native nativesdk"=0D
--=20
2.25.1


