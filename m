Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED404D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 07:18:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42912.1765783078615735845
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Dec 2025 23:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rt2kB7xL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4444503ad2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF78mwh2118555
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 07:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NMzKR0JaS9chyJRhSelR9DbZNQkn6rbYt7sooSkgR4g=; b=
	Rt2kB7xLcCLTqkge+qxu0YP+ErcFTw5JRhejuFPB/VV/foy2TfaeMWd8R+rQWMBa
	HQxJi1mQpJFsZHfy0DCY0SiZpFRzhhr42AxdDX/P4wsiFL3D/hKa3hCrhuY/igMd
	LP89GfZDoApwqOQWer5L1hzOHcGANWSLRXdadhQSO1ubnvAPkFm404ij1VQOI/Di
	9ATbVE1o3z7raAQ7mqMwXFo9mDBOPdGjHGy+HpsFczHVC0NFQzmegTi1/15eeGRf
	JvkrI5ipfIrG5zykTMaO8RU8Z8WGAPyO5kLs7EC3K4qrY45/Ndt25nw64TCQZDuW
	BIuwZShLvcaD4TXB0b0Rfg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y489hb0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 07:17:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWAxdNJEg08g7uiqeNZ06YPQp8jikgVPyr5KGahKgqTVeTe4xKdEGKQ1qC5a9UydzCXPlGMrV7tM8tigd3+fRkhmCgpRzfxgDdR3upFv8obogrt2tfsnMDygNJl15yLMhyB2qnB8BaegOVXHRkcDf0rTb+Q/Dz8urwxm63H6dGrg8j8T2RE2EWdgcKMphwU5JSQz0yBoArNmMUgox+6Be0M/7U8KxvK1/6cr9srjZkXibQdzopyrxuPOVzEpjruAQ9NboKa09II/4dYzgK/ELHQZWlJ321FHTxdlrtRVCNX4DD+DF210R5dezHfOQu6tiQGgUYEJoSxm8JyU1/xQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMzKR0JaS9chyJRhSelR9DbZNQkn6rbYt7sooSkgR4g=;
 b=BnoTQBwV5AdZh8qYLzRPa6js3is0EkKwjvvRJJYTABWfdfngxU9iasDGDM6355TMLQnQANyX41V1x10xY2dI+7ijCHFRdiU/r39HSLTIU/QlvRWm5q1pFR8px25nuL5RjkfVNafFR75vHs/wTkf99rNWWxL+NSE7VFQ1DcBwR+kTVdZRNquHah2dL4qVIocm8Xqr8NP3d4TqMeRut23qxFF4XN6rCbQg6UUWLLWkA+hoos7EzKFrncpbH3XUzJv1D6xz9XO6/ZLvYfaabDy/3KkDjSv4DPF7HUYArkUri4vWsfdYnq8gc79vpfwiKqMBoMA5zkXmeRbs0+OiEW8AlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MW3PR11MB4619.namprd11.prod.outlook.com (2603:10b6:303:5b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 07:17:53 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 07:17:53 +0000
Message-ID: <14fe39af-02f3-426a-a16f-acfc3de72070@windriver.com>
Date: Mon, 15 Dec 2025 15:17:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][whinlatter][PATCH 04/67] strace: 6.16 -> 6.17
To: ankur.tyagi85@gmail.com, openembedded-core@lists.openembedded.org,
        Randy MacLeod <randy.macleod@windriver.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
 <20251213095931.2571498-4-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20251213095931.2571498-4-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MW3PR11MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c1eacc-21f6-4914-c09b-08de3baa0fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVRqQXBGUENDWjRsQk1qVmxNQzNzcVNNaS93eHJKeGdqelNLWkY2cWcrZm5F?=
 =?utf-8?B?WlBNQS9ud2lmUWpaYVcrRnFxeVRndHVsc2c1VTUvNnlRb3EwVVI1bjB0bU9v?=
 =?utf-8?B?cWs2UUUrN0NUMmQwTlQzcXRDaGJZRE1TNW82S1ZRZFlKZlZyOUNUWkpCVFEv?=
 =?utf-8?B?VTNEZW9pbDE3YkVRUE5sT2E4Y0lqS2hzSHZJMzd4TUFIQ01qNHYxVFNJTXpE?=
 =?utf-8?B?aHlMbzJZamZEb051QmFCM3VqMzY5YUhKdHRwVEFtSmF0YyszOHFLdWh3UUwz?=
 =?utf-8?B?M2EyVER2dDRIMjdGUTN1Y2cvZlN5OGw4enYyeFI5dnVHaHNsRktEQ2NKY1F3?=
 =?utf-8?B?U0R6SFdwMlh1NWRPbCtDWnhFZ2dyRUp1ZEtiYkVLSFFnd1lReDFpdHBjM1VD?=
 =?utf-8?B?ZmNvZFRJN0Q3bXU3S1FUV2hTajM1bmEvcXc1RmtKejBZVFNNOWp6bHRHeXFs?=
 =?utf-8?B?dWVsNG8vbWNwNEh5NVJXSElIRXg4VzRrMWZ4dy9yTlU3ZlJyTjdaaC95ZDhu?=
 =?utf-8?B?S21yZGJOSTBodzlGdURWL3gwaFA5MkxNUDNMSy81Qk5WUlVmZ01mZU1NT2NI?=
 =?utf-8?B?YVJxUlNJK2xjSWVxTlh2WXlqZFFhZ2lDbDJWRmRIUUVoNnd5eHVPc1hqc0Ur?=
 =?utf-8?B?Ti9wb0pvMlBXckErQkRqRldTdGtQRFNwREJWa0Q3dlFMSXE2WTNLT1NPUmMw?=
 =?utf-8?B?MWFXbVpGcUI0NkdXYzk1aTFXSU8zWHp6RDZ5TTRJcGo2N01xYWNlc3RPMnV5?=
 =?utf-8?B?UFdueHNoM2dXMlhIK3VlbFpIbzZ6eG1RRThSdFl6Z1llWmhkWXZGaWZRcUZW?=
 =?utf-8?B?KzFnc1F5VyszdDEvb1V2eGtRWWl5SW5NbXZ0WlRXRU9Jd0JmUzZJS2ZDc1Y2?=
 =?utf-8?B?aHNjakxIM0tGL2xpWUdOS0FDZk43TDF2THNBR3Fhd3pFWkJLYlVJOHJhakxh?=
 =?utf-8?B?OTkwZk9hQmZHeS80aFl1UHpQcG5iVmsxVnVVQU5XQWRObVVEN2xXN09QOVh4?=
 =?utf-8?B?QkdwZTR4UnpPZ2tDOVVONHBDaTZoTE1tdnFWMC9TVWE1alNYZnQvdkFPN1Zy?=
 =?utf-8?B?Si9sR0F6UXRYRWljUWhoaGh0TE5ha1dzcGFOZ0lzejRyb1Axd1pNMzZEVG15?=
 =?utf-8?B?eWhOdDdEMUFjbFhPZkRQTUdxQUVLbWlZNTFOdTMxWWdYOXpoYU51L2duM0ti?=
 =?utf-8?B?eTRQSElJSXVlRllDK1V0VDhxcmNpQlFkbmFBUW1aVndWelpmbmFpcWE1bVJC?=
 =?utf-8?B?eHc3K0QyandYeDI4VFViQ0JsQlY2b3hQc251eVNrK25DN0VkRm96K09Ga0Vo?=
 =?utf-8?B?VXVsVXlxYzJXek1mOXoydkR0VmVabWJXckNEelhhblYyTmtGWTI2Um1VUFZw?=
 =?utf-8?B?MHpMbm1NYncxMEN2RUlKVWJGU0gzMVZKNEpLak5lWHFTYXNvWEVRSGp0ZG5i?=
 =?utf-8?B?L1lkdisvRE1vekRDQldKck1mcmMvMnBIQnkrYUd3VktCOUdINEVGOVUzRndO?=
 =?utf-8?B?cHdtTG8yOEJ4Z3d6d0FGakI0YVZZcGQzemZkZDYyK0RKQjdxNS9GWG9Cak9D?=
 =?utf-8?B?T0NXZUU5d29uV3lHWS8rZ3NDcldPQzA2U0VhTW0vTHF3aS91UzM4NjU2VGlS?=
 =?utf-8?B?dHZCSmt0QnhrU2wvVHhndUJudzFRZVpDOE1oeUcyOFEvc1c0aE1yRmJNOUxj?=
 =?utf-8?B?RjhLaFB3OTVodlVZK3lOUmpjRGU2d0Qrbk5oN1gwOGxrblRWcFpybmhRVU9G?=
 =?utf-8?B?L2p5WXU5MjkxUm4rVWVpVmEzTjJXS2RCenFwQVdNNFNmUEFnQmF2MTltNVVU?=
 =?utf-8?B?T1dmQzJWRjB1K2ltdFhmUTlZMHl5ekZmSGx5RG5KV0JIaTlTNU1NMTdMMGpo?=
 =?utf-8?B?VkNPcHJyaDdJRXY5eGkxcjZ4OVlrSTFnY0g5WHVVRnEvL0E0Y3UvdEh3ZFM3?=
 =?utf-8?Q?wbAG/jGKEPP4tAJBjQtrw9KeRbL+at6p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVBiczlZMXN6MUFNN2srbCtnQW1XUGRhTFE0WWZySXNlTDlUbWpmOE5sZWJW?=
 =?utf-8?B?UDV2NytzeGZOR1hkbDdiKzJMVW5HSGdJcEpEKzZVdU9Mc3dIR1l1QUlSSk1F?=
 =?utf-8?B?aG0zNHdXVzN1U2hTNTVwandKOEdDZUl4SGRJYUhGNmIxa3JRQXI4a05IQlR3?=
 =?utf-8?B?VHZLRWlhVWZnNVkrckJXQ0NtS1J1T25lYjZuRFYxeFBIekxGa3B1eW0xd1hi?=
 =?utf-8?B?TjhlNVdSQndZUEpIMkZxQjZLbTFLTW9pd3lOWnUxYW1OMEM3bXhjRjh3TUF6?=
 =?utf-8?B?aWUvdWFkS3NNdTFrZlMzOW4xbUUxNEJIUWtodW92ODYzRnhTVXFoSVJ0UmMw?=
 =?utf-8?B?RldhN3JtNWxQZ3Q1T09kKytBWEJtcEd1ellJR3hKZ0hGcVJHU3FsanVzaDRn?=
 =?utf-8?B?dmJacURNS2xNN0FFWXZ6RG96aUxMUDA4SFB1SWJRKzJld1o3NHc2QlJDUU1S?=
 =?utf-8?B?d2JRcUNsNVROZVdQemtjWmRTSVJaa3EzYTZKdTdQWVRWNW5sS0hScjdpMVRN?=
 =?utf-8?B?YVRxUVZJNThkNkNTMUZZZGI0SWxOdzJCemQ4YzNRYVFhYjhQdGxJR241eHZk?=
 =?utf-8?B?cDNpYkhLTDBMeE85VXJMdm5yMytVYU5qQUZzUlJBaTh6dzJWbWpvSTBFSUN3?=
 =?utf-8?B?YUllSWd0RUlqUXdaaURUa3k0Y0VrcXlZcEJPZmY0dWR0aUt0N0k5TUFWemhs?=
 =?utf-8?B?VE50MTJkYzViVUN5LzlINnYvcHJxWk5zbE1FVEZGWm5lZjFwZUJiMjhzUDZ6?=
 =?utf-8?B?SzhyOFpBU2ZhUTRrcmNncS81dHI3VlN0SFgrNHhBYllMb3JkQXgvTzF3VVkz?=
 =?utf-8?B?eDdBeHRSeGowOGMwaXpzeE5yMjBzQ250Z2s2bG4vcVYzeWcyWSttQmFJT0RX?=
 =?utf-8?B?UUVnNEtSTkt3ZzFjdFhMeUJDWjlPSGxJOHF0VUFZb01ScW1pWWZJTDl5WG9y?=
 =?utf-8?B?WXl2ejJUcWZGZUNoVzFmc2IvNDBZV0d1dWEwM3VSaStpZXVqV2p3bTUrVS80?=
 =?utf-8?B?VWFDMFEvSGN6eVZVSkpZQ0lwT3FVYWZ1ejhKdUZJbk9JNzNJbFEwNjNqMlJF?=
 =?utf-8?B?NU13UVg5NTZ4UnpFeHdnMkt1WDkvbXJRN0NBQkxCdTA3alVSakJVOWpOMGdo?=
 =?utf-8?B?T1I1SWhVdHQrWG1XZWlpOVFuRHF4TWlVZ2ZRTzRWTEpkVWtWYldDbXRsRGlh?=
 =?utf-8?B?U0ZyeG40YjRZUmlkRkdpNHh4YzROVjFuWFhBRlFsK3Jib2p6VzJwRUxYNm01?=
 =?utf-8?B?SWlteDRUeVh3VVE3RUZLUk5rd20wblpyZURBQ09xWE1OL1IzdjQxNWd2MW92?=
 =?utf-8?B?a0tLaGl2UkF2TWpRUStQUFJBQkdiVkZCRE5maVVMOVQwK3d1Q0xvQnhUSENI?=
 =?utf-8?B?QjBFUTJwZFNWNUJ5Wnd5N2pQWGoyREUvdjcrdit5bTBFZmk2ZitJZERXZVNC?=
 =?utf-8?B?dGxFY1pVck11c0lrNHczOTZvQWtnWUc0NnB6OHEySTZJc2puU010OCtPclV5?=
 =?utf-8?B?bnN2Z3QxVm93MktrWHVQZU82TVh4eFhUemdVZC83TUdxTXVXRGRiZmpIUFJs?=
 =?utf-8?B?VFR3VFBKbFFPUW9wRmFNaXRMTjJ0eTBiQWMzZ0V1NENmWXFuMjJvUWliU3pL?=
 =?utf-8?B?aEV1Vmh6WnZub1RVVnlOdXpvcHRqSEZkWE1Db1l4QmIrM08vZy9vd1ZXSWhD?=
 =?utf-8?B?REQzNldtZGsxOGduSUhGc3laR1htWWdJSEhZWi9FZktOeGFERUlUVTh4NmdY?=
 =?utf-8?B?THg2OWVSbGNoWEZWUytSUExhOGNtZjM0ZGsvOWpicUVjZkxnN1ZmS0JlU1la?=
 =?utf-8?B?S3Z4eUpFMDR2YkEyQU82WExNdktHT25ocDQ0NkxDcUMvZnY5SnBiWFdpdlVr?=
 =?utf-8?B?Q0NUN1R3ZmlEQTNscWZ4UlpHOEwvRDJEbGZiUGh3Z0F2QzRqZW1yZUFOK3Az?=
 =?utf-8?B?ZUpLK1J0bzJXMHhiYjYvaXEwa3lUZnJ4V0ExNlp6VEFvQ3puQm85WWcxS01k?=
 =?utf-8?B?dWh4WTFBb3EyYXV4Yk1CNSsxaXRHV2NSSEtmOFUxVFRTWEhudDI1Y01abTVk?=
 =?utf-8?B?dGxWMytMS3dKQnl6c1JZeDQ4RXFONVlOdDdpdGJXWUV3RERsS1loUFRxeW9l?=
 =?utf-8?B?c2Q1Z3hKSEppOGl2UW9LcU9UcS9tSmVaYWJDZDJmK1BtVWlHb1BxODhLazFl?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c1eacc-21f6-4914-c09b-08de3baa0fdf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 07:17:53.1473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDHHrB8swIlvEW+mDlDXYpZioDNIDOc+tMQhilA5ioOc9x+cD658Sgw0CR+qE4LmVDc39Ms/dLCfAZcMKojmEQJKJr0bxg06+eD0S92xh9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4619
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA2MSBTYWx0ZWRfXwy35ZPo2XqUt
 N4RTd+SLFfL3PrBfzFbhmLqvP+MFcEX6zIExc8Msd94rWarPQJAxxsOGLSbbQ0VzAeQN/h41dng
 zAVubvAn6m4rqWkanCSnLCeDJuRbQixQalO4/1c01eyXOPcKSDrBOEr0UQ42QEPIS+J8QMiWgjw
 WRP1xMJWkkCbkP1KX73LJUG7hodPQhMaaw6PUrH1YZep03dL5NIDivsrL1SGww1cw1vNCRW1Bxx
 grMj3DZEV0/wajDeva6tsNcG/TnyrpaDFCV7wzXPp+rvpoKIGZaVjmN4G5/j4vJ2eQHw5+WDPEL
 mkMfDHl+vC92jif7zXvinKgzdw0Ectf3hf5EJAR87Ah1MJ0QWQd/+cb/SdELwk3Pt1E4DkRMd6R
 Ps8yjLAcBhfIXbOa5+I93n/21bEbOg==
X-Proofpoint-GUID: zGknLIrCqI0Frzp9rCT9a_jAu1mYg--i
X-Proofpoint-ORIG-GUID: up2T5FAxGcXiqq67s95zgqhlWLjJ_Xv-
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=693fb625 cx=c_pps
 a=037dmpTZGv+Xy+TtntRLUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=fk1lIlRQAAAA:8 a=Sv4y0yS6AAAA:8 a=QyXUC8HyAAAA:8
 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=iV3OfIPe-4mpCkZ0ozQA:9
 a=5jj6Z5E1gPFHsPOh:21 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=U75ogvRika4pmaD_UPO0:22 a=I7ze7AG8jwQKfjVvUIqj:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_07,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 07:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227699


Please drop this one for whinlatter, there are ptest regressions issues.

// Robert

On 12/13/25 17:58, ankur.tyagi85@gmail.com wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> * Remove backported patch 0001-tests-fix-uio.test-with-musl-libc.patch
> * Refresh other patches.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit c568c2e56697bbf95818f46bb8fb832b73d3573f)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>   ...toconf-macro-to-detect-largefile-sup.patch |  2 +-
>   ...001-strace-fix-reproducibilty-issues.patch |  2 +-
>   ...01-tests-fix-uio.test-with-musl-libc.patch | 30 -------------------
>   ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
>   .../strace/strace/Makefile-ptest.patch        |  6 ++--
>   .../strace/strace/ptest-spacesave.patch       |  2 +-
>   .../strace/strace/skip-load.patch             | 13 ++++----
>   .../strace/strace/update-gawk-paths.patch     |  2 +-
>   .../strace/{strace_6.16.bb => strace_6.17.bb} |  3 +-
>   9 files changed, 14 insertions(+), 48 deletions(-)
>   delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
>   rename meta/recipes-devtools/strace/{strace_6.16.bb => strace_6.17.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
> index 46894cd9d0..1750f34518 100644
> --- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
> +++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
> @@ -1,4 +1,4 @@
> -From 267989559370a9f34646bf8a02001755bf64fb25 Mon Sep 17 00:00:00 2001
> +From 4c7112f36a70d3034c583ab45058491129111585 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Thu, 15 Dec 2022 15:54:27 -0800
>   Subject: [PATCH] configure: Use autoconf macro to detect largefile support
> diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
> index ee379688bf..c633531f44 100644
> --- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
> +++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
> @@ -1,4 +1,4 @@
> -From 59077f39cce499d11de5b0a9c23c9ded67ddb22e Mon Sep 17 00:00:00 2001
> +From d0bbbf170f70746b2b8e9bb6129b0b9441a1c4b5 Mon Sep 17 00:00:00 2001
>   From: Jeremy Puhlman <jpuhlman@mvista.com>
>   Date: Wed, 11 Mar 2020 19:56:55 +0000
>   Subject: [PATCH] strace: fix reproducibilty issues
> diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
> deleted file mode 100644
> index a879ca50ca..0000000000
> --- a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 7fadf6947761cc5248aa4a376bb9517481dbaa52 Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Tue, 12 Aug 2025 20:02:31 +0200
> -Subject: [PATCH] tests: fix uio.test with musl-libc
> -
> -musl-libc handles the pwrite calls differently than glibc, making
> -the uio test fail.  Using glibc, there are separated pwrite and pwritev
> -calls, however musl uses only pwritev2 for both pwrite and pwritev.
> -
> -To account to this difference, modify the expected matching regexp
> -to also match the musl output (append it with an OR).
> -
> -Upstream-Status: Backport [https://github.com/strace/strace/pull/347]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - tests/uio.expected | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tests/uio.expected b/tests/uio.expected
> -index 98d5c06..2a712a1 100644
> ---- a/tests/uio.expected
> -+++ b/tests/uio.expected
> -@@ -1,4 +1,4 @@
> - pread(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
> - preadv\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
> --pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
> --pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
> -+pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
> -+pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
> diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
> index ca909d573d..093cedc233 100644
> --- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
> +++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
> @@ -1,4 +1,4 @@
> -From 69083e93e92437e8d9d4225fca71a053906a4af0 Mon Sep 17 00:00:00 2001
> +From f487e2a0f1568c989a0294f4335f3dc9a6012d8d Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
>   Date: Thu, 15 Dec 2022 15:56:13 -0800
>   Subject: [PATCH] tests: Replace off64_t with off_t
> diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> index 212eea8618..60562ae7d9 100644
> --- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> +++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> @@ -1,4 +1,4 @@
> -From 9d40d293ff73dea734f1353c354f51e51992a813 Mon Sep 17 00:00:00 2001
> +From 6d77203fb22e076918dc983db47b48b28cbbc06d Mon Sep 17 00:00:00 2001
>   From: Gabriel Barbu <gabriel.barbu@enea.com>
>   Date: Thu, 25 Jul 2013 15:28:33 +0200
>   Subject: [PATCH] strace: Add ptest
> @@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>    1 file changed, 20 insertions(+)
>   
>   diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 6e942b1..7a707d7 100644
> +index d76b5c6..d4fc206 100644
>   --- a/tests/Makefile.am
>   +++ b/tests/Makefile.am
>   @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
> @@ -24,7 +24,7 @@ index 6e942b1..7a707d7 100644
>    AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
>    bundled_CPPFLAGS =
>    if USE_BUNDLED_HEADERS
> -@@ -937,3 +938,22 @@ BUILT_SOURCES = ksysent.h
> +@@ -939,3 +940,22 @@ BUILT_SOURCES = ksysent.h
>    CLEANFILES = ksysent.h
>    
>    include ../src/scno.am
> diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> index 661ed2c7bb..3e66b15850 100644
> --- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> +++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> @@ -1,4 +1,4 @@
> -From 8bd827339ae72eab99dc9ad6a68b0ae98e5bbb49 Mon Sep 17 00:00:00 2001
> +From 76c23e018608421624d1e00b9e387b265e6da469 Mon Sep 17 00:00:00 2001
>   From: Richard Purdie <richard.purdie@linuxfoundation.org>
>   Date: Wed, 29 May 2019 00:10:32 +0100
>   Subject: [PATCH] strace: Tweak ptest disk space management
> diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
> index 34948fd2ba..20535fe005 100644
> --- a/meta/recipes-devtools/strace/strace/skip-load.patch
> +++ b/meta/recipes-devtools/strace/strace/skip-load.patch
> @@ -1,4 +1,4 @@
> -From 46eceefb3bd184354cdaf0fd3dff6f2ad979aad9 Mon Sep 17 00:00:00 2001
> +From 40244c27de6b8fa0f6f6685d20e64309884e73bf Mon Sep 17 00:00:00 2001
>   From: Ross Burton <ross.burton@arm.com>
>   Date: Sat, 30 Aug 2025 00:47:03 +0200
>   Subject: [PATCH] strace: skip a number of load-sensitive tests
> @@ -17,7 +17,7 @@ Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
>    4 files changed, 4 insertions(+)
>   
>   diff --git a/tests/clock_nanosleep.gen.test b/tests/clock_nanosleep.gen.test
> -index 7a6025bbd..f0e6dbb73 100755
> +index 7a6025b..f0e6dbb 100755
>   --- a/tests/clock_nanosleep.gen.test
>   +++ b/tests/clock_nanosleep.gen.test
>   @@ -1,4 +1,5 @@
> @@ -27,7 +27,7 @@ index 7a6025bbd..f0e6dbb73 100755
>   +skip_ "Test not reliable under load"
>    run_strace_match_diff -e trace=clock_nanosleep,clock_gettime
>   diff --git a/tests/delay.test b/tests/delay.test
> -index f74e27f1e..1510c7647 100755
> +index f74e27f..1510c76 100755
>   --- a/tests/delay.test
>   +++ b/tests/delay.test
>   @@ -9,6 +9,7 @@
> @@ -39,7 +39,7 @@ index f74e27f1e..1510c7647 100755
>    	[ -n "$denter" ] || continue
>    
>   diff --git a/tests/nanosleep.gen.test b/tests/nanosleep.gen.test
> -index 41928ded8..f8a87cb8e 100755
> +index 41928de..f8a87cb 100755
>   --- a/tests/nanosleep.gen.test
>   +++ b/tests/nanosleep.gen.test
>   @@ -1,4 +1,5 @@
> @@ -49,7 +49,7 @@ index 41928ded8..f8a87cb8e 100755
>   +skip_ "Test not reliable under load"
>    run_strace_match_diff -a20
>   diff --git a/tests/strace-r.test b/tests/strace-r.test
> -index 829973753..e89423485 100755
> +index 8299737..e894234 100755
>   --- a/tests/strace-r.test
>   +++ b/tests/strace-r.test
>   @@ -9,6 +9,7 @@
> @@ -60,6 +60,3 @@ index 829973753..e89423485 100755
>    r_opt="${1:--r}"
>    
>    run_prog ../sleep 0
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> index 193a4819ef..bf4a8cd123 100644
> --- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> +++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> @@ -1,4 +1,4 @@
> -From c11380609788ff9c802d6527adc6b2c756d5f715 Mon Sep 17 00:00:00 2001
> +From 71bcc83993dd1f8f30c3defaece23211c9b73f33 Mon Sep 17 00:00:00 2001
>   From: Andre McCurdy <armccurdy@gmail.com>
>   Date: Mon, 18 Jan 2016 11:01:00 -0800
>   Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
> diff --git a/meta/recipes-devtools/strace/strace_6.16.bb b/meta/recipes-devtools/strace/strace_6.17.bb
> similarity index 94%
> rename from meta/recipes-devtools/strace/strace_6.16.bb
> rename to meta/recipes-devtools/strace/strace_6.17.bb
> index 0552caa2b6..b6fda2b8ce 100644
> --- a/meta/recipes-devtools/strace/strace_6.16.bb
> +++ b/meta/recipes-devtools/strace/strace_6.17.bb
> @@ -14,12 +14,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
>              file://skip-load.patch \
>              file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
>              file://0002-tests-Replace-off64_t-with-off_t.patch \
> -           file://0001-tests-fix-uio.test-with-musl-libc.patch \
>              "
>   SRC_URI:append:libc-musl = "\
>              file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
>              "
> -SRC_URI[sha256sum] = "3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa"
> +SRC_URI[sha256sum] = "0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0"
>   
>   inherit autotools github-releases ptest
>   


