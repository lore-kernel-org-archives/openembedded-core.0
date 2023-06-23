Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3AFEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 20:39:59 +0000 (UTC)
Received: from MW2PR02CU001.outbound.protection.outlook.com (MW2PR02CU001.outbound.protection.outlook.com [52.101.48.27])
 by mx.groups.io with SMTP id smtpd.web11.8738.1687552789025591723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 13:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor.com header.s=selector2 header.b=QdQbCpj3;
 spf=pass (domain: nikolamotor.com, ip: 52.101.48.27, mailfrom: russ.dill@nikolamotor.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJMgH43m2obK3QQ3djaxjfwI+QPoEkrG5lQzUkdjIolXWOl76Z2r1A6E3K9STi0FiCf306mDpZcgkt59Qh8v/fN+sz+cnfAeC1A1tdeHs5OJa6ogLtofP6tMU3KpyYBwuWuuBvQYM6ftCPQinehANN1ZtCF66h/ELzeAuOgMQTN5u/bAP6MJMzR5m2B3p7Oba1OvDHVWLqA4pch8i+27wjCRNZdel8h+8EXzIzdAX0XuY8s8tm2FR6cYTCtrR/EYHynthzUXbJxgAAjc0ZTlL1w1altO3jpTKjZYz+GUf/7zSlel+KnvD+Fq0iVpNITiUVZVtWGp4pcAKwwH/R+Kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3ePwJ1cVWtfrVMKw9HDOmTnaNWE2RZfBLph6ZL1OtU=;
 b=EpYU9WUl0ytqcAAUusWjHQON6NqoCVud3ticVWP0kaPxBrJ5ORhyR5A/Qy/gJrV0EJaN4OPYTrnwT96/dX2k19nzpqMMYPdFsP3pVHeiV/3CiXJ80dAgZTRoHTmWtNVUybEcoKVYDbEHm+CzGoDIm6sjO62wCpZ+b15QNoizv2n7VgW8ypIQnEih3Zxf7sDv8JdUgiiRjm32bpVXhgNGCP9GCo2gRbUbX+sl0zNNlAwr+X577woStHcAx5QgFjHtUbJqBxju+D6wrvEhu2rsx3NbBb7/siLNCC8drYwAhrwKfuDfloQ4WAjVpaINRDj15Gjw2x+6pDF7FXJKjdiQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nikolamotor.com; dmarc=pass action=none
 header.from=nikolamotor.com; dkim=pass header.d=nikolamotor.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nikolamotor.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3ePwJ1cVWtfrVMKw9HDOmTnaNWE2RZfBLph6ZL1OtU=;
 b=QdQbCpj3GXxRkTeY45b0x1f19gDRntAk887bEe5m/GEr5Tz0gOqKw9obmRMOZK78UbwEzvfe/HlO9Tj6GnzqXWzJNaF1h0KemH8cYj/kc0nLNkM1L/wU8GJtkFKmUiVRf05W/YlOd49VvkN9xQAeamxAc81DJmsRKXOwKMa+RL3httBP63EPNTzjC2undxgmjKe2YS2SRSfBzJVA6Vyk3vYIbgDwZ6tQw4dLT7gJmtYz2yY9hpVF1Bq9v/Fnkg+kVDO4wBcM1FQJ7KBkF8EcNiiJ+3xqbmJtCvDW/mbNz5niBtu3CzVzWuSF022LqCDaZ8GiLhR1R0ehbcjeRg81mg==
Received: from CH3PR05MB9388.namprd05.prod.outlook.com (2603:10b6:610:148::20)
 by SJ0PR05MB8744.namprd05.prod.outlook.com (2603:10b6:a03:389::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 20:39:45 +0000
Received: from CH3PR05MB9388.namprd05.prod.outlook.com
 ([fe80::7146:2857:d710:f2c5]) by CH3PR05MB9388.namprd05.prod.outlook.com
 ([fe80::7146:2857:d710:f2c5%4]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 20:39:45 +0000
From: Russ Dill <russ.dill@nikolamotor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "vkumbhar@mvista.com"
	<vkumbhar@mvista.com>
Subject: Re: [OE-core][kirkstone][PATCH] libcap: CVE-2023-2603 Integer
 Overflow in _libcap_strdup()
Thread-Topic: [OE-core][kirkstone][PATCH] libcap: CVE-2023-2603 Integer
 Overflow in _libcap_strdup()
Thread-Index: AQHZpZJJa4m1tkncdEWN1+RxoHvfCK+Y2f2N
Date: Fri, 23 Jun 2023 20:39:45 +0000
Message-ID: 
 <CH3PR05MB938888DFAA8F20B852C7396AF423A@CH3PR05MB9388.namprd05.prod.outlook.com>
References: <20230623051913.843560-1-vkumbhar@mvista.com>
In-Reply-To: <20230623051913.843560-1-vkumbhar@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nikolamotor.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB9388:EE_|SJ0PR05MB8744:EE_
x-ms-office365-filtering-correlation-id: 08ef0748-d58a-4c2e-d889-08db7429faaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zYqhMJelHm63Mqis60MS0oMaKgIBVBItKmLUchoWBrDbRw8BIPb2jBDftIoEl6cWA1MhXCrB2Sfs6LIaUXVrWQglzVM/JH4vtf2t8X6x7yare7Z/B2hU6Gv8ohAto58KqTBuMsnsLR/kuzx9rJXL2C/IhYlcvQ1x0/N8v3+1qVXS600xjq4fRcjHaTQITGGmXSJ0IIn8fi/pBdDf/yf8JzEOMFa9yBVmpjAirIsEz5Z6w3hd6f1tCSTQ0L2iH/Pq8XsLWvxaljFxAnE4sQicGD6d0CQyTm8n2akGbGtAQadDwrBzuvQdf8NEO+EsVgcJB6F+eL4X74tIuAkuyTUv0vMjmKkZ9NGNjifPAoZ+RIf32kIGmS2pN6WvAchxK5p8AwEFodz4X56+4UirJ9u9itWK+OInlLk+vOj5Tgj7PMoFxR9/mjdJaz0wniyavlII7SG8UIvmDcb/n9YM57pjLxAQvStoxGrbKNXqheFXJrnxXHgOHBdz2LzLWMiynIJED1uo4f66Ohc5jhm38UILP/QVsEZawxc+BCw9f2tl9rkQyjtzMx3S/EoxznyHQaajDWqPYVK+Hxnd/xB7W7gkgeksgkcdKNctl+A7HL5mSVaSoESMEN5jwusyqe+myNdzPMbNr7VadR62Buz6odRB+A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR05MB9388.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(451199021)(5660300002)(41300700001)(83380400001)(19627405001)(122000001)(91956017)(316002)(76116006)(44832011)(8676002)(8936002)(52536014)(66476007)(66556008)(66946007)(66446008)(64756008)(38100700002)(2906002)(55016003)(71200400001)(86362001)(33656002)(166002)(110136005)(6506007)(26005)(9686003)(7696005)(966005)(478600001)(186003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hL35KkrgkSZHK8pkHN/ZBGAZbfVAcvHo4C91mBnoJ/hU+4wlfW5rBK6MiagD?=
 =?us-ascii?Q?gezrXuj4TY8tZ4g4pj/NWlkTIuwPxh716mfd9SaICTHG6UIvavetXMD/Ikb2?=
 =?us-ascii?Q?+9UVcKwozdQUGBNOvZGo7jjuYlrOdcqdZzuTrXo3U42m1lnP32PPbKamneAV?=
 =?us-ascii?Q?OOzX312KZDXjnXF00ROX+F8PTF8oRHK3qDRB6lK1PUq39CQ1b7FxDqFb8nYo?=
 =?us-ascii?Q?z6s0CQom6nkyQ3BWh7wJIAuMNR0vzgmLF6ui+D3O6G/XeOXyGoQuoBHfd+nX?=
 =?us-ascii?Q?T5Oy6Y2iSAg2qXugvWUej0Z3uw5nj6CGY4YxqTg+AVXhCHyIWYe6RK4MZSE5?=
 =?us-ascii?Q?9xjSR6/Vap5ODTahbQRru2ccxUM7cOD/Mo2cALcZWLCLLYe7jTw2QaX5l5JB?=
 =?us-ascii?Q?AZOxanyDMllgVjwD0UiO1OoTEtrXfPR5SMlSTTYbKDX0J0QsfRGJAGav8IPi?=
 =?us-ascii?Q?wvZoGrpB80JiTSH7piuNTX/FWu/jZsA6cUV1cu006WURFvC2OVk06G35GHIo?=
 =?us-ascii?Q?QeTeL4oCHPwqyabcARbKETXNxgQsh4uAojNpHMnGLra9Otlk/j9heAstOOW9?=
 =?us-ascii?Q?pQQpvuhos37n8ZFy9H5BpesyrKOTTfA1AybA7h+x53EcIpqe2w6XhlYvagi8?=
 =?us-ascii?Q?Re5XZhXsTpAKkvnYkUOiEHtdEbJ8ZVMHMKpAzjfpKSxDJBNcXiaP1Cvxx3zR?=
 =?us-ascii?Q?2sY+gbFoRsu2YmLG0dNU1vPAkNUe5/75wYcCoKBOhGwBWq4OGy6Xrt9CnHSu?=
 =?us-ascii?Q?ZhusWl+fl6xiVXG1+0G7AAajF40+YMN3FILmcBgAuZC1K4T3/CO3E5AtI+if?=
 =?us-ascii?Q?CSSJwC9ES3I/ENqlr00LI6lvm9pXBUdP94U5+9wtlWXDlbDMKLCjGDexJ949?=
 =?us-ascii?Q?elBx1VX+haoLNmWkiW6BcF7Z3l1ijClL7VuwvMPSOXg/mArhs9I32koqDHOf?=
 =?us-ascii?Q?iAGiynweo8nk5DoU8cEj9p/LY7y8NaIpEIsE4uUnG3xpfGtKOgS5ioU2uEc5?=
 =?us-ascii?Q?yZxqLfVm2rcPu95rqjddgpjoDQ0fyIarQ25GQfYUajfMxduxhKv+fu/R+gQx?=
 =?us-ascii?Q?mLhHV3r9KUW7lFSjyzJT4lGOUTN3MEw67b5O1WsQrJQnyEMrz3RSIfS8p/4n?=
 =?us-ascii?Q?jyEWM9TPryW2YkzKan0h00mgc5ezKkkmtdTum5ewRcJ1Qjk8Am/T6V12wQBL?=
 =?us-ascii?Q?ND5Qay+rlk33FX3hWYAsVfJcHJhCtDdPlytW4y0tD022UICf0AYvrfk/hsqw?=
 =?us-ascii?Q?9LlUc7Qyyx1/TDmqtsKCyNMuOBT1CUJYeNwoyhAnAO5s6VXuD653O8R5PFsg?=
 =?us-ascii?Q?1rHpDNIjD1gUgNfGk4gUwylQHpBobDSl3fjx36/kBT8Gdv/DGpbrigtI3/gR?=
 =?us-ascii?Q?+ZdbknoDGB44B9xIOsD028IXyy6Pku250n62d3CBbOOT1oGeBJ0uMONLloQ5?=
 =?us-ascii?Q?k2W9j3tXrhVFxDz1R3BbvQzV0nP2RhE51/qqRwPDTN4L+6JHXXFwbxnCYggj?=
 =?us-ascii?Q?TJHIzqlKXMoqWp45h8cM3+UMmVogKh4et9JVgbBg0+EgqwS0czpd40UY6JTF?=
 =?us-ascii?Q?vpwUP+azesgVbQpjb59HoYlEsmoTnGm3LRYv7WXO?=
Content-Type: multipart/alternative;
	boundary="_000_CH3PR05MB938888DFAA8F20B852C7396AF423ACH3PR05MB9388namp_"
MIME-Version: 1.0
X-OriginatorOrg: nikolamotor.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB9388.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ef0748-d58a-4c2e-d889-08db7429faaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 20:39:45.0758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cd45403b-72e2-4592-a46a-4687dcacfc95
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MobuNbAGK6H66vOGQk5W0wV3c515nQzo8x2sBQEHHDYD3nQNdv63oIZec0n2DKK+5dbyLChUYtQos22DGWWfD8ZKlNtLm5HhhvuXW8MoFy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB8744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 20:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183353

--_000_CH3PR05MB938888DFAA8F20B852C7396AF423ACH3PR05MB9388namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Due to a space in the URL the backport resolves to the wrong patch (HEAD) w=
hich is included rather than the one actually at
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=3D422bec25=
ae4a1ab03fd4d6f728695ed279173b18
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of vkumbhar via lists.openembedded.org <vkumbhar=
=3Dmvista.com@lists.openembedded.org>
Sent: Thursday, June 22, 2023 10:19 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libcap: CVE-2023-2603 Integer Overflow=
 in _libcap_strdup()

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../libcap/files/CVE-2023-2603.patch          | 31 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.66.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2023-2603.patch b/meta/r=
ecipes-support/libcap/files/CVE-2023-2603.patch
new file mode 100644
index 0000000000..c5ecb70896
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
@@ -0,0 +1,31 @@
+From 8785077d6c69482a2814a2f771aaada2f6ea1894 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Wed, 24 May 2023 06:55:47 -0700
+Subject: Tidy up the overview example for the "cap" package.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libc=
ap.git/commit/?%20id=3D422bec25ae4a1ab03fd4d6f728695ed279173b18]
+CVE: CVE-2023-2603
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ cap/cap.go | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/cap/cap.go b/cap/cap.go
+index 784bf65..df32436 100644
+--- a/cap/cap.go
++++ b/cap/cap.go
+@@ -17,7 +17,8 @@
+ //
+ //   // Read and display the capabilities of the running process
+ //   c :=3D cap.GetProc()
+-//   log.Printf("this process has these caps:", c)
++//   iab :=3D cap.IABGetProc()
++//   log.Printf("this process has these caps: %q [%v]", c, iab)
+ //
+ //   // Drop any privilege a process might have (including for root,
+ //   // but note root 'owns' a lot of system files so a cap-limited
+--
+2.25.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-supp=
ort/libcap/libcap_2.66.bb
index c50e9d8cc7..844ae58506 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/libs/security/linu=
x-privs/${BPN}2/${BPN}-${
            "
 SRC_URI:append:class-nativesdk =3D " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containin=
g.patch \
+           file://CVE-2023-2603.patch \
            "
 SRC_URI[sha256sum] =3D "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f8612=
9c059a4bb466b2"

--
2.25.1


--_000_CH3PR05MB938888DFAA8F20B852C7396AF423ACH3PR05MB9388namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Due to a space in the URL the backport resolves to the wrong patch (HEAD) w=
hich is included rather than the one actually at</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<a href=3D"https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=
=3D422bec25ae4a1ab03fd4d6f728695ed279173b18" id=3D"LPlnk651427">https://git=
.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=3D422bec25ae4a1ab03fd=
4d6f728695ed279173b18</a><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of vkumbhar via lists.openembedded.org &lt;vkumbhar=3Dmvista.com@lists.=
openembedded.org&gt;<br>
<b>Sent:</b> Thursday, June 22, 2023 10:19 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Vivek Kumbhar &lt;vkumbhar@mvista.com&gt;<br>
<b>Subject:</b> [OE-core][kirkstone][PATCH] libcap: CVE-2023-2603 Integer O=
verflow in _libcap_strdup()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Vivek Kumbhar &lt;vkumbhar@mvista.c=
om&gt;<br>
---<br>
&nbsp;.../libcap/files/CVE-2023-2603.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 31 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/libcap/libcap_2.66.bb&nbsp;&nbsp;&nbsp; |&nbsp; =
1 +<br>
&nbsp;2 files changed, 32 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.pa=
tch<br>
<br>
diff --git a/meta/recipes-support/libcap/files/CVE-2023-2603.patch b/meta/r=
ecipes-support/libcap/files/CVE-2023-2603.patch<br>
new file mode 100644<br>
index 0000000000..c5ecb70896<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libcap/files/CVE-2023-2603.patch<br>
@@ -0,0 +1,31 @@<br>
+From 8785077d6c69482a2814a2f771aaada2f6ea1894 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Andrew G. Morgan&quot; &lt;morgan@kernel.org&gt;<br>
+Date: Wed, 24 May 2023 06:55:47 -0700<br>
+Subject: Tidy up the overview example for the &quot;cap&quot; package.<br>
+<br>
+Signed-off-by: Andrew G. Morgan &lt;morgan@kernel.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.kernel.org/pub/scm/libs/=
libcap/libcap.git/commit/?%20id=3D422bec25ae4a1ab03fd4d6f728695ed279173b18"=
>https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?%20id=3D422b=
ec25ae4a1ab03fd4d6f728695ed279173b18</a>]<br>
+CVE: CVE-2023-2603<br>
+Signed-off-by: Vivek Kumbhar &lt;vkumbhar@mvista.com&gt;<br>
+---<br>
+ cap/cap.go | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/cap/cap.go b/cap/cap.go<br>
+index 784bf65..df32436 100644<br>
+--- a/cap/cap.go<br>
++++ b/cap/cap.go<br>
+@@ -17,7 +17,8 @@<br>
+ //<br>
+ //&nbsp;&nbsp; // Read and display the capabilities of the running proces=
s<br>
+ //&nbsp;&nbsp; c :=3D cap.GetProc()<br>
+-//&nbsp;&nbsp; log.Printf(&quot;this process has these caps:&quot;, c)<br=
>
++//&nbsp;&nbsp; iab :=3D cap.IABGetProc()<br>
++//&nbsp;&nbsp; log.Printf(&quot;this process has these caps: %q [%v]&quot=
;, c, iab)<br>
+ //<br>
+ //&nbsp;&nbsp; // Drop any privilege a process might have (including for =
root,<br>
+ //&nbsp;&nbsp; // but note root 'owns' a lot of system files so a cap-lim=
ited<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-supp=
ort/libcap/libcap_2.66.bb<br>
index c50e9d8cc7..844ae58506 100644<br>
--- a/meta/recipes-support/libcap/libcap_2.66.bb<br>
+++ b/meta/recipes-support/libcap/libcap_2.66.bb<br>
@@ -19,6 +19,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/libs/security=
/linux-privs/${BPN}2/${BPN}-${<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI:append:class-nativesdk =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch"=
>
file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-2603.patch">file://CVE-2023-2603.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;15c40ededb3003d70a283fe587a36b7d19c8b3b5=
54e33f86129c059a4bb466b2&quot;<br>
&nbsp;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR05MB938888DFAA8F20B852C7396AF423ACH3PR05MB9388namp_--

