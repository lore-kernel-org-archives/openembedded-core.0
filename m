Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A144CA0FE7
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 21:16:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.6])
 by mx.groups.io with SMTP id smtpd.web11.50284.1756156555200391840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 14:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PzEy2//P;
 spf=pass (domain: siemens.com, ip: 52.101.84.6, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBXTokaWVAOJdNkdShtSeJd2CbF2KoibyYLVLZJt0T5I970sqHF6qN94XlMpv4SFeQyaXyAhMAR4CXh4SxEXZFcpQl6wPiRrRVYyF1Fh+ThXSl+YIfeubjI6NXILsBsrHw4EMgHUkqIVvwgVwH1DowFOobD1XDg5DtCBnOJuyhs37Pkjxh//ZxwtGYpe1Zin4IP8bB2gz+/4s3EO6XOYGnPLPBalnugBORJbGxzX8EuVIaTCprL25YOgHWzDMLvDYMifpxPuAu9hYvtfMUxweTA/nupeJzl+kdk8l5xXv87v9zChFduWZ0gshubH9ptP6LYSveWipa91811WVLRitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rx/Gc4/kqBqIRM6FpmHDxtGQycD3yht2H5Xt943o5GU=;
 b=a/RQKlC6tb6OSbuAB+9fknMf0QZJDJxymQ73/DPI6PwMssZydFDc+af182iJ0SM0yRlrki9rzIrVbXdugiS7i9FPhp1ER//5tBnRkbNfbpfkDIRIv9skuOItd/Ja1C/Ty83nLkWsEYVW87nalAWHVvIp+V2+8G+40WmfC7fawl4aks+SE+4byWe3sIJdHQ9hz8oSou1rDqALb22JAqi4zOhTZcHIo7mFA+xJc5T8Jczu2IADElcvbV6fpFZ/dUtySUWeCnIyJlYprxuXOuuPOzU7suJ9UbwnOKwnDrighEjY7RADq5jLwsCR8ZbaM8Ln4eFd4WlK3/4SKMRIjI+inw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx/Gc4/kqBqIRM6FpmHDxtGQycD3yht2H5Xt943o5GU=;
 b=PzEy2//PaQb/eBAogDlQC6ixO8qKaCJ/pEZJYWoud007EM4wAUX3tD4VZmyounDW4IBXBtJn8/irgldSBH4PgoovJcBY5/IbbJD+NRjWZ323a4TLydDMayQSqbfb8pNrirOsBu8kTTtmszvLo3szx5Y5SSYhVmHmT58MiHJ3mz9BnAhXkQhANmFRJwj1UtMV6vbuD5h0zNR/VahAdJBiw+/9FiiayC2rrAhW5SuKNEs6NOjAEobNuj0XQySEp8mkA9URY9U5uQu2j3xV5XRTAEDzAM26e6XZD5iCBfff1lwjK3fXPommlSDDPkApz2nA8QLprIoLCuFmYe1wVXeHvg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB5994.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 21:15:51 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Mon, 25 Aug 2025
 21:15:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][walnascar][PATCH 2/2] binutils: patch CVE-2025-8225
Thread-Topic: [OE-core][walnascar][PATCH 2/2] binutils: patch CVE-2025-8225
Thread-Index: AQHcFPTAjzFISNDJJ0WEryJfonS0cLRzy18AgAAVY2A=
Date: Mon, 25 Aug 2025 21:15:51 +0000
Message-ID: 
 <AS1PR10MB56975D5A44F8F954F3F5C261FD3EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250824124248.1093100-1-peter.marko@siemens.com>
 <20250824124248.1093100-2-peter.marko@siemens.com>
 <CAOSpxdacNuW3wbrXDtWE7xDVyb1gpU+3mw3=f8zKdW4jUFY6-A@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdacNuW3wbrXDtWE7xDVyb1gpU+3mw3=f8zKdW4jUFY6-A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3f392e2c-eda2-4113-882a-84aed6d65777;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-25T21:15:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB5994:EE_
x-ms-office365-filtering-correlation-id: f0080ffa-a4c4-49e9-8535-08dde41c9218
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018|13003099007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UnRoNDdiVWdvTHdSc1ozKzd5UDRwalJLc01KVTYxcjhsK1VFTmgxdHpCeUpC?=
 =?utf-8?B?UW1qckVqaFRTTHkzS2d6SlJldm4rMDRRamw1aTN5am80eTFLWWlObU1Wb2M5?=
 =?utf-8?B?YWgrMlpFZmw4elNRQUNTTHUvQVVJdGxsZXp2N1RpNmZ4Z2U2ZDJ6cDF1ejJ3?=
 =?utf-8?B?RmtaRFB1aENhbnNCSHYwVTJLdG1XZG4rRDZ1Z1FQTmd4djk5OHNKVUxvc1Iy?=
 =?utf-8?B?SDA3YzI0UDNETVdNMjZhS2xMVVVLYXVZM1NQQVpMOUUwRFRWQWp0U0duUTdB?=
 =?utf-8?B?bVV0VWpyMDNiSGgxalRaUE5LN3h2YnVUSDFuck5sY08zQ3B4MndUQ2hYOVdT?=
 =?utf-8?B?TW16Y2RWOG5udmpnVWtZalFxNGZWVDVzaW1HQnlDUW1OTzlNNXg4Q1JUU0p4?=
 =?utf-8?B?RmhXU1pvZ0trcm5VRkRSMS84WUl3UjBWOU5hV3doT2VjZjBPOWVYazJxWlNv?=
 =?utf-8?B?NlBra0hxUlF6UGxnQXB1di8ySlh0b2JYR2hxV2hHYWxyWG5LK1M4VjBUMThp?=
 =?utf-8?B?Zm5iKzlqVm5NL2JtcHdjVTlWUDhKNFQ1Rm4rMWdXYzFsUFNxSCtDMmcrMFN3?=
 =?utf-8?B?SWtRWkNFUEJReXp3OVQwNENjYU9TSTdId0RZakpyNDZkamhxZmNIL3VVOWNG?=
 =?utf-8?B?bXJieHlqdDdwUjgwNVJaYm9KQ0gzWHoxRHlsSUZMMGNZakdDdWErUzhJRTk1?=
 =?utf-8?B?YWJRL0NjSG8wQTVlV2M0UmxYVGJKeVpYMWZRaUZBempxSzgrYjJRSGZkVWhS?=
 =?utf-8?B?K01odXJyZG1zcW1rRHpYZ0tSV1ZhSU0veFY3aDNBczNNMExVOWs2NytpRklL?=
 =?utf-8?B?ZUdOUlNoV2JZWi8wOTZiUmxuOThYR2ZMSGkybVU4YmNmZmZHL3lhYnRGMEpO?=
 =?utf-8?B?YkVDVWh3eDRIY0ZvcmJPQ3BSbERCVHlFallBY296QVo0MWZqaFRDTmREbjN4?=
 =?utf-8?B?a0p0cjdobTRxa0pWbzJGTEZTR2d2aWdDcXplYzVLRkJSWThNVGR0UXIzWlFJ?=
 =?utf-8?B?MU5tbUIzemZQV2hpdU5xQWN0L2ZsdEYwZElqQWFWdldzcjdTM1p4Y1M5Y3lN?=
 =?utf-8?B?bVNjRUdFbUpYVEpVdURybW9FbC80eHhESVdwQ3VXUWNYa2dUdWMzTmtYa3Bw?=
 =?utf-8?B?dDRYamRrNGhRcW1lUWZpTFQxd0RFeWVOL2dVY2o0dzRpb1d2TnhnWVpYaXVp?=
 =?utf-8?B?SVJHQytjTjllN0V5WEFiaTR1cEZlNkNsRW9MbjFiN3lIamFYNERTUVNSRy9X?=
 =?utf-8?B?ekE3WVIwR1RDd21GbEhJbVcrYlhleXVzUG9TbFlZWlRTWUhucENwK2U2elA5?=
 =?utf-8?B?cWtrcnhOazZpeHhDT0xzR3M0THFpd3BpR01xc1l1RzZ6bTIzL0dBTWE5K28w?=
 =?utf-8?B?MnM1aHFSL3ZRZzRuTndnRUVCMDhPVUsyeDNyc0ZMSWxrSGY5dUU2NFZ3UmRw?=
 =?utf-8?B?RWExNTJKWWlYY0dDVmxsWWtuUkliRUo1K0JxSzI3dXZ6d1h2Wi9Yd3h3QWZo?=
 =?utf-8?B?Q0RRaDFvYUdFbytrSVUwbDJEQjBJeEpBZFBnWURnSG9EMHM1RExQSVVtR2Q0?=
 =?utf-8?B?TjQ1OTI0SDlRVHF4S0xqUVdKMjRvcGRmWFE5TzdvRkpkM0xCZWpqdUZLL0Uy?=
 =?utf-8?B?NWl1YnNWb2Q2cXo3ZUwxcHZHTGE2cVFzOHFObWYybHBKb2hXR2taTVV5VndV?=
 =?utf-8?B?K3ZHbTZ2N3dlY3BXVWE4RVM0Vy9sZnU0V3lsL2xWM253QmJUb2dXUkZZQlpi?=
 =?utf-8?B?QVc1VUxvT25IeG1STmtUT1pXK1VlNGpmVlA0c0I2RFFpZXRJT05TNVlCaEty?=
 =?utf-8?B?VVN5UzhDT0tXVWFjbkViK0VoNUlPdXFCSExSbytKRGRNZmRWWW9kRFhuWXBy?=
 =?utf-8?B?L1Y2YXNYODdxUzJUdmRZL2grTFRtOHlYUStaOElUekNNSEovR3E0bDZyVlNS?=
 =?utf-8?Q?EKx1uHfCZ1g=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aldHOUVYNXFkVVREV0p5QmtDN1VvMFhhV0VqRGk4UmY5TTgzekUyRHlwMVhs?=
 =?utf-8?B?MGtlZEF4UDhJT2ZwVUYyeVIvM2NEYlc3a0VNWFdrWXlJSnpQbWpCV1E3Zk9i?=
 =?utf-8?B?QVpIUzNvM3VDZVkzdHZFWUE0Vjk0Wkdla2JkUEVGa2ZiNnNYckNMbkhhRGpM?=
 =?utf-8?B?YVN4cHd0YmxnV045d3MwdFpiYUxsZEdBUmhjand3alBnbzZQU0U0UWN0V1Jj?=
 =?utf-8?B?QXF4ZkJRWUZDNDFzc01oZC9MZnNEeU90YlVpaW90SzkybFlJejdhdlp6Mnpw?=
 =?utf-8?B?eGN4VU1BakwvR0VWT0xIY3RwYTdPLzFSZ0svV2p1ZDVxU1hIOTJYTFpGeE5M?=
 =?utf-8?B?NEJ2MWoxUzdxWGo1a21lWEU1NUpyYUM3MGh1QTMzVU5qT0lDdjJ2ZC80c2Jt?=
 =?utf-8?B?TU9wemZEVWdVRUpiajFEWjNzQU1uemE2TzFjQVV2b1dWRHlzdWxUYVByaUVo?=
 =?utf-8?B?Rkdmb3l1ekdwRVVFb0c1WExlYjNQTWV1RFlOSWhLd1BRQ2ZldThjQ2VoWHdI?=
 =?utf-8?B?N013LzJKWWtyZjJoUnBSV2VoM3BJSUw5RUlzeFkxMkhUVkdlVmpSb0RnS2po?=
 =?utf-8?B?MVBKNHNmUzRWeUhlMXB3bWhKM0orMlBQeXdLMWNMR1l1ZVRabG80bGZqYllz?=
 =?utf-8?B?Y1hTaFA0Z0tDYUhoeVMrTGNLQ2RDVWRUcnNVOHpmTndwaDZYZy9vOWN2ZkRu?=
 =?utf-8?B?TmFDYmFvdDBZTWpvMTVYRVRWQW1vMllFYnVkd1E2WlRCRjlrS2tjVGNJTU1a?=
 =?utf-8?B?dURsUUQwWUlObkVReTNaRkF3UU9pc05EeWllV2tnY251UmdSTm16S2FVMFNO?=
 =?utf-8?B?TlVVM1lLVWwxVVRNQXR0eHBsY3dtSTJCcnhjc0Fkb1Z0OWlnbGFUdkZvbytN?=
 =?utf-8?B?MGZhOFUyMzNLdU9ZVXlvZjBCZDJPcWxaQ0w3amVlekRjaUhQRTJ6bzNNOFEr?=
 =?utf-8?B?aTN5OHNTK0RNUGZoMnFSdkE1d0pXZG4vV1dwdGhtTzFuYm0yOEp3QlN3aGs0?=
 =?utf-8?B?NndRbDBpVExCVEwwR0tiVVJVVHhoNTlQNVAyaHR2akFaUGttazF2ZkdaZEx2?=
 =?utf-8?B?ZERFejBUMWlnU0xNU2xyZXVUSXI2SWpOeDd4cHFvTnJZVnkxTXFOZ2NGNjIr?=
 =?utf-8?B?eWN4Q3d1bFB2MWNNQ3JYRmIwZEdmTnVaU1R5Mkhrdmx5R1c3VHIvMnFaQWI0?=
 =?utf-8?B?RFRBTVNrVVpPOGJlRmUzNStUaThvTlJIYWxPN2NTOS8zSjJOZDRlcGduRVJ6?=
 =?utf-8?B?bUFqc0hxV3VBVFFScm8yNWFMeTZybDRialhJV0N6TEpaY0g2MjlxQk54dmxv?=
 =?utf-8?B?RmhRRUhWOW5mMExFR1p0VWw0NDAydGtLdnlBTVFLemRYTmZVbDdlQ2tDVlAr?=
 =?utf-8?B?OVBHM2xud0hvV1A2dHdqdWorcUtsWnpBOG9nZjlhc1kycjlLR25RZVZnUEFT?=
 =?utf-8?B?d1pNYWtZbm5DSlloTHJ3YXkwZ0NZNVdXR09hM1c4U2pKaktvUzFFVUkxazlM?=
 =?utf-8?B?OXQ4dkc3T0N6dS9USjBHWlZnS240d0JUdFE2SW9ISXkralZ3QVdaVVRRbWxU?=
 =?utf-8?B?SkNwMTRaM0MxREYxWkFUdDRlSXI0UlNnTUJaSHFyS3NlQ2lsN0tFbHNmbVFY?=
 =?utf-8?B?Zm5oTXhqai9EWldHOHAwQUlHMWxYWXAvczZUZGFscTFTSXdCUmRCV053c29o?=
 =?utf-8?B?dTJrdlNMMXVxSmFNc3RxeERXQWhKeW1KSHpucUtobGVFbVBEeCtveU1FNXBo?=
 =?utf-8?B?YUJUQXI1UVdjNm9BM3FvSUNjVU5ST2VjZ0tUc0VBNXBlQ0JMeXFKckhmdC80?=
 =?utf-8?B?Ulc5LzFKYjNMMExkVkdXam5YYkMvODJualRIN0greWR6UjRpa2lybEZlYmlt?=
 =?utf-8?B?T2xBYWJVSzNaajZFdDVPeWw4TnUwaDdkbnNjVmxNb29jRkFZclVHcGZ5cDgr?=
 =?utf-8?B?MkZ5Y3UvOEMvd3NoL25IYytzNnpHMXB3NjJhbk1tMDVYbjBvdnVML2dLRUFN?=
 =?utf-8?B?RnVWa21MRXFtcTlEbndVaTVsb1JEbEk0NU5pUUc5ek94NlY1NDhDcEpYUHhh?=
 =?utf-8?B?WGhTbEI3cFVZV01tMFRSMGdEUHo1YWNRbi9OeHY1ZkU1b1NZNGc0eDNiU29K?=
 =?utf-8?Q?eLK1jgi6Ca2uC2Apsp7NOs3Sn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0080ffa-a4c4-49e9-8535-08dde41c9218
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 21:15:51.7728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /mRokacLEEOM9gGIY3Y8B3vfTbVsOsCfMVj3hvuIOdPJC6iBKnEWHcMqEj4tnBIIWlRlUATMu6QUE+uS8izj5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5994
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 21:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222426

VGhlcmUgd2FzIGEgY29uZmxpY3Qgd2l0aCBhIHBhcmFsbGVsIHBhdGNoIGluIGJpbnV0aWxzLg0K
SSBoYXZlIHJlYmFzZWQgYW5kIHJlc2VudCB0aGlzIGZhaWxpbmcgcGF0Y2guDQoNClBldGVyDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RldmUgU2Frb21hbiA8c3Rl
dmVAc2Frb21hbi5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI1LCAyMDI1IDIxOjU5DQo+
IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMu
Y29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdW3dhbG5hc2Nhcl1bUEFUQ0ggMi8yXSBiaW51dGlsczogcGF0
Y2ggQ1ZFLTIwMjUtODIyNQ0KPiANCj4gVGhlIGZpcnN0IHBhdGNoIGluIHRoaXMgc2VyaWVzIGFw
cGxpZXMgd2l0aG91dCBpc3N1ZSwgYnV0IHRoaXMgb25lIGZhaWxzIHdpdGg6DQo+IA0KPiBBcHBs
eWluZzogYmludXRpbHM6IHBhdGNoIENWRS0yMDI1LTgyMjUNCj4gZXJyb3I6IHNoYTEgaW5mb3Jt
YXRpb24gaXMgbGFja2luZyBvciB1c2VsZXNzDQo+IChtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmlu
dXRpbHMvYmludXRpbHMtMi40NC5pbmMpLg0KPiBlcnJvcjogY291bGQgbm90IGJ1aWxkIGZha2Ug
YW5jZXN0b3INCj4gUGF0Y2ggZmFpbGVkIGF0IDAwMDEgYmludXRpbHM6IHBhdGNoIENWRS0yMDI1
LTgyMjUNCj4gaGludDogVXNlICdnaXQgYW0gLS1zaG93LWN1cnJlbnQtcGF0Y2g9ZGlmZicgdG8g
c2VlIHRoZSBmYWlsZWQgcGF0Y2gNCj4gDQo+IFN0ZXZlDQo+IA0KPiBPbiBTdW4sIEF1ZyAyNCwg
MjAyNSBhdCA1OjQz4oCvQU0gUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gPHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiA+DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0K
PiA+DQo+ID4gUGljayBjb21taXQgWzFdIG1lbnRpb25lZCBpbiBbMl0uDQo+ID4NCj4gPiBbMV0g
aHR0cHM6Ly9naXRsYWIuY29tL2dudXRvb2xzL2JpbnV0aWxzLWdkYi8tDQo+IC9jb21taXQvZTUx
ZmRmZjdkMmU1MzhjMGU1YWNjZGQ2NTY0OWFjNjhlNmUwZGRkNA0KPiA+IFsyXSBodHRwczovL252
ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS04MjI1DQo+ID4NCj4gPiBUZXN0c3VpdGUg
ZGlkIG5vdCBzaG93IGFueSBjaGFuZ2VzIGluIHJlc3VsdHM6DQo+ID4NCj4gPiAgPT09IGJpbnV0
aWxzIFN1bW1hcnkgPT09DQo+ID4NCj4gPiAgIyBvZiBleHBlY3RlZCBwYXNzZXMgICAgICAgICAg
IDMxMA0KPiA+ICAjIG9mIHVuZXhwZWN0ZWQgZmFpbHVyZXMgICAgICAgMQ0KPiA+ICAjIG9mIHVu
dGVzdGVkIHRlc3RjYXNlcyAgICAgICAgMQ0KPiA+ICAjIG9mIHVuc3VwcG9ydGVkIHRlc3RzICAg
ICAgICAgOQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtv
QHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmludXRpbHMvYmludXRpbHMtMi40NC5p
bmMgICAgICAgICAgICAgICAgfCAgMSArDQo+ID4gIC4uLi9iaW51dGlscy8wMDE5LUNWRS0yMDI1
LTgyMjUucGF0Y2ggICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxOS1DVkUtMjAyNS0NCj4gODIy
NS5wYXRjaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51
dGlscy9iaW51dGlscy0yLjQ0LmluYyBiL21ldGEvcmVjaXBlcy0NCj4gZGV2dG9vbHMvYmludXRp
bHMvYmludXRpbHMtMi40NC5pbmMNCj4gPiBpbmRleCA2N2NlZDI4NjNiLi4yMGQ5YzJhNmYyIDEw
MDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy0y
LjQ0LmluYw0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGls
cy0yLjQ0LmluYw0KPiA+IEBAIC00Niw1ICs0Niw2IEBAIFNSQ19VUkkgPSAiXA0KPiA+ICAgICAg
IGZpbGU6Ly8wMDE4LUNWRS0yMDI1LTUyNDUucGF0Y2ggXA0KPiA+ICAgICAgIGZpbGU6Ly8wMDE5
LUNWRS0yMDI1LTc1NDUucGF0Y2ggXA0KPiA+ICAgICAgIGZpbGU6Ly8wMDE4LUNWRS0yMDI1LTc1
NDYucGF0Y2ggXA0KPiA+ICsgICAgIGZpbGU6Ly8wMDE5LUNWRS0yMDI1LTgyMjUucGF0Y2ggXA0K
PiA+ICAiDQo+ID4gIFMgID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxOS1DVkUtMjAyNS04MjI1LnBh
dGNoDQo+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTktQ1ZF
LTIwMjUtODIyNS5wYXRjaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAw
MDAwMDAwMC4uNDNiYzRjNTZkOA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxOS1DVkUtMjAyNS04MjI1LnBhdGNo
DQo+ID4gQEAgLTAsMCArMSw0MSBAQA0KPiA+ICtGcm9tIGU1MWZkZmY3ZDJlNTM4YzBlNWFjY2Rk
NjU2NDlhYzY4ZTZlMGRkZDQgTW9uIFNlcCAxNyAwMDowMDowMA0KPiAyMDAxDQo+ID4gK0Zyb206
IEFsYW4gTW9kcmEgPGFtb2RyYUBnbWFpbC5jb20+DQo+ID4gK0RhdGU6IFdlZCwgMTkgRmViIDIw
MjUgMjI6NDU6MjkgKzEwMzANCj4gPiArU3ViamVjdDogW1BBVENIXSBiaW51dGlscy9kd2FyZi5j
IGRlYnVnX2luZm9ybWF0aW9uIGxlYWsNCj4gPiArDQo+ID4gK0l0IGlzIHBvc3NpYmxlIHdpdGgg
ZnV6emVkIGZpbGVzIHRvIGhhdmUgbnVtX2RlYnVnX2luZm9fZW50cmllcyB6ZXJvDQo+ID4gK2Fm
dGVyIGFsbG9jYXRpbmcgc3BhY2UgZm9yIGRlYnVnX2luZm9ybWF0aW9uLCBsZWFkaW5nIHRvIG11
bHRpcGxlDQo+ID4gK2FsbG9jYXRpb25zLg0KPiA+ICsNCj4gPiArICAgICAgICogZHdhcmYuYyAo
cHJvY2Vzc19kZWJ1Z19pbmZvKTogRG9uJ3QgdGVzdCBudW1fZGVidWdfaW5mb19lbnRyaWVzDQo+
ID4gKyAgICAgICB0byBkZXRlcm1pbmUgd2hldGhlciBkZWJ1Z19pbmZvcm1hdGlvbiBoYXMgYmVl
biBhbGxvY2F0ZWQsDQo+ID4gKyAgICAgICB0ZXN0IGFsbG9jX251bV9kZWJ1Z19pbmZvX2VudHJp
ZXMuDQo+ID4gKw0KPiA+ICtDVkU6IENWRS0yMDI1LTgyMjUNCj4gPiArVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuY29tL2dudXRvb2xzL2JpbnV0aWxzLWdkYi8tDQo+
IC9jb21taXQvZTUxZmRmZjdkMmU1MzhjMGU1YWNjZGQ2NTY0OWFjNjhlNmUwZGRkNF0NCj4gPiAr
U2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+
ICstLS0NCj4gPiArIGJpbnV0aWxzL2R3YXJmLmMgfCA4ICsrKy0tLS0tDQo+ID4gKyAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+ICsNCj4gPiArZGlm
ZiAtLWdpdCBhL2JpbnV0aWxzL2R3YXJmLmMgYi9iaW51dGlscy9kd2FyZi5jDQo+ID4gK2luZGV4
IDhlMDA0Y2VhODM5Li5iZmJmODNlYzlmNCAxMDA2NDQNCj4gPiArLS0tIGEvYmludXRpbHMvZHdh
cmYuYw0KPiA+ICsrKysgYi9iaW51dGlscy9kd2FyZi5jDQo+ID4gK0BAIC0zODA3LDEzICszODA3
LDExIEBAIHByb2Nlc3NfZGVidWdfaW5mbyAoc3RydWN0IGR3YXJmX3NlY3Rpb24gKg0KPiBzZWN0
aW9uLA0KPiA+ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgIGlmICgoZG9fbG9jIHx8IGRvX2RlYnVn
X2xvYyB8fCBkb19kZWJ1Z19yYW5nZXMgfHwgZG9fZGVidWdfaW5mbykNCj4gPiArLSAgICAgICYm
IG51bV9kZWJ1Z19pbmZvX2VudHJpZXMgPT0gMA0KPiA+ICstICAgICAgJiYgISBkb190eXBlcykN
Cj4gPiArKyAgICAgICYmIGFsbG9jX251bV9kZWJ1Z19pbmZvX2VudHJpZXMgPT0gMA0KPiA+ICsr
ICAgICAgJiYgIWRvX3R5cGVzKQ0KPiA+ICsgICAgIHsNCj4gPiArLQ0KPiA+ICsgICAgICAgLyog
VGhlbiBhbGxvY2F0ZSBhbiBhcnJheSB0byBob2xkIHRoZSBpbmZvcm1hdGlvbi4gICovDQo+ID4g
Ky0gICAgICBkZWJ1Z19pbmZvcm1hdGlvbiA9IChkZWJ1Z19pbmZvICopIGNtYWxsb2MgKG51bV91
bml0cywNCj4gPiArLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZiAoKiBkZWJ1Z19pbmZvcm1hdGlvbikpOw0KPiA+ICsrICAgICAgZGVidWdfaW5m
b3JtYXRpb24gPSBjbWFsbG9jIChudW1fdW5pdHMsIHNpemVvZiAoKmRlYnVnX2luZm9ybWF0aW9u
KSk7DQo+ID4gKyAgICAgICBpZiAoZGVidWdfaW5mb3JtYXRpb24gPT0gTlVMTCkNCj4gPiArICAg
ICAgIHsNCj4gPiArICAgICAgICAgZXJyb3IgKF8oIk5vdCBlbm91Z2ggbWVtb3J5IGZvciBhIGRl
YnVnIGluZm8gYXJyYXkgb2YgJXUgZW50cmllc1xuIiksDQo+ID4NCj4gPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0
aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMjIyMzcxKTogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLQ0KPiBjb3JlL21lc3NhZ2UvMjIyMzcx
DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
MTE0ODY0NDIzLzM2MjA2MDENCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3du
ZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiBbc3RldmVAc2Fr
b21hbi5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

