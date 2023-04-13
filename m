Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F04C77B6E
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 15:03:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15734.1681398175203378870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 08:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=afLcOXWc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3467803cfa=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33D8SJHV020566
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 08:02:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=U16pwVObhr5eC2b5nb1qpmC9MHqCHqEPGW6r2rJ7ek4=;
 b=afLcOXWc99pETndcEgmlcKYD/TbQ1KRqQY/wvLfDHDm+Ert9ezd5O+5OOQgBivOYt3tp
 si1JlIc9GUuZMQYqzqstxht2N3SddsaCTWz/NlnJk6iab8er8iV6nCNnUv2B5kM4mHle
 LvZSuJIUWRjFMPavWYjw6chCBWwo/zGpQzLuLiorXWeO4neU6lxm85n6y3d3iEf6qVCC
 H2JKzrQEY+zcKerX5e4oQnOOb5XAoY0/HH+5oHU76sdE5knz9KBGBku0+u9f9kPn6XnM
 hvoACxs6MynmwjmMLYgEPd/u5wrw60ucdS0HrHxHAlliUfbm/cDLEG1+g7cVo0wzTWZA Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7d8rp1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 08:02:51 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33DF0Lig023512
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 08:02:50 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7d8rp1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 08:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJJ+omj3/cs+jKPBe3I2cDMh3YdFz7v7+CqDXXHgsuayv+stB1Xjl/ecALZuHhlZYBfcVb+56ZL4U/5GmK86x5IBOv4qKLV0+XXZa5S2jNVpZm8kDxIyAuTnqdKli8m/dGyiKxQZc2qWhdnBNj/WW33cU+m3sbxSaJqHn5jlI4paHwSj6eeUw/3oJ+fB3j2Fg/UqggqDO+aVdPYjjhE1T0P+hqFRbDUrZ5rAZIW+pIK0xC/PpZKVR4I2BL0ypjYaYv11OjbX3Pi2YMaDuEfnh/z+Is5mLnw7tHF6dyFcJSiCneEDPaFHu9iPx2PmbLnbvQb8I+ej+iq2Nc5jKpBmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U16pwVObhr5eC2b5nb1qpmC9MHqCHqEPGW6r2rJ7ek4=;
 b=QSN2yhTbqToFgMOUQaqutRSv6BsERNZaE7WDyfP1dRvODhvi7QYjPPVGR6MuZDA/qNjszMIwcAKDc8U/6vDAF64YQ1bEeY7Joviuvtw0Hvuud/AJ1TI3+NHlnJAAYw+CEwHzGb2dS5SJEUHhy7LnElqhaRd8wGOlOPvhmubpPZvmlG/n5T1jxYLRwHSnNdAtmKD/aK9n4cb4qj+GwD9ilJmbZCSWDKPEVxg6VhqXJCW8v+WlOFZWxxA+T4CJ9J0IeWOU9LZcF1u1F0qCkYUoR+Mza8mjSAWNgjAkaBZoqQovL3vH+fRqGzsEQn1NUM2j+BGacg6ZoZW/0k4v3skcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 15:02:44 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::f669:13b2:de4e:dc72]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::f669:13b2:de4e:dc72%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 15:02:44 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe-core][PATCH 1/1] go: fix CVE-2022-41724, 41725
Thread-Topic: [oe-core][PATCH 1/1] go: fix CVE-2022-41724, 41725
Thread-Index: AQHZbW0gVyf7oKfipUOX7Hcn5k1sFa8oIrCAgAEy2dA=
Date: Thu, 13 Apr 2023 15:02:44 +0000
Message-ID: 
 <BY5PR11MB3992A24F71E62BDB3706040F88989@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20230412183206.993094-1-joe.slater@windriver.com>
 <20230412223843.2f6fee5e@booty>
In-Reply-To: <20230412223843.2f6fee5e@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|SJ1PR11MB6249:EE_
x-ms-office365-filtering-correlation-id: 419cca19-161b-46fd-12d3-08db3c302307
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Dj4Ms1hDxm+8JZV5LPtGwuPo5Y+3nSHr/i5u1B4MxDi8Dcd+0x9kjNXfK8NyGiwQsOSYt8G+rPTw7T498O944fJubci16fyWKms3f0yIuiH5FWk8YjWPF0zGSD1JsT2zaWYcxdsnEowKOhbHjQ4TzfxFU/yQgLoPpRzO+5da0w31Y4By+n72sceqCCfBUKZ6BBZhxqwkjcv7NvruZkB424nXF16fK1D7s/7hxrkhCfm9cHuYWBW+VTZ9Z/x8+1nGXRRbbazoF2yprsjTMr6UWjW98crT9KCoaUcZMUIgwodACR8AWdeRE0bEFl9PzxF5GBovc2RTQgLYzEnBzvelbffGnRcC1ruVSIKwpBRvrH8lPZKkKwTzBIwz9TgPHuncPK7Hu4b7DGfSsm9g4fGXCid0SbNNu7JQN4gmXD6qODks2MpOLNNcu52gOgJEzpsITQJMiBCz668DTWKnx7lplPfoiBBcQwY050LGJbA/ioeElLPK96p+zbXlO+CyixVPrMdwagiy73rfzTYBkVf8VQVwArrRizs7wLwJR/2/xmtgBBuTvTRRdoaYR4gB4lEuK7pSKiwDsJhf1zWpaNDWo9r4TQr5CQf890LWc4IaCPg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39850400004)(366004)(136003)(376002)(451199021)(26005)(38100700002)(122000001)(5660300002)(2906002)(52536014)(66446008)(316002)(38070700005)(55016003)(8936002)(86362001)(64756008)(66556008)(8676002)(66476007)(33656002)(66946007)(41300700001)(4326008)(6916009)(6506007)(966005)(107886003)(83380400001)(76116006)(54906003)(53546011)(186003)(9686003)(7696005)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?EynAJZFF+37v58EFBO43C4r+ZisIZxJQla2hGnlpfNsKjYHmAMxEDdHmqeKs?=
 =?us-ascii?Q?QkI6kg6FuyEWxOob906ymCp5dGxvNqgIrYe05Ppl5ppfSBqv64WOKBbUGWgk?=
 =?us-ascii?Q?AZZlEs8AiQQnJPbR4+x1lg7hMxxfMEP2SZtogR5oR6JD0QwVgbSP6ZdaBBL7?=
 =?us-ascii?Q?R74bDr2YBJAMXDVFapwUZkwC9x9CTOa8lQwElFezE+Px8nUldUDuQ1O+W0Ht?=
 =?us-ascii?Q?mIkruQyYMwVbeLMDMocZl3XjwvhT9rO8MGOT0+EZD+vmXvLCSNIYHzM0egZR?=
 =?us-ascii?Q?BDO6GhxTfVaNxisi3uAJqkl7JOSyA5Uaks/lQkreZltyIc5Nsp9qClRal1/R?=
 =?us-ascii?Q?5mv/A/Wc5uMhLJYJOnW0FVnWqcy+TRQqBU2RIIZtsafrgVDCxmgRBJXBp9zo?=
 =?us-ascii?Q?zbaJZDfm25IMGjPBnSLOLrY6TWRcOnyKk5YRUF2KBgDUduvayPsNIX/ZL29O?=
 =?us-ascii?Q?uxtQMeZ2k+6zolxPS2PNTqYy3r16zDNHJdGlc2tea3i7YanxR0XUIp4p5RvC?=
 =?us-ascii?Q?vV828YByM2h3VcZAoqAjusM6ZGAJDyaLNNc16+c0UUQVFo58a1KMbs7Aasew?=
 =?us-ascii?Q?QMBZpJ9ZUIxejjBLRyWevALDR0aC2ZCsa8ew0AyD2uzRM4zY2EtHFzoMLZtk?=
 =?us-ascii?Q?Y0sKAUCJA8OEtBHjmBQl7x7tUqeDgQIWesYHMGIAkmKfJkXPK169HE41B5MG?=
 =?us-ascii?Q?UZuXUyoRm2JHGGUrMSXhl042xEgnC8G/8klkUUOF2x9M5sA4cHYT/v6SEM9j?=
 =?us-ascii?Q?EJgGdVAH4SXt+BPIwxsivcGgUkZ+juF6bawFwmlSvbtfRXBF6bFMT9aRRWPg?=
 =?us-ascii?Q?fbxbG2tP+vBBdp7i4jQ0ilY4HsZIjiKjepcAyFb7R5XHpH2oopoaJ/vmRRGt?=
 =?us-ascii?Q?lXf1XwoGqb9m4XQ4bvK03UIcgmCdYleDYop8D+vWBSvh9l0EMth2B+nDRPRh?=
 =?us-ascii?Q?3bOvRsHqZ6XegTxrzVatwAKZzMZT5047ypPa6N1sqpo1eQ7TnOKEDjowpcSv?=
 =?us-ascii?Q?YDRZhQPDHx1QrwEhf1XYBHlXrlrJrhRFT1XfsmdXG2+zo8H+nE0aUMF2rMkv?=
 =?us-ascii?Q?8ef9qQ0ijAF17zKbzhGwwcsqtjhJ+07GYv9oOGz9TIob3u2UBUdiwkx7kHkx?=
 =?us-ascii?Q?4EKm7srcKcq33PypJa7LXmFE5JEOlTQqseL0yX0/53Ipi3u7ap53zj4LQ4T0?=
 =?us-ascii?Q?95ghkOsbsRskZoGgOW7yR+aQLv1XnQNJzDRRUGojasr80tHTbvm59Bfc2vER?=
 =?us-ascii?Q?qS1J0RsH3zF74G0HxpohMyktWmKx6tVRJBkwiGvrEguniB7+fz5dQPqQ4b6a?=
 =?us-ascii?Q?mRdr/t5B08y0BVUytckmjqvTx0/L5qXSITU2lESzArdaUBYS78dC68jqqf+e?=
 =?us-ascii?Q?7nctO4A+Cb7CoimLeqKCn5JX5NL1h0xrxfYn0GzMFQyU5RqF/dG4/4TafvxP?=
 =?us-ascii?Q?/ff+1VNMcmp9ONgAeRuilbRhSgRQFvFC7vd0skIQG2bOBrtMPRGu3U6x9foW?=
 =?us-ascii?Q?CMfu7l6HbZEgDd/pMuAZ7KSDgW5hmRO3ebGyMTL1j0R8G4SNeyz+w2u5NflP?=
 =?us-ascii?Q?kd2VHQzJhFIxlAbSga8Cdn+GJM43VGBXLfIK5yJ9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419cca19-161b-46fd-12d3-08db3c302307
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 15:02:44.6310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Of5yPbZHwmW14s19Zr0uLETdJ0ffJlPU8m8iafrI7Cu+WnTuRlGIKpIk1vRjPmxuvTcnvjLOVjhy5NUsoN9M7us7dIwKw12vTJx/XvpOhkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
X-Proofpoint-GUID: ZX3tQ2Nf7uuJAd06BAu-tziN6jiLGGAB
X-Proofpoint-ORIG-GUID: Hz8ebTq_VABg29N7UcTXFNYBkTraLbU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_10,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304130134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 15:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179979



> -----Original Message-----
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Sent: Wednesday, April 12, 2023 1:39 PM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: openembedded-core@lists.openembedded.org; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [oe-core][PATCH 1/1] go: fix CVE-2022-41724, 41725
>=20
> Hello Joe,
>=20
> On Wed, 12 Apr 2023 11:32:06 -0700
> "Joe Slater" <joe.slater@windriver.com> wrote:
>=20
> > Backport from go-1.19.  The godebug package is needed by the fix to
> > CVE-2022-41725.
> >
> > Mostly a cherry-pick but exceptions are noted in comments marked
> > "backport".
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  ...01-go-fix-CVE-2022-41723-41724-41725.patch | 3373 +++++++++++++++++
> >  meta/recipes-devtools/go/go-1.17.13.inc       |    5 +-
>=20
> I understand this patch is wrong, being mased on kirkstone, so you sent a=
 fixed
> versions with the '[kirkstone]' subject tag shortly after, and this one s=
hould be
> ignored. Is this correct?

[Slater, Joseph] Yes, sorry for the noise.  I forgot the kirkstone label.  =
I think this patch also includes a bogus file I somehow committed while swi=
tching branches and generating patches for my internal use.

Joe


>=20
> Best regards,
> Luca
>=20
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

