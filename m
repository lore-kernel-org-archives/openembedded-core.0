Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA28C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 15:06:53 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.45])
 by mx.groups.io with SMTP id smtpd.web11.54327.1748358412348307812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 08:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=MzC+4I9l;
 spf=pass (domain: ericsson.com, ip: 40.107.159.45, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XC5TvHafp2qCLTbIODNtdFSFS5ggc80UOmkfS4Y0TbmHnOTtCBjnWGzPXkwbP8+ODLh7L7sD0ksrcdu++Wi/mcW+ye+aQfbBAyitV1Txp/yqejSQtN0F6YTLKk8RLmLousHOBl8KMl+9izv2Zn55qt8TpQAUd1LyjQfmhLdROfskdOK35EBRjC/ts1YpmedAi7ZF6OmFaO3g8LvNNevB43y5c/ZfFyI/buITqLhlRyaJfGnvpTxdN97uqYH0DDdfKyumDIJBJ8w/g7gsMbGuDFFnEi7R21mLkpmVNq6H+cxBJBpBDK3lNak12gGcTfFLDY9QYf2oY37J5Cd5Mvy2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9WYoXMnG4ro3zx+qsISaVdGWb2bidXqM8LwDFdekZc=;
 b=ckQ+e4xZFmUPHIsVMl9sNJX1QmmL70B9AiSyVlfVkXNktLrhRECJhjTzUjEpRT8QHvQJuODkQdlzHma8pn7h8gbZm27eZxXr6wblQWlZd0EY81e/ia1sVkNBPJxwnnrQRYqsmbM940kA3mwm/R4Ee2rwI75TRvbYavnvwM7HGYOHyf1ODFrpyCpxTpd29pv4sayojqRr21URJ4GVyDrtcMcsXxQ/lXsD4nZpkrB83G5mPL0CHNcLkn2i0EhX5PSzhr0Mh8PBa0XTbWHjsmXnww9bjuTE2U4XrQPJUn5II9/r2nB2V3/oIgOsFUwRcDX77s0OH7YUXs1/uFHEuqLU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9WYoXMnG4ro3zx+qsISaVdGWb2bidXqM8LwDFdekZc=;
 b=MzC+4I9lrA45fQJNSb5txv2isM20zeGx6nxVqx6+BCcooJVvMcqYdijoAYrVjijMi0JX2OjOCbrBRkdgB9dpXt9WsWYL4hDjgb9u5yCi6M5qaSACz0RAFkdOlIa7ZoVM0WDC97dAg2vIBoTtKqqFwuM9M3KaNsh93f9APqZiw89KUPjiFR2LN46AIhApIr+CSpI3addFVKH4T6sUCuVQneo6yKzqyjan7PCR1hyt4IndnTfkl6lOH6L3FcTLl/mFuRV96xUhERK0MpxrqjF2riNyIcOWgnxkDHyAky18nuHQdaR8dkcreIWLXQ6ww6+XLnSiUi0CI+2H5Qy0SMtUiA==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by DB9PR07MB7753.eurprd07.prod.outlook.com (2603:10a6:10:26e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 27 May
 2025 15:06:48 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%7]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 15:06:47 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v5 1/3] package: change location of debugsources
 to PKGDESTWORK
Thread-Topic: [OE-core] [PATCH v5 1/3] package: change location of
 debugsources to PKGDESTWORK
Thread-Index: AQHbylZ5dKmHMz1yjEOK/qFe8UmNXLPmfNsAgAAdI5A=
Date: Tue, 27 May 2025 15:06:46 +0000
Message-ID: 
 <PR3PR07MB66667C5C1EDCC3A2C2C777758A64A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250521134400.1733473-1-daniel.turull@ericsson.com>
	 <20250521134400.1733473-2-daniel.turull@ericsson.com>
 <5b20d775f1e183305d21e1daee8338311e9cb141.camel@linuxfoundation.org>
In-Reply-To: 
 <5b20d775f1e183305d21e1daee8338311e9cb141.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|DB9PR07MB7753:EE_
x-ms-office365-filtering-correlation-id: fa155ec9-0ab1-4698-344e-08dd9d30199e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bURxRitKOWV6UlM2S0lkcGZ3K1VBcTBDc2tpZjdTQmQ0OC9McUdjUUJFcDVO?=
 =?utf-8?B?NHY5UmVydHVHckVBS2d3N0xDTE1hcXJYSENVaFQrYmJEREdzT0xYektXb1dk?=
 =?utf-8?B?a01YSHQvWjRSSTBBYjR1cGoyOHBDb2FCNTZkUDVqRFpVWDlycWRONjE0U1dp?=
 =?utf-8?B?dmxqMzJLbGIrcHM5aUJqZ3RNQ3MyU1FlelZMYWk3aU5vSk0zUVhCNVBZUGdE?=
 =?utf-8?B?OFlTV3ZTMENXckxXbWg0Zml1Z2RPc3g4OTdMQ2ZJZDA2QTFCLzFRTkl3dEtw?=
 =?utf-8?B?RWhGdlh3YWJVOW9wMklDbDEyejNzSjBOQUFYNzNyRUIwamY3Y3loem1HbUxW?=
 =?utf-8?B?TmIzR0x0dnB6WUk3NWZJVFR0VDB5Wi9hOVlTMWRSdGMyK0lIOFdvM05MQ09L?=
 =?utf-8?B?YnFzUUc1OWpkQ1ZFK0Q3VGlLN1hrMldxcDYvL2dtNUpmWUVjNGJzRU5KK2VL?=
 =?utf-8?B?U2xjWG9tSDJZOFBCVG0zTU1UdCtJUkdHR2F3ZG1VMGk2blBMdDJWYSs1SG04?=
 =?utf-8?B?Yi9xZzlpQXJxcldKeXI1VDZ2VzIyMTBKSFBmU1BRM3FWclpySlpPNjRpL2Nj?=
 =?utf-8?B?VzBYWXlnTk1yY2I0OWZROGs1a1AwUk1FK1Avbi8wbGNKRFlScjF5WUlRdVl2?=
 =?utf-8?B?OE1tOTNWSGNyUDhHSnNxYnozUDNFZDh4UXVlYUhLT05WMlFDbFM0YnVIaWs5?=
 =?utf-8?B?SDAxd3BmK3cvcWNoZVoydHpodG1wSk84L2lYcE02Z3hKb3E4SVVYQ3h1VFZI?=
 =?utf-8?B?dExqRWhMRkxtKzJZVCt6YW9TVCtzb2hSemx3ZTVldnl5QkJRcDVlUHBvTlcz?=
 =?utf-8?B?YlFHMjhoSVZFMllsWG9SZHhRN0RmalVnYW1JeGtrNnFTb3NWd0VSeXZQdENG?=
 =?utf-8?B?OWtTTXJKQ25TR2VzZEVBclZibDN0OTk1Njk2WlpsNVFSRWd6MjlkWDhtVnVN?=
 =?utf-8?B?aFpnWHdwVXVqMUlrc2JPOE9zcmhPSGYyUTVRNjNteE1hRDMwMTBIM3l4dnhx?=
 =?utf-8?B?SGg4Y2lPYzJQOGhSN0ZxSVNmbjJoSHcrcGdIbXJxV0VsaFViZnFDRitGMlBQ?=
 =?utf-8?B?WU52NmdObDJsbXp1U2FOL0I2cWdVRjBpNGJpZGxXMzNMR0VjdGcwQVA0emtX?=
 =?utf-8?B?L1FMNTkwWVR6bE5keFBKOE82d0hNWmgrYlhnd1lDSEtlNEE3L3pyaDU0Yi92?=
 =?utf-8?B?dlBzVzVGU2Zqd0tDNlJwK3FnQlJsOStFTlZ6NjhxM0x6bkVuWDZqM3MwSUlZ?=
 =?utf-8?B?K3ZOdWViRG5pTjFvaEQzRFloeG9PeHJUTytDSTJFeTNEaWxVQ1d0OVU3d2RQ?=
 =?utf-8?B?dTRVU1RvSXgrRnAyaEw3cTBReEp3U2QzZU1ubkl0RGplWDZIMC90SzZvNnVa?=
 =?utf-8?B?bWhRTzlLeGhZNkZDWWRINjlCT0l2SzA3eHNsMVpybU43WFcyRENhUng2dHIy?=
 =?utf-8?B?RENTMzM5ak5aTmdxaGpJZkxHaGhjM1hnUXFTOXA0Qi93Y2hDOHpBcU1TczdX?=
 =?utf-8?B?YWZPREdNblRZaCtkbzA0azM2cnlJTSs0ejRWcndIOXRhcEtSM0tSNjBRcWVm?=
 =?utf-8?B?K2lKUWVMaDJQNzZJVUoyUUFoRFFEd1ZQd3BuaGVFVklCY1JPQmMyd2xzOXE1?=
 =?utf-8?B?bnBtRXljekQ1Y0dUQzlpcnV4L3hkalo3N21uN2JkbUo2RVZmWHE0MEJvNlBR?=
 =?utf-8?B?RUJFb3Y0di9QM3pSelArTStwL25XMG9lT3dYeGRiMGlyelZlN0R3RHJWVVA3?=
 =?utf-8?B?TXVVa3JLNXFjZGRUY08rNHZBSWVnVUcvay9wUys5SDhhTGVWQ3hiN1AwNXEx?=
 =?utf-8?B?cVd0Ti9uQ285T3dHUi8xaFd2aTNxMC9kMnFJbHhLc2VraXZVUkd6VnQrc0kv?=
 =?utf-8?B?VEg2dmhEZHpKSnZmbEQ1b3E1M1lQZFgzQUpWcjVRcGdxL0NnM3g1d3QzbjlQ?=
 =?utf-8?B?cGUxeWI2aUgxMVFkbUV1amhaeG5PWUVDd09KaG5JR3hBR0Q2SGp6MkRzVk1V?=
 =?utf-8?Q?DsPMATN8Ke+UbcutNbsY5h26uIw4nI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N1h5bFQ0MURjdEFFV0xVRWtIVFJHSms5aHFLanJLcGtMNHJwTVBwalM4Z2ZO?=
 =?utf-8?B?VjV1bExYbyszVEllTWRTbmlKZEJFSXNpYndDYTRXbWIwaG1CMkROdnFTUmkw?=
 =?utf-8?B?QXBXZ3dKRXN5a1hEemFGK3R5N3BkZi9XWlNhT3l3RXA1RFRmVm1kd2RtV1J4?=
 =?utf-8?B?VFZtdk04U0tzaVBLc3RWMUd4QzBjZ3pOS2Y0N3h4MHQvT1A1alBnMWE5eFlT?=
 =?utf-8?B?b3NjS055YWI3Wk9qdzRUTFN6VGFOM0tzTWhaeVpxNkRxcXFXem8rQW5aVlJN?=
 =?utf-8?B?dmhNY0c1UkxvK3ZKa0pxS2pWUlFwb1c2Zy8zeUxuY1E1RTI5SVEzZjRNUVRX?=
 =?utf-8?B?UnV4QVZIaWlRcFVvR0szUU5CaVFWblRZbitKaDEySDNxN2JwZjZMM0FsWU51?=
 =?utf-8?B?OTA0ZGpyaDlRVWVNbmV2YkdmU3piQ3JIOWU4R0pUMm9lb21NV01RZEFyako2?=
 =?utf-8?B?NGJpajd6ek9pVzFTczhoYndYN0pLa0l3M2VwVzhmbHBXbEM5a3haTVZkUDRj?=
 =?utf-8?B?NkwvQ3dJNHFnUWQ3dWtaTUxDbm1DeUQrYm9XZVJrazlaZ28rQzRvcVB4M216?=
 =?utf-8?B?T3FuejhONmtnaWFKTE1ndTZKaUtMdElPN1NUZ3NVK2Y3dnJ1ZHlqbDRlYmlU?=
 =?utf-8?B?cUlVUy9uOTZod3QrNzRBSjRUTGJQRTdYYUhhYW5FR09QUkZYNzNWRi9tRUlC?=
 =?utf-8?B?TFNYNjlwbHZPTHhMdjhhMFdOamsybjhjMm9UUHlmcit4Y0FMRFk4dllVKzJw?=
 =?utf-8?B?NkFHWmg0WVJ5eFd2VGMvZHNaU0RsVHJac3ZLUTJURUYzb1hlRmZxMlYxcDFZ?=
 =?utf-8?B?cW1hV3pOUmlnQXJBRThkWHJ1ZTNvZU43WmtpNzUyWnRGckVtY3RGY2Q0UTk2?=
 =?utf-8?B?RkRCMTdTcXJIRkQxcGxScGZCNW5YUHpMbWg4MHEyaVRRQmlFbDZOaldTNzVN?=
 =?utf-8?B?ZWtmYmRyTG1MS044MklabDFQQXdJUFB4aURzZkc0NUR2ZmZSVnZVUkpDTm5u?=
 =?utf-8?B?aThDRXpmSE9ML2Y0OExFdHU3K2JWdEZVaytuZEhjR1RaaDZZdG1XYmVKbGly?=
 =?utf-8?B?TWFxb0JoSmRVMms4SU1DRXR3b0U4bFVQeHJubncyVkZIaXR0YlFpUk91cmJn?=
 =?utf-8?B?MXQwVy9peVpKLzBxcTdsYngrQlIxTURuT0hvWTJTS1NPOWxENnRUNjN0NUJL?=
 =?utf-8?B?dUtzSEtDV2hJRFZqTi94dWkwQkhQK0FWSVoyTDZUYXpCSXNweTRua1lwUEI0?=
 =?utf-8?B?OWIzbnFCaEpxVGg1TG5SNFplVGQwTkVYTkJOZ1FJMVN0ZGFyTXA1bHRYMzY1?=
 =?utf-8?B?MW1FQWpHaHFrM2QrWHFraEZsUkh0bHRmSVB6SjNkbGJBL3JET1ZCQ3hNc3lJ?=
 =?utf-8?B?YW9id1R1dnpjckcyczJPSGM2RGJUNDd4c3pyU2hvZlU4VGYzcnV5MUdYb0Vk?=
 =?utf-8?B?cDhybGl0REhBTWNUU2ZsQm1mUHJTMnFrRnUrRWNOUXpsbkRDZngrZzVXVVZP?=
 =?utf-8?B?SnFPZHRyeU1oaVlzTzRLa2cwWHE1clZvN1Z4aEQ5OFJXQ1NIcWQyTldwM0tY?=
 =?utf-8?B?cUVFYWdoaDMvdlAvTFp4VkU1OXZYVjVIVk5Ed1V4V1ZvZUhOekt0S1c2V2ha?=
 =?utf-8?B?bm9GODBFN0VDVjlFYUQ4djRzcGlpRUZoMERGSnM2MzVEL0N6OGl5dE1MbU5J?=
 =?utf-8?B?aytZMEFXMldjRDFpMU5aSGtTSTRjZ3ovYXYzRklCdnZOeno2WmxYeU1ZWkl1?=
 =?utf-8?B?alZZajZ6dDFENGhvM2VYRFp1MjJjKzhHclVjWlRYek9xYmJwRHU2SmtKM081?=
 =?utf-8?B?WnlsOXQzK2NYK0k4bXRNbjZ6S0RNWCs5MDRzWFBvS1lsbi9PS3UrTFlwc0Fj?=
 =?utf-8?B?V2FicnN5aERHYTZ1K3NNcG0xRHdKbUZ3OE5PdzNndXpPSEdpaHFqVXE5S3Q1?=
 =?utf-8?B?a09pWnhaRWpIQmdvR01tR1h4RnhwSXRqaXRMcDNieGdwR1N6VkQrbVBraDNG?=
 =?utf-8?B?ZUdQUXRqWVZ5R25LWStIbU5OT25JNkJtbGU4N0N4Sk41QWRiM0NCREdzbXg1?=
 =?utf-8?B?LzlHSG1jSGVTalVmQ0hqeStPbnd5RE1OOVlRaHJ0N3hpczdwaG1iUWptR3Vs?=
 =?utf-8?B?Ylk0RkhvbldkSitqVmdnWS9TVW9neEZ0TEVuM2pZWC9YM2ZDUzJGZHdLNGlO?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa155ec9-0ab1-4698-344e-08dd9d30199e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 15:06:46.9711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5v23jUhrGaRf93sw+AmbvxVDEaF/YulhLSjicEwPIGyR07Sl6m7W+MJMbYsjgbvtK/+guZPPqF3qSdwW+W/Uo2h/uBGqEmZzrtirDBMdRpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 15:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217311

VGhhbmtzIFJpY2hhcmQsDQpZZXMsIEknbSBleHBvc2luZyB0aGUgZmlsZSB0byBiZSBhYmxlIHRv
IGV4dHJhY3QgdGhlIHNvdXJjZSBjb2RlIHVzZWQgaW4gdGhlIG90aGVyIHBhdGNoZXMgaW4gdGhl
IHNlcmllcy4gU2luY2UgdGhlIGZpbGUgd2FzIHRoZXJlLCBJIHRob3VnaCBpdCB3aWxsIGJlIG1p
bmltYWwgY2hhbmdlcyBvbiB0aGUgY3VycmVudCBjb2RlIGFuZCBsZXNzIG92ZXJoZWFkIGNyZWF0
aW5nIG5ldyB0YXNrcyB0byBleHRyYWN0IHRoZSBpbmZvcm1hdGlvbiB0aGF0IGlzIGFscmVhZHkg
YXZhaWxhYmxlLg0KDQpXaWxsIGl0IG1ha2UgbW9yZSBzZW5zZSB0byBjcmVhdGUgYSBuZXcgZmls
ZSB1bmRlciAiJHtQS0dERVNUV09SS30vZGVidWdzb3VyY2VzLyB3aXRoIHRoZSBjb3JyZWN0IGZv
cm1hdCBhbmQgdGhlIGZpcnN0IGZpbHRlcmluZyBkb25lLCBtb3JlIGFsaWduZWQgd2l0aCBleGlz
dGluZyBmaWxlcywgc2luY2UgdGhlIGN1cnJlbnQgZmlsZSBpcyB1c2UgYSB0ZW1wb3JhbCBwbGFj
ZWhvbGRlcj8gT3Igc29tZXRoaW5nIGluIHRoZSBsaW5lIG9mOg0KYmluYXJ5X2ZpbGU6IHNyYzEg
c3JjMiBzcmMzIC4uLg0KDQpJIGNhbiBhbHNvIGNyZWF0ZSBhIGJldHRlciBleHBsYW5hdGlvbiBp
biB0aGVlIGNvbW1pdCBtZXNzYWdlLCBpbiB0aGUgbGluZXMgb2Y6DQpUaGUgaW5mb3JtYXRpb24g
cHJvdmlkZWQgaW4gZGVidWdzb3VyY2UgY2FuIGJlIHVzZSB0byBoYXZlIG1vcmUgZGV0YWlsZWQg
aW5mb3JtYXRpb24gb24gdGhlIGZpbGVzIHVzZWQgZHVyaW5nIHRoZSBjb21waWxhdGlvbiBhbmQg
aW1wcm92ZSBxdWFsaXR5IG9uIHRoZSBTUERYLg0KDQpJJ2xsIHRyeSB0byBtZWFzdXJlIHRoZSBp
bmNyZWFzZSBvbiB0aGUgc3N0YXRlLg0KDQpDaGVlcnMsDQoNCkRhbmllbA0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCAyNyBNYXkgMjAyNSAxNTox
MQ0KPiBUbzogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+OyBvcGVu
ZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSCB2NSAxLzNdIHBhY2thZ2U6IGNoYW5nZSBsb2NhdGlvbiBvZiBkZWJ1
Z3NvdXJjZXMNCj4gdG8gUEtHREVTVFdPUksNCj4gDQo+IE9uIFdlZCwgMjAyNS0wNS0yMSBhdCAx
NTo0MyArMDIwMCwgRGFuaWVsIFR1cnVsbCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3
cm90ZToNCj4gPiBGcm9tOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNv
bT4NCj4gPg0KPiA+IFN0b3JpbmcgZmlsZSBnZW5lcmF0ZWQgZG9pbmcgcGFja2FnaW5nIGluIFdP
UktESVIsIGRvZXNuJ3QgZ2V0IGNhY2hlZA0KPiA+IGluIHNzdGF0ZSBhbmQgdGFzayBkZXBlbmRp
bmcgb24gdGhlbSBmYWlsIHRvIGZpbmQgdGhlbS4NCj4gPg0KPiA+IFN0b3JlIGl0IGluc3RlYWQg
aW4gcGtnZGF0YS9kZWJ1Z3NvdXJjZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1ldGEv
bGliL29lL3BhY2thZ2UucHkgfCA1ICsrKystDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIv
b2UvcGFja2FnZS5weSBiL21ldGEvbGliL29lL3BhY2thZ2UucHkgaW5kZXgNCj4gPiAwYmNjMDRl
YTU0Li42ZmNkMDAxZGIxIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvbGliL29lL3BhY2thZ2UucHkN
Cj4gPiArKysgYi9tZXRhL2xpYi9vZS9wYWNrYWdlLnB5DQo+ID4gQEAgLTk3Miw3ICs5NzIsMTAg
QEAgZGVmIGNvcHlkZWJ1Z3NvdXJjZXMoZGVidWdzcmNkaXIsIHNvdXJjZXMsIGQpOg0KPiA+IMKg
wqDCoMKgIGNwYXRoID0gb2UuY2FjaGVkcGF0aC5DYWNoZWRQYXRoKCkNCj4gPg0KPiA+IMKgwqDC
oMKgIGlmIGRlYnVnc3JjZGlyIGFuZCBzb3VyY2VzOg0KPiA+IC3CoMKgwqDCoMKgwqDCoCBzb3Vy
Y2VmaWxlID0gZC5leHBhbmQoIiR7V09SS0RJUn0vZGVidWdzb3VyY2VzLmxpc3QiKQ0KPiA+ICvC
oMKgwqDCoMKgwqDCoCBzb3VyY2VmaWxlID0NCj4gPiArZC5leHBhbmQoIiR7UEtHREVTVFdPUkt9
L2RlYnVnc291cmNlcy8ke1BOfS1kZWJ1Z3NvdXJjZXMubGlzdCIpDQo+ID4gK8KgwqDCoMKgwqDC
oMKgIGRlYnVnZGlyID0gb3MucGF0aC5kaXJuYW1lKHNvdXJjZWZpbGUpDQo+ID4gK8KgwqDCoMKg
wqDCoMKgIGlmIG5vdCBvcy5wYXRoLmlzZGlyKGRlYnVnZGlyKToNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBiYi51dGlscy5ta2RpcmhpZXIoZGVidWdkaXIpDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoCBiYi51dGlscy5yZW1vdmUoc291cmNlZmlsZSkNCj4gPg0KPiA+IMKgwqDCoMKgwqDCoMKg
wqAgIyBmaWxlbmFtZXMgYXJlIG51bGwtc2VwYXJhdGVkIC0gdGhpcyBpcyBhbiBhcnRlZmFjdCBv
ZiB0aGUNCj4gPiBwcmV2aW91cyB1c2UNCj4gDQo+IFRoaXMgbmVlZHMgYSBsaXR0bGUgYml0IG1v
cmUgZXhwbGFuYXRpb24vanVzdGlmaWNhdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgdGhp
cw0KPiBjaGFuZ2UgaXMgYSBmYWlybHkgYmlnIGRlYWwuIEkgY2FuIGd1ZXNzIHdoeSB5b3UncmUg
ZG9pbmcgdGhhdCBiYXNlZCBvbiB0aGUgb3RoZXINCj4gcGF0Y2hlcyBidXQgdGhlIGNvbW1pdCBz
aG91bGQgc3RhbmQgYWxvbmUgd2l0aCBpbmZvcm1hdGlvbi4NCj4gDQo+IEVmZmVjdGl2ZWx5IGJ5
IG1vdmluZyB0aGUgZmlsZSwgeW91J3JlIHRha2luZyBpdCBmcm9tIGJlaW5nIGludGVybmFsIEFQ
SSB0byBhbg0KPiBleHRlcm5hbCBBUEkgd2hpY2ggY2FuIGJlIHVzZWQgb3V0c2lkZSBvZiBkb19w
YWNrYWdlLiBXaGVuIHdlIGRvIHRoYXQsIHdlDQo+IG5lZWQgdG8gYmUgcmVhbGx5IGNsZWFyIGFi
b3V0IGl0IGFuZCBhbHNvIGJlIDEwMCUgc3VyZSB0aGF0IHdoYXQgd2UncmUgZXhwb3NpbmcgaXMN
Cj4gdGhlIHJpZ2h0IGluZm9ybWF0aW9uIGluIHRoZSByaWdodCBmb3JtLg0KPiANCj4gVGhlcmUg
YXJlIG90aGVyIGltcGxpY2F0aW9ucyBzdWNoIGFzIGluY3JlYXNpbmcgdGhlIHNpemUgb2YgdGhl
IHNzdGF0ZSBvYmplY3RzIHRvby4NCj4gDQo+IFRoaXMgZmlsZSBpcyBhIG51bGwgc2VwYXJhdGVk
IGxpc3QsIGlzIHRoYXQgYSBnb29kIGZvcm1hdCB0byBleHBvcnQgaXQgaW4gZm9yIHdpZGVyIHVz
ZT8NCj4gSXQgaXMgY2VydGFpbmx5IGRpZmZlcmVudCB0byBhbnkgb3RoZXIgZmlsZSBpbiBwa2dk
YXRhLg0KPiANCj4gQWxzbywgdGhlIGZpbGUganVzdCBjb250YWlucyBhIGxpc3Qgb2YgYWxsIHNv
dXJjZXMgcmVmZXJlbmNlZCBieSBhbGwgZmlsZXMgaW4gdGhlIG91dHB1dC4NCj4gRG8gd2UgbmVl
ZCB0byBpbmNsdWRlIG1vcmUgaW5mb3JtYXRpb24sIHN1Y2ggYXMgd2hpY2ggZmlsZXMgaGF2ZSB3
aGljaA0KPiBkZXBlbmRlbmNpZXM/DQo+IA0KPiBJJ20gYXNraW5nIHRoZXNlIHF1ZXN0aW9ucyBh
cyBJJ20gd29ycmllZCBhYm91dCBmdXR1cmUgaW1wbGljYXRpb25zIGZvciB0aGlzIGRhdGEuDQo+
IENoYW5naW5nIHRoZSBmb3JtYXQgbGF0ZXIgaXMgaGFyZC4NCj4gDQo+IENoZWVycywNCj4gDQo+
IFJpY2hhcmQNCg==

