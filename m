Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4255C5CFC1
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 00:55:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3780.1786496096167338547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 17:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lQtpQUOX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BNHWTE1348079
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 17:54:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=VkTj2zqfY8NwqXCb9uKlhoE2f+YJ8di6rTmy2ykNtO0=; b=
	lQtpQUOXrTrhu7R9H+1RBygkLkqptsud6dU/cLV3wbPK8IPNRQ5DQC6k/4C02e5h
	B6k7Gosd/ILw+ZV8q0aPC4QaEmHGdWD2DdmDYcZTWFDYkwFRdxCeaZlpfPzICsSx
	y656S5GbnhT7SHsY3iialXmpoNUy8DANoBzglcQ/KnCDBkLB92Kfc6SNx6SgOjrh
	xATzGSEB4Ok8pJYm1oHGQc8wPa9wY5UOwbig140f/PZRkWOkx0UxXzrxaqIpG/7a
	Ef0o0vzUZ23/HxpzFnCftLCPueYQV2g7m8tZpDT9UamtRJfVNUdUJwhoieDd55UP
	/ckHQ//2PjBjzlqNW9yHgQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020110.outbound.protection.outlook.com [52.101.85.110])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysgga4gr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 17:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auxCOUVyN1Ee5ARrgokOkSGTQqTOegnYzTOxasXauPvGbiZMa/mV1eV+73GKJfnlYW7mMTobKVswvk8L0+zdB0kmxRs09tSFzfg/jIwTkC8Lv9aY+8wuAQyrQwG+yZD1C5RhywEiqXlOUz8gnjMZ0UmgFZggHxtAZZDfxdkVBNFQPMSvcF4QuIXEyVhe9rE8826XQeWxdJSmGA/dTlKl8nVyVq9agnvPlIwZeNeWCJ0P9e7pq7V9OXXJVoKlj+TgbAxUDaZQ37iI4rb5HEGqJqwyXtzl4mx+37SSLqQ6nJMn+d9+rqGeXcdQ3VwCmSK3+VdlxG2Euk9Cypg1KM0HtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkTj2zqfY8NwqXCb9uKlhoE2f+YJ8di6rTmy2ykNtO0=;
 b=k0FNLg7PFutdbJhPPe1xRDTOh5hvzwCK0LGfKlbKputILHJVGb0Kvl2U50t8C88VwAIEtctgL7cjSVsv4073ysq/9ueyxYWQo9kVUHX2LnWSmrHYZDEH8okJuc+pIxBukqHbfc+/KqvcKfjqL1UkU7TU7wnRshHOsBDU6TIfkX+tMVwsVZLqjvpVepOAIxLDwo779osX2QGfsIadPN+7zow0zkeSQgiv1Et82GgNYZhzxrZP6VzBL5o7a+3Cy7Be2XsyixB/q3TGgrCUhHg2+adoTYUD2lp76ojiIGa4yVKImXx3MAtIjRlfWG4xV3oN6ZQq2ynJ78VGNCrF0rEDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH0PR11MB9750.namprd11.prod.outlook.com (2603:10b6:510:397::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 00:54:52 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 00:54:52 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>,
        "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v13 08/10] rpm: filter /usr/bin/pkg-config from
 RPM auto-generated Requires
Thread-Topic: [OE-core] [PATCH v13 08/10] rpm: filter /usr/bin/pkg-config from
 RPM auto-generated Requires
Thread-Index: AQHdKIQkgeWSTDHSE0W1gd8AAgbV3raXCEQAgAKREIA=
Date: Wed, 12 Aug 2026 00:54:52 +0000
Message-ID: <d9011376-e716-4d8f-be21-cb8cbf3a214c@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
 <20260810045250.3903576-9-sumanth.gavini@windriver.com>
 <1A55FDD7-E4F7-4423-BA3B-7A91F3586AB2@arm.com>
In-Reply-To: <1A55FDD7-E4F7-4423-BA3B-7A91F3586AB2@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|PH0PR11MB9750:EE_
x-ms-office365-filtering-correlation-id: 6a0acd3d-da57-4b51-4fd7-08def80c5196
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|4143699003|11063799006|56012099006|10067099003|18002099003|6133799003|22082099003;
x-microsoft-antispam-message-info: 
 8yNpQMIE87FHcDTnQaYeLrvZ/ts8ffFzH1HsmVMK4B2Em9XeiEiUQKmsDtWqcGJAXsCXWNrXmBPI1txT77SEOAQOJzIK70VfFcc1noHaNeYW0BzD+euZeejB6vDkecqnHKaBKDsXY399qPkD5ecnZuvdoWHhCVyEjjWUaAgbEimz4Q9tur7+iV3HLeFGU5PPO8iyiFuYPL42iDCPSoSM4hn1v3snQkV06mUlvj7d8LIuFbMmeg/1/L+o14WhKEjqFoER8ucnmk9ZkFoALUqMU+OlHnnwiyLfSUadaAQY0RSJe6cz5gvqy3r/s7DZgx3LdHx607ugLKJWzm/OXKmCl6Wa46CzEarvyn7VIAAPATiVMLie4PrUrt68ezj11+9jxZcKmKlB3JhLQ8XEPpMZA2LZsFwNv4wgknc/rEOELpSfS/RKX3kD+gnydIO1ax4Nq1siuflAWLfZJz+G0W9/ZzQduIWX8k0XCWxZ8YE9hq0u/B+LNEmPuuXEZgkd3MTGIi0OBtC38Il4LfPx3Y8MfVlGzMWV3U8mjlaX91LEoWt1PBH/7ujENnUsdN/Ermi/dJB/fjQgAKUmoGLlR0nq8Nekd9jnY7A5zULNqCM9ResGgSMRzRUPTOMHV3iIrytssWhsZ+6R0NbjKI71VRBK0SCW6EX3HfGTYWC2ZM4H81loseCDtWheEjGzF7fjzv6wYOxLlvkZv4RLRkchb9eFgp+ReshzTdlcjjh+5xzfzMU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WjF2Z1VXci9ZLzdKcEQ1VnJGK3NJQjMyMmNIaHdEVWxkZWlmN0gyT2JHYWR4?=
 =?utf-8?B?THVkaFJDUXdjek10TndzSk94L1lrakpaQUZFeDFhYkw5N1ZUcnFnWDdaOWpl?=
 =?utf-8?B?R2RkcDlmZGxIVnhPb0czRVV3eVQ2V2RERVA4bmRpZlMwbXpacUYrZ2wvTXND?=
 =?utf-8?B?MGpyWHNuYXlmT3BaN1duanF5TWtZZVVXQjZKL2JFTGxtYmtoa3dYWjZUN3Vn?=
 =?utf-8?B?c1FxNzhOK3pMYzJZSXFXczRzb3JaQXlaNitpRlB1MEk5UFZkc3VhdjRJSzFG?=
 =?utf-8?B?eW5JWWp4ZWNZN0doUWJqdUkyR3dDcWQxZmQzUlZMTHVGV1hBUllPVlI0OVN5?=
 =?utf-8?B?dUxqcWcrQ3B0UHEzTHFFcFErdm42M01saXpnUjZzWW15ZjVwelNxdDg3MVQ0?=
 =?utf-8?B?VTk1SHo1YitEbjdwUDNqc2ljelNKV3krdStFVVJacm15WW9qeDhaV2p4eWJT?=
 =?utf-8?B?T1pKUmpjendva1JlZmdNdlRLaHpkQXRXaUgrc0ovSktUM0c1cTJPUHRwOERZ?=
 =?utf-8?B?MDVHdytOTmNtT0ZoQWNPNHhIeE5jQXVMOTYxSXh4dkRmK3BuMDN0V1VnSEVn?=
 =?utf-8?B?QUhIblFSc3BvYUl6K1g4aE1iYlBlR3ZqOEdUa25ZVXpyZ2tzWlo5b3AxSTN1?=
 =?utf-8?B?dTVyVy9YKzNtN3NiUVpnNXU4akg2dU5qd0wrUjd0UkR2WTNlckQwUmVYKzVX?=
 =?utf-8?B?Q0h5bVlIZ2JCajRGbTZjekxBWmlVcjVhdjFkOEdQbHQrbGdjTjUrQ2hUa1Zs?=
 =?utf-8?B?NEIxWFNOOUYwa0xQWjM1aGJ6alFrd0tDT01kMVRXczhENXFVK1ZEbGQ5VXpH?=
 =?utf-8?B?bk1hdUU0am92ejA1dUZZR1dCZE5EL1hBbXg5OEZkdmlLeWZJd0F3ejQ5R3VM?=
 =?utf-8?B?MkpobnlUcmgxQkcycCs3ajVuQzE2dk40Z1NULzdCNmppUVUzN2kzM01mUVBC?=
 =?utf-8?B?S1ZIbkhBWTl4bUNlUWIvT0ltd1VQNDE3MUhIc1FpUHpUNmw5ZXdvSC9QcGZU?=
 =?utf-8?B?aWhLUGJwUTV3aDZhWGlpQTNRaVVTQlJUQ0V5YUNXdjY1Ym9heWxYS2NFQVc1?=
 =?utf-8?B?ZW56TE5hOERmSVpnUGdUcTZCOGg3Q0VvWW50akczWk9kVk1nNFF3bDVGK0ls?=
 =?utf-8?B?cnVtalBZZlNCeG9vWnVHd0RwdG5Tc010YURFc1ZJZ3FLMkd3QnN0bWNyTFg3?=
 =?utf-8?B?RHFRQ213Q1ZnSkN5b3ZtZ2s4OU1ETzduQzMwNmNyZnF2UmJZSitlVDRYQWlK?=
 =?utf-8?B?aEwyNDhlMDByZTVuQ1ZnYmlJWHNrUGdXak5hZk5MZEhrVSs4ZkdObUgrcXNS?=
 =?utf-8?B?cnA4cEovNm5od2t2NE5iVXhIWnpxNmNGWVdabjE0ODcrLzlGSVBFQU1nNHlI?=
 =?utf-8?B?ZnYrb09aRE4xNHJUaUpZSVJjaXZZSVU4S3dVLzlhVDZrUFlYMTJJWDNpeVRK?=
 =?utf-8?B?cmRNWmpycjlvTGswQWl1dnd2cDNMR3VOeDBORWV2Z0RFUkl3UktZYk1BTVlC?=
 =?utf-8?B?SVB0a0dYWmQ1OVg0SmgzbHF6QW93eDlzSWhIeWlxaU1hS0FDclJ5aG1HMWxi?=
 =?utf-8?B?c0NBczM1MDdpSk9iOXpGZU01dlFFY1pRZUxXV1RRL21xalBhUDNLaUhrQVlr?=
 =?utf-8?B?ZWRTbG1NSUQ1Z2ptUFBFZTdRVHd4c0dwVlhIb21xcWdhSVFyWjRUYTBEbnY2?=
 =?utf-8?B?anNtcnZFWENOSTB4S3VPeTZpYU1VZEZVeSttWVdUb2FBd214bXdsZWFtVmFJ?=
 =?utf-8?B?dkIxR3owN090cjlrOVVFd1lidStJSDNWNFlRQUlCc3Q2bE5odGpFcFhpSEox?=
 =?utf-8?B?cnRWaWJKSHZ3QTVQWUx0TXN5Y3NxL3pvaWtKcnV5TVdHZHNXekJ0UU5TMi9a?=
 =?utf-8?B?L1g3Y1MyZUwvbnYwZzd1SXZDb0RzOWZ1SXEyRFQwMU9ZdmR5MVFGNWZBd3Vj?=
 =?utf-8?B?dHl2b1lUWlhUdlloMWFRTmgyREJaaDdNeHAzM1llc1FHa2VjZ1ZyYXNITmtB?=
 =?utf-8?B?UmlSWVlDdVVxREFoMDZxQUR2ME5rNUN1RnkvcFk4YVc3RnJkMXh4WEZYc0tH?=
 =?utf-8?B?UXNra2JCZVNsQktKQy82Mm1HTFZ5REJPNUg5eGwvUmgrODJTZXRyNDdEVG9x?=
 =?utf-8?B?Z0t5anNKNVNUcFhLRmJpWU5KdkYvUkNvQjVwb0dJWW1VZXFsOXhDLzczQ3I3?=
 =?utf-8?B?WWI1NE1xOTI2UVZ4cVU2b0w0LzZ5U1ZQTFY2MVlQeEswbE54KzVUaDE5Y01x?=
 =?utf-8?B?eE05eVlQWjhYM2o3SVNGNW1HVk9uWGRJam9DMDErWHRsT2Z0dW1JMmVwTkdn?=
 =?utf-8?B?QXllMUJkTGJmb25wbHgwZGVxSDk3dDZxRWNTVmRtOUxyUnUwVmlyQkJ5eHFz?=
 =?utf-8?Q?OyMwnS3dCG+FWbu78s0Ww1UkfJQ4RH95WY/u6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00CFF4390DC14B4A8655C56183FAC564@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Mp4rAGxn0k5HSNjiXe2EUHfbkvPFH8YmyqtIazK+r9/opM5JNrvEq0Q+4BFmtiTIHWhq4B0eUPfwHi4o9TGuh16DumW2tML6cudnZisYmpCK0hsPeD8UU+lWUwHDtPJNOV/xn51qtJ31q/vAd565BCg75PMZM7CznJ11ty2L0+0owDXqrA3LhBoHTq98//2GYDuO15aS6TSRYFWPJ/Ks4A3vuRM+YGiodkihTmM+ESBNnEEGpVZf7gqbWP/yhOMNhVeLduhUbyPlvjcOoO6MCjBKcV/AIMzTPCarW3E2Rng8s7UxlPEPTM7DzSlbHpEEQW0M6hAW+XgLuMRBhfAWtA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0acd3d-da57-4b51-4fd7-08def80c5196
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 00:54:52.4657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DIMULkXXUl2iEsQ6cSXyMb2hJ7Q31q7yxG55xO3gXJBPCVNyzeZOYJtcP/fMvzEAgTRNqesqJYfRn2K2POOdSgy1TeI2bXJj18UAi1bRdm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9750
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: mjaDrGUIf9FGmGYvcKA_6I2NSoSLemn_
X-Authority-Analysis: v=2.4 cv=fr3sol4f c=1 sm=1 tr=0 ts=6a7bc45f cx=c_pps
 a=54yuESksmrMaP3RwvbuPCA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8 a=ZEyexB1YPY2lpEUztGAA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDAwNCBTYWx0ZWRfXwVxCSB5F3zzZ
 3yQOQ7uDThY5SkrO8FTiPIBWXkY69KTYj/UHKSVuiTuAfVFwq0fM+y3u6paHnYAlf5CtEX4cGT8
 VG0yjZVtDD7BNbhsBX1y/at6lquD/Qr8gh4gAUmySODbJa8Y9sjNMNrfAelP0gdTGScD9jOjGRI
 xuR14fWTohnu2FIc9YrttiHFVu6GL1WiClAFEHZNqHvSWkQEr8omoBugoWnDzjTBtve6MvNlSlj
 c2QQicR81CZspFIoBdhT1oxfhDRZ2KubcG+VU/+yz/l/l99FK6d4YB+oZ9aQF9BK1CzNJYplIKO
 2AZGXi/etVmIfYbPdbC2jrAMqv0fYlZ5e9QTFixGmQWmzKsLvIglDHp95UWo6Uq+eE6slbOhCf/
 hgogfnwDLlfGw/N+Ktd0ToKKl7I8hdrnyjoI0CFF4nkNwsMGSMJU4SJ42XLZqdt+ks74XoDRYC5
 oJyTJ5xNf1ZEaoFu+Bg==
X-Proofpoint-ORIG-GUID: Uq_sDtZX4FNvbjAmy-4mq-TxJOTDSRov
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDAwNCBTYWx0ZWRfXxSsySHBnyOoE
 dawqK3WZaiOcLLetEUdHOgElXr7/LqZcTn5+H9YLruzgjhtSssWDkGWWjn+96Z4GN7ED51b2fAJ
 sALvkQl3gM8X7mEvnw8slp2X+1nrH2IADfRx6uCnvQv5Yv6LzIBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 00:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243224

T24gOC8xMC8yMDI2IDQ6NDMgQU0sIFJvc3MgQnVydG9uIHdyb3RlOg0KPiBDQVVUSU9OOiBUaGlz
IGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0KPiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0
aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiAxMCBBdWcg
MjAyNiwgYXQgMDU6NTIsIFN1bWFudGggR2F2aW5pIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxzdW1hbnRoLmdhdmluaT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPj4NCj4+ICogQWRkZWQgMDAwMS1wa2djb25maWdkZXBzLnNoLURvLW5vdC1lbWl0LXVz
ci1iaW4tcGtnLWNvbmZpZy1hcy1hLnBhdGNoDQo+PiAgIC0gcGtnY29uZmlnZGVwcy5zaCB1bmNv
bmRpdGlvbmFsbHkgZW1pdHMgL3Vzci9iaW4vcGtnLWNvbmZpZyBhcyBhIGhhcmQNCj4+ICAgICBS
ZXF1aXJlcyBmb3IgcGFja2FnZXMgc2hpcHBpbmcgLnBjIGZpbGVzLiBJbiBPRS9Zb2N0byBjcm9z
cy1jb21waWxhdGlvbiwNCj4+ICAgICBwa2ctY29uZmlnIGlzIGEgaG9zdC1vbmx5IGJ1aWxkIHRv
b2wgbm90IG5lZWRlZCBvbiB0aGUgdGFyZ2V0IHJvb3RmcywNCj4+ICAgICBjYXVzaW5nIGRvX3Jv
b3RmcyBhbmQgZG9fcG9wdWxhdGVfc2RrIGZhaWx1cmVzIHdpdGggLWRldiBwYWNrYWdlcy4NCj4g
DQo+IEJ1dCB0aGF04oCZcyBub3QgZW50aXJlbHkgdHJ1ZSAtIGEgcGFja2FnZSB3aGljaCBzaGlw
cyBhIC5wYyBmaWxlIGFyZ3VhYmx5IG5lZWRzIHBrZ2NvbmZpZyBvZiBzb21lIHNvcnQgZm9yIHRo
YXQgdG8gYmUgdXNlZnVsLCBhbmQgaXTigJlzIGFic29sdXRlbHkgcG9zc2libGUgdG8gZG8gZGV2
ZWxvcG1lbnQgb24gdGhlIHRhcmdldC4NCj4gDQo+IFlvdSBjYW4gYXJndWUgd2hldGhlciB0aGlz
IGRlcGVuZGVuY3kgaXMgYWN0dWFsbHkgdXNlZnVsIC0gYW5kIEkgZG9u4oCZdCBiZWxpZXZlIGl0
IGlzLCB0aGUgdXNlciBvZiB0aGUgLnBjIGZpbGUgc2hvdWxkIGJlIHRoZSBvcmlnaW4gb2YgdGhl
IHBrZ2NvbmYgZGVwZW5kZW5jeSwgYnV0IHdlIGNhbiBmaXggdGhpcyBhbmQga2VlcCB0aGUgZXhp
c3RpbmcgYmVoYXZpb3VyIGJ5IGFkZGluZyBhbm90aGVyIFJQUk9WSURFUyB0byBwa2djb25mLg0K
PiANCj4gKG5vdGUgdGhhdCBteSBXSVAgYnJhbmNoIHRvIHJlbW92ZSBycG1kZXBzIGVudGlyZWx5
IGRvZXNu4oCZdCBnZW5lcmF0ZSB0aGVzZSBkZXBlbmRlbmNpZXMgYXQgYWxsLCBhcyBJIHJlYWxs
eSBkbyBiZWxpZXZlIHRoZXnigJlyZSBwb2ludGxlc3MpDQo+IA0KPiBSb3NzDQoNCkhpIFJvc3Ms
DQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KWW91J3JlIHJpZ2h0LCB0aGUgdXNlciBvZiB0
aGUgLnBjIGZpbGUgc2hvdWxkIGJlIHRoZSBvcmlnaW4gb2YgdGhlDQpwa2djb25mIGRlcGVuZGVu
Y3ksIGFuZCByZW1vdmluZyB0aGUgZW1pc3Npb24gZW50aXJlbHkgaXMgaGVhdnktaGFuZGVkLg0K
DQpJJ3ZlIGRyb3BwZWQgcGF0Y2ggMDggYW5kIGluc3RlYWQgYWRkZWQgL3Vzci9iaW4vcGtnLWNv
bmZpZyBhbG9uZ3NpZGUNCnRoZSBleGlzdGluZyBwa2djb25maWcgaW4gUlBST1ZJREVTOg0KDQog
ICBSUFJPVklERVM6JHtQTn0gKz0gInBrZ2NvbmZpZyAvdXNyL2Jpbi9wa2ctY29uZmlnIg0KDQpU
aGlzIHNhdGlzZmllcyB0aGUgYXV0by1nZW5lcmF0ZWQgUmVxdWlyZXMgZnJvbSBwa2djb25maWdk
ZXBzLnNoDQp3aXRob3V0IG1vZGlmeWluZyB0aGUgdXBzdHJlYW0gcnBtIHNjcmlwdC4NCg0KSSBh
bHNvIGhhZCB0byByZW1vdmUgL3Vzci9iaW4vcGtnLWNvbmZpZyBmcm9tIG5hdGl2ZXNkay1zZGst
cHJvdmlkZXMtZHVtbXkNCmJlY2F1c2UgUlBNIDYncyBpbnRlcm5hbCBkZXBlbmRlbmN5IGdlbmVy
YXRvciBhdXRvLWRldGVjdHMgZmlsZS1sZXZlbA0KUHJvdmlkZXMgZnJvbSBpbnN0YWxsZWQgZmls
ZXMgbmF0aXZlc2RrLXBrZ2NvbmYgYWxyZWFkeSBwcm92aWRlcw0KL3Vzci9iaW4vcGtnLWNvbmZp
ZyB2aWEgdGhlIHdyYXBwZXIgc2NyaXB0IGl0IGluc3RhbGxzLCBzbyB0aGUgZHVtbXkNCmVudHJ5
IGNhdXNlZCBhIGNvbmZsaWN0Lg0KDQpXaWxsIHNlbmQgdjE0IHdpdGggdGhpcyBjaGFuZ2UNCi0t
IA0KIyBTdW1hbnRoIEdhdmluaQ0KIyBXaW5kIFJpdmVyIExpbnV4DQo=

