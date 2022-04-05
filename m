Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03323C38A2C
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.7398.1649170996182134024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 08:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=TwT4tRom;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649170996; x=1680706996;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=ua5a/zk3CTRphk8rjHnDnhY82sDrfHB5DgO8TvD0WDg=;
  b=TwT4tRom8KfliLx/VQlxg+bTMgwOcF5j4coX8g/gUi2HkF+ii1FLyuFO
   kejUIBHBRffr0jdJkPu1KWvEkpvEr90/OaxHa/rNpDR2KFdifk4lvc6bl
   wWTMa3lfV7NiapsAW8DAO/ji5O8DX+9YCr4X1a9eZN2ZAz1Uy/A2k8Ojr
   FQTTfwpAWbUj44U81it6xNc7Ilk0JyvSASssIA7wpfDSK6DNsh7LsdSno
   PEzDyuue51eRzh5miztse9swM36i7AOTmWnj5KwJfovttpU3wfuelBiWS
   jw+WOx3q4uUkvSMqDEHc14kpGSX18/RjdtQxU4eV7uJq0G9DSCl+7lacF
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="240704915"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="240704915"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 08:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="523488870"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2022 08:03:02 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Apr 2022 08:03:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 5 Apr 2022 08:03:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 5 Apr 2022 08:03:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLE38TbugFHjjKfS0+A3wRufP9dPelpl5fAO2T18EHm0UVqjDMawW/tkV0xejNMdYleCRSLhXCYRAmQu+6IZpzWjbq4RxTVjb2rcJDevq6sybHYGmaGjx9pTTIHjO5yKWRLMloTnfRNKnvtD0/CzpV5Ao3QIO73OfUYKzDbr0DinEINtvSrs4VTM8zI9Zm+TzC8Qw+CAqPR9j4YUR7rm+mMp4qLAT+OhZW2T734TcQb86gmQvwZsduItZLJ020xMnTpKMbk9cWEogtBgVu69Iq6BcM8NknV4zL1oOOIZR2ZN7gklP4ghFRoEpkEBqNlHsVgtwzCEGP1ICbrja6Nclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ua5a/zk3CTRphk8rjHnDnhY82sDrfHB5DgO8TvD0WDg=;
 b=Tb6tDOid++D6waz3bLe5X0BhARC/NoSnBvGzbcKfLGQzk8b4hYbT15JdWiJF6nUnZ2RCRX9xiZ222ug/MGQlsr2MRapsMtCUXlHH8atbFmazTW33Gcxp1gJMtx3rbd+X7chY4szTnK+G/4zzCXOuJ/glNhzjUK3O/Vd8wOljETXGa9fRFaYRs30Z/InCCni9mYtlb6aZVENbLHmMtnkoB0e23cy/gcuRhN1fvmKf81YYxF7q1hmr8UOHU7IFa3pUX1dYriypDrtxwZShFg2QQRnvhsQ6UZ1whRjJc1/KSLj07ifLtMPhBJwBme1S3/ef3JOS0bumiWL01Qwe/vTS/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 15:02:59 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8159:14f9:7d9f:9bdd]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8159:14f9:7d9f:9bdd%5]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 15:02:59 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "sean.anderson@seco.com" <sean.anderson@seco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libpcap: Disable DPDK explicitly
Thread-Topic: [OE-core] [PATCH] libpcap: Disable DPDK explicitly
Thread-Index: AQHYHsAP77MlS4+JXE6ZMLZ7yhauQ6zhvvgA
Date: Tue, 5 Apr 2022 15:02:59 +0000
Message-ID: <6d9e43d436cf62b31cc0848b1d325fdecef6bb9d.camel@intel.com>
References: <20220210204919.3029824-1-sean.anderson@seco.com>
In-Reply-To: <20220210204919.3029824-1-sean.anderson@seco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e9b5b7d-1ca3-437a-acc8-08da17155fb4
x-ms-traffictypediagnostic: CO1PR11MB4947:EE_
x-microsoft-antispam-prvs: 
 <CO1PR11MB4947902D972F5F2A2C411828F8E49@CO1PR11MB4947.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kffcgH7BTF2Wvfp2JZ3Qk8S9D9b1FOqh0gLvfNBc9yEDKS8t0LIT05VjJ7LzJ0LEhj+pj/LoiQ0S/DYqkCDUzG9yhYYKSe2wrlEjJFLD0ALZYzWjndlrrtWlby/VmTdlZ8BVdTyKbd2nHrK4rOHLX/PJUqoNQYIeEB3nNQo5DJxxcQdESNf3Mku4OIHgE/2cZCyLYMp0owFe8g1mdK/c/bs+jjEpYWBVk5JeoisDi5SyoOjb0FJR1kshy7ObSE7vlk9srdp2BVA6tbdzPsa324A1ayF1ImwAKXWmBC9jELsR7YOWTRRXXL8zBV5Hng5gbZxPrtDVbr5XwwbpAONRF7aEshDd5p1xf/dNHcWUG1v2z6nMWSyjH4wBr7UwYqrSmqP9PrQt+r9tc/ljiDYw3XyCozvjWrPe+18GlBjz7Ev5jPap76KBvvz9fNnlSWgOKmH6/pyaoJJ7Zv6sxc9zLO4Oy0cvpZjsxeqjWp8jhx72i95TkRfq6/aW47s3/iuL5044OhmPqPPJcW5bv8oA4uq3j+zVHfYVjl1ordqqBXiKbyQesPmhIODGxvqLxSKmFCI4z18Grnl5lzMonxLYS5XqG/rVX2dmXlrBUmRhVjOX22t25gYpcU/4FcY0/PquBK5y6dJ1tEmRCLkhGOT6GZe/27V5Tx21xsMWBpF0Go+7aPXSGDvOR4zaNIb34VDZmxnE4VVyOQPli7982L4L3A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(122000001)(8676002)(316002)(186003)(86362001)(38100700002)(82960400001)(2906002)(508600001)(6506007)(71200400001)(2616005)(5660300002)(26005)(91956017)(66476007)(36756003)(6512007)(6486002)(110136005)(66556008)(83380400001)(66446008)(64756008)(8936002)(76116006)(38070700005)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R1F4bjg1eklqSEM0SEx2TGo5Nmc3OXpaTTN6WGhCR3M3amRJelI4eFN5VUhm?=
 =?utf-8?B?cXpab3VzcTJRSGRaVnZoYkZzOUdiZGI3d0x5RXBrenRIUEdLdHAzcUlKR0VO?=
 =?utf-8?B?bURvTDhNVUFPalEzeDlNUlUzTFF4U2xZZHVZQzArb0VYUmtoZ3lQYW5PNlVp?=
 =?utf-8?B?N3dzNTZ4aE5jYWdzN01HaHpXZWlxTEhJa0lBVHA3cmx6a0JMYzFpRm9Fdmlp?=
 =?utf-8?B?TDYvQ2lOeEtYdjdtVkJTWlEvZnZReXpYQjZadkx6aGJoMUdZd1lPaDBTUTBT?=
 =?utf-8?B?K2VRL0tsT0dOQi90TWhndEtsaHBTSUJoUnhuT2tMOFR4MzhsQmNpSVBIaXd0?=
 =?utf-8?B?UC9oOHB6TlNwbVl4Sk9HRUk3NXUyOU1WVE1NeUNiY052dGREZ1M3TDZVOEFq?=
 =?utf-8?B?eS9FQ04wSGRXQmF5UytINFdRU0F6SXdRR3UrSGV2a0M4dS9jRFkyc0NxcVlL?=
 =?utf-8?B?RCtMMlJidW9ocWMyR2xmWDVWL3RDNFdhUjZ3NmcycmMxTUtZcWpCKzJ5TzJt?=
 =?utf-8?B?T3pJdC9KaElTTHV5aEZ4Yms4aGUyc2p6NHZqZjBiYW01dVIwVnFlc3I2QVhu?=
 =?utf-8?B?SVl2MEF0VXFXWnJpVE5iTWxxNS9lYi9GT1NhLzJZa1RxUytlN3NoVDl3UzRW?=
 =?utf-8?B?SFIxWGJyaGp0cTQ2SmFhTG5ZL0RWd2RSbnBtSjNpSnRUVjluZEtHU2dPMDV1?=
 =?utf-8?B?RDJLLzhGOEI4OGJuWTAyZGU5dkpPbDdvWExvYTV5TzQwejJwTWJvT2FZSlRk?=
 =?utf-8?B?L2dvTW0veS9JZldoaWZZSlpDMzNkUTZmaUJNYk1ydldWVFZwT25xbDFQc2dM?=
 =?utf-8?B?dm56dnFEd2RvYnVhVkhIMDltUVpaL29Od3B4dGl3N2FoaWU1WHFacEIyNURI?=
 =?utf-8?B?aTBwaGxra1R4R3pTcVVTSEhENjltajRwd08zNktKa0l4bzN5MThpVi9tQU1y?=
 =?utf-8?B?ODFTdjRhNXdGSkVjYitEWWp1ZVBJUDZId0NRYkZYRG9DRnJjaFFoU2hSczhi?=
 =?utf-8?B?ZzdJK0FGN3JXaXkxWkdPQWt6K25HdVpNVVBNNmhXck50dXkxMHpqTXpULzJt?=
 =?utf-8?B?SUY4Ykh0RFR6MldtMk1QQW1yMkUydjU2VXNyUWV2UVFkaWhkT1o5VXU4VXFo?=
 =?utf-8?B?K0tBRGNJc2pNQUc1dWUzcXh1dHNuNDBxQzlCN3dROWxGWm9PdzdsRGx4R0sw?=
 =?utf-8?B?NmRrUU0vUjlTV2VFZW5HTW1WcFBoeHVadmJRN2hYTmduQmZNcUtjaW0xdmV1?=
 =?utf-8?B?WUh3YkhYeWVCTkMwZ1ZMZUZ0NE1MTU1UVnBwaFMrcjl4Zkg2S1R0OXB1ajNQ?=
 =?utf-8?B?WFhndnhkdXR4bEE3Q2tFUGV0OSs4Z1A3bklHNDdVQzQybFdKK2gvSUhoTDhK?=
 =?utf-8?B?MVNtQ1lReVhaNmtQNStzWi92RXprOUxjNWw0ZUtLVHo5YjVDQTd5RXVFdGFH?=
 =?utf-8?B?SXVHaEwzQXMvb1lPTk9WSk1PYjV6eEJlWU9hWSt6V3gyVTNiUGdEdTJoTkhK?=
 =?utf-8?B?cXBvN2RTMzNXbGxCOFdwU2pkbUIyYXAybHpZcGhVUVk4K1VJV2NubjVvOUhB?=
 =?utf-8?B?bUtWdlFSdHpRWlJhUjVJS253YUpxVm90bldWZi83SDJONHY3WDVxZE1aaHBC?=
 =?utf-8?B?dDZCUVlQcjV0MldvekxjSGlmRFVRSVdMVXJGWFV1TzFldW1zR2ducTJjSDk0?=
 =?utf-8?B?NWQ0WVE3cU1GSDROSktnN0pPMG83ZjVWMU5nQTVSV3RrUjVQcTdpbnhGRVFq?=
 =?utf-8?B?TFVMSDcycFZRSFlqNEV2UFpwM2Jja1lqT0ZVc3RuUzRlam4yUnloNk9sQ04r?=
 =?utf-8?B?L05pZm02VVlSMHZHNTQrckNjQTdScVhSUXVxSjVTN01YZk12S1BYS3RLSGRh?=
 =?utf-8?B?UCtiYytDN1hFNHM0MUJYL0J0RmM2NTJjbnVGbk5FS1orUTU3V3JHcGxzTFF2?=
 =?utf-8?B?aFdHZmZwMXRtbCtGamJManAyVTZkVVR6V2dQR3g5ZUlZU0tVcWEzRExtc3la?=
 =?utf-8?B?VEI3cFdTVjFwZXhIbXVOUkFaRU9SNDVLL05OVkV6SXhNOFlBbHAzbG9VWm9F?=
 =?utf-8?B?L3hmMFNvV3JHeWc2Qk1SdXpzRGxERUk3WVVBNklZcG5oUlJNSVR4Yjk5K0ZO?=
 =?utf-8?B?TkRmYXJaQ1RRRG5aSktZWitNeXJrMUdCZVJORGdkZ2F2U1FDbUNKR3RuSFI2?=
 =?utf-8?B?Yk1mUHpWRU5QYUhwQ2ZDM0JnRys4dmlSalJvZVVoSU9naVNLellkOUt6SVdT?=
 =?utf-8?B?YWpxK3ZhTnpYbXhidm9hU3A0TFZtNzMrK2tROW1xTFg1eU0vRFJnQlRBNU13?=
 =?utf-8?B?TGhWek1PQmd6VE9wVUxHMmx1ZzZzcmxzVGZrRjI0RVFuYktKd2tTazFPMzRD?=
 =?utf-8?Q?gIDlkSvNOR38y14A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F1EE45F17233E44BC059A1B549AFE07@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e9b5b7d-1ca3-437a-acc8-08da17155fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 15:02:59.3149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 5A21ZjzQUiNDmPog2y7pplI5rspx5mfOoa8cihEoLvvvWByU8+ySBqSlEiVFMDq6zSCBLO8GRSKThVOUWsTXCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164043

T24gVGh1LCAyMDIyLTAyLTEwIGF0IDE1OjQ5IC0wNTAwLCBTZWFuIEFuZGVyc29uIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gbGlicGNhcCBsb29rcyBmb3IgRFBESyBpbiB0
aGUgc2FtZSB3YXkgaXQgbG9va3MgZm9yIERBRy4gVGhpcyBjYW4NCj4gcG9pc29uDQo+IHRoZSBi
dWlsZCBldmVuIGlmIGl0IGRvZXNuJ3QgZmluZCBhbnl0aGluZy4gRXhwbGljaXRseSBkaXNhYmxl
IGRwZGsuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIEFuZGVyc29uIDxzZWFuLmFuZGVyc29u
QHNlY28uY29tPg0KPiAtLS0NCj4gDQo+IMKgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJw
Y2FwL2xpYnBjYXBfMS4xMC4xLmJiIHwgMyArKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9saWJwY2FwL2xpYnBjYXBfMS4xMC4xLmJiDQo+IGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9saWJwY2FwL2xpYnBjYXBfMS4xMC4xLmJiDQo+IGluZGV4IDlhOGM0NmUw
ZWYuLmRiZTJmZDgxNTcgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bGlicGNhcC9saWJwY2FwXzEuMTAuMS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2xpYnBjYXAvbGlicGNhcF8xLjEwLjEuYmINCj4gQEAgLTE5LDEwICsxOSwxMSBAQCBCSU5D
T05GSUcgPSAiJHtiaW5kaXJ9L3BjYXAtY29uZmlnIg0KPiDCoA0KPiDCoCMgRXhwbGljaXRseSBk
aXNhYmxlIGRhZyBzdXBwb3J0LiBXZSBkb24ndCBoYXZlIHJlY2lwZSBmb3IgaXQgYW5kIGlmDQo+
IGVuYWJsZWQgaGVyZSwNCj4gwqAjIGNvbmZpZ3VyZSBzY3JpcHQgcG9pc29ucyB0aGUgaW5jbHVk
ZSBkaXJzIHdpdGggL3Vzci9sb2NhbC9pbmNsdWRlDQo+IGV2ZW4gd2hlbiB0aGUNCj4gLSMgc3Vw
cG9ydCBoYXNuJ3QgYmVlbiBkZXRlY3RlZC4NCj4gKyMgc3VwcG9ydCBoYXNuJ3QgYmVlbiBkZXRl
Y3RlZC4gRG8gdGhlIHNhbWUgdGhpbmcgZm9yIERQREsuDQo+IMKgRVhUUkFfT0VDT05GID0gIiBc
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLS13aXRoLXBjYXA9bGludXgg
XA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0td2l0aG91dC1kYWcgXA0K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLS13aXRob3V0LWRwZGsgXA0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICINCg0KQ2FuIHRoaXMgYmUgY29udmVy
dGVkIHRvIGEgUEFDS0FHRUNPTkZJRyBpbnN0ZWFkPyBUaGVyZSBpcyBhIERQREsNCnJlY2lwZSBp
biBhIHNlcGFyYXRlIGxheWVyIHNvIGl0IG1pZ2h0IGJlIHVzZWZ1bCBmb3Igc29tZW9uZSBpbmNs
dWRpbmcNCnRoYXQgbGF5ZXIuDQoNClRoYW5rcywNCg0KQW51ag0K

