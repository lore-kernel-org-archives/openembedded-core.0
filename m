Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907F7CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 06:02:54 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.70])
 by mx.groups.io with SMTP id smtpd.web11.2532.1759384972164812600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 23:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KkJwPFPq;
 spf=pass (domain: siemens.com, ip: 52.101.72.70, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChYnJNs/FanGXW0qx3FGstG3zzJ7JfrlStgrZo4IEpoZWqPvjtOKTJFzlVAEYmHtxLCE9dcPo9RgwPEyl4hmLoqYRvEiKGHW0UGkVbwG0KIgCasKyzXBs2iTEFYOeiM6VlsTTWdA4jBxaTHXs5r1ryb8/g2S747A9NtcZZ5s1GBmcgHDS9KMTP5I8VoDndVGXeV/z/7zi/3hEF+FS+kUVFHNbrPjJJAl6DyrfDm62lGJvsJfMoWmOVDlvjtdI6LNxJuqv3wupbt9h/IQQM7MY4AqxKTgJCRMYvHohdH2VlRj+a8uuuiih7taAN+DRN4eZMtNtHIuk81J18lP7ZmCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpbzSxiZSbAx8Lfon17+diStRH9B8j5JzOUVscVtuRU=;
 b=RDZKIi1q+y1bekSeSPNU/lBlkUgyIIAA399yxc6PLrB+cKAIvb0iYHE8GvuT5dOL63EveUNx0gQYkfMQPhH371N05Z+2tbXYLfkSKZfvtW5DTC5BKrkHqRQPhVQ08nKk3JtT3f59++FyTnuLPdor8xsFLplsdIycTDRePKqlItY/4PKmilgM/JLlbC6PrLVdjkm50z+TNnc8c69No40y5g2X3Dn39a73CtceTXnrxuQfmDks3U5YrgxShuc6Pn3aPM70Hp8+/J7j2ptRMk2djw/ukhqS26o+8/YF28vW+V4EcXRRITUSXotmKeIT/1d36gJBjP06Nl2BazR+w0lkVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpbzSxiZSbAx8Lfon17+diStRH9B8j5JzOUVscVtuRU=;
 b=KkJwPFPq1UD9VUHdr1IEoqZwUkto2eqD4xpniEu0TQKNic2yLiowafl9MXLF8g6NUcNmHCtSsHf7qA0GZVmbEfpXdsjH29UuhGIHvhqZ+ThgHlVuqCaKh2nOgsZtD/F3AN/uKaLnuAF3+kb6bNt4sgjv8Qe+Bj9f9sbDsCrNkjj1u/ifmZDN9XxdK+9zamStsUVUQRKwoZIHZBZ9F9AWpABlF7l1T3RtrWvUJp+5ELexV3uB8RqGxBVL0Z3bGZpNlg7wWJqpwlA8kDluNceGKJEK38zetQpThu7kYjoR/mu0zflLj0JII8ixUo0hg2bxnFZsKIPhErSg63N576KcUA==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by AS4PR10MB5990.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:51d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 06:02:47 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 06:02:47 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] expect: fix native build with GCC 15
Thread-Topic: [OE-core] [PATCH] expect: fix native build with GCC 15
Thread-Index: AQHcMxSF5JjsXyabWUqAZ1GjWQeuXLSt2wwAgACDIQA=
Date: Thu, 2 Oct 2025 06:02:46 +0000
Message-ID: <0b8f8b4bd1c7562a22640722a8b5a8c81e639c24.camel@siemens.com>
References: <20251001204638.1442908-1-adrian.freihofer@siemens.com>
	 <1d3aba29ea3d06c9c6066df0ce4728ece53680a0.camel@linuxfoundation.org>
In-Reply-To: 
 <1d3aba29ea3d06c9c6066df0ce4728ece53680a0.camel@linuxfoundation.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|AS4PR10MB5990:EE_
x-ms-office365-filtering-correlation-id: 3773b0f9-8c9f-4b96-d8eb-08de01794fa0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MXE2QTRwNlBvUlpmQjRRSVYxdjRGYi9lK0JHQU5WVFdMUWRJVDk5a2pyK2ow?=
 =?utf-8?B?Y0diOUdxUUFpMm5kK09pMnhoNXg1OFZRdGNlZ3lSblRiL1VCZEJ1TkVBaWhP?=
 =?utf-8?B?LzhOcmxXcFo3WG44bFpuOTBxNlhRV0Y0LzFQNERqWmZ0MkdJdGVqdFA1OFk1?=
 =?utf-8?B?SlR2dGUvZnFIajJIRHM1bTh5ZkxBWUVmRU1wdWVoU2hlZHVrMkRMQjhCNVJG?=
 =?utf-8?B?YkpadENQQlVRcHNrSjBMclNYOHh2UjZhQnpTV1VNcXgwYWFJT2VXV2JuaGdJ?=
 =?utf-8?B?aE5TZERJeUNwQmN2aXRaemhTZ1JoTGNjU1BlNERBMENlUjdCZWM0TXord0Y2?=
 =?utf-8?B?U3YyL25BQ2hxWUU1czAydTI0ZThHL1dEdkpXRk9LYW9HS3I5UkRlTU9Ed080?=
 =?utf-8?B?V0xtRlVERUIzQWVIdWZIcGh1QzZQem5vb1I4WTRFUnFSaFFOa1FMeDJxc3M3?=
 =?utf-8?B?S2R6MnhieG51Q05IODg5UzE4cEN4UGRROUtHR3pacW56Z0ptVEMrTnBqRms3?=
 =?utf-8?B?aXlDbk5NMzFLZStPYnlLMTR5ZFFnRjMxN1FUMHc1TjU3c0V3RTllMVcvSUY0?=
 =?utf-8?B?VnJDNUFWeGpkRE5vc1o3MjZ5a1N0OXFBcTUxaEM1WHQ0Rnd4VVVsQllMMnBF?=
 =?utf-8?B?RDJaU0FveGVEaWN6NW1VYmdjR3MybkdjemcreG14UmVNVFBDeWVUbXBYdnc2?=
 =?utf-8?B?eGRnbyt1UFU2ZlJpcjZYbCs0d2VJNmpDd0gwK3lhNjdyMmUzS0lTQXhYa1pO?=
 =?utf-8?B?V0FtYXhjT1lCVk8rVEtsVFBLdEs2OHdUUTIxd2NGQXdrbEpPdnRIL1lCNzdj?=
 =?utf-8?B?ZE54YVoxdGJWRXYvd1lCQk1qWUlKemVSU08vQmRSRkNBZzA3dlZlVERybTBu?=
 =?utf-8?B?VjhyTUxzUXBYR25KRXNqdm9uZUxiTlF1UHJ3MFdQY3pTT2kvZHAxZ0JWYktE?=
 =?utf-8?B?UUhWeFpDUkdOeXVnT2I0T3NqcEYvZXdiVUtpMTQ0M3FTOXlYUHJ6U2U2YWJW?=
 =?utf-8?B?NDB5cjNrMzNNeGovUEtiQytRMnBvVUN5Q3BqRTd1Sm5PSElENDkyQTlTNmJr?=
 =?utf-8?B?SWRwekV1NUF4K0VVZ1NXSlQ3Uk9ONEVjMDlRNTJnZnZZay9nZDh1WUlucmVO?=
 =?utf-8?B?dW5xNTdtaWhsNXZxSlQ4UUVKdkxUUmltRHdQbjgwZVNqeEFxY0xqR0JTUFBn?=
 =?utf-8?B?REZEa2xjSmpqVnlHckJ2eUZtWm1NZEx4UTZLS1RBczNTOEIrKzVtQm4vRWhk?=
 =?utf-8?B?OFEwSnJGM2VCR3dxa2YrZWxiZ3JkYXV6Zkx1NjlqMWRoMTRRYVRoUzJncUNL?=
 =?utf-8?B?dUFPa3lEdTl1WjlGT3lDa2ZmeDEzcFpON29HajJ1ZHc2Vk1DQnpQUnRLaDZP?=
 =?utf-8?B?aWlsQWdPUWZ6bFdDVlBmOW96STU4T25mS3d2SEdSWmxOUHlkR0M0b1MxT01J?=
 =?utf-8?B?OGp4YWN5SkFla3RIUUVLNW41L0ZwZDZqMW5OTmttU0dHU0ZoYVlVVUpoMjB6?=
 =?utf-8?B?MHp3TzlvV1lNdkhqWXE3b3JTUEwvOGJNTXJld3IxOENkcDQ0Zmwxdm1IaHRZ?=
 =?utf-8?B?Yk0xQUx5bTJCbXJRUEo1RXJERytFOGUwczhBUExPZFNBTTdtUUxqbnJlWElw?=
 =?utf-8?B?VHROZHpqdGx1bDUzNGRpRGh0N3FwZ2VrTFhHQ0hSWEJyZDBnVGJnL3duNzZw?=
 =?utf-8?B?NmtLdEkzamxFUEhGelIvYzRNeHBOWjNhRDV1YnZHVnVHZFVWWlZRU24ycUFS?=
 =?utf-8?B?cGpUeTdjQ3NwR054MVpYN0pIMkRBS3NjNGt0akkrYk16aitYcy81aC9GeGVV?=
 =?utf-8?B?OG4xa3l0RGU1UzNLK1JLSTc2N0hsM2hNWXdmS1oxVzAvMk1Nb28vNFROamJu?=
 =?utf-8?B?RXFsZmtjeEhEcGlPankrQjBKTjZBTDVnQ2x4bXEyOUZlSzNIQzhsOHJJcDlS?=
 =?utf-8?B?YjFidzJrQk0wZjZGR0VZOUF5S0RmT1Q2aDZkS1pCNFdyVVFxN2lqVS95eFFF?=
 =?utf-8?B?T0huNnc3S2VqMTBPaS8zYnZzdTdDdFlPWDdvRENTWDQ3VjFsQStSSCtMYTFS?=
 =?utf-8?Q?Ooc69E?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c05SQmxDOFIxZ0RRQ0Riekt0YVFHeS90YW5Ec0lMZ3hqV2Z2U01pWlVCQ3Ro?=
 =?utf-8?B?ck9HV0MzdkFPMi9vV3JmcTR3dmNhYkFYeFYxWnZUNXpUZE5Sd1VBcDJaZzFt?=
 =?utf-8?B?bDBUK2RQallXclprTlNsb3NUWkdEYW83L3F6ZlBlMEIzeXhZcyt2cytRYzc4?=
 =?utf-8?B?VVVucmEvb09nb01EUHBLNVA5ajVoOEFCRnV1aTlva2Mwa0hoanlXSmg4RXho?=
 =?utf-8?B?WUNoWWdPNG80Y2xFOFVwT1BRQThWV1ZZejFYMkZtN1JvQ2NMdm5JWnRoU2dW?=
 =?utf-8?B?TFRsU0k3M3NzbVFXNThuODFvMjJtTWNBSkRYMXpncE5DUVgzMWQ0SWpkM1dj?=
 =?utf-8?B?Y1NSU1dXbWQ0L2ZLNnU2bEI0M3p4SG44cS80WUdZcW5TM2ZhQzViWk5wMXBi?=
 =?utf-8?B?bnI3LzlmVHViMjNMQ0RvempYMk9jdllTV2Q0aXozQjFVaWlrNHNMdVNhcUVE?=
 =?utf-8?B?bGRtcGZ2Z096VC9FVThYZ2hiSUkxZXd5ZkNVVmc2ZTdhQWdscVo0OGl6RXc1?=
 =?utf-8?B?NXZrY2pLclpidUJrZXFldDR6ZU1MVTNvdFkzTElLVjhVc1VrcXRQOHNqTURP?=
 =?utf-8?B?UHF2UDhoNmU0TkQ3SExMMDI3akl5M2ltckJZZVovUG1jUTdVTlJhdk5Fa1Bx?=
 =?utf-8?B?MFZuUWtwczhlYXJJMTAyRE5qZGp5dVAzcXF3eGEzQWgzZFFIRWZvQ3NQbHhl?=
 =?utf-8?B?dzFYaXY1dE1CNGVmcTJ5QkJzVERldjhrUXM4Ty9EbWk5ak54b0dhYzZIZ09T?=
 =?utf-8?B?bWFTblJscFdsZERKSVkzU01tLy92UXI3QjJMbi9peFdiQ01acFhFWnJmNHl2?=
 =?utf-8?B?M1NCSVFsRWt5dGlsWXRqclgyRjY3clRzbkpZaGh0YmRtZmpYZ0p5S1FmTERL?=
 =?utf-8?B?LzEvd0hHZjlVZS9NTWlJVzRYc3Z2aHBsVmNOMHc0aWRUWWJTZkJVRERPSWVr?=
 =?utf-8?B?UUJncHV0NFRER2tTeXFNYjF2dFpaQTZMRmF1S0dNL2J0cUxoRWVOUHpsM1VV?=
 =?utf-8?B?UmlrcWtodlIxaTFWLzRLZHV4ZUNpUjRaTHlJVWp5V2Q5c0toRGdpaGJuSGNp?=
 =?utf-8?B?VnRxU1MvRnRzdGllSUpZMkMvbGVjRnkyVEF5V21Ta0Q4RWxudjdzb01KenFh?=
 =?utf-8?B?OU1LM3F6TlhEa2xzN0U2Qm5aSmJYcGczeUo3ajA0dlJVQ1FpRG5tU0V5OFRw?=
 =?utf-8?B?MVd5b0xPZTR2V0hqeXZnRFhhejhEYWZnVU9hSk81WFhJMm9LZ1pEMWRSNEZw?=
 =?utf-8?B?MU1EaUM0cUFJckZDUHJXeDBOQXlOcTFUS0tiS1pUd1VTZTYvQmFQSFRobFVK?=
 =?utf-8?B?TVd3NWFPc0EzNGVUcE1idlVUcm9LQVp4dTZuYll1ZGhvRFIrQksxcjc5dlZa?=
 =?utf-8?B?dU5xSWxsM1lKQVpUY2o4WDc1V0hpTWVTMkZTM2RrOXlvcjduYXhlVERQN3F5?=
 =?utf-8?B?YngyVUtWKzBYNENITmcvWWI2bFdSU29NNm1RS3BHVUo0NVVmY1BwWEdydGQ1?=
 =?utf-8?B?T0hJQnc0dWtCODZqUW1SZnhiVDcvVzZxZTJOVlRKUkE1blVyQmZOdXlmMnVW?=
 =?utf-8?B?V3YwcXFXVXNuSitYUFdoOTVqTkExNjJGS2Zzd1liYUpwK0QyM0h5U2dmQ2k2?=
 =?utf-8?B?VWlGVEJwWU5hKzFqOUticmsrbTNxOUVtYUxlaDhmOEZKc0xiZ3VWVEVqVnFs?=
 =?utf-8?B?NVM5YXR0bklObmNHZmZuSTkyc0R4SjhGeTljZVZJamtlbDhQdk8rTHQ1WFJr?=
 =?utf-8?B?UlIxS3cwbFRwQnA4TEh0WE9OcnhPMVBJblpSWG5HMC9NZ2lOMW5waWZDbGQw?=
 =?utf-8?B?K1hmYktQTXNVTWJFVHJPNG9nNXJTRFZlMm1FQUY1cEpRQ0xkMjg3MXZSNm8w?=
 =?utf-8?B?MUZpNFhCOUVUUEUxb1ZqVk5ISi9GZ1cxbGxvb05yOHZIa0FaVHV2cE1vVTdK?=
 =?utf-8?B?TjZOODRkSEMvajdqNU5XdWQwSEEvdEJJTnZyd1ZWMXNWSGQyUlpPbzgwZjNY?=
 =?utf-8?B?bHJXckJrMXRwYTlrK2ZzNmpsMjJ6UkZyK1BialN0VXozY3BrWGM1MzRzdmZD?=
 =?utf-8?B?VEZUcFNiSlZPWkJYb2kwcE1mbW5QSnFmYWx1UzVPMEdBZWdzRThOZzdNRHEy?=
 =?utf-8?B?cXM1M05ISUdGVDFZL20vM0xJZ0FUQ0QwOC9NTVQwa21PVGQranFtbTVtcXdm?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AD08553B2C0AB48A57CB5DC72A16E21@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3773b0f9-8c9f-4b96-d8eb-08de01794fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 06:02:47.1286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMlq9fBftg1u/I/tmYyT0Y9diE5e+MKDU4N8PUEURCLtQnDwE2HvDsl+pELezMDcS5TpTFJLfDylBLJ7aQAn+I9f6CYuMkizQw9xeginzQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5990
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 06:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224343

T24gV2VkLCAyMDI1LTEwLTAxIGF0IDIzOjEzICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToK
PiBPbiBXZWQsIDIwMjUtMTAtMDEgYXQgMjI6NDYgKzAyMDAsIEFkcmlhbiBGcmVpaG9mZXIgdmlh
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiA+IEZyb206IEFkcmlhbiBGcmVpaG9m
ZXIgPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+Cj4gPiAKPiA+IFRoaXMgZG9lcyBub3Qg
d29yayBmb3IgbmF0aXZlIGJ1aWxkczoKPiA+IMKgIENGTEFHUyArPSAiLXN0ZD1nbnUxNyIKPiA+
IFRoZSBsaW5lIGZyb20gbmF0aXZlLmJiY2xhc3MgZ2V0cyBwcmlvcml0eToKPiA+IMKgIENGTEFH
UyA9ICIke0JVSUxEX0NGTEFHU30iCj4gPiAKPiA+IEZyb20gYml0YmFrZS1nZXR2YXIgLXIgZXhw
ZWN0LW5hdGl2ZSBDRkxBR1MKPiA+IMKgIC4uLgo+ID4gwqAgYXBwZW5kIC4uLnBva3kvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2V4cGVjdC9leHBlY3RfNS40NS40LmJiOjQ0Cj4gPiDCoMKgwqDCoCAi
LXN0ZD1nbnUxNyIKPiA+IMKgIHNldCAuLi5wb2t5L21ldGEvY2xhc3Nlcy1yZWNpcGUvbmF0aXZl
LmJiY2xhc3M6NDQKPiA+IMKgwqDCoMKgICIke0JVSUxEX0NGTEFHU30iCj4gPiDCoCAuLi4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEZyZWlob2ZlciA8YWRyaWFuLmZyZWlob2ZlckBz
aWVtZW5zLmNvbT4KPiA+IC0tLQo+ID4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXhwZWN0L2V4
cGVjdF81LjQ1LjQuYmIgfCAyICstCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IFdoaWxzdCB0aGUgcGF0Y2ggYXBwbGllcyBjbGVhbmx5IG9u
IG1hc3Rlciwgd2FzIHRoZSBjb21tYW5kIG91dHB1dAo+IGFib3ZlIGZyb20gbWFzdGVyPyBJIHN1
c3BlY3QgaXQgd2FzIG5vdC4uLgoKWW91J3JlIGNvcnJlY3QuIFRoaXMgZXJyb3Igb2NjdXJzIG9u
IFNjYXJ0c2dyYXBoLiBTaW5jZSBJIGNvdWxkbid0IGZpbmQKYW4gZXhwbGFuYXRpb24gZm9yIHdo
eSBpdCBkb2Vzbid0IG9jY3VyIG9uIG1hc3RlciwgSSB0aG91Z2h0IEknZCBzZW5kCnRoaXMgcGF0
Y2ggZm9yIG1hc3RlciBhcyB3ZWxsIHNvIHdlIGNhbiBkaXNjdXNzIGl0IHF1aWNrbHkuIEl0CnNo
b3VsZG4ndCBjYXVzZSBhbnkgaGFybSBhbnl3YXkuCgpCdXQgeW91ciBxdWVzdGlvbiBndWlkZWQg
bWUgdG8gdGhlIE9FLWNvcmUgY29tbWl0CmExNTdiMmY5ZDkzNDI4Y2EyMTI2NWNjODYwYTNiNThi
MzY5OGIzYWEgd2hpY2ggc29sdmVzIHRoaXMgaXNzdWUgYXQgdGhlCnJvb3QuIFRoZSBwYXRjaCBj
YW4gYmUgaWdub3JlZCBmb3IgbWFzdGVyLiBCdXQgZm9yIFNjYXJ0c2dyYXBoIGl0IHN0aWxsCm1h
a2VzIHNlbnNlLgoKVGhhbmsgeW91IGFuZCByZWdhcmRzLApBZHJpYW4KCj4gCj4gQ2hlZXJzLAo+
IAo+IFJpY2hhcmQKCg==

