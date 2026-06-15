Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53BCCD8CA8
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 02:04:39 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.121106.1781489077615167272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 19:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=J7eeYnI7;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.0, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKPxQm7dkut2PM/ejxe6alC9Bdt9Elrz0oxXIJw/M9Xu9aGqBUzNNKzDIJPIHdyvJkyGyshvwyJPl1jBdwuHkmhwKrm9HfptBV/AcBDBde7DQloLAHwsMtz21Q3oGgvcS8ybq3KKTYkFYlazsyNnJMHjciU8a93e7pM/JNkY8ZGtZ01Jtfof4ihTQVwPnkS7X7ApJ2U+3Sf6KcVSO4JvAw+J5HUm3Tld90aEckSQnyubTWDVbHTgKzi+0AmiRmyatRyaQ8dzJWBXfR32IcB05K28hMi/T1SxYVwxGJItdCGRseJ2Gq+OmjrWNknWUPurdt9b8RWbFd8p2W5q8DJGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJaSkhjAQmAW61g1jMjA/IeEz1pepcxRpDrYzMTWD4M=;
 b=wGz4eZ1npoADfojVqVi0+u+7Skpv3PJRJk2Q9yo9TY5//3Is+Aibl/LxjKIRF4Ba6BGgVoM1PSCr+sxDDv/PyBcj98QwI8dIiKp6eNaLAhao53BQGXFhTBo0BWBOpcrsN3i5O6UO8xU1PIJqdpoIfXtlK8c0BoYTV6VjuKBlxlIcFhA4goYsocDKbwzPe+Hmc2huHpcLp7tCLfcZGxIy7IwXIBP4C9waUIgv63/CQhw5UrnWGnkdOdSm7jZz16oxzIbTEnwYBUt2gfNvTMeUcyqQHo08FYxlWP2mBdSJBmef+YKMYpCKkU/bx1KAMGCubYV/N7zM0BPyheXbfYvUow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJaSkhjAQmAW61g1jMjA/IeEz1pepcxRpDrYzMTWD4M=;
 b=J7eeYnI7SfbmmZFFMTMNSOc7qCgW5MpudeyYU1R2bRSV3uxBdjBl+GXgcMEuHvplFWfZeroOBRifxNGKFfpcII+L3x2zagq1EHKkKEN58XgjBIWklEF3tpVFUN73QZy1CyIcHbBmY5WRxnl0j+llIt7MFQsiwCFuNw4GddjoMYkRWnUHHeGZv7pZumqusqIRAelX3ow4rCtbW5lHobB4vBKcnkakcStHCEQx7A1rqekIs3p8X/N+N+LlF/iym3fyYfaoWcGwTw0dTpYy32MFEWXgxi8gqfvAEpdh0DpOwcHAhHBMrIbXKtCup65u0b0WagLWcavurH6ZKVtrby6OLA==
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com (2603:1096:405:1be::9)
 by TY4PR01MB14830.jpnprd01.prod.outlook.com (2603:1096:405:25b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 02:04:33 +0000
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928]) by TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 02:04:33 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 15/16] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6 ->
 26.1.2
Thread-Topic: [OE-core] [PATCH 15/16] mesa: upgrade 26.0.6 -> 26.1.2,26.0.6 ->
 26.1.2
Thread-Index: AQHc+L6NSPNtQ3I5f0irCkYvZRp8HbY40OyAgAHXJNCAAiQFAIACGNSQ
Date: Mon, 15 Jun 2026 02:04:33 +0000
Message-ID: 
 <TYYPR01MB13419567B9C3B4ECE846491C4DCE62@TYYPR01MB13419.jpnprd01.prod.outlook.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
 <20260610094932.2264-15-wangmy@fujitsu.com>
 <DJ5YPKB59JWN.379MO32ZI2BQH@bootlin.com>
 <OSCPR01MB13427F610C3A42F7ADB33ED9CDC182@OSCPR01MB13427.jpnprd01.prod.outlook.com>
 <CANNYZj-FbxWBK=F_hMeD3oJc7WF_4KOKjB8Jz7s_=JX_8ADEZg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-FbxWBK=F_hMeD3oJc7WF_4KOKjB8Jz7s_=JX_8ADEZg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YWQ1NjExOTktMGVjYy00MGQxLTllZTctZDU2NmMxNGU4?=
 =?utf-8?B?MzliO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjYtMDYtMTVUMDI6MDM6NDdaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13419:EE_|TY4PR01MB14830:EE_
x-ms-office365-filtering-correlation-id: 1bfc51de-9e89-444c-5d9a-08deca82718f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|5023799004|11063799006|22082099003|18002099003|6133799003|1580799027|38070700021;
x-microsoft-antispam-message-info: 
 8T+IMO86Mfx0zKLm0MdHlVn/NNOuYFzUw/7zTJS3KizuXjL8ltl0DrypDGhwnsNbf/Lz+UJWL6nbGMgOJAqv2a93kISYgECvZJG9QVv0JUsfUy6KhEeoMnS23uDabJ74v4VYTQDfXYiVmPhsVHocwtOHOB99/5lgrr2NThc1HQcH1xZyNBqo+vmuVioTgRPNmB+ujC/0DmfofppfrEcPM+smPUy2ISNdKXUJ0hAYI4BEknXJLdfeGuIDqRGdRchOilFrh1BtfZ9EGqM1IaJNJ5SR/FUcRoAhlG5zfaohjhbJ4uAmDclh0eWsI7n+9BTeib1hCyVTRedJDI35Y3jXSVHTJ178sEYn/Cf1olcr2ChdCSz/0o2dKuX9o4KPY5iCNOQaVQugg5+TjFcrldJYbJ9qTQfCWzbgi4HvxBMucH3FPy0Q8xOnu6vr88w0ehSKx1H5qhZEMGict+1vwQxX/MvUql1AXuhbJ8mpLNtr3gvgDCyiS0pJXkZQctJGL2Wf9qMWevtFG8PWz5LT5VCXpdBczYeJgl2QqHaVVEMn2HumsyvlzaAKzwNT2Ar5Ngo9aJ5sG48K1aiikEHKImHB4j2UD74o+Q4RiMjNaRDWKWYdD+xUSelJlybQWEDRW8Pji18M1Av2y2DBJ3Ltbjoq5hSiDdnUk/o+LA+q2V1S19y1d8+sgnrwwCc4wVDb/IiEdtueR25hrzzOfItgcIJ1I2fupkkF1hzrDkU09vdddTZ8MUfT9tITOkvBQURK4Hq/8Uo9vobAj5o3Y7DbjTS6n1MV0LeMkgweSZdUC/48Ukw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13419.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003)(6133799003)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d3NSUEZnczQ2MmtZaG4vUTAwVndjS2RMT3ZoTUxva2xiam9LV1ZTTkdZNjZX?=
 =?utf-8?B?dEtqN2ZsWHZtWmRlandnc01ZcU9JWDdJQURLRVh3UzhLT295dUZPS3hGQUJs?=
 =?utf-8?B?VWZPRENRNU9lcUpvR05mMXlvZGFTd25PaHFYdTlBTVExaUQzT0o4em81alMv?=
 =?utf-8?B?UThkY0p1MlpOSDI3d3hNSW10b0lna1hjc1lJNUVOcDVSemF3VndrOXQ4ZDBs?=
 =?utf-8?B?NWM5WHFpVkdsR1ZmT2RCdVFBTVFuWFJZUG4vWVBrcUVNUy9NRVRQckZqMUl1?=
 =?utf-8?B?Zzg5ZzAyMDhVM1ZjaE9GWklqeUNZWjFBUHM1R0U3Qkl2WWpVOGtqcVBRT1Ax?=
 =?utf-8?B?cVNWU2EraldJMlplQy84R2VwdFRnNTZCd2Y1UituSktaU1lPVEZLNG03d3By?=
 =?utf-8?B?b3g1Ry8vd051S0hTYStBSWNIL0dLTDBVeU9hOXpCNnBJcjI2LzhCREw3TjF1?=
 =?utf-8?B?NUx5SGVtV05VaEF5YXhGR2J2cFZ1N3dlbUZaY0ZqaVg4bTkraUtXT2ZkV1Mv?=
 =?utf-8?B?QzdQQWQvU2tYL2RLNjIxbVNwZkgzT0Z6T1IwUlQ2Uk1pcjlhVmpTdHJDZnJl?=
 =?utf-8?B?MWxxeE5YRGNuSE1FcVhZZGZqdjdJQlpsaW1yRXdWa1pCL2dJaDdybFBselVJ?=
 =?utf-8?B?UGpuT2IyVEN3em55OXRPRlhVTUluU0hJaTh4dkJKSEcvTXlKUFF6UGRMdzZ1?=
 =?utf-8?B?VUZyNVFFN2pEN1ZpUmZLT3VrRytEZ1U4VGtDQndZSWdoVk83dDRITWcvTkJI?=
 =?utf-8?B?YnNsSE5rVjV5Y3RhWm1ZamoxcjFOMlM3cXNwMlZ4RTFlUlBJV2tzSXpOc2pX?=
 =?utf-8?B?bmluYmlhNGNkSFR1WUpoa2RWS1FPNkZDbUVjTk13UFg3c09uM0VHNnhoM3pG?=
 =?utf-8?B?b09oRFhtZnExUU15cm1wSnhvYmMzWXdUMCtIK2ZnUnZEWUNsMFBFRlpXTzY5?=
 =?utf-8?B?eHMzRWhNdVR1QmkzcVNaN0NTSVQrRDhMaVU4TkQyeEcvZXFXbUswVVVHKzdn?=
 =?utf-8?B?cXpZM2ovUE9LSmx5VUluUmFXSmUwaUdwZWx0VGRSanFYRy9FWVlpZjAxcEdS?=
 =?utf-8?B?YllIZFdaclJEN0VWN1pheXRybXVQNUUzSTczQzhQbGJVU253NExYcmcrRGZn?=
 =?utf-8?B?M0FPZmswcHJ4V1RGcHo5VHZIWEowQXFYN0dNSzRwelJIWHNydGxvNUwzdVBC?=
 =?utf-8?B?K0Z4aGF0YU9qSUd2R2UrNG1Eckw1YWxySHNYaG4rVkdMdm0wLytwTmtzWUpQ?=
 =?utf-8?B?bmd4WjBYL0lLVzllTzEyeGlXeWh5blFKMnFNY1B1Z2dYS2JmN05IMmtYdm5i?=
 =?utf-8?B?MEtOcjRnWGlKUjBpWFBBZmZNeEI4QmQ1NkxtcUpxOUpleVdMbWtia2hxMXRo?=
 =?utf-8?B?SE05dllKVkp4emVxbDl4SzdOSm52dHRxWGtWV3RBSlZOMTJKUElyK0xTZkF2?=
 =?utf-8?B?ZFh2UjNiNzhTbFgyaXFDdmFiZTRkQnhQKzg2cmowUitha3FSY2RNWlZCTXdD?=
 =?utf-8?B?OUhjRmQ1QWkyNWRjV2phT0tpL0JhQitDcE5rSC9saFYyTjY5ZzZNUmsyeHQx?=
 =?utf-8?B?WWNUSTBvVjJUNFB3S0J1dTlQdnN6ZjNnR2RwQXZYZ2hGT3lsUDdiMVErTUt5?=
 =?utf-8?B?TEU3TkNRUyt5ZEdNci93UStFRmhVMVJxbDFZZUQwOCtLcnZubVZXdEFISmxn?=
 =?utf-8?B?Y2lWZGVna2hNWEJoTy85K0N6WWl4T3lYYTJ2cndwYkNYeCtKSEtQRXdPNVRm?=
 =?utf-8?B?M0pyTWJhczFkM3B2bTUra2JUa2xrSDdtV3ZlNlZyUlhPaGs0K3NTTzUyaWJP?=
 =?utf-8?B?S3VMczNPaWFJL3pCUVFlODVJeTlqS3g1UWlna25oY1BzSzV1TGRCVHZ5SlJr?=
 =?utf-8?B?RHUxeXZzWERBTnZuZHVhSm90amdlQ1FoaHNYM21RcEpxM2NqRmdjaG5nWFhK?=
 =?utf-8?B?amxtc0xpdnZOMjlMYlhkdjFIUk92MVh6WGFrcWlnZ1lhblJUa3RKKzNHakR5?=
 =?utf-8?B?YkVVc3RWazZpM09DTTdVVDBGSGRwTWlhSXZUNC9NMi9tbE9MOWxNY3RCcDM4?=
 =?utf-8?B?MTFEdU1zMWNxenA5YkVPLzVPRFNqazdoVlFKb1l1amtLdHZWL28xOEhSeTcr?=
 =?utf-8?B?bEJzU3JGM29lSmNLancxL1UzcisxcGgwcDA0djhKQmh0eERVb1ZUQXRtOTBz?=
 =?utf-8?B?WGJxano4bU9XOGxmMXJVTkxDOHVTSjdFdm5pMGU3OFhsZVpJS0F1TnJjUDlE?=
 =?utf-8?B?dElmaVJYdC9oeTU2N2N1UWEzalNuK1J3N2dHRmVkVUxmbTh0cHViYUxIdHY2?=
 =?utf-8?Q?TuoxrV1HV7X+zqSvy+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	WvNBbVvGIig+5GrUFoh6PHgbRWsHzXRrFcR533n9usswyxqM1/xqPKroQBJ31KIZpzPmBsMFRCryK04Z2yOyvEYQ3aTiSPwBfVXabZQg3jKVcL2peFWkk0cimP4oaQw95jGRcHSpENR4pVtiF5mIHKQXTLnwl7ivPvskzijYIWDjrV+6SGdMS7Tz6bd/ELw/M973CmyFsYHDT09qHB9tSQODZQUKG99sKuaWnpbug7Kitb8wgmpnxGtjZzEI9Mw0UPX7gG1pxkzdjAHJsFGhuT/d3oGylAXJLcsqbtdW43CdvUj2HJVIu1P27KBtLk0lWVIw+JEWhgLmaQWedAl8AA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13419.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfc51de-9e89-444c-5d9a-08deca82718f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 02:04:33.1735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vEyWrhQzLWyuA7BQb3A2EU2NmfU6IRu51hxKMBr8uG3lM7GunIdDfdGtSEM1pMNeUz3jM8NQop10CK2eNwrUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 02:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238801

VGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4gSSB0cmllZCBwYXRjaGluZyBvdXQgdGhlIDog
dWludDhfdCBwYXJ0IGZyb20gZW51bSBqYXlfcHJlZGljYXRpb24gYXMgeW91IHN1Z2dlc3RlZCwg
YnV0IHRoYXQgYWxvbmUgaXMgbm90IGVub3VnaC4gQWZ0ZXIgcmVtb3ZpbmcgaXQsIHRoZSBidWls
ZCBpbW1lZGlhdGVseSBmYWlscyB3aXRoIGEgc3RhdGljIGFzc2VydGlvbjoNCg0Kc3RhdGljX2Fz
c2VydChzaXplb2YoamF5X2luc3QpID09IDMyICsgKHNpemVvZih1aW50cHRyX3QpICogMiksICJw
YWNrZWQiKTsNCmJlY2F1c2UgdGhlIHN0cnVjdCBsYXlvdXQgZGVwZW5kcyBvbiB0aGUgZW51bSdz
IHVuZGVybHlpbmcgdHlwZS4NCg0KQmV5b25kIHRoYXQsIHRoZXJlIGFyZSBhZGRpdGlvbmFsIGVy
cm9ycyBpbiBvdGhlciBmaWxlcyB0aGF0IGFwcGVhciBvbmUgYWZ0ZXIgYW5vdGhlciB3aGVuIGNv
bXBpbGVkIHdpdGggR0NDIDExOg0KDQpzcmMvaW1hZ2luYXRpb24vcGNvL3Bjb19uaXJfcHZmaW8u
YzogZnVuY3Rpb24gbG93ZXJfcGZvIHJldHVybnMgZmFsc2UgYnV0IHNob3VsZCByZXR1cm4gbmly
X2RlZiAqLCBjYXVzaW5nIGVycm9yOiBpbmNvbXBhdGlibGUgdHlwZXMgd2hlbiByZXR1cm5pbmcg
dHlwZSAnX0Jvb2wnIGJ1dCAnbmlyX2RlZiAqJyB3YXMgZXhwZWN0ZWQNCg0Kc3JjL2ludGVsL2Nv
bXBpbGVyL2pheS9qYXlfZnJvbV9uaXIuYzogbWlzc2luZyByZXR1cm4gaW4gYSBub24tdm9pZCBm
dW5jdGlvbiwgbGVhZGluZyB0byBlcnJvcjogY29udHJvbCByZWFjaGVzIGVuZCBvZiBub24tdm9p
ZCBmdW5jdGlvbg0KDQpJIGFsc28gdHJpZWQgcGFzc2luZyAtRGNfc3RkPWdudTJ4IGFuZCAtRHdl
cnJvcj1mYWxzZSB0byBNZXNvbiwgYnV0IHRoZXkgd2VyZSBub3QgZW5vdWdoIHRvIGdldCBwYXN0
IGFsbCB0aGUgZmFpbHVyZXMsIGFuZCB0aGUgYnVpbGQgbmV2ZXIgY29tcGxldGVkIHN1Y2Nlc3Nm
dWxseS4gSXQncyB0aGVyZWZvcmUgdW5jbGVhciBob3cgbWFueSBtb3JlIHN1Y2ggaXNzdWVzIG1p
Z2h0IHN0aWxsIGJlIGhpZGRlbiDigJMgd2Ugc2ltcGx5IHdlcmVuJ3QgYWJsZSB0byByZWFjaCBh
IGNsZWFuIGJ1aWxkIHdpdGggR0NDIDExLg0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUN
CkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5v
LjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTO+8mis4NisyNS04NjYz
MDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDog
d2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFN1
bmRheSwgSnVuZSAxNCwgMjAyNiAyOjAyIEFNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eR
nCA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiBDYzogTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRo
aWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDE1LzE2
XSBtZXNhOiB1cGdyYWRlIDI2LjAuNiAtPiAyNi4xLjIsMjYuMC42IC0+DQo+IDI2LjEuMg0KPiAN
Cj4gT24gRnJpLCAxMiBKdW4gMjAyNiBhdCAxMToyNiwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IDx3YW5nbXk9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ID4gSWYgd2Ugd2FudCB0byB1cGdyYWRlIG1lc2EgdG8gMjYuMS54IG5vdywgd2Ug
bGlrZWx5IG5lZWQgdG8gYnVtcCB0aGUNCj4gbWluaW11bSBHQ0MgdmVyc2lvbiB0byAxMyAob3Ig
YXQgbGVhc3QgZW5zdXJlIEdDQyAxMyBpcyB1c2VkIGZvciBtZXNhKS4NCj4gPg0KPiA+IEFsdGVy
bmF0aXZlbHksIHdlIGNvdWxkIGhvbGQgb2ZmIG9uIHRoZSBtZXNhIHVwZ3JhZGUuDQo+IA0KPiBJ
IGRvbid0IHRoaW5rIHdlIGNhbiBob2xkIGl0IG9mZiwgYmVjYXVzZSB0aGF0IHdvdWxkIHJlcXVp
cmUgd2FpdGluZyB1bnRpbCBhbGwNCj4gYWZmZWN0ZWQgaG9zdCBkaXN0cm9zIHJlYWNoIGVuZCBv
ZiBsaWZlLiBGb3IgZXhhbXBsZSwgRGViaWFuDQo+IDEyIHN0aWxsIGhhcyB0d28geWVhcnMgb2Yg
c3VwcG9ydC4NCj4gDQo+IEVxdWFsbHkgYWRkaW5nIGJ1aWxkdG9vbHMgcmVxdWlyZW1lbnQgdG8g
cmVsYXRpdmVseSByZWNlbnQgZGlzdHJpYnV0aW9ucyBpc24ndCBhDQo+IGdyZWF0IG9wdGlvbi4N
Cj4gDQo+IExvb2tpbmcgYXQgdGhlIGxvZ3MsIHRoZXkgc2hvdyBvbmx5IG9uZSBmaWxlIHdoZXJl
IHRoZSBpc3N1ZSBoYXBwZW5zOg0KPiANCj4gfCAuLi9zb3VyY2VzL21lc2EtMjYuMS4yL3NyYy9p
bnRlbC9jb21waWxlci9qYXkvamF5X2lyLmg6NTgyOjIyOg0KPiBlcnJvcjogZXhwZWN0ZWQgaWRl
bnRpZmllciBvciDigJgo4oCZIGJlZm9yZSDigJg64oCZIHRva2VuDQo+IHwgICA1ODIgfCBlbnVt
IGpheV9wcmVkaWNhdGlvbiA6IHVpbnQ4X3Qgew0KPiB8ICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgXg0KPiANCj4gQ2FuIHlvdSBwYXRjaCBvdXQgdGhlICc6IHVpbnQ4X3QnIHBhcnQgYW5k
IHNlZSBpZiB0aGUgcmVzdCBvZiBpdCBidWlsZHMgd2l0aG91dA0KPiBlcnJvcnM/IE1heWJlIGFk
ZGluZyBhbiAnVXBzdHJlYW0tc3RhdHVzOg0KPiBJbmFwcHJvcHJpYXRlJyBwYXRjaCB3aXRoIHRo
YXQgdHdlYWsgaXMgdGhlIGVhc2llc3Qgd2F5IG91dC4NCj4gDQo+IEFsZXgNCg==

