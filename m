Return-Path: <ulf.magnusson@bmw-carit.de>
X-Greylist: delayed 325 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Apr 2016 10:58:59 UTC
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCAC73257
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 10:58:59 +0000 (UTC)
Received: from ulm-dc01.bmw-carit.intra ([172.20.0.50]:49086
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Ulf.Magnusson@bmw-carit.de>)
	id 1alwho-0003G6-07 for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2016 12:53:32 +0200
Received: from ULM-DC01.bmw-carit.intra ([fe80::d6c:bfcc:5f:52a5]) by
	ULM-DC01.bmw-carit.intra ([fe80::d6c:bfcc:5f:52a5%13]) with mapi id
	14.03.0123.003; Fri, 1 Apr 2016 12:53:31 +0200
X-CTCH-RefID: str=0001.0A0C0203.56FE532C.009C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Ulf Magnusson <Ulf.Magnusson@bmw-carit.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] classes/packagegroup: Refactor code to be simpler
Thread-Index: AdGMBLqx4eOMvAk1ShibHQ//Kp8vCQ==
Date: Fri, 1 Apr 2016 10:53:31 +0000
Message-ID: <A63F55F218E7884EB1B20D0E0B5927D1608B9BE2@ULM-DC01.bmw-carit.intra>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.242.6.42]
MIME-Version: 1.0
Subject: [PATCH] classes/packagegroup: Refactor code to be simpler
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
X-List-Received-Date: Fri, 01 Apr 2016 10:59:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A63F55F218E7884EB1B20D0E0B5927D1608B9BE2ULMDC01bmwcarit_"

--_000_A63F55F218E7884EB1B20D0E0B5927D1608B9BE2ULMDC01bmwcarit_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This was originally going to be a fix for ALLOW_EMPTY not being set on
complementary package groups, but that was already fixed by
d96ea299b3b5a44b1959 (classes/packagegroup: fix dbg/dev/ptest
complementary packages).

Since I also spent some time refactoring the code, I'll submit a patch
(against the latest version) anyway. This version should be a bit
shorter and more readable.
---
 meta/classes/packagegroup.bbclass | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.=
bbclass
index d56248f..ee7a22d 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -22,19 +22,15 @@ inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPAN=
DED', True) =3D=3D 'all', 'al
 # Also mark all packages as ALLOW_EMPTY
 python () {
     packages =3D d.getVar('PACKAGES', True).split()
-    for pkg in packages:
-        d.setVar("ALLOW_EMPTY_%s" % pkg, "1")
     if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY', True) !=3D '1':
-        # Add complementary packagegroups
-        genpackages =3D []
-        complementary_types =3D ['-dbg', '-dev']
+        types =3D ['', '-dbg', '-dev']
         if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
-            complementary_types.append('-ptest')
-        for pkg in packages:
-            for postfix in complementary_types:
-                genpackages.append(pkg+postfix)
-                d.setVar("ALLOW_EMPTY_%s" % pkg+postfix, "1")
-        d.setVar('PACKAGES', ' '.join(packages+genpackages))
+            types.append('-ptest')
+        packages =3D [pkg + suffix for pkg in packages
+                    for suffix in types]
+        d.setVar('PACKAGES', ' '.join(packages))
+    for pkg in packages:
+        d.setVar('ALLOW_EMPTY_%s' % pkg, '1')
 }

 # We don't want to look at shared library dependencies for the
--
2.1.4


--_000_A63F55F218E7884EB1B20D0E0B5927D1608B9BE2ULMDC01bmwcarit_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">This was originally going to be a fix for ALLOW_EMPTY not being set =
on<br>
complementary package groups, but that was already fixed by<br>
d96ea299b3b5a44b1959 (classes/packagegroup: fix dbg/dev/ptest<br>
complementary packages).<br>
<br>
Since I also spent some time refactoring the code, I'll submit a patch<br>
(against the latest version) anyway. This version should be a bit<br>
shorter and more readable.<br>
---<br>
&nbsp;meta/classes/packagegroup.bbclass | 18 &#43;&#43;&#43;&#43;&#43;&#43;=
&#43;-----------<br>
&nbsp;1 file changed, 7 insertions(&#43;), 11 deletions(-)<br>
<br>
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.=
bbclass<br>
index d56248f..ee7a22d 100644<br>
--- a/meta/classes/packagegroup.bbclass<br>
&#43;&#43;&#43; b/meta/classes/packagegroup.bbclass<br>
@@ -22,19 &#43;22,15 @@ inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_E=
XPANDED', True) =3D=3D 'all', 'al<br>
&nbsp;# Also mark all packages as ALLOW_EMPTY<br>
&nbsp;python () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; packages =3D d.getVar('PACKAGES', True).split()<br=
>
-&nbsp;&nbsp;&nbsp; for pkg in packages:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.setVar(&quot;ALLOW_EMPTY_%s&q=
uot; % pkg, &quot;1&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp; if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY', =
True) !=3D '1':<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Add complementary packagegrou=
ps<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; genpackages =3D []<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; complementary_types =3D ['-dbg'=
, '-dev']<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; types =3D ['', '-dbg', '-de=
v']<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if bb.utils.contains('DIST=
RO_FEATURES', 'ptest', True, False, d):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; complem=
entary_types.append('-ptest')<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pkg in packages:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pos=
tfix in complementary_types:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; genpackages.append(pkg&#43;postfix)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; d.setVar(&quot;ALLOW_EMPTY_%s&quot; % pkg&#43;postfix, &qu=
ot;1&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('PACKAGES', ' '.join(p=
ackages&#43;genpackages))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; typ=
es.append('-ptest')<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; packages =3D [pkg &#43; suf=
fix for pkg in packages<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for suffix in types]<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('PACKAGES', ' '.jo=
in(packages))<br>
&#43;&nbsp;&nbsp;&nbsp; for pkg in packages:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('ALLOW_EMPTY_%s' %=
 pkg, '1')<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# We don't want to look at shared library dependencies for the<br>
-- <br>
2.1.4<br>
<br>
</div>
</body>
</html>

--_000_A63F55F218E7884EB1B20D0E0B5927D1608B9BE2ULMDC01bmwcarit_--
