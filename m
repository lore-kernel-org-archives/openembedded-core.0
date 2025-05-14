Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EADC3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 08:39:19 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web10.97035.1747211952963927374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 01:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=uaIZoWrt;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.87, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1747211952; x=1778747952;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kHVotslnz6Q/qYlNi7odHGb98gka9BqBR/z87uyRT8g=;
  b=uaIZoWrtidMIEAM5jeUlfLDcbD/1yG/pWlMAdPoRZgixgwsukq7FOzor
   PbFk7sqVCiN+0nO65BZc5ZtUYyMS7SVkWoSIzdikH9OvAEPpBq247/OuR
   kBuIRDO2VukfeMoI687IHiWp0vUqD9CbY1IUu9xu4gPOMO0oeoRrLkAPE
   BfrjmtTZHPgajx3kbBOt6LasGgkSYaWfcQP31n7SbNvDZZsJt+MLRgTRK
   E9ep0LYcuuVrrZy/PWaup94yozro3EgwMDy7YmmBbftU88pl8sYLWs3mN
   9d2ZLVHZURnaYPowVQBriwvWl1KSkubUhg2V1rOdVmjve6x0l57+poCVe
   A==;
X-CSE-ConnectionGUID: 7lCLUeTJRsqvKKOtplaMYg==
X-CSE-MsgGUID: N4Vsm6xnSX6zli+jPVZnlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="155381111"
X-IronPort-AV: E=Sophos;i="6.15,287,1739804400"; 
   d="scan'208";a="155381111"
Received: from mail-japanwestazlp17010007.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.7])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 17:39:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fovb6hY0U5iQ0tO5pxWqMaaZ7SZbfUNlDy9vtkE5/tL51VXjv4eucFbN6r1K+1zGKRS5SxBsi750wIEz/1P99bfL2m7FbXZCRQlz9BVPXvaHcxmr/Alo8dVMdvZdRmvjBioBomoE2dRe8bqixlPYDRQtq/i0cbwjXOGACyOIEpGbZX3IUi/MMb7NO6kMXUO4gh6eE0XNpeKinIsET8xbBYLXaxxGmRPA2/KI9rak51WxNLpOVh953amI5e0m87heNcm+IXBqpojNVR1aWLSaaDXY/9QQZj1DYEAWJlg9dnmePrcGUEso4jssLz6rpEl0f/aTVny39yV0Z5GFudElOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHVotslnz6Q/qYlNi7odHGb98gka9BqBR/z87uyRT8g=;
 b=B/6KdU0WtdM1ogzCRn316ZAOIdwiqycQ/RD4XF8oNjpCR3+Y2MVwaO19+aJUOey+yiplAC7Ttio2h6vf0CdukydL8OsohGgfA6AhBxofxlIPoBZVIoyxHuLRBXF5keu8fyT1Nj3yDx4w3zdcR0GiSbMgjk40CoTMOHvUizIGQ9GYDYk1HiI6IZBaOQdTvuavboQpQx1UXbv0OS5Puf/kn/4j+Eq6OM6pQYTAZGeVIVsGzrM2BAbeC4dRu6LNUw//6/h4OIdf7BB5qUfc3NOGGO8zaZmfmCRqtcrzj86BYjzu2gFinkBbU08iY6RfVxop4vO54jRkFRRUTh2eXcN5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYCPR01MB7943.jpnprd01.prod.outlook.com
 (2603:1096:400:11c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 08:39:05 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 08:39:05 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 37/56] python3-hatch-fancy-pypi-readme: upgrade
 24.1.0 -> 25.1.0
Thread-Topic: [OE-core] [PATCH 37/56] python3-hatch-fancy-pypi-readme: upgrade
 24.1.0 -> 25.1.0
Thread-Index: AQHbwxzOSEzIErZDwUGMUQLZJoyTTbPRsCSAgAAe5dA=
Date: Wed, 14 May 2025 08:39:05 +0000
Message-ID: 
 <TYWPR01MB11861463B6E2952F8CA37ECEADC91A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
 <1747040619-7566-37-git-send-email-wangmy@fujitsu.com>
 <CA+chaQc5av1DKKu7arqbnG-Vr8A2yVeCAxmy=kr7THKBAUusxA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQc5av1DKKu7arqbnG-Vr8A2yVeCAxmy=kr7THKBAUusxA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YWJkODUzM2UtYTQyZi00MDFmLTgzYzEtZGVhMDVlZjBl?=
 =?utf-8?B?YjBkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA1LTE0VDA4OjMxOjUyWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYCPR01MB7943:EE_
x-ms-office365-filtering-correlation-id: 21f1bc07-2592-4daa-443f-08dd92c2c95e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bnlveFJiRkhFN1Myb0NhNTlkL050QnBKUVllMFgyUzFvc1J2M1JHY29EYTh6?=
 =?utf-8?B?SURJcVdlUS9ublQ3aEdyT2NXRFU3eWlGdUpjM1BHcFFDUU95cXYwb0hlZ0Zp?=
 =?utf-8?B?dHZSYUhRZC95Ym1SMDRudmh1Z1l4QUd0K0VFL0ZtdmIzeXMxNDZVLzl5aEhz?=
 =?utf-8?B?ZDBrMml0b1RhMnBEaHFDV1hSdlAxbmhNdVppVVdxaFRWUFRncjYySklxemtj?=
 =?utf-8?B?aElzWThvejk1enFKcEtUb2VtY0xkQWU5aTlGQXZwRGZUdElOa09QQnhVckpW?=
 =?utf-8?B?dHBTNG10Tlgwa1FDSnJXa3Z0VlUyb0xLR21aUjhUK2M0ZzFQL05UYkRvLzQz?=
 =?utf-8?B?WjBQTzR1QWlRZHhzK2VWenVXYXBBRkptUkVTem5zcjU3YnZqdmFFblROQnlh?=
 =?utf-8?B?ZjJxaCt5MzJORk83MG5yaWpBNUgrekRxZmhTSDBHZTNPeVNqKzlwanVrRmpE?=
 =?utf-8?B?NTdmcXlHY2ZMQ0lEbUVpci94VWN4cHhRUG94MDdneW9KQWo5b0E5aysrS1lF?=
 =?utf-8?B?b3NOUkFsR2hXSzV2d1lHOE1EMGhwL242dis2UW44YjVaUnBHWVVSM04rM3Yv?=
 =?utf-8?B?M2tPaEVYZ1VoSmRIZXN6dS82UTAzYmFrdVFpb2FZRVFRYTY4SHAxNVdKazk1?=
 =?utf-8?B?NHl1UkNsY3BxaHZ6TEFHWXdpdmNycXd5RDRkaFBPNERXUDFObW01dVM4S1M3?=
 =?utf-8?B?QXNEK0lFMC9MTFphbDdhYUxIVjNSYVloU2tlVE53RUo2N3B0YUV3MHI3KzNE?=
 =?utf-8?B?U0thMGFGaDk1YWZ3cHBKWXJtNi94ckNNZGJRclIrcy91UGErdnZOY1M2Z2lh?=
 =?utf-8?B?cnI4MHJtSGQwYWJVMGd6c0k0bkRkWE5mUzZORG5KaFRDZXNVd3N6QXRLblRi?=
 =?utf-8?B?ZzM0UnU3UHVoMVNYVXhNK1dJQlN4RmxGUXA2WHBWR3JJNlBDYzFuYW5DaWtr?=
 =?utf-8?B?NU1hMTg2WTZ5WHNqK25XTWN6YjBpUGJPVjYydTN3aDBCQmxuM2w0Ti9HUHpW?=
 =?utf-8?B?QnR6bmtmTXlSSGtnVlEzUzJSWUJ6cTRzajlJZG1pM0V2NlNmNEt2YU5wVlRD?=
 =?utf-8?B?U1JvTTd3UWhLTU1pUmZDZWxuSElzdUpydmZ1bXFxRlhkT0h3RzVqWVJ0RlZh?=
 =?utf-8?B?Q0pEbGJ1aGJkM05pYksxSk4xSnZBbUlzOG5ybkw3am1rcVZrSGFmSkdDaXBT?=
 =?utf-8?B?a2tGUXd1K3ZoVEE2U0kyWGtYVEtyMnZwRkg4T1Z1aC83UG1UcWlVWE40K25U?=
 =?utf-8?B?Zm13bml0K0xZUHlRc3R3anhKelRtWUFWVDc4LzA1NTRIVmRrUEM3VitDeUhq?=
 =?utf-8?B?dnAyUjdvUXozUVV0R25TQXFic2E1M0ZNay9tejZDeXVjMjJNOU9qZWFrS3Rl?=
 =?utf-8?B?ODlLcE1SNWwrSDlZMjlIUVVyQTJSeSt6ZVU1RUJJSFB2NXJ5d1NyUzdmdlYw?=
 =?utf-8?B?cEhoa1FEMmNRM1JYQlBwNGdYTFd0MHdsUG8rOVRiUE9ieHp6TjE3TG5GWldJ?=
 =?utf-8?B?L1dwdkh1THNXOGRFakdydEdzeUpHYzIrZTdYN0tVa1lBRTBQTUpkT3hiUWZM?=
 =?utf-8?B?bDNMVXZsRkNWc0xYa0J5eEhuNXF2Tjg1UVV1VDNUbUxjelE2ZERQckQ5UE1t?=
 =?utf-8?B?a0xVM3Nna0ZxbEdLZ2Zna1EySFhBT3BhdndTWnVCWkRMN0w4bEZmOERhMWlS?=
 =?utf-8?B?a1BnQ29NbEFPNERvQ1dKQlB2Nmw1S1ZneFlTYjB6L0lrRFhWN0ZGSlpzNERy?=
 =?utf-8?B?eENqUDZjZ003ZzV1eDZqOEZBVTAxSkpqQm5BVGZObGE1MjNrL013QkY4VzB3?=
 =?utf-8?B?RkJmVWFxVWRQSjhLSG1PSGhhdVliUzhma2gxbW9TOVZmeWo3Si9YSzBUYzA2?=
 =?utf-8?B?SHFnUU10ZEE3Qjc2dVpBOXRoMEtqK2NrTUg4dzJkcFVTV09xSWtwK2VLdU9R?=
 =?utf-8?B?UHBta000aXBLTEE5Wk9LdUp3WFlJT091WTBGbzlRclVBZXlHbXk4czVndWZY?=
 =?utf-8?B?MkRQZEZwSzRRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZnRNOFcrMkgybm1kY29OTE92UVlsR2NUUzBxc05oQVZva25IRzVRU2x6Vzh4?=
 =?utf-8?B?Q1hQclMxdDFFd0FFQzlIQ2JjeEg3OWlSTkZmMjc4c016RVZVUFZmWFBnay9R?=
 =?utf-8?B?TnY0enJ5TityeU50T0pBcndLOEJ0c1VMS1k3RStqeVRycy9idGpTbkZ4UWNi?=
 =?utf-8?B?VWthTS9XUjRwR3RyQm1MVmg3cWE2UFRkNjZUZEJYUEFmb0NPQmVrSWZJNGJk?=
 =?utf-8?B?cFNqR0RLeEw5ekZ6eTJqenM3SVdRbVllYnNSWmxjQXlPZWRBNWs4K2xqSC9j?=
 =?utf-8?B?ZVVSSm4ybW5VaXE0MEp0aXlKVUx6NG5pSWc1dU0yV1BhU0s5OC90SW1nOEJI?=
 =?utf-8?B?T0RsRUltL3JlcTArdEdSakJrb2U3U3ZIbC9JekhyazNZT0ZPWHJ4cnZ3cXNI?=
 =?utf-8?B?Z2FXSHNtZTZ1NVBzU3h1OU9CUUl2UGgwNVNxQU10KzUrU3BxL1V2c3ZBbi9y?=
 =?utf-8?B?MlpvR29YMGJmVnFLOGYrK3IwZkl0d3dIQ2ZUajRLY0tZK2U2aDN3V2J0K3Qv?=
 =?utf-8?B?SVFiV0xZaUNkamhMYjdrU01NaW1yNEw4YnRFd3VzTjVMbDVMTVFJRmtndWNt?=
 =?utf-8?B?YWtpQlE1WWZSckJaMUtJTE9obzdTaWs2UmNwZC81ZGxid0g4NEw1QUs5ZWg4?=
 =?utf-8?B?cGZ5dXdhc3Qrc2VkQTJkODdCNENrWjRqTHhIZ1NwQnBnbllCR1cveWRrcFA2?=
 =?utf-8?B?UDJuTnBRZ0lxcklFRmhwdnJ0aFNwZnRReHJQUGZtOHBGQVdvZDJKaFVoNVBM?=
 =?utf-8?B?aWZGb2ltSUpaaE5oRHVPVEJXVWltNXZPZGY2K28zZ3c1bXhEYWxPa01iWFo1?=
 =?utf-8?B?bTZ6NzBxYmJ6NjN6THN2RDFaUENVNVlsVHJFbUQ5cGVWazN6LzRTeEI5aVhG?=
 =?utf-8?B?RFJscDFrM0xaYXB4WjB0SzRjMFEyZGVPZEJDOWVRWSsraG5IOXBmY3ZTOTZa?=
 =?utf-8?B?bjV1R0RVZHhTVHFseU9yVFFuWWltdXdoWS9xM2ZzcmZXeStrU05qTnJ5aGZ6?=
 =?utf-8?B?REtXakFHM0tGZmZUa2N0c1M4bWdIa2xIR1hiOFd4dVB5cUppa3JyZ1BwUUM3?=
 =?utf-8?B?VUZoN2VyNzJnK3FwVXZxMXJGVnZUc2RZdXdOWFQrOGVLZ01nRmlTR09neDFx?=
 =?utf-8?B?UUdhbThxamlvZ0lDT3c2ak9aODB1UUU1TGs4aStKNzRIa2tvSHYrYWVtMDJT?=
 =?utf-8?B?YVBBY3dlREVzOU9SME5xclMxSDl0MWREMjc3K0p4a0hraDJlTVZRNUN6MzZO?=
 =?utf-8?B?Mit2TGpjMi9kZEQzSkdVUmtpUmdsMjczbFdxSTFDTFlxR0ZFT2ZEL1hYM1ln?=
 =?utf-8?B?M0NLam12T2RhZ3VDK2syNkh0VWhaNHdLTXVMOGN1VW5UOVI4VHRxZ1kvekFn?=
 =?utf-8?B?U3dMOWtmRzM0Vzh2dU52TE5NREVSWE04U0JOTnp6cVd6NEJXYWMxeW5rMGM5?=
 =?utf-8?B?RmVqR3ExUTk3OUJkTDdIV1pmSnVLUVlEcGwvdU9DbVBQaDNGNnh6ODhlUEEx?=
 =?utf-8?B?QkFYRjRFNW9VcFN0bGpyMys3b2ZqcXd0TnFQWFBhVGdDRHNlQkNxTklrK01K?=
 =?utf-8?B?amRSaEhFNmhHK1dLWEtBTnVrYXNsMkM1bEErTi9wQ1pwbGJHWEhja01ZM0Ni?=
 =?utf-8?B?MUFueWs0Q2RGMS9ObzRyUTBqUU43czJGbGxOckxORDFtaWNmaUdaZmVlNHJT?=
 =?utf-8?B?RmNiVk4wTGR2WmdXUUZTU3lzN3JLRUJrbml4S0lsZTZXRHRyOE5uRFRhYnlt?=
 =?utf-8?B?a0UrSk5xdThpWGI1c2wyVEdFdGRtc0dUanJlendZTjhxc3UyRjY1OVlrNkRH?=
 =?utf-8?B?ZmpTcmpOUStJUjlTQ3E2M0ZBUDBrTFJBNnRaRVlTN253Z0MvY2o0eE80WFg0?=
 =?utf-8?B?TEZ6SnBobFYxcGw5R29xS2Fsbzd3anpIZFBnTkZQY3QvZjVTd1ZTYnNpWVdX?=
 =?utf-8?B?VDZsK0JwQ1ZONENDV1NBOURzTDM1ZFVUL2tMelFqMGxxaklBdmE1dEdsWkty?=
 =?utf-8?B?eFNSY1NHUCtFRzI4QWRrNjBqbUJuTDlCL2FNY2VuUmZkMTE0cEVvMTB3eml1?=
 =?utf-8?B?WFIxOGs3bkZnYzcwa3lsVzFNaFUwUEg3bGtMZ0RqK1FPWWR3SHB1QS80Ungr?=
 =?utf-8?Q?BjSc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SZGqZ2pWzlRVgJRl1rAVHltS4Kobax5sRSBaOO44eaURHl0pHC0Hqi6mGLq2J1iCmk+2J0JhAKOwXrZQeJBeTGng/iixHYO2i1VLXSd9vSmRhGSb44gAW5NBYygHSCw15VlR1Kuy57iXU6hkN/eSKtZgSnwfu63otHFeuCWnFJsuKK7A/h8AA+EizNbu6hYfgTFZR+vOZ/lFRWWwgvyaF7oXy396bxYKDGe86Ud+GacZbYSYIA2ivad8k+D8Ngu6BdtFQUBOHopupnFzZYfmzPTQb/XgGpMN3iaJ3NhR0F7tIn2tT0zLefAqf2xnW00MQYt3XEBmD8TGo+88eZqblmPZqowhsj3UbxpbR0j/175p+EZPa/sv18bigu/avKBhCs0inLf9g3Y2IJO0e4/OdYqRfhUhsqQYmf2SskCyMIdIhd6F3MYvH5FX5SAJZzwncDaf9WPnuquPWf3qX1LkQEy/xgfmwx16epjBM/3rSL35UC9UoKVyhzIeIn26irPuz7eIQ9avQbSnAkI+5eVyxJjsDVH5PjTBbpHFtHwhPsKTJvyLWrWxuwVpTUxrxC4CDOwv+KNFBm+DUrqkbSZMuUDhdL4LjZS49cKbr7SNnBwXI6ZoqYvrToJIDFOENAmX
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f1bc07-2592-4daa-443f-08dd92c2c95e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 08:39:05.5661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XNSdV/vBwFelgKdCA5/3TIfYMTWyv1Qt9W73sMJ3PBiNOid4L90zTSJFEuXTB5j40drsVg+NeZIEKokIAe369A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7943
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216486

WWVzLCB0aGVyZSBpcyBpbmRlZWQgdGhpcyBpc3N1ZQ0KcHl0aG9uMy1nY292ciBoYXMgbm90IGJl
ZW4gdXBkYXRlZCB5ZXQNCkl0IHNlZW1zIHRoYXQgd2UgbmVlZCB0byBzeW5jaHJvbml6ZSB0aGUg
dXBkYXRlcyBvZiBweXRob24zLWdjb3ZyIGFuZCBweXRob24zLWhhdGNoLWZhbmN5LXB5cGktcmVh
ZG1lLg0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZU
V0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmpp
bmcsIDIxMDAxMiwgQ2hpbmENClRFTO+8mis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5
OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFydGluIEphbnNhIDxtYXJ0
aW4uamFuc2FAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAxNCwgMjAyNSAyOjQx
IFBNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPg0K
PiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSCAzNy81Nl0gcHl0aG9uMy1oYXRjaC1mYW5jeS1weXBpLXJl
YWRtZToNCj4gdXBncmFkZSAyNC4xLjAgLT4gMjUuMS4wDQo+IA0KPiBUaGlzIHNlZW1zIHRvIGJy
ZWFrIHB5dGhvbjMtZ2NvdnItOC4zIHdoaWNoIGRlcGVuZHMgb24gb2xkZXIgdmVyc2lvbi4NCj4g
DQo+ICogR2V0dGluZyBidWlsZCBkZXBlbmRlbmNpZXMgZm9yIHdoZWVsLi4uDQo+IA0KPiBFUlJP
UiBNaXNzaW5nIGRlcGVuZGVuY2llczoNCj4gaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWU9PTI0LjEu
MA0KPiANCj4gRG8geW91IGhhdmUgcGVuZGluZyBnY292ciB1cGRhdGUgc29tZXdoZXJlPyBNaWdo
dCByZXF1aXJlIHBhdGNoIHVwZGF0ZSBhcw0KPiBpbg0KPiBtZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWdjb3ZyLzAwMDEtcHlwcm9qZWN0LnRvbWwtU3VwcA0KPiBv
cnQtbmV3ZXItdmVyc2lvbnMucGF0Y2gNCj4gYXMgaHR0cHM6Ly9naXRodWIuY29tL2djb3ZyL2dj
b3ZyL2Jsb2IvbWFpbi9weXByb2plY3QudG9tbCBzdGlsbCBkZXBlbmRzIG9uDQo+IDI0LjEuMC4N
Cj4gDQo+IENoZWVycywNCj4gDQo+IE9uIE1vbiwgTWF5IDEyLCAyMDI1IGF0IDExOjA04oCvQU0g
d2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDx3YW5nbXk9ZnVqaXRzdS5jb21A
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBXYW5nIE1pbmd5
dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gQ2hhbmdlbG9nOg0KPiA+ID09PT09PT09
PT0NCj4gPiAtICRIRlBSX1BBQ0tBR0VfTkFNRSBpcyBub3cgcmVwbGFjZWQgYnkgdGhlIHBhY2th
Z2UgbmFtZSBpbiB0aGUgUHlQSQ0KPiByZWFkbWUuDQo+ID4gLSBTdXBwb3J0IGZvciBQeXRob24g
My43Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uYWRtZV8yNC4xLjAuYmIgPT4gcHl0aG9uMy1oYXRjaC1m
YW5jeS1weXBpLXJlYWRtZV8yNS4xLjAuYmJ9IHwgMg0KPiA+ICstDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSAgcmVuYW1lDQo+ID4gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaC1mYW5jeS1weXBpLXJlYWRtZV8yNC4x
LjAuYg0KPiA+IGIgPT4gcHl0aG9uMy1oYXRjaC1mYW5jeS1weXBpLXJlYWRtZV8yNS4xLjAuYmJ9
ICg4MCUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjQuMS4wLg0KPiA+IGJiDQo+
ID4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlw
aS1yZWFkbWVfMjUuMS4wLg0KPiA+IGJiDQo+ID4gc2ltaWxhcml0eSBpbmRleCA4MCUNCj4gPiBy
ZW5hbWUgZnJvbQ0KPiA+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRj
aC1mYW5jeS1weXBpLXJlYWRtZV8yNC4xLjAuYmINCj4gPiByZW5hbWUgdG8NCj4gPiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjUu
MS4wLmJiDQo+ID4gaW5kZXggYjMyNTI3Zjk0OS4uNWQ4ZDgyZWRkOCAxMDA2NDQNCj4gPiAtLS0N
Cj4gPiBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaC1mYW5jeS1w
eXBpLXJlYWRtZV8yNC4xLjAuDQo+ID4gYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWVfMjUuDQo+ID4gKysrIDEu
MC5iYg0KPiA+IEBAIC04LDYgKzgsNiBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZyAg
UFlQSV9QQUNLQUdFID0NCj4gPiAiaGF0Y2hfZmFuY3lfcHlwaV9yZWFkbWUiDQo+ID4gIFVQU1RS
RUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iDQo+ID4NCj4gPiAtU1JD
X1VSSVtzaGEyNTZzdW1dID0NCj4gIjQ0ZGQyMzlmMWE3NzliOWRjZjhlYmM5NDAxYTYxMWZkN2Y3
ZTNlMTQ1NzhkY2YyMmMyNjVkZmFmN2MxNTE0YjgiDQo+ID4gK1NSQ19VUklbc2hhMjU2c3VtXSA9
DQo+ICI5YzU4ZWQzZGZmOTBkNTFmNDM0MTRjZTM3MDA5YWQxZDViMGYwOGZmYzlmYzIxNjk5OGEw
NjM4MGYwMWMwMDQ1Ig0KPiA+DQo+ID4gIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNk
ayINCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdy
b3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMjE2MzM1KToNCj4gPiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIxNjMzNQ0KPiA+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMzA2
NzIxOS8zNjE3MTU2DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gPiBbbWFydGluLmphbnNh
QGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

