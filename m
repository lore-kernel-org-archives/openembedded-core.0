Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86340C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:49:10 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.27999.1641790149542296085
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=llOo+V2G;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641790149; x=1673326149;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TNNQtHwdlmg+ovOakQajCpaCOPKUcwzfr4XkQzRZSpA=;
  b=llOo+V2GMIhi/QyrTJ+9LSoBlXHCVrPylQlUtjwaa5Fcin2L3Y1ScDHg
   v7BPmgUccoHS9/VRFGqaNTBjqtehbPSIBM4EDayj62WyU19df36hLHKP4
   5/kPiZjVbhWhLzqWAj2pqMfkAufxPEe+/eqHx2NzisngmWeDp0epeMU9Z
   7eUzRhMeSFqqxp6QxcplfMjTr0l7J/1ZIzyts0DC6XrGgf1WqXhHqeJ9Q
   iKkKXv13sEb5pzTijD7vACPdWBb50iIjF2c/F8wSzSd/IZzSCGg+eNBJD
   cfvf7BL2JCNElToIakczv4yBXAXOFkt8mRG9kXBCeMpJ7WsWc+OYaU+xy
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243350705"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243350705"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="514543444"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP; 09 Jan 2022 20:49:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 9 Jan 2022 20:49:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 9 Jan 2022 20:49:07 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 9 Jan 2022 20:49:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qee9SDBL/dRvIFjGtTTuQ7U/fSU9+cPXhmc6d9a4XqrIawMl0WB659WnP0iOlPxT667NEUogpMe9iGakza09UaxPMI7KPumf/NrnQ/IkWZhEOqR1yAf/UsCJhkx+8VWN8sR6nnDiZBHhfPo6ukNyxJ8FB4Yn/erjKP7JPSBt4DlKiulZkuHfDXN1DBCxj+6JkEkbYLxQkIlr8kQ+CFxqM2tCmr8ammzmK0RhOIEn1uMZFMqo+hXfCvxSbUZGzLwdZNBz8fj88AKpcNRZnZ6ccctrAeKCuTw1OSuNZuVzD5ZpcUWgYOqLCLaVPpOON6FOTaLiAEUOB/JduV6kKIJYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNNQtHwdlmg+ovOakQajCpaCOPKUcwzfr4XkQzRZSpA=;
 b=OdlBertxJNjOWhbM5lP/OELrlni/tFKkQhWImsQ3feT9CYLYdK1Cvpnv6H5hn0ZNTiVyRUPz6azuc3ffgpc01BhzxUNF276AnZlscaZuDSM1e2GLDgjaAV7ApsSqn4dJbVvceOEUvHa2Lm9P48OtwNm8eocs5sKznmAXaPqRg8pp60fg6GsTrENM8vVqlCEPdL+wHPNLNenO0YrRTT8yIi2gd7FlbNak7CeyOrq3+E1gz/wrquBf5afrdRKlvNN24+4zmUZohzQBdrlXk9oP4b6DQFuV+ESeZ4l320hIxq4zw6WuTl93gCRBSAY6TAc65qcK7Albiigr0o0/FC4kDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (20.182.115.84) by
 SJ0PR11MB4960.namprd11.prod.outlook.com (20.182.106.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Mon, 10 Jan 2022 04:49:07 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%7]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 04:49:06 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pgowda.cve@gmail.com"
	<pgowda.cve@gmail.com>
CC: "rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com"
	<umesh.kalappa0@gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] Add support for Neoverse N2 CPU
Thread-Topic: [OE-core] [hardknott][PATCH] Add support for Neoverse N2 CPU
Thread-Index: AQHX9jAjHbhMDhsTnkqMg9kzo/BTXaxbzmmA
Date: Mon, 10 Jan 2022 04:49:06 +0000
Message-ID: <2b44025eddf69f1e745f23c13f77887694b75b9e.camel@intel.com>
References: <20211221060046.186189-1-pgowda.cve@gmail.com>
In-Reply-To: <20211221060046.186189-1-pgowda.cve@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebfdba1d-36e2-44fc-6a43-08d9d3f4889e
x-ms-traffictypediagnostic: SJ0PR11MB4960:EE_
x-microsoft-antispam-prvs: 
 <SJ0PR11MB4960A723A90B53FD1BE29876F8509@SJ0PR11MB4960.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YjClNsy0K7+hLxBeYL5s79P0KgFQA5ICQ4uXhpi05vfoc/nGNZk1C8wPitzCG4tPXZs8g1g/rCag73aT2YYjkiz4uNDkRkJyT2iR87k/4xKftw9G+QfQ06trpwyJATITzIDtexxJNFPnUv+9jkCJIP1M7Fitqn7V2K7TnJimlLMkjBG60C8KYF97yYgk1jTeq1WLztHpIokPI1jyhAdIf4qhGE4SMtqNiusQe0mrIu3PfMZ4Mnj2WP1Q4QpxdQRi8IzudoudRLsylSXQQeHM7qbcdAjeV16oDc1XuRyPuFOyaV5qaju0fij1ugYSf8OvB7YRkK8dWpJigcN33+JHW4+7SkppIO8/Vj7bOUjF34bJj+6nWUFIHhMLucBvmHgayy5Ds9x1LwKpN7XpfObHE0d28JsBAaz8bb26EmIIkdCXCd+/rVsGUV2aZIfIsMLA6pj6zzWIt/PFi5pcSZ5slcTIsUVaQr2p1b8HLt1pVIIjA1W+FOIqtdEoQqpP41RVwiykDFGkdafk2aRAbbAEZrJKINQkEXCS5vyOPI2PyWgvI/bTM7K5zIezW0qGl9lbhBABvo/a65ZxBYKYTCph2XvHsrNxBfxnlCOmDtTK5hi5XD0riiD5u5G2DNSJZpzYp1P513BUy/jmUIyTirdnkiaUjptIdljXzXP9H27Q0DXuhAB5TTa7WnMCCZ8U6VNs70icuH8r67xly99KBEMPjDaXxnJ3Mc5NZSZezeoZU5d5bXnC4MZYjo4bcbJigVjDVlclKtw4tdHI+QKjLfif/COVIH8KUyPtkspBLomGAwU0bdRK9RQ8+2sQG+YgAOr1urW/FGk5tsS8xdGOAYvJsA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(38100700002)(83380400001)(86362001)(122000001)(508600001)(4001150100001)(54906003)(186003)(71200400001)(6486002)(5660300002)(966005)(4326008)(2906002)(316002)(6506007)(36756003)(6512007)(38070700005)(2616005)(91956017)(66946007)(82960400001)(110136005)(66556008)(76116006)(66476007)(64756008)(66446008)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QnpyZmNTcHZoNzVCZDE5YXJSS1hBNGZqUkw1SWhlQWJMRTNPQXFOVlNqZnY0?=
 =?utf-8?B?RDBkdWtBMHVXK2tiYjk5N0FBc2w2WWErdjlWcnBXTGJuSytzU0txYUlkKzkx?=
 =?utf-8?B?UmlIQWhraFpzcGdlOFRVeUZTaUhpUVBBakIyL3NDdmRTS1ZNUmxBa3RZV3dR?=
 =?utf-8?B?U3RDVWx3RURLTlV3eExoZktmZ3E3N1h5cmFBb3l4clNsdXpHYWtmckk4cnJj?=
 =?utf-8?B?VXVWdDNMTzZtYm5MOXJmSklpNE9GbjJZRDdsQ1FuS2ZpMmFLVU1sRVFLREhC?=
 =?utf-8?B?YzdGUVlTREJTRDZmUmpxTUhGMlBPT0Y4Tmh3QXEyNnlGaHUvdmhiM2Ixblg5?=
 =?utf-8?B?UEtDcEFyczl1eDZEYXI5eXJWWFlFTDB3d3c2UW9yUXpBRWo2ZlBtOFZ3Q2x1?=
 =?utf-8?B?WEdPY0huem9RME5pNkh3Y0c5MkhJalhXOUNsQmhiLzltTFFHNWI4eHVPOWxn?=
 =?utf-8?B?dDlZaUNKMnZQR0gwRUNsWTZRSlFXd1NFOFlHNWpnc2MyaVdQMUxDa2tNbWlz?=
 =?utf-8?B?S1BzQUsrZDh4TU1oTW84TmlTaUJkRmZ0Q05TQ005Q01lcnFHTytXUEk4dmY3?=
 =?utf-8?B?cWRkdDhkQ0p5ZW1iUzJmRDRNd3plOG9DRkRqOVR5OHhUd2lxdnM1ajh1eWNx?=
 =?utf-8?B?N0FJMWJYc0ZSR2ZjZ0V6ZlBnTlF5ZjRvZkUxcnlpcDk0aDg5SVBld09mcjhK?=
 =?utf-8?B?Z1NOUjRrYlZEZVVJZy9xVVl0V0NaU0p3cDhVL3pVNXNjTC9xeDFQdUJidzU5?=
 =?utf-8?B?MkhzNy8xMEdkemNYRE4vKy8xOVdNcDFnb2MzS1gvTWMyakZwSTJYTjFaS1Mw?=
 =?utf-8?B?eTlDd0twcXZXbW1LRDNwc2J6b1RNTWdvMld4cFY2TXJDTURKZmpwUXNQMXEr?=
 =?utf-8?B?M0FZakdaTmMvMlBzTE9lWERXbC9sRmZndmc1NmJnSnN6NGxSaGFpRm1xRm9k?=
 =?utf-8?B?L1NIa0VGeHc3TTZsZ09mY0YyZm9vcVhQNDFBWFVicGZaVGhRamRKNXArSjRB?=
 =?utf-8?B?TFdqRXloNWhldFl1TytsenN2Q3VVSDBiL2ZiVVUxQkhhUVo2TlVOazNZSUlu?=
 =?utf-8?B?TllHUW9CUGxQRXZxcjhIUHBuMUdxVjRleEN4V3hSd3FlcWZiaHl4bXZxVFhs?=
 =?utf-8?B?b3Bkazd2Zjl0eGlBQitadUg1OURKUzZ1bURhMHdtaVIyckQwS0ZKeGdxRGxQ?=
 =?utf-8?B?OEEvSkJQaEwzTzBtWUN6RFE3dFNLMzBnZG9KNEFIdnlOekRwSjVJLzkvbXhK?=
 =?utf-8?B?TENqaVlaWk85WnFzSWJVaWhzYWVLV2d6VW1LdmxoL2pOOGFFa0pZZktPT0Zi?=
 =?utf-8?B?SEdaK1l2eG16V3FXYklJNWZlRUVVeWpveHlkQ01heGkvaXRhUVQwNjVKM09n?=
 =?utf-8?B?WnhxbDdxVlBLalp6LzRWQ0FyTmNibThGa09WblRPdkFZRXhYb0lVTWc5cWZS?=
 =?utf-8?B?bTF6Y28wYzhyYUVvRUVaTGRlaTB3eEJ2eURXZEw1bll5TnpJK1JFUWVpZWpG?=
 =?utf-8?B?eXJDa0QrZFZITVJHQzBuV255eWl0azgxRTdTSkJKcWZQTEZXaCszSkFJRFZv?=
 =?utf-8?B?L1htSXB6VkFKNEdRSi9XY3I4bUlVc29McmMxUVQzL2RxMmE3NUNMUUUxR1dm?=
 =?utf-8?B?NDJNNkFUMmVtbm92SWU5TlBTNXQ2Qk10cDBVZkVWMnRnd1J4cVBFaUJHakdm?=
 =?utf-8?B?WGdKSVdVRHNWc1U4b3pzMll5M3F6MTBSa2JKZjF3Z2hlNm9CdGZDeCtCbnhU?=
 =?utf-8?B?WFhvWXRpV0JEamRHNk40OENzL2g1TTlSS3NoenRUVG8vbi9NYkwyNjV0bnpO?=
 =?utf-8?B?aWxWaXJocXlWUkV6Z1ViN2IzNWxHTTVSb2h5OGJOTHBKbHBPbHZkSzVNdEFQ?=
 =?utf-8?B?T0VEazVxcDlxZ29ZQXBOM2poMldBK3YySmk0L0swT2VENEozM0tQSW1EUW9m?=
 =?utf-8?B?TkJlTEtpYURvemZkaVZkU0RaaWg4czdvSDdrSXc3MjgvUHV1WG9CMHI0aHZu?=
 =?utf-8?B?Sk9PeDZmcE5wUFY3cG5ZWFNHNU56KzRVTzR0LzNRZHNSbVhkdXlTUk1HUXBw?=
 =?utf-8?B?K1g3SklqK1d4dm5jRmplRWQ3NFROYnZZOXQ4S3ZKSmRKd0RuT25wUnQ5V295?=
 =?utf-8?B?NjJLNnhscWJBSk92WCtPTWRjbU5JWXN2K3V0T0pMRUNPVU1mNTEralh2eG9Z?=
 =?utf-8?Q?XppkfHRs4iUJ08nU9idG4V1qEsHDUYbaVRzoAG/7thLH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0C820B719D4574F9FA3A60306E1A838@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ebfdba1d-36e2-44fc-6a43-08d9d3f4889e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 04:49:06.5950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ecusf1r+guLzslbI4cYv8+9AB5S4QQ48Lqz1kZcaC8/sasOwbjKXLX+M68aQpKAhUt5ax7WcMf1vkC/cMtZq3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:49:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160334

T24gTW9uLCAyMDIxLTEyLTIwIGF0IDIyOjAwIC0wODAwLCBQZ293ZGEgd3JvdGU6DQo+IFRoaXMg
cGF0Y2ggYmFja3BvcnRzIHRoZSBBQXJjaDMyIHN1cHBvcnQgZm9yIEFybSdzIE5lb3ZlcnNlIE4y
IENQVS4NCj4gDQo+IFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gWw0KPiBodHRwczovL2dj
Yy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9Y29tbWl0ZGlmZjtoPWQ3ZTg0MTFmNmEzMzNkNDA1
NDg5DQo+IDRhZDNiMjNmMjM0MTVhNTI1MjMwXQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogcGdvd2Rh
IDxwZ293ZGEuY3ZlQGdtYWlsLmNvbT4NCj4gLS0tDQo+IMKgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtMTAuMi5pbmPCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+IMKgLi4uLzAwMzgtYWFy
Y2g2NC1uZW92ZXJzZS1uMi1zdXBwb3J0LnBhdGNowqDCoMKgIHwgODgNCj4gKysrKysrKysrKysr
KysrKysrKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy8wMDM4LWFhcmNoNjQt
DQo+IG5lb3ZlcnNlLW4yLXN1cHBvcnQucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4yLmluYyBiL21ldGEvcmVjaXBlcy0NCj4gZGV2dG9v
bHMvZ2NjL2djYy0xMC4yLmluYw0KPiBpbmRleCA1NjI2YmYyMGYwLi44ZmNjNTNkZjM4IDEwMDY0
NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4yLmluYw0KPiArKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMC4yLmluYw0KPiBAQCAtNzQsNiArNzQs
NyBAQCBTUkNfVVJJID0gIlwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vMDAwMi1D
VkUtMjAyMS0zNTQ2NS5wYXRjaMKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly8w
MDAzLUNWRS0yMDIxLTM1NDY1LnBhdGNowqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmls
ZTovLzAwMDQtQ1ZFLTIwMjEtMzU0NjUucGF0Y2jCoFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
IGZpbGU6Ly8wMDM4LWFhcmNoNjQtbmVvdmVyc2UtbjItc3VwcG9ydC5wYXRjaMKgXA0KDQoNCg0K
VGhlIHBhdGNoIG5hbWUgaXMgdGFsa2luZyBhYm91dCBhZGRpbmcgc3VwcG9ydCBmb3IgYWFyY2g2
NCBidXQgaXQgbG9va3MNCmxpa2UgaXRzIGZvciBhYXJjaDMyPyBQbGVhc2UgYWxzbyByZWJhc2Ug
b24gdG9wIG9mOg0KDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY29udHJpYi9s
b2cvP2g9YW51am0vaGFyZGtub3R0DQoNCndoaWxlIHNlbmRpbmcgdGhlIHVwZGF0ZS4NCg0KVGhh
bmtzLA0KDQpBbnVqDQoNCg0KPiDCoCINCj4gwqBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiYjhk
ZDQzNjhiYjljN2YwYjk4MTg4MzE3ZWUwMjU0ZGQ4Y2M5OWQxZTNhMThkMGZmMTQ2Yzg1NWZlMTZj
MWQ4YyINCj4gwqANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2Nj
LzAwMzgtYWFyY2g2NC1uZW92ZXJzZS1uMi0NCj4gc3VwcG9ydC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nY2MvZ2NjLzAwMzgtYWFyY2g2NC1uZW92ZXJzZS0NCj4gbjItc3VwcG9ydC5w
YXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi4zZTQyMjY2
YjgxDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9n
Y2MvMDAzOC1hYXJjaDY0LW5lb3ZlcnNlLW4yLQ0KPiBzdXBwb3J0LnBhdGNoDQo+IEBAIC0wLDAg
KzEsODggQEANCj4gK0Zyb20gZDdlODQxMWY2YTMzM2Q0MDU0ODk0YWQzYjIzZjIzNDE1YTUyNTIz
MCBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IEFsZXggQ29wbGFuIDxhbGV4
LmNvcGxhbkBhcm0uY29tPg0KPiArRGF0ZTogRnJpLCAyIE9jdCAyMDIwIDE2OjA2OjE1ICswMTAw
DQo+ICtTdWJqZWN0OiBbUEFUQ0hdIGFybTogQWRkIHN1cHBvcnQgZm9yIE5lb3ZlcnNlIE4yIENQ
VQ0KPiArDQo+ICtUaGlzIHBhdGNoIGJhY2twb3J0cyB0aGUgQUFyY2gzMiBzdXBwb3J0IGZvciBB
cm0ncyBOZW92ZXJzZSBOMiBDUFUNCj4gdG8NCj4gK0dDQyAxMC4NCj4gKw0KPiArZ2NjL0NoYW5n
ZUxvZzoNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAqIGNvbmZpZy9hcm0vYXJtLWNwdXMuaW4gKG5l
b3ZlcnNlLW4yKTogTmV3Lg0KPiArwqDCoMKgwqDCoMKgwqAqIGNvbmZpZy9hcm0vYXJtLXRhYmxl
cy5vcHQ6IFJlZ2VuZXJhdGUuDQo+ICvCoMKgwqDCoMKgwqDCoCogY29uZmlnL2FybS9hcm0tdHVu
ZS5tZDogUmVnZW5lcmF0ZS4NCj4gK8KgwqDCoMKgwqDCoMKgKiBkb2MvaW52b2tlLnRleGk6IERv
Y3VtZW50IHN1cHBvcnQgZm9yIE5lb3ZlcnNlIE4yLg0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6
IEJhY2twb3J0DQo+IFtodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9Y29tbWl0
ZGlmZjtoPWQ3ZTg0MTFmNmEzMzNkNDA1NA0KPiA4OTRhZDNiMjNmMjM0MTVhNTI1MjMwXQ0KPiAr
DQo+ICtTaWduZWQtb2ZmLWJ5OiBwZ293ZGEgPHBnb3dkYS5jdmVAZ21haWwuY29tPg0KPiArLS0t
DQo+ICsgZ2NjL2NvbmZpZy9hcm0vYXJtLWNwdXMuaW7CoMKgwqAgfCAxMiArKysrKysrKysrKysN
Cj4gKyBnY2MvY29uZmlnL2FybS9hcm0tdGFibGVzLm9wdCB8wqAgMyArKysNCj4gKyBnY2MvY29u
ZmlnL2FybS9hcm0tdHVuZS5tZMKgwqDCoCB8wqAgNSArKystLQ0KPiArIGdjYy9kb2MvaW52b2tl
LnRleGnCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKystLS0NCj4gKyA0IGZpbGVzIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQg
YS9nY2MvY29uZmlnL2FybS9hcm0tY3B1cy5pbiBiL2djYy9jb25maWcvYXJtL2FybS1jcHVzLmlu
DQo+ICstLS0gYS9nY2MvY29uZmlnL2FybS9hcm0tY3B1cy5pbsKgwqDCoMKgwqDCoMKgMjAyMS0x
Mi0yMCAyMDoyNDo1OS45MTIxNTk4NDUNCj4gLTA4MDANCj4gKysrKyBiL2djYy9jb25maWcvYXJt
L2FybS1jcHVzLmluwqDCoMKgwqDCoMKgwqAyMDIxLTEyLTIwIDIxOjAwOjA0LjQxNzAwMzg0NQ0K
PiAtMDgwMA0KPiArQEAgLTE0ODEsNiArMTQ4MSwxOCBAQCBiZWdpbiBjcHUgY29ydGV4LWE3Ni5j
b3J0ZXgtYTU1DQo+ICvCoCBjb3N0cyBjb3J0ZXhfYTU3DQo+ICsgZW5kIGNwdSBjb3J0ZXgtYTc2
LmNvcnRleC1hNTUNCj4gKyANCj4gKysjIEFybXY4LjUgQS1wcm9maWxlIEFyY2hpdGVjdHVyZSBQ
cm9jZXNzb3JzDQo+ICsrYmVnaW4gY3B1IG5lb3ZlcnNlLW4yDQo+ICsrwqAgY25hbWUgbmVvdmVy
c2VuMg0KPiArK8KgIHR1bmUgZm9yIGNvcnRleC1hNTcNCj4gKyvCoCB0dW5lIGZsYWdzIExEU0NI
RUQNCj4gKyvCoCBhcmNoaXRlY3R1cmUgYXJtdjguNS1hK2ZwMTYrYmYxNitpOG1tDQo+ICsrwqAg
b3B0aW9uIGNyeXB0byBhZGQgRlBfQVJNdjggQ1JZUFRPDQo+ICsrwqAgY29zdHMgY29ydGV4X2E1
Nw0KPiArK8KgIHZlbmRvciA0MQ0KPiArK8KgIHBhcnQgMHhkNDkNCj4gKytlbmQgY3B1IG5lb3Zl
cnNlLW4yDQo+ICsrDQo+ICsgIyBWOCBNLXByb2ZpbGUgaW1wbGVtZW50YXRpb25zLg0KPiArIGJl
Z2luIGNwdSBjb3J0ZXgtbTIzDQo+ICvCoCBjbmFtZSBjb3J0ZXhtMjMNCj4gK2RpZmYgLS1naXQg
YS9nY2MvY29uZmlnL2FybS9hcm0tdGFibGVzLm9wdCBiL2djYy9jb25maWcvYXJtL2FybS0NCj4g
dGFibGVzLm9wdA0KPiArLS0tIGEvZ2NjL2NvbmZpZy9hcm0vYXJtLXRhYmxlcy5vcHTCoMKgwqDC
oDIwMjAtMDctMjIgMjM6MzU6NTQuNjg4Nzk1OTU4DQo+IC0wNzAwDQo+ICsrKysgYi9nY2MvY29u
ZmlnL2FybS9hcm0tdGFibGVzLm9wdMKgwqDCoMKgMjAyMS0xMi0yMCAyMTowMDowNC40MjEwMDM3
NzYNCj4gLTA4MDANCj4gK0BAIC0yNTMsNiArMjUzLDkgQEAgRW51bVZhbHVlDQo+ICsgRW51bShw
cm9jZXNzb3JfdHlwZSkgU3RyaW5nKGNvcnRleC1tMjMpIFZhbHVlKA0KPiBUQVJHRVRfQ1BVX2Nv
cnRleG0yMykNCj4gKyANCj4gKyBFbnVtVmFsdWUNCj4gKytFbnVtKHByb2Nlc3Nvcl90eXBlKSBT
dHJpbmcobmVvdmVyc2UtbjIpIFZhbHVlKA0KPiBUQVJHRVRfQ1BVX25lb3ZlcnNlbjIpDQo+ICsr
DQo+ICsrRW51bVZhbHVlDQo+ICsgRW51bShwcm9jZXNzb3JfdHlwZSkgU3RyaW5nKGNvcnRleC1t
MzMpIFZhbHVlKA0KPiBUQVJHRVRfQ1BVX2NvcnRleG0zMykNCj4gKyANCj4gKyBFbnVtVmFsdWUN
Cj4gK2RpZmYgLS1naXQgYS9nY2MvY29uZmlnL2FybS9hcm0tdHVuZS5tZCBiL2djYy9jb25maWcv
YXJtL2FybS10dW5lLm1kDQo+ICstLS0gYS9nY2MvY29uZmlnL2FybS9hcm0tdHVuZS5tZMKgwqDC
oMKgwqDCoMKgMjAyMC0wNy0yMiAyMzozNTo1NC42ODQ3OTU5MTMNCj4gLTA3MDANCj4gKysrKyBi
L2djYy9jb25maWcvYXJtL2FybS10dW5lLm1kwqDCoMKgwqDCoMKgwqAyMDIxLTEyLTIwIDIxOjAy
OjQ0LjYzMDI2MDI4NA0KPiAtMDgwMA0KPiArQEAgLTQ2LDYgKzQ2LDYgQEANCj4gK8KgwqDCoMKg
wqDCoMKgY29ydGV4YTczY29ydGV4YTUzLGNvcnRleGE1NSxjb3J0ZXhhNzUsDQo+ICvCoMKgwqDC
oMKgwqDCoGNvcnRleGE3Nixjb3J0ZXhhNzZhZSxjb3J0ZXhhNzcsDQo+ICvCoMKgwqDCoMKgwqDC
oG5lb3ZlcnNlbjEsY29ydGV4YTc1Y29ydGV4YTU1LGNvcnRleGE3NmNvcnRleGE1NSwNCj4gKy3C
oMKgwqDCoMKgwqBjb3J0ZXhtMjMsY29ydGV4bTMzLGNvcnRleG0zNXAsDQo+ICstwqDCoMKgwqDC
oMKgY29ydGV4bTU1LGNvcnRleHI1MiINCj4gKyvCoMKgwqDCoMKgwqBuZW92ZXJzZW4yLGNvcnRl
eG0yMyxjb3J0ZXhtMzMsDQo+ICsrwqDCoMKgwqDCoMKgY29ydGV4bTM1cCxjb3J0ZXhtNTUsY29y
dGV4cjUyIg0KPiArwqDCoMKgwqDCoMKgwqAoY29uc3QgKHN5bWJvbF9yZWYgIigoZW51bSBhdHRy
X3R1bmUpIGFybV90dW5lKSIpKSkNCj4gK2RpZmYgLS1naXQgYS9nY2MvZG9jL2ludm9rZS50ZXhp
IGIvZ2NjL2RvYy9pbnZva2UudGV4aQ0KPiArLS0tIGEvZ2NjL2RvYy9pbnZva2UudGV4acKgwqDC
oMKgwqDCoDIwMjEtMTItMjAgMjA6MjQ6NTkuOTE2MTU5NzgyIC0wODAwDQo+ICsrKysgYi9nY2Mv
ZG9jL2ludm9rZS50ZXhpwqDCoMKgwqDCoMKgMjAyMS0xMi0yMCAyMTowMzo0MS4zMzcyOTA3MDQg
LTA4MDANCj4gK0BAIC0xODg1Nyw5ICsxODg1Nyw5IEBAIFBlcm1pc3NpYmxlIG5hbWVzIGFyZTog
QHNhbXB7YXJtN3RkbWl9LA0KPiArIEBzYW1we2NvcnRleC1tMzVwfSwgQHNhbXB7Y29ydGV4LW01
NX0sDQo+ICsgQHNhbXB7Y29ydGV4LW0xLnNtYWxsLW11bHRpcGx5fSwgQHNhbXB7Y29ydGV4LW0w
LnNtYWxsLW11bHRpcGx5fSwNCj4gKyBAc2FtcHtjb3J0ZXgtbTBwbHVzLnNtYWxsLW11bHRpcGx5
fSwgQHNhbXB7ZXh5bm9zLW0xfSwNCj4gQHNhbXB7bWFydmVsbC1wajR9LA0KPiArLUBzYW1we25l
b3ZlcnNlLW4xfSwgQHNhbXB7eHNjYWxlfSwgQHNhbXB7aXdtbXh0fSwgQHNhbXB7aXdtbXh0Mn0s
DQo+ICstQHNhbXB7ZXA5MzEyfSwgQHNhbXB7ZmE1MjZ9LCBAc2FtcHtmYTYyNn0sIEBzYW1we2Zh
NjA2dGV9LA0KPiBAc2FtcHtmYTYyNnRlfSwNCj4gKy1Ac2FtcHtmbXA2MjZ9LCBAc2FtcHtmYTcy
NnRlfSwgQHNhbXB7eGdlbmUxfS4NCj4gKytAc2FtcHtuZW92ZXJzZS1uMX0sIEBzYW1we25lb3Zl
cnNlLW4yfSwgQHNhbXB7eHNjYWxlfSwNCj4gQHNhbXB7aXdtbXh0fSwNCj4gKytAc2FtcHtpd21t
eHQyfSwgQHNhbXB7ZXA5MzEyfSwgQHNhbXB7ZmE1MjZ9LCBAc2FtcHtmYTYyNn0sDQo+IEBzYW1w
e2ZhNjA2dGV9LA0KPiArK0BzYW1we2ZhNjI2dGV9LCBAc2FtcHtmbXA2MjZ9LCBAc2FtcHtmYTcy
NnRlfSwgQHNhbXB7eGdlbmUxfS4NCj4gKyANCj4gKyBBZGRpdGlvbmFsbHksIHRoaXMgb3B0aW9u
IGNhbiBzcGVjaWZ5IHRoYXQgR0NDIHNob3VsZCB0dW5lIHRoZQ0KPiBwZXJmb3JtYW5jZQ0KPiAr
IG9mIHRoZSBjb2RlIGZvciBhIGJpZy5MSVRUTEUgc3lzdGVtLsKgIFBlcm1pc3NpYmxlIG5hbWVz
IGFyZToNCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2
ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAo
IzE1OTkwNik6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL21lc3NhZ2UvMTU5OTA2DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL210Lzg3ODcyNjYwLzM2MTY3MDINCj4gR3JvdXAgT3duZXI6IG9wZW5l
bWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6
DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vu
c3ViwqBbDQo+IGFudWoubWl0dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gDQoNCg==

