Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9B7C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 11:54:25 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.10046.1637668464468038850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 03:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=zSdeJAW2;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="234830302"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800";
   d="scan'208";a="234830302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 03:54:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800";
   d="scan'208";a="650044669"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP; 23 Nov 2021 03:54:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 03:54:22 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 03:54:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 23 Nov 2021 03:54:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 23 Nov 2021 03:54:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuhpHfS7B7XFID2CZN/Blq0FsMudpCQasqj6L+70OV7PUp7k4bDSAlEAQqOhGvZ5Xe//b8i+3aWZqt68LA1sFhS9c4grN1mN9E/5s30pbLmsFCAoT9cnU/2jMxjforcx7ab0GarwOGEc5DpADFkAUj964Hi6oGkSLAzor+ixmnGTiSI88hXIaklsjl8QAIAKVK66LnsuhOOj/+F9b35wSF+wTlEy8LpNh19W3wCeSJmcbpRZyA+Enl3EgkIoYDd76zoCXmAQur5qTPTr3g3q8VbYFlleKeKZ8YwzZIMlkGBPjWJF190Cu8XmF6Fx+mENQcTj9uJTU3CTkfVomyxh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fX09R3RYT0baDoo1gI8JIPwWSWv/A+06OJKPK4GjFw=;
 b=e5YZlX4rPlHqZQiSFGwLsbNVv/BkNHtsT0rEu6eHaUbOwXTPOEEA6HbboxxH7oIbBAfwm7yOEc4rT4v2+kQut8NIJ5ubMbviV98qN7nNc+VF4Bhnf8JvSrEjGNhp9RxB0mGDrhf/mgS32bj9oE8xspQU2N70eaX1g6JIXbdu1TTgTVhJLiSyRP2rQeUKk8934B67tx8W21QaGG1pV3Lrj3C7/8KbhVfQxunNa8YTlSu77AXtjJ5iu2d4KKVjSupjId2NIqQDBJz67ZnJ/bTOLePP7EQlZn1ytb9pJQgLYWl9dbJzkkak7etTSBgTlTLZ5h6dHMvNG7LM7daaya8uPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fX09R3RYT0baDoo1gI8JIPwWSWv/A+06OJKPK4GjFw=;
 b=zSdeJAW2uYbEpJlEZk3YjFExNZo7YRuvxrhqYYm1bh9ehSwS9uuDBK0aBbn6bk7jcRVCQk79bCIE0W1t8rXraHp3yxEuA1amou0oiic18obQ+HQz30EEJ4dCpbCCinn+Ir9x9QEh5kxOnXM46vSquMmawmwMt9sQA7fQrj377/0=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN6PR11MB4179.namprd11.prod.outlook.com (2603:10b6:405:76::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Tue, 23 Nov
 2021 11:54:18 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::60bc:7c4f:4a45:d39a]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::60bc:7c4f:4a45:d39a%4]) with mapi id 15.20.4713.022; Tue, 23 Nov 2021
 11:54:18 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	qa-build-notification <qa-build-notification@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.12.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.12.rc1)
Thread-Index: AQHX2zjYVsfkmAX7kkyXvJLwmUHdTqwRCtBw
Date: Tue, 23 Nov 2021 11:54:18 +0000
Message-ID: 
 <BN9PR11MB5372F9B07F411F0B1708A930BB609@BN9PR11MB5372.namprd11.prod.outlook.com>
References: 
 <581c5d14ffc3eca5b39297c422a08eabba4f6d93.camel@linuxfoundation.org>
In-Reply-To: 
 <581c5d14ffc3eca5b39297c422a08eabba4f6d93.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: ae16c9d8-bc64-41f9-d411-08d9ae77fb2a
x-ms-traffictypediagnostic: BN6PR11MB4179:
x-microsoft-antispam-prvs: 
 <BN6PR11MB4179A28CC317FF96EC7B0A3EBB609@BN6PR11MB4179.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 I56gTr7KZjWWKuA0mxa7KMT3e6HhdT1YoNNOIYg4+1IeSnWkq0pD2vsGvi9JUKpXeLrwwKhb8I0uWUtDoeuDGISozyinjBK9Vey236ssUfuQEVuM8NmbioJCy406ok4tR8Y4+cQ76gvVnoS0S9sRXrOB6QVu/1+8I5yPNos0XpoFeQCPwClDp5ioBbLIcSHdpCzxwsF5Tysu6pYpFKXQkz3DkFVHXYdsVGKbj2bZd8iAfBW07ctfj81/OKklFk9xaO9sWxSyHhSg0mzj668vZYYsCjBC80n3s49Xa+AZoH9QC1NBpmrl0l+EMlN/gKm5PPga1GV5RIkXJQRnOCgzIL2EfkqIZqIT032jqXOIMvmbKXap9IGtWyhOuBaj8PnThWPdHgvCU+FosokgmsNVIlt048gyj1lrQf6YpF/gLzpalBTTOA5hMjFviXwQEOG6RGioxfE5JE1hu86u5gbFTNzUn3jNzwtgOvI41bJaXxS9J1kSXcc2kqRq4xJV/pqonoe6HO1+8UHupa+OOybceUuqRz4NFmonyfT3uUYt2rnY4Qaq2pWOKczM7dtPuz0gQrg6mCcsgkaGpUMDetyEsRgu0/C/dFDa8bRje6SzY+QEt6LCcG70/klP4rODxLfqdo5RIx6a+Kndkxuy2I/jILsj6tCke3BY0P7bBs8fHZx5dc3ZbLiQPOOkfIQXSYSf3mKOAK6Xb42LWVPDUyeLCNXVx84lD10caV1CyG/jRrR4IK7Kl840CzRxuKPYBw+Fct7v3mtf9vnHXBdf6ZtgQ5S781gLMshv7aKRZgF1/mEK79UUeV/NlyDEQJUjHefcytUwWj1RSbvSUkTn8/0zBIATWGGdHW3Mgj0R+DIgvOs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(186003)(33656002)(66946007)(7696005)(2906002)(15650500001)(6506007)(83380400001)(76116006)(66556008)(64756008)(52536014)(66446008)(66476007)(8936002)(86362001)(8676002)(82960400001)(9686003)(316002)(38070700005)(508600001)(966005)(71200400001)(38100700002)(122000001)(5660300002)(55016003)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NWRLSmNPcTlHbzFKZDQvWTJWZjBZZU1udENraVVYaEFwbWVxM1pPTG9XRU5B?=
 =?utf-8?B?KzFYb2JoaUt2dW45OVBaTHdYVjJpSGY0K2x6S1V5WUoweGwwNkx3NUU4L1NR?=
 =?utf-8?B?Y24wRExqS3FOaXFwZngrT2h1d3VPYlFzZmtHNDR5SWFxYXNiYzBXSWowSmJE?=
 =?utf-8?B?KzZhc1J4eC9PekxtMkpmaXlxTlNsQ04rOEVRRlBodHhNN1ZveHovcmRxM0I3?=
 =?utf-8?B?MitndVRJVUpmWDYyaXBxaUFwVTlpRS9tNjdhM0lMUlZIVW5zZEdsVDBBd2Y3?=
 =?utf-8?B?elhyT2h3anErVFNadUVjK2phcmludGpzeTVBek5rUDUvdjhZNHJVQ09PWTBW?=
 =?utf-8?B?cEpHM1FCOEVmUk9FTGZBbnVDTnBwcUZiMHZlbUVKbzd3TE01TlJ2bzJ0dG9K?=
 =?utf-8?B?UEdxSnRBNm1YV0tCRjA4NE82Skk2c2N2K2tBREcvZEF4enVLRmp6U3Z6SnQ5?=
 =?utf-8?B?RlFMNSttR1RGLyszc0c2YWgvUG1Xd0tjY3A5YlI2WHNoU010ZXZyUi9hc3E5?=
 =?utf-8?B?N1Y0MFQzWWNUV3Mwd1c4VC93R05VU0hiN1hpNlJoVXdXWXM0cWZ1OVJGbFBa?=
 =?utf-8?B?MnRrb2djUW1oQjZZOHVTZHJsMlB2N0s0UVlaNHdyS2FBaEpONUp5UFpOZzRw?=
 =?utf-8?B?clF6cFdpaUdJNVhoWWo2V3M2R3gzVjVDWHI4aHhFRDJreXJFVmRGaDJwYlRE?=
 =?utf-8?B?SXBmWmxPNGswVW5Xakp4bk4xQ3VFYTNLYTE3Mjh0OGczLzZTR1ZCQUJGeEJT?=
 =?utf-8?B?MzZSL0VFdXRXYVBtTHl0UzlXQlpXdVVNWXU0aTRaamJWR1N2Vzh1YXdIenpM?=
 =?utf-8?B?b2VEaG9laEJURzl4M2p0Rjc5dUhaUXErYVBMY2VJTXFBNEwzVFFsZkxkaHpF?=
 =?utf-8?B?U1c5WlY0UGNaaGp2SDFma3pxVmpEd1FMSGFEaVFBdGtrV1h0Y3dMcEdkTmFj?=
 =?utf-8?B?NElwdERCRUg5S0hUbGhYV3BueXRHRlRacU16QUcvWWlINkJTY25qeXFZZG01?=
 =?utf-8?B?bFRFRDNUUUZ4aVdRa21iRUNKTCsxbUJ4cG5lZXlhcTZzWkxIMkZoUzhRWWxT?=
 =?utf-8?B?d1pXTjZBaW9JZC9NamFKVHYzN2dDMVlaQVRvN1l2d1E0dG9tcVBpU0pRMkZi?=
 =?utf-8?B?YzhrOEtYVHlwMDExZkZKTkNaR0ovZDJkWDZBWEFiYmg2OEZCYUpCWC9mVjJr?=
 =?utf-8?B?a0tRaCtXTSs4a21BODlwMW9lWVI2S3dqWFNLb0lOU2tuZ0ZxNXNZVHlBdEFP?=
 =?utf-8?B?Wm9FWjVUOCt1WlZZUEpMdEVZb3BkTWszWU1rYVIxK1VHRmtOMVhlNHFWWlZu?=
 =?utf-8?B?T1VrZVNQbk1jWmJ5RWRPZG95UFNRUXBzclRUak9vdkZaOENpVi9DU2IvODk3?=
 =?utf-8?B?eEVSQTJVRHJQbjAvS1hlUU9uQmdoNkgrTUN3K3dicXIyenJNSENrUzZVN2VG?=
 =?utf-8?B?WnVEaGxCK1o4UWRkcVpvSFZ1SWtHcDZ6Kys5cWE3ekdMMUVSU0M1dHhPcWM1?=
 =?utf-8?B?Ti9JdnFzaE5UTjEzajRvam9sUEQ4dnpvQ0p4bWI3SjVIRVJCMTB2ZzBZWTVF?=
 =?utf-8?B?eHJ2ejZNVmltSjlPL1U5azFHSDhRYzVyazd2MVVhaUQ0anlGMFBHNFRPVTVu?=
 =?utf-8?B?MU1HTVdpa00reW1jak9DWTc4cXFMakNnR0QyNmttSC9ZTm8vTTN1MHZ1YWRR?=
 =?utf-8?B?WkVLQ0Jab1FvRjV5Wmpra0Y2N0pmamhjSzhlbE43R2tiQVJWcCtOVlRoSzlI?=
 =?utf-8?B?bExVdmgwTjE3TkkzTStvNzNXVU9adk9XRTR3dGh0TE1SbUdJeFlmWFU3UHpJ?=
 =?utf-8?B?UWE1VG5UTDFjcCsvWVBpbHRSTHUzSlNsZytqNWVOK3JTWlVUbytIZlppa3BT?=
 =?utf-8?B?Qmw4OS9rTUVTSjE1WFNuSkl0M2lxQ1BHVURBb2ZqWjVEYlhPaG55NjhHcHA4?=
 =?utf-8?B?RHRrN3gxZEJLcVBBYTJJT1hVMGVEdlFFblpDUFdSR0F3UWVUMzYxQ0hoL0Uy?=
 =?utf-8?B?QWUzVzNmM0pUOTdqWnRjRjJtMVZPb3hWTlYyNmF4bkZLSlhIY0U3bWlzanh6?=
 =?utf-8?B?SGh6eGU0ZERXSXdGZHpCM1NxemVTdEcyQjQxVEJuSXpNWFRBRlplVUVqVkM3?=
 =?utf-8?B?RlA3NzEvTnJEQjMvaExkbjlVTTdDdFlLelVvOTFKUTJvVloxbHBxUXhOUUto?=
 =?utf-8?Q?zHaGjvMpw8JxFNaVtA+53jw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ae16c9d8-bc64-41f9-d411-08d9ae77fb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 11:54:18.6172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tN1wHQE8yzxEjfE9a8Z0OclWFF7st0EUjQAF5LniiaZDWC6dS8ndihHVogdQcLdqRviTplcWzVOGsRlPmYplVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4179
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 11:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158599

SGkgYWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4xLjEyLnJjMTog
IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3Ry
ZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09PT09
IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuIA0KDQpuZXcgaXNz
dWUgZm91bmQgDQoNCkJ1ZyAxNDYyMiAtIGJzcHMtaHcuYnNwcy1ody5UZXN0X1NlZWtfYmFyX2Fu
ZF92b2x1bWVfY29udHJvbCBtYW51YWwgdGVzdCBjYXNlIGZhaWx1cmUNCiAgIA0KPT09PT09PSBC
dWdzID09PT09PT09DQpodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcu
Y2dpP2lkPTE0NjIyDQoNClRoYW5rcywNCkpheQ0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj5Gcm9tOiB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0b0BsaXN0cy55b2N0
b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYNCj5PZiBSaWNoYXJkIFB1cmRpZQ0KPlNlbnQ6IFdlZG5l
c2RheSwgMTcgTm92ZW1iZXIsIDIwMjEgNjoyNSBBTQ0KPlRvOiA8eW9jdG9AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+Q2M6IHFhLWJ1aWxk
LW5vdGlmaWNhdGlvbiA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmc+DQo+U3ViamVjdDogW3lvY3RvXSBRQSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRv
YnVpbGRlciBidWlsZCAoeW9jdG8tDQo+My4xLjEyLnJjMSkNCj4NCj5BIGJ1aWxkIGZsYWdnZWQg
Zm9yIFFBICh5b2N0by0zLjEuMTIucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRl
ciBhbmQgaXMNCj5hdmFpbGFibGUgYXQ6DQo+DQo+DQo+ICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTMuMS4xMi5yYzENCj4NCj4NCj5CdWlsZCBoYXNo
IGluZm9ybWF0aW9uOg0KPg0KPmJpdGJha2U6IGMwMzQ4ZGU4MTIxYzNhODQyYmY0NDkwNmY3ZTJm
NzllOTNmNzI3NWINCj5tZXRhLWFnbDogMDQwNmNiYjIzNWZiMDhjZTllNmY5ZDA3ZTY0ZTA5MzJi
MjAwNTBhOQ0KPm1ldGEtYXJtOiBjZTUzNWRmYjk2ZGU0ZDI1MjlmMDkxZDdkODVhNzE3MmM2MjYw
MDFjDQo+bWV0YS1hd3M6IDJmNzIzMDFmNWE3MzI3OWM0ZDJmMTJmYzYyMTg4NzY2Mjk2NjZlMDYN
Cj5tZXRhLWdwbHYyOiA2MGIyNTFjMjViYTg3ZTk0NmEwY2E0Y2RjOGQxN2IxY2IwOTI5MmFjDQo+
bWV0YS1pbnRlbDogNjI1ZGE4NWU3YjAxYjcxY2MzMTAyNjdiMGJhNzExOWViMTM5ZTlmNw0KPm1l
dGEtbWluZ3c6IDUyNGRlNjg2MjA1YjVkNjczNjY2MWQ0NTMyZjVmOThmZWU4NTg5YjcNCj5tZXRh
LW9wZW5lbWJlZGRlZDogNzg4OTE1OGRjZDE4NzU0NmZjNWU5OWZkODFkMDc3OWNhZDNlOGQxNw0K
Pm9lY29yZTogNDRiMTk3MGM0MGU5ZDczZjZlNjNmYjEwY2RjNTU4MzdhMjZmNTkyMQ0KPnBva3k6
IDA4Mzk4ODgzOTRhNmU0MmU5NmY5ZjBkMjAxMzc2ZWIzOGJjNzliMjQNCj4NCj4NCj4NCj5UaGlz
IGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxk
ZXINCj5HaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1dG9idWlsZGVyMg0K
PkVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQo+DQoNCg==

