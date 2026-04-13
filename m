Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A327EE9380B
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 01:41:57 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.262181.1776044508959796968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 18:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=VaWuJIQ3;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.69, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNyDeOVI1v4B4HkLOwtK0onvXSPJhcey+UxQX8/aML+y+adI8Iyhj0jc+JSr/l1VHEO6kvRRU7PvL4kjaUSpKDRrxB2OkJD7thIyNJpJ4UsoOUcOdwHuSdh5CnnyG58uKACNEqtfK2T68jhgssAO7mdFNbt+cRltCDn7a89uqb/aLqG7G1/U6Sh93sBZpX/4GM7BxtREoacMYVbiW8vk+EqEZnmaJyM8rmr87qPAg/dNfdj4SkoOZMhXgvKkMfTALerM6K6apS6HcNz1EtCiK+NUkKNtLtj3NK6ym7oCJxD/ueGdCJl4UsIoXb+wGHc+uz+w5Yeb7og4Mtq5L3TCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5btbrYIaH3aSMZmQx40jtypQIHlwFjYIAmf3cm4gTg=;
 b=IQ5rIhphTvqS2w5M3nWhHpMQcXeWc2mtCmL4DrZdKWu500AyXD1PlpmFIzHzHEnZuWqgxd/VBjvdOPDyH4TPnL1H4KVcMAzuVzLvO3zz6B1l8BAoQ795q7hr7IzgfTbSnWBgn1DBpzBSOFZJIgGcIki9XyMECwnxkVYSB7W9PQVGmU2M43qBi5AUmSvQP/6lRyE+5SYBCGbnEed6XgX/HFN40o72uw6w9T6sinnP5aA1PEo8YXIp+auRWS5bdlj6+AZzkltECKPnxXdKJYfVdF46yssoo+zBOIBaYhX0iTu6FQfEPgBREXNA525ZpwuMvPI0kL0B9YSjBhcLIzeryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5btbrYIaH3aSMZmQx40jtypQIHlwFjYIAmf3cm4gTg=;
 b=VaWuJIQ3qIhNttmxh9f0xxPCAOYTeauSzJe/2/U4eH8I+7IlMu6LfTQroWBJEZTEJs6sjl0lJps/6woOTp5ecpctA7Pslu06aJfQ0hnKReE+BJEj5X8nwpAUs2TmYw8yj24SEkw2UOvnqi2m0rjVFGFIhZxHT/ROYkNnbQpeNk7sWIup5o53PviJpDp3aUv8uJqSchSuKIY/jgGTlmZP+fpjNUjfICLDt0VohYOWH0Gwhs+/0xnxeAU4w6sPYZ23nTzcnK0bSuVJ3oytHwcs28srB8yHPSHeJ6FOhN8wULr5dc7LCFAd6NNgEeyQksv5JcI5yzawJMUYk7pfBdlxvA==
Received: from TY3PR01MB10028.jpnprd01.prod.outlook.com (2603:1096:400:1df::7)
 by TY4PR01MB16904.jpnprd01.prod.outlook.com (2603:1096:405:33a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 01:41:44 +0000
Received: from TY3PR01MB10028.jpnprd01.prod.outlook.com
 ([fe80::e9f2:ef57:2251:3a6]) by TY3PR01MB10028.jpnprd01.prod.outlook.com
 ([fe80::e9f2:ef57:2251:3a6%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 01:41:44 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -> 1.36.0
Thread-Topic: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -> 1.36.0
Thread-Index: AQHctfDeaW32L89xuU+z55bgHBoinbW91jYAgAEF/VmAHYVEQQ==
Date: Mon, 13 Apr 2026 01:41:44 +0000
Message-ID: 
 <TY3PR01MB10028AA9384F9E02304AD9BA29B242@TY3PR01MB10028.jpnprd01.prod.outlook.com>
References: <20260317093125.10898-1-liuyd.fnst@fujitsu.com>
 <03973F2A-A04B-45F1-832B-150E7CFE813B@arm.com>
 <18A0035F8B72A95E.57592@lists.openembedded.org>
In-Reply-To: <18A0035F8B72A95E.57592@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-04-13T01:41:43.838Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10028:EE_|TY4PR01MB16904:EE_
x-ms-office365-filtering-correlation-id: c89430b5-a365-4320-7948-08de98fdd1d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|18002099003|22082099003|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 lkOgy41MYgsruhubxIyh52N8ytKqF4aBwOELqkG/N48gZ94hMYbaL/4ZyNILQxoTvqUjq+qnK7DWuYqpoOM6LRNPviogmwtDCM/Mx1FR/MjZGfpStK0pkNDqQg4fMafgIeCrigGrzV3DqD/RqW8zC9EBKzE18N7A0oYRqMMUqM36LH1tB203MnjTa71VCGO3374lE9Bpx4e8IySwnrFar/q0n08rRY171JkWOZERfW3nUpX9JjjFhZjczWU8tyz8dfP0/6O37OJ4qA0fep1OQW2lcKTWcvfsTacEGonxDobAV0z/Vgv0+SxJqM8G7PCQvOB/17eVewSWF6U2LbFISam+c01aH6CSeg9AWBbKRueAAaPLwQulFDujLrSOsYnwABjeIiafwDp1KR7jbP1IDbogZevKMODzt28tuNuhYB2lXV72iM3AvCqAVvbDlDUDY75Qe+BWdxwZJq1oC0ClN9AKhnDJnfSPzdHfc+99acWfm7JlWVlZKUcrTnuSnd1TrZuhm1oDZ1gGzDOPTdTOkuZz/kUgC5E53TDcPhWshQkt71P+Sx+demiXc9lEKZ+Dmq3vw1ftApSRXyg9dLufCHM3AI6me/GVb6PdDmkDf2GipOesMlrjjvCNa0JQme//XUFFj0EJBKi0a4liW6JzLScJd5up+roV9JM/SA7TkovA0g6e3WxOI58dk+QheHhcVOfnq9LTMpj3WVgduC0seDczAHielEU1P8hLUVr6Ysu/s/geF3EJuUw1mS807xST21fa7GjXdsk9XxbuQHXLwKJdoc4lw3wV8qqivifU1rK+7/PZq+tcWbguQ0ayzZec
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10028.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?ZStTRnU2T3VJRmtoTlQ0dUU0Tzkza2x2c3k5NUJRMi9jWm93Y3B5NklXL05E?=
 =?gb2312?B?cDJyU3BmVU9YdTNmQS9tUXR5RWVKQUR6ZjZWSUFPWFkybGI1RGo2MkttRzNC?=
 =?gb2312?B?MGg3MFdZVFJQZUNpNkdZaTBMN0NWL1FlbFRJeWhVM1VGMkV1Tlhrb2lsWFUy?=
 =?gb2312?B?MUtpNjR3TkRtSFpqOVRNRXExTlI4bmYxbWYzR1JrVWZ5ODdrOWt0bVBUREE2?=
 =?gb2312?B?MnVmZ3NGQ0tGelN4c3ZRWGNaV0NxK1JKOE13NVhnOTQyUm9MMTV0NlJNaXVp?=
 =?gb2312?B?MldwTkQ2R0pCRnJIODhTMlJ5R0hmazNKajV3NmdnMnFDd29rMGRHSkZwY2hi?=
 =?gb2312?B?WTM5SDd3K1FVMkJDOVBML2hodmFha0pWY1NsL3BzZytjQnFoaUFyMldzZ1RQ?=
 =?gb2312?B?T3UrTHNtdTZjWGh3eExQcFhWc0t4ZGxvc291TFYzc09wc1FlbEhkeDFUbWJu?=
 =?gb2312?B?N3lSRWdkdzNySnNSR0FTZWxQTHVkTmNDclRZVXN2aWV2VGRyZ1hGSjNhai94?=
 =?gb2312?B?YktEdXJkaHZOSUdXZDlZcHdXWEpGUFhlQzlrT1VzVVZkM1BPdDNJbm9NUGVj?=
 =?gb2312?B?QjhwODAvdWhHY3YwYVFhVTdYemltNGJoUkkzWm43MDNYeGFaNmw1THVUZEoy?=
 =?gb2312?B?VmRtcklieFdob3NQblJGcG5TWGdDd2pEZE52SnVOUGhmckI1Q1lhMTJSUGlv?=
 =?gb2312?B?bW5hT0NRTEI0ZHk0cUFpZDdHRzRrMERZSm9SM0RNWUFxVzNEaGdLNGtHTnR2?=
 =?gb2312?B?L3dud2gwOTZBTkswN2dhMGMzbU5uOTc1c1NsTHRFN1drTmwyZ0pWZmZ4ekor?=
 =?gb2312?B?UzNpeWZqYUxxRURxQ28ySCtTRy9xTUlrOWdjNXdkSkdJU1RkSDZsSFYvN1Vv?=
 =?gb2312?B?emZYeFNIYW9leUdIMDBmVWNUaWM4a3FuQVNoSW9xNVlKVkdHNVczbTFPZEl5?=
 =?gb2312?B?S1hkZU1oTVJWcDBQMHBkUWRmWHU4dzlQdUJEd24wSWxSandXZnM2M1M4bE94?=
 =?gb2312?B?WjZIZ3ZMeDJ5eEhSSENIWHRpL1RoNGVwRVk0OEZkZ1lCTXRSSmlXSnNTSUtT?=
 =?gb2312?B?WklqVmZJUG5qNkFZenRZelFSendmU2tkR0ZnKzQxV1ZKdElES055TFEwTlEz?=
 =?gb2312?B?cEdLNjdncDRpdmh4S1NNc1RCMEVHZFVCN2VpWTkrU2Z1RGZjNHZTZ1RVR0hX?=
 =?gb2312?B?c1pPODdTa2dhNlRmbFJrd2xUOTN3TVUzc2hsNjdMQzNFb2Q2YjlYMlIrRm82?=
 =?gb2312?B?bTZ6ZUp3K3luR21KM0JhcTl0dUZQNEVJSFdXWUJ5N2NBTXE3Qm5Qd05aenFo?=
 =?gb2312?B?SHhlVW5tNTQzUVV3OWw2M3ZKcFluWU9hbHNFYlozamlHTnk3YVQ4V01GY0h3?=
 =?gb2312?B?RjZVY1J2aGlJcnNBWGV5L09mdzgxanRobjZqTEtDZzUwNEM3d28rN3dpWkYx?=
 =?gb2312?B?c0tTQ3pDY2c4QjhuNGNpLzEzU2FCeGxlckVWOStvdndtcGEwY2RTekZuL1pG?=
 =?gb2312?B?azFQUWJTdUR6Ri9VRTU4M2tSY3MyWDVtK1lLSzV2bGhrckhPb1A5RlZYeUlw?=
 =?gb2312?B?WFhsMGxjSFdJY216aDR6dUJWOU0vK2ovdDI0bUhyNEdrUDkvc2RaaVM2NEdi?=
 =?gb2312?B?NXp3U3A2Nks3R0xXcUNXdVlhUmM2MzNRbHg0YjRsMGRHRUFkbmhkMTh1K1g2?=
 =?gb2312?B?Ym90bGFBTU1aNUhWeTlKWDhwcTROQklkL08rUzlmQ3VQYzQ1dkZVZEt2NjVp?=
 =?gb2312?B?RytFS3creWRFV0NDZm52QUVBQ3R0VVZueVIvdllyVVl1QXRTeEVBK3AxYzZG?=
 =?gb2312?B?cWNKcGdiUExpWDh4elhLOXE3RU5VZktpR1hQUUNEN1daUHoyQXdGb1dDem9q?=
 =?gb2312?B?bS9qQmNYd1lwNkMwWUhRbXNBa3BvdGVjeGpvem8yQ3lZU0dodXpMM2tEbWhR?=
 =?gb2312?B?VHdhWlBNaW9RdlZMYzJmeWwreUF3SjM3cEtUOGs2V1I4RktCOVBVb2JTc1hv?=
 =?gb2312?B?bE9IOUtTZEtEekt2TTM4ODZsQThYZjBYRzJhaUNWa0JCV3pQQUlMWW0yZFJ5?=
 =?gb2312?B?RmluNEdhWEsrVVJpUW5uTXpVRjZnejVCOE14SXU3QnpGMjl6VnF6WVUvUlky?=
 =?gb2312?B?dTZ4ZE1lV2lWWkxyeUJRdVcwaVFuckRXclo5VklrcGhyK0FRc3VjSm9ENldu?=
 =?gb2312?B?WnFhOW9Ld01Paisvb2d5WDB3VXYxYnAreTJ4dXlMclRDM21DQVpVS3pPUkRs?=
 =?gb2312?B?UTB1Ny9Nc041NDR6eXZibVg3bG1vaU5Da0FaYTArcnFISERyQ3plMmxTbVNk?=
 =?gb2312?B?aFlSWEtYZnNGK3pDcjI4WCtHUXJNc2I2U0NoRUJ5OUtIb0NPUzMwdz09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10028AA9384F9E02304AD9BA29B242TY3PR01MB10028jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	opsZKtezDW3NnpN9H+TxUxa1fvNv6LvMZj8oSGTef9ZkkY2g2F3/ZmiythvamAA3iRd7gb7aicfOKY0kF9eH/pF+PJ/QM5HN3pL+oxVKQ/PAVrSPdc33d91OXn4emIeA/fXTVkSwpz1vgZyRLTrnkPGDGB5LBYzZ6fj3tG8H9HUv80V7O7kOX5TygLjdcrjn80vaXgF5tD2PzbPd8oenUhsZlgpYPyUcdJBAkRDkZt6mCRzsp8+F5VulTJGE8wevz9sWvqWQrMkAzZYHkpXbZb2G15HmCLvGhqr1NJf/Y02xsflggaTuoGDoFn4WkfLZjU02+jM8LmtKHqI3NhTfZQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10028.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89430b5-a365-4320-7948-08de98fdd1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 01:41:44.7634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Be3+xt8cGjamG3gCAeirwxnjut37IDtHTZOQKLQpgOo64KM+VkQzrmxKJ6wDFcR0AhwJuc7KEwAtoOwnCxoQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16904
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 01:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235077

--_000_TY3PR01MB10028AA9384F9E02304AD9BA29B242TY3PR01MB10028jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gtPqx7SBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0Kt6LLzcqxvOQ6IDIwMjbE6jPUwjI1yNUgMTQ6NTkNCsrVvP7IyzogUm9zcyBCdXJ0b24g
PFJvc3MuQnVydG9uQGFybS5jb20+DQqzrcvNOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
1vfM4jogUmU6IFtPRS1jb3JlXVtQQVRDSF0gZ3RrLWRvYzogdXBncmFkZSAxLjM1LjEgLT4gMS4z
Ni4wDQoNCkhpIGJydWNlDQoNCiAgIEkgcmV2aWV3IHRoZSBtZXNvbi5idWlsZCBvZiBndGstZG9j
IDEuMzYuMCBhbmQgZmluZCB0aGUgIGRlcGVuZHMgb2YgcHlnbWVudHMgYW5kICB4c2x0cHJvY19w
cmcgaXMgbmVjZXNzYXJ5Lg0KDQogICAgcmVxdWlyZWRfcHl0aG9uX21vZHVsZXMgPSBbJ3B5Z21l
bnRzJ10NCiAgIC4uLg0KDQogICAgcHl0aG9uMyA9IHB5dGhvbi5maW5kX2luc3RhbGxhdGlvbign
cHl0aG9uMycsIG1vZHVsZXM6IHJlcXVpcmVkX3B5dGhvbl9tb2R1bGVzKQ0KICAgICAuLi4NCiAg
ICB4c2x0cHJvY19wcmcgPSBmaW5kX3Byb2dyYW0oJ3hzbHRwcm9jJywgcmVxdWlyZWQ6IHRydWUp
DQoNCiAgICBTbyBhcyBteSB1bmRlcnN0YW5kaW5nLCBJIGNhbid0IHNldCBtZXNvbi5jcm9zcyB3
aXRoIC9iaW4vZmFsc2UgdG8gbm90IHVzZSBweWdtZW50cyBhbmQgIHhzbHRwcm9jLg0KICAgIE9y
IGRvIHlvdSBoYXZlIGEgYmV0dGVyIHdheSB0byBtaW5pbWFsIGRlcGVuZGVuY2llcz8NCg0KTGl1
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IFJvc3MgQnVydG9u
IDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0Kt6LLzcqxvOQ6IDIwMjbE6jPUwjI0yNUgMjM6MTUNCsrV
vP7IyzogTGl1LCBZaWRpbmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCrOty806
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBSZTogW09FLWNvcmVdW1BBVENIXSBn
dGstZG9jOiB1cGdyYWRlIDEuMzUuMSAtPiAxLjM2LjANCg0KSGksDQoNCk9uIDE3IE1hciAyMDI2
LCBhdCAwOTozMSwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGxpdXlkLmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IC1QQUNLQUdFQ09ORklHW3dvcmtpbmctc2NyaXB0c10gPSAiLCxsaWJ4c2x0LW5hdGl2ZSBk
b2Nib29rLXhtbC1kdGQ0LW5hdGl2ZSBkb2Nib29rLXhzbC1zdHlsZXNoZWV0cyBweXRob24zLXB5
Z21lbnRzIg0KPiArUEFDS0FHRUNPTkZJR1t3b3JraW5nLXNjcmlwdHNdID0gIiwsZG9jYm9vay14
bWwtZHRkNC1uYXRpdmUgZG9jYm9vay14c2wtc3R5bGVzaGVldHOhsQ0KDQpTbyB0aGUgd29ya2lu
Zy1zY3JpcHRzIG9wdGlvbnMgd2FzIHNvIHRoYXQgaWYgYXBpLWRvY3VtZW50YXRpb24gaXMgZGlz
YWJsZWQgdGhlIGd0ay1kb2MgcGFja2FnZSBoYXMgYSBsb3QgbGVzcyBidWlsZCBkZXBlbmRlbmNp
ZXMuICBXaXRoIHRoaXMgY2hhbmdlLCB0aGlzIGlzIG5vIGxvbmdlciB0aGUgY2FzZS4NCg0KSXMg
aXQgcG9zc2libGUgdG8gc2VlZCBtZXNvbqGvcyBzZWFyY2ggZm9yIGNvbW1hbmRzIHdlIGRvbqGv
dCB3YW50IGl0IHRvIHVzZSB3aXRoIC9iaW4vZmFsc2Ugc28gdGhhdCB3ZSBjYW4ga2VlcCB0aGUg
bWluaW1hbCBkZXBlbmRlbmNpZXMgd2hlbiBub3QgbmVlZGVkPw0KDQpUaGFua3MsDQpSb3NzDQo=

--_000_TY3PR01MB10028AA9384F9E02304AD9BA29B242TY3PR01MB10028jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org &lt;li=
uyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C225=C8=D5 14:59<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -&gt; 1.3=
6.0</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Hi bruce</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp;I review the meson.build of gtk-doc&nbsp;1.36.0 and find the&n=
bsp; depends of pygments and &nbsp;xsltproc_prg is necessary.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp;&nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; required_python_modules =3D ['pygments']</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp;...</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; python3 =3D python.find_installation('python3', modules: requ=
ired_python_modules)</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;...</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; xsltproc_prg&nbsp;=3D find_program('xsltproc', required: true=
)</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; So as my understanding, I can't set meson.cross&nbsp;with /bi=
n/false to not use pygments and &nbsp;xsltproc.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt">
<span style=3D"color:rgb(0,0,0)">&nbsp; &nbsp; Or do you have a better way =
to minimal dependencies?</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Liu</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Ross =
Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C224=C8=D5 23:15<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -&gt; 1.3=
6.0</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hi,<br>
<br>
On 17 Mar 2026, at 09:31, Yiding Liu (Fujitsu) via lists.openembedded.org &=
lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt; wrote:<br>
&gt; -PACKAGECONFIG[working-scripts] =3D &quot;,,libxslt-native docbook-xml=
-dtd4-native docbook-xsl-stylesheets python3-pygments&quot;<br>
&gt; +PACKAGECONFIG[working-scripts] =3D &quot;,,docbook-xml-dtd4-native do=
cbook-xsl-stylesheets=A1=B1<br>
<br>
So the working-scripts options was so that if api-documentation is disabled=
 the gtk-doc package has a lot less build dependencies.&nbsp; With this cha=
nge, this is no longer the case.<br>
<br>
Is it possible to seed meson=A1=AFs search for commands we don=A1=AFt want =
it to use with /bin/false so that we can keep the minimal dependencies when=
 not needed?<br>
<br>
Thanks,<br>
Ross</div>
</span></font></div>
</div>
</body>
</html>

--_000_TY3PR01MB10028AA9384F9E02304AD9BA29B242TY3PR01MB10028jp_--

