Return-Path: <alistair.francis@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7BFD2502E
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 01:06:59 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22772.1768180012942548791
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 17:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=V/NCE7cq;
 dkim=pass header.i=@sharedspace.onmicrosoft.com header.s=selector2-sharedspace-onmicrosoft-com header.b=sRm5yR4a;
 spf=pass (domain: wdc.com, ip: 216.71.154.45, mailfrom: prvs=465c3c755=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1768180012; x=1799716012;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DHh9u/4UrJIDqwSn2/FPQD+/v2xN/Qrecoi1vfOlxt8=;
  b=V/NCE7cqVaQDtUtLWTGIIW9j2IeBFMNn05SScyyd9IOiBKF0GQaj+h3a
   Vvw8kPgHenTbqj5UU4bUYbjpPxMPMaXa3CA8ZP94EK1iaC/S0P4rIQB+Y
   WHTnm5sbxY1HB1UVmi1ZQOhxWbeSn30DMiUO1w1nOP+/jkVwAmenKFoUn
   rH1VggzOgjxFdpo29WnbwQXJuQMJJduafyYAMhG5smtN5U7SP2lC9fLVG
   urs6bMu0U2RJfyUXIXhLBw/fQoOr8n8f5tXvmvxNjMVxtl98q3QGIj8mw
   eq3+KCrS/Hu2k6KrIwpt4GHv9kxasGj2ZcC3g1u1ZlDX22qG7pRqiKlK1
   Q==;
X-CSE-ConnectionGUID: uGbbEdfLQB+IHhMI4jyj5A==
X-CSE-MsgGUID: pDz5MaVTRiWvo/JW0ZwAWg==
X-IronPort-AV: E=Sophos;i="6.21,219,1763395200"; 
   d="scan'208";a="137890824"
Received: from mail-westus2azon11012017.outbound.protection.outlook.com (HELO MW6PR02CU001.outbound.protection.outlook.com) ([52.101.48.17])
  by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jan 2026 09:06:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfGYQ5tuveqoPZ9mMdRsWz4p4RDu3vyR7PfbHvEgAJRCDH8toaDxLOhbGEIOZpDFJqI3djrmbqG85wfhAtSHRYR8glSbMMjdOfP3JrvUuwjdXxpXxiCeu6DyxzUVX2KEHYeAGvSnCq0kl/6/yQ2ir18oMuAikv/2g3DJRPfSwHArOAYmxfXDLgP/NO4yxRrgmadJ+pcEQa9T+eFpyGcWrkCtnrGvWH32fdCPb1HJGOiLSCndT9OgjeD/ysPOGwI+xyD194mqcV0mQzFGpJbE3F7TeGKVHOFSbpsE5e6oRCrRLWx91Kg6jtEyWQBTYhDsPoGdFyxHIfmImNb5YNVzpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHh9u/4UrJIDqwSn2/FPQD+/v2xN/Qrecoi1vfOlxt8=;
 b=C7N/C/IaieY4t74WB9IxlywfW1plLyIekHCyz9t/hat5CIB34HNDOAXBEuPvyGfy+QueqEU8I0eDkolwrD41XtO3B1b89XYE5Lzn8SC5CCipEEqCEDHmzhNy8tLhPLk/t7mp8CBPLw+BRMsiv+r/YJ4ysVoQKUEIUUNeWtaigHGM5y4jVzvz3CvrM1cKZSmc1mtweAbVz8f9r7hKAQ3FQwxn/l6ndv+79wLxcrFhTKnst9UnuDp2FWn5f1qFjVfUBCkZ+lWk8Vr85YUM4IUL7enePZk9PGK7njUVZT9l4HsBK/fl1T62A/wogknW+N8FFU7yVpcFlvXuatWaQf97Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHh9u/4UrJIDqwSn2/FPQD+/v2xN/Qrecoi1vfOlxt8=;
 b=sRm5yR4a853gSOPlJT6t+yno0Bezw8IzBZegy8+JpOQqlJv8QvDZHFMrK8JgJxafdSYhQvcNLL9IIHtR4OAlgk8S9mk/hp7hrYNJaoPM4KXXI7CxGg11zVT+hzhKM/d3qA0BIw6Ax12DOWduHyeR25mG8F99T8XCixoaswt9wnk=
Received: from SA1PR04MB9849.namprd04.prod.outlook.com (2603:10b6:806:4a3::15)
 by SJ0PR04MB7663.namprd04.prod.outlook.com (2603:10b6:a03:324::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 01:06:50 +0000
Received: from SA1PR04MB9849.namprd04.prod.outlook.com
 ([fe80::6d33:c5b6:16f1:29d6]) by SA1PR04MB9849.namprd04.prod.outlook.com
 ([fe80::6d33:c5b6:16f1:29d6%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 01:06:50 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] cml1.bbclass: Support the rustavailable task
Thread-Topic: [OE-Core][PATCH 2/2] cml1.bbclass: Support the rustavailable
 task
Thread-Index: AQHcgSQgvHRc1FLiI0KXYWzykGc027VJ3hSIgAPfGIA=
Date: Mon, 12 Jan 2026 01:06:50 +0000
Message-ID: <898f1dc767a3d74109bdd4f19eaeeed85a16f077.camel@wdc.com>
References: <20260109045447.1933604-1-alistair.francis@wdc.com>
	 <20260109045447.1933604-2-alistair.francis@wdc.com>
	 <188914A07F2508FF.2783356@lists.openembedded.org>
	 <CADkTA4PdDMLu4Jhi01qKQoYTfqGWpi33i0uXEgUWfXRG_-+ssQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PdDMLu4Jhi01qKQoYTfqGWpi33i0uXEgUWfXRG_-+ssQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.2 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR04MB9849:EE_|SJ0PR04MB7663:EE_
x-ms-office365-filtering-correlation-id: e57021f1-035e-4ef0-c7ce-08de5176ddfa
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|19092799006|10070799003|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RG9INnpZenZTaUVSUVpvTGFFS2RrUko2SGRCVXYxNSsxYzNzUXorNzZOWjhG?=
 =?utf-8?B?NG9sQ1V4WTJaVzBPR3RlZDlSTnVkTmJ2M1Jhcy9HQ1lkM2V0T0FXVXp5Wm04?=
 =?utf-8?B?SWI1eVR1R1pjMTNhYXdrbVNSd2VYZURRT2tZcno2bjJnaEwwaUlxZEl6aGhi?=
 =?utf-8?B?V2V3U1BkV0RxZFd2Z1JiWUVXTEh2M1JZK2Y0VVZ3bEpCd2NGWVBWNDVHZ3Zh?=
 =?utf-8?B?VDFoUExCWjZMZmNCZnAvOFBwTFF2SkJWelRoV1B3Z1Z5MWpuSmtJMWdOcGRz?=
 =?utf-8?B?WHprcEFzdGVRMytKdjFrc2lwcm14bWc1WEJhVGloZGVXZ1l2Ui9oVUdEY1Ex?=
 =?utf-8?B?NlBGb240Q0Zabk1SRXJhbHJqOUdsc0RVamdJWlYvV2ZzWWsrWTJCNnhBQS9K?=
 =?utf-8?B?b3YxV1NFTmg5ZDhnS0QySTZIUEYyM2pyZWVOU2hiK0RlQVdST0dSNG40cWFD?=
 =?utf-8?B?elVwNjRRYmtxbFkxdlhndkZjT2dyUlV0SEVFWWxpYmg5RnBzZUllaE83UVJ3?=
 =?utf-8?B?UnBQaDVQb3IzYXR1anFjc0dpVlBUcEJsQlc1UGg2bkY4bDkxWU9JbTBGejE0?=
 =?utf-8?B?NWNHSnlRdUJiNG1YSFQ3RUJ3UzJ6TkxLNktvbEdPbC9RRUV6ck5qWVN5RC9q?=
 =?utf-8?B?MnFzMVB4SlBIM1VJdElnVFhIWktEeGJZVERDa1NXcSs5dHZOUGJZQ0NKUGZj?=
 =?utf-8?B?N0VCT0puN1JNdVhFOVVmOUdqMHd2b1ZBT1V1a1Bkbk1tR3VlcGdiRzJwR1Z3?=
 =?utf-8?B?TXFWdTJibVBwYm5jMVJJRTBFME8zN3NRK2VrL3c3VTJDaXU0NXpRcHRDazhh?=
 =?utf-8?B?U2xXVktiWWdjYWZaT0RJbSs5UndkR0pKdmFuRUtpMGdXM3dteDUrZFppSkQ3?=
 =?utf-8?B?UmdndjQ0WlhxWklxVzNHUm9mS2xVZVFuTDFCOFc5dllmanJOam8zT014N0Ir?=
 =?utf-8?B?VWRscW1qVkxiZW9id1Zia0xyOVVvWnFmKzI3TVg1RmRrdXJJc0dBaVhLR1Ir?=
 =?utf-8?B?d2l0Q3RYYTgxei9SV01GYkJRTHp5aVNXOGt4MDRJcDRBWk5BRVpERVY5eGJi?=
 =?utf-8?B?TlN4N1pkaHV4UUdFRStuUjlBaXJad21qTGpJSlpGcWtsMEFzNDkrWlhyU2tN?=
 =?utf-8?B?SEdlNEZVMmcyVE14ekFjZ3dscSt6bEIzUldpSUlYazJTUlhFNmJBd3IzQnRx?=
 =?utf-8?B?TktScy83VzU5aVdwdnpJVDBxWEU1ME5yUXJmQzhsaWtjMDZlelFCc2ZOdGl5?=
 =?utf-8?B?RDVFMThJczFmaVlaRk53c0F3L1RxRW9KMXgvRVNtTmNlTGZwVVpJNU1UWVlC?=
 =?utf-8?B?U1RaWitsWFhsZ1REOTl6QzUzVUVYdVQ0ZUloc2o2YWl2Y2dsb0pGcEpzc0Zw?=
 =?utf-8?B?cVM2dVpyMzF0ckJyOWZsdGRIYnVobkMrZnhGbnlXZk1MVGlEZExsa25hcTNz?=
 =?utf-8?B?QThWM0dCc0F0V2VDcjB0WUo5NUw5S0RQbEt1cTQ5SEt5aUExenpvUW5pMndO?=
 =?utf-8?B?b3J0L0JFTzF2aFhKNy9LZHgxc1k4TGxDOXlSMm8zK1QwVU9ScHlEcVludS9a?=
 =?utf-8?B?RDBUdlBQbkxiR3poZnpsUiszMkJLdnErTytLOHVjOXpLN3JFZ3hVTWpRd0Jh?=
 =?utf-8?B?V2pEcVdFZURjdlJTS3VKRzR5SitzcXRVazVOVzh6b1BmVFV4WnpSTzBMcExQ?=
 =?utf-8?B?S3BYSkR5dEt3UlIybUJha0dkSWR2UFBMWnZVMjBKZVZObnpsRWV3R2sxOGZw?=
 =?utf-8?B?cFh4bVJNdDQwekJqZlpQTE1SMStWaUdVWnp1YzZrSklLRzhYZkh2SXZHZUQ2?=
 =?utf-8?B?MzNKMCtqTDc2VUk5UE5KRXBMOEtnM2VkUWMyQUd2N3lTUjZ6V29Zd0s4cDht?=
 =?utf-8?B?aHd2TXZOaDFUOWU2c0l3Q1JJNjVsVDZDMjlkam1VeU9EYzV6bjFXRzBTZlRD?=
 =?utf-8?B?SXRNVGVUKzZwd3Fjc1hCZkQ4OURDQ2dHT1A5eFNIb3J3U3dmZFk1WFdzQjlV?=
 =?utf-8?B?UmNsVndlaEdNY0k4UmVqWmVwQk1pOXpwQUZXZ3U1eEhSSTFOVy91dzFmS25p?=
 =?utf-8?Q?NF5wg8?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR04MB9849.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(10070799003)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z0NiSDRQUDE2T2NPUWRhQVp6bUxSSW5yaEZURkJuV3hESW9kMnk1MHBwVllk?=
 =?utf-8?B?WHd6eCs2cytvMEJSSWFmc0N4RG5xdDN3REh0TGZSSkd3TUNzcGJSckFudHQ0?=
 =?utf-8?B?UFRJckxucFhoYmI0U256dDAzSDdYaVowRENuSy90Q3k5Ync1MGgwWUFUNVJZ?=
 =?utf-8?B?S2c5VkRlQ2h1TFBadWYrTjV4VzZGckdQM1l3eW9icDdjZUxqc3lBd2dsSzQx?=
 =?utf-8?B?d0FyWkozZ0dFellHdWtxYUFIUWVCNm5nMHBGM3g2N01uRFNDcTFGd2RSeWQ2?=
 =?utf-8?B?b05FQUF2RTVSdmpCaXNGVjNZY2Z5ZVRyWUMzV2syaG9MZnUyTGdSR0pHa0o4?=
 =?utf-8?B?WFZQWXl0UTF4QnFLWG81NlZ3RmNyK01kdkd6ak1NY3ZySmpValFWdys2eE96?=
 =?utf-8?B?SEQxdG5KdU9LZzBqUmtlYVZaNHd5S2FpUDcwaHFhL0dPS25pT0lQNXh2bEtr?=
 =?utf-8?B?czlVdTdwR2lxZlBJUUF3SU1QeE1xd2I5azNlVEI1MFN0a2lXR3ZWWHkxRGpr?=
 =?utf-8?B?bGZHTm44WndjOG5nOXI1M3c2L0hsd25IVzUya2VvekxrL29ITUN5NzJ0WUdx?=
 =?utf-8?B?VWZicnZIWDJmSk1OVzZEZVFBZVh1Skk2MnBwcVNMcXM3bGpJUlpGTStpQm1a?=
 =?utf-8?B?eTdnaXBWQ3k5c3BJU0hIS0gvYkI3RlNGQzJPUG1sckFaYnNrNzZGT2RKUzBC?=
 =?utf-8?B?aDFNN2orT1ZRcFJIbUxKK2JmNGFhcExOSis5Uy9LTEhmVzlFdFI1V3BQa0dJ?=
 =?utf-8?B?ZDB0VnZmU2tJNlV3cDBlWFhqcFM5L25xT2hta2UvTjRZQ1JQKzliblNzS2Vk?=
 =?utf-8?B?MS9pL3pTTHo2bVQxY1p4RWdRVWYwYWVTZExpQWRBVjJhMjFqSWZnbk5CaW5J?=
 =?utf-8?B?b05HUmxLQVVTa1UyRFEyTGZaUjZYZnJDSmM2L3dGVi9xZ29RUTQxYTNoVWMr?=
 =?utf-8?B?OTNmazBnQVY4OFl5N1gxSWFoRWZSQ2VMdTR0VHBlUE9PWVY5SU54dHJONXJ5?=
 =?utf-8?B?SzJmNVNjZHdhc2ZCNHA0TFRQUkNKZUUwdzFDNWo1MENlMVJYd0ZmWmkxeXZQ?=
 =?utf-8?B?OTdkY3lPVzIvOFI5WTFLWWIzZW5NT2JyTjBHakFaWXhEQXNLVFhrbnZtQnNM?=
 =?utf-8?B?Y1ROT3lNZml0N2ZFTHJrSWt2REFEUHg2azFsOUNRRk1Wd2o4NURrUGx5NGx4?=
 =?utf-8?B?bm1IRVVhU3dTUXF3Qy9WWWVMMTZrTjNyam9zYTZudytMQUVPQnhYOURoVDlm?=
 =?utf-8?B?VnJ1MXViemZneGR1cFIvUjNPZUx1ZDhpNVZXaktzQUR3QnpGWU5oNlF2S2x1?=
 =?utf-8?B?TTBiNXRucWFrSWttWDFEVFpUYWsrMnhkQnNUaWhqV0UvUGZwQWE3cy8vV0JX?=
 =?utf-8?B?TWFUNkhKWCswRkhML0NyWUpucTdocTJUTkZETTd1ZGl6ckFidEhBOGNudzk3?=
 =?utf-8?B?dVJKd0puRXNDREt3N0hxYkRLY1czTzcrZlp5dUdSWXBWc2tydjdMY09BTXRp?=
 =?utf-8?B?SytESk9sOHlFNklEc0xRYUFPL2M4WWdDQlVkN09aSnBYcERyYlgyUlhGSUkx?=
 =?utf-8?B?cDN3UmZscmJVcVJ5QUNzNlhJcnhxdDFpK284TDZod3BHUlZsZTNBcDY4cGJQ?=
 =?utf-8?B?ZHJKMUFHaFgyaHB3MlZnUHFOdVY2cjIrK1VRTkpNbnc1empLM3F0dGk4aFpr?=
 =?utf-8?B?Nm55UTN6M3pHTmNKVE9pV01WWGlsT3RUbE9YeC9rL3BsbWtHLzJ1K1czbG94?=
 =?utf-8?B?UjRIdkF3dnhDTEZwdVVkdzBVZnVwRW9ESHJQWm1TZ0Q0VTdiTHBHNjJTcUVF?=
 =?utf-8?B?NVhHSEVyVldGT1pscWhTc0l5b2pReC8xdHRUSVg4YzIxNGcvUFZjNXRQemRL?=
 =?utf-8?B?aXIrR0M1alg3akZLcjdkRGtWUVBsQXFFb2lhVkE4ekdQb0VFazR2ZUV3M3Nu?=
 =?utf-8?B?ZXhLdVRWaWpPQ0JiTkh1c2lUbk9mN1R4bHBvSVJSeVNOQTU5Mit0ejZIYjNw?=
 =?utf-8?B?YUY4RXV1eTdNM2NzK0ROZW5Ec3NJK05KNGIvUTBIQjR4Uy9rWFpKMVFxdDNy?=
 =?utf-8?B?Wm53TkYvZXFnV3hkSDNaL1lYNE1ibWRiQ1NvV3VvVnkzK01ueDIvbmc0Qm13?=
 =?utf-8?B?bHppQlhBZ0JaYkkvUmt2VTZXMXY3QW5hMTYxaEVmaUZRWjQvdmJjNDNqbVc5?=
 =?utf-8?B?b3pld2hzNzdNMkt1SzFlVmNSb2FnZTVhcUptQXlJN2VEaElSaFlxczhUSHJi?=
 =?utf-8?B?SC9TRWFwUksrWlgrVlI5NHl5dThXNVg3QlE4TkY1cDRSNUFROWUzbThSQ2NC?=
 =?utf-8?B?QmxqY3dwN29jVUx2bEVjVXp3WDdMczR4R2o0ak1saTVicE9hWWJPcFc5dldp?=
 =?utf-8?Q?4zkUhoQSWiDHmsciA+u6XY/iQDDcZtpoFwyWZf/S0QN8g?=
x-ms-exchange-antispam-messagedata-1: RmYWbDI1YPabiuLaaEqgHDN7wYIgFYGrUU0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CBA2191935442449AA9EF55F2BD287F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iJ5FktEkvGQ4jEVbs9Env8tKA2Ha23iVoEmUJeR3ERIu38g1kkUp1ENL9n1lCCgZCMc3vOMrHL1HaeVYeOIRgxx2NiSPB2xwjPDVKmEgEEGJa3ljxgWLMBCAwT7wDCUfKbuGhaEo8PrAXe4tmJVbka48ww0SqFPTg7zglk131V5s0Dpee81Z1QcDbEn5ewD3aZzta/J+EejS7e86kfA5sUs32reml6cNG3l4FwCKp1J0Nv5alTIxBYsOaUlVW/b3WrRdndTPX07tOst5YIhv2gfHIuYimjszSxcllqeRK7qynATSsSW08Haub/UC5ZD1HY6ksmge0/NBi7i30+B2ncm42W/+wKWs4VcWlHxB5gOXmjBiNaHB4tf94q4zJvoQs3MxU4DM+0Fvvkk/7ig0ioBsG1yBtY8DygBRnGmfA+wJ3+6SzZrGIh2oPRGK1wYTxYqR9FmK3nVQdyX/Onnk3vcj8fmWI0Qscb7+CV7tc13U9bS2aynCO9aZucqMLs3rLRWYGiCFGJ+1v6JOJDMr2+ZC9yzHgdKn6LJawFrKI3frDhga2j0ghkUVmVYeS15VJjTZD4THYGWjpPNV73yR3vfoHR6VSoL0OCjqexvrlj/S86moVPPxGrk090foL6yO
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR04MB9849.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57021f1-035e-4ef0-c7ce-08de5176ddfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 01:06:50.5017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFx0VedTZ/UMilyOmfPGAPOJ5TpkTDoU1na235PvCmV8YFZzOM72W/4HQVIRYCqRMrk/S+TlV2+vQNYW+WISDfYyoJ97fG7DrxAfqxQtoYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7663
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 01:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229182

T24gRnJpLCAyMDI2LTAxLTA5IGF0IDA4OjU5IC0wNTAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToN
Cj4gDQo+IA0KPiBPbiBGcmksIEphbiA5LCAyMDI2IGF0IDg6NTbigK9BTSBCcnVjZSBBc2hmaWVs
ZCB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8YnJ1Y2UuYXNoZmllbGQ9Z21haWwu
Y29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IE9uIFRo
dSwgSmFuIDgsIDIwMjYgYXQgMTE6NTXigK9QTSBBbGlzdGFpciBGcmFuY2lzIHZpYQ0KPiA+IGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA8YWxpc3RhaXIyMz1nbWFpbC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gPiBGcm9tOiBBbGlzdGFpciBGcmFuY2lzIDxhbGlz
dGFpci5mcmFuY2lzQHdkYy5jb20+DQo+ID4gPiANCj4gPiA+IEFsbG93IHRoZSB1c2VyIHRvIHJ1
biB0aGUgcnVzdGF2YWlsYWJsZSBrZXJuZWwgbWFrZSBjb21tYW5kIHRvDQo+ID4gPiBkZXRlcm1p
bmUNCj4gPiA+IGlmIFJ1c3QgaXMgYXZhbGlhYmxlIGZvciBrZXJuZWwgYnVpbGRzLg0KPiA+ID4g
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lz
QHdkYy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgbWV0YS9jbGFzc2VzLXJlY2lwZS9jbWwxLmJi
Y2xhc3MgfCA5ICsrKysrKysrKw0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL2NtbDEu
YmJjbGFzcyBiL21ldGEvY2xhc3Nlcy0NCj4gPiA+IHJlY2lwZS9jbWwxLmJiY2xhc3MNCj4gPiA+
IGluZGV4IDNjMmI0ZGE0YWYuLmVmYmRkMmE3OTUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9tZXRhL2Ns
YXNzZXMtcmVjaXBlL2NtbDEuYmJjbGFzcw0KPiA+ID4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lw
ZS9jbWwxLmJiY2xhc3MNCj4gPiA+IEBAIC0xMDcsNiArMTA3LDE1IEBAIGRvX2RpZmZjb25maWdb
bm9zdGFtcF0gPSAiMSINCj4gPiA+IMKgZG9fZGlmZmNvbmZpZ1tkaXJzXSA9ICIke0tDT05GSUdf
Q09ORklHX1JPT1RESVJ9Ig0KPiA+ID4gwqBhZGR0YXNrIGRpZmZjb25maWcNCj4gPiA+IA0KPiA+
ID4gK3B5dGhvbiBkb19ydXN0YXZhaWxhYmxlKCkgew0KPiA+ID4gK8KgIMKgIG9lX3Rlcm1pbmFs
KCJzaCAtYyAnbWFrZSBydXN0YXZhaWxhYmxlOyBpZiBbICQ/IC1uZSAwIF07DQo+ID4gPiB0aGVu
IGVjaG8gXCJDb21tYW5kIGZhaWxlZC5cIjsgZmk7IHByaW50ZiBcIlByZXNzIGFueSBrZXkgdG8N
Cj4gPiA+IGNvbnRpbnVlLi4uIFwiOyByZWFkIHI7JyIsDQo+ID4gPiArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgZC5nZXRWYXIoJ1BOJykgKyAnIENvbmZpZ3VyYXRpb24nLCBkKQ0KPiA+ID4gK30N
Cj4gPiA+IA0KPiA+IA0KPiA+IA0KPiA+IFRoaXMgc2VlbXMgYSBiaXQgaGVhdnkgdG8ganVzdCBk
ZXRlcm1pbmUgaWYgcnVzdCBpcyBhdmFpbGFibGUuDQo+ID4gU2luY2UgdGhlDQo+ID4gdGFzayBp
cyBhbHJlYWR5IGFmdGVyIGRvX2NvbmZpZ3VyZSAuLiB3aHkgbm90IGp1c3QgY2hlY2sgdGhlDQo+
ID4gLmNvbmZpZyA/DQoNClRoZSAuY29uZmlnIGp1c3QgdGVsbHMgeW91IGlmIGl0IGlzL2lzbid0
IGF2YWlsYWJsZS4gVGhlIHNjcmlwdCB0ZWxscw0KeW91IHdoeSBpdCBpc24ndCBhdmFpbGFibGUs
IHdoaWNoIGNhbiBiZSBoZWxwZnVsLg0KDQo+ID4gDQo+ID4gDQo+IA0KPiANCj4gYW5kIG9mIGNv
dXJzZSwgSSByZW1lbWJlciB0aGlzIHJpZ2h0IGFmdGVyIGhpdHRpbmcgc2VuZC4NCj4gDQo+IFRo
aXMgY2xhc3MgaXMgdXNlZCBmb3IgbW9yZSB0aGFuIGp1c3QgdGhlIGtlcm5lbCwgc28gYW55dGhp
bmcNCj4gZG9uZSBuZWVkcyB0byBiZSBzYWZlIGZvciBvdGhlciBub24ta2VybmVsIHVzZWNhc2Vz
Lg0KDQpBaCBvay4gSSdsbCBkcm9wIHRoaXMgdGhlbiBhcyBpdCBpc24ndCB0aGF0IGltcG9ydGFu
dCBhbmQgaXQncyB2ZXJ5DQprZXJuZWwgc3BlY2lmaWMuDQoNCkFsaXN0YWlyDQoNCj4gDQo+IEJy
dWNlDQo+IA0KPiDCoA0KPiA+IEJydWNlDQo+ID4gDQo+ID4gwqANCj4gPiA+ICsNCj4gPiA+ICtk
b19ydXN0YXZhaWxhYmxlW25vc3RhbXBdID0gIjEiDQo+ID4gPiArZG9fcnVzdGF2YWlsYWJsZVtk
aXJzXSA9ICIke0tDT05GSUdfQ09ORklHX1JPT1RESVJ9Ig0KPiA+ID4gK2FkZHRhc2sgcnVzdGF2
YWlsYWJsZSBhZnRlciBkb19jb25maWd1cmUNCj4gPiA+ICsNCj4gPiA+IMKgZG9fc2hvd2NvbmZp
ZygpIHsNCj4gPiA+IMKgIMKgIMKgYmJwbGFpbiAiQ29uZmlnIGZpbGUgd3JpdHRlbiB0bw0KPiA+
ID4gJHtLQ09ORklHX0NPTkZJR19ST09URElSfS8uY29uZmlnIg0KPiA+ID4gwqB9DQo=

