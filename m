Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978D5C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 09:43:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.67712.1673257424688463328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 01:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=SAR24ag0;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673257424; x=1704793424;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=We/hg7SPnn1mUO2Vn+eLKl9ikvk5+ZntaF2drkQOKEU=;
  b=SAR24ag01HRjgcBtfHeOMHj0MI1ddHUOve1lIxX4iNnM+UAV22QDt3yw
   gDlD6OzZZ4HJHN0EWLZdDUTzfJzKsT5G2RYjiYRFgB61I0AczE7X8CUnE
   LHUYNKGbOQPH+KGuf6IhecBC9mhM2DdTgc95JUzXcCQu1BGCo7gTn0iDl
   kvKz+rNvbHh8sJRvwJW1Lvpmoe89xZ9ukeR3b8ouHWDzqwcx530FEU5RZ
   hqtAvy50FdPvCOr1ggj2MSGjgcH0EpF2vifn8A3bC+MsG5h0yE9TEUR8W
   sbnMFo78mG3jOKblGIc0BRLFo/YyTjSbcE59COUxqSXzEPVMX8ihbr3dA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="350047235"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="350047235"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 01:43:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="606549876"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="606549876"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 09 Jan 2023 01:43:43 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 01:43:43 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 01:43:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 01:43:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 01:43:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8WaQrZaV8FcTK6sXhy04Y2Q4QWCzpbCy+9v/8VXVs/QTBnCjSaFQ0pmyy9qousazj6D7Gi+XPEDDKxbN/+T2pvDJPAEsfcC4pc13xDN5RoEBWqZRWvRevZ50mJSCtdT6jri5Z1nfWptskpIJUwTp4CJBB+uKSEhxZGKXCJy2Krs6qhPyaK43dqv+Wx+Rt8UI/eHFSX49gQBGIHLbsbxjuEl4vcEhkxhSZdq8mA+yo+U/tsxEIulLakhw91idyFno/0IHxNqqDdaB2x8yD7aumiBgMDc3hH2QKk/OSRu8F9zkFYU7uXun7BG6G5PGYUiWIwBdRFMdk4J6txP0AVFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We/hg7SPnn1mUO2Vn+eLKl9ikvk5+ZntaF2drkQOKEU=;
 b=KQCma9I/tIES7wcbpIrRSo71EI3Mkuii5aRvSE+TB32/aEk3fcEFedwuZkWKq2YRsJlNL0iaZJRhKTm16ZNuSXf3KWKZod7PorIBGvZ3zu3Z7hIjKN9YKtK6b8oUlYYl4N9YJaySjYlKnB5WTjoPNG4K6LmDbSd/nEEJhhN00209q4DEpPewQi2qHQox8fXWiU2eRbotRSNzWgpnwIfM8Wn3Nd04DzCnU3Df9IYbobGGr8GfwtWm+rwGC2Qtj18S9w0km5ee8UmXlE325MnAyqiKFm7aP/NMnZDK0M0UXWHOtx+byEnXVPpzVnhGmHlaZNvhnQg9MFn5J1oRFSvczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2649.namprd11.prod.outlook.com (2603:10b6:5:ce::11) by
 DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 09:43:40 +0000
Received: from DM6PR11MB2649.namprd11.prod.outlook.com
 ([fe80::6406:62ad:2152:18f4]) by DM6PR11MB2649.namprd11.prod.outlook.com
 ([fe80::6406:62ad:2152:18f4%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 09:43:40 +0000
From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] freetype:update mirror site for package
 download.
Thread-Topic: [OE-core][PATCH] freetype:update mirror site for package
 download.
Thread-Index: AQHZJA5KpdztXmv2XkKYnPtkvwrVY66V1UWg
Date: Mon, 9 Jan 2023 09:43:40 +0000
Message-ID: <DM6PR11MB2649115E6777A625893C00F5D7FE9@DM6PR11MB2649.namprd11.prod.outlook.com>
References: <20230109013924.22185-1-karn.jye.lau@intel.com>
 <CANNYZj9faTYL2btddhF0A-WFHJAwKu0nqf07GJcGL+bXdsftUA@mail.gmail.com>
In-Reply-To: <CANNYZj9faTYL2btddhF0A-WFHJAwKu0nqf07GJcGL+bXdsftUA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2649:EE_|DM6PR11MB4723:EE_
x-ms-office365-filtering-correlation-id: fb9b1c3d-9f2f-4e6a-81a0-08daf225fd78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vLKrBC7UkHUPPwDly+SpwHjOmisJudgfN577NwLEDZs+geEfbbeYCY7WRHChMIMYLjPm7pUs8AfNjlq8u9EASYOn7YnPipAte6hfmqfXOYjpz4w0ft1NNyYmMSmXh55iClDXPlhDlD0Kydh7xC/OetVvJr5M1HJFiOHRxv2Fny+FQNMMEUfMMEkFQexk3pobJBXXbx9a/suypNHBEfQj8x+2jpnBIz7rlYAQgSXoO+u4fORV+nsaL2EVhvZv8plVoLVO65bZFr+g06e6Zgr8Spsq1DVo0zCe4TRRDNf8dYbnzryZ1GJNZjvZLsw/lOB3gV7eE1WMxv6xCbTdKm5lIcyI/iyvzeNy4tU+s4uNWAoAbumN3P8R+9D3GjV4q6oSusIbMFNVKLHfMbqSD4cIXiDkh8PfPgnwzMOKrLGbx5mxJzkiRF79r4KT0dZaxuIKSBXx48Q3JLNKDWTgHja217fONwRDQ8zODGYttrbNtSDa7MYetkA6HZ49kIitquCdCv8tDKktow8qwqJHlHsQE68uiC0JJNWrC+74gZY3lCMA0RiAklDg0G1eF+LJQkoxlbhHXie31FLsc9Xj/7HOm0sEV0UgwpdaePO/lJH7KB3MEE72/qYHflw8zD5vz+yzRIL4wHYg6E2X/eUGuFTHVdHHj2TjsrzE5eN+W2NvuifONvP+eOyLWdvVCe8pretb+/Ipfi+ZN29mykFuHDhC0j7PWgnDNOP6yi3WOY3EBtfNNtVIDixO1qBZktRGoTcrEDkrsswto7/rEW5AliOH2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2649.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(52536014)(41300700001)(66899015)(8936002)(5660300002)(2906002)(15650500001)(66946007)(8676002)(6916009)(66446008)(64756008)(66556008)(66476007)(76116006)(316002)(7696005)(71200400001)(33656002)(966005)(6506007)(478600001)(53546011)(9686003)(4326008)(186003)(55016003)(86362001)(83380400001)(38100700002)(82960400001)(38070700005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDJzL3VBZWVYMldGMmhrd1BBZ1J1V0xMT3RLcTJjMjlIRWFlZDcvSnFSQzVL?=
 =?utf-8?B?dkN0L3k0M0ZGQ3liM2p0U1dqWmRNTzdKclpPWEVjc1dSM1lwWVJWL01YaHly?=
 =?utf-8?B?VHgyNWp3ZmZwb1JPTW1wdVNqb1Y0VDhNMXNPV21xSkJvNkZwUHVoM2UwRmxU?=
 =?utf-8?B?WU1KUjlzSFlvVis1bzc1eG9nQWVUb0JhZVVNVFNEVUx4VVV3K0oxYlFLMldl?=
 =?utf-8?B?NE9xcDU4aW5RSXEzb1hqVlpsaFpWK1ZXOGgrYi9xa1pGWklDNGp4NG1LVXJH?=
 =?utf-8?B?RStmZjRkc0pFS1FhemtyVUZrM2FvUU51Z3l0eGtxZUVqTUUxb29nZU4yam9t?=
 =?utf-8?B?aXhMbzJDN0VpOVpGbDdDVUdDM3VYUGJPZmNINVpRcXVuZHdEOENsSFVSSy93?=
 =?utf-8?B?YTdDZFUyYmRZOWF6cFh4bjBsVUJFK2FPQmZwKzVSL3ZXUHFpZ1dLYlZZNEgx?=
 =?utf-8?B?cTRzeFRKc3padVpEcFBkbktYNlFjOUFXenY3YlNBZ0hCem92cklWd0dIMitP?=
 =?utf-8?B?YzJuNmJyeDExU1cxa2NVVHVIelVtbk5HbEJmVmsvamlCMEVYVklBZ21GaDQr?=
 =?utf-8?B?eGlLK2pKTkZrdHdTMHpRbDlnN3NZWDJwQ0ZkdXl0M3crRm1yY2lDcE5KbjZM?=
 =?utf-8?B?NUFMT1JkamtjdzFXOGtIWkFnY1lRWFN4SFRnUWNzZzJJcm1NdTNELzh6eCtl?=
 =?utf-8?B?QXdKNnpDOVMzMzBjL05sV2pvMTVoWWgrVW9lRUUxK1U0SVU0Wk9tOS95eGZk?=
 =?utf-8?B?V2RmaDZmR2Z6KytTTFMvcmlPTWNUalhLbDNIWll2QytVVlljbU41YWtiNnRR?=
 =?utf-8?B?bUVqYWtYMHdzemhqTXpEazBsMWxzSW9EMTNZTnRHbTMxWnNjMVV5QzR5RTJJ?=
 =?utf-8?B?OTNyRWVyamxNaVlYQnpVY25WNmVPVURlZFNjSHZUSktWd2xjL3N0bzU0blJp?=
 =?utf-8?B?Y1pIdHR5eDlPN0ZISUt5TTE0d0pncTJUZmt5WlVTODF3NHlzZEVMcG0zK2lt?=
 =?utf-8?B?RjFrVnphU3ZmL2taYzhWY0JKcnAybStiM2QrcElSVkhQeHIzbkdyeXZHOHFJ?=
 =?utf-8?B?L25yUCtKbVcvTXVISjNvRys1bVBqbi90RmJEME1rejdMK0U1eXZ4MThvd2Nw?=
 =?utf-8?B?b0J0T2ZPUkdtc2VpZkd0OGVjSm0rWkp1VzBpZXhBMnlSZ3RVQ0ZnNmd0VGdY?=
 =?utf-8?B?dEwzb210Sk91U3pwVzFBMzdKSmlHLzVVbU9nRmFvNENhNXU2cFcrbnVmV0JH?=
 =?utf-8?B?aTFzaDgwNTBjcGd4OEdndTJZTVdibFN3MGI1UTRwRE1QNUZ0eDRBM0ljTHlO?=
 =?utf-8?B?K1JKUElaTlY0ZzlMa3BBd1JqL1NPVkgvRUIwRzdlSjF5Q3dXMTdnQmhWeE9s?=
 =?utf-8?B?S1lhWlQ0eEcrNDFua3hScjZ2OVdwcmpUWCtMSWhIbHFmM2FuL28vdFdFMndG?=
 =?utf-8?B?THRZeDg4NW8yZlBCVEhNRXVaamUrTStISUVneUlBT2xTTXhPTUNVeHVLUmNx?=
 =?utf-8?B?L1k0WXkrQ1V5MlJxVGE4b0tzNjJKQjVCSVNLMU0ydWRLY285Qy9xeHlRS3Ba?=
 =?utf-8?B?VXJNSk8wd2FzRTBDZ2NPRnZkRXhNT3ZvRzN0OTVIem5pb3VoTVBUVjNoVjBM?=
 =?utf-8?B?MTdOU0YxbzIrZHF2M2gvL0Z5WkJMeVNMUHlkNEoxcVhiQmE3MjlUWXRZTzU2?=
 =?utf-8?B?VmtlSUpQaDFrNlJEUVJOaG5ac2hsd0tpSjhQZ3RoZ1hpRXlhdzJtUzFET0p3?=
 =?utf-8?B?Vm10bUZLNzhIMXhLbXdnSlZhZndoemFFSDNCaCtUVEJSc2RibjNxYTlnQm1Z?=
 =?utf-8?B?WWw3UEpna25UaDdsYStOQk5PV3J6U1hJWU9UQlp0Q1FBMFZKV2tEajV0K0NE?=
 =?utf-8?B?Q0FHaEp0bXVyVDVQblBUQzE2NXRuNHVyd2xmMTZpMkNQblI5L3hSa3p3ZUtY?=
 =?utf-8?B?RUNYeTFUVUp6ZCtUK1drU3ZOOWpXS1NMVEhqTit1dWVEaWZtdjgzbnkrNTNQ?=
 =?utf-8?B?Z2cxNUc4cCs4TFdtMWd0ZU40TUNlazJQc0VmNHZidkhVYmNhalF1ZzdId1NL?=
 =?utf-8?B?R1JGTk5Band2V2lBcDQreGxMWURwbVlxYmd0ZkdZalFKc2RaUEg0SEdZZjFE?=
 =?utf-8?B?ZktIRDU3em5odjZ4Wkd1S3loQXlYeTcrL2IwMUVzYW9zTmxsZVl4VFVUekFu?=
 =?utf-8?Q?9N5pDC/tSEQ1qqkKL2yItSiBus0TkG+VOT5A6mVTqQ6y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2649.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9b1c3d-9f2f-4e6a-81a0-08daf225fd78
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 09:43:40.6435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9Zex73+crJwofqJJ+ksf1pkk0nWJpWBo6N0Fehmq0OKSD5EDNy5A1NutHaYzQTcMvJ+U1fuf5sjvJLB8BYA6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 09:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175678

SGkgQWxleCxwbHMgaGF2ZSBhIGdsYW5jZSBvbiB0aGUgbG9nDQoNCmlsYWJ1c2VyQGtqbGF1LWlM
QlBHMTI6fi9vZV9jb3JlX3lvY3RvX2J1aWxkL2J1aWxkMi90bXAtZ2xpYmMvbG9nL2Nvb2tlci9x
ZW11eDg2LTY0JCBjYXQgMjAyMzAxMDkwMTEyMTUubG9nIHwgZ3JlcCBmcmVldHlwZQ0KTk9URTog
UnVubmluZyB0YXNrIDI1NSBvZiA2NjkgKC9ob21lL2lsYWJ1c2VyL29lX2NvcmVfeW9jdG9fYnVp
bGQvb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZyZWV0eXBlL2ZyZWV0
eXBlXzIuMTIuMS5iYjpkb19mZXRjaCkNCk5PVEU6IHJlY2lwZSBmcmVldHlwZS0yLjEyLjEtcjA6
IHRhc2sgZG9fZmV0Y2g6IFN0YXJ0ZWQNCldBUk5JTkc6IGZyZWV0eXBlLTIuMTIuMS1yMCBkb19m
ZXRjaDogRmFpbGVkIHRvIGZldGNoIFVSTCBodHRwczovL2Rvd25sb2FkLnNhdmFubmFoLm5vbmdu
dS5vcmcvcmVsZWFzZXMvZnJlZXR5cGUvZnJlZXR5cGUtMi4xMi4xLnRhci54eiwgYXR0ZW1wdGlu
ZyBNSVJST1JTIGlmIGF2YWlsYWJsZQ0KV0FSTklORzogZnJlZXR5cGUtMi4xMi4xLXIwIGRvX2Zl
dGNoOiBDaGVja3N1bSBtaXNtYXRjaCBmb3IgbG9jYWwgZmlsZSAvaG9tZS9pbGFidXNlci9vZV9j
b3JlX3lvY3RvX2J1aWxkL2J1aWxkMi9kb3dubG9hZHMvZnJlZXR5cGUtMi4xMi4xLnRhci54eg0K
V0FSTklORzogZnJlZXR5cGUtMi4xMi4xLXIwIGRvX2ZldGNoOiBSZW5hbWluZyAvaG9tZS9pbGFi
dXNlci9vZV9jb3JlX3lvY3RvX2J1aWxkL2J1aWxkMi9kb3dubG9hZHMvZnJlZXR5cGUtMi4xMi4x
LnRhci54eiB0byAvaG9tZS9pbGFidXNlci9vZV9jb3JlX3lvY3RvX2J1aWxkL2J1aWxkMi9kb3du
bG9hZHMvZnJlZXR5cGUtMi4xMi4xLnRhci54el9iYWQtY2hlY2tzdW1fZWQyNTMwY2JiY2M3MDBl
Y2ExZDdlNGIwZDBhMWZjZTY4MTYyMDVjNzBmNTg3YzhhMTI4MzdhMWY0ZTc0MTA0YQ0KRVJST1I6
IGZyZWV0eXBlLTIuMTIuMS1yMCBkb19mZXRjaDogQ2hlY2tzdW0gZmFpbHVyZSBmZXRjaGluZyBo
dHRwczovL2Rvd25sb2FkLnNhdmFubmFoLm5vbmdudS5vcmcvcmVsZWFzZXMvZnJlZXR5cGUvZnJl
ZXR5cGUtMi4xMi4xLnRhci54eg0KRVJST1I6IGZyZWV0eXBlLTIuMTIuMS1yMCBkb19mZXRjaDog
Qml0YmFrZSBGZXRjaGVyIEVycm9yOiBDaGVja3N1bUVycm9yKCdDaGVja3N1bSBtaXNtYXRjaCFc
bkZpbGU6IFwnL2hvbWUvaWxhYnVzZXIvb2VfY29yZV95b2N0b19idWlsZC9idWlsZDIvZG93bmxv
YWRzL2ZyZWV0eXBlLTIuMTIuMS50YXIueHpcJyBoYXMgc2hhMjU2IGNoZWNrc3VtIFwnZWQyNTMw
Y2JiY2M3MDBlY2ExZDdlNGIwZDBhMWZjZTY4MTYyMDVjNzBmNTg3YzhhMTI4MzdhMWY0ZTc0MTA0
YVwnIHdoZW4gXCc0NzY2ZjIwMTU3Y2M0Y2YwY2QyOTJmODBiZjkxN2Y5MmQxYzQzOWIyNDNhYzMw
MThkZWJmNmI5MTQwYzQxYTdmXCcgd2FzIGV4cGVjdGVkXG5JZiB0aGlzIGNoYW5nZSBpcyBleHBl
Y3RlZCAoZS5nLiB5b3UgaGF2ZSB1cGdyYWRlZCB0byBhIG5ldyB2ZXJzaW9uIHdpdGhvdXQgdXBk
YXRpbmcgdGhlIGNoZWNrc3VtcykgdGhlbiB5b3UgY2FuIHVzZSB0aGVzZSBsaW5lcyB3aXRoaW4g
dGhlIHJlY2lwZTpcblNSQ19VUklbc2hhMjU2c3VtXSA9ICJlZDI1MzBjYmJjYzcwMGVjYTFkN2U0
YjBkMGExZmNlNjgxNjIwNWM3MGY1ODdjOGExMjgzN2ExZjRlNzQxMDRhIlxuT3RoZXJ3aXNlIHlv
dSBzaG91bGQgcmV0cnkgdGhlIGRvd25sb2FkIGFuZC9vciBjaGVjayB3aXRoIHVwc3RyZWFtIHRv
IGRldGVybWluZSBpZiB0aGUgZmlsZSBoYXMgYmVjb21lIGNvcnJ1cHRlZCBvciBvdGhlcndpc2Ug
dW5leHBlY3RlZGx5IG1vZGlmaWVkLicsICdodHRwczovL2Rvd25sb2FkLnNhdmFubmFoLm5vbmdu
dS5vcmcvcmVsZWFzZXMvZnJlZXR5cGUvZnJlZXR5cGUtMi4xMi4xLnRhci54eicpDQpFUlJPUjog
TG9nZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjogL2hvbWUvaWxhYnVzZXIvb2VfY29yZV95b2N0
b19idWlsZC9idWlsZDIvdG1wLWdsaWJjL3dvcmsveDg2LTY0LXYzLW9lLWxpbnV4L2ZyZWV0eXBl
LzIuMTIuMS1yMC90ZW1wL2xvZy5kb19mZXRjaC4yOTMzDQpOT1RFOiByZWNpcGUgZnJlZXR5cGUt
Mi4xMi4xLXIwOiB0YXNrIGRvX2ZldGNoOiBGYWlsZWQNCkVSUk9SOiBUYXNrICgvaG9tZS9pbGFi
dXNlci9vZV9jb3JlX3lvY3RvX2J1aWxkL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9mcmVldHlwZS9mcmVldHlwZV8yLjEyLjEuYmI6ZG9fZmV0Y2gpIGZhaWxlZCB3aXRo
IGV4aXQgY29kZSAnMScNCg0KS0oNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IE1vbmRh
eSwgOSBKYW51YXJ5LCAyMDIzIDU6MzkgUE0NClRvOiBMYXUsIEthcm4gSnllIDxrYXJuLmp5ZS5s
YXVAaW50ZWwuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIGZyZWV0eXBlOnVwZGF0ZSBtaXJyb3Ig
c2l0ZSBmb3IgcGFja2FnZSBkb3dubG9hZC4NCg0KQ2FuIHlvdSBzaG93IHRoZSBwYWNrYWdlIGZl
dGNoaW5nIGlzc3VlcyB5b3UgYXJlIGhhdmluZyBwbGVhc2U/DQpGcmVldHlwZSBpcyBzdGlsbCB3
aGVyZSBpdCB3YXMsIGFzIGZhciBhcyBJIHNlZToNCg0KaHR0cHM6Ly9kb3dubG9hZC5zYXZhbm5h
aC5ub25nbnUub3JnL3JlbGVhc2VzL2ZyZWV0eXBlLw0KDQpBbGV4DQoNCk9uIE1vbiwgOSBKYW4g
MjAyMyBhdCAwMjo0MCwgPGthcm4uanllLmxhdUBpbnRlbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9t
OiBLQVJOIEpZRSBMQVUgPGthcm4uanllLmxhdUBpbnRlbC5jb20+DQo+DQo+IHVwZGF0ZSBTQVZB
Tk5BSF9OT05HTlVfTUlSUk9SIHRvIFNBVkFOTkFIX0dOVV9NSVJST1IgdG8gcmVzb2x2ZSANCj4g
cGFja2FnZSBmZXRjaGluZyBpc3N1ZXMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEtBUk4gSllFIExB
VSA8a2Fybi5qeWUubGF1QGludGVsLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvZnJlZXR5cGUvZnJlZXR5cGVfMi4xMi4xLmJiIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvZnJlZXR5cGUvZnJlZXR5cGVfMi4xMi4xLmJiIA0KPiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9mcmVldHlwZS9mcmVldHlwZV8yLjEyLjEuYmINCj4gaW5kZXggNDZjNjE4
MjYzMC4uNWU3ZjkxNmUyMSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2Zy
ZWV0eXBlL2ZyZWV0eXBlXzIuMTIuMS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
ZnJlZXR5cGUvZnJlZXR5cGVfMi4xMi4xLmJiDQo+IEBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuVFhUO21kNT1hNTkyNzc4NGQ4MjNkNDQzYzZjYWU1
NTcwMWQwMTU1MyBcDQo+ICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9kb2NzL0ZUTC5UWFQ7
bWQ1PTlmMzdiNGU2YWZhM2ZlZjlkYmE4OTMyYjE2YmQzZjk3IFwNCj4gICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL2RvY3MvR1BMdjIuVFhUO21kNT04ZWYzODA0NzZmNjQyYzIwZWJmNDBmZWNi
MGFkZDJlYyINCj4NCj4gLVNSQ19VUkkgPSAiJHtTQVZBTk5BSF9OT05HTlVfTUlSUk9SfS8ke0JQ
Tn0vJHtCUH0udGFyLnh6Ig0KPiArU1JDX1VSSSA9ICIke1NBVkFOTkFIX0dOVV9NSVJST1J9LyR7
QlBOfS8ke0JQfS50YXIueHoiDQo+ICBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDc2NmYyMDE1N2Nj
NGNmMGNkMjkyZjgwYmY5MTdmOTJkMWM0MzliMjQzYWMzMDE4ZGViZjZiOTE0MGM0MWE3ZiINCj4N
Cj4gIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImZyZWV0eXBlLSg/UDxwdmVyPlxkKyhcLlxkKykr
KSINCj4gLS0NCj4gMi4xNy4xDQo+DQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3
L1JlcGx5IE9ubGluZSAoIzE3NTY1Nyk6IA0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3NTY1Nw0KPiBNdXRlIFRoaXMgVG9waWM6
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85NjE0NDA2My8xNjg2NDg5DQo+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS91bnN1YiANCj4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+DQo=

