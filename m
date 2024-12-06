Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F1FE77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 14:12:11 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.51])
 by mx.groups.io with SMTP id smtpd.web10.37736.1733494326359501109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 06:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=ndxOnnwQ;
 spf=pass (domain: infinera.com, ip: 40.107.212.51, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNCfjpNYwynBk2Wf0qUi+PFUV8VbsfE+oBz9lBA5M+YZ3gD7A+0fDJ9IltaI7QxDrLcYIrdNdUpjrlfQ9vnlJqawwqZoDT5pNjlov6XT/JVkShvgrojLGWzXD/v6u9S4HrB6I7rDTzlLLawB769YjYppbQTctr1788Y+siF0dIiWcgUM+wc5AETFw1zMrpPNtuHvhoj1zgU6MArAQ1xDJ//lgtb7hvrH6hk6CvUjO9AYIiatdP8fAu3xioRF0j2hmGqjZf5Xcpn7w+17buQujKjvsfZ8hdsZk8sHqH1DKYZoNuDC4xQ9WdMTWOtcQdbG3Wqv4QgFaRBCwFWZShJcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2BuhOQ3kzmWbXZhOMfS/ND9tEmuIAx3SNu2ufioiC0=;
 b=fYtx2nTIfc1VI2BGwk+5TmbE/E06Bt6W1ya7D8p4dk46zTYstz8ZAEUB1870NWqF0L8DZFlFhbstK1PmyTCVttTsuG/d4oZYUEsY1ntXQbZrL1pxMOAEiff6ahiwDrSE4AWqRsbhE7v6myUiPotpuZpdOKkOeGVKG8yIGLqOURdbnegVe/9gQ4q+qvRJIoGhDXBQNsWnfG3p/iJ9/CRmo5nDg3MLdomIm8dossgtt/XOQHFP+e2id6/IVieecI3J1fwJklxCrXTPEFCk9ybSOOCAOFlDJUBPtWR1vGoY6v7qd5OiTrb3im1m7zCvmOBs5i3Er84WrNRF0wg+gVN0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2BuhOQ3kzmWbXZhOMfS/ND9tEmuIAx3SNu2ufioiC0=;
 b=ndxOnnwQdjZ7iOlXK985cHCcwPe2WDHTYonz3t4cy+YCwpJT3BBNMqjCtlv49KUii+81pBDTbTf6KdtCYwIX7rfD4iJPcr1w7dHKJidR5Kv4FrUhbFMIWWaatIynIAylc2F5QKkoKHEUVTqvjpwIIQKfj5Ael29DwNTA+ggCO6imJY6liW/hyCh0dsiim9nTrfYRT+wZoxFysjXeIMpbFrcM2/RjkOSuU2ws0xiFmwFt06LTzRx7zAqaz59RzFIEieL2y8NGVhGDPPbFErxbYAX942O21Km5LlCvSCjqx80XtMsdHZpPpR83oEbPMxnwsDaRY0HWxZsxTIVUcZw5vQ==
Received: from BN7PR10MB2610.namprd10.prod.outlook.com (2603:10b6:406:c0::30)
 by MW5PR10MB5739.namprd10.prod.outlook.com (2603:10b6:303:19c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 14:12:03 +0000
Received: from BN7PR10MB2610.namprd10.prod.outlook.com
 ([fe80::c5b0:801a:5214:f38b]) by BN7PR10MB2610.namprd10.prod.outlook.com
 ([fe80::c5b0:801a:5214:f38b%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 14:12:03 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: multiple toolchains in SDK?
Thread-Topic: multiple toolchains in SDK?
Thread-Index: AQHbR+jSP/qW2YvNrkmaXHFWf0Mh9w==
Date: Fri, 6 Dec 2024 14:12:03 +0000
Message-ID: <fbe1fa4c9130903dea41d988dac28af5ccca9de1.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR10MB2610:EE_|MW5PR10MB5739:EE_
x-ms-office365-filtering-correlation-id: 7cbf8fc1-681f-4117-ec77-08dd15fff53e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?T3VPRWRWdDFKbExYRlhhYkUxMlhzUmJPb3lmaGc1ekdFblZQVjJxajFzZ01G?=
 =?utf-8?B?R0l3YjNRd0dVTFZYclRDSXlZSWFIOUdSaGZMbHVUMFhRdXl5TmY0Ujd0cld4?=
 =?utf-8?B?dGJZMHdVZWMrN0QzblBHVDRrdEF1ZkVZSmJvNVY4WkdvbHJ0SXpHdUlTMTRD?=
 =?utf-8?B?enJTNnVqVWY3Uytwd1AwZUJKWlhSZUJpVmNHelVPQjFsZDNJckZCNlRJTHBF?=
 =?utf-8?B?SzA2eVF0bjYyak5kY2owejNuOTdmQ1FhNGpBaEV4VlFpN1RpOXk4TWtkLzhK?=
 =?utf-8?B?a21WL2MweWVuU29zRWtQdHBUd2UzRi9QS0xIcHh4cWdQU0lhV2tmRDdtbmov?=
 =?utf-8?B?NGZMOXBVdHhmYU1ZaW14RkUwSjlJNEdXVzJTaGh6dmlWRUxZQ2xYNlFhOUlt?=
 =?utf-8?B?SWJ4dldkU2lMSDNPUUVIeUIxLzJrTElQODBFYy9oa3lyNjlkT3NkVFFUVE9z?=
 =?utf-8?B?cnFwT2xBcnZSR2pWSlcxeFZkZG13SytJeFVWc0dOTmtQY2lPUkRCd0NIbXdH?=
 =?utf-8?B?WVIySE9WVGgrYW91QjU5K1d6NEY5aWUxMzRoMGJRQ1hBNlZKaWlUMmFHTzY1?=
 =?utf-8?B?MU1TSXFCTktSVVhNYkVqNWk4Y3Uva0ZMQkpqQkZmR0V1NlFyVGNzcU95MDFk?=
 =?utf-8?B?ZEZxeG5JMlhRRll5RVZsL3djNU4xbHBEQkE3d1FIUFZhaWdESGtLME1xZGpS?=
 =?utf-8?B?c0Rua0s4eGtidGwzdTc3SCs0WGplVUxyYmdHZEdwVjJiaC95TkJQRE11UEh0?=
 =?utf-8?B?UnZJMnM2eEJYUTZDNy9UTVppYlFSSE40ZXdNWHJadjFmT1RZVkJtdWxNa2tU?=
 =?utf-8?B?ZlFIeWVveHFOMzVPbnVueENyamVHbFc0cEpPN2FHd2RuSHp6R1JVcWtCVDZp?=
 =?utf-8?B?U2EzNnJIYTZBbVRoN1QwbUpmV3prMDQ5QjViK1RKeS9jVTFEdk9wMUhsRldy?=
 =?utf-8?B?QjUrbHBieWlreElQbzRNSTdBcTg0VitqVitTcnNxTzR1OVpTem80bnNMV0kr?=
 =?utf-8?B?S2FTUHN6cVBqamp6MXRYY2xjd3loLzdIRDczbDFSMGVEWndId05IM1FKbVNG?=
 =?utf-8?B?dXlRRlRqRU1SK2lkdE1IUGRlZTNoQUJWWUtCcXF5SlpPeGRWTkVvUUd6M0d4?=
 =?utf-8?B?cjE1N0RibzVZQVpTbmVubk5NRndzZDJaMzFuTnh5SVpVbU5GQ3A3MWpIS0JO?=
 =?utf-8?B?aTJpeElUUXhObVAvUDdmb3AwLzVyZVI4NlU4ZWM4b2dId0RsdklkOWp4Tisv?=
 =?utf-8?B?N1dmSzd0enREeGpMbEhGQjB3UFNGTHpBSmtEVFl0bmZMWFh3RW1VWW4ra3Nv?=
 =?utf-8?B?OEVXMW02di9tc2N0cVE1Q0F3UllBaEdLb1RGQmhKVXk1Vng3WGNiZllkbmwr?=
 =?utf-8?B?VHVNVFc2Mmo5d2diM1dmb2VHbkRCaVBZbkQ3a0NUQ3hmTkZtQm1pMXBjaURG?=
 =?utf-8?B?WEIzYi92cVJVNWcyWERlc1d0bVNxN0J3eXAvTkFQUmJqdTNOV1V2dW15alpV?=
 =?utf-8?B?OW5ycjVDV25zTHhuUWlleTMvbHQya2ljSkx0L2plTXlsZ1daSDlzRFpNbVJL?=
 =?utf-8?B?YTVrQzFhSGJGUEJVR1k5RStkQXhIQktIdkx1dzRPdDNaVG84ajR1NjBPaFJE?=
 =?utf-8?B?UWhzN05iQko0QlAwMFNWV3VhQVZHMGdBNjFEOWVLVkhmaEVOc2VjeDVCT2J3?=
 =?utf-8?B?YzZab3BYakhsNGJVNmJtQUI4bzlzOUhNdmxWclZCTWk0cEQ5UERuSEpaUlpV?=
 =?utf-8?B?Mk1Nb1VWaFRpZmlKdytYTTBqanU4aDZOMFBIbTRsRlVMM1ZacWNqcWtEOE54?=
 =?utf-8?B?MXgxN2FIeVdhNkcybDFnOVBzZjBzVXk3YkRnenUwRmFjbFRybG5ZWStRWVBm?=
 =?utf-8?B?anMyeWUrMlhwM1JrVUZxNHhKRUJmR2x6Z1lLbzk4WnVaSGc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2610.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RE9hdENJMzV6RmtvZmVEQnFBL3pWS3JvZTZER3V4d0Frd0JpQldxQTVoZExi?=
 =?utf-8?B?SHZLSi9iT1pTZkhrVlIyVUcrY2E1dHlEb2JMazhpVlc0bndIMkw4WWp2ZmRv?=
 =?utf-8?B?a3FjWGFPeUJjUGxqcVY0RzFpWGpBUHd1RGpTMWhJY3B6bXdFajc3Z2tBZzlD?=
 =?utf-8?B?L0hMd2R2UzMyQ3BKQWFTeUR2MzZXVThUaEIrQTFqRzcrckZmc21OTC85L2I0?=
 =?utf-8?B?Ly9xZlBUbWJRY2hxT1h3TFp2U2VQQWhzcWtxMzVRL0V5TEo1VEt5WlhCR3Fw?=
 =?utf-8?B?T3hQNXBMMVJaekFSMFFib2QzREdFUWppVEluVThBZTd1VzJ6RVJidXUrYXNa?=
 =?utf-8?B?YUtsSkhKaXRXYWsxTGR1dDJxRnVEQ2EyaEhuaC92WFBYM2xvRTFjbW4xTFhT?=
 =?utf-8?B?R21KbjhBSXNkTnhuNFdhcUFwTG1VZmg4WndBRnBXUmU5OWllQWJoUytyelZQ?=
 =?utf-8?B?dTJiVktybXYxZWtvRGVrUEQ0NkJISXZhS0dZV1dNVmxpc0lWZmxJTzZOVjR3?=
 =?utf-8?B?VmlXVnkwZmhlYy9YZmJqNGFKQjREdjk3NHk2c1VEZjFLc2t3WEpwTHpzVlow?=
 =?utf-8?B?OTFQSEd1SHRPQnVnYnhMTkNqSTBoeEFLU2dRd0dWUzhxcDRwRnUvUmUyTkVN?=
 =?utf-8?B?U1ZBVTJueXF0ZzdEem1aTk00Z2pFZndIM2g1NVFVWU9vREtDTDd2VWFSOE93?=
 =?utf-8?B?ZkV5L2RrSlN4MjhrNHZnUjhMc0d3b1VuOUlEbVZ0TGRqelc4ajJvZjlNNHNB?=
 =?utf-8?B?NTJDQWIyTTUxcVpWOGFIdlF2b3JaS1NnZXZ6VXI2VEdPdnRoNmppUXJuM2Nw?=
 =?utf-8?B?MUQxMm91eWxwbDdoNlFFN09HQzh1RndaUDJ5bUlFQjVmbnJhUU1hbVNsTUJs?=
 =?utf-8?B?UE9mc3pXaDlqeHhzV0U2SG9KRDZySGxKbG00SHFhWFpvdEpES2piVUhoN1Bi?=
 =?utf-8?B?RCtTbEI2SDBxM0gzTUYxS0M1cnZNdXFUWEtMdDUyZXAvRmtXVDA0Sjl6R2Qv?=
 =?utf-8?B?TWJqWGRjMFBWck1jR0JjaExPaVQ5cGdWZ0tRU3dKVzQ1YkhHME0yTi9EMVZj?=
 =?utf-8?B?V3BrODR6RUNjQ0VnQ0xybHdVN2N5MW1aNVZIK0tjdnhJMCs3V2lmYk9IWHY5?=
 =?utf-8?B?bWFGeUk2ZUdmNU9mY1NuWnJyMWw2SUN0aEhTNUYzMk1RSHBmcG91VmUxUVIy?=
 =?utf-8?B?azFFa1hXeExiUDhFNWZuQUxPWTZLRWRRY094dHozSEhlYnVjOUxHUUxMNTBm?=
 =?utf-8?B?eVl0TDI2K09JOEdvdnVUTk9nOFBuWWhoVWdaZzBzZ0pJd1lPY21UcEdkL3pa?=
 =?utf-8?B?aEI2bTF5c2xVUTBTV0JRZWdybldXbEtvamJUbFNsUWNKckhvUUxNY2RuWTVj?=
 =?utf-8?B?dTBFa1pJcWNDREd5elE5S1NzNkRxWjhJK3RmQ0dNRDhxeVY3RVhUUURCWW02?=
 =?utf-8?B?SGZkM1NNbVkyczkrWXR3d0JhTzhBOWg3QlhIMldZcDhobGhaNVB6ZGF0MURR?=
 =?utf-8?B?SHdPZUg2NEJhRmg5d1FkUjlSbjdLNHRUanNNTWNROHZhTGRhOUpvT0d2NURO?=
 =?utf-8?B?cTZFNDByb21ISGxWRXhBTElKYlN4S0x1NzdKN3ZSaVdhVXBVbXphUEVuV2Y2?=
 =?utf-8?B?VWNGWTBsYW5nemxuRDNTTGVXaGJuK0Q4UDByUWl3OXZRb3FuODdMajV6YXZ1?=
 =?utf-8?B?VUFWbjl3eUpJYkhwRy82RXY3aWNXTHRhcWt5TTVFeGJRT2xDRFVXZXVxRlBU?=
 =?utf-8?B?cGd2bzlCQkZUaGxNbWtNemRNRGRJaXFLbmwvQjcvSG1PYkhWVTZ5WEFqWXl4?=
 =?utf-8?B?UzdBM083MHlpUUgzUlo1NURwbGJyQUptbWhVdDlFLzQ5bWh3Q21wczFHUU5X?=
 =?utf-8?B?NFExV3l1ZDJJaXQwMnZnUGcwaWEzVUkyMXFXekxqWG9hcG9LK2ZISVd5QjZS?=
 =?utf-8?B?M09kNXBORzhxMDZKckVyQXpCUE1sWXdVSnBRdmdzWE13K0xMd3d4Um00cnVV?=
 =?utf-8?B?RWovWVBKeE05SHF4ZXZnekFLa3M2TjFQdGc2Z3p6ZHdMV1hQUnFJbXlVZDh4?=
 =?utf-8?B?S1FGZlhMeTJ2SkhJcE5JT3Y3bjJJc1R1TWJpYVdqaTlneFY4VXNYVlZFUHhi?=
 =?utf-8?Q?WmBsGnlJV3Y2Cpgb6LTfhYZSS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54E4662C10AC11488A72B4389473D2EF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2610.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbf8fc1-681f-4117-ec77-08dd15fff53e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 14:12:03.1367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5O+mwt4FyuIQwTz+gYIp096DfGSuK4CneHeNz+Sfc7pOlTMRcPiNW32j2IV5UsBai0iIEzqETPzMKHyy1Cq2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 14:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208427

VHJ5aW5nIHRvIGZpZ3VyZSBvdXQgaG93IHRvIGJ1aWxkIGluIFNESzoNCiBnY2MtYXJtMzItbXVz
bA0KYW5kDQogZ2NjLWFybTY0LW11c2wob3IgcG9zc2libHkgZ2NjLWFybTY0LW5ld2xpYikNCg0K
d2l0aG91dCB1c2luZyBtdWx0aWxpYihhcyBtdXNsIGRvIG5vdCBzdXBwb3J0IG11bHRpbGliIGdj
Yy1zdHlsZSksIGFsc28NCnRoZSBhcm02NCB0b29sY2hhaW4gb25seSBuZWVkcyB0byBjb250YWlu
cyBzdGF0aWMgbGliYy5hDQoNCkkgY2Fubm90IGZpbmQgaG93IHRvIGV4cHJlc3MgdGhpcyBpbiBZ
b2N0by9Qb2t5LiBBbnkgcG9pbnRlcnMgcGxlYXNlPw0KDQogSm9ja2UNCg==

