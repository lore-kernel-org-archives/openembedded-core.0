Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C0CC5AC7C
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:47:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.498.1771602425357942461
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=aBon/vkK;
 spf=pass (domain: axis.com, ip: 40.107.162.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5j3Iedu+FTYXfpgNIfqUHefl/QcMAIQX28E1eFC3IAGoWgu5kiT4R7/r60GGgp98jfJ4WiJlUu2X1tXEmsNnn7iYqroNvFokJhIxZ1q7VPMNMKWbNYyfL5is5+4RuhjDmL1+ZFMRiypLNYo14iae7gerwJVblrU0wKtMdjf79R5Ozi5NDI04G3uPBQB77U7VS1f/KEmhU8aX38x+30LX+vv5NZ3l9D9LJmAqYKQFIoPGczBR+18vVOGbU9MqevEv0gi/Ri3lSyABBeqEKZR/ylA/Wk2jtDVxMjqi34FTdoGor+R9s8XfKn2s5dOkPR9DECBU1trYLr/Gt9juUQqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VCo3fL9OBfJ4efbjVmH8IP8qchRelkhAp0CTI0Prw8=;
 b=p3+YBV2ElR6//ytZ26YH25Hi0TQolmrPrVMBfwODftPlwLURiCjBh7fQvl/Navn7+eiaIa8jIkm7EWAh9eQ0YYhaO/DiElVLuEREx6i5tDZrwhpF/8BHveKO8rSlGUg64EUF82a1r31nQKQe4QZOKoDJIMU66TVxaVoFZm/7Jw7clsg1nq7z9pBIALACG0AgxS/PdAkJ9rACMa425pUj36WAgWd4aQkc0AvmdT5K+dHASSyns5I+hPsXl+WtHWKis1y/hzRLuHp2efpuu/wCHhSy3oI3IdfWGVojP991xGUHUBbqFowvxtYLq2SCvntVtO/APMT6lpy8X4yKjhG9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VCo3fL9OBfJ4efbjVmH8IP8qchRelkhAp0CTI0Prw8=;
 b=aBon/vkK5tyEPsayYTjCFbzYIawdR7bFch4/lH7NSkisGuPFAa7jThI6GESIMMJCtZfxnlaLXgEsEn0KcUC/yU50/smMIm9gtvkzw/sbAY04jQeBJ/9IBPdK526VWEY/Nc7iTyP3+5EDSVpVtPLIXbmMKSeNINTEZtaOMKO6ydo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI0PR02MB11173.eurprd02.prod.outlook.com (2603:10a6:800:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 15:46:55 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:46:55 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "benjamin.robin@bootlin.com" <benjamin.robin@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
	"jpewhacker@gmail.com" <jpewhacker@gmail.com>
Subject: RE: [OE-core] [PATCH 1/2] meta: update avahi patch to remove ref to
 rejected CVE
Thread-Topic: [OE-core] [PATCH 1/2] meta: update avahi patch to remove ref to
 rejected CVE
Thread-Index: AQHcolhrc9PLzJHFtUKHBWtFrltQe7WLuiGw
Date: Fri, 20 Feb 2026 15:46:55 +0000
Message-ID: 
 <DB5PR02MB102136D45CFB056C2F0B13F1FEF68A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <20260220-update-patch-with-rejected-cve-v1-0-cf113d8a15ca@bootlin.com>
 <20260220-update-patch-with-rejected-cve-v1-1-cf113d8a15ca@bootlin.com>
In-Reply-To: 
 <20260220-update-patch-with-rejected-cve-v1-1-cf113d8a15ca@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI0PR02MB11173:EE_
x-ms-office365-filtering-correlation-id: 37a65a77-843d-4f97-761e-08de70974667
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Ly9jakFVbnJGekd6TXN2MzRTcGlvYmlIeThyNzgvUEFHb0hwTkxIUXVZN2JF?=
 =?utf-8?B?UWc5Yk0za3NQR1RydDVnby84MEYwWmphUk8zWHZHWkhPa0NicEpPSzJrZnhX?=
 =?utf-8?B?bVB5cS9PYVpsZGxpOGRDWUc1K0w5Z1YvQlNKNXdoV1JGSGRwdGFLSWd4YWJi?=
 =?utf-8?B?a2dwbXczVG1nZXd3VS9TUmpha1h3d1hmVncvWmdxWklFa1FId3RZVVhOVHB1?=
 =?utf-8?B?MFF1S3ZxWGJZS1lYNjJqUEQ2U1k1TWhmQW16YU5OdUdoQUtqbFdmdnlpMlM0?=
 =?utf-8?B?ckJxaWRnSTVlckhqOFhheCtDQ0lkYzI2T1RKN2xCTFY5RERjV3ZwSEt6Tk9m?=
 =?utf-8?B?ZDdnVEpUTHlNbGRLWjhialNQMVJ0R05qdmhrb1o0S2dDMy9KVzVkdFl1bkd2?=
 =?utf-8?B?OWlZMkZVZVRUUllnR0d5cE1kQjY5UWorZEhHNTJiSHZJQ1FHWng0UUpjMk54?=
 =?utf-8?B?Smh3WWFaUlk0QzdjdVY4b2pXcFFLcTcwQ3d2MDVTMzBXZUQzWjFSL3hmdXNT?=
 =?utf-8?B?emJPRDdCTWt6bWY1UDZPdmw1OUVRU25KZGt1c1hxRitXMDhMc2ljeUswcno1?=
 =?utf-8?B?dVN0a29tUXkxUGg3VTNFaFVhWDlxQXZlSmxaVzR3a0JWcnR1L2xrQXllUDda?=
 =?utf-8?B?bk9uTE9tVDlBRUt0QnJOZmlHY2MxckRPUzcvMzl0bDdkc2tPcFA0QWxTMEJ3?=
 =?utf-8?B?dUErOVMzeDFucWpEdGFxRExQWlNyTXlCc0xYSHdWOXdPdi93Z21hWVBRbmxr?=
 =?utf-8?B?WStoZFRDMkRZVDAwK2s2MWVUV0ZoVmdnMmNteVh6azZ6cHd6c3htck9WdDF3?=
 =?utf-8?B?VkhwODRvYUpQVjIwck9Yd3Bzb24vdHFvT1lud3FzZkpVUFVuTVlRWHhGcGhl?=
 =?utf-8?B?Tno3TE4xT00rcklSWC84azBGUHU4eWU3bTZmdGJrMWJwTGVPbGFWVFpvcFBp?=
 =?utf-8?B?K0F1RURxeVRSemEzSEFEUGxNSXhIV3h0UWNudDFvK2xwVEVLRVhTZ1ArT3Rl?=
 =?utf-8?B?bk90TzNqcnZjVkNuWGIzOG5sK2dBNjRiMzc5ZWVXODVSbUpUdmpWZFBSdW9t?=
 =?utf-8?B?bnE5bjc3OWpHR2p0ZUlaUitsYjhPakw1WUh4TGVJOWI1SzJTSGJqelZ5NWZS?=
 =?utf-8?B?OGt3NTJVVUY5MnZXK0lMM0ZydmtNT3dYZnQ5cTZZckw0S1JaYWtZTmo1MkEr?=
 =?utf-8?B?RHVnZ0pWVlF3NTIwMTA0ZzEycWpEZ3JBVEtuMFZqS3FRQ3pZUzdEYzZxVDZt?=
 =?utf-8?B?WG5FSjFZdGVvZmRyM21TY1NVRStZZkNicGR1QnNOV3BWRUZ1UkdEK1ZJNnlS?=
 =?utf-8?B?TTVxOFVxNWFFRFliVi9xdDdHbUdNMlc2eGJpeXJOendUK2NDZHpTOGZjOGdR?=
 =?utf-8?B?SVkvRGxjL09TNHVKNVBSOE9iN2Z6MkVwajVLUlpYb0NSbFp4czJMUElkZi9i?=
 =?utf-8?B?T2ExZ2hKOE05YzRIdG0xRjJTNC9VM3BJeVk1YWlBY1o0eTlOOHhpQzNHbFYz?=
 =?utf-8?B?MGd6UjkrYzlQZlhoWnVHZ2puZVc0T3ZsVzVJZld1NjYyUUR0R0lrQlF5Skw1?=
 =?utf-8?B?TGNuUXVzNGQxTUsxbXRPZTAzWWwwTHROYlBxdEhEQkc3d1RZQzluTGE1L2JC?=
 =?utf-8?B?ZGtlZ2ZzeXVScG5qVWx0VkY3SnlnWi9vdkZsaHZnRjg0SXMxVzNNQ3VDeWdL?=
 =?utf-8?B?OGsrakRtYzF5OHVPT2o1aS9vbUFiODhGTXpCaFJUV2hUSkZSaDk1YXc3blVW?=
 =?utf-8?B?OFZySjZvVGZYdVVWU2t5UVpNb0UrQlRiQXl6MmxoTldSNG1KU0pUTmxvaC9a?=
 =?utf-8?B?cytocVlIRzRSYW1jUXllVE0vT1o2Q2ZibEtwSUlkUzZCcHpjbWJJVXc5ZmdF?=
 =?utf-8?B?RU1hVmxBRVNxRHhHWlJQZVFWWHV1WXpQekdVUi9lU0x3ZW5PanJGZ014WWpJ?=
 =?utf-8?B?dDAzaHA2UitoU2JwNEUrV2lJU1E0TmZSZUV2dmlVSjl2U0RlOGtMaDFrQUFt?=
 =?utf-8?B?VmtxWnhYSllQUi9KQzNZUXFTNk0vbkMrUVRxYW1ZNHJrVENqb1BLVVdrbjRa?=
 =?utf-8?B?OW5jaHFsT2FNMzFSZDY1T1gyNGVLSVlIK3YwRVFtYTU1UW41Tlg5R0dNSVlS?=
 =?utf-8?B?ais2dmJhMW9TV05DS0VyWk5jOTh0OURkdFBxMHFBSEFMZnFaZWtRRnJkaStl?=
 =?utf-8?Q?Mc7udi9Yl0lDfZu4hf5oQ8g=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RXZKSWExZS9jMXVWUXdjKzZEbnVpMThHcTMyMDRqcUQ4K3EvcUtJdkpqYWFu?=
 =?utf-8?B?R0N1TTdVQ3VpMGNTZ05ONVd6UkhNWVBtTlcrbS9vK1k0emsycnBubXdhNzh4?=
 =?utf-8?B?VzJTQ2RQYlRxbWp4ZGQ3SXZUVGtDK2Q5KzRoNGoxNjhCMUhtdmNkZVRORUd5?=
 =?utf-8?B?Nm1tOXV4NTRlQVQvNENNMXVGRjFiYkFpUllWaXl3QjNON3hqWlU1SUNFQnVv?=
 =?utf-8?B?bkZhVUhVdFZCajY4S01VMTdUUlF5VEpCRlN6WXBlTUVsY0Frbkh2M1A5YVVk?=
 =?utf-8?B?RW1WdVROS2Fxb0I5QkxIWnlJTFYzUHorbHFoQkpIR2xkRWx6TlBlZ0pnRyti?=
 =?utf-8?B?Q2tZTXhnYS9oRS8wcVVaNlpVY2c3Mks4SFRMSC9JeFVSMmtUY0M0Z1FQUzhU?=
 =?utf-8?B?MHhyKzBtb3Q0VHNBd0xqbkNlRmJHRlhPT1pobGJucUR0K1Yvby9DVEtoZVFO?=
 =?utf-8?B?Rkxmb29NWjJRdmtyY2cxNFp4Q2NIUldCVGhlWVU1blBWWWJNS015YlFGKzFT?=
 =?utf-8?B?c0hhUk9QUWxDTGgrMWpPb2N1WjRRWlpScktSQU5LR1ZyR0VYRkgrYlpuNXgv?=
 =?utf-8?B?RWNRUHppYmdNV1B4Q0tmKzROTHVQanF3RGRlbEVCSUVqNytNVGZtTGJSUXpq?=
 =?utf-8?B?cERTSGhWaVl3QTRMR1BPa29XSHpEajkvU1h3ZHJWWE1HdVE3T2U3QTQ0eDBy?=
 =?utf-8?B?QzIxV3VIbS9BWnZBQ0JYSXlOUEFlQ2MySkJNR0JBRzMvclJ0Wmo1bDVtaGdM?=
 =?utf-8?B?OS84aHhOR0VBSjRLVXczYzI0elBOb2FaQ0pvbHVzWisydlJVOU5sQW0vQ3Av?=
 =?utf-8?B?UTZOeTNIb0hjRVZacE5LYUpBN2JzYXkxb1NMRHdpWEszd2ZYbms2K1pWTFFz?=
 =?utf-8?B?Skx6ZlBtTjlnV2xmSzR2TU4wTXRHUFozS252QTU3Wm9PTkppRkRWNjFCTnZr?=
 =?utf-8?B?MkhLWHZkRWNBVlZVWkZPSHhvTHBNbVg1dXBES2dpd3o4Qk9ENnBvZncwbGlK?=
 =?utf-8?B?TVJrWXlibWx5YUZ3K3FKMTFmcm85djU5cUhjcjNEVTBnanhHbFBJNlJQZElv?=
 =?utf-8?B?alE5WDFCMmpnRlN0V2pXblljdktLdGw3eWRTRzdnNjhINFNYNXQ5WjAxSm1h?=
 =?utf-8?B?Z2h6cGd2blN1ZXFOdmxUWWhQUWowdDNXckNOb2RZNXhydG9PcUtPaytUWHlq?=
 =?utf-8?B?ekYxNzl6OS9CUUQxYTIrMENLQzNPdjZNbmZiV09HamR4M1RBWG1kRkY0V1Jh?=
 =?utf-8?B?VzcyRmRyaUhScnFCZTBvcDdBRnNkeHF0TEJjYWlaWXJCSDBOdDQvcWppVkNv?=
 =?utf-8?B?cVU3SFI5djJuOTRibUR1cUZqTnQzaCtJZHFlREdSOHpkU1Y2aFZGSU0wbHlX?=
 =?utf-8?B?clJSdWR4QnZ2a3V3b1VrcEExVU1yZE9aUmdVS296cWZlZTQvU1RtcXNwRmsw?=
 =?utf-8?B?N2doMktoZGFGdmFSM2NUdG4xVElBc0ZZTDl4dkdyNUtUc3dOS3VkSFBBOENy?=
 =?utf-8?B?aEI0M2drMXJhSm02ZVFGQXE4bE9OOEE0b0sxc1ZvS1hxSGl0WkRDRWE4NTlr?=
 =?utf-8?B?L2NDZlE4MzJZRlR2SXlTbWpkSGtUMzBteTIwb0ZtZ2p0WWM2NFBSNm5tVU5k?=
 =?utf-8?B?MWVUaTNrbkNkQlNDUVUvT3laY1pXMGhYaTdXOE9UTkhpeEgrS0lSM3EwSk1S?=
 =?utf-8?B?elcrRmF3QzBjNGx2THdNMHBydE5uZ0VpenUzTXlXZTd5cTZkc2FnVUZCa1FP?=
 =?utf-8?B?aXNDS1BQajZ1VmI4MVlnZVd5YWljTkk3MVFCZEo5c3JZdVIyUDd0TlZkRWFB?=
 =?utf-8?B?VEMxWEhOTHJyV1pSeDZlZHNyOTJUS29ENC9QNE5kU1AwNGNTUVZnUG9wanBS?=
 =?utf-8?B?WUdxcVhrQldUUkUxeFdvT0ZnREh2S2tNUStma25qZlZ1QmNkYWxMdFlUZnda?=
 =?utf-8?B?dTYzYlV6VmgyREJ5alJDZHplMytkYWIvb3drUG02N28yWEZueE80WkFWVlBP?=
 =?utf-8?B?QnNXTlh5V0FEZ2hEL2JHRUdsQWxiak1uQis3QzVLMzZ4N2ljbVdHWkx6NGxm?=
 =?utf-8?B?TU5Ucnk5bmpHVVpGM0RnMUxROGExSTN2N28ydGU2YnM0VXpMM3QwM2ZqV2Fn?=
 =?utf-8?B?YkVka0dCL0JnWkM3cE8vQXF6UGdMZWJkbkdMM2R2N2tUVnFxRFpjZzV0SmFm?=
 =?utf-8?B?RngyOUR3WWFiY3B1eXg4dkxSaW5Ua2dJdzNVUUpHanRCWWZ5bnY1UStoNmZ4?=
 =?utf-8?Q?HBq+KUMjzTAtDZfV8FFEpCmn2ywn8Y9RV0qIsP4ZLQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a65a77-843d-4f97-761e-08de70974667
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 15:46:55.6681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zABsVug1ULUPx3HbuEb+3S1jDN+zwHdFWDr+oUZcxGKZGcSRavX+MAGS880rEETz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231529

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgQmVuamFtaW4gUm9iaW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU2VudDogZGVuIDIwIGZlYnJ1YXJpIDIwMjYgMTI6MDINCj4gVG86IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IHJvc3MuYnVydG9uQGFybS5j
b207IHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb207IG1hdGhpZXUuZHVib2lzLWJyaWFuZEBi
b290bGluLmNvbTsgYW50b25pbi5nb2RhcmRAYm9vdGxpbi5jb207IGpwZXdoYWNrZXJAZ21haWwu
Y29tOyBCZW5qYW1pbiBSb2JpbiAoU2NobmVpZGVyIEVsZWN0cmljKSA8YmVuamFtaW4ucm9iaW5A
Ym9vdGxpbi5jb20+DQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0ggMS8yXSBtZXRhOiB1cGRh
dGUgYXZhaGkgcGF0Y2ggdG8gcmVtb3ZlIHJlZiB0byByZWplY3RlZCBDVkUNCg0KUGxlYXNlIHVz
ZSB0aGUgcmVjaXBlIG5hbWUgYXMgcHJlZml4LCBlLmcuOg0KDQphdmFoaTogUmVtb3ZlIGEgcmVm
ZXJlbmNlIHRvIHRoZSByZWplY3RlZCBDVkUtMjAyMS0zNjIxNw0KDQo+IA0KPiBDVkUtMjAyMS0z
NjIxNyBpcyByZWplY3RlZCwgYW5kIHNob3VsZCBubyBsb25nZXIgYmUgcmVmZXJlbmNlZC4NCj4g
Q1ZFLTIwMjEtMzYyMTcgaXMgYSBkdXBsaWNhdGUgb2YgQ1ZFLTIwMjEtMzUwMiB3aGljaCBpcyBh
bHJlYWR5DQo+IHJlZmVyZW5jZWQgaW4gdGhlIGxvY2FsLXBpbmcucGF0Y2guDQo+IA0KPiBUaGUg
Q1ZFIGRhdGFiYXNlIGluZGljYXRlcyB0aGUgZm9sbG93aW5nIHJlYXNvbjoNCj4gICBDb25zdWx0
SURzOiBDVkUtMjAyMS0zNTAyLiBSZWFzb246IFRoaXMgY2FuZGlkYXRlIGlzIGEgZHVwbGljYXRl
IG9mDQo+ICAgQ1ZFLTIwMjEtMzUwMi4gTm90ZXM6IEFsbCBDVkUgdXNlcnMgc2hvdWxkIHJlZmVy
ZW5jZSBDVkUtMjAyMS0zNTAyDQo+ICAgaW5zdGVhZCBvZiB0aGlzIGNhbmRpZGF0ZS4gQWxsIHJl
ZmVyZW5jZXMgYW5kIGRlc2NyaXB0aW9ucyBpbiB0aGlzDQo+ICAgY2FuZGlkYXRlIGhhdmUgYmVl
biByZW1vdmVkIHRvIHByZXZlbnQgYWNjaWRlbnRhbCB1c2FnZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEJlbmphbWluIFJvYmluIChTY2huZWlkZXIgRWxlY3RyaWMpIDxiZW5qYW1pbi5yb2JpbkBi
b290bGluLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2F2YWhpL2Zp
bGVzL2xvY2FsLXBpbmcucGF0Y2ggfCAxIC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9hdmFoaS9m
aWxlcy9sb2NhbC1waW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9hdmFoaS9m
aWxlcy9sb2NhbC1waW5nLnBhdGNoDQo+IGluZGV4IDI5YzE5MmQyOTZlMC4uOGYxMDI4MTVkZjA0
IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2F2YWhpL2ZpbGVzL2xv
Y2FsLXBpbmcucGF0Y2gNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9hdmFoaS9m
aWxlcy9sb2NhbC1waW5nLnBhdGNoDQo+IEBAIC0xLDQgKzEsMyBAQA0KPiAtQ1ZFOiBDVkUtMjAy
MS0zNjIxNw0KPiAgQ1ZFOiBDVkUtMjAyMS0zNTAyDQo+ICBVcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0DQo+ICBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4N
Cj4gDQo+IC0tDQo+IDIuNTIuMA0KDQo=

