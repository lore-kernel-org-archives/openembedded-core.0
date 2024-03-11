Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE1BC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 06:34:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web10.56243.1710138886709626072
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 23:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=k3q5J2kz;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710138887; x=1741674887;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=dIYfiyuI4nGh1upLhYkWcYo831PCEEoWEJq45MRmP7g=;
  b=k3q5J2kzIYH5uER7UgrCBzDoxKTy2ZAv2oAINB90jqReppcvlrxHpOqP
   sA7Gr1EA7QV3lyfFKOh0c4yqCqmkU9F5GlPbvdS+iIuSrdKt1fQ6IWmCW
   gqCC7ayAEUV8AxyaRdy47xTQf5l/2nzQDBZ8/VoQwevyVGFHc62KPT0Lp
   N3hRIi/63MW7Q/lJTRwYNeaimufjV7dR7Z3nmJmk+z2l+LVPcT7cIvDPY
   U/Oi8YmXYLe8EuWbaScBg2xC1M+U9Taw/DEeBF3jrhfpEQZKUoYFLvdT3
   p929TnHC/8f28Dwd7HBJSdXpoRfwr+wP4R7J8+cz0ywQLjdwzPReG4eHJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4664696"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4664696"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 23:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15713746"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Mar 2024 23:34:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 23:34:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 23:34:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 23:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekUslMi4HuYC3m53pihlbZwB9dJhXfz/E59UKwZs3P115c4bFIOa82O7QMg71lTqTb2zLGCPqzjeT1Y4O9LE5dzIX8t/qtTBls25rh4acR+3lEcW20SHLTiOXzXP9YfYxnElnON2b8pDsikvC4wWT3XWJJPY2H9iuU0Kr/kLIIiLGIEXsajeuCcBtp3QEYlSHG477ZLVn/UKCz/uK3Owx94mx0cekyfVPtmsTs9plHe/vys8kwjoxaH8v7ncloA0lkynCI/nK3KeYCLJPaTjE3svVjpJumJf5XTxubBsM/YngIopdUK/nYEiHmxEoCMOW7hXH5fVWx+dUbhasU7Etw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIYfiyuI4nGh1upLhYkWcYo831PCEEoWEJq45MRmP7g=;
 b=YN6GocScdaq/BaLBTzhVhWhYBEmGMDCgABx4zo/BoFlOuHpFaNwUHeq4253U9IBTKNSYsvR8HdxTpyozm8C0JcrAniF0XVaVlLISktLC4ZbFgGkNqvrDGXWY/KMOIxu6BJf+ck+LAEtMP7shX4oHKAx2IZRdneqiz+bqn2n4l36U6WDuCldhbIJer6nluxfKsRsDCiUOLM3Y/xf+z4icrAbF78YjSCWCBNr0ocXvsdql9Fip9RCJrj4V0LY2Bh1xONHzDFCcWyjINbVeavRanaU0k5mjPXhstI+C8Wyqz/Jq7kY5nXScq1ITbaeNC1y5gmoyJPfvYfoFKby9VcTFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 06:34:44 +0000
Received: from CY5PR11MB6414.namprd11.prod.outlook.com
 ([fe80::a7c:edea:a899:a263]) by CY5PR11MB6414.namprd11.prod.outlook.com
 ([fe80::a7c:edea:a899:a263%4]) with mapi id 15.20.7386.014; Mon, 11 Mar 2024
 06:34:44 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core][kirkstone 03/15] python3-cryptography: fix
 CVE-2023-49083
Thread-Topic: [OE-core][kirkstone 03/15] python3-cryptography: fix
 CVE-2023-49083
Thread-Index: AQHaKX8AaOXIVdQLpEqlqrxACwvLyrEyqWgA
Date: Mon, 11 Mar 2024 06:34:43 +0000
Message-ID: <c0224f8e1379bb61615a38985b1b3b82a07b9303.camel@intel.com>
References: <cover.1702002667.git.steve@sakoman.com>
	 <2d104f78cd13a10640bc284c7fc8358bf305279c.1702002667.git.steve@sakoman.com>
In-Reply-To: <2d104f78cd13a10640bc284c7fc8358bf305279c.1702002667.git.steve@sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6414:EE_|SA2PR11MB5211:EE_
x-ms-office365-filtering-correlation-id: b7e3f02a-2fb6-490d-8ea2-08dc419556b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IoKOVzCDeWMD1L5WSPIVcYBw9rV/mB855Bg+PVyZ4llcH3SNrZMwojjSe8bwOs2EsXH0/26jFJ9+w2c4KFnRjhPUqkRhcS4D+Ahkc6n1loTXBNEFdUqnUQ2G2LqfVOwwQlHmjGyOo3rsxmqr1rrx+VOT0u9qCxkqLfXjUlk23aaVuM2GPxds0P0Maxqq9Mar/Ygz+8zdvSFJxeqt0eI4TC7neED217VFeW1nRscTuspFNSM5FCnc0TmeGplQEcJoCGuAMzgVj3Wjl4u2MniK8JKhyS3LMuwZZCSD32ILVDAxLblrnOcoYyaF0EEcI8Uf+6pDfMFMM5NjX1cigWquHRtSBnd8WczeIQR22uEzz8H71052jLIgIYn1SNr+dRjPq1K3B5FwRjzN6Br6gL7xR2bQmma7Amy1pwYymgiKMwBKGdNlyvxdU9SMDfjq8Qa25UAt7weAZ2BL8YW1uMryAriS7wJXafkL8OZPI3+WAW/wIWInCsfRzKlive5QrrTXnh9oLXfsxgRmt4yoAXtw0uPKAaKg1E7HSvFa+MC0NLEByzEmjzkv0S0SsVA+x1ET0PckPRR4ICpQyYXGMecZ5ueJnSM22fGtO5+P7830kVp+c1uKj8Rro9G5XMDxfTOluGkWV/BFsIrsPMZJxr43pAJboUE9rMaZ7EsDGXfLMvk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3FNQWs4dW5INDliN1BCSTRRNFU3S3dyWm41Z01qZVF5eFRZdTJhY1B1d0po?=
 =?utf-8?B?OEF1MXRSOVY0WjFMZ09RNGpoWGVDbGE5QTVreXF2dnlBaGk5ejB5eUNQYUVF?=
 =?utf-8?B?UlZ4eDZoYWJjQ20reHlqSndWQy9YRVQ0dW4rNXc0aUZTRzUwL2FIR0pKUDFx?=
 =?utf-8?B?TEZTeWc3WjlxWENWMklhd0ZMaGQ5Q1lBTTlvcWFnU0ZzTnlSWGkzWmpEUkly?=
 =?utf-8?B?b01vZUUxb2VEcjk3OFpiWTVrMzJCdThLM2xwV2tOanFuSEZNMWUxWEgrTDV4?=
 =?utf-8?B?WmYzZ2I4OTJSSDRaSHNEY0htTlZLU3hiRSt4NmVsTUI1b09IOWlGSEE2R0ox?=
 =?utf-8?B?T2M4L2haYlU5MzdsdFZWNUt6SkRDUlAwRzJoRHZYUEhhT1paZFhwN3RzTXBj?=
 =?utf-8?B?NVNXcE5nTWFyU0pySklFaDRFVzhBSVJWeGJua2VDVzNZSjhNSGdXSXBFTnh1?=
 =?utf-8?B?eXVNbzJVc2o3M1M2aEJSVERCQ3VucGFSOUJMZm1tcmZBNDI0S09LNkpxb3RD?=
 =?utf-8?B?bGNDOXRRTW94Q3d5L1prQTZza3BJQmFFbVE2ZmdHWGxYWEZhdDlkVFF1d043?=
 =?utf-8?B?V3I5b2NXbzByd25NM1NMYlVWK3UwcXVFZjFnUHNNVUV6L1NnQkJiVkhaUXlS?=
 =?utf-8?B?eGlIMHR1QmpKNEs2bGVQcm1GR09lRk44OGkrUzRXc0RRZWpKS2I4eGdENmRK?=
 =?utf-8?B?bmptbWRWSEl3ME9LNDU0eHBDbG9neVZybWp1VTB2ODdRKzAySEdycWhBN1Ri?=
 =?utf-8?B?R1hBS29ZbnNKUERPdkd3MTViN1d4eFhZcS9CY2x3UXRPR2hzckwyWlNqaVhi?=
 =?utf-8?B?RUxVWWtqYmlnSzZiMzIvc2JHaUVFMlRTUFJnbjNTQzdoQkZtOTlLRjZqQWFh?=
 =?utf-8?B?Z1l5dFZYY3ExVHRobUVwdm1jZEc0anorVHBhNG1RVERMU0xZMXU5dy92WlpP?=
 =?utf-8?B?NllGWjhBVGhNRlNSbnVHWVk1d0tBUVIwUEhwcUhBWFU5Q2R4ai9EUFJab1dr?=
 =?utf-8?B?UnlkNEYyVlphRm1ITzJDcHFCWGxteWNUaXJORmQrQTRuRmFvUVFyQmhUc09i?=
 =?utf-8?B?ZDBXYk5RaU10QnduYm9wMnlUMnQxMTR3ZThHSlNLVTJGWUNVdjBvQnEwYmZP?=
 =?utf-8?B?MWNVdTVobncza3k2U2I0WFRTWFJyUmo1RDVXc0Y5a0grVXBRS1R1TXRxWldv?=
 =?utf-8?B?NGhVY0dKdzJzbDR6TXlXaGs1NGxseGVvNE4vdG1vL1RnS01mb0sydk5oMFBs?=
 =?utf-8?B?bmE2OFc5cUk2Tk45czFLVlhJbDZtbGhnc2ZSOEJiMmF4WGhWWE90TXNId2VE?=
 =?utf-8?B?bWlkSm9VSW1MYkdVNDZ3UE0yUWFEMmtCQTRBU2VaYkZkMlhWYituaGVaRlpi?=
 =?utf-8?B?SjlPYTlzNU9ORFZxUVIrMkJWY1hiU3p1VGRDeWZvSnVyL3dqeHBueXg5ZE5S?=
 =?utf-8?B?eFdzYnk4YU1mbHBNeTVid2hkbGtpZ2djL0ZCeU83V0o5eWNocGpxandmNERz?=
 =?utf-8?B?RkJCVHg3eWd3cDlub1N1YjlSOWVuWGNUT044OFg0SWhqTVAzbEdCdDVORGZp?=
 =?utf-8?B?NGcyUXJRNmxxRmNRUjMrSVdnd1JWZ0dQeDJzMFdJbGRTek9aV1krcXZXMjlE?=
 =?utf-8?B?Q0lVYm5CUEFEcVZ1blVvWlJ3dzFzU0ZDaDhOR1ByNG8zQ2k3bnZnMTJNR1N4?=
 =?utf-8?B?eWhEcHZlb0VPZU5uUVpNL1hNVG1PZ0txc29kMUprL3AyWkpkaVFYVi92QWZs?=
 =?utf-8?B?V0dnRVJVYlgvZXo1NjMrbldub3RUNFpiMWVxR2pqUkxPQjRLbHNvTzZYejl4?=
 =?utf-8?B?YW50czVoRDJXbkp0Y1FIempVNlFFaFIxelUrNHhRRzRib09Nbi8ydzNPaytT?=
 =?utf-8?B?WUpsZzJ1c0FCalN6djMwbkg3N3FyWmZDRzlpbmFhdXZYZXNKdDluS0FNWmRQ?=
 =?utf-8?B?NDg2NE5rOTFlWFRsUm9ZS2F2aHlRT2s3VUhGMS9jWGtQdkVzOHIrV2xSTlVE?=
 =?utf-8?B?R0FlcjNkUkloWkhNaTdmbnIyRFpPeTFDamtSUFNUT05UcVlybk81eTYwVkI5?=
 =?utf-8?B?amVKSGYrTXVsQnNrd0pYOWJ1cFRvRmdkNkhBdUM2a2RCQXU3YkdaVitjNzF6?=
 =?utf-8?B?bDE3dExjMEhyNUF1ZVlHakI4VTc4cGE1YkFabUN4R2ZSYWtva0tsVklWaGpj?=
 =?utf-8?B?SG5vZHI2OGR1Tmk2emJZU0hCYUI1cW1KNmZlL0VrdDZDK0lDeXMwWkhRYW5s?=
 =?utf-8?B?bDFUWHlabDVFVFhsdkJReFI5cjhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AB51C220050C24AA884646CF10C082B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e3f02a-2fb6-490d-8ea2-08dc419556b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 06:34:43.9922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GAI/Lq2KG2ARjU4NuU3yje+UHgIvTqYK6a12gX0DmSQu5U6fF4IFzNNDb1EId7VN9Enph3ejWuBJj1rsnKT4eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 06:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196913

T24gVGh1LCAyMDIzLTEyLTA3IGF0IDE2OjMzIC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0K
PiBGcm9tOiBOYXJwYXQgTWFsaSA8bmFycGF0Lm1hbGlAd2luZHJpdmVyLmNvbT4NCj4gDQo+IGNy
eXB0b2dyYXBoeSBpcyBhIHBhY2thZ2UgZGVzaWduZWQgdG8gZXhwb3NlIGNyeXB0b2dyYXBoaWMg
cHJpbWl0aXZlcw0KPiBhbmQgcmVjaXBlcyB0byBQeXRob24gZGV2ZWxvcGVycy4gQ2FsbGluZw0K
PiBgbG9hZF9wZW1fcGtjczdfY2VydGlmaWNhdGVzYA0KPiBvciBgbG9hZF9kZXJfcGtjczdfY2Vy
dGlmaWNhdGVzYCBjb3VsZCBsZWFkIHRvIGEgTlVMTC1wb2ludGVyDQo+IGRlcmVmZXJlbmNlDQo+
IGFuZCBzZWdmYXVsdC4gRXhwbG9pdGF0aW9uIG9mIHRoaXMgdnVsbmVyYWJpbGl0eSBwb3NlcyBh
IHNlcmlvdXMgcmlzaw0KPiBvZg0KPiBEZW5pYWwgb2YgU2VydmljZSAoRG9TKSBmb3IgYW55IGFw
cGxpY2F0aW9uIGF0dGVtcHRpbmcgdG8gZGVzZXJpYWxpemUNCj4gYQ0KPiBQS0NTNyBibG9iL2Nl
cnRpZmljYXRlLiBUaGUgY29uc2VxdWVuY2VzIGV4dGVuZCB0byBwb3RlbnRpYWwNCj4gZGlzcnVw
dGlvbnMNCj4gaW4gc3lzdGVtIGF2YWlsYWJpbGl0eSBhbmQgc3RhYmlsaXR5LiBUaGlzIHZ1bG5l
cmFiaWxpdHkgaGFzIGJlZW4NCj4gcGF0Y2hlZA0KPiBpbiB2ZXJzaW9uIDQxLjAuNi4NCj4gDQo+
IFJlZmVyZW5jZXM6DQo+IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDIz
LTQ5MDgzDQo+IGh0dHBzOi8vc2VjdXJpdHktdHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZF
LTIwMjMtNDkwODMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5hcnBhdCBNYWxpIDxuYXJwYXQubWFs
aUB3aW5kcml2ZXIuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBz
YWtvbWFuLmNvbT4NCj4gLS0tDQo+IMKgLi4uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5L0NWRS0yMDIz
LTQ5MDgzLnBhdGNoIHwgNTMNCj4gKysrKysrKysrKysrKysrKysrKw0KPiDCoC4uLi9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHlfMzYuMC4yLmJiwqDCoMKgwqAgfMKgIDEgKw0KPiDCoDIgZmls
ZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtDQo+IGNyeXB0b2dyYXBoeS9DVkUtMjAy
My00OTA4My5wYXRjaA0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvQ1ZFLQ0KPiAyMDIzLTQ5MDgzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLQ0KPiBjcnlwdG9ncmFwaHkvQ1ZFLTIw
MjMtNDkwODMucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAw
MC4uZDM5OGVlYTFkOQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvQ1ZFLTIwMjMtDQo+IDQ5MDgzLnBhdGNo
DQo+IEBAIC0wLDAgKzEsNTMgQEANCj4gK0Zyb20gNjI3YWM1ZTMxNDMwM2FjYzAwYTE5ZDU4ZjA5
ZWIxZWFiZDAyOWZkMSBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IEFsZXgg
R2F5bm9yIDxhbGV4LmdheW5vckBnbWFpbC5jb20+DQo+ICtEYXRlOiBXZWQsIDYgRGVjIDIwMjMg
MDg6MDQ6NTMgKzAwMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4ZWQgY3Jhc2ggd2hlbiBsb2Fk
aW5nIGEgUEtDUyM3IGJ1bmRsZSB3aXRoIG5vDQo+IGNlcnRpZmljYXRlcw0KPiArICgjOTkyNikN
Cj4gKw0KPiArQ1ZFOiBDVkUtMjAyMy00OTA4Mw0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJh
Y2twb3J0DQo+IFtodHRwczovL2dpdGh1Yi5jb20vcHljYS9jcnlwdG9ncmFwaHkvY29tbWl0LzFl
N2I0ZDA3NGUxNGM0ZTY5NGQzY2U2OQ0KPiBhZDY3NTRhNjAzOWZkNmZmXQ0KDQpodHRwczovL2dp
dGh1Yi5jb20vcHljYS9jcnlwdG9ncmFwaHkvcHVsbC85OTQ3DQoNCkl0IGxvb2tzIGxpa2UgdGhp
cyBjb21taXQgc2hvdWxkIGJlIGJhY2twb3J0ZWQgYXMgd2VsbCBzaW5jZSB0aGUNCm9yaWdpbmFs
IGNoYW5nZSB3YXMgbm90IHF1aXRlIHJpZ2h0Lg0KDQpodHRwczovL2dpdGh1Yi5jb20vcHljYS9j
cnlwdG9ncmFwaHkvcHVsbC85OTI2I2Rpc2N1c3Npb25fcjE0MDk5MzY5MzkNCg0KVGhhbmtzLA0K
DQpBbnVqDQoNCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogTmFycGF0IE1hbGkgPG5hcnBhdC5tYWxp
QHdpbmRyaXZlci5jb20+DQo+ICstLS0NCj4gKyBzcmMvY3J5cHRvZ3JhcGh5L2hhem1hdC9iYWNr
ZW5kcy9vcGVuc3NsL2JhY2tlbmQucHkgfCA1ICsrKystDQo+ICsgdGVzdHMvaGF6bWF0L3ByaW1p
dGl2ZXMvdGVzdF9wa2NzNy5wecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKysr
Kw0KPiArIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiArDQo+ICtkaWZmIC0tZ2l0IGEvc3JjL2NyeXB0b2dyYXBoeS9oYXptYXQvYmFja2VuZHMvb3Bl
bnNzbC9iYWNrZW5kLnB5DQo+IGIvc3JjL2NyeXB0b2dyYXBoeS9oYXptYXQvYmFja2VuZHMvb3Bl
bnNzbC9iYWNrZW5kLnB5DQo+ICtpbmRleCA1NjA2ZmU2Li5jNDNmZWEwIDEwMDY0NA0KPiArLS0t
IGEvc3JjL2NyeXB0b2dyYXBoeS9oYXptYXQvYmFja2VuZHMvb3BlbnNzbC9iYWNrZW5kLnB5DQo+
ICsrKysgYi9zcmMvY3J5cHRvZ3JhcGh5L2hhem1hdC9iYWNrZW5kcy9vcGVuc3NsL2JhY2tlbmQu
cHkNCj4gK0BAIC0yMTg5LDkgKzIxODksMTIgQEAgY2xhc3MgQmFja2VuZChCYWNrZW5kSW50ZXJm
YWNlKToNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9SZWFzb25zLlVOU1VQ
UE9SVEVEX1NFUklBTElaQVRJT04sDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKQ0KPiAr
DQo+ICsrwqDCoMKgwqDCoMKgwqAgY2VydHM6IGxpc3RbeDUwOS5DZXJ0aWZpY2F0ZV0gPSBbXQ0K
PiArK8KgwqDCoMKgwqDCoMKgIGlmIHA3LmQuc2lnbiA9PSBzZWxmLl9mZmkuTlVMTDoNCj4gKyvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBjZXJ0cw0KPiArKw0KPiArwqDCoMKgwqDCoMKg
wqDCoCBza194NTA5ID0gcDcuZC5zaWduLmNlcnQNCj4gK8KgwqDCoMKgwqDCoMKgwqAgbnVtID0g
c2VsZi5fbGliLnNrX1g1MDlfbnVtKHNrX3g1MDkpDQo+ICstwqDCoMKgwqDCoMKgwqAgY2VydHMg
PSBbXQ0KPiArwqDCoMKgwqDCoMKgwqDCoCBmb3IgaSBpbiByYW5nZShudW0pOg0KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHg1MDkgPSBzZWxmLl9saWIuc2tfWDUwOV92YWx1ZShza194NTA5
LCBpKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYub3BlbnNzbF9hc3NlcnQoeDUw
OSAhPSBzZWxmLl9mZmkuTlVMTCkNCj4gK2RpZmYgLS1naXQgYS90ZXN0cy9oYXptYXQvcHJpbWl0
aXZlcy90ZXN0X3BrY3M3LnB5DQo+IGIvdGVzdHMvaGF6bWF0L3ByaW1pdGl2ZXMvdGVzdF9wa2Nz
Ny5weQ0KPiAraW5kZXggOTFhYzg0Mi4uYjk4YTlmMSAxMDA2NDQNCj4gKy0tLSBhL3Rlc3RzL2hh
em1hdC9wcmltaXRpdmVzL3Rlc3RfcGtjczcucHkNCj4gKysrKyBiL3Rlc3RzL2hhem1hdC9wcmlt
aXRpdmVzL3Rlc3RfcGtjczcucHkNCj4gK0BAIC04MSw2ICs4MSwxMiBAQCBjbGFzcyBUZXN0UEtD
UzdMb2FkaW5nKG9iamVjdCk6DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBt
b2RlPSJyYiIsDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKQ0KPiArDQo+ICsrwqDCoMKg
IGRlZiB0ZXN0X2xvYWRfcGtjczdfZW1wdHlfY2VydGlmaWNhdGVzKHNlbGYpOg0KPiArK8KgwqDC
oMKgwqDCoMKgIGRlciA9DQo+IGIiXHgzMFx4MEJceDA2XHgwOVx4MkFceDg2XHg0OFx4ODZceEY3
XHgwRFx4MDFceDA3XHgwMiINCj4gKysNCj4gKyvCoMKgwqDCoMKgwqDCoCBjZXJ0aWZpY2F0ZXMg
PSBwa2NzNy5sb2FkX2Rlcl9wa2NzN19jZXJ0aWZpY2F0ZXMoZGVyKQ0KPiArK8KgwqDCoMKgwqDC
oMKgIGFzc2VydCBjZXJ0aWZpY2F0ZXMgPT0gW10NCj4gKysNCj4gKw0KPiArICMgV2UgaGF2ZSBu
byBwdWJsaWMgdmVyaWZpY2F0aW9uIEFQSSBhbmQgd29uJ3QgYmUgYWRkaW5nIG9uZSB1bnRpbA0K
PiB3ZSBnZXQNCj4gKyAjIHNvbWUgcmVxdWlyZW1lbnRzIGZyb20gdXNlcnMgc28gdGhpcyBmdW5j
dGlvbiBleGlzdHMgdG8gZ2l2ZSB1cw0KPiBiYXNpYw0KPiArLS0NCj4gKzIuNDAuMA0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLQ0KPiBjcnlwdG9n
cmFwaHlfMzYuMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLQ0K
PiBjcnlwdG9ncmFwaHlfMzYuMC4yLmJiDQo+IGluZGV4IGMzYWUwYzFhYjkuLmM0MjljNzVlMWIg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHlfMzYuMC4yLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHlfMzYuMC4yLmJiDQo+IEBAIC0xOCw2ICsxOCw3IEBAIFNSQ19V
UkkgKz0gIiBcDQo+IMKgwqDCoMKgIGZpbGU6Ly8wMDAyLUNhcmdvLnRvbWwtZWRpdGlvbi0yMDE4
LTIwMjEucGF0Y2jCoFwNCj4gwqDCoMKgwqAgZmlsZTovL2ZpeC1sZWFrLW1ldHJpYy5wYXRjaMKg
XA0KPiDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjMtMjM5MzEucGF0Y2jCoFwNCj4gK8KgwqDCoCBm
aWxlOi8vQ1ZFLTIwMjMtNDkwODMucGF0Y2jCoFwNCj4gwqAiDQo+IMKgDQo+IMKgaW5oZXJpdCBw
eXBpIHB5dGhvbl9zZXR1cHRvb2xzM19ydXN0DQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4N
Cj4gVmlldy9SZXBseSBPbmxpbmUgKCMxOTE5OTUpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE5MTk5NQ0KPiBNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDMwNDgyMjQvMzYxNjcw
Mg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsNCj4gYW51ai5taXR0YWxAaW50ZWwuY29tXQ0K
PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

