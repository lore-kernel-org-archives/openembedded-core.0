Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2790AC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 21:07:57 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web12.49.1657746468295259790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 14:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DYjPRRyA;
 spf=pass (domain: email.de, ip: 212.227.15.4,
 mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1657746465;
	bh=Po5q+MuheCVcFcVz93U7y/k2yM3Q7oFrj444kNNsHj8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=DYjPRRyAqmeK+TxaD62o+lG4XhIjUX8RoTLH+0k1cxnPp0cuVdTIgMxQqqb0wLq4M
	 wC4tlB9iQLXdxJub1Hp9Gluer/4jFdH4U/t5ByUeN/mOB3VjoDWLXhPely82s0m8vO
	 UmXmZmCjxyDAPGAPtl76Ennt1mZOq081Bbeqi1PA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from XTR-ACUYOCTO-P01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1N6bD0-1nURtX3JBW-017spf; Wed, 13 Jul 2022 23:07:45 +0200
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH v3] package.bbclass: Avoid stripping signed kernel modules in
 splitdebuginfo
Date: Wed, 13 Jul 2022 23:07:23 +0200
Message-Id: <20220713210723.29442-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:jLBujgDx/DLbW82zhWFrF9w7QTSUohUu0ODUHbNVO7KODqJ1pOQ
 GCq4eDfqMugU9k50rT2GNM3c9UphsRJ7D3OePpGuZwucD8fCqTbsoz6agFOAO1ReQy4oZBu
 LYWU4XHCesjaKA02r6oKNnx/5DZ2FLbMX2caq21T+rEguXPkUT1CAy5JHEdSqQDFCLvcomv
 njJTw18C6BXpPKFwhu4Kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JHZr+uXH3Ts=:mYpqtbHs+7KxaERKAB0Nj8
 0poQz/kf7ZaFogR5cIHhY9dIGHktLLvr7Sbm5vYOia/+Qj4xKBlIKNF4LPOIsZTcmTI9Os6nF
 VOUpbjnQ1qPgTOB/8K/lxZx//B5W7P9VOzCB0QTH7qP+b66JyB6Kvc/9LBQjWPH8UnEkRmIAZ
 fHpXkDF+23T7a4gG6w40nt48stb7QiUUzigF84U72Nai61X4Mn+4c+Wz/xSj75bcSrWDLjnBn
 gtvO/I/ZOBChmZ53ss74EYvg44AYWLpQAll6JxY2oD5RVH8/fAtXwKQ2jcuA9xsKmz5kF1sLj
 4a6qZbBaDKNHoDNdtJmy7JRJdzFzHjvkBN7tKJZdzN8G+s7eolVk9uTzEixLxUG1H3uK0giNk
 Zrje3o1xCwrT0Ws5DuJT4YpD5nfQln9v5Xs3ll6UjEtra+BuPxKZdweFUoXBVs6TgKKzyUJ2p
 A3YMn2iOY1POXCjmN9hmy04pntX9Lf1PhO41AJdQTdUM0B4Ml1Sg8IsOy7I65DXa55pMeV9fz
 hcs7Gmx39+8sujMpfgj3RWW1ZRhbSvnS/f4fFvI3HdJiobRTJAvHj00/YcOG3famIEXL/D/bR
 nqLzOAooMPo13r5Aunn0TnEnX40p2qsPsxrGXGG3b1N1Uc14H0z6bW/UkID31SGAj5IW5qxS2
 kDmbL5a0s8TxPUY88+d96ejxfla4jM5SOCVqRmpiLTu5BTeBRIvZ0P03XmazVC/wPj2IWQKQa
 ozIx5soNsel9wGk3IsM9YWZreZwhgCehJh8FlnIwfscDsYpQjMJZmUSg3g4ya8JkE7xs2wZgi
 nU46s3sVCq11DthqdkXeN1re5YxuKFO2oIe/CsrSqXdIpEU5GicN80yyTxsOYXwumTO61XlDk
 FkVTczrDh/MuZ8e9077hDVFu2BTZpdriDQY6zwh+81rVylRPVYlueiljIZkh+2/l+SSYb62Jy
 1Te0GV07TlcjxdwzQBqrTRJG2AWcKH8acEBs58ywAQ8ADsLXgHtCWqNWWFD1po4V2/ZSsuiF3
 6aTXF1RkH4i6Rf/sk6HCzJax75VNJpWK/fkYhSrTlTeNbHji3CB1/h3MOEFsxyC9zsrRulgwB
 nJ7d9wiynmV0zX9CCMO66V28q7uP+YSTZzJIwE+hFSnlWWj/dZd1x8/tw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 21:07:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167990

From: Christoph Lauer <christoph.lauer@xtronic.de>

Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules are s=
tripped by the functions 'runstrip' and 'splitdebuginfo'. Signed modules m=
ust not be stripped. Function 'runstrip' avoids this by running is_kernel_=
module_signed. Apply the same check to splitdebuginfo.

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta/classes/package.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4850134022..63887b34f8 100644
=2D-- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -382,6 +382,11 @@ def splitdebuginfo(file, dvar, dv, d):
     debugfile =3D dvar + dest
     sources =3D []

+    if file.endswith(".ko") and file.find("/lib/modules/") !=3D -1:
+        if oe.package.is_kernel_module_signed(file):
+            bb.debug(1, "Skip strip on signed module %s" % file)
+            return (file, sources)
+
     # Split the file...
     bb.utils.mkdirhier(os.path.dirname(debugfile))
     #bb.note("Split %s -> %s" % (file, debugfile))
=2D-
2.17.1


