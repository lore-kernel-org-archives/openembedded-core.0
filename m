Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E483C0015E
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 00:15:15 +0000 (UTC)
Received: from BL0PR02CU006.outbound.protection.outlook.com (BL0PR02CU006.outbound.protection.outlook.com [52.101.54.15])
 by mx.groups.io with SMTP id smtpd.web11.830.1691108104696829600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 17:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor.com header.s=selector2 header.b=GyDfL4yu;
 spf=pass (domain: nikolamotor.com, ip: 52.101.54.15, mailfrom: russ.dill@nikolamotor.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9Y8xbgZJqkRKAM4kvYeeM1q6Cr+wtwdjUQ6gGF8xAmEbl7aoWw96lJtvA8NV6V+WiPSjnp9OY3vePc+6dAaUs+cHhqpIjuUvhZL4CblIsqdgPccNnKgG5M/8WXI5kJ696BJX8AOf2K9XqQWXp7GAe3HcFlgseEPZDG38xxb4ytNBxzyF7F9qZZgJYHcdwFlLhs2Au6z3c1FcfYba72lPkMgrmxU8HSU/7Mrjcph8TNRvQ0k9tF2XSAkg3IT131C9goypZw4loXerMyGNk2OIr4dpAibFw3XZIMmtzFPYadkNVY+rfgDu7T7LeH0mxJLPWUC85hWWuYUm79EsPKvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/7AZIFhOq6To+v4opjsrB1AEsVqZOK8noYNpkQAgR0=;
 b=Ssfzx0WsMpTVEEfu9gs1FNdVgXno4/Ag8dOhbFhw+AO25DAiQghWOWSQLKnaWCotkCbCrvy3BFNQ/YHYbXgU01drymYjc/KP3nJ+rDfGO35ybHB/aHNXksVhTrb+t+uMndWd4huyom19K/JWn2o1NeMgM3yLIsW2OslDtxaF2DX2VbSPZHSRuUjfxI3yLp7tTSrUUHFZZY5tSrfOQfn1IIWXtbv0T8eKY+CAX5ibr1rdnFuAGpHsO9p7I+s1kee408x04Aef8k3bDDMgyZoTWW7QRXFJaypVpKA/PSkK2OC6LHNksQZe2FOxsd0d9cSqO9ZYNkUmHXXsVjG8AsFOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nikolamotor.com; dmarc=pass action=none
 header.from=nikolamotor.com; dkim=pass header.d=nikolamotor.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nikolamotor.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/7AZIFhOq6To+v4opjsrB1AEsVqZOK8noYNpkQAgR0=;
 b=GyDfL4yuEgqf3smGFQTvH84XXtCyKLTUm02KE7wfUvQp+lawHBXN7wM/LnX/sT36u7HR1BRcih2BQDZ+Ye13OM4Hd8Xx/ACnbxdlQepdeYvN/laVC81+tWmOxuG3kkMyqNE6wT7Y0gJ4jFyHGQfFU+nsiRMjqrJOBARA8M20l3M1qGJDaoX2ppWePNgYqUsGZxrh3nKWfFTsIGYWOx8VIz9MNkyiMDTHtPNHahL83QDgO6vhyZ2GmVnSHqlwesQLODfqUrnWY2P3SdfDHDZ8e6LDY4fRvBobTAZgokc8hzN9vunX0xPQw6KL3/3Uqh274G+dBWTZ7tyRRZd8Ml8GXA==
Received: from CH3PR05MB9388.namprd05.prod.outlook.com (2603:10b6:610:148::20)
 by SJ0PR05MB8646.namprd05.prod.outlook.com (2603:10b6:a03:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 00:14:59 +0000
Received: from CH3PR05MB9388.namprd05.prod.outlook.com
 ([fe80::ea0d:d30f:9013:fc23]) by CH3PR05MB9388.namprd05.prod.outlook.com
 ([fe80::ea0d:d30f:9013:fc23%4]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 00:14:58 +0000
From: Russ Dill <russ.dill@nikolamotor.com>
To: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409
Thread-Index: AQHZxeYNiMLPR5bGbU6ufDSfniDsiq/YVuqAgADrVCo=
Date: Fri, 4 Aug 2023 00:14:58 +0000
Message-ID: 
 <CH3PR05MB9388C28F896BA4052D1B5CF2F409A@CH3PR05MB9388.namprd05.prod.outlook.com>
References: <20230803083910.1288886-1-archana.polampalli@windriver.com>
 <AS1PR10MB5697729E99733D324F7615DAFD08A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697729E99733D324F7615DAFD08A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0fd8de64-9933-433a-93eb-f44508c3e5f3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-08-03T09:58:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nikolamotor.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB9388:EE_|SJ0PR05MB8646:EE_
x-ms-office365-filtering-correlation-id: 96b25f9b-fb9a-4625-433a-08db947fd694
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jVgO/TU4ohSO3x8zgZkxOod5sLBd0J7NSalyUMnDKW3llusLflQddJexhWlqcWxwqa6m1s+7FX4znxdue7g8rDVmLkN380OTe5M88bKk6fIFOVJRzCplbPlxlqKqc6eMx8MvTGhNXyjv5gPkYBRzrE0cr3O6OZWUHX7MYtlfRZAmMvQ7hnPisfQsI51TPCwUKGq2Lc4rrHyY9Cc/UA2IR+6Hr7bGwR4a5AzRhjc9zA2s9NDPrZGeWzRh8aM7Gtis64J7XlHKTuLFEV8YHb97MBB1fP6FTkTZyMUPGkdUCaXOBd/nJ25gSdndphr78oy7iC8JfErIEbaTBPa1vZBWrXs2pwmvsjvpiVv73ifuINIxVtH2Bm3Bbk/Z29tqhepbp8NcobqGaxF/LlWOjDmXNXiwCbx3Qsi4waV6R95YUMqEk9UGbqxu2tZozJWuQwz7UJ80MGwn1wh3rpHFEoYSxw+yD3v/fQbKrio5aV2KPwn7PohKud36QApC7RIiU38bx4FKE0yVChftap0TlclVtPmo2/+CFbtZNg3I3mywVOJamPcGX4YCspzCslbUIxNphJ8Zxi9/zivFUnGTEgJHgIuZE8miLnkqd3w7aVHNxfEzgVIFkKaOMHKqTK/jViuWZgw3fXH48f9GMPT9+vWW+w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR05MB9388.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(366004)(39850400004)(186006)(451199021)(1800799003)(53546011)(5660300002)(19627405001)(2906002)(6506007)(26005)(66476007)(66446008)(66556008)(66946007)(71200400001)(64756008)(76116006)(91956017)(316002)(38070700005)(52536014)(41300700001)(44832011)(86362001)(122000001)(478600001)(110136005)(38100700002)(166002)(55016003)(83380400001)(7696005)(33656002)(9686003)(966005)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?X2Y1y/U0bvioyfkQbPlKwmc0su++v/a7Dgjkxugr0U8s3yMXhY4YdBB4AefQ?=
 =?us-ascii?Q?VVghqrpWsrY+ayKMhf1BVwV9SO2ZU0w+eOAP9d34fXYQizajWvDoMYya9NuH?=
 =?us-ascii?Q?+Ek6DA7V6CdEpGSUOXGRMtf0NfFrjthPQorjhurzodn4dyRby975rL1IzUMA?=
 =?us-ascii?Q?6LZnSWh+l0+Vmvm5jq3i01m2KIGOpnFK8y/20mhfEI7sS3jD7Ff+/G/BVaP/?=
 =?us-ascii?Q?lnixmorSYRPLUr6klQrMKJDX4BLnVXf4UqvX3dm0nBUri41JngaeFNSo8U/S?=
 =?us-ascii?Q?NyI/ssqGqUZcJwWjhHhJuVDNLg/TASAsTNSVGsHULFqCYm5vX+ALchM+m64y?=
 =?us-ascii?Q?5xWwoVskHjTHKlPVNfWTKQj58pJCeg9wd5TarAypWr/76j2xm38rnc6KSrew?=
 =?us-ascii?Q?K08orY3ylwjfonj7TklYnCHz+SLToJBil/+R57SNi6hs7DE/q8H3TD1vZXiN?=
 =?us-ascii?Q?MDrJ2aqBCUsMGNuhuxnDLllGY1upZSpha79BTq/UusmW8tfHeG5cEn97LwGx?=
 =?us-ascii?Q?9i4vXYIS/lrktdRKr4DlvVFtm9pN//EjjUBwMQ0yVoj0D+Scz3gSmqRwjoPf?=
 =?us-ascii?Q?EbeZvp8M2LbQ6rlOhvGol7Wj4QAm4DSubQ9pUi3S8jOyXQ35qRfNT8HOcIhf?=
 =?us-ascii?Q?V9hX8SSELA4fio17GM5KomiI1tE/aRzjXSpu+wnn91ZM+wUvKdn5EnmmWPHp?=
 =?us-ascii?Q?qtuClSu0CZY4SF0qxt+83dKP4bzxviRWbskSK2fbpgnJR9Bijhfg4A9Bj9Ie?=
 =?us-ascii?Q?yOYHFXxqXWIvK8wK3UEyKRoXqIMMJZWd6XxGuiIqk1NUX9oho/l0fzYhPnqw?=
 =?us-ascii?Q?YcR2/y2Nek1XmVmiJalcmqE8O0o0AtOowUeqtKoL3O/+prsdWZ5XpVVsEJlP?=
 =?us-ascii?Q?I9vZHDfz1A5OtNjfuHl2kcsZ7KBmiiV2NUpww/Rjv6DheYToI9XoLe1eIicn?=
 =?us-ascii?Q?jaQjfU5w9g/hyK/cGznIj1VEwddGmdnbNZ6eS+nm9K3gKDDWfiMOloBGFL5T?=
 =?us-ascii?Q?j1ijJUthfto1e+xKAsdoxVNbahgkCEHVLvVUKPRYQuNtrR3x9uDP/UyR11gk?=
 =?us-ascii?Q?ovmkE7HhJta/RU3h2rsCptL0SAZqzKYjNt7XsKTNfsQwevQtkGxgPmuVbG7A?=
 =?us-ascii?Q?7IkDkTauUKirD21444+MSE+YlCTaO9YrmKElbbJT8OUNm8vPBUL5mCmIP33f?=
 =?us-ascii?Q?RRo7paJvX5jh7swlilNEYfiueI3nqGu+Jqdil7v593Ot4VQXMOFt/QtPm5u0?=
 =?us-ascii?Q?7gbGydm22HUWjWdmEbFjo0IKoBioNsk6MDP+rRlYkipXz1hV93yWEcD5DQhZ?=
 =?us-ascii?Q?T6SpMN+Zw1Iz1vQBKMTupr6lOJdd1WdDYHm36xpGQ2DI6YXIIdRLNm+LJPht?=
 =?us-ascii?Q?5xi0a7rr66KdgEPLSgDctgDHQsE7RxdPLOxD+Bgm5Yo3BPIp05X4FAK1Xz2E?=
 =?us-ascii?Q?aAnkLZZyxRSGwBq2PlToqVCfeoIqd3B4CcWc8iUSTIGBy4B03WzLR75Vm++K?=
 =?us-ascii?Q?ywc6PDm5kpWHwj3TfZu+ZTU/ye0pK6qXA752g2XXXNQXIxUsLvAkjbNW0Lax?=
 =?us-ascii?Q?iGLw/cmX2ZpIgGYuA94bwxIANZA8H01ZGfycGpr1?=
Content-Type: multipart/alternative;
	boundary="_000_CH3PR05MB9388C28F896BA4052D1B5CF2F409ACH3PR05MB9388namp_"
MIME-Version: 1.0
X-OriginatorOrg: nikolamotor.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB9388.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b25f9b-fb9a-4625-433a-08db947fd694
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 00:14:58.4716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cd45403b-72e2-4592-a46a-4687dcacfc95
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJBwzMLYy8ML66loSYgF2pWKWYIadLDT4kxwaWihGZHVDWpxOayQLWrdaq2bCob4z7bhfRxblnSB3oqxGO02N4epVqfbylhIYKrN/qUbucM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB8646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 00:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185504

--_000_CH3PR05MB9388C28F896BA4052D1B5CF2F409ACH3PR05MB9388namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Related to this, as the fix is in openembedded-core-contrib but not poky ye=
t, is there a quick rundown somewhere of how openembedded-core-contrib feed=
s into https://git.yoctoproject.org/poky/
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Peter Marko via lists.openembedded.org <peter.m=
arko=3Dsiemens.com@lists.openembedded.org>
Sent: Thursday, August 3, 2023 3:00 AM
To: archana.polampalli@windriver.com <archana.polampalli@windriver.com>; op=
enembedded-core@lists.openembedded.org <openembedded-core@lists.openembedde=
d.org>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409

This is already fixed, see
https://lists.openembedded.org/g/openembedded-core/message/185053
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3D410cdbc70cfba709ec5bef508e772f52514ba28a

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Polampalli, Archana via lists.openembedded.org
Sent: Thursday, August 3, 2023 10:39
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409

--_000_CH3PR05MB9388C28F896BA4052D1B5CF2F409ACH3PR05MB9388namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Related to this, as the fix is in openembedded-core-contrib but not poky ye=
t, is there a quick rundown somewhere of how openembedded-core-contrib feed=
s into
<a href=3D"https://git.yoctoproject.org/poky/" id=3D"LPlnk556008">https://g=
it.yoctoproject.org/poky/</a></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Peter Marko via lists.openembedded.org &lt;peter.marko=3Dsiemens.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, August 3, 2023 3:00 AM<br>
<b>To:</b> archana.polampalli@windriver.com &lt;archana.polampalli@windrive=
r.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-=
41409</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This is already fixed, see<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18505=
3">https://lists.openembedded.org/g/openembedded-core/message/185053</a><br=
>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dstable/kirkstone-nut&amp;id=3D410cdbc70cfba709ec5bef508e772f52514ba28a">=
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&amp;id=3D410cdbc70cfba709ec5bef508e772f52514ba28a</a><br>
<br>
Peter<br>
<br>
-----Original Message-----<br>
From: openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.=
openembedded.org&gt; On Behalf Of Polampalli, Archana via lists.openembedde=
d.org<br>
Sent: Thursday, August 3, 2023 10:39<br>
To: openembedded-core@lists.openembedded.org<br>
Subject: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR05MB9388C28F896BA4052D1B5CF2F409ACH3PR05MB9388namp_--

