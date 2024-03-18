Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCECAC54E60
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 01:24:20 +0000 (UTC)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com [216.71.158.62])
 by mx.groups.io with SMTP id smtpd.web10.33286.1710725054050534183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 18:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=qJLS7DWV;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.62, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1710725054; x=1742261054;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tnISyDgvZ5djA+xmpbVwDWVCDYTOpHGhKgNsZP0L9hs=;
  b=qJLS7DWVOyjCX0lxmftRa3VjWZ21LuCyPql/YzonFKgt98ozmk+ylPsu
   8CU0rriBDqbha2FJBm4Dd326u4htSGOd6b3OBdzOBNL5j3yrYnUXL/p7K
   zOdNC4boq8NoCZnGSCijzR2LVYB/lo9ArqhTtvOOu5ubzxhcuYH8Hox+5
   P8ANAeguo36TuwQAw062N84VCTfGsRl1xIgp/E02P7xmBv4+jEuhGg7pC
   oQKNGfxvHdcMWWosw8Ajebspc4sgKRAeehat2zE6df08wLT9NQ3IBDNaV
   SRtZhcFjVJxg5Oj3P/EZ5EayKnNXlrj5lhGd1yCK4IUKFHcp2mUvesqgn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="113772732"
X-IronPort-AV: E=Sophos;i="6.07,133,1708354800"; 
   d="scan'208";a="113772732"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 10:24:11 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKbWzzVuFydLmVJu4uzzRiIoBEH2o2+VF3jsesD7YxPBu3ZIHYDpj4Rzaw94jhmm9PeuYclr9WW+6Z1jp2zaeS0rMYqc2s155079YF0YPkihoa4f2y9oB8isD86P04jqu+Hqd/KwkbzxoZcgUcwyUPjZoc3D2mXkv13HAmM3bU1mNLXazSHCau0ubiFfa7HGp7B1M6cJNQagAzz3fNIWw0vWzaM3vKy76O+VZFNmMrUIZzrPXnO6ROI+cD4XnddDuJTLfvF0U/9AONei8xJVu8o+h4YifhrCIkWM9TTEImLblPSXL4MFNXP2I+JCIC4hakrXcf3+Ii5IcFXYTrOiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnISyDgvZ5djA+xmpbVwDWVCDYTOpHGhKgNsZP0L9hs=;
 b=ENPJJZkxxGnzxz7rCIC/ckbFeQwGNhHO+IrdlAFygy09XJo5/Bqi7eMrGWa4phJbaajgxTlmKhy0qLStvlxdbUz9KbV5rFe2++nnMmE419G7ZcGDw7k+/cfXcAZ80Ps3PA6lbITiH/vNaTwAJ7jQ1sc+yDQd0PmkVrz/YaCjAkeFsVu144UfNkiQi+3uf38fNzt1qShCrDYiVsXwS4Au1KcmacTDUQWDvfue3W3EodkVbIxlKdwS7PuSkosJ2dpOck9i0wTtNkJ6GR4Dh+O3Feumdi7valKYCxeLOqXQlZdPHg/D9tJmnxysdDMNq0Y6Slb6/QcNErzoozPxsc7qPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYCPR01MB8013.jpnprd01.prod.outlook.com
 (2603:1096:400:186::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 01:24:06 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::4189:9809:9327:afc8]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::4189:9809:9327:afc8%4]) with mapi id 15.20.7386.020; Mon, 18 Mar 2024
 01:24:06 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 0/2] glibc: Fix conflict error when enbale
 multilib on aarch64.
Thread-Topic: [OE-core] [PATCH v2 0/2] glibc: Fix conflict error when enbale
 multilib on aarch64.
Thread-Index: AQHadoWo7+3db2UjK0yWNbxd8VTDObE4abWAgAQ/nMA=
Date: Mon, 18 Mar 2024 01:24:06 +0000
Message-ID: 
 <TY3PR01MB1105639F37F06CD6A632803ACA02D2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240315030531.1179974-1-leimaohui@fujitsu.com>
 <cd075c20b83851dc9c7214ee26f951dc9b28bb87.camel@linuxfoundation.org>
In-Reply-To: 
 <cd075c20b83851dc9c7214ee26f951dc9b28bb87.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MjZiMzMxZDEtZjBiZC00MjcxLTg1NGQtZjIwZDBmOWU2?=
 =?utf-8?B?YzI1O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTAzLTE4VDAwOjI5OjE1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYCPR01MB8013:EE_
x-ms-office365-filtering-correlation-id: f9287a5b-4cf1-4415-500e-08dc46ea1ae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /otdam+KDMQaC9D9bGcoqBDnUteKTXHQBqy5YI70iQYHnV2ljvVy5HStt4KHDmRpMswUVFBNfqOJKxfiBp4vPM92vQuFclEb0YYA9/w13XBcrypKgMe8dlGUCXsl1xvtVcf3pKkMP+1UKzSlIA3ZotQ6gFGi+t728Cd8R/VUL+AUMIiALKQK8jMWQSioQ+HGxedYGs1GFzLKNnzgiiO9B77dIU7QTSgZXZVgQ5RNN7IfZ67+kEL01ZKr8JXKHdrj68Dt//B1febHi3ZrO3OnICsznI2MeTRGsmAjsw8A3BzKySgBOyesZFbnq3RlyTs+clCuuC73o9NWbGfudiGkIafmxK/qTQDb5AXPUOtvfw9elIaQXoO4S4mTiIcNHXdZZQWHB1lClkSCNMNB/L7MTlWntIEu0kltC/rDaiMUpcGw2GMq0bz+UvAheGNEta/UEdQAjv4docjVmdC6Y96cCZjwM9qCzH4CfJJiniG9bvl3HgslUpBJGU5k0hjkqQ+ot1OKYgMn5D/ZIlIih3ttiLUhNlwjyOhABWTbmKlj+b2wA0UvkiGePJAr9+NjtmbzLhNyQwJ74eiR0RJOV+en96DrFKrDI6BzaxEM2injGfvPZsGwnnrKUb2QwDrAYBdb6rdVh3ArTJtN+UyJk1962bWs7C6BdrCAbAWymaaxvz6Ij+w3J/sD5hNC6DrhHRN5NAroSXwKF9NRH9ZRXcL0ejuYXI+4ZIFY/W96aLSAfEdQ0kGyMk17qxB5ai3aEcbt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(1580799018)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eTBSazE4REdCZzZHL3ZwQytWMmt6NE1UUDBIdUdhblpndHVwVERubDRqU1E2?=
 =?utf-8?B?MzVCaUlHY2hzazM5b2JEZHJ6VzdsY3V6OXNDZnJrWURPdTVKdy9mNWlwSllD?=
 =?utf-8?B?OG5kbVdyazBRM3crdGpueUxERXlxdFZtbnV1TW96OWFiQUY4TGltNjBVd2JN?=
 =?utf-8?B?Qmw3MHFjYUNObStrMzU2bU9LZGNuWXJ2cFZVZVY3YkwzdUh1a3VTc0llNHR5?=
 =?utf-8?B?MUxURnlZQklZUlhQdU81WmYvOEJmd0ltbkVlS21GSXo0MzBaSEo4T3BoMDky?=
 =?utf-8?B?TkEwdGVRSlRaOUQ4WUQwYjJXWE85VmIvam9rTjZvNWE3T3FSdU92dDRLQXBq?=
 =?utf-8?B?aFRFelRaZHdPRnZVSXJkZk9GOVQxTUpzb21LK05RbDJoN0lVREtVS0RGaU5K?=
 =?utf-8?B?UlRnYjFybDBlZzdIaklGcGprNUNORmZLaWJOK0J1VWdUWlpYYzc3K0t6b0Iz?=
 =?utf-8?B?MGpGQUJlQi9sNTRLZ3dSbXVJdi9JQlRGRVFrVG0zeXJlMHV6NFFoZXRsbngv?=
 =?utf-8?B?N21JYjVMckJTNzRrbVlEYXpPZWNRNlJ3cCswS0JjS1hJYk03L0FmajdRRjQz?=
 =?utf-8?B?QzZCeGR3cldXaUNybXVybktKejIrTVlLWXFxMXFJR0Q2cUJrbnYwK2JPdllk?=
 =?utf-8?B?bGpEcHE4OXJJVURQdFRhNEo1UkdPOUVoNDNDSVBXUkxlR0xiRVQ1VkVyTEJS?=
 =?utf-8?B?UkNHcE1NRzJIYzgrQVMwZWVKeU1HV1hMNGpDYmFFL1VhZWk0T3ZvNE5IcTRl?=
 =?utf-8?B?andHS1I3bzdVWEsvVHE0ZG1wRWNGZkdPN096Y25tSzNlM1QrZ2FyYmcyZ1hB?=
 =?utf-8?B?dnFMbWZxbnBPSGtvRFl0aWpXb3FrazllWkN1cmw0eHJyNHVGR25xbnhwSGl0?=
 =?utf-8?B?c041ZmxaaldWOXU1NVVIbFErdWxsNWp5dmg4Rjk5bTY2MXhJVGJ5aisyWitH?=
 =?utf-8?B?cGJzU2cvMi9QUFI2c3V1eEZKTzBPR2JQemJEdkVFMGJrakx0MVRadkhmZFBK?=
 =?utf-8?B?eHJ4L2tnemhxSURYdG5zMnBaVVhZL2tSajFuTjNQUmw4MkxSdmcraTNSRXJm?=
 =?utf-8?B?WTU5WFNudUtaVXZ0UHV6N1crdUJ2T2VSN01ucFRQUzB6SFNWSDRoREJwK2tX?=
 =?utf-8?B?VmlEWUtJUURPRXZTOWlNM0FwQ2QvazBTS0tzc042cEhOaGtLanRsWHZodVN5?=
 =?utf-8?B?Yms1YnVFT0k3Ly9pMTczRWRVQ082UURsRFF2dUpvU3VPbDRDSkdMakRQc29n?=
 =?utf-8?B?Rzc2QXhiQ2Rza2lJSGhPV1dRbEZSNURNQk1kZUtFK3VtdDRnN0RoSGZYcGht?=
 =?utf-8?B?QTdUc2YrZDVKb1dkOUppRWQxWUcvbGxQRytPdUJYQ2hicU1mQ1lZSGVNa3Yw?=
 =?utf-8?B?cEpkdGxCdjNhbEVGQUtERTR6SGNRNWVCT1FRRHdEOUZDWmZvejhHM1hEcXV1?=
 =?utf-8?B?Q3o0SmZIKzhhdUNXUTd0L0hORXY1dE9MOG9EOTUzVWVrZ044d3AvZHZMeXFO?=
 =?utf-8?B?Z08xY3ptbWFmL2JnNFc5ViszVjVNTUNmS0RDWWpxc2NTMEJxbnhwY3RTNm1p?=
 =?utf-8?B?dVB3WVBVTTh5SFhlZ3p3dGxIR0I2cHZGNVErSThYbVFnMm1WbysrRGJIUE5i?=
 =?utf-8?B?K2lVK2E0dHJFdnR6L0N1MlZRQXQ3dS8vTkZoSDdVOWMzaFI1OVRzcllsZWlx?=
 =?utf-8?B?WXppLzFLRzNkRXdtZmJ5VXdVVU5sQUhvTG1KWFFrR09vMzFkWEl5MVZ3eDdY?=
 =?utf-8?B?WkIxd3o5L3I0SzBiSTB3SGZlUGtqSnc4K1VQeUR5a0xoUE9ZZThNNkNNdjB3?=
 =?utf-8?B?bmJLUlc2YVBpVHNkV1NqRUZIbDFNZlUvcnhNMkcrQ2ttVlJLbTdnemRXaVFI?=
 =?utf-8?B?L2JJakwxdVdHY2U4OGVYM2pCeXJaMkYzdVVFWEY4cjJ2Q0tDZUczSGJsTnp5?=
 =?utf-8?B?UFhDS3k3eHEybHo2SmNGbm5OdFpWdGl5M0hLOWZibGZhc2hWQ0VTWk9EcEhT?=
 =?utf-8?B?NFRxTGl0QmFoWkl5UlpXWkFqbGRkMExqZzdTTVhablNBNnVsTFRNT0xmSE1m?=
 =?utf-8?B?N3RYV3pUK1BkN1ZNWU9Ua0t1T1d1aXkwVEZPdHQ5c2Y1K21kNXh4emFOV3FZ?=
 =?utf-8?Q?kEV9L7WNaiRXEed7cUHtIAwom?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	MLtKd1yArQtrx9F9bfzj7WG6p00iQ8jvr8px5n9sQnNzg5Ow8llZSaGtnlScLFl/53woOnwEiDsreDXIgD5YX701tem1hKCnCV8xV1m1zn3bJvI/20ZdWwTlQtWU67ll6yYpMkAqQHCbIhPjLWfVMyWMfEAqlDdYeiwn3dzewDXSxrHW4qbtguqhTbe51xNv2Odj8lo93Lahi5z7uDUZvPkweB+7nH1mOY3JCHHF8pO7mWYpxRAMJYbwjJn0u66nFMsX/KqSudxnEmwzJYPadwMgW66q5FrDLm6wQD2B1LD7Obl+Bf9aSiUBJqQN4KccuOUI7Gi30LKVs6aqbta7eeAECgoCWxLZd+A+h0gGXsTsbxaKgIc5Apj/p9YC2ekDPjtWayucas89MkWOkwrPmBVwGYF3E4Gu+9Bb6SfhprX/cVGuqMsSPyu034PnBxO/+Yp01dt1Tm/J8EEOQh4SJADl3XX4hmiLss3udX++v81io+Rf7hwAiignZWTJx2OUKwn0I9skC0hwF4x9w5EHHlAbTmZwUk2J67xHd901+IKrhhJc1T2WKF7fRWcVPT8A1axASwwcQ/SWooezbLt2gSRS1idbRHkJqjiScXMpVpCqfMEKsuE34oRmaLbZ3K7d
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9287a5b-4cf1-4415-500e-08dc46ea1ae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 01:24:06.7092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5u/sdcEwTqIk2qHL8dAA8oCV0XOC/8cRt6ij20GQpQrjo7ME/UiNQLlZspr0kXj2x41SoBGt0+QW+yCkATi3Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 01:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197273

SGksIFJpY2hhcmQNCg0KPiBJJ20gYWZyYWlkIHRoaXMgbG9va3MgbGlrZSBhIHByZXR0eSBob3Jy
aWJsZSB3b3JrYXJvdW5kIHdoZXJlIHRoZSBoZWFkZXIgaXMNCj4gYnJva2VuIGluIHRoZSBub24t
Zm9ydHJhbiBlbmFibGVkIGNhc2UgYW5kIG11bGl0bGliIHdvdWxkbid0IHdvcmsgaW4gdGhlIGZv
cnRyYW4NCj4gY2FzZS4NCj4NCg0KSSdtIHNvcnJ5LiBJdCBzZWVtcyB0aGF0IEkgc2hvdWxkIHN1
Ym1pdCBhIGRpc2N1c3Npb24gaW5zdGVhZCBvZiBzdWJtaXR0aW5nIHRoZXNlIHBhdGNoZXMgZGly
ZWN0bHkuDQoNCkkgZm91bmQgdGhhdCB0aGUgY3VycmVudCBvZV9tdWx0aWxpYl9oZWFkZXIoKSBm
dW5jdGlvbiBkb2VzbuKAmXQgd29yayBmb3IgZm9ydHJhbiBhdCBhbGwuIA0KSSBmaWd1cmVkIG91
dCB0d28gbWV0aG9kcyB0byBmaXggdGhpcyBlcnJvcjogDQogMS4gV3JpdGUgYSBuZXcgZXhhbXBs
ZSBtdWx0aWxpYiBoZXJkZXIgZXhhbXBsZSBmb3IgZm9ydHJhbiwgc3VjaCBhcyBtdWx0aWxpYl9o
ZWFkZXJfZm9ydHJhbl93cmFwcGVyLmggb3Igc29tZXRoaW5nIGVsc2UuDQogMi4gRGlzYWJsZSBm
aW5jbHVkZS9tYXRoLXZlY3Rvci1mb3J0cmFuLmggZm9yIGZvcnRyYW4uIA0KDQpBbmQgZmluYWxs
eSwgSSBzZWxlY3RlZCB0aGUgc2Vjb25kIHdheSBmb3IgdGhlIGZvbGxvd2luZyBjb25zaWRlcmF0
aW9uczoNCiAtIEkgc2VhcmNoZWQgdGhlIGJ1ZyByZXBvcnQgYWJvdXQgbXVsdGlsaWIgYW5kIGZv
cnRyYW4sIGl0IHNlZW1zIHRoYXQgZmV3IHVzZXIgdG8gZW5hYmxlIHRoZSBtdWx0aWxpYiBmb3Ig
Zm9ydHJhbiBjb21waWxlci4gIA0KIC0gSSBidWlsdCB0aGUgY29yZS1pbWFnZS1taW5pbWFsIHdp
dGggbXVsdGlsaWIgZm9yIGZvcnRyYW4gY29tcGlsZXIuIFRoZXJlIGlzIG9ubHkgb25lIGJ1aWxk
IGVycm9yKGZpbmNsdWRlL21hdGgtdmVjdG9yLWZvcnRyYW4uaCkuIA0KDQpGb3IgdGhlIGFib3Zl
LW1lbnRpb25lZCBjb25zaWRlcmF0aW9ucywgSSBzZWxlY3RlZCB0aGUgc2Vjb25kIHdheSB0byBm
aXggdGhlIGlzc3VlIHF1aWNrbHkuIA0KSSB3b25kZXIgaWYgeW91IGNhbiBnaXZlIG1lIHNvbWUg
c3VnZ2VzdGlvbnMgYWJvdXQgaG93IHRvIGZpeCB0aGlzIGlzc3VlLg0KDQpCZXN0IHJlZ2FyZHMN
CkxlaQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6
IEZyaWRheSwgTWFyY2ggMTUsIDIwMjQgMzozNiBQTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1h
b2h1aUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjIgMC8yXSBnbGliYzogRml4
IGNvbmZsaWN0IGVycm9yIHdoZW4gZW5iYWxlDQo+IG11bHRpbGliIG9uIGFhcmNoNjQuDQo+IA0K
PiBPbiBGcmksIDIwMjQtMDMtMTUgYXQgMTE6MDUgKzA4MDAsIGxlaW1hb2h1aSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiBGcm9tOiBMZWkgTWFvaHVpIDxsZWltYW9o
dWlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiAtIEZpeCBjb25mbGljdCBvZiBmaW5jbHVkZS9tYXRo
LXZlY3Rvci1mb3J0cmFuLmggZXJyb3Igd2hlbiBlbmFibGUNCj4gPiBtdWx0aWxpYiBvbg0KPiA+
IMKgIGFhcmNoNjQuDQo+ID4gLSBCZWNhdXNlIG11bHRpbGliIGhlYWRlciBkb2Vzbid0IHdvcmsg
d2VsbCBmb3IgZm9ydHJhbiBjb21waWxlciwgYQ0KPiA+IGNvbXBpbGUNCj4gPiDCoCBlcnJvciB3
aWxsIG9jY3VyIHdpdGggYWJvdmUgZ2xpYmMgcGF0Y2guIFNvLCBkaXNhYmxlIG11bHRpbGliX2hl
YWRlcg0KPiA+IHdoZW4NCj4gPiDCoCBmb3J0cmFuIGlzIGVuYWJsZWQuDQo+ID4NCj4gPiBMZWkg
TWFvaHVpICgyKToNCj4gPiDCoCBtdWx0aWxpYl9oZWFkZXIuYmJjbGFzczpEaXNhYmxlIG11bHRp
bGliX2hlYWRlciB3aGVuIGZvcnRyYW4gaXMNCj4gPiDCoMKgwqAgZW5hYmxlZC4NCj4gPiDCoCBn
bGliYzogRml4IGNvbmZsaWN0IGVycm9yIHdoZW4gZW5iYWxlIG11bHRpbGliIG9uIGFhcmNoNjQu
DQo+IA0KPiBJJ20gYWZyYWlkIHRoaXMgbG9va3MgbGlrZSBhIHByZXR0eSBob3JyaWJsZSB3b3Jr
YXJvdW5kIHdoZXJlIHRoZSBoZWFkZXIgaXMNCj4gYnJva2VuIGluIHRoZSBub24tZm9ydHJhbiBl
bmFibGVkIGNhc2UgYW5kIG11bGl0bGliIHdvdWxkbid0IHdvcmsgaW4gdGhlIGZvcnRyYW4NCj4g
Y2FzZS4NCj4gDQo+IEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gbWVyZ2UgYSBwYXRjaCBsaWtlIHRo
aXMuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0KDQo=

