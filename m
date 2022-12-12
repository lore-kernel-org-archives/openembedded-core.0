Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9667CC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 10:20:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.39663.1670840416423118437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 02:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qomkLmbM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9345b5b890=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BC9qmxG019483
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 02:20:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=SOBZSpluuQ09B7i4+xngFGP95ov8X8k5tJYMiBLbz48=;
 b=qomkLmbMEgjFUyUDg1Gs+AHYBskfyDJHDddC0v0uHuoMU9yMnkAzRqv4u+s/PPNzh0ts
 4RWJcfvngi6qymOlKQCjumm0ZTq3A0fit2foI9ke7xNrHDj+OWFZikLr+duvIP4o6Uv0
 Wq3NYEayQBmb6YfGfSggvLbADjzoNGlvgs46tacW9Zu06inTmtEfpcf9I26NyabdmpaG
 HEd61nKKlIcNxc539HIT/HYwXmW/fHVo1NStxELG+bL0B0naAGsRIGo15uNeQ0GZlmtm
 fYznsb+lLz9jAJHsJzU/f0pXF9yclaf/8m38sW3e9hSSFu5WtYYHcwVBk0aBbqyrmow6 Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mctgp94vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 02:20:15 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCAKFgM016471
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 02:20:15 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mctgp94vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 02:20:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRj+D4BTgPoWnO1aEb2qS9bcTZMHRKoofHWRM7SR5yom+pPgmPXPpc1jTLRzTK7JG7+4pZp5VQBV0h1zgKv7Gig82X+Y/eNcpiAr5oQxn7oHveqFrW21Ex1Y/UeOhoLYL5yVuq32rvvzdLqextFE2lwlwaDXlQh86yszhYqmNlR1A+UZ+D9wFM1FmoVFDiFk/Pm5KcNiTajohspVziqw5xbjRsVgkgUK6I9oOLQAnrTdziLpl4ydzOzOq/qT8FAIP2ev9Z/7MqVL2JIlAk+yBFwQDe+8jnoFMClb9YX920fuYgkvmDViAV8T262XqY2gF/Gl33m/U6cMBNeudEz5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOBZSpluuQ09B7i4+xngFGP95ov8X8k5tJYMiBLbz48=;
 b=OEO9v6L2vSGOAoZ+CJdhlIF6DLs0E8fhoGWa8RqznPKYpSioLbLrRItk79rWb9RIzubMWZm7XgJbPusqn+p1IYa8QUQ8Cg75m0n4d9usELEJg7vN7jD129sf2d0ZyqMmYLvfbdihl59My/vqnePqpZ6YAEQxKNqFM3Y+IvaEDhh4YkS+qCpj0f8JIZs2IRa+QjiLKZN56A378jbPYSmPTb1vvHc95mZhbBdJp4FZFpU4byS5ImKkGvZW8XkrHtBDEa6GIRWyap0JZDTfB0mRc9czXG971mBJE5RBG3RsW012EKk/216BnaB3TviLJ6K/6tgznIT0Lk6AAiI4K4Y9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DM4PR11MB5568.namprd11.prod.outlook.com (2603:10b6:5:388::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 10:20:13 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21%2]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 10:20:13 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to
 REQUIRED_DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to
 REQUIRED_DISTRO_FEATURES
Thread-Index: AQHZCJEP7y3aX3R1Uku0R27KTi2Pxa5k9wUsgABSmQCABMtqxg==
Date: Mon, 12 Dec 2022 10:20:12 +0000
Message-ID: 
 <CO1PR11MB5009C30880A024CEA0FF9F5FF1E29@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <20221205095151.3820258-1-mingli.yu@eng.windriver.com>
 <CANNYZj9RXtEWM_NoQJsC7Ej9W4k97BenfaPWccyypAxme0eobw@mail.gmail.com>
 <CO1PR11MB5009CDFE37A343FF56CC29CAF11C9@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CANNYZj94jqX06EqVxMmCDrJcuo7fr4rQvJ-6L7rJALZUzUvwgA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj94jqX06EqVxMmCDrJcuo7fr4rQvJ-6L7rJALZUzUvwgA@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5009:EE_|DM4PR11MB5568:EE_
x-ms-office365-filtering-correlation-id: 8d0bc568-d920-46ae-1293-08dadc2a74a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +7zhGY3I1PNeX9N/bNTkAXQxPQMHrPAK76Rgbi6obZsGnNaLnhelgAsvN5s8VrXEs9xOvdDrOA/3JHlBAgiTs3LbE1rADEtdRsmITrEsa9clqrBMGKqWjzQOOTAYCxrlDzwr8WYzSCI2dfHOxhx9SPfEEIZMEB3enN2/dLQ93Z9PmoFqzxU/NkOyLkjc5QRBMbDlF7Svxakbvr95r1BwkxkC3czNlvByj625sfzLTFRN0MIX6yZD44bE48xnV2Ec5zSLBMCTpyUk/vilp3bL0cZXeHXFnlCL/eHyOHNl40Z/v8czJ3CaziPsWj06AUEAkmWVg1nNW6BcrEhDv09dsecENlLYs69Wokofe88GYffopf7xCmz5loi4l2+1CdVkLjGxWhcjZsVGW3sjWHPYSX45vja2JC3xguN7sP3De00R9lY94PH59l+fsZoz6lGxGJaNZBMGl7bzfV32h7WG7SghdshuI5ienvjxv2QpmoFKn+3OcDxkDO+F3etvbYxwf3D5RtZDv5v5JfQyqbAn+Df6xj6ujyKgWoesEjhhrakx1QVYlJKSE5DlpMaBufqZHG3j2VgPwCWMwTD5YNnLzuGA3itHqO788ROaz8fdprpkMifGucMpHXLPdB1wIxd57iEr2ITwJSG0Z8/ynkCVOtVlhd0de3eRDKkv/WV8MtjH+R3P4t4WUL2C8KJcCSJSZEgSHIAAyB0DdwMhshXY3Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(136003)(39850400004)(346002)(451199015)(33656002)(86362001)(38070700005)(19627405001)(83380400001)(38100700002)(6506007)(478600001)(26005)(9686003)(186003)(122000001)(7696005)(71200400001)(53546011)(4326008)(316002)(6916009)(52536014)(41300700001)(76116006)(8936002)(5660300002)(66946007)(2906002)(66476007)(91956017)(8676002)(66446008)(64756008)(66556008)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?L4EIpiCfgXxJUh67/2MXztxvzWlo1HF1+OC01Al18aE30OF4ouXmmtvsxgBc?=
 =?us-ascii?Q?FUI9CKyFpOdiBefft5LTOHUzk34/NIiHW1kwz4clNRJrgMippFfBSpCc2lLn?=
 =?us-ascii?Q?AZdxruzTn0SRWVZbXo09KVLzGsXk48sSNCeSNNA9xCawhSEzatdy5lvx4w5f?=
 =?us-ascii?Q?Xc6o7Jiggr3Z1JcYv/gnAXW8WO/G+Jtr9NxlNI1QY+GxXKaLqa1OQAg4TIe7?=
 =?us-ascii?Q?VXPFly/d89qSCqKEZnO/GXcz6RXE2m6yN/qplI7EqQbWhff8admFJQBl5Yiv?=
 =?us-ascii?Q?5dX/cj5diz8tBghuZSkG6qjWsIP5HtD+XDbyvyoCqbwlIHMhUWz3gKWAb61P?=
 =?us-ascii?Q?iiL7+V1Mg4YyK8M3gJbxg87swiOcqKJ1V/9UKX60xpr263HLGJaCdW/NzqgD?=
 =?us-ascii?Q?0pl1HonyJMxbm25OtXDv/6WCzdDLSLr8vXEYpz23GRZxHfo3WsMSgtUXbJIt?=
 =?us-ascii?Q?qEI9Zc01eW6bHAi+Psf71E+Sfuz1GllZM2klDEARw21d5DGRZzj4KGpfM4yg?=
 =?us-ascii?Q?ya3yFLDH2Ia1qPA3hn7XEWW+x9qmkdXIzOHNazxu81rqTEJ4FK3z3zUyOWLk?=
 =?us-ascii?Q?oQEQmKCgQjWIbRkCo04EO+X3Gfz+jwI/aX0vDoJR8v6fNNbW+fZql0V7Gajz?=
 =?us-ascii?Q?Bg9KO91v88v8/I4t5/6AxVZd8IRhRVfM8HIuRO9psiQ+Sb+iWfxXEqhILjoO?=
 =?us-ascii?Q?vbi5EjbIcvzteBu50IRm+cwrblk5Brkvwb80TLrLx9EyE/kg+aNbt1N1IzQM?=
 =?us-ascii?Q?nmAmoLs22gTlbXkR7kkMqNBpBuV2zGWmslo5D1aIFh0LYGURnkw0AG+Q93AC?=
 =?us-ascii?Q?ek4YmTX62W84MHrOWi75xhjOct9uvtG/uWIejgULJvUBaeB+jxgDxxj4r2wu?=
 =?us-ascii?Q?Saxb13407WTORmzpJX7p3gW7abyKLWG7o0et6OK+KSTnoz7qK7yGETi8rK3U?=
 =?us-ascii?Q?o/Jv+KoK39/vY8kPz2XEJJZbOwLHKZl32kW4Emr3wKkiykFH/lSo45YIMJ7m?=
 =?us-ascii?Q?UF8RmZU69efWDuo7VyWJxfp2zqU6v9IWt4tmn3rtCQ1RtZNhBI3CLCJf8WkB?=
 =?us-ascii?Q?LCyBKzZgV8KI+8DX/QkoGNLPggMMVVBUz+CaCaVNl+br3Yum742q2QNfTzQH?=
 =?us-ascii?Q?rwA5z6PSrcGxc7F5F0LgvD9MUkB+uevHvrXsnxs7bgbPkW+jWJ1YwRleBQxQ?=
 =?us-ascii?Q?PadWkmumNUkTk/6okfrDTEBCwr9EgLN62joLyUIxNtWhsK+gJm+41K68c2K6?=
 =?us-ascii?Q?iexE44ZnudSQBOTvZg8kS17g6txcwhSkcACnom+omi+tii+Hl87tOMb2+Q4M?=
 =?us-ascii?Q?jMAFh9GSNsKaR8C9n3gB6cnLVwmMnhYo9t+yT4HRBz/hMbT4EI+s4SUjtZFA?=
 =?us-ascii?Q?FVccMokBPpP8oZNBKLR+quOZxikbxyM6x2Xj0DPfhlxODfBYQCOHC8X7lC29?=
 =?us-ascii?Q?b6NSuYKzt4i+iIciineKTiXUfDtVLaqUtNr4EUm29f8jRmCK3x1gaPHEfQ6X?=
 =?us-ascii?Q?gZBkVrFCx+tFxxCX6ODzo/WoGe8DbmcnKkaMZhS9GFwXJHTHhRBQvq5cVL51?=
 =?us-ascii?Q?N/IQooF+SFyX9PCqTQxlI9YQTobMjNNzks0ahA9c?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009C30880A024CEA0FF9F5FF1E29CO1PR11MB5009namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0bc568-d920-46ae-1293-08dadc2a74a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 10:20:12.9968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IA/yeA3V+Wi9H8X2OtQcpQQjRfQgWXz6zZlbHLGC/AQ+MXk+3rczlE0KqOOpXo1sX9WHk0q4ZYZzbFTSu2ueeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5568
X-Proofpoint-GUID: XBYwIMm2rtT3xY9oqmEt0d6qUu8oUmYH
X-Proofpoint-ORIG-GUID: p38SypJzgM7ulWIYaTaHi5lcC4YLRRq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 10:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174490

--_000_CO1PR11MB5009C30880A024CEA0FF9F5FF1E29CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Not only xf86-video-amdgpu_22.0.0.bb needs the REQUIRED_DISTRO_FEATURES =3D=
 "opengl", there still comes below error if we only add REQUIRED_DISTRO_FEA=
TURES =3D "opengl" for xf86-video-amdgpu_22.0.0.bb.
ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/oe-core/meta/re=
cipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb DEPENDS on or otherwise =
requires it)
libmali-xlnx PROVIDES virtual/libgbm but was skipped: incompatible with mac=
hine qemux86-64 (not in COMPATIBLE_MACHINE)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xf86-i=
nput-mouse', 'virtual/xserver', 'virtual/libgbm']

Thanks,

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Friday, December 9, 2022 17:05
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQUIR=
ED_DISTRO_FEATURES

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello,

this means that xf86-video-amdgpu_22.0.0.bb needs the
REQUIRED_DISTRO_FEATURES =3D "opengl"
line, but other x11 recipes do not need to be changed.

Alex

On Fri, 9 Dec 2022 at 05:10, Yu, Mingli <Mingli.Yu@windriver.com> wrote:
>
> Hi Alex,
>
> The error as below:
> ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/meta-openembe=
dded/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb DEPEN=
DS on or otherwise requires it). Close matches:
>   virtual/libc
>   virtual/libomxil
>   virtual/libusb0
> ERROR: Required build target 'meta-world-pkgdata' has no buildable provid=
ers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xf86=
-video-amdgpu', 'virtual/libgbm']
>
> Thanks,
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Monday, December 5, 2022 18:04
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQU=
IRED_DISTRO_FEATURES
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> Both of these patches seem very wrong. X11 definitely does not require
> opengl. I just confirmed it by building xf86-input-synaptics without
> opengl in DISTRO_FEATURES.
>
> Can you show how the issue can be reproduced on plain poky? It seems
> like your local config or distro or BSP layer does something which
> triggers this.
>
> Alex
>
>
>
> On Mon, 5 Dec 2022 at 10:51, Yu, Mingli <mingli.yu@eng.windriver.com> wro=
te:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > xf86-input-synaptics depends on virtual/xserver which needs opengl
> > DISTRO_FEATURES, so add opengl distro check also for xf86-input-synapti=
cs.
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b=
/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > index 8b3f19426b..3fc54af3e4 100644
> > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > @@ -17,7 +17,7 @@ XORGBUILDCLASS ??=3D "autotools"
> >  inherit ${XORGBUILDCLASS} pkgconfig features_check
> >
> >  # depends on virtual/xserver
> > -REQUIRED_DISTRO_FEATURES =3D "x11"
> > +REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> >
> >  # FIXME: We don't want to include the libtool archives (*.la) from mod=
ules
> >  # directory, as they serve no useful purpose. Upstream should fix Make=
file.am
> > --
> > 2.25.1
> >
> >
> >
> >

--_000_CO1PR11MB5009C30880A024CEA0FF9F5FF1E29CO1PR11MB5009namp_
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
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Hi Alex,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Not only
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0">xf=
86-video-amdgpu_22.0.0.bb needs the<span data-markjs=3D"true" class=3D"mark=
vht3otmxe ContentPasted0" style=3D"background-color:rgb(255, 241, 0);color:=
black" data-ogac=3D"" data-ogab=3D"" data-ogsc=3D"" data-ogsb=3D"">
 REQUIRED_DISTRO_FEATURES</span> =3D &quot;<span data-markjs=3D"true" class=
=3D"mark08tnhgirq ContentPasted0" style=3D"background-color:rgb(255, 241, 0=
);color:black" data-ogac=3D"" data-ogab=3D"" data-ogsc=3D"" data-ogsb=3D"">=
opengl</span>&quot;</span></font>, there still comes below
 error if we only add <span style=3D"font-size:12pt;background-color:rgb(25=
5, 255, 255)">
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0 Con=
tentPasted1"><span data-markjs=3D"true" class=3D"markvht3otmxe ContentPaste=
d0 ContentPasted1" style=3D"background-color:rgb(255, 241, 0);color:black" =
data-ogac=3D"" data-ogab=3D"" data-ogsc=3D"" data-ogsb=3D"">REQUIRED_DISTRO=
_FEATURES</span>
 =3D &quot;<span data-markjs=3D"true" class=3D"mark08tnhgirq ContentPasted0=
 ContentPasted1" style=3D"background-color:rgb(255, 241, 0);color:black" da=
ta-ogac=3D"" data-ogab=3D"" data-ogsc=3D"" data-ogsb=3D"">opengl</span>&quo=
t;</span></font></span> for
<span style=3D"font-size:12pt;background-color:rgb(255, 255, 255)"><font si=
ze=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted0 ContentPast=
ed2">xf86-video-amdgpu_22.0.0.bb</span></font></span>.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted3">ERROR: Nothing PROVIDES 'v=
irtual/libgbm' (but /build/layers/oe-core/meta/recipes-graphics/xorg-xserve=
r/xserver-xorg_21.1.4.bb
 DEPENDS on or otherwise requires it)
<div class=3D"ContentPasted3">libmali-xlnx PROVIDES virtual/libgbm but was =
skipped: incompatible with machine qemux86-64 (not in COMPATIBLE_MACHINE)</=
div>
<div class=3D"ContentPasted3">ERROR: Required build target 'meta-world-pkgd=
ata' has no buildable providers.</div>
<div class=3D"ContentPasted3">Missing or unbuildable dependency chain was: =
['meta-world-pkgdata', 'xf86-input-mouse', 'virtual/xserver', 'virtual/libg=
bm']</div>
<div class=3D"ContentPasted3"><br>
</div>
<div class=3D"ContentPasted3">Thanks,<br>
</div>
<br>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Friday, December 9, 2022 17:05<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to=
 REQUIRED_DISTRO_FEATURES</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hello,<br>
<br>
this means that xf86-video-amdgpu_22.0.0.bb needs the<br>
REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
line, but other x11 recipes do not need to be changed.<br>
<br>
Alex<br>
<br>
On Fri, 9 Dec 2022 at 05:10, Yu, Mingli &lt;Mingli.Yu@windriver.com&gt; wro=
te:<br>
&gt;<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; The error as below:<br>
&gt; ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/meta-opene=
mbedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb DE=
PENDS on or otherwise requires it). Close matches:<br>
&gt;&nbsp;&nbsp; virtual/libc<br>
&gt;&nbsp;&nbsp; virtual/libomxil<br>
&gt;&nbsp;&nbsp; virtual/libusb0<br>
&gt; ERROR: Required build target 'meta-world-pkgdata' has no buildable pro=
viders.<br>
&gt; Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'x=
f86-video-amdgpu', 'virtual/libgbm']<br>
&gt;<br>
&gt; Thanks,<br>
&gt; ________________________________<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt; on behalf of Alexander Kanavin &lt;alex.kanavin@g=
mail.com&gt;<br>
&gt; Sent: Monday, December 5, 2022 18:04<br>
&gt; To: Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
&gt; Cc: openembedded-core@lists.openembedded.org &lt;openembedded-core@lis=
ts.openembedded.org&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to R=
EQUIRED_DISTRO_FEATURES<br>
&gt;<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; Both of these patches seem very wrong. X11 definitely does not require=
<br>
&gt; opengl. I just confirmed it by building xf86-input-synaptics without<b=
r>
&gt; opengl in DISTRO_FEATURES.<br>
&gt;<br>
&gt; Can you show how the issue can be reproduced on plain poky? It seems<b=
r>
&gt; like your local config or distro or BSP layer does something which<br>
&gt; triggers this.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, 5 Dec 2022 at 10:51, Yu, Mingli &lt;mingli.yu@eng.windriver.co=
m&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; xf86-input-synaptics depends on virtual/xserver which needs openg=
l<br>
&gt; &gt; DISTRO_FEATURES, so add opengl distro check also for xf86-input-s=
ynaptics.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | =
2 +-<br>
&gt; &gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common=
.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc<br>
&gt; &gt; index 8b3f19426b..3fc54af3e4 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc<br=
>
&gt; &gt; +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc<br=
>
&gt; &gt; @@ -17,7 +17,7 @@ XORGBUILDCLASS ??=3D &quot;autotools&quot;<br>
&gt; &gt;&nbsp; inherit ${XORGBUILDCLASS} pkgconfig features_check<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; # depends on virtual/xserver<br>
&gt; &gt; -REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
&gt; &gt; +REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; # FIXME: We don't want to include the libtool archives (*.l=
a) from modules<br>
&gt; &gt;&nbsp; # directory, as they serve no useful purpose. Upstream shou=
ld fix Makefile.am<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB5009C30880A024CEA0FF9F5FF1E29CO1PR11MB5009namp_--

