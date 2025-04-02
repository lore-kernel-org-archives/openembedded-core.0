Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B98AC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:31:49 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web10.4931.1743589906361998114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=a95uqORM;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1743589907; x=1775125907;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N894ZnX5OkVaLLcErv2a3I/dL9sfNyZMjKPw2Oa5J/w=;
  b=a95uqORMo0/K82wvd64Gn163bIANLKFIn0ZZ9KbcJEaRa8OeykGQ23BK
   0puSSXWAv3vQemIcE0L4W1ByKdwb+UhhI/tOBrQ6AATvJz9ypatOxVPDa
   Fl+9n6NFtJoU3hAQiY1l5TQQIh3avG5pappsmG/pvtBJB1jspG5XXnj77
   EQV6hMrMfj4q4JWVsu+Kvyeq4Ns0eIMMa92XhJM5olGE/OeKUrp4rTG4F
   r/TT5TuzEX8ZIMizgzFUzGndtNkN2Uupaa7dAA7LFjXBxqhW3/vDr9/As
   vuxFRhoWM7BnTNvGsv32O6wW95WYeCFo4rD1Wbzm7aynpyJ1jcMlB7JO/
   w==;
X-CSE-ConnectionGUID: SYInjgLhTnGi93r4WkRS/A==
X-CSE-MsgGUID: eDAbFLsHTkWPpt2QP7EdnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="151500419"
X-IronPort-AV: E=Sophos;i="6.14,182,1736780400"; 
   d="scan'208";a="151500419"
Received: from mail-japanwestazlp17011026.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.26])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:31:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGG++AC06Oyv6Opg48DBmv2rxyXMLpoXGYxpWcGd/STblp/OcGWrCNs4Z3st613xM3QMP/hiuNbjtxzE450GOTgmK7YwUj/fsG5s+JQmz7g1GXC3XLE3iQ6jQkuVZmwupWENaKv4okxQ7tA1HizYQbDUJkH9gp8VbWM3rKxci9kNN+Ii1JUIgZm43eIOzDeKRU1uz4Qgq0oVe+PgpaKZ4diFSXfnwMAMwhPjSFXN9Dfp4eAZxP+fLlcAnyBLXmSVCAR3UheZcMAfdj9518fv9HmfvqKvwZWMZKbDRvP52Yb/G5WyXCp1pFNwwGe824qGv88xvd1TN2P1GC8MVVDRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N894ZnX5OkVaLLcErv2a3I/dL9sfNyZMjKPw2Oa5J/w=;
 b=fEvVXEUxYv+wWPBY5XqSoc/oftu2kAihPuCD7B1wifO5jIRWzUV89EXxy8n2uvvf3mMUfQRaDj2Ukh9a99ET5gGr7p4w2esuriLbLCzyttaOIrjiEa06R/qm4N30U2c7Je8EAsHhUBf4QXDL9YfejOzL3dToPcZ1DIjDUxfwtLe8CGITZnJBlGH/kGtpYWs8pNigbwOhO6Sd9R8c0ZW7hQsKFf9/EUwDj53OL4zUVaeBu1ViOmRt20Br+zWMy80CKYzWrEMJk3+mQZIUH9S0tccpOgyZo+rEe0+OGjm8JyFz7wPB2GnDU7Dly68UfpbR14E2CB9ognvX957tgq3v+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYCPR01MB9671.jpnprd01.prod.outlook.com
 (2603:1096:400:209::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.31; Wed, 2 Apr
 2025 10:31:35 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%3]) with mapi id 15.20.8583.033; Wed, 2 Apr 2025
 10:31:35 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: Alexander Kanavin <alex@linutronix.de>, Jose Quaresma
	<quaresma.jose@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
Thread-Topic: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
Thread-Index: AQHbo668Ef4/Bm2frkerRB8Kl6F44bOQI6MAgAAB+4CAAAeFYA==
Date: Wed, 2 Apr 2025 10:31:35 +0000
Message-ID: 
 <TY3PR01MB11056551D94171A6BC8F06F4AA0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
 <20250402090749.2119-2-leimaohui@fujitsu.com>
 <d59454214fc72c26186fc86f073b66fbef83d12c.camel@linuxfoundation.org>
 <CA+chaQdN+VKmo+DdYPoDsoz2XZuS9h=ZTJJaQd+3q2v2tJoqRg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdN+VKmo+DdYPoDsoz2XZuS9h=ZTJJaQd+3q2v2tJoqRg@mail.gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZTQ1ZDYwYWItYmM1Yi00M2Y4LTgxZTEtNDk0Y2RiMjg1?=
 =?utf-8?B?MWYyO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTAyVDEwOjMwOjMxWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYCPR01MB9671:EE_
x-ms-office365-filtering-correlation-id: a60842cc-202a-46bc-007d-08dd71d18b57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ODdRdHNaYnhlWUVTR1NtK28xZGVUemZaS2FZUmxqMGkralBYRFJaT21obXVV?=
 =?utf-8?B?bnJYWUlLZTRaZnBaK2lHeTRzUzcxaEtENU9nd0dRV0RLL2tReUFUdVlzbGlv?=
 =?utf-8?B?dytOc0NzdmczYm5BWlhnYzlWOXRBT2pwSGVUdnNtOTdLMWkzTUE0aU1HN2sz?=
 =?utf-8?B?elQvNHpiVnB0UjVicVRLWlMzZlcxRklmWURCMVoyVi95ZUtTWTJKR3lVVjlx?=
 =?utf-8?B?VGEyQVNDZDNoUWJKRFdZT2NoZmQ5bDQ0UE85bnFxa2l2THlnNWFlRWxFWXBG?=
 =?utf-8?B?Qk9uVTZUZksvS1dqRWRqV0pTTzNXTUhmY3F5QzdHUlRzRTVDWXRRajVnZXM4?=
 =?utf-8?B?dnRDWnk3ZUNFWFZXazV2ODJhMVVpTVhUVnV0TkRHc2ZxQno2OUNlTEkyN2Y4?=
 =?utf-8?B?dGZsSU55U3FUdVU3WldkMEdzVStTYjg1L21nUWwvZTVoTzIrZysxTUowdEQ4?=
 =?utf-8?B?VVhPNHFmQlF6UWhDQXdRZHFhMXFSV0RTQkppWXg5ZGFEeUZuQk4zQWtUV0lL?=
 =?utf-8?B?ck9mc0loYWVsSFU5bVdycjdtUmtObk1qK2F0KzBCWStZeTVBVTdjR0NQZ0E1?=
 =?utf-8?B?Nm1keGYxMXlpL1RFbWJCL1dMVlZ4SXE4aXVla2RIZGJ0SDZCZ2w5bkpNOTlT?=
 =?utf-8?B?aHNpVFNKVHJwVVdaRjAzcUp6dTQyNlNPSTZTR2hkTWxnWTFoaFlDZ0tkVHph?=
 =?utf-8?B?MnlyU1VxUVJEU1NSVUtwQXBoSXFSQmh5SFJBR1hYN1F0UVdubnFsTitiSEla?=
 =?utf-8?B?bHRsZWxkK0RBQnY3U0NvYitUdythRXFVRG5Lak1CazZoWWpxRlJZVTJZQVdv?=
 =?utf-8?B?QjNNb3kxRkY2WHYrR1pQVzM2NWQ0dEtwSlpkZzJlUkxOYVBLZkNSWllJNzBz?=
 =?utf-8?B?ZWNhSHFWNm5FWXo5YmVJcVdubG1kWk1GTE1vaGNvQmU0cWRObWxhS21tanJ2?=
 =?utf-8?B?SXZOU2QwQ25nM0pId1pxcUhOc0t2WXpaaE91SnBVcWdFVTBUdHkzUXBkNDhD?=
 =?utf-8?B?UFJIUTEvWG1WOHFpcWdUUHhvZnRBVGNOdjk2Y3hIL2lWMU9QLzk0b3o1bGhU?=
 =?utf-8?B?ZXF1UEtWOVB5N1NESWhqRFVGQWlnaGhkbFpuZGY2V3VNUUxOMjk0NlZza2F3?=
 =?utf-8?B?UEJZaGVrQUlXS0ZsWXN3MDI5cHZNQlN6aElWamFrS2NYcjdVNWt5ZGhzaTBS?=
 =?utf-8?B?NEhNRWUxMVRBcTYzYktDVnh5d0d5VkRVRFQrRjJ6L0ZocGFpTkJ0amNMTDBT?=
 =?utf-8?B?Z2c3SGVMT245QWtSNXdwNDd3Y2grdXYxUFVMSDYzRVByS1p2aGN1N3dSaE5l?=
 =?utf-8?B?ajEvMzlUQ1ozMWFFY290ZHpQSnpZUXNIdUl2cTAxaEt2bUdiVjJsTnZNNHJO?=
 =?utf-8?B?UTIrNTJsbG0yRkY4NHZSYm9ySmRkSVpnWE01bGdlZEVzc29pWHgrMjk4bkdk?=
 =?utf-8?B?YVdQc2RDTjYzK2NqMjZzaGpQSGZUUU9ZWkx6eDM2UTgxS1BVSi8rS3hic0Ir?=
 =?utf-8?B?YysyUUdpcXJpU0tDWjF2YVVRZGl0WHFDVkliZjZMUHBWWDdmQnNMSG9oNE5N?=
 =?utf-8?B?MlJuTytsbXlQOEVFTVE1V0IyWm55eWhyMy9qYy9aV01mYjJqU25ScWxaVXE3?=
 =?utf-8?B?WENTNk9lNlVHSkR1WTVWZ2NmVk04UEM2YktPSXRLR2VSTzBycXc2RDY0ZkJR?=
 =?utf-8?B?WEEwWnJEd1N0QzJxcHI1RUZ5NjRPRElFNDNqdmZvYXFldHFEKzdrM29lUEhq?=
 =?utf-8?B?OE02MDR5ZERKQWk3OHVKbE03V3NuNjlJYmljWDJ4TWxGMUVldDFqa1U2b0RU?=
 =?utf-8?B?V2Z3dUtROXJsWmJ5UGpsOFNvWFpBUHF4Zk5iQmpKNWxVc0pXVktra3g3TmNI?=
 =?utf-8?B?RmVBTldLam42bmVUcnlIajNmbnE3bUduMGc5cjJkaURxV2dVdmxiUWR2OENM?=
 =?utf-8?Q?/X88+IWI2dM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aUF5OWJxSXpxcGtWMEt6UUhjNHgrUWJmUTNRbGxvNHpkNjRiUTNwQ3kvOTNX?=
 =?utf-8?B?M1RSTFdQNGJXNm96RFlXSTZReEdiVjVnTVlDQ0pnTkdhMHBNRERJenpZWlQv?=
 =?utf-8?B?MnVvb0pySDl3WkhvbFZKN0FOajczeFZoa2ZDbjJCRVVsaDUrK25lWHN0V2o2?=
 =?utf-8?B?djlQdmhoMmF2aFpQZW9wTmR2cFNicVBrdEFwRWtqdFVvMzhUck9vR201MjRi?=
 =?utf-8?B?Yk8wNWFISEpMaWlseTVCQVdubDM4QTlNS2dOV2wxUUgvNTFjVHg3Ri81MThG?=
 =?utf-8?B?RGJjWU83U1FuK2JoN1QwNjdTYmtrSU9GOUhxNC9YbVRrMlNxVThQUDlsMFJ0?=
 =?utf-8?B?YVRkdkZiN1RyTitlMXJiZUd5bEI0Z0ZNOERRVGQwNWxNYjVSY0YwaWY0Y2gz?=
 =?utf-8?B?S0paQ1F5dG10Nmd2ZTB0L1ZuZHl1RWo3TzZweVJVWUZ3alFUTUJLbjdON1Rk?=
 =?utf-8?B?L2N0MitqUHMzN1d3VUljU2d5djlXVW4rWWtnWWI5QmZiUE9uTWcrWHhtOUJt?=
 =?utf-8?B?ejJSSTU1VDcvSUdoNnhJOW5wWlV4Y3d5MER1ejZJdDZlQk9vYkZpbkEvNGtl?=
 =?utf-8?B?YWVnZGQzYlNKcHo5L2lxbmliME9oT0R2WUgrNThWYys5QTV1a3M0MG9uT0JJ?=
 =?utf-8?B?NU4wUTJPbzZWZlc3eTNZMGZkUGNveWNtYjJrbHpyb1p4RjYzMmdpdEV3S1pq?=
 =?utf-8?B?bkk0aFZCQjVPU1Y3QmNVZXJwd2NaUFFqanlOUWZDeUxtZFdUS2h5dFY5bFNI?=
 =?utf-8?B?SXl2ZGJxditzNlAyVW1pMHcwYTNnWkdPZnM4T0J5bEpxdzFXU0pPQkhYUURr?=
 =?utf-8?B?QlJ5bTViUWJVSUNXYk9nNnRDS2VIZmh4bnI4WldlNUdEeWpiYXlYUDcwTzBT?=
 =?utf-8?B?R21YUmhKMUNqV2g2UWhnQ21OTDc1SExsalExZ3VPRWVXSDZEeXlXY0xnN3Vi?=
 =?utf-8?B?YXNaVHN3R0pDSjR3a1UyV2dIQ3QvNDVLcjVFWUxrTG1RTzltaSszeWFzR1Iw?=
 =?utf-8?B?SUQxQzFLZW1qM2o0MDAzQkJUSTVJRUhlVmJVN2VYREFBSGtNdmJiNElnUzR2?=
 =?utf-8?B?MFA4aXRJZUpPSnZ0UDNjWlNKYUg5aG44NmJJaXUvbDJtVHY1aXpzdUpvaHdj?=
 =?utf-8?B?UFlpVHZmQlhFQmNzWGswaG1lQVJWQ1BvdjBxRHNuOXZlck9hdmR5NkJQVmRW?=
 =?utf-8?B?eEprWGRKRVVmMkNEdkF5SVJTbVlrZHVHa2c3K1g2ZzRZNUp3M044STdkSmdj?=
 =?utf-8?B?YkFtMEJQbVgzSE1SRWpRK3JtZ05QWEpGM0NlRVJQVkRnSGJEeUN5dWh6a1JF?=
 =?utf-8?B?T05QYUhQN1l2VWl5RnNQc29lVlhVUGpBZCttSkIwZGxBTEdRNmtGNXV1Mktp?=
 =?utf-8?B?bUh0QlV3N3ltR1dQYS9Kbng3Z2xYQ0hlK2kwSkFBbWlWcUUwanNRcy9mMGNk?=
 =?utf-8?B?a1ZISWdzbFFERUdhS3FSNVlPQjAyYUZMYko2Qk9uQVFHMks4Nnp4bFloelZ2?=
 =?utf-8?B?T0VWeDFjUE9MbDJhendOcGM1aHB6TVZ4eUg2dlRnYjVCQWpnMkN4YVdQSTZ5?=
 =?utf-8?B?Z3pIamxUSkoySG01KzQ0QWNnTmZvU1g3UDVxSkRnTzJOVzl0QXh1ZFowc0Fu?=
 =?utf-8?B?UVNUdTBGbWtGdnJhcE4ydnpGMjI3aFN5ZzNOMFduenAvQTFyZThJSHQ4cldS?=
 =?utf-8?B?aEQ5aUV3NXcxMnpNQXc1OVhSektROFI3amxRN2N0SHdkMFpBT1FaVTU2d1Ru?=
 =?utf-8?B?U1BYU0VpaFVWc1VJSEpQbHNPSDFsS25YZGJPajN2MTJoNnRxVy9YeDAvUUJ0?=
 =?utf-8?B?L3U1Um40UHR1eFNjS0RvUjR0MlR0c3k3UlZQZHczcVdNTnJqRFUycm9PU2ZP?=
 =?utf-8?B?MTk0MWpkUG0wbWhKZmlhZXQva1RBTTYxd0x1eDB3ZnIxKzBKNlp0MS80ajJQ?=
 =?utf-8?B?aHorQkJlakphQ29tQWt6RVEzWFNOTjJYT1ZDd09kMitxQzBhSjdOYm04Qzh6?=
 =?utf-8?B?RVBYSW9oSUphV2l6Uk1VMnJLSDlWUnBIbDZhcjFXcmNsWlkyWmJkcWhuY2RK?=
 =?utf-8?B?ZlI2Q09xV2Vsd0pkREZKVkduNGg4UXFKOFUzbjZFWUJEME1IUUVPdEJnTldS?=
 =?utf-8?Q?EYi5d5MrRFVfXOWK1YLpd+MCj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	RDMD8bYCFtBk/R3A4EfWn8ff2wRRyvNUpGtDD0hMudQW0smHEKQ49OCZi0k5/eQIvIs2CG34SnPW3lMfOk4Lq2CQCDbXxVDk+WhyBPL9YmY0HHfDuAmxMhRuamIoBKs4il/b87LX/iPs9PfGT/773HhbUkIskCm/i5fKmguWkDlD0gkwFfmhKiglknGPKagPC9sy05uoXmoYgboMwLURqcn3hS1MMkyUz9Y6QZmipWwZpsUYj4eDtKwEC9m5vUt0C+tjlz8mDuypOEP4ezd+pV07Ik/q7LG9SR2Az19oJnswmZkDdW4zx6ADJ9QTpi8nwWEZMC7ooZyjjadFD1hq4camJzbQD/PxaVrVB+YkzzpPi3MP7bV26kkchlLO9tVyuiEUm4iSmkbiJ4VsSjVxdoigSUt/0JcgHPDPA1r0GoW28Cu3SioY2ZqjVZFxXXzrV+Y5vc3KVG6KEK3e/+lG5KrO60/3HD+M/4Whe8lo7zHgNSAVJ5MWyO4tFBreVlXRCH4kexhCTObFE2yLcqBJUJ++ZQp1AdhEIIHuoJONNhi5oFgfefqnfJ562V81iRppWu1JmxpYoSLyDniLKMPRAFhtBzVKZhEwjqJqKJTzm090MX878M7ImZkO89QiKUOi
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60842cc-202a-46bc-007d-08dd71d18b57
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 10:31:35.6211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpcrvaWqEp/vlzU0DsG/ktUGa5f7l5gMgWeuohjbNIGKut7+C9wljqdwobo8wErEK4ZwJB0v4i2oFEepcg1aiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9671
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214248

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFydGluIEphbnNhIDxt
YXJ0aW4uamFuc2FAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDIsIDIwMjUg
NjowNCBQTQ0KPiBUbzogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0KPiBDYzog
TGVpLCBNYW9odWkv6Zu3IOiMguaFpyA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPjsgQWxleGFuZGVy
IEthbmF2aW4NCj4gPGFsZXhAbGludXRyb25peC5kZT47IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21h
Lmpvc2VAZ21haWwuY29tPjsgQW51ag0KPiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT47
DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHB5dGhvbjMtd2ViY29sb3JzOiB1cGdyYWRlIDI0LjguMCAt
PiAyNC4xMS4xDQo+IA0KPiBPbiBXZWQsIEFwciAyLCAyMDI1IGF0IDExOjU54oCvQU0gUmljaGFy
ZCBQdXJkaWUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHJpY2hhcmQucHVyZGllPWxp
bnV4Zm91bmRhdGlvbi5vcmdAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4g
PiBPbiBXZWQsIDIwMjUtMDQtMDIgYXQgMTc6MDcgKzA4MDAsIGxlaW1hb2h1aSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiA+IEZpeCB0aGUgaXNzdWUgdGhhdDoNCj4g
PiA+ICB8IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCj4gPiA+ICB8ICAgRmls
ZQ0KPiAiL21udC90ZXN0L2J1aWxkX2F1aC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3B5
dGhvbjMtd2ViY29sb3JzLzI0Lg0KPiAxMS4xL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGli
L3B5dGgNCj4gb24zLjEzL3NpdGUtcGFja2FnZXMvcHlwcm9qZWN0X2hvb2tzL19pbXBsLnB5Iiwg
bGluZSA0MDIsIGluIF9jYWxsX2hvb2sNCj4gPiA+ICB8ICAgICByYWlzZSBCYWNrZW5kVW5hdmFp
bGFibGUoDQo+ID4gPiAgfCAgICAgLi4uPDQgbGluZXM+Li4uDQo+ID4gPiAgfCAgICAgKQ0KPiA+
ID4gIHwgcHlwcm9qZWN0X2hvb2tzLl9pbXBsLkJhY2tlbmRVbmF2YWlsYWJsZTogQ2Fubm90IGlt
cG9ydA0KPiAncGRtLmJhY2tlbmQnDQo+ID4gPg0KPiA+ID4gcHl0aG9uMy13ZWJjb2xvcnMgaGFz
IG1pZ3JhdGVkIHRvIHBkbS1iYWNrZW5kICB8IGRpZmYgLS1naXQNCj4gPiA+IGEvcHlwcm9qZWN0
LnRvbWwgYi9weXByb2plY3QudG9tbCAgfCBpbmRleCA2ZmNlYzc3Li45ZjJkZmE5IDEwMDY0NA0K
PiA+ID4gfCAtLS0gYS9weXByb2plY3QudG9tbCAgfCArKysgYi9weXByb2plY3QudG9tbCAgfCBA
QCAtMSw2NSArMSwxMTAgQEANCj4gPiA+IHwgIFtidWlsZC1zeXN0ZW1dICB8IC1yZXF1aXJlcyA9
IFsic2V0dXB0b29scz49NjEuMCJdICB8DQo+ID4gPiAtYnVpbGQtYmFja2VuZCA9ICJzZXR1cHRv
b2xzLmJ1aWxkX21ldGEiDQo+ID4gPiAgfCArcmVxdWlyZXMgPSBbDQo+ID4gPiAgfCArICAgICJw
ZG0tYmFja2VuZCIsDQo+ID4gPiAgfCArXQ0KPiA+ID4gIHwgK2J1aWxkLWJhY2tlbmQgPSAicGRt
LmJhY2tlbmQiDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFv
aHVpQGZ1aml0c3UuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgLi4ubjMtd2ViY29sb3JzXzI0Ljgu
MC5iYiA9PiBweXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJifSB8IDcNCj4gPiA+ICsrKysrKy0N
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pICBy
ZW5hbWUNCj4gPiA+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2ViY29s
b3JzXzI0LjguMC5iYiA9Pg0KPiA+ID4gcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYn0gKDcw
JSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuOC4wLmJiDQo+ID4gPiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYg0KPiA+ID4gc2lt
aWxhcml0eSBpbmRleCA3MCUNCj4gPiA+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuOC4wLmJiDQo+ID4gPiByZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJiDQo+
ID4gPiBpbmRleCBjNWVkNGJkN2QzLi5jZGE2M2QyYTM1IDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC44LjAuYmINCj4g
PiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNf
MjQuMTEuMS5iYg0KPiA+ID4gQEAgLTMsMTAgKzMsMTUgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9w
eXBpLm9yZy9wcm9qZWN0L3dlYmNvbG9ycy8iDQo+ID4gPiAgTElDRU5TRSA9ICJCU0QtMy1DbGF1
c2UiDQo+ID4gPiAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vTElDRU5TRTttZDU9Y2Jh
ZWJlYzQzYjdkMTk5YzdmZDhmNTQxMWIzYjA0NDgiDQo+ID4gPg0KPiA+ID4gLVNSQ19VUklbc2hh
MjU2c3VtXSA9DQo+ICIwOGIwN2FmMjg2YTAxYmNkMzBkNTgzYTdhY2FkZjYyOTU4M2QxZjc5YmZl
ZjI3ZGQyYzJjNWMyNjM4MTcyNzdkDQo+ICINCj4gPiA+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0K
PiAiZWNiM2Q3NjhmMzIyMDJhZjc3MDQ3N2I4YjY1ZjMxOGZhNGY1NjZjMjI5NDg2NzNhOTc3YjAw
ZDU4OWRkODBmDQo+IDYiDQo+ID4gPg0KPiA+ID4gIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhvbi1weXRlc3QNCj4gPiA+DQo+ID4gPiArREVQRU5E
UyArPSAiIFwNCj4gPiA+ICsgICAgcHl0aG9uMy1wZG0tbmF0aXZlIFwNCj4gPiA+ICsgICAgcHl0
aG9uMy1wZG0tYmFja2VuZC1uYXRpdmUgXA0KPiA+ID4gKyINCj4gPiA+ICsNCj4gPg0KPiA+IEVS
Uk9SOiBOb3RoaW5nIFJQUk9WSURFUyAncHl0aG9uMy13ZWJjb2xvcnMtZGV2JyAoYnV0DQo+ID4g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJi
IFJERVBFTkRTDQo+IG9uIG9yIG90aGVyd2lzZSByZXF1aXJlcyBpdCkgTm8gZWxpZ2libGUgUlBS
T1ZJREVScyBleGlzdCBmb3INCj4gJ3B5dGhvbjMtd2ViY29sb3JzLWRldicNCj4gDQo+IA0KPiA+
IFRoYXQgcmVjaXBlIGlzbid0IGluIGNvcmUuDQo+IA0KPiBMb29rcyBsaWtlIHlvdSd2ZSBhY2Np
ZGVudGFsbHkgY29waWVkIHRoZSAybmQgZXJyb3IgYWJvdXQgUlBST1ZJREVTIG5vdCB0aGUNCj4g
Zmlyc3Qgb25lIGFib3V0IFBST1ZJREVTLg0KPiANCj4gVGhlIG1haW4gZXJyb3IgaXMgYWJvdXQg
cHl0aG9uMy1wZG0gd2hpY2ggaXMgaW4NCj4gbWV0YS1vZS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjIyLjQuYmINCg0KVGhhbmsgeW91LCBidXQgaG93
IGNhbiB3ZSBzb2x2ZSB0aGlzIGtpbmQgb2YgaXNzdWUgdGhhdCAyNC4xMS4xIHZlcnNpb24gb2Yg
cHl0aG9uMy13ZWJjb2xvcnMgZGVwZW5kcyBvbiBwYWNrYWdlcyBvdXQgb2YgY29yZQ0K

