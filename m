Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE988C77B76
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 21:02:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.64213.1682370106646137872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 14:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IZVzFDjf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=347898eb4c=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OGldLM030391;
	Mon, 24 Apr 2023 14:01:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=SyZ80sE46+8GIy2Hh/6EDAWzvTJYHaGhnxvLHMNk7QA=;
 b=IZVzFDjfIrBrxJpD/Qxf+yjpPIg5195da9Er3T1XxP1j9VGsy2D8H4MXgAJmOddJ7FLw
 mUXEDflI4go30UpoNCCgt2sxdnouQt+RIsfM7unguNNgA/5AQLnKc+IycVuE0Avixjsd
 /DMBKpm+XnCUDkq7CfQxgECjr0KjP5K+hEeKTpYsnrrjKJK+TwMnf3579Se5M/SgApsk
 FDq6eHwu9ub3GqjzoZQ95UD2RlWGWtbLsVM5QRX6iOUgrET94csbLXpneKnxsL1jewTt
 OovYBrpnTHVRxN6K3yhVwxFPYJ92CGSDHY9Em6x3clVwv+p6s/Gp/ILa5DDdk5/PHZdp LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4av5jffd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 14:01:46 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OL1jbw030348;
	Mon, 24 Apr 2023 14:01:45 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4av5jffc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 14:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKoH53z8BgVClls22nP+APUgMTgXv+RjUtFIzNkwUgSpaLHthM5Qnqh+AfO/UEHSTPQO+n8JxcYOBdQWW/6GEp0oidl0asJW7LizfHETmG7wg+HlVahKMvkwztS0lE7UVYA+IKSgaTWjOT/HgLB8OcdCmauiJ+AHI+HMkkQhFxxewrP6BNvx9J1GK/PIKtcWA3VIBcYuHzMwgSSjxMhk2T+TU5SZZvLF9lYfZEIZQjl242aBFGD0ffc13LGcyksId1lossHB1AH8ld0K6gVhRPFuYiz91rj/PlO265s2jPyc0APmchwLf+XzD7jxtigBTjR2pMq0Gzl84fm7H+17hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyZ80sE46+8GIy2Hh/6EDAWzvTJYHaGhnxvLHMNk7QA=;
 b=U/dW0DzQSyrRUKs7ZbvXRhdze9ayqtHUSjclIPuWyRgOGKLySUMpN5RBQfd7f2SV1eXJHcQPvQ42bKzaZsH4/2EoVf/1FsAvuCAjGG6blaNFxp14dh3NkEvKuGBpW/YktKplEcT2kzigOWzVSh4McF6Bicr4BLJdcp2tyVoZ4d54yjHeeNOHfcvoOIAjySmGj6Z5RL0Ja9AeqPfkgZZ2EfcamDG4NhN6hyeNkCO3bgaOUcGTgHJeKA9eIhYcrbfbNKRbh98O5KPWEZYSZf2+GDFa5QcHceNf2khZhjwTGCBLkojriUKl1L7Dm1KovujCHTduOPB6dEBQBuaLTW1ICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 21:01:43 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::f669:13b2:de4e:dc72]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::f669:13b2:de4e:dc72%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 21:01:43 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Joe Slater via
 lists.openembedded.org <joe.slater=windriver.com@lists.openembedded.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [v2][oe-core][PATCH 1/1] ghostscript: fix CVE-2023-28879
Thread-Topic: [v2][oe-core][PATCH 1/1] ghostscript: fix CVE-2023-28879
Thread-Index: AQHZdtMLlOskhcjAfUioqGQJ9y0YnK86ya0AgAAnWLA=
Date: Mon, 24 Apr 2023 21:01:43 +0000
Message-ID: 
 <BY5PR11MB399295C6B2B735E84259619988679@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20230424173432.3199964-1-joe.slater@windriver.com>
 <20230424203620.435501df@booty>
In-Reply-To: <20230424203620.435501df@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|DS0PR11MB6422:EE_
x-ms-office365-filtering-correlation-id: 34374aa0-5169-4fa4-6f15-08db45071bb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Q5j1Q+30BE0sZstI/qbOEVvfxC+5zjS0XYsSEpSa5m+eDabPkrGWlf4q7WSOlrZuqlTG8zysqvI0lTaD9tMZrBrWnccINuPsgCGLInQOu4wcRLD03Qvq1JiTmaIWwjcMsUogtcctiBLWbZ6U8fpkalcbrvSID3QYQv4uIL/GcRglWIfZlxEeNYorNcTsN8L6lwELoCjR0CKc29M3pQeKsoU93J5tOAmXJskDyfSebYHKazpaNuTHHogzKrWekOAZbKGf9SyRU5EZ/HRAdac4Qp9b5zGPOOyA5Uqx+pH5P2IZ1HQuPVJVAG/+njbaaPo+k3pQPJZyeB5bxnCTfled/EntebSXdl2f9K0KLLEXQlx3iAb7/yyVAC8cIYD2pB8S5v7fuP9UQs4FAri5sBwCYaKKYsMV7xdva2rWe/F2XNCbv2uCKNYgl9P2zstEYR8gKFJBEPwYD/+RCqCozecYjNGnPC48dMAkPJht4lCe3iz/JIvhFyxduzhO5ciFYjvxvMESb4nsRtDWLS3GQB9VoLEz5f0o3+iOUgUpdHp8f1UbmOz0KXDVE52KGwUOenw73Zj6/qvoTTi1b5qoiRGN0528+pd+JKPc2QVrC4TMwnxJFE+2KInIAMkp5wX/2T+KoCPAN4r5oqH+LQLfMGSnsA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(376002)(136003)(346002)(366004)(451199021)(966005)(6506007)(107886003)(26005)(53546011)(9686003)(33656002)(5660300002)(38100700002)(52536014)(86362001)(186003)(83380400001)(7696005)(71200400001)(478600001)(54906003)(110136005)(38070700005)(41300700001)(2906002)(8936002)(8676002)(64756008)(66446008)(66556008)(55016003)(66476007)(66946007)(4326008)(122000001)(316002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BQjOg9Toa0Zgtg3kLGXKTXrqdhTOj7Lr3ad7Q3ipgunfVAFDX0wjJjhf7RBU?=
 =?us-ascii?Q?krdaeiqLHPG97jS6/M7GZva+6jq3gu0vSzD/4+j5YSDkTjs6wLWUl7pil6H0?=
 =?us-ascii?Q?Ptvbu2vbfW7jxgTg3K1dTrLMo4Q+TXJOb8J41zoPW3pMwZhj0DmgoUIi0fr4?=
 =?us-ascii?Q?6DfUVT657SRYGGsxeM8OO2yTDVONr4FmtLDdBN1vCn18aDFkLj8kRXhRIbVg?=
 =?us-ascii?Q?TtihjZ6bVISzTlCn4QJokmUXh7oAWqBETAF1sLSIFAGNTQ0pWC+OhKErSaIG?=
 =?us-ascii?Q?VDBiMNYG+QOE9CkU/81GyuaznYbaIuVe8F716HqGeDlUaObFc07uWC/pnJQ7?=
 =?us-ascii?Q?VYqm2v+z8SgEetDQ5O2qzFB3NGRaxLq8IhyYf+5OpXJGx2LgrZEbcHqULIPK?=
 =?us-ascii?Q?WV/1QceKHd8LJ4E8hRG4bbxfW089vnVR7iJe2WfT0miYTHyaxSqoBdvbYnn/?=
 =?us-ascii?Q?5scyqKUkgzoPZCcc91Vb4C1jULF1SVZzmccSTNTML3xRIZSC0bDz+ApwlPVA?=
 =?us-ascii?Q?BzqIOQw4KYTMIIIjrkp/ZSzI2qEIFFQ9mtyj6NNDCBjddHFQhsPFqA6hRi6+?=
 =?us-ascii?Q?WjLbkMYrEFlpofdoak2uXG6qak+GfatsADa3x2QbXthSVM8p+RJwZA8gc629?=
 =?us-ascii?Q?6kQEKR6gF6Lko4SQuvUopzLk4bw33fqTMEa7m2KwpFSoyJlI2qHT8y4wnWhc?=
 =?us-ascii?Q?+L63ShTibpI4nx/DruPfbvtytftj1z0yUlYINhkN3XjxMmqYgalybuwlHvb4?=
 =?us-ascii?Q?Vi2zMUQvkk1Qvh5ejCLL9qgbPNoA83r5Bj6l5RuEALz6bQ1d17niIRQa0oH1?=
 =?us-ascii?Q?xV8iEQF/qTSu7QiqJkANrb9+dXUCZR8wbbDNlf8HtY3FIpG85UPnAr2jrAXP?=
 =?us-ascii?Q?71EYatRHmGQWx5UDOdquZAzh1S98X8GjKPa3WLEiiH8nCv8TRyXKsVfQTyqf?=
 =?us-ascii?Q?X+99VLVSIb/ZbmucSUvlKu+PMHHr+qLrrHasyANTUj0Vb+oPhvf7bm52glWf?=
 =?us-ascii?Q?ADFvp7TVAx6TlEEc8kkxJc6fEtU57c8cUkY1eNRk8hKMf68FljlmiW7TxatD?=
 =?us-ascii?Q?QMuGucj6+XuQukfjzV3JLeJmaeEJ4WtwA2GPk/6bqmopHJqvrMyfeFC5jYa4?=
 =?us-ascii?Q?Rb9x2BCBHtUmvDy55lYfBcr0sIHqJgHGOs8fxCKgBREK2Q5wV91Np+/Vs9/y?=
 =?us-ascii?Q?K1vw8i5nh+ZnKe9rrOPGZjplIlLbR0/gEdNG2YTvARz4TCFq7Gbx/0anhdsO?=
 =?us-ascii?Q?oszJ7mDnx5qnbKtrRqzkpUKcZBTasRdA3Ws3ZRnE98Wx0f6sTRA6Kz4X6D6w?=
 =?us-ascii?Q?BnqVODq6FMdQ2E4mqjGON5kIfYJYKM46uQsSr8DlutLOf8vckglGsumCPAKa?=
 =?us-ascii?Q?6h5xCXula2cy4ORw14LjV0t8+7gUNfN7slrBPS1Gg2P0/l7bq0wkroSC7pR2?=
 =?us-ascii?Q?7f/gHxfDtOenVCbIN+bWv5XXRCBvsz/kZOXjLg7iasHvX+qVu/JBJZso3zqK?=
 =?us-ascii?Q?zIJNnUs4V1OFeqcerIjNM3oPdeJFh9f1ZBF6KGirOVNbFEejV9RCy4HSvirR?=
 =?us-ascii?Q?kI4BtKmOUnM5D2vu2uJ84jtu+HIjSACV3Hj+5CxO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34374aa0-5169-4fa4-6f15-08db45071bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 21:01:43.4334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kKp2gquk6T+fXZP1dNTrEoKhgDxpu1KiUYKl1qDVxNI2PCcyL/OwHM/Q1lVC+95e3VDcNgigjB3hFWKcvnno1ulNxH3iQF3hYx0VQOJQOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
X-Proofpoint-GUID: 7AhOwktNb2yv1QaePUEjbvzH_0EJ3cJa
X-Proofpoint-ORIG-GUID: T-c-zZ1AkeToqCbylscCOwMk15QDBEUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 spamscore=0 mlxlogscore=966 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240190
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 21:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180368

Thanks for fixing the sender address.  I modified my git config, but this h=
as never happened before and I think might be because the Signed-off-by in =
the original patch is malformed -- it's missing the terminating ">".

Joe

> -----Original Message-----
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Sent: Monday, April 24, 2023 11:36 AM
> To: Joe Slater via lists.openembedded.org
> <joe.slater=3Dwindriver.com@lists.openembedded.org>
> Cc: Slater, Joseph <joe.slater@windriver.com>; openembedded-
> core@lists.openembedded.org; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [v2][oe-core][PATCH 1/1] ghostscript: fix CVE-2023-28879
>=20
> On Mon, 24 Apr 2023 10:34:32 -0700
> "Joe Slater via lists.openembedded.org"
> <joe.slater=3Dwindriver.com@lists.openembedded.org> wrote:
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> As you can see your sender address has been mangled, and as a result the =
patch
> is rejected by the the openembedded git server. This is not your fault, b=
ut we
> need you to modify your git configuration to prevent this from happening =
in the
> future. Have a look at the wiki for more info and how to solve that:
>=20
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbe
> dded#Fixing_your_From_identity
>=20
> I'm taking your patch for testing on the autobuilders, fixing it manually=
 so you
> don't need to resend your patch this time.
>=20
> Best regards,
> Luca
>=20
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

