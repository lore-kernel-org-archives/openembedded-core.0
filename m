Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F41C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 10:13:35 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.5479.1646388813881994063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 02:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=cML/FM5L;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646388813; x=1677924813;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GzGzMNIOiVJrGux2lYd5w1b72Oqoz37hwv56yAgNHvs=;
  b=cML/FM5L42rNm320wEOBsXpz+ZXEr+UuXLImgQpxhENDgXHCwDAeYJed
   zzgJgUnrBytVUt+mD2K0a2oCe0CMJ2+ToYc/nM/km6id0cadhBCuKUaZS
   DzsZb5w2OOu54Rm+Zgo9d3BujmLCvpWTn8/xqQSTWeorF+tyDNiwDTXpe
   6UmyN+eBroRyT1BeZCQD3L9oe8rb4wkDBzW9z87EX3KcCl+zUVZzPj/m1
   lEHjLcn2Z3RY1ft0EE8Z4FhOB1vINokB62KVzEoYxbi0ZlkA7Iu5QM6G8
   QZ5c73Abfua0Gqki5tbhWj5P2qiEf1aZdf3krfeZHRJyN4z1WcwKqMjdt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="314660160"
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400";
   d="scan'208";a="314660160"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 02:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400";
   d="scan'208";a="552171024"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 04 Mar 2022 02:13:33 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 02:13:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 02:13:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 02:13:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 02:13:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9IVIfetiLfF1OxBLHNOXPkEnm4MRbzuSrURBGqdnynOkYxLOsk5+LGv97UA04sfoHjqb6yRsnCPfvWBCR0uaiHC5uzkJVezxRByGxGUfLB6OlmXtpgs8s1igCpOCUevh7vzerzWb+PJOh4HruEpsZla+EcohtVj3RLJFUa1hKeeZrE7PNSoE8CnY1jtfM/8lnQtJVlQfHGOwyFyH13rm/4nd1IlfPpTF83F5Ny/s144T+pfIPNiU/1wtgK4ndZIovqhBSGnv3Wu0/42Sd+x2uObAhEEOcieWnaQ16GHvBBpIbiJKEcH0VEqPoHM1BeDLHaTAL3E6rflH3CsDkgBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzGzMNIOiVJrGux2lYd5w1b72Oqoz37hwv56yAgNHvs=;
 b=TQi6Ulwu90dwQZJniEohOXfZYrHAdr3Hf+Dd+9DAYccxNarViLyHEmXjNzcXQGVstYSWqgSLfUL0d3F+A7gzzLeP6QDUIlrc3KqflcjILbJ/zUUZe5GxNlbeCbChewerosYdJr+nwX9MxrdE84C12mvHgysW/1YSU9aBOJqHuEuA9hglQpYymq13pmDS6mOkxWY1jbRkwrG9XoQnnCZFAvh+2NLLTAvYwuFvcny9u05k4JmQ2PaxESXF23CsI+v7qSm5j/UbDbfT2CAKI3irB0zwCGws6nF2ACpbOMtzxx9ccOQSJo2XhZ44Sgv9jhqo7HAdK5OtMZRkNouEEtZs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by BL0PR11MB3346.namprd11.prod.outlook.com (2603:10b6:208:62::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Fri, 4 Mar
 2022 10:13:29 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::d8bf:725a:9d0c:2260]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::d8bf:725a:9d0c:2260%9]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 10:13:28 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Tim Orling <ticotimo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Tim Orling <tim.orling@konsulko.com>
Subject: RE: [OE-core] [PATCH 1/2] python3-importlib-metadata: upgrade 4.10.1
 -> 4.11.2
Thread-Topic: [OE-core] [PATCH 1/2] python3-importlib-metadata: upgrade 4.10.1
 -> 4.11.2
Thread-Index: AQHYLz97RBFxG+T3HkuL+nOpqYJFpKyvAWhQ
Date: Fri, 4 Mar 2022 10:13:28 +0000
Message-ID: 
 <DM5PR1101MB2361057C36BEA31A214B9B96B9059@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: <20220303204410.1206736-1-tim.orling@konsulko.com>
In-Reply-To: <20220303204410.1206736-1-tim.orling@konsulko.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4642340c-20ec-42b6-2c4d-08d9fdc7a0d9
x-ms-traffictypediagnostic: BL0PR11MB3346:EE_
x-microsoft-antispam-prvs: 
 <BL0PR11MB33465CB53771824CBDAD2FB1B9059@BL0PR11MB3346.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6z8FLHL88NSy1QyAp2N/VelmZEZtc8onCXHC5YSqfF8b5s4L1Eg+JKqTkTomw5SW2mJ+eGfj9d5vyApGFIvbxun3ZQ/rjutur7sqqWm8crodLTIzm8d8g6iPthJAwp2B3yQNoxTeeFIzwydUtOoyTaKzVYl7z13Uiugb52Qf/OqjE9zTGgPgGWSkWp14FHsvRM0a6rvOZVaOZEtBUxGL0fX3OcEyIU+b3iiWiQ7TftlVr/qqnM+KHdbDeOziPBIYleCH0JWc3dDgpDGZqjR64lyqM9ex9JCLheLjgNIm4qoyMUALEtvSpFTHRlWJk3+sQF2qfeOB175Z9B1FRyU/05kczLu6w2zktrTOozOU82LD8/TEVE8s8EpJz3L13EoBjkfj8KtGjgbjmn/6NwDSKhUhmjLefmh5U6weZ9Oeb24g5r7PLV5ioPicGmIK0hhpZ/rd9YR9Z8s6GvkpGLG2I3rAINm3k+Z/r/ONuF3cOF5n1iZtvjdRw76NVygU05t0IPcc2lKUOR86xEkH384tzHKWG71HVI3FKKeZUF6vOCsZNYnAnWh1leXVnvosa7TAT4NZBPK/mAAETEV9uEaX3cta0HGoPqgFSS+zQprumq2JOex5a2eGVbuK5wlrmDaJNw67qpJR15rSR9abW7EQo2+dG+opDGIkFGjuL7DRuEgNW08e6Wr2gVr/sGpAF+ApdJDRUnbGSGOW8DpSXmUCi8IHQqh1z5XmqnjdAScBZXQa56FXtc10KYRi5mgdczcz9Ox00y6c41QU9DBeJ5y+a7MNy4/v0/ikpbKwoID6t/c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(55016003)(66476007)(66446008)(64756008)(8676002)(82960400001)(76116006)(4326008)(38070700005)(66946007)(66556008)(110136005)(71200400001)(5660300002)(966005)(316002)(86362001)(508600001)(122000001)(38100700002)(52536014)(53546011)(7696005)(6506007)(83380400001)(2906002)(33656002)(9686003)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WkhzaVJXL0gwZklCWmtaTlNYU2s5VlJndFY2aTJtd2RxQ1lHZVE3cHFlbDdG?=
 =?utf-8?B?TGs3MjhWYm1vL0J5ZTdjZWJ4T00yQXMzVTA4Q2NBK1g4Mm5TRXNyWkVsb3NF?=
 =?utf-8?B?UHI2NllqRUFFdlpBTmxjalZBbjd3eXBVVTZLcFNCWkhoWkh0U0xwTHJHRG15?=
 =?utf-8?B?RUk0WmozcjVWZlQxdldEbUJTVWd0c1dVQmFqbldTQ1V3K0xxd1RNRlY5K0NO?=
 =?utf-8?B?cE1yaUwyRmthVEhWQ21NL2EyU3FEN2lFRHd4cEZRZzVYV1IzTEYvTGxaYXFn?=
 =?utf-8?B?M0pvK3NNOW1JZXIxdDNRa0c2OHdrSVQ3aTBML3ByV0t5Mkc5RUlRVkR2L0dz?=
 =?utf-8?B?RXlRYVRUTVRFUHJqS0g5R2hHb3ZJM0hIbkU3QVdrODg0ZUxNc0pEWFpuUGl1?=
 =?utf-8?B?SXZrR3crVlZzanpyM0dhaHYxeUpOT3h3YnA4Y2NRenp2T2RiYUk5QWFaRTlX?=
 =?utf-8?B?Ujd3ejl1dDZWdEYvMVdNNlVXQ3IzT3RCM3FoWWZTMHFmemFMdFlxWDgyb1ZL?=
 =?utf-8?B?Rkhkc3pTZlhKcUxmOUt3eDdpU0lRZ20rYUdwR2EySXQzMHlkNGkwSXlYRlN0?=
 =?utf-8?B?V1lhdGI5M2thTVFPZjFsL296UkJDbjRCc2VzWlQvSm9qYjJTNllZcHpFL0ZE?=
 =?utf-8?B?eWZ4cjdMcHozVm9ZelArNHpxN3Jad05nQUVuNDdOYSsxQTZaVW1sWkZNVk9n?=
 =?utf-8?B?cTVRL0VKMGlHNUZSWlA0L0tiUEtHb3pNVDZCQnJ5eE1xNHZiWmlRbWdscUVU?=
 =?utf-8?B?Ykl4SEtyT1U3dGRIaU9RYVMyYllXNzR2WEVuMjVydGF1Y2dldHNRSDIrRlc5?=
 =?utf-8?B?a25EVzlBTU1RczBFWXBSeGwrM2JGQWcxMUtyWHA5TUxQcW9SdWhVUUQzSm91?=
 =?utf-8?B?MGxUeTYrbWNoOHVZMDNNVVBtazU4UWtIWFZ2UTB1d0tuVmlRREkrR1RVWmdn?=
 =?utf-8?B?MW5YQ29sUGU5dWVQR2MyRDJzNkJJaXM1WHRFMy9mdXBPMlJ6Wmk1QSsrQWxY?=
 =?utf-8?B?WjNMNndqd0szYXc2MytkWGJUWWZNS1FBOVpjaTgvOXRCR0E4SEwzcldMV3ZJ?=
 =?utf-8?B?RmwzQUI0dFpwOG5nbk4zbzJBc3dUb2pnTHNRcGFqTzRFZk9GOGJCUlFMcTRu?=
 =?utf-8?B?YUoxaks2ODVwZzYvU28rY3dJU3pYOGFacHFBcjN5R2hwVmwvNFlnQURhVmhU?=
 =?utf-8?B?VzZzRTVrTDNRT2tmODlhVVJ6NEpSL3ZabzBqdDhUdS9QMXRRMHh1dGVkcFRK?=
 =?utf-8?B?MHVFcFRYZ29Lb3pLZ28vaTkwUzZMNzl6WkRPcGZxMjEvSjh6TU1sVk16TzJo?=
 =?utf-8?B?K3c3b3dBNzRPbkhMZjg1ajdGVFQremVWNTNPT0g5MjFZRXdTTlBKWFc3Njlv?=
 =?utf-8?B?MGFjKzZyM3l2clNCOHZBcmNYNnZlY21td1RRNzFaekQvQ1FKWUhqbld0KytF?=
 =?utf-8?B?MGFQY3Q0MUNKYVdOemw4YmtoOTlaYThYZWxHK1FqMytDd0NIcnJ6eU05Tzkv?=
 =?utf-8?B?anJ0TTh5MDgrc1VqNWxrOGF5WHkrRFpad2czN1U1Y29ienBPbXV0SjJGcTlj?=
 =?utf-8?B?Ky9udDdRSDhBbFBCRTJUN1JQTFZrYm5VQWtWOTN6dWk5b1M0S0NmMjl4RW5G?=
 =?utf-8?B?RU95RStURnpUL0RDKzUvQllvWG56R0RWbmU5b3pVK3JkUkdqa1NKMlE0SUg4?=
 =?utf-8?B?d1p6WERZOHFZd3o3YTlEZHpMRWNiZWxuNDVDaG94VmFlejQxYUt2OEVIUld6?=
 =?utf-8?B?SUozTmdtWXYrd2M5MnBlVTlTaUNaaDU0amNjbG54bjlsWlFNYnl0Q3hHNzdY?=
 =?utf-8?B?WXFMYm15eHdtWDExck4wL0NrMm52N1ZzYnQ4UXhuYTVZeVM5VW1sVnYrTUQv?=
 =?utf-8?B?WGt4NzNpUy91eWdDbmo4R3ZuaWdaekZVb1QyK0x0clNRdHBpRHgxM1VNUmd5?=
 =?utf-8?B?S1JUU2tDNVd1NThkeWZUTGFFMG94aTkyVjBwOVF2TUZ0RUdPOWx1VkNSaGRN?=
 =?utf-8?B?cmE0SjNOK0RITDVsTThaQ3JLM1liTUQ0bnpwbGp0MU9SQVh3U1UrRU1seWVu?=
 =?utf-8?B?MmtDZHlKWjN3d0lwK1FTUWFkelVHZ1doQys1SGMreWYySnVMcnhtYnpNb2RP?=
 =?utf-8?B?Zm1yRkE4ejFzYlFJbDBLWU01QnpLNy9Mb2xFZnlISkRJcStWdEdRdVM5dVNh?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4642340c-20ec-42b6-2c4d-08d9fdc7a0d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 10:13:28.7292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 pvuc7YesIj/E5xC0HyEfXcLWgGbpFjEYgtf8xF4k6vKtusB4gXIwPYoAVPTjlUC3TTpSVlW8iN2tpUc5Q/NHAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3346
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 10:13:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162714

RXJyb3Igd2hpbGUgZG9fY29tcGlsZSANCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy84MS9idWlsZHMvMzE5MC9zdGVwcy8xMS9sb2dzL3N0
ZGlvDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgVGltIE9ybGluZw0KPiBTZW50OiBG
cmlkYXksIE1hcmNoIDQsIDIwMjIgNDo0NCBBTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxr
by5jb20+DQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0ggMS8yXSBweXRob24zLWltcG9ydGxp
Yi1tZXRhZGF0YTogdXBncmFkZSA0LjEwLjENCj4gLT4gNC4xMS4yDQo+IA0KPiBpbmhlcml0IHNl
dHVwdG9vbHNfYnVpbGRfbWV0YQ0KPiANCj4gdjQuMTEuMg0KPiAzNjk6IEZpeGVkIGJ1ZyB3aGVy
ZSBFbnRyeVBvaW50LmV4dHJhcyB3YXMgcmV0dXJuaW5nIG1hdGNoIG9iamVjdHMgYW5kIG5vdA0K
PiB0aGUgZXh0cmFzIHN0cmluZ3MuDQo+IA0KPiB2NC4xMS4xDQo+IDM2NzogSW4gRGlzdHJpYnV0
aW9uLnJlcXVpcmVzIGZvciBlZ2ctaW5mbywgaWYgcmVxdWlyZXMudHh0IGlzIGVtcHR5LCByZXR1
cm4gYW4NCj4gZW1wdHkgbGlzdC4NCj4gDQo+IHY0LjExLjANCj4gYnBvLTQ2MjQ2OiBBZGRlZCBf
X3Nsb3RzX18gdG8gRW50cnlQb2ludHMuDQo+IA0KPiB2NC4xMC4yDQo+IDM2NSBhbmQgYnBvLTQ2
NTQ2OiBBdm9pZCBsZWFraW5nIG1ldGhvZF9uYW1lIGluIERlcHJlY2F0ZWRMaXN0Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+DQo+IC0t
LQ0KPiAgLi4uLW1ldGFkYXRhXzQuMTAuMS5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0
YV80LjExLjIuYmJ9IHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pICByZW5hbWUgbWV0YS9yZWNpcGVzLQ0KPiBkZXZ0b29scy9weXRob24ve3B5
dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzQuMTAuMS5iYiA9PiBweXRob24zLQ0KPiBpbXBvcnRs
aWItbWV0YWRhdGFfNC4xMS4yLmJifSAoODglKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbXBvcnRsaWItDQo+IG1ldGFkYXRhXzQuMTAu
MS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbXBvcnRsaWItDQo+
IG1ldGFkYXRhXzQuMTEuMi5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDg4JQ0KPiByZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLQ0KPiBtZXRh
ZGF0YV80LjEwLjEuYmINCj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pbXBvcnRsaWItDQo+IG1ldGFkYXRhXzQuMTEuMi5iYg0KPiBpbmRleCBmZjQwZGVm
NTYzZi4uMTVjNDY4ZTQxYjcgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNC4xMC4xLmJiDQo+ICsrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbXBvcnRsaWItDQo+IG1ldGFkYXRhXzQu
MTEuMi5iYg0KPiBAQCAtOCw3ICs4LDcgQEAgaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzICBQWVBJ
X1BBQ0tBR0UgPQ0KPiAiaW1wb3J0bGliX21ldGFkYXRhIg0KPiAgVVBTVFJFQU1fQ0hFQ0tfUkVH
RVggPSAiL2ltcG9ydGxpYi1tZXRhZGF0YS8oP1A8cHZlcj4oXGQrW1wuXC0NCj4gX10qKSspLyIN
Cj4gDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiOTUxZjBkOGE1YjcyNjBlOWRiNWU0MWQ0
MjkyODViNWY0NTFlOTI4NDc5ZjE5ZDgwODE4ODc4NTI3ZDM2ZTk1ZSINCj4gK1NSQ19VUklbc2hh
MjU2c3VtXSA9DQo+ICJiMzZmZmE5MjVmZTMxMzliMmY2ZmYxMWQ2OTI1ZmZkNGZhN2JjNDc4NzAx
NjVlM2FjMjYwYWM3YjRmOTFlNmFjIg0KPiANCj4gIFMgPSAiJHtXT1JLRElSfS9pbXBvcnRsaWJf
bWV0YWRhdGEtJHtQVn0iDQo+IA0KPiAtLQ0KPiAyLjMwLjINCg0K

