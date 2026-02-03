Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B5DE83056
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 05:44:02 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10544.1770097438043762454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 21:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=I23M8QLd;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.22, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4tjr7IDwMkGNsF16SgdjZ+snF/j+RJjzT+cfEyjhQoQaCuivGpXunORosKAL6rVgvBFSU8pqz2nWxkJRgAUwBcsQpheTbCP+2RLT6uLFSN0fwCxT0lsPUuqoPKMQjfEEwdmYwkXt1Du0ZLjs1QFCXmMQTYdFzUX+mGixzYoBE9eqLp2FDRzmK++idGCmwAHA6z8WpCV+YdwxoR5+SuzrRvXy1SMDt2Fv7nnagL4ONCb87Ofo4h2kMdXBacPaHTEPoDkIH03rp2LN3xeduqR5j6mDVhFd44POQNvyuo6CGKzimeIVkQSPIXxrKwWs/deWZvzwz1Z2riRdmhbIiDcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbTxPbz5cgROFa+OYYuyS4S4K2Q4WXYe293/BO6mXSY=;
 b=SvnmgotA424DX80jNGqvFiFS3crueoNGKtmMZJQkNDTLXmPVkbJxKhIctFG4Cy34WU+dnm2uObEg+OMmGFzWvPnY/I4gou35FRPL2DF9QOFytUZytyC5d4jiSVpubisEBwLJRAc19ionWu90w5FF5TibCP6MVeix6KwIv2CT4VfYSP509GsINcCUIaGPNkxqZyXA5HCOy/4yevLy2F/uOGIFLwuooqcbvedMm/943iQ//0Zi6mSBbgRj5Mucy0148Awpj+P1Ws4SvRAoCiO9HZu4QzGOoO4RAKcxb5sA3z55NgRsqvcs8NmdjhZlb+Ze5PAyK8kiVkiKRACb9Pam8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbTxPbz5cgROFa+OYYuyS4S4K2Q4WXYe293/BO6mXSY=;
 b=I23M8QLdpGYW6VXm7CZp+yGCudia6mOoP4V4HQSPusFWRoGvQwzqkT/kUO7b5QT31yIhNK6O7wBJ01AhJGtmtNDGBeIXf5/tHcU9q6yJZSqiT8bjZOPM3pTCPgp5ix3Fm2DfzTD7Q1ALR1Afl19LuGrcPI1v4Qh7QF0HW6N8K/VS5hP9sbVjCEe6QOpq6XfgZpYnr4jp6PovpoWyg+Bp2LXA8l9SDHP0Ouy5+u90ifxjfG8TSIB3rYYGjclFPY5GXKJuhPooxahZwIYLVQaMPODagOOADBP8WHymADxZzsiFEnO49fyiZXESUBXXgqmNA/gnM6aepzzES90AlBoryw==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TYCPR01MB11784.jpnprd01.prod.outlook.com (2603:1096:400:3e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 05:43:53 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 05:43:53 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIIDEvNiB2Ml0gcHl0aG9uMy1hcHBkaXJz?=
 =?gb2312?Q?:_Add_new_recipe?=
Thread-Topic: [OE-core][PATCH 1/6 v2] python3-appdirs: Add new recipe
Thread-Index: AQHclBGgHjnp4Uwx9kmSPLk9iw1ExLVwdx4J
Date: Tue, 3 Feb 2026 05:43:53 +0000
Message-ID: 
 <TY3PR01MB10110DCB47D481C0496EEF6E49B9BA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <20260202013640.14467-1-liuyd.fnst@fujitsu.com>
 <DG4A686102IW.3P6JU6225B6AV@bootlin.com>
In-Reply-To: <DG4A686102IW.3P6JU6225B6AV@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-02-03T05:43:52.790Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TYCPR01MB11784:EE_
x-ms-office365-filtering-correlation-id: 9cc5085a-5aef-4254-3705-08de62e73716
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|7053199007|1580799027|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?gb2312?B?dmQvNmRUUXVqVlVZVHVqKzcxb0ZCb2J2Q25vOFpubldTOEdCSlV5cnhwRlQ1?=
 =?gb2312?B?MkRydjlQdmZMUk1uVm5sZWtHdUJWM2lWbVY1UmFzbzRzWE1tUGd4QXhZLzVa?=
 =?gb2312?B?a3pVMWkzZ21ETWdFWTNaY05kaFF1WkMrRll5WXpDdFB1UmVWaXBBN1laQzVZ?=
 =?gb2312?B?Yjh6T3B5dU93OFRaRjdoV0lNYm5VaWVmV1lib3Y0OHhaQkNvZVQvV0JMaVFJ?=
 =?gb2312?B?NUVRdVRnZ3VmOVJodTJwY0JiUVlKOCtrTVI3RzBqYm9yTmNKUlZSb2NybU0r?=
 =?gb2312?B?Q0UyUWRMY2M3TGJJOElqa3J5ck1DWmRXNVBMMUVUb3VPWkdQWkQ1SWcyMFFS?=
 =?gb2312?B?L1pINUV2RS9mb0huMTlrenlBaDh0RndvZGZ6NHN2TG9OWjBRMlAxVGZCdW1M?=
 =?gb2312?B?SitkUGpWUEtBeDBlenFFRnZZMWp2TUZuVGZTczJnV2pqWnRpcEN3T3NhTmtE?=
 =?gb2312?B?eWtNd3NpMHRtT0I4UnRxTmE0L3pyYk1UMUtjcDBpNldDM0xzUFJManlESXV5?=
 =?gb2312?B?bDBSd3ZVWHVVSUJWb0lBU3IvMlNpdVZzeElzTEg2R1RFNjBZL0dDa2lhVWRH?=
 =?gb2312?B?VjJCWHlzamQzTml3cW9vT0E2ZUVEMDFLOHh5MUsvOHBaNkU4S2k3VVR0aFlH?=
 =?gb2312?B?VHh4ODBYSnNYU3YwUFRTTGR2NU9Yai92M1BSUm5YbG0rTXNqKzFJN3dobkhq?=
 =?gb2312?B?TXExR1RsZmY0djRPcmtZMDdRVFAwWXpFQ3dZNlQ3ZlNBT25VSmpETnFtWDJo?=
 =?gb2312?B?Z2FETWU4UCsrSEdSYjlHY2c1MjBjUjJ4RWlXK1dUOU9wY1IwMUIxaE5YWVM3?=
 =?gb2312?B?aU5sRHZPZ3Y5MkQ0clRuMy8xZUp4SDFxU0VhL1dpaXhOUUMzeGhJMmNtTTdr?=
 =?gb2312?B?UUhZbDZGZTJDY0FscVp4bTcyOGZjZFNMVGxseEJoa2tIb2hkVHpZNCs5bjZw?=
 =?gb2312?B?TXFUaWVQTlRJUnJscG1xS3NLeno5bFZjUE44ZVJUUDI4SWVTSU8yU2ErN3B0?=
 =?gb2312?B?V2xBVGNtdlVYSEhpSTEwTUJCbkU0WEl1SGdIVytzVWZEVnUweFFOdjF6M21a?=
 =?gb2312?B?Nlh1WE1UVkFNYmZyRVJPalFQMng1UVViS1l1K1hUTFpVWXBzN1F5THhZNmNO?=
 =?gb2312?B?czR6MlVibHQ2QmZ2dnVLNHJCYTVNa3lLcWlKb2dZRmNwZHM4NnhrOGdmUmg0?=
 =?gb2312?B?d283T1JLN2lNOVg1N1dnN2NKcEpzdUcwLzV3N0hqZzNLSEh1dit1cWhZMmdZ?=
 =?gb2312?B?aUR0YWVCYVR3NnZuZ00vNlZtejgxUnB3SFMwYnRkZ3Y0eVZVUFpGNmU0NnJr?=
 =?gb2312?B?VzFYS3BrZ0Z5dVQwSzNWcDhJNHFYVEp4dFFyNUczYnNnWWkrVndacWFGdXdY?=
 =?gb2312?B?UHhrQmlrNFVhTGwxT242Z0M4RlloNkZ2ZjVBTXQ4RGtZT2FtUmwwUEJBNUpF?=
 =?gb2312?B?UkxQYStPcFV0VmdwY1Nmemdxd1JHNk5iNmVITzBldFJmVVcwY1I2MnJIWUdL?=
 =?gb2312?B?TksrbXB6TFFoaS9Lc3VkTEt5Mk9WRnlqa0lNSGVzSGZMd0tHUXgxUVlYVkFr?=
 =?gb2312?B?VVlLeVB0L2ZkOTVDUDNUS3I2UG1rNlYvS2FqVDN3YmRwZ2NHY0RxZXp4Z1Nk?=
 =?gb2312?B?Y0V2K1VxWnVLQkZlWGwyUUFoeFpvRDN2dFdLcUg2d2tjaTNMazBPT1hFZUFq?=
 =?gb2312?B?OEJyd2NUcmlvazBuWnFBUjZ2cUZ2QUtkRU16WEUrc1ZENHppd1NreXc2V1lB?=
 =?gb2312?B?MUZTOEl3SHRSUThoYzlhZUd5TVRIWFpBNkFITzhtVzIvNXpsak5RNENLU21i?=
 =?gb2312?B?VEEydnViNDJUUkE4WHdGREl6SXBhUzYwdjRUc2htMGNqamtaRFBWaGY5RmR0?=
 =?gb2312?B?N25jVGJsL2hUK0F5a1hTZnd6WVR5a3JhT3JxY24xOGQwWUgyVWk3ZnBWME9V?=
 =?gb2312?B?NHZmR084QjduTVFVSk5SaW5jR2RWS0xYazgya2c2WDZVdjBUdzJHVHQySCt5?=
 =?gb2312?B?c3RPNnIranNsZ0YvbzNocVczMVRISkRYYVYwM0FEc0RKN2M3RGVIYW5EODBV?=
 =?gb2312?B?bVl2RHQ4dG1qa2Y0QUUzaGxFbVMrMnVYS000NUh3aUx2dXA0YUMvdnVjdkJr?=
 =?gb2312?B?QVRXN1hsVXdDS1NEdUdKSjJsUlBvU0xabHE2bkxEM29KZzVzMkZ4RjhsS3FG?=
 =?gb2312?B?WkE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007)(1580799027)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?dzZKYlg4aEd3TWtnbk5xdlhDcEJnMVFMWWdQS0dtOXU2ODVDNFBwZlRRVW55?=
 =?gb2312?B?U3Nqd2x6RWlESXgvaHBzQjBoY1ducHNMang1NWpoQ1JvZDFKUzFuL3F2MXV0?=
 =?gb2312?B?TG9SLy96RHBTTHNMdFRSYkZrTGx1VHBVSEM3SWMyODNnQWc4SldSSUoxcWpD?=
 =?gb2312?B?b0ZBdm1VcmJhbDBYWFRacVRXYXM1a1BTL0VuTkthdDI4anZOVDZDUFppM0xD?=
 =?gb2312?B?bFhuS0RmbzNxUDFZWGRxUHplakJlWmtVWFRHZlhuSkVQeGNOYXpqS1FONWpj?=
 =?gb2312?B?NW5jeDJ2SldwZWFCcUxLZ0RLZmxJcVZOS0ZJVlB6ZExCRkJIZm1zVEt5NTJ3?=
 =?gb2312?B?OFlOdXcvVGtxZ3l2czVFdUxSZ0YvOW42RXZtOW1LQzlxNXRjK2JGWUU0WStp?=
 =?gb2312?B?WnlEKzh4d1ZRZURHQ05hUDBLeGFwNSsydm05c1Y4U3NCZzhFbVdMVy90UG83?=
 =?gb2312?B?SVdOQWd2ZEJRaEhKVzNJUllQTXlzZjA4VWZkZ0c5dWZ0Unp0Nmw1V3VhYjQz?=
 =?gb2312?B?d296TkpQaC82dEZIRURjZXJSak1nUlkyWDBmZHVPN3lCbTd6YmJnSkNWTFVC?=
 =?gb2312?B?SER1ajFaVVllQmhwd3IxZTFidnZLcVV6NW9UaVJSKzg0dkFoR29vTXhReU5B?=
 =?gb2312?B?eVlKYWtKNXZzMFNxdDA3OVRmL0N6K1pPQklybDd0QjhkVWhHR0xIVEpFREVC?=
 =?gb2312?B?ZkxSRlQ4aWtnTlkyVDFQSStnUk9GTXdpOUxkV2M3VVlPbjR4YitxWXYxVUFo?=
 =?gb2312?B?L3h4OXFQUXZoZlQ1NzgvQVB4cHZBdzVyeUl2TGNNSURxY0cydGd2UU4wMDhP?=
 =?gb2312?B?bW5YVEpBYlgxc1ZKTXdxRktnQ0VLdjhmTFg0VHhZYlpJRDhFbTU0TVpGMVgv?=
 =?gb2312?B?SUh6UXVGOVFZWXBUcVhpMUVYWm92bUVNNTJrNHpGUm56MyszY09qQUowU0Yy?=
 =?gb2312?B?YW1iREtoUHQwaVkrRExvZWwrQW1QTlRtbkorM0tKSWtjMm5NZWZxaGlaNnZw?=
 =?gb2312?B?WDhqVlg4NjhEY1dYUnJrNnBWZkRIRUF6NWt5dElHcnpqWThBd0VhQ200QkRD?=
 =?gb2312?B?QVR5cTRtdWFJcFhRS3RSeldORkxJWldhTEM2NjhIS3Y0SThxb3BmN2dkTXJX?=
 =?gb2312?B?WnpaRENVM0xKMk81YlZEcDc2Nkd5dUpzSkNMd2FJUlJOQVBJRzBJRzkyRDN5?=
 =?gb2312?B?SXF5Q2kxQXovZ2g5U0RKVklvZnhQaFFsaW1QWEFxb0lqNU9SVlk5Y0RPNTdT?=
 =?gb2312?B?WG9McnN1YzZucDRpdUQxd0R2QkV1Vk50M0pyazFOSHYyVzUxMUJVMDd5RUVD?=
 =?gb2312?B?bzJvVkhqcWlvNGNKcXZnRVVGZittdm5wZHVCWGM0YkQ5Nm52bmJaTTIyK1pu?=
 =?gb2312?B?c3REWm81SVVuTGJ4cFVYZzg2Z0pOR3lTUkozcXoybG4rMlhxMVNibUROcWJa?=
 =?gb2312?B?SXBhdEVzVzR5bzZGZDRqaHRLekViWlBsdm1YRHlEK3UramRUcVhjTEI2MjFw?=
 =?gb2312?B?b3hLVkVraE1xSXhJNTVjYVJrOGNUUWZGWlJ5QzRudFpRRGdVNHE2Q2ZQNWd4?=
 =?gb2312?B?Z1BsT0NPRnM2SDA1ZHVleUQ2V0QvMnc3ZGZPbVZWMzRKdzg0N1NUbEw3NGRW?=
 =?gb2312?B?STRCL3B3a0MrbndYTkVMV1ZnUVJkMUhiS0ZRVXFSZndYM21IVTN2ZktMWENE?=
 =?gb2312?B?dS9iN3JmRHVVbmVZRk55dHA2eEJ0WDBnWXljd2xwellFRDcyZlFOZW5wVFJH?=
 =?gb2312?B?MUdvbWM3ZnErbnZQYXpzUWNyNm1OOXBQdjNWQ2I4L3ZtajE2OVowcUdpWU1O?=
 =?gb2312?B?bW9BeXVEUjRhNzhLMXdFYzdCbWpBUHIvWFFSRDViZGw2ZWs1dWM2WmdOejA0?=
 =?gb2312?B?eEsrY2xlcFBEb1lBL1VqT1hyVEpxSGlldnphSWY5SWI1MGFoZUdDVm9Ec0ZB?=
 =?gb2312?B?K0o2ZHloRjVxMkNKa1Z5NjNKMHZUMGtCVWc2NTF0RFNOVkRjUFN6aFdWNEZi?=
 =?gb2312?B?ZWlMVnFhaVRmODQvY040MmJnMExrYTZBcFIrRC93LzRHQmN3OHVTa0cxRDVQ?=
 =?gb2312?B?c2szVmYwaU5sYXRGY0x0dnZoZmhJWEduSGdKTFNNbUVCdjI1SzRiZjI4WlhI?=
 =?gb2312?B?N3FUTWx0YkZ4ODFyTTgyTHNQdEdJRlM2L05CdDFRWGFmS2o0MUZqSXVZUnow?=
 =?gb2312?B?cWRBVkpaNmJOZ3NpOWNsREdVRWpIbkk0YkkybEUzV1lhR2k2elJaNFByaGV2?=
 =?gb2312?B?Z1VLYnpVOExIU2RhQnF5L3E2ZDBDUDdZdDFYa0J3NHJzbURocEM2YzU2eDFq?=
 =?gb2312?B?clhiNCs5VkdHRlVEYmRYVVBzSC8xSFUzK29DTzFFckpaLzlmN25nUT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10110DCB47D481C0496EEF6E49B9BATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc5085a-5aef-4254-3705-08de62e73716
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 05:43:53.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5c+ZD6n5LylkGyswDh4z6m+6HX+w7EYrE7SAyyjUIg0Jl72Z+mzvF70TRGItbWOHkTQoZvU8H/k2rYEXksKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11784
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 05:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230419

--_000_TY3PR01MB10110DCB47D481C0496EEF6E49B9BATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SEkgTWF0aGlldQ0KICAgICBOb3cgIGlmIGhvdGRvYyBjb3VsZCBiZSBhZGRlZCB0byBvZS1jb3Jl
IGlzIHN0aWxsIHVuZGVyIGRpc2N1c3Npb24gYXMgSSB1bmRlcnN0YW5kLg0KDQogICAgIEFmdGVy
IGhvdGRvYyBpcyBkZWNpZGVkIHRvIGJlIGFkZGVkIHRvICBvZS1jb3JlLCBJIHdpbGwgc2VuZCBh
IHYzIHBhdGNoIG9mIHB5dGhvbjMtYXBwZGlycy4NCg0KVGhhbmtzDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCreiy83KsbzkOiAyMDI2xOoy1MIyyNUgMTU6MDAN
CsrVvP7IyzogTGl1LCBZaWRpbmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBSZTogW09FLWNvcmVdW1BBVENIIDEvNiB2
Ml0gcHl0aG9uMy1hcHBkaXJzOiBBZGQgbmV3IHJlY2lwZQ0KDQpPbiBNb24gRmViIDIsIDIwMjYg
YXQgMjozNiBBTSBDRVQsIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIHdyb3RlOg0KPiBNb3ZlIGl0IGZyb20gbWV0YS1vcGVuZW1iZWRkZWQgdG8gb3BlbmVt
YmVkZGVkLWNvcmUgYXMgaXQgaXMgcmVxdWlyZWQgYnkgaG90ZG9jIDAuMTcuNC4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCj4gLS0tDQoN
CkhpIExpdSwNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KDQpQbGVhc2UgcmVtZW1iZXIgdG8g
YWxzbyB1cGRhdGUgbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYw0KDQpU
aGFua3MsDQpNYXRoaWV1DQoNCi0tDQpNYXRoaWV1IER1Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCmh0dHBzOi8vYm9vdGxpbi5jb20N
Cg0K

--_000_TY3PR01MB10110DCB47D481C0496EEF6E49B9BATY3PR01MB10110jp_
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
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">HI </span><span style=3D"font-size: 11pt;"=
>Mathieu</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;Now&nbsp; if hotdoc could be added to&nbsp;oe-core&nbsp=
;is still under discussion as I understand.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;After hotdoc is decided to be added to &nbsp;oe-core, I=
 will send a v3 patch of python3-appdirs.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Mathieu=
 Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C22=C8=D5 15:00<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH 1/6 v2] python3-appdirs: Add new r=
ecipe</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Feb 2, 2026 at 2:36 AM CET, Yiding Liu (Fuj=
itsu) via lists.openembedded.org wrote:<br>
&gt; Move it from meta-openembedded to openembedded-core as it is required =
by hotdoc 0.17.4.<br>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
<br>
Hi Liu,<br>
<br>
Thanks for your patch.<br>
<br>
Please remember to also update meta/conf/distro/include/maintainers.inc<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB10110DCB47D481C0496EEF6E49B9BATY3PR01MB10110jp_--

