Return-Path: <andre.rosa@lge.com>
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	by mail.openembedded.org (Postfix) with ESMTP id D48817D297
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Apr 2019 01:28:26 +0000 (UTC)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 6 Apr 2019 10:28:27 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: andre.rosa@lge.com
Received: from unknown (HELO LGSVL-EXC02.lgsvl.net) (10.195.253.63)
	by 156.147.1.126 with ESMTP; 6 Apr 2019 10:28:26 +0900
X-Original-SENDERIP: 10.195.253.63
X-Original-MAILFROM: andre.rosa@lge.com
Received: from LGSVL-EXC01.lgsvl.net (10.195.253.62) by LGSVL-EXC02.lgsvl.net
	(10.195.253.63) with Microsoft SMTP Server (TLS) id 15.0.1044.25;
	Fri, 5 Apr 2019 18:28:25 -0700
Received: from LGSVL-EXC01.lgsvl.net ([10.195.253.62]) by
	LGSVL-EXC01.lgsvl.net ([10.195.253.62]) with mapi id 15.00.1044.021;
	Fri, 5 Apr 2019 18:28:25 -0700
From: andre.rosa <andre.rosa@lge.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] Make prune_suffix prune a suffix
Thread-Index: AQHU7A1EPZO/DQKFNUWP2cxURXI4DaYuQpvQgAAVRwA=
Date: Sat, 6 Apr 2019 01:28:25 +0000
Message-ID: <fbb65e3f8eab4b85b140fc74a150da60@LGSVL-EXC01.lgsvl.net>
References: <20190406001120.20309-1-andre.rosa@lge.com> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.192.223.164]
MIME-Version: 1.0
Subject: [PATCH] Make prune_suffix prune a suffix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Apr 2019 01:28:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Andre Rosa <andre.rosa@lge.com>

... instead of replacing a substring that could happen more than once and n=
ot only when it ends with it. Do the same for the prefix.

See related https://github.com/openembedded/bitbake/pull/24 . There it stop=
s replacing sufixes once first one is matched but not here.

Signed-off-by: Andre Rosa <andre.rosa@lge.com>
---
 meta/lib/oe/utils.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py index cedd053d36..=
a4fd79ccb2 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -78,12 +78,12 @@ def prune_suffix(var, suffixes, d):
     # See if var ends with any of the suffixes listed and
     # remove it if found
     for suffix in suffixes:
-        if var.endswith(suffix):
-            var =3D var.replace(suffix, "")
+        if suffix and var.endswith(suffix):
+            var =3D var[:-len(suffix)]
=20
     prefix =3D d.getVar("MLPREFIX")
     if prefix and var.startswith(prefix):
-        var =3D var.replace(prefix, "")
+        var =3D var[len(prefix):]
=20
     return var
=20
--
2.20.1.519.g8feddda32c


