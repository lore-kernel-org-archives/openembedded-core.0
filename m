Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B31BD1CDC6
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 01:52:21 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1803.1765158736025857761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Dec 2025 17:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=RmtM9cPt;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.48, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYYfVuMj/FOtwYOMOsWwdDbUl4fysMzgyH8iG3dOTpWGD0ctKvuPUoQVJWFffxPQmUjF93bmYcteoiix1cvX8M2KwUIUZRgvRvmZfaPwaQZhXAXF1DigukqiE6HAKURLkZUhrwOIn2/gyueYtUNvM9IsmrITFnqzuaJrDgfRd3wfnOJL+TS0lM80z/3v84iK9+t1mWwbeGvcnBZA/NDe9oy2coYaB9iTYHOhyEwV1WFrFIFaR9zYj0u7V3jXglp9PKwzdCEh/kqBnFt+9NDf183MSv2x9voiXKcXHmZawoBNNb5XqCWJM3TyKd85VA/GD+hac81756zGUlVoBBzetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWLYHbp0JMgrZQk//v8b17ch5PwNd86KLYDO9i+LsYc=;
 b=SDgZfHn3dxSOZjIosMjAYCadkcFOuBnvkNvgsD9YSsSfIRqm1QTEe0lAVleG21GGd5GzrMDl4+nrZIljPIQE8UwdC8xjFEbgZ1fC1yOtzGLo+J6tjtj03wLKUe31JyJtk63ZxfGz/PMW5vcvqqWWGeAFg6brAt1oavDd6PacZ9PLGQ1cYd2t6mHmbLc4AoVj8swf1OKP6m5kbnzV/qA3qhi8u7LFQQCr26fzZT4KXKj8rk+7cED8zlVYFvOMJmiUwg23rf4DthDYK+yU9/xhokMQ+g+3C9N78DhIWZ/+NopBcw6C30Z2o8T2onHL05O14yiDWcynRp88PD311SWO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWLYHbp0JMgrZQk//v8b17ch5PwNd86KLYDO9i+LsYc=;
 b=RmtM9cPtb/CFf0OsDE7qV+5yJnjEB/skhgN9rzF9lEwO893+F881derO+w3RpX7wcnmQggnpspL8bIAJFx+ExUa3Dn3JjJ1U4/JYxiunO2Z9jpPawszwrCbm2Msbm6U2P4uAo133LdSCqihirVCFbDMGteMpJDoj4WNIDjywurc6LD3jLhdy5evL6Nzk4fg7h/oNbuHUqB5NKdO5GJwPOiCjjvTMkEKhdZtewv3PY3FH+szVYG1qjMJFU4A+gjcEDPG2xsS2MzrvI65HiGwxIvD7BfRyNvYzgj7pmraWCrDfrYRop/XcppHDtqYirOtjXYqPXCBEpMBgIuDEHNBZHg==
Received: from TY3PR01MB11483.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::13) by TYWPR01MB9556.jpnprd01.prod.outlook.com
 (2603:1096:400:19b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.3; Mon, 8 Dec
 2025 01:52:11 +0000
Received: from TY3PR01MB11483.jpnprd01.prod.outlook.com
 ([fe80::46cb:b462:44ea:9163]) by TY3PR01MB11483.jpnprd01.prod.outlook.com
 ([fe80::46cb:b462:44ea:9163%6]) with mapi id 15.20.9412.005; Mon, 8 Dec 2025
 01:52:11 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIXSBnbnV0bHM6IGZpeCBwb3N0aW5zdCBz?=
 =?gb2312?Q?cript_for_${PN}-fips_for_multilibs?=
Thread-Topic: [OE-core][PATCH] gnutls: fix postinst script for ${PN}-fips for
 multilibs
Thread-Index: AQHcYDSnsYFy0V0HdkWpW1YJRmWKELUR2SeAgAUtPr4=
Date: Mon, 8 Dec 2025 01:52:11 +0000
Message-ID: 
 <TY3PR01MB11483B8E76FD565C2B2BE38749BA2A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
References: <20251128065949.7462-1-liuyd.fnst@fujitsu.com>
 <6F4CEC32-3094-4B06-9C62-89C97A07649F@arm.com>
In-Reply-To: <6F4CEC32-3094-4B06-9C62-89C97A07649F@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-12-08T01:52:10.765Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11483:EE_|TYWPR01MB9556:EE_
x-ms-office365-filtering-correlation-id: a3996e6f-3b57-46f0-d822-08de35fc6777
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|8096899003|1580799027|38070700021;
x-microsoft-antispam-message-info: 
 =?gb2312?B?blgzYW13Z054aWVIVjFKUWpQajdCeTF3MlZ5UE4zOC8zY1d6Z3JRZldYeGRE?=
 =?gb2312?B?dnpONkY3VVRxN0p4bFlZK2pXMFNkS3FpejUrL2VyTERpb2YxRU1qOTQ0NkxU?=
 =?gb2312?B?RytVcTFBUHVCbGZML0FsV2JMdXNwMkhYVTBDRUk5RG1KN3VWVXdTbENvTHFm?=
 =?gb2312?B?TDRnT1JwYXlHRkxxbEkvdmwrcnRzVHAvb2RPVm45L08ySFdmb2FlQTAyb3l2?=
 =?gb2312?B?VTVwWmVjZldieitnS0dlUFpsQVlDaXJ3SFpNbTJWbE9DWm9GTEdZa3Izd0ky?=
 =?gb2312?B?WGtPM3l1dmxUUEhKbEJkTUE2WDkycExYL2wwZDlxQTNBaUY2dTljelR4L3lp?=
 =?gb2312?B?RUY1M2pTM0oraFpOakVaZkFHZnRLTS9hVTh6MnRaNlR0TDBKcU5VckFPcEFZ?=
 =?gb2312?B?MWRYd1ZsWTN2QjZmb3lNeFdlL0J0VVJsZFBGczlCalU2M2hqM1d5ajVmblkw?=
 =?gb2312?B?WXFaaG93SGpheFJ3R2hxdzl2QmF4c2FlU2E0d096WXdzc1pGcDRnaEtucDdL?=
 =?gb2312?B?ZHRZd2lxMjNsSXZCZ25JTlRqbUUvQkNvb1NOUE9ZOUo0NDdmRjFtYWVaTXJr?=
 =?gb2312?B?SkE5NHQvZTRnbWxNaTJEa0xHZ0dtQnpub3U4OGVneXFaNHdtMFdBWVEzSjV2?=
 =?gb2312?B?UkRWVFZmckwzODNnUzlUemlYV25oM01Ud21pUFRTcnVjOTlkTDI4WThxMk9a?=
 =?gb2312?B?Tm5HRld3MVJiZm0yenNndkEvakxJbnhMRlhSOVBkM0xwWEhpdVpzRUV0bEhu?=
 =?gb2312?B?MW9MYktCMktzREIwKzIrdG5sY29tK3ZndzUzMVZyU1QreDFNS1hpc01NMytx?=
 =?gb2312?B?NkxZK01FUzg5T0hrajZHbndFS0VIV2xpVUFmdW9UbFhMSGx0dWw4a2tXcVhT?=
 =?gb2312?B?dURteWFUWHE5bUNsK0NCSjdpQUxYaWVHU0VNTWpkYzZOWDBVTHNFM2p5S0Jr?=
 =?gb2312?B?NzNINUVUN1pramR0dldSVFA3M25CNVBESnI5bTlyM0xOb1VKT05aUHFHZUFq?=
 =?gb2312?B?YzdTUVg4UFN4NVpSU2R3dHlFM3BhaWxPbi91cTZmYnBiRk5tSTNRNUt4SWJl?=
 =?gb2312?B?bjR6ZDdRcGdmRzdjaTVjZENZQ1JrM1lzckNtYkNMMUJUaVZDSkRUV0VMdTVS?=
 =?gb2312?B?MFBVOTk4WmFVVzhhM2ppK1pZUVVLWkNBNkQ5MWI2RmZ4TVFQeXJ5bU94c094?=
 =?gb2312?B?cDdtb2RTVXVGbFhhVmc3alFJRTUzZDhjZ01hNVZqZ1MwQXY0eXNiYTZTOHNK?=
 =?gb2312?B?NzlVbWNBTEJBb2lOZ29vRG1SSkovK2Vtb1kyaUM5TGJvNXpHQmlRcGQ0dEg3?=
 =?gb2312?B?R21aMCs5NTU2Q2tHcGQzYzFUMjZuWUY5b1B5S3dkdEdHeFc5a0dlOG1DOEtB?=
 =?gb2312?B?WFViaWRvYUZWVmwvLzM5ZHVockZtMUZHVEMyZFRjVk5Qb3pWeVBkUk0vV201?=
 =?gb2312?B?WVlTQ2lUZkJPVk5pazhOd3I2MzF4aUV5OGJEbnJqdXZkZkVqeU9jU2hBcVhS?=
 =?gb2312?B?U1B5WUtCd2R2b1VyUlowMEhtL1preFd3T1BxcHNRcDYyb3ZOaGdHajZDbk0w?=
 =?gb2312?B?VzYvK3FHY096Tk1PNysvUGcxLy9ZWmpRYzlMMUJwWUg5ajdTazlUVW5pL1dL?=
 =?gb2312?B?Y0xDTElrMTlWREhKMjBqQTN2b0RJdm9vRTdmSytmUnZrdi9DcW5EajdOMWtR?=
 =?gb2312?B?dHZVS04wajY2QlU1aUppMnlNRjB1V0NXbGg2Mk9TSEdVTkd0ZVFMdWdqSWtI?=
 =?gb2312?B?UHBiYy9VK2tubTllQklET050OW02aHNOSU5UbmcxYU5uSmRraXg0ME5WS3g5?=
 =?gb2312?B?cDZEWElGQ3lOMUZ4RUJHcHpyNTNYbDZoR2YxL0tWcFA2SHV0RUNXNXhzclhV?=
 =?gb2312?B?d3hGV3Y0dTVGKzNJU1g4VEhpR3J3SUtvRjVYVk9nUFExV1k5cVVRL3dIVEhp?=
 =?gb2312?B?SmJjV3RuQTBqMGFDZWxES3pYOGtGWkNWUERyTVA1ODJhZlVGNnFycXdTSEdO?=
 =?gb2312?B?ZzhPc29BZFhXV3lCZi9Dbk1zVS9jdXc0YTJNV2ZQSTZtc01lWkZuWEdRckEw?=
 =?gb2312?B?ZEVCZ3RXbGtyUzc1VmNPQ3hwdytPRFVhb1JDdz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11483.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(8096899003)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?QStYQ214SkwyQTVDTzdGVHNUbnh4VVlsQkI2aEVhNW5NWVpwQ2RqVVVJcGZu?=
 =?gb2312?B?QisxWjM2bXRPdVdEOHF5aGlRS21vdm5tcXF6VVRkZjFmYnBtVmZZRmdVaUYz?=
 =?gb2312?B?VVcwbTlCbFM2SW8vR2p2UlY3OU12amNEUlB4d29hVXVOa1B0a0F1MEV4R1pD?=
 =?gb2312?B?WXJHalA0ZEZmajkwWWxXWmtUMjhzMjJIQndvSVd3SkVMRDNnejRyYnFEYjcr?=
 =?gb2312?B?eWFhS0xVSC9GSXUwTWNCK3FRVVNYYWVCUUcvVkp6RkNwWDVpUDVNNFBpa050?=
 =?gb2312?B?dit6UGxjajZTQVZlL3FzaDR3cmw0K2tOdVppbFI5UGVZVldZclF0TVdOcmJh?=
 =?gb2312?B?L1ZQTlZRbDh2RFg2VjlSaEZodjVPVEtHbnlZeXlnR2FIcUYvWFB1bE9BRWhL?=
 =?gb2312?B?Q1Z4YmcxUUhjN3pHQmhUWjZiTjladlcrYkMvZlJqN29aa2xxbDVKall2dldk?=
 =?gb2312?B?Y01TeVBnaGJnM2NrL1FBTXl6WU5aZnlyS05vTnVaNHd4TWs1QURhQkk2OGFF?=
 =?gb2312?B?Umd0Y29lcnZGOUtwWCt2Rk5ud2hodXNXVkR5Yk11OU44ZmF1emp3VzNRaHpt?=
 =?gb2312?B?MVJXeVExYWtIN0llK0lybUloM3pscmtVS0tEeWNlNTdvVlplYnZxNWpEVVJV?=
 =?gb2312?B?bnZxNHZCdkNxT1JFcWhCS2VlQlZHN2x0cXJhM0NjMmRVRFBlckN1TzFraXdL?=
 =?gb2312?B?OXBmTTZaNFdUcGpBVVVXWWZaZnZPSXpueFNvendVMnc1WExoWlNzNDdwNS9W?=
 =?gb2312?B?WTlkL0NEZHFzMWVOSjhaSjNWVzNUbTdoRU0yRUMzRzFFOEd0cUVrYzFpUjZy?=
 =?gb2312?B?Wkljejlrb0tua0JDeHNEMGI1c05iRjZJWVpiMzB2U2FnbDdOTFpUVVhZTUlX?=
 =?gb2312?B?bVdVOVRrUm9IT3RKL2ZtalVhbTRFdXI3T01OSzViSG1IeUZ6VUxNU3pUc2Ja?=
 =?gb2312?B?bUM3R1krZEZCdDhYVGVxOHYvaVE4REdSbzlleXYvdjA0NW9DMU5pUGJvSFlz?=
 =?gb2312?B?T1NoTVZzQUtZbExOdHIrYlRhTnl4MTNZZ2dYejdheUtCaWdyQVRZT1BYTjJL?=
 =?gb2312?B?c3krY1EwVnplMXVRZGlWR1hJQlkzSytRa0k2K291dFk4NGJ0cEFhc2UzWGg3?=
 =?gb2312?B?MnFDY1hOOTh3azhLRUFENnByUTFRdnd5ei9BLzNUTHNCQnNJcTlKZW1LK0lH?=
 =?gb2312?B?eTA4bHpKbXZuNGhtOFNOMS9rblRvbXZiY1haenNMZi9RaFMyYVEycHhrVS9a?=
 =?gb2312?B?Tm9TdzVjMkNmUm5Wam14dlBlbkQxYXpuZUtPbFRiNDRac3MrM05LZjdDMDJM?=
 =?gb2312?B?WmRTRnhVQXNaNHE4MHQ4NlhscC80bVdGZjlCd296cDRoaE9KbjlWZDlpNXhH?=
 =?gb2312?B?QU9JS3liSlVpNElqaUU3dVlIL3RKTiswN05WSy9vNTNzaVBuUmhDTXF5NWpQ?=
 =?gb2312?B?dnlyOTZLV0V2UlVXb0lWZ0NUL2M0b2t3QzQ1alFXQ1RGNlcyODFMUG4xNUVW?=
 =?gb2312?B?UWFiY09nd3VUVVVxVUd0Q1ROdkpPWXJhTWZ3QXByK0tlcVhlTjAyRzNPMkEy?=
 =?gb2312?B?L2pkVUtZazBIazg0TGJEYVY5ZmJWVWxWWXkvN1dZd1BLQWkyNUhuU1Bvdk5l?=
 =?gb2312?B?eGZjbUdpNWcvby9CTzVBUVZWU211WEt0Wlc4TXg3RXM1RXBOV3UyMkNXdXFw?=
 =?gb2312?B?L2p3L3dPRG1ESGh3QmorVWxOWlQ1YkZVYTJ5S25rOFBUNjdwdXpLMDVSM2g0?=
 =?gb2312?B?TVg1ZVgwc1ZhQ2FrUytBSXh4cysyRG1MNFZMalpFM1RsejJhVE05S3VoYUVv?=
 =?gb2312?B?ZUJqV0tDRUJBYUZYdFcrQWlsMW53S3Yzd1V6OXpkOUs2MXFQL2dpWDNUNGRB?=
 =?gb2312?B?c3hRUU5JN1JkNktvS0J5ay9GaDMyc2l2NUpPS1p5NWtxb2pVRTRua0pwSStR?=
 =?gb2312?B?bWRURlB4cjVKSnFlZENtRS9YdWdjOGJNUVRrSzhQSUxrY1YyejlaSkZmNGtu?=
 =?gb2312?B?UXd3YmRKZzFpV1ordmpuRXhxT2V0TjdxMGxVUm9SMjg5NGJib1NTMER4K2pJ?=
 =?gb2312?B?ditxcFdyU2NSZUpPQWp3RVZtaDYzT09rOWtHak9VRWMyd2k3Ri9ob25aTXNL?=
 =?gb2312?Q?TELKa2ZljILtVjMSgat7cSLn9?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB11483B8E76FD565C2B2BE38749BA2ATY3PR01MB11483jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11483.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3996e6f-3b57-46f0-d822-08de35fc6777
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 01:52:11.6390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 60IFqe6Im4Y8xhJlFu/NcG04bsCeeXWpDFH5rszfI0ew/S1/X5mTI2c8pC+JzivZTPCTF5DrUA/eZ9tewGQbYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 01:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227375

--_000_TY3PR01MB11483B8E76FD565C2B2BE38749BA2ATY3PR01MB11483jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUm9zcw0KICAgIEkgd2lsbCBtYWtlIGFuIGV4YW1wbGUgdG8gZXhwbGFpbiBpdC4NCiAgICBX
aGVuIEkgdXNlICJnbnV0bHMtY2xpIC0tZmlwczE0MC1tb2RlIiBpbiBtdWx0aWxpYiBlbnZpcm9u
bWVudCwgaXQgc2hvd3MgbGlicmFyeSBub3QgZm91bmQgZXJyb3IuDQogICAgIHJvb3RAcWVtdXg4
Ni02NDp+IyBnbnV0bHMtY2xpIC0tZmlwczE0MC1tb2RlDQogICAgICBsaWJyYXJ5IGlzIE5PVCBp
biBGSVBTMTQwLTIgbW9kZQ0KDQogICAgQW5kIGl0IHdhcyBjYXVzZWQgYnkgbGFja2luZyBobWFj
IGZpbGVzLg0KICAgIHJvb3RAcWVtdXg4Ni02NDp+IyBscyAvdXNyL2xpYjY0Ly4qaG1hYw0KICAg
IGxzOiBjYW5ub3QgYWNjZXNzICcvdXNyL2xpYjY0Ly5saWJnbnV0bConOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5DQoNCiAgIFRoZSByZWFzb24gaXMgYXMgZm9sbG93aW5nOg0KICAgIFdoZW4g
JyR7c3lzY29uZmRpcn0vZ251dGxzJyB3YXMgY3JlYXRlZCBieSAnbWtkaXInIHdpdGggbGliMzIt
Z251dGxzLCB0aGUgZGlyIHdpbGwgbm90IGJlIGNyZWF0ZWQgYWdhaW4gYnkgICdta2Rpcicgd2l0
aCBsaWItZ251dGxzLCBhbmQgdGhlIHN1YnNlcXVlbnQgY29tbWFuZCB3aWxsIG5vdCBiZSBleGVj
dXRlZCwgc28gaG1hYyBmaWxlcyB3ZXJlIG1pc3NpbmcgaW4gbGliNjQgZW52aXJvbm1lbnQuDQog
ICAgJHtiaW5kaXJ9L2ZpcHNobWFjICR7bGliZGlyfS9saWJnbnV0bHMuc28uMzAuKi4qID4gJHts
aWJkaXJ9Ly5saWJnbnV0bHMuc28uMzAuaG1hYw0KDQogICAgU28gYXBwZW5kICItcCIgcGFyYW1l
dGVyIGNhbiBhdm9pZCB0aGlzIGVycm9yLg0KDQpMaXUNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCreivP7IyzogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+DQq3
osvNyrG85DogMjAyNcTqMTLUwjXI1SAwMjozNQ0KytW8/sjLOiBMaXUsIFlpZGluZy/B9SDS0rah
IDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0Ks63LzTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4NCtb3zOI6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIGdudXRsczogZml4IHBvc3RpbnN0IHNjcmlw
dCBmb3IgJHtQTn0tZmlwcyBmb3IgbXVsdGlsaWJzDQoNCk9uIDI4IE5vdiAyMDI1LCBhdCAwNjo1
OSwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGxpdXlk
LmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+DQo+IFdo
ZW4gZW5hYmxpbmcgbXVsdGlsaWJzLHRoZSBta2RpciBjb21tYW5kIHdpbGwgYmUgZmFpbGVkIHdo
aWNoIHdpbGwgY2F1c2Ugc3Vic2VxdWVudCBjb21tYW5kIG5vdCBiZWluZyBleGVjdXRlZC4NCj4g
U28gYXBwZW5kICItcCIgcGFyYW1ldGVyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5n
IDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiAtLS0NCj4gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z251dGxzL2dudXRsc18zLjguMTAuYmIgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251dGxzL2dudXRsc18zLjguMTAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0
bHMvZ251dGxzXzMuOC4xMC5iYg0KPiBpbmRleCAyZWY3MWExMjEzLi41NmE4NGY3NmYwIDEwMDY0
NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC4xMC5iYg0K
PiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC4xMC5iYg0KPiBA
QCAtOTAsNyArOTAsNyBAQCBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiDQo+IHBr
Z19wb3N0aW5zdF9vbnRhcmdldDoke1BOfS1maXBzICgpIHsNCj4gICAgIGlmIHRlc3QgLXggJHti
aW5kaXJ9L2ZpcHNobWFjDQo+ICAgICB0aGVuDQo+IC0gICAgICAgIG1rZGlyICR7c3lzY29uZmRp
cn0vZ251dGxzDQo+ICsgICAgICAgIG1rZGlyIC1wICR7c3lzY29uZmRpcn0vZ251dGxzDQo+ICAg
ICAgICAgdG91Y2ggJHtzeXNjb25mZGlyfS9nbnV0bHMvY29uZmlnDQo+ICAgICAgICAgJHtiaW5k
aXJ9L2ZpcHNobWFjICR7bGliZGlyfS9saWJnbnV0bHMuc28uMzAuKi4qID4gJHtsaWJkaXJ9Ly5s
aWJnbnV0bHMuc28uMzAuaG1hYw0KPiAgICAgICAgICR7YmluZGlyfS9maXBzaG1hYyAke2xpYmRp
cn0vbGlibmV0dGxlLnNvLjguKiA+ICR7bGliZGlyfS8ubGlibmV0dGxlLnNvLjguaG1hYw0KDQpJ
IGRvbqGvdCB1bmRlcnN0YW5kIGhvdyB0aGlzIGhhcHBlbnMsIGFzIHN5c2NvbmZkaXIgaXMgL2V0
YyBpbiBhbGwgbXVsdGlsaWIgY29uZmlndXJhdGlvbnM/DQoNCkNhbiB5b3UgZXhwbGFpbiB3aGF0
IHBhdGggaXMgdGhlIHByb2JsZW0gaGVyZSwgdGhpcyBhcHBlYXJzIHRvIGJlIHNheWluZyB0aGF0
IC9ldGMgZG9lc26hr3QgZXhpc3Qgb24gdGFyZ2V0LCB3aGljaCBkb2VzbqGvdCBzZWVtIGxpa2Vs
eS4NCg0KUm9zcw0K

--_000_TY3PR01MB11483B8E76FD565C2B2BE38749BA2ATY3PR01MB11483jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Ross<br>
&nbsp; &nbsp; I will make an example to explain it.<br>
&nbsp; &nbsp; When I use &quot;gnutls-cli --fips140-mode&quot; in multilib =
environment, it shows library not found error.<br>
&nbsp; &nbsp; &nbsp;root@qemux86-64:~# gnutls-cli --fips140-mode<br>
&nbsp; &nbsp; &nbsp; library is NOT in FIPS140-2 mode<br>
&nbsp; &nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; And it was caused by lacking hmac files.<br>
&nbsp; &nbsp; root@qemux86-64:~# ls /usr/lib64/.*hmac<br>
&nbsp; &nbsp; ls: cannot access '/usr/lib64/.libgnutl*': No such file or di=
rectory</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;The reason is as following:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt;" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0);">&nbsp; &nbsp; When '${sysconfdir}/gnut=
ls' was created by 'mkdir' with lib32-gnutls, the dir will not be created a=
gain by &nbsp;'mkdir' with lib-gnutls, and the subsequent&nbsp;command will=
 not be executed, so hmac files were missing in lib64
 environment.<br>
&nbsp; &nbsp; ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* &gt; ${libdi=
r}/.libgnutls.so.30.hmac<br>
&nbsp; &nbsp;&nbsp;<br>
&nbsp; &nbsp; So append &quot;-p&quot; parameter can avoid this error.</spa=
n></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
Liu&nbsp;<br>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Ross Bu=
rton &lt;Ross.Burton@arm.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2025=C4=EA12=D4=C25=C8=D5 02:35<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH] gnutls: fix postinst script for $=
{PN}-fips for multilibs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 28 Nov 2025, at 06:59, Yiding Liu (Fujitsu) via=
 lists.openembedded.org &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org=
&gt; wrote:<br>
&gt; <br>
&gt; When enabling multilibs,the mkdir command will be failed which will ca=
use subsequent command not being executed.<br>
&gt; So append &quot;-p&quot; parameter.<br>
&gt; <br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt; meta/recipes-support/gnutls/gnutls_3.8.10.bb | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recip=
es-support/gnutls/gnutls_3.8.10.bb<br>
&gt; index 2ef71a1213..56a84f76f0 100644<br>
&gt; --- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb<br>
&gt; @@ -90,7 +90,7 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; pkg_postinst_ontarget:${PN}-fips () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; if test -x ${bindir}/fipshmac<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; then<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir ${sysconfdir}/gnutls=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${sysconfdir}/gnu=
tls<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch ${sysconfdir}/gn=
utls/config<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/fipshmac ${l=
ibdir}/libgnutls.so.30.*.* &gt; ${libdir}/.libgnutls.so.30.hmac<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/fipshmac ${l=
ibdir}/libnettle.so.8.* &gt; ${libdir}/.libnettle.so.8.hmac<br>
<br>
I don=A1=AFt understand how this happens, as sysconfdir is /etc in all mult=
ilib configurations?<br>
<br>
Can you explain what path is the problem here, this appears to be saying th=
at /etc doesn=A1=AFt exist on target, which doesn=A1=AFt seem likely.<br>
<br>
Ross</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB11483B8E76FD565C2B2BE38749BA2ATY3PR01MB11483jp_--

