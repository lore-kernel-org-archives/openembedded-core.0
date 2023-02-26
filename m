Return-Path: <Wilson.Yang@terumobct.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D73C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 03:03:52 +0000 (UTC)
Received: from mx0a-001e3a01.pphosted.com (mx0a-001e3a01.pphosted.com [148.163.157.62])
 by mx.groups.io with SMTP id smtpd.web10.59416.1677380631952071360
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 19:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@terumobct.com header.s=key header.b=cs1+Fqcz;
 spf=pass (domain: terumobct.com, ip: 148.163.157.62, mailfrom: wilson.yang@terumobct.com)
Received: from pps.filterd (m0087243.ppops.net [127.0.0.1])
	by mx0a-001e3a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31Q2UO7P021933
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 20:03:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=terumobct.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=key;
 bh=KVQB3uevPC+AKDBtE/aPBBOF8POkfkGLKQYEb9+mVsQ=;
 b=cs1+FqczyY27LGEvTdKva0TIb+q5ObpadGS7KWUJst8ydQa/4+IZLT9wPEECuSQvJC/e
 2Os7rNZsGtTVVPXSnQXiMoex4Q3jLSq1GOmaIt6p6ZOFg4P62/gYpph850q9xnucECLZ
 N/oczDorcI/XxFTc44CjSUf463WcsupBTeN4m7QFNLj7dsEOtAQa5/zPJpT3CaMwFsYb
 pe66q6Xkp3I98Mh3PHDNt4ucOgJBHkFy3QRMg+8c5KsggLHYXbSwc1VLBaZhBDl2uTyk
 JSTVUnXUpJ0mYJsF6NcA2y0G4Kj+j8o5TyRTUcLUjQZ9MP5vaM4Fh3QIYBaQRKWzw6yy UQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-001e3a01.pphosted.com (PPS) with ESMTPS id 3nyf778uxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 20:03:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZF9xKtn8sPWN+6qrX4gj6QK+VlIU196W8+myXmatrKKcJJfMQd4sPp9DZhNICKaw1e/Ybw2P8syh211se31i3mhWsCPJqksrc3CxzRQEOPtenc5a9QRc57MKLfY+sNuhS22LwS7IYkoj1VXiiyTuPvFSH42Iv6hDpKcb8mx9K0OOCAMIkzBg/JEAsQnEVfw9lnkjhlPdPL37Otbh3fGOgbvwZR1k/jx1ge4GY/IELLGIpgYe/lvH3TPnmfd4q0SVfT/Dr+4Cme/nIkviDti0p0pp4a6FQQbmHm095kBag9Pk+MQ/+OwmeLc0CfMAR8HccTkvomo1kQjbS7CepElWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+YNhRch/wzqxNRlVbBKCs8VkPawNl5JnPcdb/rCdNk=;
 b=kw/pJekmS59c3w/066I7bcRShyfGt+xOUpMjBEBViM7iQEICjDFWcOVZI5mALTkez2gLalDsPMJStQghNkRA4Dwxz3i1cozu7GUqrRSh9yCHb149XUxvby68l1hit1kLMtxOArv0SbC9YNDiHj4lFucetW+pnMsvWexgCpeQ5xrXtszSy9OuR+1eK60zoMw41cL2TEmsSYWUrmvFaTv0n8rmjdZih7Qctg5aw2dyo6Lpc2X7XyWeRCa7JkyoKa7yi7jy5P35AjjF+KkCrXRcG8CP2DKxYCgQYLWfp/mnZfnQLkyC+EaoEkf3Z37okO5EekEv0zt+lFVpMK9+TbGHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=terumobct.com; dmarc=pass action=none
 header.from=terumobct.com; dkim=pass header.d=terumobct.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=terumobct.onmicrosoft.com; s=selector1-terumobct-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+YNhRch/wzqxNRlVbBKCs8VkPawNl5JnPcdb/rCdNk=;
 b=gJmZiz72QY2TkMxsHD4nSLsLrzwIkyzBVV5VLBAXIdcV9RDPaM8di9xcHqmeCz9kWqhTcDAD3Mb9gkPCJFJ8R8CF21tat5CVFsMY/0fPClcJd4UgSPTpPy5PIZCow205V5xfSCyFF1huEnLJJHZhUNVjH/8nPATjBDJIbT0j8h8=
Received: from DS7PR20MB4709.namprd20.prod.outlook.com (2603:10b6:8:86::22) by
 IA1PR20MB6455.namprd20.prod.outlook.com (2603:10b6:208:44c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.25; Sun, 26 Feb 2023 03:03:45 +0000
Received: from DS7PR20MB4709.namprd20.prod.outlook.com
 ([fe80::110d:2073:e2f6:7e27]) by DS7PR20MB4709.namprd20.prod.outlook.com
 ([fe80::110d:2073:e2f6:7e27%8]) with mapi id 15.20.6134.024; Sun, 26 Feb 2023
 03:03:45 +0000
From: "Yang, Wilson" <Wilson.Yang@terumobct.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: How to use linux-firmware to install single firmware package?
 #kirkstone
Thread-Topic: How to use linux-firmware to install single firmware package?
 #kirkstone
Thread-Index: AQHZSY7RXjF1KEeGckeCvCreCV2O3Q==
Date: Sun, 26 Feb 2023 03:03:45 +0000
Message-ID: 
 <DS7PR20MB47096CDED0739FA3ED6EB027EBAE9@DS7PR20MB4709.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR20MB4709:EE_|IA1PR20MB6455:EE_
x-ms-office365-filtering-correlation-id: 5963747b-1d46-4e14-41dc-08db17a6132e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dGIKMpHi2ejgxj73Fj29ye9kIvdmuwkBegvGHaKfYINOf4pybMltKC7G5G8YsNBtW6TuZ4Mb5eiolnDOcPKfHM+rIUb5N3ySzO15QOA7KUb8OmdVRqr1R1otZmJ7yWQ9sMXCkcnahFVbrPEXbwI6BEl9oIbgvLeH/8r1lMLEiT3teaaH127QXicq6i1ZPxZJGu0F0FUeQnrIOZfn6VnATVMVdoGYrHnxtEf6OiHvtpZJw17EUVuHSg4ngDdHACLKT1ScOkii8A36c4+YKMf/tqFGq3A8Ktr9hFdxTF6oVALXkQEe2ubMfmZhQB/7UYIcrtEgdFkArAoNGQG9MmH7FP0xGQ6IFCvUikGZcFM+pdtoPyljUYH7aWnhvvLGrAkBbvk/B2x/9UOq9sH6+LZMQc4R3JT7ucWi67pmDmWmwDmuwVnUZ1FwalZ81yXAmrMYxBe60GqE0gsogTEypADcQ/db+oNQC5GflrBRETP31BoNvR9BRx/6b6Di0aBvF2GaEkckr1QSJsQM/X0GlQW2M8MGDN3eyqVwXrl86fwaPo6d4pujQJAo5gSISnFr2VconIPlN/4qU1D7Jp4FaKfNXKqXqs5woRuemxR6ChEBDFBqyugX0cIPgWuEKD8nbo2qW3o82dzuxUPqg8zVLnIXJdzwV8qpay/dpXv54032OHwhOKCi/h49S1dbfVFw9Zs0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR20MB4709.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(39850400004)(346002)(366004)(451199018)(9686003)(64756008)(38100700002)(122000001)(38070700005)(166002)(52536014)(8936002)(6916009)(66556008)(66476007)(8676002)(76116006)(66946007)(41300700001)(91956017)(2906002)(4744005)(5660300002)(71200400001)(7696005)(55016003)(478600001)(6506007)(66446008)(186003)(26005)(966005)(316002)(33656002)(86362001)(66899018)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?DgtZ6p+oifKIs+0OaJAOks4iOFFg39OwmvSyqZSusdD681Khi4r4jY++/9?=
 =?iso-8859-1?Q?pt7bdJosUciFU66/AgrhIhPAm3PxefNy8sJfdYMNFiZDVqKwMEliqmmxHh?=
 =?iso-8859-1?Q?wzFzotibOztKPNMCdqXbEyyJS99Cnd0UD2qZ55v7XxfcNg9SX+8X1dZT17?=
 =?iso-8859-1?Q?Li7dqg2VTuA+nNJztfhGpDUhT+f9A3wqZpRNZ5H9K4patt66wVZ/FIWhVX?=
 =?iso-8859-1?Q?e3dkbRSCyOWihyC+1rlb50ltK6+N3/pBOURl2pMooybo4HwwRP/cd2orH8?=
 =?iso-8859-1?Q?CgF7FX6qpfftEwcHUrvObjWVOQpFD7RKTmMTuZpHQ3sz2AF/TDcNpmQ5k2?=
 =?iso-8859-1?Q?X4NKoJqmmMHmRM4Qsk5oQxosRGJkgR/Ceztpve93uoU3HHbLAcRGQOOPZ/?=
 =?iso-8859-1?Q?HxGTurmC5p6/IV3YLG77T5JHW8OuNZ7TISByI286BC8KBW/SMTu2l0V1cL?=
 =?iso-8859-1?Q?/Bbb8m0IuiP9wL+F2Rh8cr8TbB7BwhbcXDc6vldrv6nutg4EsJ0mhEe9yx?=
 =?iso-8859-1?Q?IzlXhGDHPHQub2QEQAkoyK8EKpFEMK7evonjVwnTOeb/9IZFxWP8hX1blI?=
 =?iso-8859-1?Q?JE+kFlWuTT6qXMEbCOIPWWed8B6g4NSgXp3RFdkKIwAG7It9pk4IeX+uyZ?=
 =?iso-8859-1?Q?u6OaJ/n7QVOwGR3/T1ldFczVe2++AtIjgSzdbETrN/y21BBGwSrQ9qQmiz?=
 =?iso-8859-1?Q?W557UbiRAJCnZGrvtOf3TleaY622smFhSALAnX6eMK6aDa9IWLiSbl5s3w?=
 =?iso-8859-1?Q?ymKjzbsbQry2StwekUywiUBZ3cGyVbUjOYD2VzlRD9oNvevTz0yFcHYsAH?=
 =?iso-8859-1?Q?5C+P8z+430v4daIDP0ze6YMxgAh/+qdYtdjh3FjkmmayHN0OE+vNSflru3?=
 =?iso-8859-1?Q?fTlSvhhB2sDpbMnXjA8KVSgofjyRC7vmCfPMZc8S1KoDKCDeoL1hieBgqb?=
 =?iso-8859-1?Q?ssEV44ciO3sz7g1PdEwJPcco7RLOWdmRHh7ZYfx9GRQCA7SbD6cDHq0a0o?=
 =?iso-8859-1?Q?kdpXMokPewKV7pqL8AhEQd7CIndXdJcTcJVflTPZmmmltf8yBfqcwrv3YJ?=
 =?iso-8859-1?Q?wICSeLQP5xd+kfBPPouEz5N7t1418jhSf9oNmi9oTVuD0EbSe9rhxMnt0S?=
 =?iso-8859-1?Q?QB5WtcvtmmIuuCvAR0jhPPPhK7dORPyqyO/POXXNC+OFQEDYjTbN5voiA+?=
 =?iso-8859-1?Q?M1se0WARkeSzsUN91ErI2k9VLIu1C9eHf2WbzKgyB1UyPjkHTycOTZAnhm?=
 =?iso-8859-1?Q?C125E3sCFw+HXACJn8oDEugiD0PIgLM62jQBrbDkmkop2DEoyjS8TqOtPi?=
 =?iso-8859-1?Q?O1D/JJyVLJVvU4w1EREWBZQw1XAKdvAj0UpEWnoF+5bUlx4JjOuoL6LqdQ?=
 =?iso-8859-1?Q?DNSquGUPb26UWrGV/HbD5KXbdknh2XH2WwiJ6uEgOE1ydX/AGuqx0dpI7t?=
 =?iso-8859-1?Q?TIj+lZMdmnbs36zvHG4dNS17E49Svw8cahhyOZJS630Lf/8yVPqA2XZ1cY?=
 =?iso-8859-1?Q?JIGjGAPa98zey7FzGbqBvrSuk1SC+LB6zQZlKCKJGghW97A2tmcWYWpd65?=
 =?iso-8859-1?Q?E0j5CzwE1V5u4ob9YlH3Db0fQbG21RjCtmTBY6Zd7QrO8ZRIbZ0NlMQWcK?=
 =?iso-8859-1?Q?0yN9WH4ja4CTbiN8OmLUShz+Y/IkghGCxZ?=
Content-Type: multipart/alternative;
	boundary="_000_DS7PR20MB47096CDED0739FA3ED6EB027EBAE9DS7PR20MB4709namp_"
MIME-Version: 1.0
X-OriginatorOrg: Terumobct.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR20MB4709.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5963747b-1d46-4e14-41dc-08db17a6132e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2023 03:03:45.6240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e76fb28-520a-4759-9869-1f8fc49e7119
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pnV8UJDJQD5aFZ9PFRIRUX/onDiW4gGWMFb3VX0StQxwiuzl72LWec+ZOz00ACErAqGcIehDnyzousmSVVPoiKQTIUFra9ayuThpMQ+1FH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB6455
X-Proofpoint-ORIG-GUID: YumHrCrtrBsgi9qRZfyaqRvw2BrY9yPe
X-Proofpoint-GUID: YumHrCrtrBsgi9qRZfyaqRvw2BrY9yPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_01,2023-02-24_01,2023-02-09_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 03:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177723

--_000_DS7PR20MB47096CDED0739FA3ED6EB027EBAE9DS7PR20MB4709namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

We ran into same issue described in https://lore.kernel.org/all/CGDd.166751=
6824130158087.aCkO@lists.openembedded.org/t/

Not sure if any solutions/workarounds available to share?

We only want two linux-firmware packages, linux-firmware-imx-sdma-imx6q and=
 linux-firmware-imx-sdma-imx7d which are removed from IMAGE_INSTALL:append =
from our core-image.bb file. Also add IMAGE_INSTALL:remove =3D "linux-firmw=
are" in same .bb file to remove it.
Unfortunately, the installed-packages.txt still shows the complete list of =
linux-firmware packages installed that results much larger binary size than=
 ideal.

Thanks in advance for your info/help.

Wilson Yang

** Statement from Terumo BCT, Inc. **

Confidential and/or privileged information may be contained in this message=
 and any attachments. If you are not the intended recipient you should not =
copy or forward this message and should destroy it immediately. Any disclos=
ure, copying, distribution and/or any other use of this communication by an=
yone other than the intended recipient is strictly prohibited and may be un=
lawful. The opinions, conclusions and other information in this message do =
not necessarily represent the views and/or opinions of the employer.

** End of statement **

--_000_DS7PR20MB47096CDED0739FA3ED6EB027EBAE9DS7PR20MB4709namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="iso-8859-1"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<span style=3D"font-size:12pt;font-family:Calibri, Arial, Helvetica, sans-s=
erif;margin:0px;color:rgb(0, 0, 0);background-color:rgb(255, 255, 255)"><sp=
an style=3D"margin:0px;background-color:rgb(255, 255, 255)">Hi,</span></spa=
n>
<div style=3D"font-size:12pt;font-family:Calibri, Arial, Helvetica, sans-se=
rif;margin:0px;color:rgb(0, 0, 0);background-color:rgb(255, 255, 255)">
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)">We ran into s=
ame issue described in&nbsp;<a href=3D"https://lore.kernel.org/all/CGDd.166=
7516824130158087.aCkO@lists.openembedded.org/t/" target=3D"_blank" rel=3D"n=
oopener noreferrer" data-auth=3D"NotApplicable" data-safelink=3D"true" data=
-linkindex=3D"0" class=3D"" style=3D"margin:0px">https://lore.kernel.org/al=
l/CGDd.1667516824130158087.aCkO@lists.openembedded.org/t/</a>&nbsp;</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)">Not sure if a=
ny solutions/workarounds available to share?</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)">We only want =
two linux-firmware packages, linux-firmware-imx-sdma-imx6q and&nbsp;linux-f=
irmware-imx-sdma-imx7d which are removed from IMAGE_INSTALL:append from our=
 core-image.bb file. Also add IMAGE_INSTALL:remove
 =3D &quot;linux-firmware&quot; in same .bb file to remove it.</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)">Unfortunately=
, the installed-packages.txt still shows the complete list of linux-firmwar=
e packages installed that results much larger binary size than ideal.</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)">Thanks in adv=
ance for your info/help.</div>
<div style=3D"margin:0px;background-color:rgb(255, 255, 255)"><br>
<span style=3D"margin:0px">Wilson Yang</span></div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>

<DIV>
** Statement from Terumo BCT, Inc. **<BR>
<BR>
Confidential and/or privileged information may be contained in this message=
 and any attachments. If you are not the intended recipient you should not =
copy or forward this message and should destroy it immediately. Any disclos=
ure, copying, distribution and/or any other use of this communication by an=
yone other than the intended recipient is strictly prohibited and may be un=
lawful. The opinions, conclusions and other information in this message do =
not necessarily represent the views and/or opinions of the employer.<BR>
<BR>
** End of statement **<BR>
</DIV></body>
</html>

--_000_DS7PR20MB47096CDED0739FA3ED6EB027EBAE9DS7PR20MB4709namp_--

