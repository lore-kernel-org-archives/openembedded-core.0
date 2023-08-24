Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D10C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 06:11:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.4903.1692857461875001599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 23:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BGca6mP+;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692857461; x=1724393461;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JIkpHgz/YnsnTLZG1lG4tQqcWkFX4KH/+ivXftmzpBc=;
  b=BGca6mP+8HgaOhvjPaT29k6lW5yNK4JZa/NN6ibr6C7WmQNNH+re4tIy
   cFe3IIc3+uc7NiqPGmnJLOqooCIS1DuGy774T9BcS0jHDgYrTyuEIRXk3
   /3V2tKrVW/kl5sqtveqEfACEi2YHoK7jSNaS7+Hh91u3G8DVwOWUFWJFD
   H4Uc702YC7s8XkfloYnwYCiiyjKwaIgudEb58/WGFS3fmFhj/6+P/Q9pE
   +sQZIv1pUaBPncpEWWEHLrPEhsKe7SZZNYx12IohVKtKdxnoN05ysUQLk
   4c5K0+8rncK3ZJOtW4Ol56ddDJK1w6FCc4gaZhsCH7/THFShth4jo1Oc7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438289612"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438289612"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 23:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730466500"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730466500"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 23:10:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 23:10:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 23:10:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 23:10:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJhp6/3XKa47umqcsXqZuKjrdWm9h6j3OLSMrJWNQwoxJgasV13Gi5GSst9pQ2MPVHUwV6yCfQo89kLKLHO83DjN1MNH96FdchCxj0F2nwABerPpD525wfaNBqnCRGDJ40yZO8AeQwdNE5sspDUpdRCIaKfDkN4EdH3JQM1jwoPjyT00oOIdwLWJcMZ7ePnlCyLkF1NNoaPYL9+2j+v6IG9JLxrKHYRHQHjEiXu3bZIgRcMN4OtvHuQ5SeXihekX8HMSnREnQuztnmFqa+t0xS194ClxKdIdw2bHIPWKSDpaCApWPUm6TW49v+gD5oFqWu3YMLs8INDShsTkRUoWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uftOgD+2fNIc/cwGaoKGDL0j5DSp9avU0xV9JIM8eeM=;
 b=bDQXBNuNOOp+pN19ZCDPiP4Zb7Z6HpHCAajX9x2S7+l+snlxcD5778ZP/oXElp7uzvtoxg869AOCFWI4PZvBjmVNiXn7TTQSjTqJFkaA6hjNK5h4l3btRSfZ8j50ZO/fEeezy+OLv0ZX7Wi0VAnuhouL16RhfqvDod61u8y/OvrRm3mND5jRRlYB1vvOCe7clyEOT+ShTK0xllvSebJoo23xN/yb3paF6WDZLhncdGq5Tt6AJJIZBbC+coR3DDsACER/qz8nJAZ/Gq6Z0Win2jpLAM2kDbul+DJvfbjxOSU+aTDjcrZiKgIZTnohdpI8MskybzciMEQgqN6oGL+dAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB7400.namprd11.prod.outlook.com (2603:10b6:8:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 06:10:50 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 06:10:50 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.3.rc1)
Thread-Index: AQHZ0mQxLUFWUKbvYkS1GOBFP2FHW6/4/Xqg
Date: Thu, 24 Aug 2023 06:10:50 +0000
Message-ID: <BY5PR11MB4152755AB255A7AF3A6860C3A11DA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018a0c6c4874-ba01cce9-59de-4612-864e-f96b74e5cf0e-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018a0c6c4874-ba01cce9-59de-4612-864e-f96b74e5cf0e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB7400:EE_
x-ms-office365-filtering-correlation-id: 6c321ad7-2d57-48db-28e6-08dba468ddb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CfHhPMuWNacnVpx73NR5rxhzuItE8mHahwT+3iRPAYHOIQQDDD5GtMNc7CVkS4qHR4/rbXIj6PkO4cs35EJM/5yIEK51/0oWBSOXGWj62BwCOFivOg/7QP/F2I2hfaXfI0LLtWCd7oxqNwnAm6CgxWb7EULtgj1lO+oBCkwI72ztzS5JsCymX4Wt/J7eJOVinir2CxbtXFlS+y1Co+Tuq1bhcRg02RvzM1S+zGhztQLQDfkygS8g952p2p65uqJbfC9QnkcsU4ndsGEDBqYbiOqv5mG24vF+wVY7QyRD94BNRUBAENp94Mvo7wwgmKTm8fyMOR/MtBGcHb5A2hgdz8PgFJ0CU6XxTMWvC/I91Tx94gWGxcefdw5PE41+jkaQbrq7UR1bVvwOX8GsU5aY96w+BJOGHyfjBMjUVG92B0dUK29fRnt0AslvrL4hLpsULtObjwtfH2NBMTrKH/A8QosOghiYn02nMz25WjEsCj50KS91ClhnPM7HMOpfaJTdN92IcNRGs8b8YeEPh59SJe+npBMgGK+wDJ7AqYmaxR3QNw6d+NQtQ+RpiWWH80wjEHF/aAHOu4i3P5YtYVpMbRPpvM+k1HMuEg6GENJUJQuM2hd1dcrISHnQYDM7Qcio+2AVdZ5tPxhjcJsDAD0+sg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199024)(186009)(1800799009)(64756008)(66446008)(66946007)(66476007)(66556008)(76116006)(316002)(82960400001)(122000001)(478600001)(110136005)(55016003)(26005)(38070700005)(38100700002)(71200400001)(41300700001)(53546011)(86362001)(2906002)(6506007)(7696005)(9686003)(966005)(8676002)(8936002)(66899024)(52536014)(5660300002)(83380400001)(15650500001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vxXNfebQ8uoTaIeSCedTFk4JFlRglQGCSLGooSi1AfSDJORnOQ6KXFpmQBej?=
 =?us-ascii?Q?iPnNhDNDAV71WGJq/7ssBjMO3BTEbNTRgBIaf22OeVZxvqFSI/oe/vwB2LFV?=
 =?us-ascii?Q?lwcylb8y8Cxjvjn/PyimrrqolqxGsb2YsEEC0hNCU6K9Xh6qzZFOZORzJbAG?=
 =?us-ascii?Q?dr3m74j0Tz2baa9/OtVPBMF8kKPhz5/Z9pFLkzFwfAJW9yLqMuo+oIA0SLAS?=
 =?us-ascii?Q?mzCRpeATTQmVrFMx1pgl7+mdIGDnvYHoZINmmwU+7HNdPD9a5bcSCqva0A1z?=
 =?us-ascii?Q?p6ceGs0j1rTC7gdSd/Rm7jZoR2gn0pBROvAp5HivR46p6yNdttSxWHxM54uM?=
 =?us-ascii?Q?xk+Oho23WhxQBOhQuXXz32JBGXAoJhpBQqjiJ++d0EutwBwvcz2GJKnmnfPx?=
 =?us-ascii?Q?UvwQsyj+Hy38VLS8wrKH9WcKBxG6NAN5W4XvHxvPHxoCBNDCmPCSPYzv0ax4?=
 =?us-ascii?Q?st+HILjb4gpjy+bwmDGInIw7qsLklzMSPhZdMYdpkOEc6zKGlIwjitqyjC3l?=
 =?us-ascii?Q?X2xMh9X+FfYLL1LsIPrVTSsPvPDRKaw7MslsdQidunbUkyArAH6wc61aZq3p?=
 =?us-ascii?Q?peoqTr6Z1VaixHP+aEOxxB7wqMQSP/cWTb0IWctsPJDJZGwQd3J6tqh5Qfu/?=
 =?us-ascii?Q?ITVgixHcpmMgPoW0URnaC0H+ex9/vcrtFW7Z9zssjQC1qZmxFsAx6AXRsYlW?=
 =?us-ascii?Q?IsE4n5KwvDsMJs6yNliuADzB8gFvW9UBkTD0FToFRTBv0+HJD2Q/MAYl5Wdp?=
 =?us-ascii?Q?LxxrCra249+5IvaAgrNdxoVDBYQ8XHirxEl4f4HeO1Nt/XOntJgEN+khIdf3?=
 =?us-ascii?Q?VIAOFpRa1JysWA9KtJcA2KkZGLau/US83iw5n358Ew8DFsXPaMvusRcTAkiw?=
 =?us-ascii?Q?BPdRs3y1Thr2RcV6V4Hiv9AhEkhgaew9b4q/RMsYoEgZ05TkLJ1/ssxk17iF?=
 =?us-ascii?Q?tSVUWM35XWwxXOxkW4oszcsGI0lhUqs1kURhikYw7il1V0SBiACUnrZOWnva?=
 =?us-ascii?Q?eUl0MRBD0yFJfHyOWgD6RBcA6+zUrw+p7bCTu5e7pQUnsLvTyNBeYvOZjJf1?=
 =?us-ascii?Q?2Xdsc2WuWyjW9dH/AxQkRkC59OL/UpTcAk5h8A+ZE3PxPwW6W5zZ3ljAli8z?=
 =?us-ascii?Q?B7Vfb9lb+O2MORcJsaORnobvaSLdTOdvTHiM3xGkNHJxTi2kMZSQe6sCR49f?=
 =?us-ascii?Q?P9HJNy++0FHKthMgZpRwAezBY3BgVnq1FYLDQ5lMBCjy4hi5abNfVAcR9sfa?=
 =?us-ascii?Q?SZptEiI3TaKDcVgR1uZalKeKT5LkD71sDbNVJ8Zki/GDCxibypKiCjaVnPUI?=
 =?us-ascii?Q?DtuvUx2vgX4hizbm+Xyk3l+mCRG2cJRodjcmtmMnSCRNfYAVJycgdTX+yXHD?=
 =?us-ascii?Q?cy/OglfRplkLE1QrWkTPlHT96/A3O7/Z88r35pWzXqRs7UvxsSo664dXEBl4?=
 =?us-ascii?Q?VGWaqMRZ29TFTzI39whBcimU2OLUeIl9ZyZq+7UIBvG6wz8dZQOPRTMjseck?=
 =?us-ascii?Q?mEwVEDF7DEtNDaJRJ2SlpSCxMb4SnO/CxnuXPbahbo33m6Re52flifk9wGH/?=
 =?us-ascii?Q?GU8anGuX68hcUWxOBk9C33/wrlkBwNsF+2WB2GdP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c321ad7-2d57-48db-28e6-08dba468ddb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 06:10:50.5809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nO2Bo7rS30mkVV2QPhujVSsIAB4cHl4bDyWRTdWtehCs4Dyq2QzkwIsRF3wtqRz6mdd++SVWg/7TwaJMP4oZvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7400
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 06:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186635

Hi All,
=20
QA for yocto-4.2.3.rc1 is completed. This is the full report for this relea=
se: =20
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
> Sent: Saturday, August 19, 2023 2:12 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2.3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.2.3.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.3.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 08033b63ae442c774bd3fce62844eac23e6882d7
> meta-agl: 2b1679097d7b5df438481d7966377a6c0545c156
> meta-arm: 85b0e80e7d6d58bb6aaae6edf88476b9e07d3313
> meta-aws: 7cca28f6e03f3043663c2ad54527c63826a7cb9f
> meta-intel: d24a6fae0229b6b4e79f6e796069c56d435c8ac3
> meta-mingw: 92258028e1b5664a9f832541d5c4f6de0bd05e07
> meta-openembedded: 75cf318cef3b4ee81fad2782cf063ecd69ba8842
> meta-virtualization: b8a964fc30de6dfd5a04d3ac57428809526d29f4
> oecore: 7e3489c0c5970389c8a239dc7b367bcadf554eb5
> poky: aa63b25cbe25d89ab07ca11ee72c17cab68df8de
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
> View/Reply Online (#301): https://lists.yoctoproject.org/g/qa-build-
> notification/message/301
> Mute This Topic: https://lists.yoctoproject.org/mt/100835028/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


