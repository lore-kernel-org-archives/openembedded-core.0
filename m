Return-Path: <Rob.Walton@arm.com>
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20067.outbound.protection.outlook.com [40.107.2.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA937E33A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector2-armh-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7uM28+Ea7ZxWzzehJkmqopyLpagKl7eppVb2K2sl7kU=;
	b=5h/SWNT6yQ+2dEM9qWCAT3M7/GhIq7t789O1G13+nZOpJpNHEIVtIS+ebYEXd1yFw9c9RxCsUbkeM6GtAnhx7Am7Diin+DHF7r9QOKEjkmC6ZSc6yUhZ3+Dmo/W3TsRNDbXtYEPKeGaZLcHknJjkR7JsNkW80OmR2V1iXNbGg8g=
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com (20.177.199.158) by
	AM6PR08MB3944.eurprd08.prod.outlook.com (20.179.0.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.22; Wed, 29 May 2019 10:50:03 +0000
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f]) by AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::380e:bc71:e3ba:95f%6]) with mapi id 15.20.1943.016;
	Wed, 29 May 2019 10:50:03 +0000
From: Rob Walton <Rob.Walton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/2] image_license.bbclass: Write JSON files containing
	license data.
Thread-Index: AQHVEJwbiV1SZfIUw0K8X84e11xKY6aB9zmr
Date: Wed, 29 May 2019 10:50:03 +0000
Message-ID: <AM6PR08MB3685ED6FCF14AAFB6099B124951F0@AM6PR08MB3685.eurprd08.prod.outlook.com>
References: <1558529060-79451-1-git-send-email-rob.walton@arm.com>
In-Reply-To: <1558529060-79451-1-git-send-email-rob.walton@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rob.Walton@arm.com; 
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a69fea78-b0d7-4ea8-85e7-08d6e4236792
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:AM6PR08MB3944; 
x-ms-traffictypediagnostic: AM6PR08MB3944:
x-microsoft-antispam-prvs: <AM6PR08MB39445CC8E34126B6F254A4D8951F0@AM6PR08MB3944.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(376002)(366004)(396003)(346002)(39860400002)(189003)(199004)(40434004)(81156014)(8676002)(7696005)(6246003)(76176011)(68736007)(186003)(33656002)(316002)(6116002)(66066001)(6436002)(476003)(99286004)(229853002)(26005)(6606003)(3846002)(25786009)(11346002)(2906002)(71200400001)(81166006)(486006)(71190400001)(446003)(86362001)(66446008)(64756008)(7736002)(478600001)(91956017)(73956011)(66556008)(66476007)(74316002)(66946007)(76116006)(5660300002)(55016002)(54896002)(9686003)(5024004)(53936002)(8936002)(19627405001)(72206003)(102836004)(2501003)(14444005)(14454004)(256004)(2351001)(53546011)(6506007)(6916009)(52536014)(5640700003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3944;
	H:AM6PR08MB3685.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mSC3zJB8Fflj4gGw23SwM2T4qU1Ys1Rno4BzTsMbzVVYvY0iVuM/zYC4ns4LRYbuQ4/+Di50C1cK7sxmbQnemYQFak1cqK+TVHbf8R9wBTdjWtNZ6iIAytHux4kS6WnEe0YolOozhVjaGRaTOE2/kVTD3t+DABGf/zxKOv6wNjYJd87y/H7b4naMM4qY8c0jHx2LQfgnVi+BsUhhOqrKBRTTpYdju8md++9aqi9WBBLf3T/0w8wtVg1FcJy/VcmORiaeGsmZR6YhYn2DF65JBkP6QBX3k3HrDHKy78vs/LF4u1pVtohgYewf5CUVmj9ILyJRbzoced1HcShCuzZJr0x+i3FAcVoZswbileZUF+QYtTVD3vqEr0xmUZSfxEo0FYwLGPsrHVP7sB/KDYYlsmpwnnK9WBuwpm8SyWQ9K8w=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69fea78-b0d7-4ea8-85e7-08d6e4236792
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 10:50:03.0258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rob.Walton@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3944
Subject: Re: [PATCH 1/2] image_license.bbclass: Write JSON files containing license data.
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
X-List-Received-Date: Thu, 30 May 2019 05:25:07 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3685ED6FCF14AAFB6099B124951F0AM6PR08MB3685eurp_"

--_000_AM6PR08MB3685ED6FCF14AAFB6099B124951F0AM6PR08MB3685eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Requesting review. Thanks.

________________________________
From: Rob Walton
Sent: 22 May 2019 13:44:33
To: openembedded-core@lists.openembedded.org
Cc: Rob Walton
Subject: [PATCH 1/2] image_license.bbclass: Write JSON files containing lic=
ense data.

For easier machine readability of license manifests, write a
manifest.json containing license data and package info.

Signed-off-by: Rob Walton <rob.walton@arm.com>
---
 meta/classes/license_image.bbclass | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_imag=
e.bbclass
index 6750038..6952417 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -36,6 +36,7 @@ python license_create_manifest() {
 }

 def write_license_files(d, license_manifest, pkg_dic, rootfs=3DTrue):
+    import json
     import re
     import stat

@@ -43,6 +44,7 @@ def write_license_files(d, license_manifest, pkg_dic, roo=
tfs=3DTrue):
     bad_licenses =3D map(lambda l: canonical_license(d, l), bad_licenses)
     bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)

+    json_data =3D dict()
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
             if bad_licenses:
@@ -63,7 +65,14 @@ def write_license_files(d, license_manifest, pkg_dic, ro=
otfs=3DTrue):
                 license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg][=
"PV"])
                 license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"=
])
                 license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICEN=
SE"])
-
+                json_data[pkg] =3D {
+                    "RECIPE NAME": pkg_dic[pkg]["PN"],
+                    "PACKAGE VERSION": pkg_dic[pkg]["PV"],
+                    "PACKAGE NAME": pkg,
+                    "LICENSE": pkg_dic[pkg]["LICENSE"],
+                    "HOMEPAGE": pkg_dic[pkg].get("HOMEPAGE", ""),
+                    "SUMMARY": pkg_dic[pkg].get("SUMMARY", ""),
+                    }
                 # If the package doesn't contain any file, that is, its si=
ze is 0, the license
                 # isn't relevant as far as the final image is concerned. S=
o doing license check
                 # doesn't make much sense, skip it.
@@ -75,6 +84,14 @@ def write_license_files(d, license_manifest, pkg_dic, ro=
otfs=3DTrue):
                 license_file.write("VERSION: %s\n" % pkg_dic[pkg]["PV"])
                 license_file.write("LICENSE: %s\n" % pkg_dic[pkg]["LICENSE=
"])
                 license_file.write("FILES: %s\n\n" % pkg_dic[pkg]["FILES"]=
)
+                json_data[pkg] =3D {
+                    "RECIPE NAME": pkg_dic[pkg]["PN"],
+                    "VERSION": pkg_dic[pkg]["PV"],
+                    "FILES": pkg_dic[pkg]["FILES"],
+                    "LICENSE": pkg_dic[pkg]["LICENSE"],
+                    "HOMEPAGE": pkg_dic[pkg].get("HOMEPAGE", ""),
+                    "SUMMARY": pkg_dic[pkg].get("SUMMARY", ""),
+                    }

             for lic in pkg_dic[pkg]["LICENSES"]:
                 lic_file =3D os.path.join(d.getVar('LICENSE_DIRECTORY'),
@@ -89,6 +106,10 @@ def write_license_files(d, license_manifest, pkg_dic, r=
ootfs=3DTrue):
                             "licenses collected for recipe %s"
                             % (lic, pkg_dic[pkg]["PN"]))

+    # Write a json file containing the license data.
+    with open("{}.json".format(license_manifest), "w") as license_file_jso=
n:
+        license_file_json.write(json.dumps(json_data))
+
     # Two options here:
     # - Just copy the manifest
     # - Copy the manifest and the license directories
--
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AM6PR08MB3685ED6FCF14AAFB6099B124951F0AM6PR08MB3685eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Requesting review. Thanks.<br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Rob Walton<br>
<b>Sent:</b> 22 May 2019 13:44:33<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> Rob Walton<br>
<b>Subject:</b> [PATCH 1/2] image_license.bbclass: Write JSON files contain=
ing license data.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">For easier machine readability of license manifest=
s, write a<br>
manifest.json containing license data and package info.<br>
<br>
Signed-off-by: Rob Walton &lt;rob.walton@arm.com&gt;<br>
---<br>
&nbsp;meta/classes/license_image.bbclass | 23 &#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;-<br>
&nbsp;1 file changed, 22 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_imag=
e.bbclass<br>
index 6750038..6952417 100644<br>
--- a/meta/classes/license_image.bbclass<br>
&#43;&#43;&#43; b/meta/classes/license_image.bbclass<br>
@@ -36,6 &#43;36,7 @@ python license_create_manifest() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;def write_license_files(d, license_manifest, pkg_dic, rootfs=3DTrue):=
<br>
&#43;&nbsp;&nbsp;&nbsp; import json<br>
&nbsp;&nbsp;&nbsp;&nbsp; import re<br>
&nbsp;&nbsp;&nbsp;&nbsp; import stat<br>
&nbsp;<br>
@@ -43,6 &#43;44,7 @@ def write_license_files(d, license_manifest, pkg_dic,=
 rootfs=3DTrue):<br>
&nbsp;&nbsp;&nbsp;&nbsp; bad_licenses =3D map(lambda l: canonical_license(d=
, l), bad_licenses)<br>
&nbsp;&nbsp;&nbsp;&nbsp; bad_licenses =3D expand_wildcard_licenses(d, bad_l=
icenses)<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp; json_data =3D dict()<br>
&nbsp;&nbsp;&nbsp;&nbsp; with open(license_manifest, &quot;w&quot;) as lice=
nse_file:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pkg in sorted(pkg_dic)=
:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 bad_licenses:<br>
@@ -63,7 &#43;65,14 @@ def write_license_files(d, license_manifest, pkg_dic=
, rootfs=3DTrue):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; license_file.write(&quot;PACKAGE VERSION: %s\n&quot; =
% pkg_dic[pkg][&quot;PV&quot;])<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; license_file.write(&quot;RECIPE NAME: %s\n&quot; % pk=
g_dic[pkg][&quot;PN&quot;])<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; license_file.write(&quot;LICENSE: %s\n\n&quot; % pkg_=
dic[pkg][&quot;LICENSE&quot;])<br>
-<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; json_data[pkg] =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RECIPE NAME&quot;: pkg_d=
ic[pkg][&quot;PN&quot;],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PACKAGE VERSION&quot;: p=
kg_dic[pkg][&quot;PV&quot;],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PACKAGE NAME&quot;: pkg,=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;LICENSE&quot;: pkg_dic[p=
kg][&quot;LICENSE&quot;],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;HOMEPAGE&quot;: pkg_dic[=
pkg].get(&quot;HOMEPAGE&quot;, &quot;&quot;),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SUMMARY&quot;: pkg_dic[p=
kg].get(&quot;SUMMARY&quot;, &quot;&quot;),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # If the package doesn't contain any file, that is, i=
ts size is 0, the license<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # isn't relevant as far as the final image is concern=
ed. So doing license check<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # doesn't make much sense, skip it.<br>
@@ -75,6 &#43;84,14 @@ def write_license_files(d, license_manifest, pkg_dic=
, rootfs=3DTrue):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; license_file.write(&quot;VERSION: %s\n&quot; % pkg_di=
c[pkg][&quot;PV&quot;])<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; license_file.write(&quot;LICENSE: %s\n&quot; % pkg_di=
c[pkg][&quot;LICENSE&quot;])<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; license_file.write(&quot;FILES: %s\n\n&quot; % pkg_di=
c[pkg][&quot;FILES&quot;])<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; json_data[pkg] =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RECIPE NAME&quot;: pkg_d=
ic[pkg][&quot;PN&quot;],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;VERSION&quot;: pkg_dic[p=
kg][&quot;PV&quot;],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;FILES&quot;: pkg_dic[pkg=
][&quot;FILES&quot;],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;LICENSE&quot;: pkg_dic[p=
kg][&quot;LICENSE&quot;],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;HOMEPAGE&quot;: pkg_dic[=
pkg].get(&quot;HOMEPAGE&quot;, &quot;&quot;),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SUMMARY&quot;: pkg_dic[p=
kg].get(&quot;SUMMARY&quot;, &quot;&quot;),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r lic in pkg_dic[pkg][&quot;LICENSES&quot;]:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; lic_file =3D os.path.join(d.getVar('LICENSE_DIRECTORY=
'),<br>
@@ -89,6 &#43;106,10 @@ def write_license_files(d, license_manifest, pkg_di=
c, rootfs=3DTrue):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &quot;licenses collected for recipe %s&quot; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; % (lic, pkg_dic[pkg][&quot;PN&quot;]))<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp; # Write a json file containing the license data.<br=
>
&#43;&nbsp;&nbsp;&nbsp; with open(&quot;{}.json&quot;.format(license_manife=
st), &quot;w&quot;) as license_file_json:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; license_file_json.write(jso=
n.dumps(json_data))<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Two options here:<br>
&nbsp;&nbsp;&nbsp;&nbsp; # - Just copy the manifest<br>
&nbsp;&nbsp;&nbsp;&nbsp; # - Copy the manifest and the license directories<=
br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AM6PR08MB3685ED6FCF14AAFB6099B124951F0AM6PR08MB3685eurp_--
