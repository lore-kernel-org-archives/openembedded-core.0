Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4BCE7735B
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 05:30:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web11.36357.1696051850806831281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 22:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hewA8Ykg;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696051851; x=1727587851;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0KbX/uXEqCfOVwdD645uCVbT42NkMgRsoTSYgjogqGQ=;
  b=hewA8YkgxPmNcW/3PZPnrDvSy3CENiEbe5KWPZMPQloa7MOD/BziSVp4
   Z6AJSy6v3Pija/X8A/cEShmir66Zgkr6f6jBYFofG41vAcmwGajsBNs3s
   9S92guFz7QPeEtCmQJ1iiDiRXYF1Yu3RzD0mTqANwR3i10K/51FwOZMWH
   7sDEPGwmbQZQQjv4yOWtlg3hso/JDLaF5NxX/t6JQFWKXLMAOL5Mr8PBY
   gV8J0UHQLt4ZjkqogssfpDC0oSOFmYmawpqC3cYrZFGZblY9hAZ1P/pla
   ph1rrv1AkcvJa75vMr8NBJ7RneaxljUjLSypDzrX1fG7t/5LYwCAavg6g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="3997494"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="3997494"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 22:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="923772076"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="923772076"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Sep 2023 22:30:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:30:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 22:30:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 22:30:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZCgmCMbBXUDQFIIS+fCgaMjMTQeL5UDO4B1KlwJ6uQop6KfPTLmScH6tmYC7WFhERCqHou3K6mge+5OfFsqN/t2VoQVy5P39AHzVe6iHqo20SPrAZ02eT6ZTXpCa+8+G+iVSBY28KwlxGtsj7lpYqQprY3qYm7nEQyRQWHyNgHDJAYFjYWKua6nJiZeN/jiMly0ug4MmJRdo5M/D1G48kpV+4Ta6wtguMTvazj6r9xmHspvgSG+EjyLySmYRu3exfG4OvJ8ziw06+go14/uoy8rzhJ/YxknyZ62NtzbazAxnxk65TkvMC9CJLAVLODPrch/xjBbuCNwGpv/U/d60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w1mZCCRPqK+hUiT7fNt56hZBUv67+8etXHQ3Q0Mr2U=;
 b=dJ/8uaneZSuHswanvM5VpoFUfcqPhiwvlZGJr6gaZnPfphYiGhlpJBrbqi7U/XDrQrCKTUk5uIBmemJ54bmIBfTpNRIlwg/XWsjsuh4dNMyhHZN+kQmNMxWSt/9G7K7frFuJJN85s36wMw3X0geE0YjH+R8bOwD7MCX1CMxoTtTGku9+MscHuh/tbdXKctKoiwf0iQGWu+2q/7gS3aUWW5Pcgaw1vlA2xCJUx7xhiJTvnuLF0KSholjfdaCoh1k4YhYfEZaS78CSwltPJVDH4kJwUvmO4FgMGJtwHhXWNx+O69WwhQpeH2/i2cW7eUwbghACQ8LbDAZXlPsj4hgbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Sat, 30 Sep
 2023 05:30:47 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6838.024; Sat, 30 Sep 2023
 05:30:46 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.13.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.13.rc2)
Thread-Index: AQHZ73yFHjR8RZEid0qig4vN/BKa77Ay3u4w
Date: Sat, 30 Sep 2023 05:30:46 +0000
Message-ID: <BY5PR11MB4152CE49FB968AE1ACE317CAA1C7A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018acb19195c-0619b075-ca67-4522-86d1-951e55dc7abb-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018acb19195c-0619b075-ca67-4522-86d1-951e55dc7abb-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CO1PR11MB5028:EE_
x-ms-office365-filtering-correlation-id: e251107a-ca8d-423a-3339-08dbc176660c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mfBp7XSlXJBE3+EvRt42YUfoJIh5piooqZZEJ+Mj4fDgDVgVy3I3zmV78iy/nyeCj6DqzSWL6IfeLA41TYqkw/5VEyxuNA/dGkDAK831svHTct+MbCTXg8npivx1o8gylmRiYHbuNLMy9ve+Q87tE5oeI+91otuJS5txAsoE/d2gQd6DjQzldLh/F8M46hHv/jaVreqJCxIypQke8+AM92z65bJf4POMFEUNRowkW5/DZEf/cruUW5xvJRP5vBMqKx2CtUEbA/J3Wh9gmODVz5eoBWPCtXIv5iSDuGM9z5CD8V/pftdR0y8vR2G9KIpzUAFxil/cWTOm67RnHVwiloB52OoE/kRGsVOx6vnSVoQg9qgGidw3UEFax86Di7SY0Q6zOzhdFZEOgGq8htXZNyQzemnm569XZru4qK8Du/6VnJ8Yfs5M7Ix4Bk4LC91ZItPvc59v0Ph0fOSsyKSVHUkAGiAUKUN5Yvr15DTHzCyRP4tepExMZTxArQSe4XcsY51cCJM0mJJR3H8oV1ui4RwsWMYG1oSOF7Q0D+jH5ovzOPi/L5OyrnjJ5uk7WVtm4RnNsSpH234dopdquuhxhoQ/5MS6Ask6ZPNQdHNvKVcMqpxfpM/a6REMZlDHKnW+6AXCjzdxuDHywFDQLjek/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(136003)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(478600001)(53546011)(6506007)(7696005)(9686003)(966005)(83380400001)(26005)(71200400001)(2906002)(15650500001)(316002)(110136005)(64756008)(66446008)(66476007)(8936002)(8676002)(41300700001)(66556008)(52536014)(5660300002)(66946007)(33656002)(76116006)(38070700005)(38100700002)(86362001)(82960400001)(122000001)(66899024)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eQ3/C626g3t2oqsRtqQuW2rgKmM2jKC0tWYtlGiMKe8cPY7XfWrl0bXVJiGr?=
 =?us-ascii?Q?2XUIt0zxTKDQ3qjan74oVtFCqozPVYNyE6n3n7oQkypRiAu2gkTB4eCu0LvT?=
 =?us-ascii?Q?TXWdslBLWcMM5I7teD6jbkgoQaexg5MpqJ4qEUs/jG8I7yy6AUG0JcaZq/dV?=
 =?us-ascii?Q?uDPzN3eF5a5UNiYfcsQCnc0zokMMhrVH+b4M61bJ16UATbK1xuuCFam0YjL2?=
 =?us-ascii?Q?eEOOkl5PFf5tqrn9NJ0/ntDia2TSaR/LbRVEwIX+WmshdkvWr6EVYN+gTas3?=
 =?us-ascii?Q?O1azvmiyyxDOD3lqKdKtaWDPuglYTCPL8102LHjlVrh3lN6SOwgXMg7BZ6b/?=
 =?us-ascii?Q?mmEdN3G73cO4V85N8+7xTpPS+3MWFpNnyY+l/Q5qwOc1j0bxvJShYSgnqz88?=
 =?us-ascii?Q?OIoOKFNcMO602+8HJM24OPO0qBCpP2koNvsct8zJQ9LYdgBhq/14Zhj/1+UA?=
 =?us-ascii?Q?3eLh0OG4+qzbBfGEbvBt41V4+93i+FX8rrI6bsJjO4ewXDAgcf5zgpShKuXe?=
 =?us-ascii?Q?pc7+d0xeduvGdqSDH5yw7WEJYwRJg8SxNFvGY7QbW3i4zbs6QCCjITOPVnGX?=
 =?us-ascii?Q?uZj/s1zUSPqXKRaHNAVMRuK890I6o+AO6yA26wFRXs6g6eKE23FXjO+zuvAg?=
 =?us-ascii?Q?CmoCr37Rn+qj5roxGdzBXP+Y4iztztGxsTbt0u6Jnp/RnXNofnbMkNGHX/sk?=
 =?us-ascii?Q?3seeX/2YAHUIhW+gvWL5TnElfqqN2lK/JPW6vWMMsI+rNe1l8mjjiDKbZ2+K?=
 =?us-ascii?Q?bRS5VJ8PWTqWjPGuYOvYs7G3fFAPeb7Pz9l2nVvfNyuy/2RKXMMuG1HZX6vg?=
 =?us-ascii?Q?t9SYWOwNwAUmrV318LXS+d/rfuuzLIZoEEwM8ucWo4eAV3dqOri5iVSqTw+G?=
 =?us-ascii?Q?HSbQnpGF9xICcwQGE+ae4BuPCQhJxcWKodGNt6fyN0Qeqy8p1B4xQFr2iZey?=
 =?us-ascii?Q?DHG0kABgOX+VImjQ6/p/AP4hUFOapRu4uXkAXsPHj5ZuU69jWxdvdrov5eLq?=
 =?us-ascii?Q?iOpugBh1O32zuiYNfS7fPR1RDNsqXZHnh3Khn5q6axZOcG1BX27uS8mc9fek?=
 =?us-ascii?Q?4YGa5NSzq3XyWg2prdZeIVWDHNc2UwQPzsjxHD1x2iHK9tcnbjdtq00vUTAZ?=
 =?us-ascii?Q?9+sGeLILz8+5D8pOjBUnRP4P+nddFW/lDjSYBOiiCTFJ/RwvxQfir7vR8lYF?=
 =?us-ascii?Q?2e3i85Npmd3det3YhO5TKMt1hsvnG86ZweV7Dndxgd/k5nq05XbS6kVHsuxi?=
 =?us-ascii?Q?xcsjv7+tcXZNd3A6RNUl0hQeNOtWYOE0JQGNZINJglqzcrsKQ15D7sVwndet?=
 =?us-ascii?Q?e5tFbUtyo5sykEN/hNNAzpqGvC2OaeRwHZ2/PMFxXkefIGnqwhJVaHP+xPqw?=
 =?us-ascii?Q?G89iWv+g7HVwJ7Y6JAccD1hqtSUTeFurWr9QLgQbQT2bAWuH0Wyxpaq0zf9m?=
 =?us-ascii?Q?YQJ55BVG37HSj7QruXUCEMRM3Mz98/JKFIqP+J3TzE0r+3fPtfkGyrzuwWpP?=
 =?us-ascii?Q?B9M0UIztizl6lxY9VmAdE9SHjkcZJQBmRyJTAGmCfVwzii15A/rsM6xCoIet?=
 =?us-ascii?Q?Z7ESEbQsUAPmFyqD6FMnqS+H5oZKwdg5K/FOCFuH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e251107a-ca8d-423a-3339-08dbc176660c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2023 05:30:46.5002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8xFmI1mHewIqtyAZ1vRRLBycj44fIRaCw4Tp53HpLGYr6S5cilhS4V0wQn6yS4Vmycu58u+G4nHwwxVge5R8PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 05:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188454

Hi All,
=20
QA for yocto-4.0.13.rc2 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.=20
=20
Thanks,
Jing Hui



> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, September 25, 2023 2:49 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.13.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.13.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.13.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 41b6684489d0261753344956042be2cc4adb0159
> meta-agl: 666f141563fd7fc12b7638479d5c0cd38dae5006
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: 60891e535ce219b3c473a89d8ae89cdba1d396f4
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 1342bcdc5bfc6620737e7d195e7d9bd744348577
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: a88cb922f91fda95e8a584cee3092083d5ad3e98
> meta-virtualization: 2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07
> oecore: d90e4d5e3cca9cffe8f60841afc63667a9ac39fa
> poky: e51bf557f596c4da38789a948a3228ba11455e3c
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#313): https://lists.yoctoproject.org/g/qa-build-
> notification/message/313
> Mute This Topic: https://lists.yoctoproject.org/mt/101569753/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


