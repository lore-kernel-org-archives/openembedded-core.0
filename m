Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18474C10F1A
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 01:19:30 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web10.2912.1715303964246426223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 18:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=RR6wcCHP;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1715303964; x=1746839964;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=AGGEKF1flt65igg9O9SgjQvRpj0pf/+Am1YQ7UAfaWE=;
  b=RR6wcCHPz+1UcURJx1Y+B5VcIccvYWCpc82PijluYLI29XfrHLXepNOH
   Soc8SKvPi45gZGhBqtOLc5TJcCqDgg/CUwqhFICQKkm2cD26VRajEB6Ho
   eAaeOjPwIZ07HlJDjl7PJ/E+JkcMh+zsX54r0Wcy/ZlrM0qZ3WA/aVcEj
   yZsfMEalatZdoNqz7LqRFfwHvopvDyrIZQjVOWkKrLrT8PYaFfT07FgfB
   si7BZJpwC7AlJXhmAwLykFeCVwQrUKuiV6OQS3Xg45qSrS4U1T6vkF4Vz
   4+1DqM9NWdMsgSwHmFVz+uMOxK7ilQG30JoK3xKYiP8y5ckDXacYABuqc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="30143126"
X-IronPort-AV: E=Sophos;i="6.08,149,1712588400"; 
   d="scan'208";a="30143126"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:19:21 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzfdMBTIKoZi1A0cFomPpJ/EBsIn+PuZjIj3n+E6Tb4H1W9evu7NUZfRIe8b48nb7LNlq7fYq/e2HE+Fx6hvb1YrXeIKpucCkW7l4tguyqUVvqhqvg6OMCEcPp0jXmmwC9srzyHMFz1T81A0sFQLCnkiHlVQvjrehxPSeKW1BSJ2kRCq0HxnsPfZzPBBWtcgMFxjHGYY3RZjTP1RzFkK4aAlVN/g7iyQRncSetgIzUMeK6A/TkTL7jtJhI9BWtdF06HxZMAEOeHMjFsM52t4zUMAbR+tANpeo9v9D3MHsM/ULKNXTCctLkzCJ9iXfRI8+6UylM8DFISSsz5032lIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGGEKF1flt65igg9O9SgjQvRpj0pf/+Am1YQ7UAfaWE=;
 b=odIjQGHxIz2B1earU4YIMkD2TDjOy3G4HMxfJPE1Qqf0yNpk1NfF0qgNJhV+vAPwU9HThAZN4hI/TXwAjB/QCTiA1yl0U+S6rZ47nDxOZRgS4Fi1JwsxhdapZufEPDtPSlLnUz1aSsLLY4Ha/oEtBnIRhfIAVUR5ML79X4zj/6AsYxYvMS7jeH40NJt1A+lQOwXZ/aDDfOGX/rt3NBuGQ8RsiC9C9x/BYNRP+UhzkqnDAPuVLA9zaoe//t5U/2ApMf8Cm3+/s7B4h0TfKTkoxJDYZn7s4AZsLAgeNYruEKfBPQchRvEa05gvqM05yrHDXQ0Pf9z1dbL7Vyq2EuKxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB11055.jpnprd01.prod.outlook.com
 (2603:1096:400:3a7::12) by TYCPR01MB7011.jpnprd01.prod.outlook.com
 (2603:1096:400:be::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 01:19:17 +0000
Received: from TYCPR01MB11055.jpnprd01.prod.outlook.com
 ([fe80::8f61:e5a1:af60:d8a7]) by TYCPR01MB11055.jpnprd01.prod.outlook.com
 ([fe80::8f61:e5a1:af60:d8a7%6]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 01:19:17 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when
 enable multilib.
Thread-Index: AQHamthAA1WlsJSKE0i8b52cEJCNw7GPumSg
Date: Fri, 10 May 2024 01:19:17 +0000
Message-ID: 
 <TYCPR01MB1105524607983912E618C3F2FA0E72@TYCPR01MB11055.jpnprd01.prod.outlook.com>
References: <17CB016975A375B8.19032@lists.openembedded.org>
In-Reply-To: <17CB016975A375B8.19032@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=8e0496ed-04e7-4440-961b-3aa628e5880e;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2024-05-10T01:19:01Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11055:EE_|TYCPR01MB7011:EE_
x-ms-office365-filtering-correlation-id: dd969426-e8d0-4ce7-ae06-08dc708f3646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009|1580799018;
x-microsoft-antispam-message-info: 
 =?shift_jis?B?cTVWa3JrS1FhWkpOMlczeU5rTTQ2SGdWNzJEb09kOVduUzJSRS8xd1dG?=
 =?shift_jis?B?THdWNGtuRXFkQ2hJOXBlSG5BM2tqMEdvWjVPZ21hZFdKVnk1QUZjc2Fn?=
 =?shift_jis?B?c1dYc0RpNGlGbjFFNnZVZ0JUN3J5bDJVNnhoaVBEMHpKQU9VUCtZbWQ3?=
 =?shift_jis?B?SWpZbWd3NW9ZdzVkMjRaci9VOC9kQUs0VWs1cWExM2VjQWVXaUZQRGxo?=
 =?shift_jis?B?ZGtGSkFhbDM0UTVqSUh6RXVGK1ZaYWNOazY1S005MHBXb0J2NVZVaVBT?=
 =?shift_jis?B?dlY3ajJrNkNOSFkzZlBsZ1EwRUdabzl3WG9GV2NqRlEzRnZIaDR3Rk04?=
 =?shift_jis?B?ZWRPajVQMmR5bWJjR2xDUDFwM0FBeXRrZjlkMm90UnRGRjk2ZDJTUWpi?=
 =?shift_jis?B?U3BhSW9lWUI5WDhHWWtKdW5BMG02am44TGVOS1ZwWHpwVnVnYkVZRnhI?=
 =?shift_jis?B?UzZsa3h6SHZuM0RFYWQ4Sm5wZUxIV05rRlk1V0kwSGg1TGtQbjIwdGY0?=
 =?shift_jis?B?Z3BMWVB5MXI4Qzd3dDdUN2lkYjhSSFRkWmtlNnA1YVZDaUZtbFNaVEY4?=
 =?shift_jis?B?MUJYTlIvNEYzVTBLRjhjckZ6aE9XV3F4Q0RoQmRFV25ucWp0Qmxyd1hk?=
 =?shift_jis?B?VDMzdmVuS1dKR2pMeUMxaWpzSlFzRXF5aHhrSlVlVThFRGwvWENiNFN0?=
 =?shift_jis?B?b090a29wTGlvUXE1U1c2Y3dubTJEQWJvZ2NaMlV0T290clRMMXVUdDRy?=
 =?shift_jis?B?ZUplOFA4S2xJRkZFSTZLeU9uRmFEMHlTM0pWN1IvOWFOeGJMVk5OQnBF?=
 =?shift_jis?B?clExTkFoKy9nTTlxR3VxT1pDaXNDNm5aMXp6S2hvdFlndC9yajM1ZlQ0?=
 =?shift_jis?B?VnJGdjNjV3ZmNHp3d0w4amx2MFJmRzBTd21GMUVJSGN5bllBcFI0VERU?=
 =?shift_jis?B?N3VjcE5BNUdFWmFSM2dqY1FrN28yQ3FmNnVNV3g1ek84Vkh5dG5WSENh?=
 =?shift_jis?B?a01wTEpXaW1VWDBQWUtpQVA1aUE1Q1QvU2xsUlhZRW1xSVYzbFZhM2FE?=
 =?shift_jis?B?bHg0b1dEZDZERTEvcERQc2NtK3NOOWZkZXNXLzhiOXVDVXhyYngvU1E2?=
 =?shift_jis?B?TG9xUVFIcE8xV0RSVmVZSGRxdTVId1NTVi9ZWnhkK0x4TDBYMUdsYWlk?=
 =?shift_jis?B?c0NGVmJNaUduU2pwU3VjUTJDRjZiaXZXcG5RN21pakZQWnJCZ0paVzdw?=
 =?shift_jis?B?NWJlUEk2aGVvWW12S1o3dElmdFJDR21GZktXRHAxdjM2a1l6d3FMQWE1?=
 =?shift_jis?B?bjJXSVRoRVBPSlhIQVREUmVKS2N5Y3JkRW9zSlh4Nll6ZW5vKytNZ1RW?=
 =?shift_jis?B?akp6WklUbnVWSmUwSjBqUU1lSk1sbENtN2Q1bmtjbGk3Y2QwT1pPRTlY?=
 =?shift_jis?B?TTFGakZxNTdyWTJaZU5uT1p0WWRMWDlOS1prUGdEVTBGaSt3eU5CR1h4?=
 =?shift_jis?B?NWYxYXFRZXh4Rkc0U1JCMURJSXd3Tm9GOUFNNEVtdGhaUDF3Nk9GNjQ4?=
 =?shift_jis?B?cGFLNGtVZ2FhOHNJWW13UUMvRnBZNzBObmhRMXNoanhUS1UxUlNGSVJr?=
 =?shift_jis?B?dVhCclZVelBCbis4aFQ3T0p1aWtqbkN1UDVVby8vYXhvUWV6T1FlR1VW?=
 =?shift_jis?B?bjlpQ1p6YmxKanZXUDRLdXc2Ti8wNklBMnNTNVlpNkFEdnZtTDc2dlUw?=
 =?shift_jis?B?US9UZmI4Y1pJeE1UMnNweklwZW42U0xKME8vQ0VLTDZZT3lOV3lDeWlw?=
 =?shift_jis?B?K0l6OXI0Q3F0aldaNEtjaGowWGxPV0ZWM0VGaGs2YW1OVVpRNStFSUQz?=
 =?shift_jis?Q?7X4SJtnWR/mivaUB1Xo2R+3xjRExDxO/iMMzhasXXl?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11055.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?shift_jis?B?cWREdVdLempyaTRqd0puSVl0MWcyRnUwcDcyRXFsQUIwVitFckF0Z0wv?=
 =?shift_jis?B?VTlTbXBGM1Q2ZUpjYTd5NnRlRzNXOVpyUWpkMlk4Nk5wTWZtKysyNUNI?=
 =?shift_jis?B?ZVpIbVNYTnBZOU10RG9Hb2syVmhERHpWSld6RWlONmJrK3NUMzkxRlF4?=
 =?shift_jis?B?NEhGdkVtSGF2S1NQTitXb2E0ajF2T2d0eWhZUFl5QmZtS1RzckhUMWt5?=
 =?shift_jis?B?dW5MRC9rQU1IRHdkN0NHUzBTUjdoZG5nL3I2N1V1NTB6UitqcjFORFI5?=
 =?shift_jis?B?L0NUc0hTL05UOTc1YmpDSnpPVitpanBPV3kxdFQwb2g0eXZrUWVDS1p4?=
 =?shift_jis?B?SmpNMFBJWmdPRG9jQXpJeG0zVHNTVjNYSWJMV3BETVZiNmhnNHlleDlN?=
 =?shift_jis?B?TFFMWEpnSkNiL3ZCVFlURzdKeTl6d1JhSU14SUt4Q3JMQ3ZMNlJpVnRp?=
 =?shift_jis?B?WmtFRmdCRUdUZ09pT0tlRzQzclY3cmQvd2RXQ3pIdmw3V2Naa3I3aWVs?=
 =?shift_jis?B?RnZTWmtRejJIaHNWYi9PNngyQ1hJbk44bUZTUEgrN1FUWnlrVlNjN0Vl?=
 =?shift_jis?B?ZlM1TlZkcUFmclhJK1FiYzgvQ1lzOFZFcGVjcjd2N1J5eDJMckpnZmJm?=
 =?shift_jis?B?R1FBN3NMZUcrWnpDeWJRWHpKaUR0MHFUSUxEaUJ1QU1CM3JKSGt1VlY3?=
 =?shift_jis?B?bHp6Z08xSmNVL0R1UnMwbWlTM3huQ083Wmp2TUtHL3JNKzVKcVkxL3Zq?=
 =?shift_jis?B?SlhPenZYc3FaWG0vdnZKbG5WajlMZG9sNGJPeGVWVHRraElnSjRicGFQ?=
 =?shift_jis?B?NlppcXhZaE1CL0pMNEZQL0pROVF0dmRuYWQ5aDZrWUpZTHAxM2hpbFIv?=
 =?shift_jis?B?dWFYbXRjSTNhWW9YaXNlcXB6UjBrVVBZVGFyQTBtc0ZQZGZnbXM2bnd4?=
 =?shift_jis?B?azAycEhQOHVITnlqanJQZGtGMU13MzhSZFNwQlhpMEZjYldsZEgvMTky?=
 =?shift_jis?B?OFo1SGhyMGVIMy9aWWY3ZFZMM1lVNi9YbjJaRUNSclgwbEpYODZVSnlF?=
 =?shift_jis?B?eEsvY0Y5UUU5T3lwb0VORHo0cm9WcFVwbVMyd0NKOUpmeU96WVF6Mno5?=
 =?shift_jis?B?QlhTc250UFZhRUtuZkRzYXF2OWE5TDZVNlhsQ3dwT2h5NVdmNkladWJR?=
 =?shift_jis?B?dVNwdkJHajVZTHdiZC9xUUV5K2xLdG82Q0JyZkJRdlFZejk4Vks0L09a?=
 =?shift_jis?B?L2VDZ0tKN0pIdWdjY0pBenVvVVpBWis5NjN6V1VtSkJWdGY0Q0gxOVRD?=
 =?shift_jis?B?aHRYQ3hpRXhUcDE4aXNCSUtVeHFmVndBcWpPc1Z0cGtjV0Z2QzdsZXN6?=
 =?shift_jis?B?TEk2d0IzZVR4cWJqMGs0QkhVYjRjRmNsRlZxd0lzY0R3d3dYdkJ0akdk?=
 =?shift_jis?B?b1JMUndhQWhUaHpnUi9pNk9FbUU4M2VmanhodzBDSUdCUmlXaFZ4L1Mr?=
 =?shift_jis?B?bFhKaFg2NmdyT1ZOT2Nrd0VXZ0ZRcUdMeW9RbkticEVDSEdOVDJRMHVq?=
 =?shift_jis?B?eGdlcnBuMzlPTVhTTlJjZmVRSTFDYmVrbTI5aUcvTVJFMmcweWd5NlRh?=
 =?shift_jis?B?VkFobU9za0U3dGRjd1JiUmUvKy9xam5jdkphYlNMa2VRVFYwbGVkdzR4?=
 =?shift_jis?B?b0VuaTFqWmwyUTlEbVA0RjIyOFlLL2k2Sjk4akNabzc3cGZnWWlZMkM3?=
 =?shift_jis?B?NURaSkVpcXU0bHRUMVZWMFE3MlRNVVppeFFtYkZaUWFsZ0lxM0IzeG9G?=
 =?shift_jis?B?SDhDNHdPN3VPQmZjdW8vVWdnSVhWYmZJWGZ6Z1RaY2huRmRCOTU4eXBy?=
 =?shift_jis?B?NHg2eEk1NXZrUEM3a21GZUkwR01Id21BVTlySEJoVW0yQk5TTVR6YW1k?=
 =?shift_jis?B?RlpJNnNvMXQvMEVFQTBNbkRvbmdwY3dwYk1qc05KclZXaW1lTHNkM1RH?=
 =?shift_jis?B?ME0rblFKY3gxc1pOVzlyMk9QTHNoS2dlZGlTUmEvUFJaaUxqTXlJc2sz?=
 =?shift_jis?B?bmRyMkZ5UzhZaUZ2YjloQkgwTUQyamhmTm4wQThvMklrUUZVMjNhZG1z?=
 =?shift_jis?B?bndXRGxCTzNkcE5yTGVqMVltSkpNS0dxOEhJeWhqeitjT1N6dFp6bXFB?=
 =?shift_jis?B?TERVdlRpRnUvYktXR3N5NXVTMUwzLzZrcmRYUUVUczVWTEovdUV4OFVX?=
 =?shift_jis?B?VmRGdUYvVXZYTGMzaWt4eW13bFB1Yzc1QjQ4WXNxNnl6b1Y0QTJ6UjhO?=
 =?shift_jis?Q?YpZG?=
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wC1wKrlZASBl5aw6dMMJwngmqYaVMZZ9y2NZYk/IhtuAfjq4jAhU3Xq9GGLGDIw5kO3SeZt38QhSUGmPdPiiOY1O7a9pMSs4QxLWkcq3MoTq1g5iISzIlbmSpe/Iax6lwfba2pMcYd+lJ6gm//W3dYhCjK3zMpTyOpZE4s0hVZrOb7tzXUZ86lY+yFCA/iAQpE1jZEqARtLzkCf2apSqlKNeuoGs8EhFJ60NbV4gFEPLLIjmehkssKuVA71hZLmLrUoBOfTb2X/In/RS8wQN4wB+gZ/r0Rlz+Y/bA0vQLQBlfBg6pDrFFqyzIOrjWgMYAKSlgEwWGujSz0LHx3PuUqeCydEJPuf0euWFzzuNhoswu9jOU/9zHEjifQQEP6iG6D72N4DiuHTmiKjO7sEE5X1RxBH0Rf8MLekf76rcheNFfhsms7P+EqTohWC4ZGJQ1yWsUi2rzSnFr58hgMhO7tM1RdPAj8m0/jawuiSndb7DEMI8ikxYJX8BQ0laemuOStyXvP5Df6U8cqkfxjA86GAQMxcnmS0T2jT9NXfRHea+qFoQrNNnq4za4p1YFWXRd9vRUiHi91iFLI2WgTcPXYhAo+9S/Z9++mAN7y4kZWA6uzdFmfu1opmwoVPBQefT
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11055.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd969426-e8d0-4ce7-ae06-08dc708f3646
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 01:19:17.2920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aybU4iyR6ti1pRc2ExmxIFAGuTv8g2jXcw29o0LY7PH7sNpgeB17Igx3zypIZpeJpM1eI4uEGSuR4NFe90/j6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 01:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199186

UGluZyANCg0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgbGVpbWFvaHVpIHZpYQ0KPiBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDMwLCAyMDI0IDQ6
MjcgUE0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
Q2M6IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6IFtPRS1j
b3JlXVtQQVRDSCB2NF1bUEFUQ0hdIGxpYmJzZDogRml4IGNvbmZsaWN0IGVycm9yIHdoZW4gZW5h
YmxlDQo+IG11bHRpbGliLg0KPiANCj4gRnJvbTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0
c3UuY29tPg0KPiANCj4gLSBGaXggdGhlIGNvbmZsaWN0IGVycm9yIGJ5IG9lX211bHRpbGliX2hl
YWRlci4gVGhlIGNvbmZsaWN0IGVycm9yIGlzIGFzIHRoZQ0KPiBmb2xsb3dpbmc6DQo+IEVycm9y
OiBUcmFuc2FjdGlvbiB0ZXN0IGVycm9yOg0KPiAgIGZpbGUgL3Vzci9pbmNsdWRlL2JzZC9zeXMv
Y2RlZnMuaCBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0ZWQgaW5zdGFsbHMgb2YNCj4gbGliYnNk
LWRldi0wLjEyLjEtcjAuY29yZTJfNjQgYW5kIGxpYjMyLWxpYmJzZC1kZXYtMC4xMi4xLXIwLmNv
cmUyXzMyDQo+IA0KPiBUaGUgZGlmZmVyZW5jZSBvZiBic2Qvc3lzL2NkZWZzLmggYmV0d2VlbiBs
aWJic2QtZGV2IGFuZCBsaWIzMi1saWJic2QtZGV2IGlzDQo+IGFzIGZvbGxvd2luZzoNCj4gDQo+
ICAvKiBEZWZpbmUgdGhlIEFCSSBmb3IgdGhlIGN1cnJlbnQgc3lzdGVtLiAqLyAgLSNkZWZpbmUN
Cj4gTElCQlNEX1NZU19USU1FX0JJVFMgNjQgICsjZGVmaW5lIExJQkJTRF9TWVNfVElNRV9CSVRT
IDMyICAjZGVmaW5lDQo+IExJQkJTRF9TWVNfSEFTX1RJTUU2NCAxDQo+IA0KPiAtIEFmdGVyIG9l
X211bHRpbGliX2hlYWRlciBvbiBjZGVmcy5oLCB0aGUgcGF0aCBvZiBjZGVmcy02NC5oIGFuZCBj
ZGVmcy0zMi5oDQo+IGluIGNkZWZzLmggbmVlZCB0byBiZSBjb3JyZWN0ZWQgZm9yIG92ZXJsYXkt
bW9kZS4gUGxlYXNlIHJlZmVyZW5jZSB0bw0KPiBodHRwczovL21hbi5hcmNobGludXgub3JnL21h
bi9saWJic2QuNyBmb3IgZGV0YWlscy4NCj4gICBAQCAtMTIsMTkgKzEyLDE5IEBADQo+ICAjaWZk
ZWYgX01JUFNfU0lNDQo+IA0KPiAgI2lmIF9NSVBTX1NJTSA9PSBfQUJJTzMyDQo+IC0jaW5jbHVk
ZSA8YnNkL3N5cy9jZGVmcy0zMi5oPg0KPiArI2luY2x1ZGUgPHN5cy9jZGVmcy0zMi5oPg0KPiAg
I2VsaWYgX01JUFNfU0lNID09IF9BQklOMzINCj4gLSNpbmNsdWRlIDxic2Qvc3lzL2NkZWZzLW4z
Mi5oPg0KPiArI2luY2x1ZGUgPHN5cy9jZGVmcy1uMzIuaD4NCj4gICNlbHNlDQo+ICAjZXJyb3Ig
IlVua25vd24gX01JUFNfU0lNIg0KPiAgI2VuZGlmDQo+IA0KPiAgI2Vsc2UgLyogX01JUFNfU0lN
IGlzIG5vdCBkZWZpbmVkICovDQo+IC0jaW5jbHVkZSA8YnNkL3N5cy9jZGVmcy0zMi5oPg0KPiAr
I2luY2x1ZGUgPHN5cy9jZGVmcy0zMi5oPg0KPiAgI2VuZGlmDQo+IA0KPiAgI2VsaWYgX19XT1JE
U0laRSA9PSA2NA0KPiAtI2luY2x1ZGUgPGJzZC9zeXMvY2RlZnMtNjQuaD4NCj4gKyNpbmNsdWRl
IDxzeXMvY2RlZnMtNjQuaD4NCj4gICNlbHNlDQo+ICAjZXJyb3IgIlVua25vd24gX19XT1JEU0la
RSBkZXRlY3RlZCINCj4gICNlbmRpZiAvKiBtYXRjaGVzICNpZiBfX1dPUkRTSVpFID09IDMyICov
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNkL2xpYmJzZF8wLjEyLjIuYmIg
fCAxMCArKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNk
L2xpYmJzZF8wLjEyLjIuYmINCj4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNk
XzAuMTIuMi5iYg0KPiBpbmRleCA3ZDVlODhmMjkzLi4xNzkxZDk3ZGZkIDEwMDY0NA0KPiAtLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTIuMi5iYg0KPiArKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTIuMi5iYg0KPiBAQCAtNDAsOCAr
NDAsMTYgQEAgU1JDX1VSSSA9DQo+ICJodHRwczovL2xpYmJzZC5mcmVlZGVza3RvcC5vcmcvcmVs
ZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiINCj4gDQo+ICBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0K
PiAiYjg4Y2M5MTYzZDBjNjUyYWFmMzlhOTk5OTFkOTc0ZGRiYTFjM2E5NzExZGI4ZjFiNTgzOGFm
MmExNDczMTANCj4gMTQiDQo+IA0KPiAtaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+ICtp
bmhlcml0IGF1dG90b29scyBwa2djb25maWcgbXVsdGlsaWJfaGVhZGVyDQo+IA0KPiAgREVQRU5E
UyArPSAibGlibWQiDQo+IA0KPiArZG9faW5zdGFsbDphcHBlbmQgKCkgew0KPiArICAgb2VfbXVs
dGlsaWJfaGVhZGVyIGJzZC9zeXMvY2RlZnMuaA0KPiArICAgIyBJdCBoYXNuJ3QgYmVlbiB0ZXN0
ZWQgd2hlbiBsaWJic2QgaXMgdXNlZCBpbiAnbmFtZXNwYWNlZCBoZWFkZXJzJw0KPiBtb2RlIGFj
Y29yZGluZyB0bw0KPiArICAgIyBodHRwczovL21hbi5hcmNobGludXgub3JnL21hbi9saWJic2Qu
Ny4NCj4gKyAgIHNlZCAtaSAnczojaW5jbHVkZSA8YnNkL3N5cy9jZGVmczojaW5jbHVkZSA8c3lz
L2NkZWZzOmcnDQo+ICske0R9JHtpbmNsdWRlZGlyfS9ic2Qvc3lzL2NkZWZzLmggfQ0KPiArDQo+
ICsNCj4gIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gLS0NCj4gMi4zNC4x
DQoNCg==

