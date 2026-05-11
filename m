Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954E2CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:06:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46565.1778493969969044317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OYz8nl/v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9591916e83=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5o5H31025629
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JoOu8brBcjrsjrJoIMk1dYN6sdUnoxonbXdfX1DS9LQ=; b=
	OYz8nl/vWVpnJV+c6P7U9frWyWNXgtQLMxLPyAfteUaVrHMtnI/a5yAxnDi2r9e/
	eUEROS1I7f3uuNJ93EsgvpxVUrbtMXCIUtu8p2BztxVB299ZAmlMMLGFTt+TZvgi
	FP+PiTvKdHOzO7xsSxEe6kS25iERN7nIwXn3Siur84k0UpTCFFP/yi+S8zBmJgfp
	yv8LBByReGQOd2yNMJQT2smX5oMrP1SpgMqhGNf7C/Cd86v8TB+PYp8+7RmnpYhY
	hrlLX2imYCyR9MV/jg1ISMYbCKqvjuOS1DOeDrmfLlokUukbArmccRCwwb9ppxK1
	lRDwo0IlL1T+s8rrahxghA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1t501wj1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 10:06:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGGW681UKZ8N/gFAhkfkCA8lMhwjwo13aJ/JIYni1e5URJjUn0s2ideRWk3Gr5oV772q0FHzc+TZLIe0gE0atDhKSe88fwVopO28s0nbJ60qj/kCCUM+Ua8yeeEJ32cygFNuT3OabMMZpkYfsZLVravYa9n2TBELOlyJtBVUSfgh32wNy1YnI0OtNdgrAlDBPA0QlXC3SyMUVBp6Fs2h3bR2UjG9Bwiqyo1VpteVXauWh8givkV1SO5xS0FQCu59C4Rk/dAVvqZI5Qb5Luu71RNgWneTpykP1SSyv/3Pf9Ft2E4My0oy3izBXgzM4qT5d5P/vNbn9+SVDMtOFjjgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoOu8brBcjrsjrJoIMk1dYN6sdUnoxonbXdfX1DS9LQ=;
 b=mefYg2Gunz45j5DBR/ThaXXNe5E1pxAzXxLN9IDF/gxripofWrOhxqFBrxr0PFAauwOZHx8rroHOHBtK8sq57SYzedl/Qrd9GazmeCHy4aak9FdCFJ0xD6JgCOLDWri9Y/S803UTYH0EzgVY16/KsJFhFXQYutA6ey4jybEI6mxO/lMqm7qZMET+OY1ZE/UIoOlV8eg021xeOuSD9IxAndSeYXeMvilOD7+/TTrt5qsAsRpNUQld/6BiMgwR6fHHN9VyLuC69whLrbW8ralqwRWkJitcgndtWznA2mPh0wdBNKf3iMCbySt8G0QOihb8baMwiV+txXAljPbQbR+CSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:06:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:06:05 +0000
Message-ID: <95643438-e5ab-456f-945e-08972d3d8f7b@windriver.com>
Date: Mon, 11 May 2026 18:05:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V3 2/6] upstream-stable-release-point.bbclass:
 add bbclass for stable point upgrade
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <20260509053033.1565462-1-Qi.Chen@windriver.com>
 <20260509053033.1565462-2-Qi.Chen@windriver.com>
 <CANNYZj8ZMjaCQ9LOtqkw_JgF=Q4mg3vxOT0z6STu-whEKQ61cA@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj8ZMjaCQ9LOtqkw_JgF=Q4mg3vxOT0z6STu-whEKQ61cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 8879acb0-a6b5-45b3-3a7b-08deaf44ea55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	r6EvpZ4EPEt+BXiyed5jjPDLU+4l26j82f4gmaaqCP8nfC6RxD3YA/kiy+t9TuP+ZwjOGgd21vvHJ2u0dDuEz2XWtON+rucsfA4RUjAyzo+VZMarp1Lndyvigm1wjZZxK3WT7nQS4xq7J22PahT3OJ6AoirHe8c1QAWbE9VOuipfDS2VNf7z7UjVvoN0CogJO4XK9mbSfOPipurNXKwidS7Tbpal3t5fQgEyqdtm9PKBdMHqK8lyE7kqNA0yUNjtvYlV3Fz3SZbXeoMBIYZHFlOi8ZRFudMDYguBXKNb2+9hSUwhe3raJuQpSwhiRMtM53ylSI09ubbGSsGza345MU550xCAORcqQTRpozc5pap4MjUJSd2XevnB5vYrIvBM6ohY907UGwQjj83z14IK/HsL0zJVUgL82O1rmk8Krb/58aKXT3UQflsm2/4lH9oKhi2ai4vlYk/8kCo8w01J1+fUJ97cqARh6UuFFEjWD7C2RmAipmzb4YKtyAqJB4i3MwxuNcVHvRyK8WrgphvKRsCwvSyFQLBnnLhASij2PbmH2b8NeAbF0/WPZl9ds1EncrBFQsA34v5adANKGVX0uXY9KbPXHVk+yl4uzg0RR6Lo3XGCqsO7kI1LiHQwTWHXffAb4JFlw5WDCyEJkua0SHTnd1p4XE26A0pZ12Jnr+BtT2ydSdmD1MfHSzk+RyCw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZG1FUlg3ZGhycy9nNmozb2pwQk5HV3BHTUpXK2UwZzNscjE4MTN2QzlIeW5n?=
 =?utf-8?B?K3hkTXhyYjk2Z0pJOElnbXZiNG9jZ1pEOFhSMys2RzJ3cmw1WFF6MmpMKzJt?=
 =?utf-8?B?WkNpcWpuSXIvL215TmVBK0wzTGNMMGR5MjM3ckgxbjN2bnN1OXB2UFYrbHZH?=
 =?utf-8?B?TWZubURLQUZ3Rml3Z2wzL2tLdCt5YU1BMVNUeDYwc1NTZ1VOVndVc3BITnRQ?=
 =?utf-8?B?WVg5SXB4dHBybFVMaVdRYzRXVHhEWG1oL1RiL09wN0hxQ21DUUcrbmQ2Vjh4?=
 =?utf-8?B?Nm9CV0NGU1BYWFdDWkRvcW8xb0RTM3hvZmNTQ0xPaDU2OUQ4RUtMbDBiRE4r?=
 =?utf-8?B?OCtuSU5uVURRZ3kraitmUjBLTVFXcmx0dm9XKytlYy9Pd3hIOTNKQ2oxd0hL?=
 =?utf-8?B?OW1ySk9xTFR4dVl1RzczRisrUjA3QVVOWE5XWFh4NW1zS1pPNmdnbWs1cEwy?=
 =?utf-8?B?azlLWjAwajd6cDZZU0Z6N1FzVG1iVmZpM2NHNm1ieGxjQXdicko4ZjNRbjNi?=
 =?utf-8?B?K3R3cVQzTk96OTRTWDcyWUJ6ZzdjZWI3WWlEeGhFN3pwQ0o2N1RGNnN5bk5N?=
 =?utf-8?B?QnRVZ3lXV3pIelZzdFNmVmNTRUlySzlBbVhmOGZEeUI4WGl2Q3htNHh2NFYr?=
 =?utf-8?B?QlNxU2RTR1ZCRUVEbEZRaEF2bEZnOUsrZjJONWQ1L2pPUGRMS0hWT1RmVjFW?=
 =?utf-8?B?TzA5L2tSYzY5U0Q2WVZrbFdYdWFVM0hUMVJpM2MwVTVIMllFYStEVnZGNFlW?=
 =?utf-8?B?Q0hsV3ZwSncwMTkxcFprbG1xbG5ZL0hIelVnUVQyMTJTczZRNmphSk5mWU5D?=
 =?utf-8?B?czM1M0w5VlB0QkxRRkdQTGgxUkhrZmEzSnVTbjUwSjd1OEpKWDRpY29iUnZ5?=
 =?utf-8?B?SkJldU5EUlY4bXNEbDJjMkxweFBmblFlRWZ2bGhaS29qbU1VVVh0TlVtVWdi?=
 =?utf-8?B?a3BlVTVaQTVUVTd6ODgwL3ppamc1bTJsTG9CV1dQelFLR3hNaitJYXJCM0VE?=
 =?utf-8?B?SnVPUGZrNmY4ZDY0L2lNQmRVNVFGM3U0cDVpZDJUSGJYL2FIY3BiVllNSTJm?=
 =?utf-8?B?SmNRZTEwZzhib1h4cnI0bXlqYnRrdXc1Z3NmcnROWUt4SlZIbVhta2lnTlgx?=
 =?utf-8?B?Q1V1WWdKazhxUFB6dXowS0ZJbWFrM0NEZFZSL1NFT1NReUdPRTVNUkNsWCtY?=
 =?utf-8?B?ZEw0MUoyZkFHdFlTVHZKcWhiaXo3SFRBdGtFdjJTajJCWDREdlZocFRjampS?=
 =?utf-8?B?M2NZQ2JIYjZnTkdpTDd5RHNrelR5UGZ0SEhseXdrMzZDazVFOG1iQytpSDhr?=
 =?utf-8?B?Q1gycWx1YThkelp4eEhZR2J0Q1JSaEtWL3NuR3NDaXdtOFV2SzZYWE8zdU9j?=
 =?utf-8?B?bnhtdjM3ZTZoTDY3a0xYbVluQWtqQllneVk2Q2RVeFZRcnVDdWdEMlA5eG92?=
 =?utf-8?B?NG9kQVhpSWJyRWlzL3hybEI2TGpENGRyQTNaVHExUThXZ2FFbWd1MXZYcyts?=
 =?utf-8?B?Wmhra0pObXpTWXhwMFdKalpxcDRiOHdTUmEyQ09KRk5oaktEN1JJUXQyeUhX?=
 =?utf-8?B?Q3UvQXJySWpwZWJqeXhTNDI5aXNxbzY4K253YjEzb1lseGZjVnJtTWtjNTZk?=
 =?utf-8?B?TDdOeWFPbllQbE1NdklnK2gzSXpydWwrWHRBRHBrcUVDWnZ1cjFVTkpjcTZB?=
 =?utf-8?B?cDJma0RkbE02RnU2QnUyb0pjalFoQ2o1WEJLRG1VSnFqcGtUMG5DbVRsOTRa?=
 =?utf-8?B?OE5SQTBEejFuejRqM1ozV1RHMWRTeFhhWGI3Z3Z3WmdhbGRZQSs1bmFzRm0z?=
 =?utf-8?B?MVFpYnljcHdreWlOUHJHT3R2NmNlQUE0SXp2NjhLSm5QdVdNM3BVV0luQ0FX?=
 =?utf-8?B?SlJNVGRxVWZFazVWQ1J6SWVNMG4wbzNkWWlFQURPczZwODNxdVpKMk8xS05k?=
 =?utf-8?B?d2hwVE14Yk1adFJ2ZWVZNVNVS1hNaWJBL05mQytuTWJJS21jWnR0YUpjUWd6?=
 =?utf-8?B?c2JSRFJ2SmJ2SjR0L3NWRHFwRWxtdHd1a2svaTFTNENrKzV4ME96ZEFyTnJp?=
 =?utf-8?B?UEY0ZllUVkcxdjNJZDF2V0Z1M3NaUUpUUWFmYU1neldFQmIreVE3eFBQTk9R?=
 =?utf-8?B?S0hLa0syM2d4dmRUUllRVTN3SGplcWd6bWlSWWw2RlM1M3FtRklJMUE4U0hJ?=
 =?utf-8?B?bndkWWtvWlpyN1JKYmEvVy9yNmQzWWpKdjhwTXJ5NjJabDJ6WmNTSFdWcy9k?=
 =?utf-8?B?VFhyakdKenhrblMxMk4wdytrdElHeXNWTm0xN2YzUlMzTzcrT0tHSDhFRHNt?=
 =?utf-8?B?SlkzNkJYdG9LMkkrY3NrK0JsMTJKWjM2YVNFYVpLaHcwTUYwMGdwZz09?=
X-Exchange-RoutingPolicyChecked: 
	lhC801lzFUwAiTpI/EzHujBP4fzRInY6uhR0PI6KMKAOp+ZrclLfyN/mOkpT7tohQ9b9z7ttSlwFAFDDgVjd25Cssm/B/EsRgcJY794RNmhH11dYFg2LouSLDFfZnIzcKGBcUsezEMS2SZN0cN2oRbhRnrEC5Hmp+T+DB7Qc5dH6rdNavF9V6RNeFoYFYv2zy3zEFfkVKS9Ov2s8RBSPVy/wdRx+XZ30vYi0f2AY64Xy6RZEcS7QNeDKRAajUtdo8HGvyxLPJ4G2UzSLNMNMDYrPDvr87WK2IZ01HXO9SPvB93wmR839ptPnb2PBsA9K35hlYLhnBd1cLOJ6nqWRPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8879acb0-a6b5-45b3-3a7b-08deaf44ea55
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:06:05.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rUq/Lb/7mQBxSfJZvBPEtYpG7W4wZU9nDpdyC/ahpmsm4WqyHbL0M26bfbLPDAlIIBnJfDu42FdHXoqLC/hUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: UZHrs01Vho_sSrqSzuYDIXCSp8JUT1e2
X-Authority-Analysis: v=2.4 cv=C9fZDwP+ c=1 sm=1 tr=0 ts=6a01aa10 cx=c_pps
 a=N6h9FcIU3O7PIE8+NyeJww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=ovbPGAOH_G2SrmB-9jwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bDzSwHrtuhxHe7itH1UWmmCBv4BMPmJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMCBTYWx0ZWRfX7MZp51/wKpbm
 krwtGlEsQNMXxe9a5fBm4CmQc8OfEqF8GuNhJ5wT68zKnnSb399f4YYEaJqKP1ryh5V6L0OSALd
 eeAD54MM2HMQJ2lo5gwL41mnFMlnG4x9GRCvhsfQS20XbuxYvYrqaqtsFHgk10M8wnsYyoxSPFS
 fpuIDm5XoOh8ImeD6khqruJZTzYqHopQqLDpmgKzEbhzp/KFi5YAWmJzf9Z5T+6gr5DhbUliU5R
 ysBbt4rP+ik13W4lcS89/iXJbUSKL/nYXltjpqBTKsRzthnhUzMF3mSZi8gwQhJWxd/i3kXiJPl
 Zh77E3nqUUZpH/qQ82x5ziuLPKj3cK2GEo6l1dj/uh5JJgeSLIq5aSNs5ho8gPJokIkYuguteFy
 DIpvVKWx597lFqlW7IQNDFfSl7VaHEls+jLcTSddUuCoP5N6Hr5I3Vmb8HYmI5CesexrAh7H8oH
 JvmrtG3J9magk+sRyZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110110
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64B5o5H31025629
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236798

On 5/11/26 17:32, Alexander Kanavin wrote:
> On Sat, 9 May 2026 at 07:30, <Qi.Chen@windriver.com> wrote:
>> +def get_majmin_version_regex(d):
>> +    pv =3D d.getVar('PV')
>> +    v_parts =3D pv.split('.')
>> +    if len(v_parts) =3D=3D 1:
>> +        return pv
>> +    else:
>> +        return '\.'.join(v_parts[:-1])
> To be honest, I would not special-case the len(v_parts) =3D=3D 1, as th=
e
> class becomes somewhat inconsistent:

Hi Alex,

The check is to avoid the function returning empty string. At that time,=20
I was dealing with systemd and kmod.

I agree that this x -> x.1 special case introduces inconsistency.

>
> x -> x.1 is supported
> x.y -> x.y.1 is not supported (instead it treats the stable versions
> as x.y -> x.y+1 )
>
> These are two different schemes, so I would not mix them in a single
> class, and support only:
>
> x.y -> x.y+1
> x.y.z -> x.y.z+1
> x.y.z.zz -> x.y.z.zz+1
> etc
>
> For x->x.1 we can make a different class,
> 'upstream-stable-release-append-number' maybe ?

If we do so, recipes like systemd/kmod cannot inherit this bbclass as it=20
will do uprevs like 259.1 -> 259.2 as well as 259 -> 259.1.

I mean, they can only inherit one such bbclass.

Ideally, I'd like things to be in one bbclass, maybe with some var=20
controlling the behavior.

>
>> +MAJMIN_VERSION_REGEX =3D "${@get_majmin_version_regex(d)}"
>> +UPSTREAM_STABLE_RELEASE_REGEX =3D "${MAJMIN_VERSION_REGEX}\.\d"
> \.\d should be (\.\d+)+ to allow numbers bigger than 9 and multiple
> .number parts one after another.

You're right about this '+'.

With your review, I'm now thinking about using something like below:

Introduce one configurable variable for this bbclass:=20
MAJMIN_VERSION_PARTS ?=3D ""

By default, it's not set and the majmin version should be the [:-1] part=20
(I mean for 1.2.3, majmin is 1.2). And for recipes like systemd/kmod,=20
when inheriting this bbclass, they should also set=C2=A0MAJMIN_VERSION_PA=
RTS=20
=3D "1", so the majmin version is [:1]. Recipes who want to do x.y ->=20
x.y.1 or x.y -> x.y.1.1 can set MAJMIN_VERSION_PARTS =3D "2", so that the=
=20
majmin version is [:2] which is x.y in this case.

The number of recipes setting this var should be few.

What do you think about the above solution?

Regards,
Qi

>
> Alex



