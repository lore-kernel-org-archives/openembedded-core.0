Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABB0C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 22:10:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2941.1668636608103945199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 14:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mAL+3arT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83191d2d0a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGLnm5Y019370
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 14:10:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=YJlbjCMFuL7H/bqSluG6sC7Aqvu28U443a4LjjyTMSg=;
 b=mAL+3arTI/UeQDxQKHnhbf1Hnpbgv3f/J7yzni+Cvzul7PI4QGTiqqHrjamfhK8TbsJs
 LeHcMbclNj4TfT7vyxAmNbnawSAIiwJNLWiExGzYz2gGb3TlVML4QYZl8hF/efWcOGhu
 QDjJQ8FTa1bo7SbADkR1edb35jqMMNLIgLFyRY0D+af2suW37nR2P2dxsip510dP5WWQ
 Dg6MWB1WspqN7XqwORXJ3oBwLQawdBrVFoRjs9QV7IBD8gCubkmArnbyjVZ1t1fcoJKl
 Iuus401UfpeFS1yopNIgzFKkEaE5qj2zPTvdFpZ9y8JAglaxp9fGoVrQx2sdP+2S+leF wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ktbvrbmc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 14:10:07 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGMA6KW032614
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 14:10:07 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ktbvrbmc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 14:10:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQZmOw9ZJfH+ok0Jg0cFweOUdhNLW4BWSXLvFXoAVcEJVaGcF7CMxBmB99aOqroasmHIOjHd4Wy9z5HGf4n2cHa/jiDsPGZNKywkgmMZGORiEM5dXV/nsFWFYnuxdeRxUGcOFtAi3vpG+ioRSqXTY6UA7rAi/IhjK1OmtvATFQnmQgWIRyLG41SXeax2lU8wtRXNsFJhlncZG91p8dccy3ut67XLXxlT2dtWtdTgRf0L/azDXiK36JALPmMTAdWgPNl1drEROvjX915hzPHqhCdLuVSnJh4vbQ+vInfHO0GQ0mCU2937y3mPFuwY1A+6bryjOcbUlOfo18dpxMUe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJlbjCMFuL7H/bqSluG6sC7Aqvu28U443a4LjjyTMSg=;
 b=YfdaknuLXz9gr3OEh8e8WlA9X7bjjUqK7vFImv5yOyur1hROhvK0f+Nsz8t2fWU9UrJo3DyQ3OC6uDTFU1RWYJVIGQhzbzCpEWuQgk3aYbCWtdA34pSFSdi8CxC+lANyDcDloZUU4g0aJNfqI4jlNZCuQLaLh7NnTP9tFR7Lkd4IKy6uSFIq00cDXrBIU8x1iC9PlC1oDzGCHR5aqtznXfivjl1YEEkMj7SNGYcTRdqUbc5kCh0PLBxMewJPO97yNeWJa7l/B/YivKWN2U4J4hUkbIDkUaW93LrEw0TCyAmvuEccEEXVZS92CqyMY/z/sUbeGJU89B//eOqJJHmkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.18; Wed, 16 Nov 2022 22:10:04 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3ec4:f05a:8bf3:59e0]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3ec4:f05a:8bf3:59e0%7]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 22:10:03 +0000
From: "Sajal, Sakib" <Sakib.Sajal@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH] blktrace: ask for python3
 specifically
Thread-Topic: [OE-core] [kirkstone][PATCH] blktrace: ask for python3
 specifically
Thread-Index: AQHY77r1xR6x7ykbWkKiqaS4GtHcvK4toCKAgBSPCzw=
Date: Wed, 16 Nov 2022 22:10:03 +0000
Message-ID: 
 <DM6PR11MB25380AC50753F79ACE2B026EF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
References: <20221103192958.29651-1-sakib.sajal@windriver.com>
 <CANNYZj_Dod5+PuQA4oeJxO73uj6xO242yZiA-w24oU6A9Pc-JQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_Dod5+PuQA4oeJxO73uj6xO242yZiA-w24oU6A9Pc-JQ@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2538:EE_|CY8PR11MB7010:EE_
x-ms-office365-filtering-correlation-id: 0910c71b-a79a-4990-427e-08dac81f4fba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 typo/kClWHDydfBa48ZSgjZDNcZ+m0F9Pbcf6+Osx0OrpnuTk0u2SQq0/1pTnnY5El51psMRk2yjc13HIjTjGVewIaZM3xQW79Zp8lIv6Aa65oar/prpaU6To30NdnTz7qVO2xEWOvaufisC37UB8LkaOK2BgSD4c+mgRpSisTewqPetPxvxBc8kFMrXshm1hXqYPjzc81LvQPvFi/k0ITyXJnPkUDvPC+aY8rC5lZ4hb7DsFJsWX6XoGvgMf3tlafolxz8U8Y6Vz6Gt3Agh5oHOB0vHVjK6XFWCCGTYhEajIHKnLatR+hBfZYReBacVJD39O4JvrTsrUbXKR/j8PnNfabEY6kq0YRuz+OvqS8uAp2yZMkoPxiqTfVAncOdeyniFB0/7w1WP6+VecFwa44/kQkwewK1EFUrenm/3vQMKCTor4C9jBxLF5Urg+O5tOyLV1LcVeujb8jm6RfG3GxogdYeQs4JcQnzDJY0aLPQFNyi2JHs7KS5hGogCGybbnm7Ilg+1FIy22eF6EqYiMYEa+lBewxi1RQ1vZ2vcIc0GHvdBymhPzjFCj3zzoyBQoqeseDXmOKh5Ny3v1QHVqIvegzcMc/jEUeasDPiwSH310nV9mLjvnCbalRyAI2Ze0ZG4EwSmiwx5h+qNm0qKX6ENWAVvVfWET2tFEEnCvlyUAHyjt5livUrX9x58ucAaj9VJrGrs3k1Wh8lqCt0tuYQWp8jlxh+lEeVOKlYjlFup7ThYAqokXO/3VN8Ou0gzlYS01uAv00RP+zcIrClhP18fj34lASWodIVbvkeHjMU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(136003)(366004)(451199015)(7696005)(478600001)(6506007)(9686003)(26005)(76116006)(66946007)(91956017)(71200400001)(966005)(4326008)(41300700001)(66446008)(8676002)(64756008)(8936002)(66556008)(52536014)(66476007)(4744005)(186003)(2906002)(5660300002)(83380400001)(33656002)(38070700005)(55016003)(166002)(6916009)(316002)(53546011)(19627405001)(86362001)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?N2DeBhu2a3a85mkw7KdbJsO9TBR5kzQyxDinRQeU8AsrehFiB9x4oHM3tS?=
 =?iso-8859-1?Q?fuMg08Wo5otgw5hMlQyI63KOtNd42g9EvbwzHI/qFGIvimmmzUKTYKyQkI?=
 =?iso-8859-1?Q?SXqroAHVAEoLoG1VxxF/bXDSuI064g7ae1lFWHS5vmqmS/vHcS+Ec/VseT?=
 =?iso-8859-1?Q?nLn0TentDMWyYHME57ahXaCRUTtz3p+ZF5j5riNkHdkm8J1hNC3hEAm6/S?=
 =?iso-8859-1?Q?HiKOg4YICkb07v1wmw8tUVayZvU/E8jo4Ck6vJaI6OqJMCWYCYAV5TH64V?=
 =?iso-8859-1?Q?iDKVuvW3T79/S0vNz2RT2+KivraYJ/m8hVOu93bEGJ76nGuHuUGYPD+R7a?=
 =?iso-8859-1?Q?nvegDZTdzBSL8hMyVqj9QoiMBizKmObRwxZZbol5IlxA1g16zCfzk/0kl9?=
 =?iso-8859-1?Q?OI0edCd+w6s1Ha6RnPXDOwvYI6NfxjDfTq6lvWbcEAMo4ON2kqbuStBZBA?=
 =?iso-8859-1?Q?jN85x0MpaQL6M7bsq6vZu75BCnrwlFaS53rPNoAluh6DrnQmamWsuYjpgF?=
 =?iso-8859-1?Q?Pp9LpXjqXvz/kGl37HmBB9zGnm3V0s4eO8JU/PRr4EhH1HxWBK+EV/HFNi?=
 =?iso-8859-1?Q?7e/wtSQDzaS0m/KuHkCBqlPaEIQxLovS5WTz+l/btrzJjMsBKxawo+Ur8X?=
 =?iso-8859-1?Q?fL1Men8NGgDopzY56n6lwcYYCsnnjXUkd5bBLYG9QOkOQvRklb8r3XxYbW?=
 =?iso-8859-1?Q?zL0gaCQ/WNovQeCuDWKBq7RT8Ey174cWY5Gt9ounvESA3A5ccTKx7MxOm0?=
 =?iso-8859-1?Q?ORqkp21kc0UfGnOXaEOT280Y5xPhgbNglSQNvv1zgkdpwtDGcN4yN9ynno?=
 =?iso-8859-1?Q?t/eaJKPyiFKYoU+Qs7D8I6VtK7sRzyBmwdEDO1LRtmJeH/Z56cx0bIeP1q?=
 =?iso-8859-1?Q?aMV8s0LHDK/PyaGYA/ATWEvKEw1iJ24TkVjEm/r71RlcIzIs3O5e18OiEj?=
 =?iso-8859-1?Q?lHDBo3YjqLqSbulhvpy11q2dp19wdf+Df6NtdoQf77fr998fG5P51biYwu?=
 =?iso-8859-1?Q?ot9o1Tb0dKV5IPe2EtK0Fk3pf84znk8ottdFLz7o+QC1MyQAkpVi74Lrq+?=
 =?iso-8859-1?Q?4Ged0cHSzQGntfL2dfd8t8oM3NpjpCBbvICdUOOTjlLnV7w24oagssDrWD?=
 =?iso-8859-1?Q?P6Fo37GoXqAG4Y90ZKSPWBatIeR9NwaaegAac6gCuRrqc/PAi+NzQdy2yX?=
 =?iso-8859-1?Q?F4JXxcMQ8I3Y7UzKkB6MiTnx/3CkDlDoWP0jYYhNkm9R1G6LpPuui9jyXU?=
 =?iso-8859-1?Q?Uu2v9aXu5lHygZdzz7mJQoKeIFokTN3bhIs35v5inq3tfVfvx1k1ldsyCd?=
 =?iso-8859-1?Q?9M6e4k0gVAghl6p1qd6dq0IU3fVUyL7lSVwXhGEzSiqbxwdVq2Z3UQbmkk?=
 =?iso-8859-1?Q?YwPcY94e10nlWbesDhbwEQ4XnUPgkIVEIuXissM9InRSJ5IafgnIqkM2si?=
 =?iso-8859-1?Q?95nUE7dHpUs0taDNpdwawepu/jQ3T6qXm2t1j0/ndxs45uJeAKbzAhLSTW?=
 =?iso-8859-1?Q?2HxOQdqX3aQXi8Napa5+Cv37CsuFBLyiLaYC0fmEaKVmFzO8pp3zYLEe2q?=
 =?iso-8859-1?Q?SYjNdbvActqtvnpTJFEsrNw/7rY7eF1JJL0Ff39DFmxXQosC0Mo906UsLG?=
 =?iso-8859-1?Q?tmY+jEEx1geAzXIAVFSqr+bQjyzx+fcROr?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB25380AC50753F79ACE2B026EF2079DM6PR11MB2538namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0910c71b-a79a-4990-427e-08dac81f4fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 22:10:03.3338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBXRNmqmZe6svv3eCspS4Uj5K3prdCeuurN/TH5zzep56HcnnkxVrbckZkvrAWmb/jixlOdUiavtE+KSTMxnLen+URRgkWDzDYFqjkUDWJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
X-Proofpoint-ORIG-GUID: MXRkNKS02X6zDI55lW8Z-3wCIOHGKHTy
X-Proofpoint-GUID: Lml0ViquAo8vRrgIM4a3CgVVuN0CxfP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=917
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160151
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 22:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173394

--_000_DM6PR11MB25380AC50753F79ACE2B026EF2079DM6PR11MB2538namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: November 3, 2022 4:06 PM
To: Sajal, Sakib <Sakib.Sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH] blktrace: ask for python3 specifi=
cally


> This patch should be sent upstream first. Same as in your master submissi=
on.
>
> Alex

Please refer to the mail I sent for master branch:
https://lists.openembedded.org/g/openembedded-core/message/173393?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cblktrace%2C20%2C2%2C0%2C94790255

Sakib



--_000_DM6PR11MB25380AC50753F79ACE2B026EF2079DM6PR11MB2538namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div id=3D"signature_bookmark"></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt;" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Alexander Kanavin &=
lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> November 3, 2022 4:06 PM<br>
<b>To:</b> Sajal, Sakib &lt;Sakib.Sajal@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [kirkstone][PATCH] blktrace: ask for python3 =
specifically</font>
<div class=3D"PlainText elementToProof"><br>
<br>
</div>
<div class=3D"PlainText elementToProof">&gt; This patch should be sent upst=
ream first. Same as in your master submission.<br>
</div>
<div class=3D"PlainText elementToProof" style=3D"font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255);">
&gt;<br>
</div>
<div class=3D"PlainText elementToProof">&gt; Alex<br>
</div>
<div class=3D"PlainText elementToProof" style=3D"font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"PlainText elementToProof" style=3D"font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-=
color: rgb(255, 255, 255);">
Please refer to the mail I sent for master branch:</div>
<div class=3D"PlainText elementToProof ContentPasted0" style=3D"font-family=
: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0); background-color: rgb(255, 255, 255);">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/17339=
3?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cblktrace%2C20%2C2%2C0%2C94=
790255" id=3D"LPlnk502085">https://lists.openembedded.org/g/openembedded-co=
re/message/173393?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cblktrace%2=
C20%2C2%2C0%2C94790255</a></div>
<div class=3D"PlainText elementToProof ContentPasted0" style=3D"font-family=
: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"PlainText elementToProof ContentPasted0" style=3D"font-family=
: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0); background-color: rgb(255, 255, 255);">
Sakib<br>
</div>
<div class=3D"PlainText elementToProof"><br>
<br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
></span></font></div>
</body>
</html>

--_000_DM6PR11MB25380AC50753F79ACE2B026EF2079DM6PR11MB2538namp_--

