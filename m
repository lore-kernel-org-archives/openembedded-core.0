Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCE3C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 10:34:18 +0000 (UTC)
Received: from gainsboro.ash.relay.mailchannels.net (gainsboro.ash.relay.mailchannels.net [23.83.222.65])
 by mx.groups.io with SMTP id smtpd.web10.7813.1740652455926386255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 02:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=so1Xid3H;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.65, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EBEFF812D2;
	Thu, 27 Feb 2025 10:34:14 +0000 (UTC)
Received: from uk-fast-smtpout3.hostinger.io (100-101-191-136.trex-nlb.outbound.svc.cluster.local [100.101.191.136])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 229738276A;
	Thu, 27 Feb 2025 10:34:13 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1740652454; a=rsa-sha256;
	cv=none;
	b=71GIKpDlkqF7Y0XVFEOtaCn3hYzUEvJn3ct5BSepMyzydcenyW785iGkmB/Qr+IR7LfPip
	WgYqJ/F2+lxgjz749LOwY+62RF1MnHL/FT5bnUDqrMa+LV20L73c+s7U3nc0HCV96ia3xE
	DyZLHaCDwW2G8vZzKz1OEa1jYlboJ0cHS7Z6NjqdRWf2EfEF1IJMDWYBkw0qi2I3UmcORp
	909/2ET0JOy2ZwtG1Xpt8PLh82pSLWFtxCyeA8GKpA0vodV0/E/c2lMwt88WqErXEEnFO0
	NC68vzooY9WCt5v020ik1KxGRRSDuunR/cu4LIcytJcOpcCplmo70zJ2rf389Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1740652454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=86muFhEfAZ8Wvr+mA9wZx1t+Tis9Z9YAGzitwd8EBsg=;
	b=ceoXhfkIQV1nEFtV/usylgvW90tri31SjyjkyUYOBzGhw2LWtIjW9Qt6rBjRq49VrxD/Ko
	07Mm+Can8l7+JcIo0CFfqdhuPu74D1nKFBoUY/MRpDpNEpi0Hhnzy3gugB8vtPTI6iyw9U
	gbIufoCGShBl8A5b9L3+lEHnsz62+s+wEaytw/6LaEf2/iN5/5GnfVvq6I/6NwCpNsQxe1
	2fpk2tTubm0QnHDFVz/y7iIk67XFq3LG1+VLIYsH5gc6PckXGaa2TiRJfqGe6mZmBc2vOr
	Tgs6+kqkY7zIdYYwvAs8Fn000Xm3vOv0e8W7rKZXXNYx4+laEJtPG2yeR8aMUQ==
ARC-Authentication-Results: i=1;
	rspamd-79f778f6bc-hjhz8;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Left-Abaft: 6f74a2657a59ac5c_1740652454847_1928489644
X-MC-Loop-Signature: 1740652454847:3451504731
X-MC-Ingress-Time: 1740652454847
Received: from uk-fast-smtpout3.hostinger.io (uk-fast-smtpout3.hostinger.io
 [31.220.23.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.191.136 (trex/7.0.2);
	Thu, 27 Feb 2025 10:34:14 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4448:6b00:c2a9:bda:534a:ee2c])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4Z3SPb6gKGz2mRcB;
	Thu, 27 Feb 2025 10:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1740652452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=86muFhEfAZ8Wvr+mA9wZx1t+Tis9Z9YAGzitwd8EBsg=;
	b=so1Xid3Hc27z/UqYEuDS1VrDsMeZvEhjGDprv0qsInWIjU7MCoYKoDX2p9s1RynddQdNLO
	j7QIzRtKlr3SUnNYIltD3GhWlRV4kZug+5JjOUVNjk3I4GyQG1/B44m4u08Rsm3JTDAB23
	RvRyc/utYe7lM9PvEI3Piss4DF5oJ00ArYGBBqwO/h9jLjAPxP6yurhblJifB9tCWEY6WZ
	zYNDOljaWw3zbGQfqMDz4KrNMGqgcFTIRdxDcKbCkgdmFrTg/c462EcCGqBDK9cN5XYI+l
	a9635r9CiMEAWrgSenp1cKJhWwlQfaKRbI7seqvvRL1o54KEsfWRld58gxHVTg==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] flac: upgrade 1.4.3 -> 1.5.0
Message-ID: <20250227103351.1990659-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Thu, 27 Feb 2025 10:34:11 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=e9hUSrp/ c=1 sm=1 tr=0 ts=67c03fa4 a=sBaagUX7BYkVqaEG18cHKQ==:617 a=xqWC_Br6kY4A:10 a=L2IpWlmwAAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=a_U1oVfrAAAA:8 a=EmWJtHjwtAFnG3jJ4mMA:9 a=yxSZtuE-OvTTNxukw10G:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfPntieZ+5sirEuVQJdEaz0obuSmGPFZiordL9omNxldpOgXKe94ct2gy0yuXbQeHxb+X9+ZFQEIXjA8NFce5hRMUnyijKbM4yuAvcG9OrmdhNQAAfWt/ j/UrE7fWPtVIKlc2Zss4s+x3dyLnGyoEVd8oNjG4ra68P/4bEs/00cuLSSKnYoeYBHL5NtS9GD11jbYar2a1fJwWFEZom5cqvbY5N8p+8vqp/Z2dELGMD+lJ pmert6YZaDqmiAZKNS3F+k3ClF6bAW0rllCjhvkKLTygCP8dZDwmOa3KEqwOZLTf/2thFSLZS3RgA0YZ0G85kw/A0aIo+0Y2h9i9i4UwYetgmfyzvBTUikXP eAM09WztKMWIAUbV2MHXXWDmhJFSdQtpOQN7dT+HFAi2LOjTvKY=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 10:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211987

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

License-Update: GFDL 1.2 -> 1.3, copyright years update

Remove the do_install additional code fixing absolute paths
in doc files. Such files are no longer created on 1.5.0.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
CC: Peter Marko <peter.marko@siemens.com>
---
 .../flac/{flac_1.4.3.bb =3D> flac_1.5.0.bb}     | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.4.3.bb =3D> flac_1.5.0.bb} (=
61%)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.3.bb b/meta/recipes-mu=
ltimedia/flac/flac_1.5.0.bb
similarity index 61%
rename from meta/recipes-multimedia/flac/flac_1.4.3.bb
rename to meta/recipes-multimedia/flac/flac_1.5.0.bb
index 87b67bee1f..ce86779ff8 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -3,17 +3,18 @@ DESCRIPTION =3D "FLAC stands for Free Lossless Audio Co=
dec, a lossless audio compr
 HOMEPAGE =3D "https://xiph.org/flac/"
 BUGTRACKER =3D "https://github.com/xiph/flac/issues"
 SECTION =3D "libs"
-LICENSE =3D "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Cla=
use"
-LIC_FILES_CHKSUM =3D "file://COPYING.FDL;md5=3Dad1419ecc56e060eccf8184a8=
7c4285f \
-                    file://src/Makefile.am;beginline=3D1;endline=3D17;md=
5=3Db1dab2704be7f01bfbd9b7f6d5f000a9 \
+LICENSE =3D "GFDL-1.3 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Cla=
use"
+LIC_FILES_CHKSUM =3D "file://COPYING.FDL;md5=3D802e79e394e372d01e863e3f4=
058cf40 \
+                    file://src/Makefile.am;beginline=3D1;endline=3D17;md=
5=3D9c882153132df8f3a1cb1a8ca1f2350f \
                     file://COPYING.GPL;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
-                    file://src/flac/main.c;beginline=3D1;endline=3D18;md=
5=3D23099119c034d894bd1bf7ef5bd22101 \
+                    file://src/flac/main.c;beginline=3D1;endline=3D18;md=
5=3D1e826b5083ba1e028852fe7ceec6a8ad \
                     file://COPYING.LGPL;md5=3Dfbc093901857fcd118f065f900=
982c24 \
-                    file://COPYING.Xiph;md5=3D0c90e41ab2fa7e69ca9391330d=
870221 \
-                    file://include/FLAC/all.h;beginline=3D65;endline=3D7=
0;md5=3D39aaf5e03c7364363884c8b8ddda8eea"
+                    file://COPYING.Xiph;md5=3D78a131b2ea50675d245d280ccc=
34f8b6 \
+                    file://include/FLAC/all.h;beginline=3D65;endline=3D7=
0;md5=3D39aaf5e03c7364363884c8b8ddda8eea \
+                    "
=20
 SRC_URI =3D "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "6c58e69cd22348f441b861092b825e591d0b822e106de6eb=
0ee4d05d27205b70"
+SRC_URI[sha256sum] =3D "f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03=
fd88630485c2b920"
=20
 CVE_PRODUCT =3D "libflac flac"
=20
@@ -34,10 +35,3 @@ PACKAGES +=3D "libflac libflac++"
 FILES:${PN} =3D "${bindir}/*"
 FILES:libflac =3D "${libdir}/libFLAC.so.*"
 FILES:libflac++ =3D "${libdir}/libFLAC++.so.*"
-
-do_install:append() {
-    # make the links in documentation relative to avoid buildpaths repro=
ducibility problem
-    sed -i "s#${S}/include#${includedir}#g" ${D}${docdir}/flac/FLAC.tag =
${D}${docdir}/flac/api/*.html
-    # there is also one root path without trailing slash
-    sed -i "s#${S}#/#g" ${D}${docdir}/flac/api/*.html
-}

