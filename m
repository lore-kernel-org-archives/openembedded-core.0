Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B445E106FD7E
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 04:54:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8911.1773377666324443067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 21:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FpD7iOHu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75328861fc=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D3Homx1834608
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 04:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ppz4P/0f8xVLuEL5cjbmpdcOBkRp/ysVnZF0x3QNpkY=; b=
	FpD7iOHuNrarTmt6ahmR2C4u3/VTDiEbT5Aky8K3N9VH72UP6VWrcp0xg9ruw9qu
	j7z0bNHiY4QfuwvYjZScRL9hj0R1SStjhvvLflMXPzt92xwYyakAxO1Ar76f+kji
	pzDOMfvjV8pnGCG2rqLqE5CFHewwgOr4sOuITajHn4jJNk6ZbCxVvv89R5hxkqKL
	Qq4utVP+sIZPg6my0YD/eJGSIhbfvP3No0lS9Zd2lJebigBarZ+uLEeDzQKUU9DL
	Rxgn+r2SvN4NNYtjfNGadI+vpBztPquVKVHND2gSGKzwJaFiC+fARE1WyIbhgKSI
	HbRtNXACH5sHi4ZEpOk4/A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqs5d6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 04:54:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0vnsg8Wa75pvFrHPYi5bUciF7sOWsP0w9oHU0ti4hlbNWVu0+yvNxirwlT56GLpbySCNvDMHLbGapxCbN3pRw6Ji8J08/OEYL5d7nLyXwz3ITUzJJy0+TLfzXJPrTBUBHQBnO5cMUObqmDba1EgiDKlOy4wP402OymMfetQdvzHIPUjxvqAMJtF5WuLseRTIUsqAUSDquJCZ6N6gx2bN+14xS6OiTbRFDcfKdTQbWOLJYO9G3PhivNgfmM07hVHbhttW/zAa65/sLFvxERlfrdyFIFHGc7UFXawvPW5Tdju9Lf7PyT8U37IYswnfWiflvAVut6WOTQG/e9krOnf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppz4P/0f8xVLuEL5cjbmpdcOBkRp/ysVnZF0x3QNpkY=;
 b=j/9sGSgTb1ZsAjTVBjMEzmAiyXVyuiKyTi1N3vhLUhz18Y1GKnj5VqJLnRXjXafjrlqBDsIz2c15oE7/SRjQgKJ+gXm6/w5YgD839KzGBHZ+J0NUvjoLgy+Cn20FHpLsZfAG7UFrYz1hp1Xaq1qeTR4k1xeQbQqvI1mpcPSoBgO2juMT51KCFbdcu5cbvlj7kb3pzLiSexlD4OrmUFFpA4ELAuHwqPyN+dHMcQD79erXHAmTEDmzK25QkJaepxcwPR95ZJFd6NtqFtbro7Dz4E7xeoZG6VH/kG8to7w+Z4lG03+iUeeSUHte3qba/eYHy2N5v8/MNZnGYl8aehDOJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CH0PR11MB5282.namprd11.prod.outlook.com (2603:10b6:610:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 04:54:21 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 04:54:21 +0000
Message-ID: <1f50dc21-bf2a-4b2f-9a39-9ef5137f26c6@windriver.com>
Date: Fri, 13 Mar 2026 12:54:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v8 0/9] rpm: 4.20.1 -> 6.0.1
To: mathieu.dubois-briand@bootlin.com,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mattware@cisco.com, esparlin@cisco.com,
        peter.marko@siemens.com
References: <cover.1773324129.git.liezhi.yang@windriver.com>
 <DH0XA8PQOXXR.12KPIBAF43RZ3@bootlin.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DH0XA8PQOXXR.12KPIBAF43RZ3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0121.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::17) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CH0PR11MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 7615c617-bdbc-4056-7965-08de80bc96f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	xp2b7b9BiWDTzdlDFFOu5wjsMp3DMQo+1mzIxVtMUqCcpo4uMWg67UnEFS/wp467cAI/0FvFPhLeip3DnqzJdbnIi/xYPuWD4vmt9sTehXhoF512jkjZhZVdk3bepNCO5pLcbPIJlJl4gvbzJT8y32d7M87PiJTM1270HrCbFmgxaNfm8nVtLTz0zkaFKBrI6JWzs8SVhIs4Ehc2OuLVLoHUpkZWOwvrHKTRawNgZY+gEUYFZD6mjhsBadO/sJ2YNnnDD+8o8uRi5z3wc/FoRnGMaLPsu2ep7T2p5DqnvK4Zvm1bWW/uwfnYYW+04iHeA7xfYSN1dzUuLF/rGstX2aktKk876iu4rV0JFJPJ3vrE9qzA51KXlrm1SSt1VvHeGRrz/jZ4SnAI/ibVgRR45rwsdSpG1gKsblVCx+QR3vGWINBkt4le8KzVWVgYpSdV2qertfe7MGS8iHK8lQPI1DWF6NVXEUVs7TGoJo1hziYsGArWkz9OJ20g5XTG9kqpl7CuB6GTuLwP/gCVSXYZtBvr0QFsiRyjV+ojEp2xqj47hML/ZncuqCtL2Y5LjGFP56fCYhQ3y0wthG/f56D9csGX21ijgpqznLnRUfIydvfjurtY4lGZlZ2frWbqgSvz4tXAfpK5CprglCi0gwqg9FZ13K+ZlF9RjdT7HQKUvtD1eiJrGexSQeoC4lJAdP57
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2U3Q3JIZ0FtUHp1MTNFVW9INlhGdjBBNUtHZDNSUW04RENOSGpLWHZrWUo0?=
 =?utf-8?B?MzBnOUZvMENlTUNoN2F6QkM4MlJOUW4rQUhMdDk2a3VSd0RmMmwrREMzQnY4?=
 =?utf-8?B?aXNibzArSlZEV1ZKRGRUblVqTFVLS042YWVPWER6VGNKN2d3S2ZnV2hNZW1s?=
 =?utf-8?B?S0Y5UEEwTlBMMlladTE2SVNHZStwME1aZHM0QTZrYXRPUTBNSllENlRKTDBh?=
 =?utf-8?B?RHRjeVowK1pJTmd1TFFjektBKzQvYlBoVmVteUhuenY3SzFQelhFbElTQUdI?=
 =?utf-8?B?SmFWZGMyS1F2czdkTlBzZFI5K09qR1hlb2NjTnlabjdmMjZzRGtoVG51REtw?=
 =?utf-8?B?cEFMejlsN3creFZiNGpmVGM2azJ2Ry9SckhVaERCdEdNeFJYdnlDT05ZcjBw?=
 =?utf-8?B?QWZVamIrOTlBd09tQlZNMnNEQVNtL05DTFhrMy83dDMzOFQxbjVXSG5UQ05T?=
 =?utf-8?B?cm9YOGc0WWxHU01wNjRkOWprdHRGdWRLb25DYmRVeE5selNzTTRMUXRjMnhW?=
 =?utf-8?B?aGNoOE4rc1NqQ1REUVBFenNTajI0ekw3Mm1FL3VkYU8yWExzdEdudlRXdGF4?=
 =?utf-8?B?WUtXUHh1UjViR1M3N0M0eHN0SDJvWHNsRFplWUN4TDBlVnFrYll0QjA5Wmlk?=
 =?utf-8?B?K0RnUEJuYXJ1RVFINnIzSWY5aCsyVzlCcTFkK3VqREhGckhjYkJzV1FBYkRS?=
 =?utf-8?B?RTArSmxZeXBMTkc1Q09iTjQvMmRkakRnZ2F2N2owelZ2TndCRE1UNVUwV1VZ?=
 =?utf-8?B?RWMxN3lyNXppYUQ2UUlDQ0VrM1EvNEgvZCtQRGp6eWlKUDlGYi80TUhoc2dL?=
 =?utf-8?B?TmFraWRCclJMUGtnYk9mY2QrSEU0QmlvdWhjTjVReTMvS2JUamY5TEhyU0gr?=
 =?utf-8?B?cWJEb2FJcmRjNzB1bktMakdlekN0V1lVNXAwMzJRanhKZTJyRG9jMWNNU2Mx?=
 =?utf-8?B?c09Lek1jbzNxdEpsdi9SbHB2STZkMkxCM2poRUYzUWpXTlJ0dGtkeVNDT1hC?=
 =?utf-8?B?SHhEUUE0MXo1bmQwS3JSYjVYSkkyT200a0hnYUF3NFlQVUJ1cHYrK3QxQnpO?=
 =?utf-8?B?aEdnN1YrTGxsOWhJWHlSWHIxdC9JTXVxQU1Sc0l3Nk9lSDB0aTRLd0d0c0sy?=
 =?utf-8?B?TjdEb2VmSkZibXpQQi83QVJWaTFqU0ZpWlZ6Sk9SaGg4ZzYxekU2K1dxSkJR?=
 =?utf-8?B?elVwZXE4THN5NWowTHZoc2VzcUNVMDB1Y2dnQTNKQkNlTG5GeG8zZ0RxTzlZ?=
 =?utf-8?B?R21FVWVyRnhlSnF3TmlMampGWGIrR3hQNGJLQlRsZmNXZVg3ZkVsTUozcEhT?=
 =?utf-8?B?a05QNkZmR25TWlh4MW1KK212aXEyY3hlUlM0SXJ4VnVDVjJkazRITTlNR0lj?=
 =?utf-8?B?WENNWVNvTkJnQ1dGYXVNdUE2aE1Yc3k5UVdNZDA1ZU0rK3ZuMVBQM2ViZHFH?=
 =?utf-8?B?c3p5MzlxZjJWeWtPeGVhcHBlVitCMG15QlB5SHdURDkvalRLWTlSUUlPdFJ6?=
 =?utf-8?B?dkE3RklCdG9zc0FoRm0xczV4NUZPcThNZXQzT0x6eHUxSlBkOWhLSEkwZHRw?=
 =?utf-8?B?V2F0dXdPSW81VjR6anlqN3pFNWtBaXdlWEVwVTJGUzRlNjZ3VFVRbW9nODUv?=
 =?utf-8?B?Z3FvbnFMZTJsdmhHTXV0S0V0RXAwSGRTYTRTUGcwbldjWDAzM09qRnlRVzNv?=
 =?utf-8?B?TitmMmZwYzQxOTVrOVUyYnI3WlVqZjNmdmtTbFJ2SnZCZExxdGJTOFIvK1A3?=
 =?utf-8?B?eWFDUytGa0lMRmlxMzRpNnRKOTM4dEJVd1ZvLzg4ZzhsUmFtcEtnN0xQSXlv?=
 =?utf-8?B?NmM2QmpwRGtFbXIzL2pyRStlMDJGcHhmVFFvWWVMY2xIcEFpSjRiS1hTdmlQ?=
 =?utf-8?B?Z2N4anhSRW1sZFNEYkJuRWtHZTdEV0RvQjBJNGxObTNJbkpVbFdYVnhEZFox?=
 =?utf-8?B?QWs2Qm9YY3MvQ2x3OWZyVE90VXQrc3MwOWhURHBiUGVjOUZkZk5IV2lhdnI1?=
 =?utf-8?B?dmdubnQ2czBXVWdYd1JQb3BRaUhlZzk1emN0aFhvQjVhR2RLdXNYMmo3ZkVn?=
 =?utf-8?B?dCtLb3JQZCtFZ003UmN4THovNDZmZzlLUXJOZCtnNUNwTFRpejViWElPRm9F?=
 =?utf-8?B?YVkvOENRdWFlT1A2MGw1dk10R1lub3A4VlVXSFVuUGxGQXRvWFQyZ09tdzFD?=
 =?utf-8?B?a0R0M00veVl0V1dNUC8vQWVmU0pMZkdycmIwbUp3Nmc5L3pJQ2luc2YyOWlP?=
 =?utf-8?B?bnBPbHJGdkJBMkMreERSYU4xTUVSOTYzZ1hDZW1kdWVuNVFSNEZsV1J3UWU3?=
 =?utf-8?B?cE5TNmhOMzBReHAvTFFhSVg0bVU5KzFXczU5S0RIWldUN1VWQUlmZz09?=
X-Exchange-RoutingPolicyChecked: 
	PanCAJKvi6EmmeTQtmQTEHyi4/TZW6KwGWzt19jUWebNWeOvFz9kyFmmE9qOsKUxtNnNQDNoez22s46GMVO31MHvbveGkHwTztjcHel8WWY6ageIEwn9xZm3pkqB7MHYkFARZRs5/qFfZEU9ZaYJdNl0DpIArVJWDBX4poREuRJ8A8aGSXIpOmZP6VlNB9v9G0SZLFzuUw8I9Dvu72H0fWyx+TODLhu4LTD6sLDq6kGdM44gIazZZsVRLevXfdJKoL6YCGQCpwuKyfeIqEzSbNcUXZ1+CclBbgg9+S6Mi5tVeIgaE4308Lff0FF5x2m34yW0fejXtH6z0b6dzgvAXw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7615c617-bdbc-4056-7965-08de80bc96f0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 04:54:21.1546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HsayRb9iLyGHpeYdRDSHhtONPvI4ieIWx+6wTLgPcUTGnVTUEI+F2zYznIRF2UnclLK6hufNBvtWbrbBKoPv7NYH87mV0nXOIyOm/WJiTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5282
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 41pWtLHdhU0I6Yrbx-Rw5kH8MusH0v6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAzNyBTYWx0ZWRfX4LTnCCjMc4WH
 Zukpw+DBbz0EP8754pO3fh+Kp7sH8x3VZmb36+aH7S7EIH6ymHyNHFJSYaX7+8MFi4AVgAbwcW7
 fEl2rv9pRZ9LytFNveWBj0GA2iBSAxo8LeHF19/9SSAwahQ3lEHsdgNMZvR7Y3yZCZcDyyxQFNC
 87j9h/jNbF+ii45rZSj/Gir9VZecIqwFg8wxWx5x2BVYN4yb3Qx9ecloeO/WJzlzydStXOyV24g
 LsocTLZS3iBnKA88h6jG6cbHRJ25PRifPfWE2JeGUf2dNgYPm9XDHKcWXPX9StUOtOWuQFm0x3v
 CC1a6t3n3F7ZLUHpqRWP43cZwAezQ2YVn9YqlrQVBdcBsPat71k9bE+rK1PFIw3zrOu9idEA8gY
 a3Fr1LoRw5/Ch+ME/1lEPUAwRLj/LCnszj3Ta73qe57FTr+KESZKVuSPvyUA8FrAoTrrrzg/P2t
 CXQf1dKWpduxaR3hk4Q==
X-Proofpoint-GUID: YYntI481n77QzOt9ZgSljz3AxmPzAKsN
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b39881 cx=c_pps
 a=aMvkJueGaHUSD5gdo5rTxw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=Gw-yneVA-UaRYNRmeA0A:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 04:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233022

Hi Mathieu,

On 3/12/26 23:52, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Thu Mar 12, 2026 at 3:09 PM CET, liezhi.yang wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> * V8:
>>    - Fix build with systemd (Check patch 7 for detailes)
>>    - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig
>>      (Check patch 7 for detailes)
>>    - Backport a PULL from git/libarchive to fix oe-selftest failures.
>>
>> * V7:
>>    - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
>>      To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
>>      pkg-config is installed on host, now the host contamination has been fixed,
>>      and the patch has been submitted to upstream:
>>      https://github.com/rpm-software-management/rpm/pull/4127
>>
>> * V6
>>    - Fix -cpopulate_sdk error when DISTRO = "poky"
>>
>> * V5
>>    - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>>    - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
>>      between /bin/sh and libc.so.
>>
>> * V4
>>    - Fix loop dependencies issues for libc6 and busybox
>>    - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>>
>> * V3
>>    - Fix Alexender's comments
>>      a) Suppot rpm 6
>>      b) Move rpm-setup-autosign to rpm-build
>>      c) Remove -DLIBELF_FOUND=False
>>
>>    - Fix build for nativesdk-rpm
>>
>>    - Drop patch for createrepo-c since it has been upgraded (rev:
>>      804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>>
>> * V1 & V2
>>    - Initial version
>>
>> // Robert
>>
> 
> Hi Robert,
> 
> Thanks for the new version.
> 
> I suspect I still need to get some gettext patch with it. Either yours
> or the one from the glibc upgrade series. Is that right?

I think you meat the following oe-selftest error:

ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on 
locale-base-c, but it isn't a build dependency? [build-deps]


I can reproduce it with pure master branch: (rev: 
438afb3ded629408172c4bd7d556c5d2abacd631)
PACKAGE_CLASSES = "package_rpm"
OE_FRAGMENTS += 'core/yocto-autobuilder/autobuilder'
MACHINE = 'qemux86-64'

IMAGE_INSTALL:append = " glibc-utils localedef"
GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8 en_US.ISO-8859-1 de_DE.UTF-8 
fr_FR.ISO-8859-1 zh_HK.BIG5-HKSCS tr_TR.UTF-8"
IMAGE_LINGUAS:append = " en-us fr-fr"

$ bitbake glibc-2.0

So I don't think it's caused by rpm 6 or gettext upgrading, and we don't need
other patches.

I will check how to fix the glib-2.0 issues, but it's not related to rpm 6.

// Robert

> 
> https://lore.kernel.org/openembedded-core/cover.1772895871.git.liezhi.yang@windriver.com/
> https://lore.kernel.org/openembedded-core/20260310174403.2309825-2-Hemanth.KumarMD@windriver.com/
> 
> Thanks,
> Mathieu
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232983): https://lists.openembedded.org/g/openembedded-core/message/232983
> Mute This Topic: https://lists.openembedded.org/mt/118279443/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


