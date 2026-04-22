Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A01F5A8DE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 11:40:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80473.1776858008153331775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 04:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=miwcFwJy;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776858008; x=1808394008;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XYYHV/yKk7cnbqVnTXEy30ryjcTithNqThZm6mFc7R0=;
  b=miwcFwJyu9xEITyWYQnk0EY5a/0yN3eB5A9Yap5GrF0u4uFGrcY3IyLx
   64v7dslwsWJRaHPXsKohUg/DV+R6PCK/zhMIni7pi2m7SPOehgIlMUAao
   p+/NyUHWp9azJTl6dLf1NQ+UHMdLG6sb6cMffo1eYbR5a7vXhTyqL1ipP
   EOUBaZizb3mgffMp60Y1F9kNpWOTWXrKfPWAqTf92BcGI9VzUwh+468OP
   9oz8/4VSKGvvffhejJMbltEFJBYnMyCyanyq0eFhajspTzk+1w4hv8vim
   ALST0MM1jWWS1MA8aWgiTlKZXDlCNWwqfmjSWvTXWxigEr+Trgm8wLvCx
   A==;
X-CSE-ConnectionGUID: PDn5NiRJTVGDsHMFPvr5sg==
X-CSE-MsgGUID: orPl0i1KSqamW86wlYtmbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77822426"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77822426"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 04:40:07 -0700
X-CSE-ConnectionGUID: Ek/Oo6TsRWWQHfrh1IV9hA==
X-CSE-MsgGUID: Zo3e3ne6SBqlWz5kM55u1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232634082"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 04:40:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 04:40:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 04:40:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 04:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Et5ME8nbh8DTpPY6kPzF3H/oC+eYi/jwrKFKRAmIAC00j6pxMiOJve9VTnluDK0dWK8lkzZeetKE/S2HYzfA2HkAbglgeIkPust0jxhbP2uZYtsHO7HVFA2h9ST8gYMqppkJfy/UlZFsFvcqbC0O44GKhcIal5ivjw8rE1uG/rbQ4DCXRFSnfjI7/ZSiI/uM+5M3Th38nt3Phak21OPJjRLuwYHII1kvKnD3ZHbJpXIDNO7IoCshTtzfsYIHB3uud59Z5O9+D9/Ov8XE/bfCgUfmDlDEkpR+REvGBA66r1xp+G1iIKcT4OFjMGzbMtUzFV7mW0ovdp1PtkjwUIJ86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYYHV/yKk7cnbqVnTXEy30ryjcTithNqThZm6mFc7R0=;
 b=E1B5u7U/th7cAMe25bjMYjlKvq4jZGYHjadqGPy/TKM9/uLigpADOewaF4BbjIDmDmWcyl/m2doDAraDRVCqdt7Zozhhto1WEmeiMQo6udibkcPbdkrjJJ46VbNKmZDL6IgP4o5PvfAx2xJ5Jnj4zy5S4U5I6Xh9AbKZIXe+DEC4wZ6C2CzyZCoGEUA9P9rzoIiyP9LuJb549yer/lc+8d94iOMC7n1ghfF2j7a2WtIGO0U3/ae/I09G5rMmpmXbLFrbUGO+jtC8mVj5TMiE+YTsrAtZABkzXALwhaQHDM7b9O+/sgPfs4WeqyCki2LoiPzLY4RpTI8CrQREJ1Xalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA1PR11MB8593.namprd11.prod.outlook.com (2603:10b6:806:3ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 11:40:02 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 11:40:02 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto ML
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.35.rc1)
Thread-Topic: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.35.rc1)
Thread-Index: AQHcySEzZGmAuduPnUScpYccvbGhO7XYz08AgAQdwwCABLEnIIAJaHXA
Date: Wed, 22 Apr 2026 11:40:02 +0000
Message-ID: <SN7PR11MB7018EAF7F752C1368C71A31AF42D2@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019d78e44a99-02fb8520-6c59-48c1-9ac3-64e44075a988-000000@us-west-2.amazonses.com>
	 <DHPSKCPED9UI.2AFCAORVY8PDM@smile.fr>
 <aef6ae9103b5a4ee85381fbaba4fab7e129bb4c6.camel@pbarker.dev>
 <18A6D4DCED14EB84.1272082@lists.yoctoproject.org>
In-Reply-To: <18A6D4DCED14EB84.1272082@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA1PR11MB8593:EE_
x-ms-office365-filtering-correlation-id: e0615cfa-c48b-40a5-690b-08dea063e445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: JflwKhyNxQcBTsI4FZwGnVK6FDJm6gN9cXCUL0000iC0ew8EYekwdQKUsFfYXyQJIG4dRhEXi+JlM5rPiipSrq00mD1kCLKutlSoOuKn5M2+Z3w5cJVAMQWEuJIa3SnFxQigh3owPQymH9t5l3Ze8RyA/6LBRtB1+AbHW5vO06W62W8NyfnlO5FHVy9/2U811KGJNlDXWM7SFYg1B54h72f0a+dChDT4SJaPyvKn8YQzD9/HDJ/XGHKMqGEsjSVxSIf2octZS31DNeUPecCaceNIwzRe7KsxRPpn6R79s5d9S84APO/ezQKw2nW1AlICN8i+i1lAPvkg5B1eP41Ql4Boag9C6weRa4VJECr6ynXnXR6z1iD4J9PePm3S9/Okmzj2NuUDz8tN16+kr7BDDedsA7ByzVjmWE57UIwEHluYfod8LS1woFRAyyfqRG0puJQ7hFEe8WJ4jAG6REl+RRySej6uLjS5AQ+nyzAfH45pjAzDNy6yKb/kf9I/3k1sS/6+kQZzAbIW8tLbZ/UT0DD1UCg2sEMDNCSx4+NnkPEa/nUWEJEouz3QEULyIzDx26T1y6YZ/2S5KKDBdTVJ3PFUnomokx2eo6kzfhHgkrKWmqJmBTnDeyE8m85f+kS+yCOh9kZi3ixdQ3Z2kaLUt9davnDFxK18cUoGz+/bFjbsebKw6OO8sOAkIG8WRV7hTbYfSYJz4L32X+xdTFAMk/UTQ/LLt9yvMic4zjG9y1cCCN7MzKlY0i8d0ZBGxQJp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1BHWjFxUjNOcUJzT0xlaVlCdll1WFFDb1ZZdHE0b2o2UEFZZW03Q1NhN3Vl?=
 =?utf-8?B?VnF5OWxEczVDc1lTaDR5TjlOYS8zdTJGeTVOTzBHbjB4bmthM0lzY0dEblk2?=
 =?utf-8?B?RDVrMlA1eVNJcDlQaFI4azJnSWNPTGJyNk90RnpSU2puWEhFWWo5d0w5OXV5?=
 =?utf-8?B?OXJFWlp4MEZGMmVXWFphUXRJSHBGeE16ejFrYkYxNU4za2dXNSt5bk1IZEV2?=
 =?utf-8?B?SlBFeXFNUWc1dUR5UCtFSGZLbXhrbG9uSnFwbmlpdjhOTjhKeEZjcWI5bWw0?=
 =?utf-8?B?bWNjbjk0TFVrQ0NJeDR3MXlYL3RMNHZZVjN0VktzTEcxYmRHL3dkeWF0OGtx?=
 =?utf-8?B?SlpCN0kySkQ5TVlPMzRMNjdCY2lPVGx6NzI1eVZHZTRjaTkrVy9oOFpDTnhr?=
 =?utf-8?B?TDJ5aFNET3Y5a1BYRTJXa0gvWSttSFNoMWhhNUtFMnpxRzNtZ214ampwMnlX?=
 =?utf-8?B?aWxTZzZWZlpjcDhlZDdSTSt6QmI3VzlaNnQrL29GejdOL2V0b1NjUHBweFIv?=
 =?utf-8?B?MXdNQk5NK2ZrRzdTRWxXUi80WkQ1QmNFdzZLK2dsUzJhdW0yWlFZcjdBSWIw?=
 =?utf-8?B?SGdib3JiN1NscWdDZHU5aks3Umh4TkFhMUg5bW1paEtvaVRNUzNlVERMQXJQ?=
 =?utf-8?B?TW5vMkhnRW96R2tVU1NjNGVBeitkSXNlRm5yZjd4VU1nQ2puRkNrOTF0UWV1?=
 =?utf-8?B?d2xBalN4dEw5dkJrdjQvOFZ4eUZjSERvaENvejRna0FKUTEzRldIUUxhTVpT?=
 =?utf-8?B?blh0VUsvTXhBaTN3Ri8zNk1YMlRMRHRSVExFa3FtRWZ6Tjh6cEVYU3FBRmsx?=
 =?utf-8?B?bzlndHFNVEFpdHVLQ04zTHEzSFVsekNuRDZ4a1NBZUFIV3hmeDhEbzZPNkVN?=
 =?utf-8?B?ZTlkMi93TUQ3RytTcXRPbHhIRVBsSzNZM0RvUjY1UUY1UjRSL0p6TktudE5x?=
 =?utf-8?B?UVpoOExacyswYjJreldSMCtvajBwWG1GRysvTWlHZThwZyt3MlRORS9VbldO?=
 =?utf-8?B?VkFJSGh4ajFOSExDSVBEWDgzUkl2NTVQaHpFN3JYU1Z0ODJFSHZnNitQNDJM?=
 =?utf-8?B?b2ZJOWRzNWdPZ255NWtCNEVlUU0wU21Hd1crQmZBWEZyVTlRTXVia2E4VC9V?=
 =?utf-8?B?ZzJtMGRXdWk1aDkwSDE1MDVlaXNlT0FKTUlacGhpUkVFd1VUaFYza0E1dFpF?=
 =?utf-8?B?UnBFcGhucVlkRGVmcC8xWC84azQyY29uZVZiQ3VOcGhCdWphdUtOaVZEd2JB?=
 =?utf-8?B?Qk5Jb05YNFhhTU9IN3NWUVF2Z2ZwVnJNaWhVTHFNRWs2cm0zWU1xdll5bnRm?=
 =?utf-8?B?eERNaUQzWEJibjNJTkZFMzVNS09TWFBMdzNVT044WlZkcWlFWHR1SEpxNlpL?=
 =?utf-8?B?OEpLOWFKUlVNbjVzU2QxdUZxUGlqZ2s1NzlZWGNzdWptQkxzVSsxY2d5TWFY?=
 =?utf-8?B?M1F2bi9EWEVPelZkTFRkdnVOWG1vTWp2RjhIQko0RitKRlcvOXBMZitDRnll?=
 =?utf-8?B?Q3FiQUVpbFZqVlVTK0NvcXdUZU1JcC9FZlk1dzV1UXpBNUVyL2YrbFVRS0cy?=
 =?utf-8?B?MVB2SWU4dTRSWG1mby9GSXJkYW5XbldieVFRS01Gb3UwVXlrblMzK1pWN3lC?=
 =?utf-8?B?ZmQzYVMyWmZEWThnbEc4NkNsQmxYY2Yva2xxZjVWOFV2MXJjTnBUTklXMFh6?=
 =?utf-8?B?WEcza0V6U1VJRkVuWGVxTzBvQThVbmJJMjJYZFFRK3BnRW5XamNRbU5OeDYx?=
 =?utf-8?B?aWxEdmJ4RlM2R2doOGtaWEcxUlQ0dkRnbi9KbVZNU0h5Q29kdnNhYjYyWW1Q?=
 =?utf-8?B?a005TGQyQS83VjllclJrNzE0NVdoeGRsTjgxYVRWeEpqTkZ6YVRucGNiODB5?=
 =?utf-8?B?dDVwZVY5Zk10UStWVzFEYjJpUUw2dTdRV09vbmJpazlhRTB1dUZBSFZpNERv?=
 =?utf-8?B?Uy9ObENXWW5XL2JYcVc1T2s4bjRPeDFGdVEwTUlzWGJPYVFrZ3Juek1oRkln?=
 =?utf-8?B?U1dNL2VjcWZxRXhDb09xZi9waG90emtVYVBpYlMwYk02NTJIcmNUU1JLbnNO?=
 =?utf-8?B?MzA0UGEwd2tGd3BYMFpZRkJXRGNWR0t6UGpsaS9GWTEyQWUxbmtVY1QyWWI0?=
 =?utf-8?B?RUJTNEVvRjNYeldYQmpKZnBTbndHeWVEbkM0SVRpSGdWY08rR2hqV0Q2NTll?=
 =?utf-8?B?VVE4bGVFQ2tnS3BzRDVOb0t6QnV6KzVrRnZmdWg0dDNzY3RKV0cwcTA1VWM5?=
 =?utf-8?B?R2dBNkYrcW0wSENOZTNIRTVDeGZ3REFqbGhvS3lTajU1K0MwWUNycDkvWkZq?=
 =?utf-8?Q?7Q/WE3UYy3xCT0Q2Fk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: s872rINnVYtN2BrpOyJmOSOQU6x5eGFYHbYOZfXhIbT4fSqx+vZAOnz9N8GKDrOGaE8QgfoEn4W1m92BUEQ1g/IVVbKJNW3ME5PxOWXUtOxXO3HIDfntYi0bOVP0QtNQKKhfZqDcPkQVwC9Rn8k2DPDZLqte5UnvEF3es8/W+TKMX6T714w+GBMDn+jKzKBnbni8ggnXNdJ9P3QIRC9ih1qICa5vTaiQb4/b2wSylm9tQ+8DBLAR/KJA5pqhv8mrwbJqGn4TWxkVjIWG7Q7J+IWpiplEwUkny75SM65kzhvWV/PjVt4ZaK68pH/1v/PX781sMfsxqlksCDnHcE99Ig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0615cfa-c48b-40a5-690b-08dea063e445
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 11:40:02.4646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eFeWlH7R0cwea4pxf5f/TBCT76zjQKSgxCp203Lrd4NdB4EQsDQP7fWcRFRsn5GK3v+2zgfs13s6vcKZ7nhCUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8593
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 11:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235718

SGkgQWxsLA0KDQpRQSBmb3IgeW9jdG8tNC4wLjM1LnJjMSBpcyBjb21wbGV0ZWQuIA0KDQpUaGlz
IGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgdGhpcyByZWxlYXNlOiANCmh0dHBzOi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcveW9jdG8tdGVzdHJlc3VsdHMtY29udHJpYi90cmVlLz9oPWludGVsLXlvY3Rv
LXRlc3RyZXN1bHRzDQoNCj09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8gaGlnaCBtaWxlc3Rv
bmUgZGVmZWN0cy4NCg0KTm8gbmV3IGlzc3VlIGZvdW5kLg0KDQpUaGFua3MsDQpEZWJhbCBHaG9z
aA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0
aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55
b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgR2hvc2gsIERlYmFsIHZpYSBsaXN0cy55b2N0
b3Byb2plY3Qub3JnDQpTZW50OiAxNiBBcHJpbCAyMDI2IDE3OjM2DQpUbzogcWEtYnVpbGQtbm90
aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IFlvY3RvIE1MIDx5b2N0b0BsaXN0cy55
b2N0b3Byb2plY3Qub3JnPjsgb3BlbmVtYmVkZGVkLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBQb2t5YnVpbGQgVXNlciA8cG9reWJ1aWxkQHlvY3RvcHJv
amVjdC5vcmc+DQpTdWJqZWN0OiBSZTogW3lvY3RvXSBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBR
QSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAoeW9jdG8tNC4w
LjM1LnJjMSkNCg0KSGkgYWxsLA0KDQoNCkludGVsIGFuZCBXUiBZUCBRQSBpcyBwbGFubmluZyBm
b3IgUUEgZXhlY3V0aW9uIGZvciBZUCBidWlsZCB5b2N0by00LjAuMzUucmMxLiBXZSBhcmUgcGxh
bm5pbmcgdG8gZXhlY3V0ZSB0aGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQoN
Ck9FUUEtbWFudWFsIHRlc3RzIGZvciBmb2xsb3dpbmcgbW9kdWxlOg0KDQpPRS1Db3JlDQpCU1At
aHcNCg0KUnVudGltZSBhdXRvIHRlc3QgZm9yIGZvbGxvd2luZyBwbGF0Zm9ybXM6DQoNCjEuIEFt
c3RvbiBMYWtlDQoyLiBQYW50aGVyIExha2UNCjMuIEJhcnRsZXR0IExha2UNCjQuIEFsZGVyIExh
a2UtUw0KNS4gUmFwdG9yIExha2UtUA0KNi4gRWRnZXJvdXRlcg0KNy4gQmVhZ2xlYm9uZQ0KDQoN
CkVUQSBmb3IgY29tcGxldGlvbjogMjMvMDQvMjAyNi4NCg0KQmVzdCByZWdhcmRzLA0KRGViYWwg
R2hvc2gNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHFhLWJ1aWxkLW5vdGlm
aWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFBhdWwgQmFya2VyDQpTZW50OiAxMyBB
cHJpbCAyMDI2IDE3OjQ5DQpUbzogR2hvc2gsIERlYmFsIDxkZWJhbC5naG9zaEBpbnRlbC5jb20+
OyBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KQ2M6IHlvY3Rv
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IHlvYW5uLmNvbmdhbEBzbWlsZS5mcg0KU3ViamVjdDog
UmU6IFt5b2N0b10gW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBj
b21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTQuMC4zNS5yYzEpDQoNCk9uIEZyaSwg
MjAyNi0wNC0xMCBhdCAyMzoyNyArMDIwMCwgWW9hbm4gQ29uZ2FsIHZpYSBsaXN0cy55b2N0b3By
b2plY3Qub3JnIHdyb3RlOg0KPiBPbiBGcmkgQXByIDEwLCAyMDI2IGF0IDk6MzUgUE0gQ0VTVCwg
UG9reWJ1aWxkIFVzZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+ID4gDQo+
ID4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNC4wLjM1LnJjMSkgd2FzIGNvbXBsZXRl
ZCBvbiB0aGUgYXV0b2J1aWxkZXIgYW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4gPiANCj4gPiANCj4g
PiAgICAgaHR0cHM6Ly92YWxreXJpZS55b2N0by5pby9wdWIvcmVsZWFzZXMveW9jdG8tNC4wLjM1
LnJjMQ0KPiA+IA0KPiA+IA0KPiA+IEJ1aWxkIFVSTDogDQo+ID4gaHR0cHM6Ly9hdXRvYnVpbGRl
ci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzMNCj4gPiA2
NDANCj4gPiANCj4gPiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOiANCj4gPiANCj4gPiBiaXRiYWtl
OiA3ZmQwMTk3ZmQ1ZmVkZDIzY2M4ODViNWU3ZTgxNmQ4NmEzOTJmZGY5DQo+ID4gbWV0YS1hZ2w6
IDQzOWNkOTJiZDQ1ODg5MTZhYTQ1ZGU3OGZlMjVhOGJmZGRjN2M4MmINCj4gPiBtZXRhLWFybTog
YzNlOWZiMTJhYTMxZDI1ZTMzZDgzOTJjNGEyMzNlZDEyNzVhMzI3OA0KPiA+IG1ldGEtYXdzOiBj
YWQ3ZmRjZjA0NmE5MzVkMWViNjQxYjI1NGU0ZDA1ZDE2ZDUxZjFlDQo+ID4gbWV0YS1jbGFuZzog
ZWFmZGFhM2NkYTkwMDBjNmQ5YmQxODE5ZmZlMTIxOWM3YjY2ZTRiOA0KPiA+IG1ldGEtZ3BsdjI6
IGQyZjhiNWNkYjI4NWI3MmE0ZWQ5MzQ1MGY2NzAzY2EyN2FhNDJlOGENCj4gPiBtZXRhLWludGVs
OiA4MmViMjQwNmUwNGE4OWQ2ZWQwNjUwYTk5YmExMzIyNGU0M2U0ZjBkDQo+ID4gbWV0YS1taW5n
dzogODdjMjJhYmIxZjExYmU0MzBjYWY0MzcyZTZiODMzZGM3ZDc3NTY0ZQ0KPiA+IG1ldGEtb3Bl
bmVtYmVkZGVkOiA5ZDhlZjI2YTk2OTNlMmM3MGFlMzRhYmUxYTc1Mzg3M2Q0MmVjNTg4DQo+ID4g
bWV0YS1xY29tOiA4ZDI3MzgwODMzNGRhZWY1OTIyMDAwYzhlMDU0OGI3ZmYyYjNkNzJjDQo+ID4g
bWV0YS12aXJ0dWFsaXphdGlvbjogOTJiNmFiY2RmYjZmMTJjNDkzMTI0N2YwZjI5YWFmNTMzMTk4
NDUyNQ0KPiA+IG1ldGEteW9jdG86IDM0ZTNjOWExOWI4Yjk1NTExNjEwOWEyZTk1Mjg5NjZkYjNm
Y2VkMzcNCj4gPiBvZWNvcmU6IDUxMjU5YzdlOTMzYTJhYzhlYmMwMTYwNGQ2ZTY1NjA3Yjc2Yjdi
NTYNCj4gPiBwb2t5OiA5MzQzMTI0OWE2MjYwZGE3YmQyOWVlM2NhMzIxNDVkODllNWI4MjU5DQo+
ID4geW9jdG8tZG9jczogY2U2NzM0YzY4NjQ5NzM5YzYzNTY3NWExMzNmYTc3ZWRiOTg2NTAyOA0K
PiANCj4gVGhpcyB3YXMgYW4gImFsbCBncmVlbiIgYnVpbGQsIHNvIE9LIHRvIHByb2NlZWQgd2l0
aCBRQS4NCg0KSGkgRGViZWwsDQoNClFBIGZvciA2LjAgTTMgaXMgdGhlIGN1cnJlbnQgcHJpb3Jp
dHksIHBsZWFzZSBxdWV1ZSB0aGlzIG9uZSBmb3IgUUEgYWZ0ZXIgNi4wIE0zLg0KDQpUaGFua3Ms
DQoNCi0tDQpQYXVsIEJhcmtlcg0KDQoNCg0KDQoNCg0KDQoNCi09LT0tPS09LT0tPS09LT0tPS09
LT0tDQpMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4N
ClZpZXcvUmVwbHkgT25saW5lICgjNjkzKTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3Jn
L2cvcWEtYnVpbGQtbm90aWZpY2F0aW9uL21lc3NhZ2UvNjkzDQpNdXRlIFRoaXMgVG9waWM6IGh0
dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMTg4MDMzNTcvOTk3NjEyNw0KR3JvdXAg
T3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
DQpVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQt
bm90aWZpY2F0aW9uL2xlYXZlLzE0NDI2OTk5Lzk5NzYxMjcvNDQwMzM0NTUveHl6enkgW2RlYmFs
Lmdob3NoQGludGVsLmNvbV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg0K

