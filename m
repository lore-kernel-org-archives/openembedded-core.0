Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0025C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 03:02:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web10.39538.1736994176880929095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 18:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TOTn3NuD;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: munirah.izyani.mohammad.amin@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736994177; x=1768530177;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=8bHys0oIRsI4f5DOP882qOZpqDYg/+rzGPJMxijCosQ=;
  b=TOTn3NuDKzVEfsytT1R+Ub6QCIVO4zvu+1HfMqp8xG0vLaBwzJhYvbW4
   KZyZny31gIEVdC0fkub/zZdyF7P7nc7P1kGFmvF6uDm2igUoh3tBbRbf7
   hGp9TialToLpwh3h6+bqooQK3VU7gjd04R1Ye81+h3I3vAZAjWKFkF0p1
   +6g5pw1daMKbYmXJk+8PjYp79UNka5RNUgQN42eST/4r7s9CKq+muE9Zh
   kVpHjWXjZ2EkoXLlUbAIloRhjgkUuuDxeaBbVw9DL2bf9doVZzsJAJ1/M
   /1s+++aCw1sE/TadStYTEgmPjaVHHBRgRMobrEd2hdjROQYeFV+EkTL0r
   A==;
X-CSE-ConnectionGUID: m3LCHuycTdODGATrkLBDAQ==
X-CSE-MsgGUID: 2uxVb85ITIStXXjVPPEOtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36567016"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208,217";a="36567016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 18:22:56 -0800
X-CSE-ConnectionGUID: T/ipGivBQQSycmrGUZInaQ==
X-CSE-MsgGUID: r+M0PephQGm3ctU98G8dRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208,217";a="136174402"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2025 18:22:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 18:22:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 18:22:55 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 18:22:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j40GPSH+f+A4zxIFhAHUwpG95xR/idVNzwIjSxmL7LRncjMzUC2PV727ywY1q7msVnEGWzdFJGVUhQPoNgfBy1CWSVHMw886qL7VPFyItCwHzt/l02URM9YcgOUTa2xxbRxdqR0ejmZ/ZME8Fiw/XukdgfgeQoMtbGb5fClIysb8UmcFabm06FmnC5/VjaPTFGEF3EL5Sv+xOw9TSHX1zce8SAVi9c3aFdfnkL6bl06B67cz3+0zbXrolx7Qx70x7UPZtdVFkv6Q7V9usB3SVJtICHybSyLusVIWTvBX9Gl1IPGAd536rlT+hQSTimx5rU14wKybggkN+PxY2bjdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmwuLQUKOSqo4FN0qPoPxUvy05McAab6jlFXzaV4+oc=;
 b=h9verhi9lqpqB7xBkgd0nL9higtYgCkTdC6J5D9lJV8n0jIzx5fqZ+szO1dJGszVWnx079Bke0kM1rbSZu51HZxa5fXOEu/Q9+NS24dxRgCyCeqvmj7t339DcfbON8IGOTmQSp6MlvdZAScbtCCQ9OzywTNEaMt2oQEpwzPC+KZtE2XHF7OAF6/du5RBeagE8EA10vfEpMvtY9mjVvny9bx1qanaFAxPJ5TomWQk/5Iw29G3JgZ8rN1cy72bspe8upwrQQEZwzhJOPGPIi7cniscwGQvQIjZ2VA/ibpaBxm3hB10U9MLSVBjSdERlh7p++fSS8ELQ2JOFV4wGuRJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14)
 by PH7PR11MB7987.namprd11.prod.outlook.com (2603:10b6:510:242::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 02:22:53 +0000
Received: from CO6PR11MB5635.namprd11.prod.outlook.com
 ([fe80::8cfa:1a7f:d9ee:42cf]) by CO6PR11MB5635.namprd11.prod.outlook.com
 ([fe80::8cfa:1a7f:d9ee:42cf%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 02:22:53 +0000
From: "Mohammad Amin, Munirah Izyani" <munirah.izyani.mohammad.amin@intel.com>
To: "Yocto (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-4.024.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.024.rc1)
Thread-Index: AQHbYuXRMAtDdm3bJkycXiLACDCauLMYs7Gq
Date: Thu, 16 Jan 2025 02:22:53 +0000
Message-ID: <CO6PR11MB5635563421B4CBB24BC7ACFD8C1A2@CO6PR11MB5635.namprd11.prod.outlook.com>
References: <CAOSpxdb5xR3BHif6-swTPdqFoibSAn4KEtZHSiLd3Xi0T75mxA@mail.gmail.com>
In-Reply-To: <CAOSpxdb5xR3BHif6-swTPdqFoibSAn4KEtZHSiLd3Xi0T75mxA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5635:EE_|PH7PR11MB7987:EE_
x-ms-office365-filtering-correlation-id: 86b01a27-e037-4d39-454d-08dd35d4ae87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007|8096899003;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?8P+PZ3pBEMY5iVcCJJA+n6IhOa2GIl5Rws3OWofc24az6ZfzuQuh4uLCmy?=
 =?iso-8859-1?Q?gkqqeFtuKFh1u77fTTY+Y8tllOkG12JlaJME/6yuonyL9SNXbsyTY+eJeE?=
 =?iso-8859-1?Q?fLbW5D2CHSuY5Ljbb4x/fAOcdhRCPV8AEpgRpKA0x3ywCVZ0OI1Ol/NV26?=
 =?iso-8859-1?Q?TQkHWAtbo8odFaL77pN7GUzdEH63FFRH691sHsjOZjk0uGRHVKpIhO5sXz?=
 =?iso-8859-1?Q?kyL9Kag1JKxHuBarA9zdcsRmByJtQ3XXqPcjEotYaDXn5rHd7h8VVeEgRv?=
 =?iso-8859-1?Q?fEd1246lskXr7V0bKEx6l2RkUEqPnXNaAmBvXti0vJqcTJDEWb+Q+cWxsL?=
 =?iso-8859-1?Q?muGxvLzaTOVBhd/tK75tsgyFTstZZSj4lN8uH+mTMWGumj24XQ+o9JJNPh?=
 =?iso-8859-1?Q?9+KFUxuWPprMKLKC8SxKzrQyyLdkYR+4h1dRrLwRIhNSXgjwbALGpgv6we?=
 =?iso-8859-1?Q?qts5cvSGmdRDEZYbn99Z1B7r8nKgDVCRJ4UgWz9whIBNT0NIIUimy+CebB?=
 =?iso-8859-1?Q?3FfrmgWTZAPHVJ+LA5QjWpPoVfBRQwlQ9oZK/qw+6XT/CbVuNHm4iynP/O?=
 =?iso-8859-1?Q?3+LbbPiy+pLptLHGqWP/MgeZ3RMGluKWozgMXn66F7shoe0dwHAYmiDDed?=
 =?iso-8859-1?Q?nw/eYCV0F1wslY+HRSvgF9ZbyOVFUZPCvsTe2byK8szaSG3oo25XPpEP+a?=
 =?iso-8859-1?Q?XEOcwkm3iu/RTaXY81qBzeJa1FjFKCbB27YO5NhsXb9wsEcmVFXmV5MZ6h?=
 =?iso-8859-1?Q?rs9aJPsh7lj7IMwUKOkDlG+NOcE8KZykWhV0YTzNpSp8e5Fe0nJzvLSD82?=
 =?iso-8859-1?Q?khsG0XOFL7L3XsI66klotjYgCOj2UHp8n0zJfjeiujpK7IFO2FkqAicA+w?=
 =?iso-8859-1?Q?VbNLcgBs9Bs3Lc5sbGOCmmcapHrcKEP6aq5ECTfqPaJkqOlpD8GC4VsYDM?=
 =?iso-8859-1?Q?TtmPXBpDV1mD22aOUzJ9iFWNK7B7KJ/d8auZyOL38wi5W6k/zTJBGDXssE?=
 =?iso-8859-1?Q?lzs/Mtgd86RNQEhs6x9tszj04eB/o2gmkK/eba0BFcZItAKKQVtdQqmdSf?=
 =?iso-8859-1?Q?L94aUsXzkQYbITHmOr1bQJ1WDI9TI3ae67+JwdeIQr/5xjZr8yheuO7Toy?=
 =?iso-8859-1?Q?IUwqPkziyAI321Bj4gzBkh3wRSZg+dYvvO6Kpss6E2f8UMrUUyM3Hx+F4f?=
 =?iso-8859-1?Q?k7n9ONTgtSM8ByDQHFjejWEqvHVUmxqSPxyD7wSf1VP9jd9guVfZUinvWh?=
 =?iso-8859-1?Q?jEEhks/QvPx+zrRbKrsadXm7dSNd0CqM4HsBUL4LfDQzOkLHflnDQpUFs8?=
 =?iso-8859-1?Q?J5Nu0c7lenNJ0+/QVC3ZhONwJlBsR3cPhtAo8j05wW2dD8jYaUtOnemNbx?=
 =?iso-8859-1?Q?4QT598hx5pXA3HkAP9zFmNYZ6zL8N5o2qrkUuBjZMOxa3OtSoTHW23gPdA?=
 =?iso-8859-1?Q?n/IGNwy3rFk2WZkU?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5635.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?olmvOrErg9UifEqmb2iY4+e91OFpmKmPNI+dK8KtZegbgLbQ1siJW+VPAA?=
 =?iso-8859-1?Q?YRsRvRpfSV/6wi+3NRz+jyhKvQAkKGqqya6oN1dzu2AulSd1FikPexu4pk?=
 =?iso-8859-1?Q?k5B1V39v3A0tBkkaAocEQ3KIvBhE3TDGwlJgtBh/Sc9VaOdTawnZBImalr?=
 =?iso-8859-1?Q?4IA2ZTYOrtG7/4/gajKHH9myaWmiSrbm3c8JwD/+auelJRwD0whjX1RGMG?=
 =?iso-8859-1?Q?NG5z5XOO64V+tXmZEPWjNfqY55yH8eJeeECs8/BNQ90k1oO/11t+Wu3BJN?=
 =?iso-8859-1?Q?GuNRNMSs8R59biKh7/2lztokx7Fp6ob69zq0msnqtZwlSJ5kXjqdXCYPPt?=
 =?iso-8859-1?Q?YLOUtX0jmtos0h18YT9z0M8KusH89Vbh5ZtgoRwMIwSortip85rdcj301t?=
 =?iso-8859-1?Q?2JA7EEnm4zx63bB0JSlIiFcnplA661CdaD+wGNKHuotDaA5ZV/pSxknEBd?=
 =?iso-8859-1?Q?knJyN0TSZxyQ3/cbMu3vDxHn2bzMzucD8w94v+7Z1a8UaW2YEwkx37pJ0y?=
 =?iso-8859-1?Q?w9pI8zsfnWrI/VBrZyctRipFk12K1WE3jD8kTcgmlkJajwwfyGAmX3aKQS?=
 =?iso-8859-1?Q?8E25jxOvNlXjNmwuDcKY+CT+pWW3i/eqv5lVQtKVq5By6ytqTmzMwgJr3n?=
 =?iso-8859-1?Q?vQjIWkhtcMeGw+WBfoXSNSneSdlJgqA4zS88pOzuEExyCmsOzlx32OpuHY?=
 =?iso-8859-1?Q?xPYbkf9HyhqGE2fQcXCwp3XBNv7Px9jH2rUMdAZX2M73PdBN5EkkZSiMKh?=
 =?iso-8859-1?Q?UdDRi1uNXjzwrfEog6NR3/c3vpFxJzg/xU37XKru4A7jkFaFav0jIoCmOE?=
 =?iso-8859-1?Q?eLsRmaQaFM46hspEzSfXN/UhAW2nLgOn2Lqg2SbHqq225ltzu+FKM8aHti?=
 =?iso-8859-1?Q?5SQ3mHo6ZNgBeetX+e1ivdTVtZCDlsQkZsc1KW1yZ60tHDMOLPweqYmCmk?=
 =?iso-8859-1?Q?PCd3uwu4M5rcZbZ3WbBDd43vv1OCPUY73g2MiuU6Kg/ptG0HgqvFABI/lJ?=
 =?iso-8859-1?Q?Y9716oXWPsESodpvvpeA/WILnjUpviDnu03Xn48Jzj2RTi61OqUrcRuriK?=
 =?iso-8859-1?Q?5B7fTE6sffOEP4Pd3IhWLGx8tlLnP+L23oshEsRUlku/SGxe0uBAL57Hej?=
 =?iso-8859-1?Q?xyLjBZNOUFqiTAca7GxzNEf2MyN4vU+D//b69Pb/XvN8y8y8cqrUUaO9QT?=
 =?iso-8859-1?Q?KanezfTjlow5MQcr5IbFgbJLOkk6Eh3s1q8svXYvwnzA9hjX/l9avjHsWy?=
 =?iso-8859-1?Q?XprBzyYbwMxVC99plOkU+cGsXULWnkBkZNNYPduY6W7mviZn+7NPDg2u4P?=
 =?iso-8859-1?Q?85JB2w11xO+LyvPqlae4OuVG6uPFnhfNHRa6amRwLdEYosfQjrXMOJLJ5y?=
 =?iso-8859-1?Q?AOQobm1KYYOuTGf5vdOiw5H8w3TjodCm0nyFM9chOrnGrp/6YT3CidEMVy?=
 =?iso-8859-1?Q?bw/ZV4BTamhGEz/PAMkBmzCdPThhosEhmzB3mOd6rSMXB7uXGAHGdkTtX2?=
 =?iso-8859-1?Q?RtDji/A6JwbKKtAp22srW5i2aXSYJ8sS7a+fvu7jNEI2tzQX7GwSYuFWsu?=
 =?iso-8859-1?Q?furdfTeW/jl7JFBTmSBK8DuDkhJKiX8xONL4o9ZWn9tXN8TyqgHSzfIB6o?=
 =?iso-8859-1?Q?vdNI6tMAbgJI4IkkHLtQXeu7Zelxpv13DZyZoYvAxEL6Vo0AY6X2XqGkVS?=
 =?iso-8859-1?Q?Eac42sUTgFP6dDroWN4=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5635.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b01a27-e037-4d39-454d-08dd35d4ae87
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 02:22:53.3523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcAYR1pPmmscPS4KB2H8Wr1j8EhLJkb0+e8kI+Ilii6t2zAqvzFjbB5DlGjcUQ9n69cEuwDtFF4SpfhoKMbpjiK+AOpNESqAtY+5TvwF5aBluUwRdTvxyp2HeNxYOKDr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7987
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5635563421B4CBB24BC7ACFD8C1A2CO6PR11MB5635namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 03:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209932

--_000_CO6PR11MB5635563421B4CBB24BC7ACFD8C1A2CO6PR11MB5635namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

QA for yocto-4.0.24.rc1 is completed. This is the full report for this rele=
ase:
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Munirah


________________________________
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> on behalf=
 of Steve Sakoman <steve@sakoman.com>
Sent: Friday, January 10, 2025 6:28 AM
To: Yocto (yocto@lists.yoctoproject.org) <yocto@lists.yoctoproject.org>
Cc: qa-build-notification@lists.yoctoproject.org <qa-build-notification@lis=
ts.yoctoproject.org>
Subject: [yocto] QA notification for completed autobuilder build (yocto-4.0=
24.rc1)

A build flagged for QA (yocto-4.024.rc1) was completed on the
autobuilder and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-4.024.rc1


Build URL: https://valkyrie.yoctoproject.org/#/builders/29/builds/778

Build hash information:

bitbake: 3f88b005244a0afb5d5c7260e54a94a453ec9b3e
meta-agl: a120153e6d3b7c23075aa0557cfab31dc2887b67
meta-arm: 936c02ec13661bd86a05f7f90e1b920d5092d670
meta-aws: b7de336e93c991a51c4df9195c9789e1e5904311
meta-clang: b33aa9c7f54807c113c44b0f2c15a5c5d88ae5ee
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
meta-intel: 31e3dbc89af2b8dcac889f31cc0911018abbf55d
meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
meta-openembedded: 7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf
meta-virtualization: a055d7dcafc58855081a5eac9a46b93b9b51012b
oecore: a270d4c957259761bcc7382fcc54642a02f9fc7d
poky: f50532593651dff82bc952288d786c55038c2c86



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org

--_000_CO6PR11MB5635563421B4CBB24BC7ACFD8C1A2CO6PR11MB5635namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi All,<br>
&nbsp;<br>
QA for yocto-4.0.24.rc1 is completed. This is the full report for this rele=
ase:&nbsp;<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-con=
trib/tree/?h=3Dintel-yocto-testresults" id=3D"OWAec34e54d-74a2-5bbe-cef3-f0=
bf0960a406" class=3D"OWAAutoLink" title=3D"https://git.yoctoproject.org/cgi=
t/cgit.cgi/yocto-testresults-contrib/tree/?h=3Dintel-yocto-testresults" dat=
a-auth=3D"NotApplicable" data-linkindex=3D"0" style=3D"margin: 0px; text-al=
ign: left;">https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-co=
ntrib/tree/?h=3Dintel-yocto-testresults</a><br>
&nbsp;<br>
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D<br>
No high milestone defects.<br>
&nbsp;<br>
No new issue found.<br>
&nbsp;<br>
Thanks,<br>
Munirah</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> yocto@lists.yoctoproj=
ect.org &lt;yocto@lists.yoctoproject.org&gt; on behalf of Steve Sakoman &lt=
;steve@sakoman.com&gt;<br>
<b>Sent:</b> Friday, January 10, 2025 6:28 AM<br>
<b>To:</b> Yocto (yocto@lists.yoctoproject.org) &lt;yocto@lists.yoctoprojec=
t.org&gt;<br>
<b>Cc:</b> qa-build-notification@lists.yoctoproject.org &lt;qa-build-notifi=
cation@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> [yocto] QA notification for completed autobuilder build (yo=
cto-4.024.rc1)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">A build flagged for QA (yocto-4.024.rc1) was compl=
eted on the<br>
autobuilder and is available at:<br>
<br>
<br>
&nbsp;&nbsp;&nbsp; <a href=3D"https://valkyrie.yocto.io/pub/releases/yocto-=
4.024.rc1" data-auth=3D"NotApplicable">
https://valkyrie.yocto.io/pub/releases/yocto-4.024.rc1</a><br>
<br>
<br>
Build URL: <a href=3D"https://valkyrie.yoctoproject.org/#/builders/29/build=
s/778" data-auth=3D"NotApplicable">
https://valkyrie.yoctoproject.org/#/builders/29/builds/778</a><br>
<br>
Build hash information:<br>
<br>
bitbake: 3f88b005244a0afb5d5c7260e54a94a453ec9b3e<br>
meta-agl: a120153e6d3b7c23075aa0557cfab31dc2887b67<br>
meta-arm: 936c02ec13661bd86a05f7f90e1b920d5092d670<br>
meta-aws: b7de336e93c991a51c4df9195c9789e1e5904311<br>
meta-clang: b33aa9c7f54807c113c44b0f2c15a5c5d88ae5ee<br>
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a<br>
meta-intel: 31e3dbc89af2b8dcac889f31cc0911018abbf55d<br>
meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e<br>
meta-openembedded: 7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf<br>
meta-virtualization: a055d7dcafc58855081a5eac9a46b93b9b51012b<br>
oecore: a270d4c957259761bcc7382fcc54642a02f9fc7d<br>
poky: f50532593651dff82bc952288d786c55038c2c86<br>
<br>
<br>
<br>
This is an automated message from the Yocto Project Autobuilder<br>
Git: git://git.yoctoproject.org/yocto-autobuilder2<br>
Email: richard.purdie@linuxfoundation.org<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB5635563421B4CBB24BC7ACFD8C1A2CO6PR11MB5635namp_--

