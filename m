Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B82C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 02:08:52 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web11.7222.1713924529152353066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 19:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=x4Hee7mX;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1713924530; x=1745460530;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZhpMk5MRc8UZqgxr+sbZyYuSE6MQbWDPJ2zV5R8OGtE=;
  b=x4Hee7mXRjbjkI8tLxt1OlPcGV6V+ePZNLK+fWI0skaMMuCSrCgn3fc0
   FGMufZNrqMTbxK5JOaBPGQ5eX/jSmwoWeMSwEiJr5NJ5o5x8mloJYztWj
   Q1Q0PLLS8NCzWiZaWxs0x3WTuKNruVLk2xigZ5ihG2/G1LWp7CSAYfSav
   c7UR4VNyiZKAJzovT/j3SiVLIxX5L/Butkr51aEtfuD7sAbkc7MCQnoR8
   SDD4nlNCZGvUtDuDxUui7dfA7ePTCdwKCUuYuttul/kX1Smkm/UUIcEhN
   Ul3rh5zntGEHH+U233mPGt48r16WRgcBt4jJrXAaozAmDAIfKzLC8bDp3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="117981102"
X-IronPort-AV: E=Sophos;i="6.07,222,1708354800"; 
   d="scan'208";a="117981102"
Received: from mail-japanwestazlp17010003.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.3])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 11:08:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQVlI9pEfZ1WAlwU1+6PcEetZARX8g/1pe/94eIF4tCCrs0aDjwDFIhYQEcx9xEYtHD8FWa+suVzSRN8FsDPoNVT5Lp5CdMZtHJ3+uyYm/IcMPXeeD8opjRmxPybZ8XI7V+EsGxt6H81+4b3oh1Jh1tMJsPHpmlZldA32h6QKzlMuMd1jW45PjXNIpBw8U8dXc6UIwxD/qed9Z9/8Ve9RVhI4I5NPKEesLZH74oAMRYglfzLIGbIBMJtMd0VuOPzP+Eo2Qx18/4aL7tiNsLsCUgJHk1jkwdA2rnLNq6YD5HIjmXDbA/0dN28bUy1BZpkIB0uI8zoTLv6OIoUAhFX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhpMk5MRc8UZqgxr+sbZyYuSE6MQbWDPJ2zV5R8OGtE=;
 b=IWSKisWpXGz7Pj6C6qppGynRSZVERneyLIRTS1xWVE+RUgs+QijTbfK5VRE5L9u8WLVkz4gl2uzTLPY2+KsYPuTEI+96+LklhUBhsxx5yB0E5lcQeGe83ZbHcZztNuXyd/jW/kkqAejCSNDut+OdeawKwKetQebmSA/rBCvHI2rVEbJqWRlbisqBeoiGXRJhUDScOmykyBtDpuKqiqqIr73K8GIQhAbW1Ec4Iw2UkKKccH/Nw5tGK1rb63HsaRTLbsVJumm71Bc/yX/sdSK1tCt77gNop/LD9WR0lLvjH5h1qcSWC6Jj8og5IkWGaD/dCJvqERHRtZ3zfrSie5jqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OS3PR01MB7381.jpnprd01.prod.outlook.com
 (2603:1096:604:11f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 02:08:41 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e%6]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 02:08:41 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v2] libbsd: Fix conflict error when enable
 multilib.
Thread-Index: AQHakS7v5Rna/weS7EOZ/YW4RKkdqrFtgUuAgAFGPxCAB+6nAA==
Date: Wed, 24 Apr 2024 02:08:40 +0000
Message-ID: 
 <TY3PR01MB11056C32DF3D90E8C09FB5234A0102@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240418012247.490545-1-leimaohui@fujitsu.com>
 <CANNYZj9cNeBkM11JteV_Cg51Ogti9Y0rr0kuMum3kOZuCKHw0g@mail.gmail.com>
 <17C7897B23C043A5.4146@lists.openembedded.org>
In-Reply-To: <17C7897B23C043A5.4146@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YWExM2NhZDMtNTM5Mi00ZTg3LTg1NDEtOGIzYjYyYjIy?=
 =?utf-8?B?OGE4O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTA0LTE5VDAxOjAwOjMyWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OS3PR01MB7381:EE_
x-ms-office365-filtering-correlation-id: 8fb9e501-189b-417c-fb7a-08dc6403762e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009|1580799018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VkloUVVBcmNnZ0xQbnk4a0FvejIzbzdhWlltajNTTXNaa3dxZk1WVTVEQ1U4?=
 =?utf-8?B?U2swTy9UYjJPRWhnVDdLOXpCRmpuNjUrazNNVjh6TWtmbVNzQTYzTXVIQXhJ?=
 =?utf-8?B?a1EyUkNBbmQySHZjamFsdVE1WDZGTUJlNDVLcWZyK2s3SUhXU0VJaUZiZ1E1?=
 =?utf-8?B?YXRkWHlRYjkzN3Z1VDRUb2lHQ0Z0OUsvcUtNdTJTZmFSZzg3UHRvMHZ5SUJN?=
 =?utf-8?B?Mk54c0hodzNMem5JS3RCcGNHbkFXZFp3aDk1TjJuUncrWUFxNDdDb1NLb01E?=
 =?utf-8?B?UlJtODJoWlp2cVIrZE1hamVUTTJKMXlXRG51M1IrYXozT0E5TVdyZ0J1Zy9G?=
 =?utf-8?B?b1EyWHRkdUZ2c0E1eEFwYTdVN2V4MzdQQXJsRXZpQ2ZHYTREYllXQkEySG5T?=
 =?utf-8?B?ckNjU0M0ajByVjYvVURRNmhzUmRFR09ubCt2T1dWNW5ITk9qMlRUTWdGR3Zz?=
 =?utf-8?B?YjluV0F2dEVRcy9IdjNHYzFhTlZTdnJtdHhxbzgwZVlPU3UzTUZDNTR3K3hn?=
 =?utf-8?B?QzNUMXZqVi9QRHMzeG9vc1ZKRFdNZVJBaHErV21TblVBK0xIUUd3MkZVenQr?=
 =?utf-8?B?RE8yUGNXTkhUbUt5b25GdmN1TWc0K3ZyOE9naUlUV2JuUk5YcmY1eEFsYnZM?=
 =?utf-8?B?cHhWWW9YajFuRGxiMDZqdTZXcTR0Z0pxdDVIQk5sTWxQZ2lzK3k2MTZCNk5W?=
 =?utf-8?B?T2UxZEtOVXdJZXNGZkhiYWRXZ0VNQlFLdzg2dE5zenVrNndqSkk4ZTVtVXZD?=
 =?utf-8?B?Z0pMdlA5bE1taG1CRVFXbGVCcktjeHlRTTlBWHdBdXNCa21qRnRBNUN1VzBJ?=
 =?utf-8?B?R3NhSThXY2psbXIxMVBHSmt5V2RCUUFOOW5CTW1qbmI3MUJOd3pETVJEWkFO?=
 =?utf-8?B?UlVkTFdYV3BFM0NNZ25RNWlMSGthSXZsU2UzTHN3VTV0WWlnVDFPZFBzbml2?=
 =?utf-8?B?dURCZzRUa3NYYkJLamdJdDN0Z05uZWcwV04yOVRGVXJmOENxd0FSVVBZRHh1?=
 =?utf-8?B?VzkzVHVwUm1JbzI0dEYrNVA0bktnNlQzZzlEUnJDUzhXMUV5ZkI2VUk3RDNR?=
 =?utf-8?B?cEdvOUU3ZVVIT1hGN3laeUFaZkJraUhnQVpvRTdYZDY2eW45YmF2MVFWaXZ1?=
 =?utf-8?B?dlF2TGowRmlGWFdSS3pzbTFGTDNwS2hjSDZhbFJySy81Z3drUWQvcjBhdWhW?=
 =?utf-8?B?MFlDRUVtR2Z6Y0d4aGpPTGswdld6UG9RSHdDbHdxNEVyTzdCQzBkbXFtWllD?=
 =?utf-8?B?TmdvN0xKU2hNQW1iMWQ0Rjl1WnNGZUh5RzBzVC9qVVdMc21RTVR1dWtZbmpL?=
 =?utf-8?B?RC9sdHNRUlI4QUYxK0I3b1lld0hyTlc4U0pZS201UUJ6STd2Q3QyMWxCcHZj?=
 =?utf-8?B?aWptM3JndGtEN2JiV3p4MkNLQUJwY0g5SW42b25Hay94RG41SjdjNERrWnpr?=
 =?utf-8?B?dXFkSjJhRVV6WWliUUFOY1hVUmVya1BraTVBT25yZjlQRHRDUVBZOUdmSndK?=
 =?utf-8?B?bFd3Ry8rdjgvYUY3MllWb3FHTXRYMWtBNThTcllNanFJdi9VK08wUVN1c1hn?=
 =?utf-8?B?aVNBUDVrdTZFVTV4WUhScFAycy9sSUZKbXMyV29oOHU3U2d3QUpBL1JnS21R?=
 =?utf-8?B?ejNITFhBc0hyS0Z1YU5ubVd2Nms0VWIzNktrbFphTjRJeGczem03WGJUWXcz?=
 =?utf-8?B?emVHSnFHT2FGR2djWTRXb2pPS3NVYXhBSFdUVnViNDFKMUdBRDZ5SU5DUUxG?=
 =?utf-8?B?MGZSUUNmOTh5MFBPYmRIcHdhclRaTGxDbjhvb3U4M1owV1J1SmxFT0UyUTJH?=
 =?utf-8?Q?DyQvy8NYn5Ln6ZHt/7K+/Ltaem8ATLFWrUJfw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?azJ1VkhJSWxvbFoveTVqUUM0YkxsNWpId29JS3lya3JxaFdQYnBSS0h0TjlM?=
 =?utf-8?B?VjJOMjdzTnZrajJUaHROOFRtaEtRYkpwN3JMWDdNKzB0T2ROc3VEaENSUE1M?=
 =?utf-8?B?SUdOSENCbVE1d1ZKVC9HZGVpWVpwVDRWT1duV01VcGRSVGlpYkxZUVRuUk8w?=
 =?utf-8?B?V0lxa0hBNEdkbTZPdkMwK01LS2U4dzJlOWtITXY1SWNXRG91SlZEN00wQmts?=
 =?utf-8?B?UWZYMHFjTFdXK2ZHait1SVAyQjljMS9FSEFZVUNDTXNMVmNwQU1WT1lYMDFQ?=
 =?utf-8?B?Ui9JUFdZT2lQUzY2MEFHTXc0ellOSFFFeTlFWnlFV3hTT1RQZGtaVVhuYnhi?=
 =?utf-8?B?OUtFODFhYkZ3Z3l6MW1xQUxORnlydFN1ckU3Y2d0bThjdFhlbHpsUTIvSlFB?=
 =?utf-8?B?aDRDN0xCYVlxUWFwcEVNemNYNi8rWTdWRVpHVm00Ri84VHJWc0IvMmFpMVd6?=
 =?utf-8?B?ZDkxSVdaeTNXVFcrZDlzUG1peVFSYWY2bEhMaXFpVm5rRzd4SmNLU285dXA2?=
 =?utf-8?B?YzhxNHgvTk9BNUVEQkFZTjBVdkZvSmVQQmxQb2VaU0I4U1U1L1hEUk9pbXNL?=
 =?utf-8?B?dTJOczdRRi9qR0Y2MU1Bd0hKSEVPdllRSUF1YlpnVkdOMXBFZlVrbGRRKzQv?=
 =?utf-8?B?OUt4aGJLWUdpeE9KWjE3RXU0V2c3UVhYM2RuU2wvNlcrOEdITWpKTFZON0w2?=
 =?utf-8?B?UlpXd2phMEd5N1FyZVVvNDJOZWZYWlFGV1I2Q2dLNTF5QnR1S2RaNmxQR0dm?=
 =?utf-8?B?TjU4MGhoTFpBZ1RWaEFjRUZZZUlYR0wvcHJNK2dRMUpxLzltNkVVWXAwcXhy?=
 =?utf-8?B?eHZ5SHBtN0M3N2hBbllxa3ErM1NiZ0xzQnpMeGIwUTFHZzdwdzFLTW0xejVz?=
 =?utf-8?B?OHVNNDNaMWFISkdJRUVSdVo3emRnVmg4Smh6WFpabHpMaG9XQVBia05UWmVn?=
 =?utf-8?B?WVVMT3dhRGR4cmphUXYvZkFySDhxdi9GcEUyMEJYSW9OY0dnemRTZmRYR0NZ?=
 =?utf-8?B?ZVN4ZDVESm1FN0J3eXRsOGd5K3M2dFV0bm5DUkZWMHU2RjFRWHk3RHdNVm50?=
 =?utf-8?B?bjRFa1pSNStyT2pIaERQRTUySDB5V1RPM1htdWlqM0RWZXZJbUVYcnZHbUJ1?=
 =?utf-8?B?b0ovNHB0VENJOHVlOVI1S2c3MDhrano3YWxYakY1Z3VaTGpsdGp3bjZRQjZw?=
 =?utf-8?B?bmVKNEExcDQwMmd1RDhpdnJ3ZmRNbmRFMkM5RlJxRXVTWEVQajFCbmNlWEc5?=
 =?utf-8?B?NkZLNTFsRW5RcU8xb2duaWVBMVBQMUZjUHFLTnpzdzgwRTVyTjRjZStKM2J3?=
 =?utf-8?B?ZENDcjBPQXgyQ0pZT05IU3hsanV6ekRUVHJaWm5vNHRGYW9vTGYyM1JRWFBD?=
 =?utf-8?B?SmUyZ3hjZjdvNEV2aUg4U1VpZlVYR2g2MkV5WDV3ZllEcEw0Z29JUXFlRml6?=
 =?utf-8?B?bVNlakduRzlDNEtENG9BRUJ5aXJyRWlJRGMxcytjbTNPSjhCVkhWREx2V1I5?=
 =?utf-8?B?cmZ3R0oyQ002QnlWT00xTlFDUHloMkYxNjNpMG1aYVM1YUZPZit3ejBaZU9p?=
 =?utf-8?B?UFV0UHFUbnE5Rzc0WEZ6R01qZURuSkJZK1FKcGxNY3dWWkVkNytXM3NaZVJw?=
 =?utf-8?B?bnkxZ1hZMFJyaDhQb1UzNGlCUlBXbEk3TEwwam9Ha2ViR0Ewa21uZVBkeTc2?=
 =?utf-8?B?ZnlHVS9NNHVTWUorbHRsSlErNUZQbWcrSzFWMThMRC9zdWRHc2IwOWhQL0Ro?=
 =?utf-8?B?bmFhZFV3ZCt5TXFhMVdaVUJRb213VDdaU1VJdGl0QmJ5VTFiUXgyb2ZDZXhZ?=
 =?utf-8?B?NnQzNlZoMkdZa1Rvb09NZDB2cnRoYjFYYWNndTRWMTkyeVcrdXV0Q091UkNi?=
 =?utf-8?B?SWs3L2o1bXQ3dXZYZDVBN3d5TFRCZnNhOXU1Smd6QkNibGFxdUx3S2lFSlFq?=
 =?utf-8?B?NjNiZXd2NW5yaXNlekhLYlVaTHc1WU13R0s1TldRTWZpcnV2UjA4bnRvTTFH?=
 =?utf-8?B?WmIxUTlReGFMa0N1cElrYUNKYlFhQ1VMcGZ3RlJZS0ZPU2p1YVhmTWk3bWc2?=
 =?utf-8?B?RjFuWkdKU0ZxekJZeU1EaWxFWGFqWTRQb29zUnlnQTBLbmkyTHE2VmFKR01B?=
 =?utf-8?Q?XucDrAcveoUAaGislvOg5HnAT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+5zoA1AABE5OiQFmSlYvHzDIuvYPq+1nqOyFnqRP7ZUjN+BUGsoJTcItVDWtnJ/1q85W1LzJdiIa8wS2iCgIBM9uNC4S4S/hpD/a2UBy/R7IIn0EMwogwhcKy0pWgOtJHzDnFaCkwwu6bc2KzxUkRCMtkj3T4nUI/tgZ/2LDx6Ljd6KhDDiAl/2cIZiaBaS6PB7H8kGb5qN2siK3+gARI0nTqV0OSDIIdesO4hsMFzAODdCwtM/vqIYWtTl8uSKLIuNWnDDadK+y/RNNy0bLYy6NSujZqseAHD1s9SdNLlFu8PwjTpHZOi5Pbtib3fepvih9gj6GZAueSxx6x7hRuXjXKRisjhpl7oVkYBgRTlSxlvKTWuVudV9pGpZbJ0qKln+ef6himLNitANS/9i7U8tQlUKxPUD2NlFHTl4XbRzn1mKO9ahg58X8J8nM+mvlFRH2htMX+52CJ+TimtBB5A4Yavb/1Mn5TnQVVNVfiqEV3xNy3kevJsAD0PMfEpp2o5PamwGwkVqPK387fdahvWdAtoQOg201TA56pMx7AsHrX4FCpuhQZKbT4r2x69b5lzhTDJ2Zh0IdoXmmiwwwjnmfpUdclvEBe4niKVsqj7lu9uJkrALi3E74oZ1aUtwg
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb9e501-189b-417c-fb7a-08dc6403762e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 02:08:40.9824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wrap7HT8iptdGWMEbH5DndQYS9x338c9NQzW9u06sa5chs0pM7QWkjQbLcQyCEjr3Dp9C8/kTjsOXGzzHrcZ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7381
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 02:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198637

UGluZw0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgbGVpbWFvaHVpIHZpYQ0KPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IEZyaWRheSwgQXByaWwgMTksIDIwMjQgOToxNiBB
TQ0KPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IENj
OiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJl
OiBbT0UtY29yZV1bUEFUQ0ggdjJdIGxpYmJzZDogRml4IGNvbmZsaWN0IGVycm9yIHdoZW4gZW5h
YmxlIG11bHRpbGliLg0KPiANCj4gSGksIEFsZXgNCj4gDQo+ID4gQ2FuIHlvdSBleHBsYWluIGEg
Yml0IG1vcmU/IFdoeSBhbmQgaG93IGlzIGl0IG5vdCBjb3JyZWN0PyBXaHkgaXNuJ3QgYQ0KPiA+
IHNpbWlsYXIgZml4IG5lZWRlZCBpbiBvdGhlciB1c2VzIG9mIG9lX211bHRpbGliX2hlYWRlcj8N
Cj4gDQo+IFJlZmVyZW5jZSB0byBodHRwczovL21hbi5hcmNobGludXgub3JnL21hbi9saWJic2Qu
NywgYnkgZGVmYXVsdCwgbGliYnNkIGlzIGJ1aWx0DQo+IGluIGFuIG92ZXJsYXkgbW9kZSwgdGhl
IGluY2x1ZGVzIGluIHRoaXMgY2FzZSBzaG91bGQgYmUgdGhlIHVzdWFsIHN5c3RlbSBvbmVzLA0K
PiBzdWNoIGFzIDx1bmlzdGQuaD4gd2l0aG91dCBuYW1lc3BhY2VkIHdpdGggYnNkLy4NCj4gSXQg
c2VlbXMgdGhhdCBsaWJic2QgaXMgc3BlY2lhbC4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBMZWkN
Cj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+ID4gU2VudDogVGh1cnNkYXks
IEFwcmlsIDE4LCAyMDI0IDE6MzMgUE0NCj4gPiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBm
dWppdHN1LmNvbT4NCj4gPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggdjJdIGxpYmJzZDogRml4IGNv
bmZsaWN0IGVycm9yIHdoZW4gZW5hYmxlIG11bHRpbGliLg0KPiA+DQo+ID4gT24gVGh1LCAxOCBB
cHIgMjAyNCBhdCAwMzoyMywgbGVpbWFvaHVpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
ID4gPGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gPiA+IC0gVGhlIHBhdGggb2YgY2RlZnMtNjQuaCBhbmQgY2RlZnMtMzIuaCBpbiBjZGVmcy5o
IGlzIG5vdCBjb3JyZWN0DQo+ID4gPiBmb3IgbGliYnNkIGFmdGVyDQo+ID4gZW5hYmxlIG9lX211
bHRpbGliX2hlYWRlciBvbiBjZGVmcy5oLiBJdCBpcyBuZWNlc3NhcnkgdG8gZml4IHRoZSBwYXRo
Lg0KPiA+ID4gK2RvX2luc3RhbGw6YXBwZW5kICgpIHsNCj4gPiA+ICsgICAgICAgb2VfbXVsdGls
aWJfaGVhZGVyIGJzZC9zeXMvY2RlZnMuaA0KPiA+ID4gKyAgICAgICBzZWQgLWkgJ3M6I2luY2x1
ZGUgPGJzZC9zeXMvY2RlZnM6I2luY2x1ZGUgPHN5cy9jZGVmczpnJw0KPiA+ID4gKyR7RH0ke2lu
Y2x1ZGVkaXJ9L2JzZC9zeXMvY2RlZnMuaA0KPiA+DQo+ID4gQ2FuIHlvdSBleHBsYWluIGEgYml0
IG1vcmU/IFdoeSBhbmQgaG93IGlzIGl0IG5vdCBjb3JyZWN0PyBXaHkgaXNuJ3QgYQ0KPiA+IHNp
bWlsYXIgZml4IG5lZWRlZCBpbiBvdGhlciB1c2VzIG9mIG9lX211bHRpbGliX2hlYWRlcj8NCj4g
Pg0KPiA+IEFsZXgNCg==

