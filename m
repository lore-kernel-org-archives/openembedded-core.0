Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B9410A1E7D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:23:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45838.1774524213840308613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PyMQZJym;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7545558680=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5fXUj3033013
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 04:23:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=SSnxAYAhsRcloAXRDk8FtyYGlWwysgJGMo2ohYc4aXE=; b=
	PyMQZJymF6aUlUFpm/j65IoVs1EoFWm/luzIoCJcmdVRb12IPBf2eCA8p0e9++pC
	nDqJJrWJQZSVJeKDPW1qL9Ylhlh5p5rm7SotsaD44/f4O6VyTtCdRVoj67VjGVVc
	tMcy05TXNV9Q8b79erCJDW5QKveFepf9heAj2Jjev+DBBBDhGC7CaboGF6qA25h6
	d5Sn1cn6kA7bLYRcM033TScsAjqO9UI620QuLPhc180ub513uiEwfzXK7qI3LEqh
	NZl/nUF8NvIztzzz4TZ7bDBPV6owQdljwh2bleO+91SydNIMXDoMoZ16+S6SkMVJ
	sNTioXZTiV/WuunmZcDbFg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkye8cv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 04:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWnF7ZTgiWDPZTEXSgjrx/2eHpTIz7g7/rSWgLMU82dMAaxtoK19ugcWyiXtVnEnxkkuXhsETxqyZjmNCtyqhsYAw8tBsxjRkwoUXaVYcj3VouzwlBXAQ/ZSGuxuHhGisajA4SGaMxufzTsgP2Lgjfg8u/fOBc+yrv4BNFL4UceBNioBt7MCedk/4dMYRcINPFAYawuCjgxKDyW1QeLgnp4BGKwF5ZKYTSpKykj9jOtaARiNKtErzdySet1SzTZ1cEa22/dVr5IJskTC6/a45dtZZnOPA2ZTj/5pAsMHHJFdZ6rsQCf0m472IfMOPIfuv8aCv+cH8CRGn1bC3MdWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSnxAYAhsRcloAXRDk8FtyYGlWwysgJGMo2ohYc4aXE=;
 b=nKPbkHWzJ4dT3dNQVzbA1aLIdSGH6l+Zn2KHc0uy8uyAVd4b9HSDHIRaPifMmYrZN80gCVFHGIXA9/ggMY90udkhE3qm+zqAaXyZMeARgLkCln23rFGVfkV3sR0hveKIrUXp8BpJHeki+ZqJ4XEhc1XQ4kBv5US/jLpj/F7O1svENwgJTzm0sUghV4v2xIqAZmnmrEY7Ljk3PksijODMBmmtHOiVHUKKePHNvIJ0fhC4+Dh8ws2pbasbaQg2sM2h8qj9rH2LIzM9tDD8Jc0WjjjtE89cVtSlMR1jDokMS4DASAFwe8Mji3rVc5WuXW7P/motpIfH9irnTlxxMf2sOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ5PPF6E07EBAE7.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::832) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 11:23:30 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 11:23:29 +0000
Message-ID: <0c576271-bca7-4b9d-86a1-ac82449ae011@windriver.com>
Date: Thu, 26 Mar 2026 19:23:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3-numpy: add cpu-optimization option
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260325022629.2245688-1-hongxu.jia@windriver.com>
 <CANNYZj9i9EFbo79nNPAtzXo03gLeJNC4qW-9Pp9u1UstvQp46g@mail.gmail.com>
 <065f08e8-e402-4379-8575-60621d4e6c63@windriver.com>
 <CANNYZj__ONSLGoJVDEXqes953gaFYH44SbXTNBHXHWDu3CKWQQ@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANNYZj__ONSLGoJVDEXqes953gaFYH44SbXTNBHXHWDu3CKWQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0140.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::16) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ5PPF6E07EBAE7:EE_
X-MS-Office365-Filtering-Correlation-Id: f944e14b-4684-4d78-35a0-08de8b2a1b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YnGbnndx6YQwNztxMuQNutYJzlxin+hHHeqa0ADFex7+GZM1Gt6OcVltI0bbo7++adud8OiPiH9l7MDfjAQyiFnnyLSH0YjqdQvEDsyCIVVyjMKWRxarN8oZ5FjXAhCElybxCr5gxt43i9qCGgNIkQ7g4rVqzqOsUbWD/xbEOlaSbuU7h6BMJgTyR1wNYW0JCQgBGy6Xx1g6gjyhKOGYzpvhUDkolT/xfqeHVqItBFa3iAs1/4vbi1zbZP7AoWoFEvOwE+mzH3aKw5jVKWHrvsD3F9tNGY5GGz+3xFXkUON6eVPcUr1HDgcqjOXKn/I/A2DWDAct64LmCqf3zjAuM4qZs31M6aCylEW8PWplGqTAlk0EvPVU9zFc8V4LuI93BZGEZsNws0cP4sEBprra+oW9csOymzd3jJT5IHQdDhwmHJosQEeAS4Pfh+rz01Sb/yfgvGj6+X4BcyaMQVI4eAYm3Xasw8xlf1X1dPvvmRToTEhLOGd/hR7fw1RKDB6OciKWanaYleauPvOfgxlEcaypRNrEoKGi/G3r9fV4bwsYhuAtKeCH5MeLLGZ7D6iXI9b08bRPQhFtx94iuIKcln6oKEnFrRnjTNRZMuRPNTwZL4dxsWslmyPBb+wueg7rcPXpRaFTeN9ksKBgGBjXkVaQOVIym8t/VGYM3roi9173Gj2aOah+pGf+J3RebFMS67psGdOI3rDe4G3GmD7AllnEek47epYuAlFKmF7vEnA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M25aOUxSa2hpYUhabkVMUGlpTjFBb1BmK0tVNW9ERTZHUkwxY0pkMVYwOHJP?=
 =?utf-8?B?SjV6RTFSZ3dVcHdzQkc1Uy9DZ0FTOFJJaFJOWElzdW40ZDcrdVF4L1ZUdnR2?=
 =?utf-8?B?eWRBeTJXTHY3TXJRTlp5MzBLK2ZyMXlUaSthT25PSEZqQzcrejJrZVd1d0ZH?=
 =?utf-8?B?MVdFUkxvOXE3SjJITE8xZzIzY3NyRzRjd09aRWVoRVpkM09aWlM0U1BqMmQ1?=
 =?utf-8?B?UzJ6eWFpZGxVRENmV2JaWkhBN2c4M1RjYlppbFRnUFpsbUZ2Y240WURMK2tz?=
 =?utf-8?B?blRNNktES0I4R211TWFmOWlUNGNweGx3a2xKS3luWnZMQlExenFKdEtDQVQy?=
 =?utf-8?B?ZEtXNm56VW8zV203S0oxbUlvejB5eW9ieERvS2tqVGg4d2pwK01QSlBjTDZB?=
 =?utf-8?B?WExkREQ5MVQrR2dWSzkrek16SFdBU2pyeGt2NFB3NDNwOVZjWE50aUN5RWVO?=
 =?utf-8?B?TUZOajVkYWYvZTFjV3A4dHgzUjAxTGorYWJOZTRSZjVsNVdrWFF6ZmdrUW5z?=
 =?utf-8?B?YThsM01RbzM0VDFZQmUyRjB4TzN6R1RLeDdYb3dGZkVNQ1hoQnhvOWxYRVNv?=
 =?utf-8?B?VUZLWXhkSXBxbnd3cFV4akErc3A1SHU5SGc5bWlqZ3lCSHFkMHFkZmRzUkla?=
 =?utf-8?B?Tk9KajlwVngvc3hwT0dxNUhJV3JGdGJDZnlJZzVYcjJXT0ovbG9OZWZjaHlK?=
 =?utf-8?B?KzZuVG1DcFhHNzJlcUx2WkRIaTB0aEl6bnEyVWN5UnU0LzUzZkhHRGdMK0lO?=
 =?utf-8?B?Nkc0d1ZueDVQSGVBblJVaUduTzVQSnlvbkZ3NFRsMmRsQ1NXSWFkQnlEMmxn?=
 =?utf-8?B?QUxXSFlkb0xwS3Jrckw4cXBiR0ZlOFJCcTRsemV5U1Z4SHJmSGwvM0paR1k4?=
 =?utf-8?B?ODUvYVBvZEtGVFBmcERPVTMzM1N6MFlZbmJNY2ZxanhxTElpVDlmV1lNSTJq?=
 =?utf-8?B?SHZTUVZSZzV4ZGVEQ1ZwZjA1UVhRKzdQZ3JXZW1Wc0dCNlFWMGJ6NDdZRUFD?=
 =?utf-8?B?VjN4VzNiTXRVNUlOd296WUxoQjJTV2NTYmpSRGMvUTZzZE5tMElOWDErUTR0?=
 =?utf-8?B?dkJ6K2RxdHdiREhNWDdKYzZPZE0xZlVXamloZFdVWHRQbmxDUUFKWC9kb2lX?=
 =?utf-8?B?RUFsNXg1d2QwSHJtaWZBdW51NUxvTmpZT1FNZjBzR1M2eThGMHdJaElpVXV5?=
 =?utf-8?B?c1Y5YWRJSXU3NEJYNExvcWttOVN0YS9MVG9PQmRNbmgwSFVGSmZjL0lIajRV?=
 =?utf-8?B?SjJJQlBiYURzSy9XU1Q1VGlURnJDMERkZkVWYlFockFwa3JyQk4ya2dYUFZ1?=
 =?utf-8?B?MEhQTFRHQXdlajdkTHhwa3F0a3NqUHJ0eE5hNllBeXRJelgwUzh3N0ZTSWho?=
 =?utf-8?B?S1VIYnYwb3RiY25RZXA3RmxpREZzcmpsNCszaFhSRkZxWDVZUHJaZ2FlY3Zp?=
 =?utf-8?B?SUhaYTJqaklSRlMrck8zN0hOTUk0TFhMYnNyMmxXS3BkdXpGM1FKZWdva0g3?=
 =?utf-8?B?V1ZGNEh5anY2YmhlT2NMU3VPUVNqQ0piYXZ4OE85QWtwQjFMN1NpbGJzTG9s?=
 =?utf-8?B?SEZMTmhDUU5adTBBU0NZTXRtWWJxemtOR2xyaE1IemgzN0dVS0J5ZGZHNzBQ?=
 =?utf-8?B?bE1GdGNxcE5PYmVvbS83dFZaZEZCaUlZY0lEc1BmcEFYaHVLTmNwdTgrWnpu?=
 =?utf-8?B?VXoydGhPbzBxL0pYWVphQ2ZGeHNSVkNncjVaT25MNzNPa1JRaGg3VHFuakF6?=
 =?utf-8?B?eXhmZmJRNE4vZHRBRTFFejV0aDVkVDBnc3piWXZXeFdDMUZlUEcyMXk5Vndt?=
 =?utf-8?B?S3N2MGY1ald0cW9mbS8rWUV4cGVYbC90bFBTM3JxTFFDUnJwNU1sZG5JbWI2?=
 =?utf-8?B?NDNkbVBuOEkzNFRGWUpncHNkYkpoOXE4Z0tBUDlRTmdZM1hPRGFhcXpSVWNz?=
 =?utf-8?B?ZHBsajR4Q1FMRlEzczcvNVRYTER0c2daUEl4cEIrMnNlUUhHclZ5Y1BWbzdU?=
 =?utf-8?B?MXc1QWllVENleHQ3eUF5YmZVYkt2SG5WTTZMV1RGV2FJZ1k4bVlqbzFLV1V2?=
 =?utf-8?B?QWdnM0F2Zy80Q0xESXFYKzdtN3dPN09jd2lzdnJEQ25SUTVoZC9seGpJWkdu?=
 =?utf-8?B?SGRoNTdkY1ZjREhlMm82eDlaVDFPVUpjVWNXbHBlaVZFSjZBQVpiZTU2ZXRJ?=
 =?utf-8?B?OWNwSkpHYnlWUG5kdyt0bmF6YThnY1p6QkZKWmlrWkhGWkxwQnRmZ090QjJw?=
 =?utf-8?B?UjNRcWtnV2xaR3ZzbG1tZWtFSkQ3OUVoRFhIVGxySG9QckRvNHM4R2hCM2x3?=
 =?utf-8?B?c0NCSTNjNzZWVkh4enJvZlhnSFlJa2dtZk9XbXhKMEhwL0tGM1l2dz09?=
X-Exchange-RoutingPolicyChecked: 
	J7X7IytQhCy81KHX/T/9l9pTkO0BGT0CjkgusOj23v8Y9ZOpAx9sM/jTAqfTB0MwwGmX5qa5IVW3+Ls9ZFaP+T9yr7B0ci3+2W90daKWNhlMYMl2+8mVjigRxMV9HdlC0umn5Z/vlZLZDDMbv89AMWht7g7C/cK1Kl9QsQBqfBbOtPCXNwZQHZH5e0HcX5oYjd4jAAmkApaisy7MUebQHp6+QyRBeTY6zp4QtaO3UzaVjqig3hgCIjM66EZhSGUG5h9Hk9xGkdEDnoWbs4mZip4SQdi+WMMOjpcT4W0lVqdSxgcqaZi0ZVrXzpZkRyQv4kk+a6PG5r/o4U1Sy1mPYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f944e14b-4684-4d78-35a0-08de8b2a1b12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:23:29.8258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PczJTb3snImTUqdDv5nDQeB/I90ONfFqgULEIrLOcBTtGGo0EnQ3g8K5/4sPBuwe9zRIeOB5xJhYM+FTccF5FNGICEM8guv3i6PGLfVaeSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E07EBAE7
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3OSBTYWx0ZWRfX+RurSVJbrCTu
 1CeaGLiFJvPsLZvNcxrouJA8mTCRx4n14WpbqkHjt5W7pXY99Er9uz9mkZSuA1SIx+ESg9RZMnw
 dJxF0lOwuV9BDOLCZ/WIo28Gwn3yXvOsWwt4JHV64wqKBQ1y3/aUsPeLZK3rhM7fE0Y95pXvV2c
 MYFnOiZIsg24iFzAhCML61SICtiHLw/B+H6o3WkcyuKNKE3QXGgpivF3MO9DnMYgH9fNzb+FbWj
 iHbw6cWYJurVuUlTXkHi+8UqMGb+Jrp5woEO/A+KI6uKTc49tYocbv7xgapmqdYG5u8da9awIZG
 ZmR/Rp4nrEwSaTUMCAdy1dhh+qSMrPTIZdyxnVMGczrX4BiY1R6BHPPTeM/USt5ysG8ehW+/F/R
 Do0VitB9Ow9sbu3qDMWDQGnYp/GkMpKqToP9KC4bTNO/vEi5gy0BVkCt360uC4GbvrURAA23mIx
 mcwMlYtHuZyVcdCmwGg==
X-Proofpoint-ORIG-GUID: wTyTinN5QHnkPVKMsWb_xlg9govDfsZD
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c51735 cx=c_pps
 a=A3soYu1h9hn2xD7k0nk5XA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=hKpBA07XAAAA:8 a=t7CeM3EgAAAA:8 a=4fXvwftEddZOZrIdXjAA:9 a=QEXdDO2ut3YA:10
 a=e5PuFNF6PdRcDgRFK7o8:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fSlI_M-BjP9kHdnopbQo6CJ60MSnN3Ff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233978

On 3/26/26 18:29, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 26 Mar 2026 at 11:19, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>> Reading https://numpy.org/doc/stable/reference/simd/build-options.html,
>>> I do not think setting disable_optimization to true by defailt is
>>> correct. Currently, numpy will auto-detect the capabilities of target
>>> machine, and configure itself accordingly. With this change, that auto
>>> detection is compeltely turned off.
>>>
>>> Please explain the rationale for this change.
>> In our case, we use `-cpu kvm64' other than `-cpu Skylake-Client
>> -machine q35,i8042=off'
>>
>> QB_CPU_KVM:intel-x86-64 = "-cpu kvm64"
> If that cpu doesn't support v3 (or even v2) features, then you should
> not use the default x86-64 tune (that qemux86-64 is using and passing
> to compilers) to enable them.

Sure, already did, thanks for pointing it out, please drop this patch

//Hongxu

> Alex



