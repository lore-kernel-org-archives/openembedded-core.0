Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 76FB4794DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 08:00:23 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1g2tsu-0005TZ-QF from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2018 01:00:24 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Thu, 20 Sep 2018 09:00:20 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1320.000; Thu, 20 Sep 2018 09:00:20 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] glibc-package.inc: correct intention for
	deleting /usr/lib as needed
Thread-Index: AQHUTzrReK7EozvamEuUEKOJij+4eaT40Wdy
Date: Thu, 20 Sep 2018 08:00:20 +0000
Message-ID: <1537430416414.88965@mentor.com>
References: <1537266969204.31967@mentor.com>
In-Reply-To: <1537266969204.31967@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.94.31.225]
MIME-Version: 1.0
Subject: Re: [PATCH] glibc-package.inc: correct intention for deleting /usr/lib as needed
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
X-List-Received-Date: Thu, 20 Sep 2018 08:00:23 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_153743041641488965mentorcom_"

--_000_153743041641488965mentorcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping!


BR,
Awais
________________________________
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Belal, Awais
Sent: Tuesday, September 18, 2018 3:36 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] glibc-package.inc: correct intention for deletin=
g /usr/lib as needed


In case the baselib is lib64 we would want to delete /usr/lib
after removing the /usr/lib/locale dir and the implementation
wanted to do that earlier as well but the fault was checking
an already removed dir (/usr/lib/locale) before trying to
remove /usr/lib as that check would always fail.
Now we simply try to delete /usr/lib after deleting
/usr/lib/locale to make sure it deletes cleanly and is empty
at the time of deletion.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc
index 9ea41b7..22a59d2 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -207,11 +207,10 @@ do_poststash_install_cleanup () {
     rm -rf ${D}/${localedir}
     rm -rf ${D}${datadir}/locale
     if [ "${libdir}" !=3D "${exec_prefix}/lib" ]; then
-        if [ -d ${D}${exec_prefix}/lib/locale ] ; then
-            rm -rf ${D}${exec_prefix}/lib/locale
-            # error out if directory isn't empty
-            rm -f ${D}${exec_prefix}/lib
-        fi
+        # error out if directory isn't empty
+        # this dir should only contain locale dir
+        # which has been deleted in the previous step
+        rmdir ${D}${exec_prefix}/lib
     fi
 }
 addtask do_poststash_install_cleanup after do_stash_locale do_install befo=
re do_populate_sysroot do_package
--
2.7.4


--_000_153743041641488965mentorcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} p=0A=
	{margin-top:0;=0A=
	margin-bottom:0}--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:10pt;color:#000000;background-color:#F=
FFFFF;font-family:Tahoma,Geneva,sans-serif;">
<p>ping!<br>
</p>
<p><br>
</p>
<div id=3D"Signature">
<div style=3D"font-family:Tahoma; font-size:13px"><font face=3D"Tahoma"></f=
ont>
<div style=3D"font-size:13px">
<div><font size=3D"2" face=3D"Tahoma"><span lang=3D"en-US">
<div style=3D"margin:0">BR,</div>
<div style=3D"margin:0"><i>Awais</i></div>
</span></font></div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
<div dir=3D"ltr" style=3D"font-size:10pt; color:#000000; background-color:#=
FFFFFF; font-family:Tahoma,Geneva,sans-serif">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> openembedded-core-b=
ounces@lists.openembedded.org &lt;openembedded-core-bounces@lists.openembed=
ded.org&gt; on behalf of Belal, Awais<br>
<b>Sent:</b> Tuesday, September 18, 2018 3:36 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> [OE-core] [PATCH] glibc-package.inc: correct intention for =
deleting /usr/lib as needed</font>
<div>&nbsp;</div>
</div>
<div>
<p>In case the baselib is lib64 we would want to delete /usr/lib<br>
after removing the /usr/lib/locale dir and the implementation<br>
wanted to do that earlier as well but the fault was checking<br>
an already removed dir (/usr/lib/locale) before trying to<br>
remove /usr/lib as that check would always fail.<br>
Now we simply try to delete /usr/lib after deleting<br>
/usr/lib/locale to make sure it deletes cleanly and is empty<br>
at the time of deletion.<br>
<br>
Signed-off-by: Awais Belal &lt;awais_belal@mentor.com&gt;<br>
---<br>
&nbsp;meta/recipes-core/glibc/glibc-package.inc | 9 &#43;&#43;&#43;&#43;---=
--<br>
&nbsp;1 file changed, 4 insertions(&#43;), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc<br>
index 9ea41b7..22a59d2 100644<br>
--- a/meta/recipes-core/glibc/glibc-package.inc<br>
&#43;&#43;&#43; b/meta/recipes-core/glibc/glibc-package.inc<br>
@@ -207,11 &#43;207,10 @@ do_poststash_install_cleanup () {<br>
&nbsp;&nbsp;&nbsp; &nbsp;rm -rf ${D}/${localedir}<br>
&nbsp;&nbsp;&nbsp; &nbsp;rm -rf ${D}${datadir}/locale<br>
&nbsp;&nbsp;&nbsp; &nbsp;if [ &quot;${libdir}&quot; !=3D &quot;${exec_prefi=
x}/lib&quot; ]; then<br>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if [ -d ${D}${exec_prefix}/lib/local=
e ] ; then<br>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;rm -rf ${D}${exec=
_prefix}/lib/locale<br>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# error out if di=
rectory isn't empty<br>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;rm -f ${D}${exec_=
prefix}/lib<br>
-&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;fi<br>
&#43;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# error out if directory isn't e=
mpty<br>
&#43;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# this dir should only contain l=
ocale dir<br>
&#43;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# which has been deleted in the =
previous step<br>
&#43;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;rmdir ${D}${exec_prefix}/lib<br>
&nbsp;&nbsp;&nbsp; &nbsp;fi<br>
&nbsp;}<br>
&nbsp;addtask do_poststash_install_cleanup after do_stash_locale do_install=
 before do_populate_sysroot do_package<br>
-- <br>
2.7.4<font size=3D"2" face=3D"Tahoma"><span lang=3D"en-US"></span></font></=
p>
<font size=3D"2" face=3D"Tahoma">
<div style=3D"margin:0"><i><br>
</i></div>
</font>
<p></p>
<div id=3D"Signature">
<div style=3D"font-family:Tahoma; font-size:13px">
<div style=3D"font-size:13px">
<div><font size=3D"2" face=3D"Tahoma"><span lang=3D"en-US"></span></font></=
div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
</div>
</div>
</body>
</html>

--_000_153743041641488965mentorcom_--
