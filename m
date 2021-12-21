Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152B0C433FE
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 07:46:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.3304.1640072763545920553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 23:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=SPY3Nm+P;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640072763; x=1671608763;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BYH6c28TJYSqxpBkDUPFP4qZAqqSolq49EGpbN9fxQ0=;
  b=SPY3Nm+P30W52B1i3NrpgmmR/1UnMqgIOkREYfC1DWgdMWCJ+cR2x6Wu
   0UYZ9efoJAI+eL659E7KJ+ZHcoULB4XY/5o0fwVgwTQuV2F6R+tOn5oli
   HnueYsZ7c+Nm3ieBurJdfZ5l7nMnCiCQCDlRdI6e7tCwz0JCou1MKFkPo
   z2xUHYIEy5kcbwsfZq5dI81pdFHd7JK4w45GU/pZXNFs54toSOglrYkrw
   UXYeLqfydZBDgXz8A/ylGPBMoi1brYeWAHZk+TYqPOSA/fTviL53BXvoH
   fDDrBJJdHX1cU+PIhtLoHTyxKmZ8bVakg5kx+xNn6Gta1CwifcIHh0kgs
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="220357802"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600";
   d="scan'208";a="220357802"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 23:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600";
   d="scan'208";a="484338023"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 20 Dec 2021 23:45:51 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 23:45:51 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 23:45:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 20 Dec 2021 23:45:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 20 Dec 2021 23:45:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKAYjOTqjtWAk/cm3V+C4p+zPVm5xeL9l6PvAHU/0Ya9TJsIiXxn8qdfH6Y+DzlfG/RWeRd5QGTE4qLTWGN1/vOpScGgTY3jYkK85beWsXcm8UTiAuYUVJ+yctA3FXgTgAsSHTasVZRmmKA4pjmaj0k+AJ3Ykcky7m2W0bOV4ik+tbx7ROvB0C6RGNuAuc22FVDvaUZ4Jf+q826AupFmbQtvbdphzFgY8Od99Bb/b/Vmk+dUzyMZtkFVIcmjbSWcevZaWkkCZx7lp/QP+RWngDUDmMN4FnHcCaT5puPKf6TJI3ZzORVg3uNzBQZKw8mRwJaaiCxnKsAsk9rHd5WBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYH6c28TJYSqxpBkDUPFP4qZAqqSolq49EGpbN9fxQ0=;
 b=nQrV0cGiaJJsYIL5JeTkGpFl2ZZUfp5izu8tnri24t2FAIelKTF+5zCr+eZ8JqYcqTkf07azwBFYANa9BxGw9EQPMU/RgClkhM2nMow8kNHayEmx1s7Pt5VAmt3192dHkYuVcA+aX8pUoNpkT3wXXzDQOmc+2KrGmbsSlvm0+WcCd8bCj+XB3+7pA/1y8Vhsn/1uXetzUTDa3DekBSmA9GEqalU+PxiTSJfFY62O1kkGCA6qRtALZabOhyd5GTTTyyopKC1dt0b0KainT6brAA7BAx5othzjTYFPajStiHhoddTqEk2PrKL//h3tPTET3+kzxK0RPSPYldq/4kmHcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM6PR11MB3371.namprd11.prod.outlook.com (2603:10b6:5:e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Tue, 21 Dec 2021 07:45:49 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::fc42:7980:6484:8892]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::fc42:7980:6484:8892%9]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 07:45:49 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.13.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.13.rc1)
Thread-Index: AQHX8Yb110r9sfTKC0immUls0d7G2aw8mfdA
Date: Tue, 21 Dec 2021 07:45:49 +0000
Message-ID: 
 <DM5PR1101MB23482FA91A07CA4057E768D9BB7C9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <99e75b930d85e240c51074406b0cd896c93257cb.camel@linuxfoundation.org>
In-Reply-To: 
 <99e75b930d85e240c51074406b0cd896c93257cb.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6744e6d-d8d1-4bc6-6490-08d9c455e819
x-ms-traffictypediagnostic: DM6PR11MB3371:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB3371C12D767CB0E03B6FB7A2BB7C9@DM6PR11MB3371.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /6+dlFNUFu9PYzjSITtMa063+kWGIm6mhQuJVvmHOUSibw49xsd7U7wn64UWgIGMc7X0E2pelhoOmb2RvqwGuzg92uKisp9MLnN8B4YvL81RJBo4ytCUiDlb+M2cd7qEYaQpN2O2iQuF218fhC7dVvqcyFaeNC8rz6fHAZhRnxPqLykZLswHLqJrkZzULTrjA4VhELzZlJ0Jyc44Tz6WlD7S1udDvNn+y5CJYVsEnwui0McJkpQzbJyWniRs6SloxF9/9hDhTHeXToXDR5/qoQ5ZEBoQdWEUP903EF5dsTEg2eo6fffTJyglYFrC50PDIUfb6raDFzAGIFD2x6cOiv3/KSfv8XjymFMuDBCJubY9MRrdPc117OyHY5piZev54bcEEzvKVgPHCmv8cSuJVKm66tPXBmZKQLEfTr62jhvCx0ZY8SUPCaQiBx3f3z1VXsTKOSBmp3L/NnZzvQNEhXBukgoyJFgWV9+vhCJATVMg2cWSLb5oKtVI1omrtmW93bWkZ9ET5BWJaRfJowcW4Ux1gtf4uTHQoV2nxR+LsKHSh0Xt1OWQTTisUzt66Pp9SRTIsl01WPFOnEoBNhrEpAidfuT8SQfNoe/ofROeEbAYPDfoqJvkM1Bn6FGq7qnKTIp8B/33yKFzIxVrYiABaUtO9V2K7GkSFZh9f3xQxYMKs7BkfP55Ga2ziQX82QFYQn6ECOIf53VrpZo2tnE4s9d/FW19baXgVt3mb/dpjDZ9R2/39io99VJGEs18HMlUUrAn0bIEFnPq7D4Y33408KDukd4cDPwVk828WRCP7/rnq0HuFDe6BTL39a6xyBKAjaT1+pYY8a0HnXFvNIvBAw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(26005)(15650500001)(55236004)(55016003)(66946007)(186003)(7696005)(38070700005)(5660300002)(33656002)(122000001)(508600001)(52536014)(66556008)(316002)(966005)(8936002)(110136005)(71200400001)(9686003)(86362001)(66476007)(38100700002)(83380400001)(2906002)(82960400001)(66446008)(8676002)(76116006)(64756008)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RkY4RklQcjlOejlDeWNnZXZLWmRFdlNwNkNsZmJRaGxtTUl3SDhVR2FIWDhB?=
 =?utf-8?B?SlFxendJUytGL2t3TXVSRC9BamNES1dLa0ZIVnlCaXdJSjJhem9WdVJlWkFz?=
 =?utf-8?B?bGVvNGZadEh1T0t1OS90UlJHT1hZUUpmN3drV2hXZGJQajQrdERPY3RMV2N2?=
 =?utf-8?B?bkh5K3hKKzFVeHR2Y1BxOHA0Z3FGdlVHUjA0M3Jyb2QrY01tNFpOaitkK2FX?=
 =?utf-8?B?dDNDMlA5czJwQnN1R041a1ZYaU9yWVFRNjJYRjlEMUhnYmJNWU0yQ1dER0Uv?=
 =?utf-8?B?UURBSWNWeWtITWxCNlpQTVFGWGwydG9CUUVlTnY1bUQwK2l2RzRRLzA5VWor?=
 =?utf-8?B?QjUyZTlBVDJjRldkUHlKcTZkY044WnV1YUZYb1k0dEhOWUhrOHVzaS84UGJE?=
 =?utf-8?B?Uzg4TmVuSUc2Q0dqM2tlamQ1ajdUM0cyNDF1dTJnSEgyZmxKRmdTSiswVEZq?=
 =?utf-8?B?UXhNVm1VSks1UTVmeGRqclZUcVpEY0xLWHNETnpTUWFXT2hBU3RETkZUZldH?=
 =?utf-8?B?QU1pcnFNL3RQU1JWc25WbXA2U1ZiMkVJUEd6ZFYreUV3RHkzK3FnM3EybjJU?=
 =?utf-8?B?VmtYZXVObURXVEtHRTAyRkxkL1J4Ky9JVyt0R0RxTkFxTHYyQUljVDdNWElk?=
 =?utf-8?B?bXR5WDNBTWVFdG9lZFZFNkdETkJMSXRwL1JHR0JiZGVZYkthMWJWeDNrZXNH?=
 =?utf-8?B?UGwxR2tTN20rcVZUM2ludmdZRUI3RE11VVBHRVJZRE8zeDdWZFZxOG0wcUZF?=
 =?utf-8?B?NytMUkVUa29aYlNBUjlRTUVqRFlCbzlVNk9YVFNjL3NCRVU1NHdlSGV4WVlW?=
 =?utf-8?B?blI0YnRkaUpWRk9KYW5QZ05GVTg4SGQyVjZiSFZsQWZjNHo4V0xkeTFMMkFp?=
 =?utf-8?B?WEo4akI4UGcyMWNMRDUvN2JpS1NFTlY3WHRmc0lScTdzdFY4L0tsclRLOC81?=
 =?utf-8?B?eURxWGI0ZXFSajdpVEtLREg2TmRxZW9tT3JUa2NoRE4rZzJsYWQwRUFobFVT?=
 =?utf-8?B?NUxLZjdOQkJ2eWtZcXpJcnNMNm55R21BbFdpQ0h6WGNINEFWdG9TNG0vcXJW?=
 =?utf-8?B?a0NNR29QY1hhdnlteGVZQmZGNWEwZ2lkSURpOXZzSUkrdmtNWlorcWVsOFNk?=
 =?utf-8?B?TGx4MnVPQUtxNWdLN1Axc2pxUVlWNXZ5elJ3cFZaV3VNVUtEQmtWSEZBSUIr?=
 =?utf-8?B?dUpCbVFmYmc1WDAvTExBbXphSzdBRXQzOFg2VmlsUWV0WGcrYWhBa0VZWi9H?=
 =?utf-8?B?Vks2VFhrTndwcDlQcDEwc0NyR2k1ZWZZRzlveUdJVXp4RGowbkdBTWpzS0Fu?=
 =?utf-8?B?ZThFb3h5VHFQQ2RzcmFGN0Q0bXRhMXRJUWZHVFFGdy9pQUZHUHJmZlpuNkpY?=
 =?utf-8?B?dWZuMkpJNlBuNG9ZY3JSSEd6TTBZZDVOTzdiYXc4MTdLTTBpLzBDdmhjc3dJ?=
 =?utf-8?B?N0VPQm0yeVVBSEt0U1JhZHh0K2xMMnhpZ3MzeFA4VVdoekRiNU1YTG1PQ0lH?=
 =?utf-8?B?aVVtY2dtUDI3K0MyUnBHR0N2U3ZuM3RNRXVQRXFPaGZGU2ZDWmpaanphZ0JI?=
 =?utf-8?B?OVFiczd1Vi9qbk0yZUl3UXlxYU1xR0xzVFBoTTVUM05tNHhQNU95R2tIUEEz?=
 =?utf-8?B?akxpUFFlMzUvcXFqWG05VThTQlduV2F4eHJ3eExrYjIxbmFlaTlhSHB6MXo5?=
 =?utf-8?B?dExXMFN6bHdwTDNGQ2Y2Y2pVM2pSRURsTm1WdE1YSVB3aEdPUW9vSTRFM01G?=
 =?utf-8?B?WFg1OVBWbktNOFNtSnY2QXpTdXBrMWVyenUwSmtZMFZpTTlZQ2Q5N1JHSUVl?=
 =?utf-8?B?RUVvUTRqVFNGUjNNUlplV1g0ckFTUWJMSklMOHRKK0NBODVQOTR2Vm1udG1n?=
 =?utf-8?B?R0RZbUtjUi9Pend0MGRFYVQvY2gzaTZ2dnN4QVBFYUtYNlFpbFVXblNLdksx?=
 =?utf-8?B?TjYzbkxtTVA4Vm1Qdk1UeEFUcll5aVNwUm1BUHBpODZUc3F5SHF0L1VaMys0?=
 =?utf-8?B?YzVMcDJ6WldiYXlJbnQvays3dllrakw1VDZBTHZIOUZLVm5ZQnNtcWx2c09Y?=
 =?utf-8?B?Ync2SFYrekY4RVJZS1BjU3pUdlpDbjVzUnVMbXNJWDBUcTRidXRoYjFVc2Vq?=
 =?utf-8?B?Ny9sREkwcFgyYjlONHU0dlI4Qi9SRlcvdm8rOS9wREpxMmlDbWdoRi9NS2dm?=
 =?utf-8?Q?lJLPshQiXgBcOOunsd1iDfI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6744e6d-d8d1-4bc6-6490-08d9c455e819
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 07:45:49.2847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 q7MWHYFFouTS7AayURaOvGa0176V1vhEYBZFPJlMPaG40ZQ+XJvFAHoCOGc5d6/FYiiHy1I4qqSmn3T4VnlcHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3371
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 07:46:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159907

SGkgYWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4xLjEzLnJjMTog
IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3Ry
ZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09PT09
IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuIA0KDQpuZXcgaXNz
dWUgZm91bmQgDQoNCkJ1ZyAxNDY2OSAtIFtRQSAzLjEuMTMgUkMxXSBmYWlsdXJlIGluIHB0ZXN0
IDpnc3RyZWFtZXIxLjAuZ3N0cmVhbWVyLTEuMC9waXBlbGluZXNfc2Vlay50ZXN0DQogICANCiAg
IA0KPT09PT09PSBCdWdzID09PT09PT09DQpodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5v
cmcvc2hvd19idWcuY2dpP2lkPTE0NjY5DQoNClRoYW5rcywNCkpheQ0KDQo+LS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZyA8cWEtYnVpbGQtDQo+bm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPlNlbnQ6IFdlZG5lc2RheSwgMTUgRGVj
ZW1iZXIsIDIwMjEgMzo0MCBQTQ0KPlRvOiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4g
PHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+Q2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlv
biA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+U3ViamVj
dDogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQg
YXV0b2J1aWxkZXIgYnVpbGQNCj4oeW9jdG8tMy4xLjEzLnJjMSkNCj4NCj5BIGJ1aWxkIGZsYWdn
ZWQgZm9yIFFBICh5b2N0by0zLjEuMTMucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVp
bGRlciBhbmQgaXMNCj5hdmFpbGFibGUgYXQ6DQo+DQo+DQo+ICAgIGh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTMuMS4xMy5yYzENCj4NCj4NCj5CdWlsZCBo
YXNoIGluZm9ybWF0aW9uOg0KPg0KPmJpdGJha2U6IGYxOGI2NWQwYjlhNmI5ODNkNTNiZGU0OTFl
MWJmMmNhNTY5NDk0NDQNCj5tZXRhLWFnbDogNmQxYWI5ZjNiYjI3MGE3NzNlYzVkMmY3YzhjODU2
Nzk2ODMzYjU1OQ0KPm1ldGEtYXJtOiBjZTUzNWRmYjk2ZGU0ZDI1MjlmMDkxZDdkODVhNzE3MmM2
MjYwMDFjDQo+bWV0YS1hd3M6IDk5NzljZmE2NzYxMDVjYjY4Y2ZhZGZkYWVhYmYwNDRkN2M5MTkz
MTkNCj5tZXRhLWdwbHYyOiA2MGIyNTFjMjViYTg3ZTk0NmEwY2E0Y2RjOGQxN2IxY2IwOTI5MmFj
DQo+bWV0YS1pbnRlbDogODc5ODQxMTVlYjZlZDFhNGMxNzIwNDYyOWRjYjEwMGY2Yjc2ZmU4Mg0K
Pm1ldGEtbWluZ3c6IDUyNGRlNjg2MjA1YjVkNjczNjY2MWQ0NTMyZjVmOThmZWU4NTg5YjcNCj5t
ZXRhLW9wZW5lbWJlZGRlZDogNjlmOTRhZjRkOTEyMTVlN2Q0ZTIyNWJhYjU0YmYzYmNmZWU0MmYx
Yw0KPm9lY29yZTogOTBhMDcxNzhlYTI2YmU0NTNkMTAxYzJlOGIzM2QzYTBmNDM3NjM1ZA0KPnBv
a3k6IDc5NTMzOTA5MmY4NzY3MmU0ZjY4ZTRkM2JjNGNmZDBlMjUyZDE4MzENCj4NCj4NCj4NCj5U
aGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1
aWxkZXINCj5HaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1dG9idWlsZGVy
Mg0KPkVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQo+DQo+DQo+DQo+
DQo+DQo+LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj5MaW5rczogWW91IHJlY2VpdmUgYWxsIG1l
c3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj5WaWV3L1JlcGx5IE9ubGluZSAoIzgyKTogaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+bm90aWZpY2F0aW9uL21l
c3NhZ2UvODINCj5NdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9tdC84NzczOTk2MS80ODk5NDYzDQo+R3JvdXAgT3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlv
bitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPm5vdGlmaWNhdGlvbi9sZWF2ZS8xMDQw
NjgwNS80ODk5NDYzLzcxNTM4OTk5NS94eXp6eQ0KPltqYXkuc2hlbi50ZW9oQGludGVsLmNvbV0N
Cj4tPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPg0KDQo=

