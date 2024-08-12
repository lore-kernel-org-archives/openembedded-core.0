Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E8AC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 08:18:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41658.1723450719943813082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 01:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=895429e4d8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C6FkSe025700
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:18:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wxcuhjyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:18:38 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47C8Ickf001784;
	Mon, 12 Aug 2024 08:18:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wxcuhjym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 08:18:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sir03AUgaDHVjCPWQ5YgstjgtHQf4StglbYvQXtWupUZNklCrH9GHUpwKVkdRZeyk46CcAti0MwIFhHUdezHaFjD3o57eEJPAGBsTRyUSk9/lZ7zgReEmYUhES7dyNdxfAJjunZuSM22tvpEvncRhGX+x55HNJIGZqC97gAZp82xBRAVDjbd8Q1IOgtMLNaVW8h18Dc0selMf3vVECwTXIlgLSd0MYHSv0IrwtqWmyW99N5MlW3u8El51+bGcmverv04S5eL28RveDUJCPJkxiJ9Vyf3f9IPQSjmAnPHHhZELr2hEWiNyX5e3MPXCGUXRKrQWCKsQ+gOch9ukbl93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjCda19FcLUdof+GZacN2BCVVoVlhvZs6NsLp9lojjo=;
 b=Y5SoJpCMsk05x5At+ynEV32Gb81abejLFKdWboJ5MdIHSYBAgzcht9IPByxF+0TBPuFi5k7fBy0movElMgQAeFiMKACWX+z+/ZEsWiLrAnKaUd+L8ZwY0rq0dp2pHHFCa+HrC0UfDlih9B+LGumFw4hRd0t/0jhK2ctaYGDd5CA3diEKR5e2Yw8d0P8f6kq/ANA/UhS+RbYzjkrc3ysNs38cGCoROCtGhyhsKrcnMnYF8nG08F3dDpt5iAkEDbPiJaM1joFzK6RFj8f3CUFDT26gOJLseRAfJtjCIj26p/TTbCcrZLcecpgd7jAyMFqFHmIJS29JRvkGSBHcQCV5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Mon, 12 Aug
 2024 08:18:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 08:18:36 +0000
Message-ID: <c5b59317-71b6-13eb-aae5-9c55ecf0593c@windriver.com>
Date: Mon, 12 Aug 2024 16:18:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] json-c: change SUMMARY and DESCRIPTION
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240812070054.93602-1-Qi.Chen@windriver.com>
 <CANNYZj8q8nff3nU39jjH9jY3XdtuE73_nzZHUedkRjc31f1U-g@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj8q8nff3nU39jjH9jY3XdtuE73_nzZHUedkRjc31f1U-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa54107-3791-4732-9d9f-08dcbaa75d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nzh5RUpmMERqeW04VnRtMzNKZTdhS0h2K3NlWTUza21mWG9vTjNPUkFHSUdt?=
 =?utf-8?B?VWZuMzlEV3ltVkV6Wk0velVKNkhpYUE5cUQvd0FYMWpJZjRxWlhHQ1hKMXZ3?=
 =?utf-8?B?UlEwUDNCNzJwSytnNTlpOXRXN3ZQdVBqeFNRODZNRll5aUV2cVBtaEpzVmts?=
 =?utf-8?B?bWcwcklFTWFOaVN3UXVGSENGdVNHeGlhQ0NUaXVvUStqQ0xlSVNBWkxuOVg4?=
 =?utf-8?B?ZVBRUGY3ZUhISWJFRnBjUlBYRzRjb0J0UlVIM2plckh6NEtKbjhkRjVMNE1U?=
 =?utf-8?B?a2ZJTHRnOGhRVlN2YUw0Tm1NUU5JY0lyOHUwTmxlT0ZqcmZvNUltZkU0d0NW?=
 =?utf-8?B?UWgvQlJYOVBPQnp4ZFpBcTl2dnNJb2Z1bmFyYWFhNDFHcDRmc09tUHIxd2V2?=
 =?utf-8?B?enhjWlFIcWpNZFlxWjV6UTRjUkhieDhwMTlxbEhwR0ovRUsvYnp4UFRYbEJP?=
 =?utf-8?B?QldPNUdIRkZYd3lLSkl0aEpwMTkzSFlvbkFaRFhKeXV2QW1wVDNJb2JtcVUv?=
 =?utf-8?B?Z2hnWlBEWEptbmFBZFJ0Y3dWcmpVVVNaa0tSS3Fkc0JEc0dYK0F4ZERzcHVY?=
 =?utf-8?B?MEtoYUpJTEs1TlNIS1NvejFHMzRSV0FlSE5QODkvanRpWlg5S056dDhtYmk1?=
 =?utf-8?B?VGJMWnRxREV2bW9YVkllWHBWVUY0K2ZMUkE3SW1tY0NtWUVVNkZmYjVXNHB1?=
 =?utf-8?B?RWZGVm1PcHBXUDhQcjNoUDBPWTlzK1RCNmJMdlhNNmgwcHEzWHJmVGlrbGxM?=
 =?utf-8?B?NlRWSXM3ZWFENzhSRzlsMmpvWWsxL0JUVVNsU0ZVMFFHcnJLdkhGMS9sR1o4?=
 =?utf-8?B?bE9ZbmNWRG1UZ2l3cHBTd0FqQWNvYTJNVFdBT3IyTkwzdVhFR0h0aEF4Kzlv?=
 =?utf-8?B?clQxdFp6eE1DM0RZenlSUU8ya25uN1k2VjRUdXdpWDRJL2wzR3ZtZERUY2tS?=
 =?utf-8?B?aWtWQ1ZHcmduVEpmKzBrVFB5K3IzTnJ3S2Vya3orL1E5RkNEUGFhR3NDaEUv?=
 =?utf-8?B?OUw3Zkl3SEdZVDQyNEhtNnExdE9pT1M1ekJ1Q2tYUXNXdXZWNWZUOXpvTTRv?=
 =?utf-8?B?eHVuUEJLektpOXAwbEVhK3E2UlBSVVBrUERoa0VsTWkrSnZJSkk5cjV6TkdU?=
 =?utf-8?B?TUx0RG9CZzNOMlVsdGovb0hMVlJ0WDJqeGRvSTd0YzEvanNjbmc0N3BjVkNE?=
 =?utf-8?B?bTRPa0JpYVNEZ3BtMmE0ZGdtVUwxVDBIQkt5WG1GbEFTcGxjWnZnOHZmMDdD?=
 =?utf-8?B?L1RpSC8xUERwemloNXZnNlJJNENQVGc2My9mVENlbmlacmJFUkFnaVRUdFYv?=
 =?utf-8?B?M2NBNXFuUFFZb2p6dkRlL2R2c3VYN0l5c0NGcUpNUkhPZm5BZGY2eEZDdlVM?=
 =?utf-8?B?V3hOaHljZVFqTWNieS9tTlFVc2hUQVNTdlVvN1VWb1F5VzE0YSs0VUdzcFVu?=
 =?utf-8?B?aGRrbXNXNWlOSEM4a0JuR3BnbTNYL3BqeU9QL2ZEU1BUVTBUdjlVUUFialRy?=
 =?utf-8?B?Z25VS2pYZlRhWk9GZDN1djdadWswbWJyRXB4YjdHaUl1ZUV5TGt3eXFlTWVY?=
 =?utf-8?B?R1FTLzlyZmZJeFNlbFExYmZacStPT29DQ1kzdkY2YVBoYWdjYTVIb3l5MndR?=
 =?utf-8?B?L2w4d2VQczFnTXlVTFpMbUFhaTh6bi9wWktDdHgwQzFOWDVCWWFTZHJLeUpw?=
 =?utf-8?B?emhlbFNGeEtUdEU0WnFoWFM3dUs2RE50VGJyWUZqZmRFWmdtZVd0OG1TWHZi?=
 =?utf-8?Q?kn1oR0YYfWdodcdXXQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WTMzU0VoVExCREJHVnlYQlp3V1FkSEJUWFZHaEpoWjgwcFlpRlVCNXNYaFlY?=
 =?utf-8?B?MGRwU3ZPZ2JmdTNLNWRUUllKQkNIK0ZWL3U3dHdFVmxnMUkwbWFGL3BEaDV5?=
 =?utf-8?B?bTdUdTlteTdVQlVPeW5OR2EwR0RET2hlaGdHS3NLQ24xd1NpZTluTEUvSURz?=
 =?utf-8?B?cCtkZFk2dGdyTEtVNXJsZERudGQxdzZKY0V6bVl6bUIxdmQxL0t2NE5sWk1x?=
 =?utf-8?B?UUoyVldZbHZ3WW14cEljZjZtbkJPTklqcTdLc0czdWNFZjE2NjlBdXpiZzdE?=
 =?utf-8?B?NHZhUE45dmhFRnZybkcyZ0tVWUVOKzZSSGcwRjUySm9PUnVnYjExQmtONjNG?=
 =?utf-8?B?VjBNZjl0UVBQVFZudkpTcTIvSGEwYnJxUFNtNFk4YlRIV3VXYzY0V09YZk1v?=
 =?utf-8?B?UnVHNEx5RlFwVDNsUE9NVnhobmVqc0JtWCtkak9UV3dJejJoL2xwVDlmbEVB?=
 =?utf-8?B?MUgvYWwzaXpwRjJ4VWxoTkdNd3ZFQlNwYVh2V3ZydEZPRVl0WjhublZEZitT?=
 =?utf-8?B?VTdUcHU3Rm9VdVhMM252S2JOaThYdUZDdll0Y1NFSGlwVWFoZG56dWpkWlRL?=
 =?utf-8?B?ZVVmeFA2R2R5Q0ZHK2NZbnBCSk1neG0vYUpFUUk3UUJEeldKUmxUV2hJWkdo?=
 =?utf-8?B?dW5zNldHK2N2MDZZbU1vM2FmU0xYNkI3a00wbU9lOFlyeWhSMzdUaTdEaElk?=
 =?utf-8?B?cDRZUFdPd09wYlhhVnAyaU1CUDdIVDRqeThkQUdTd25HdXY0d3pFNkV5aHBM?=
 =?utf-8?B?OU1sZzJqaGRMOXFoUWdjWnRVZFcrdFVhZmt2MjZSNXRHaXgwbXZocDViUjMr?=
 =?utf-8?B?VVM0b3psaFBhMXMrL3VrSG9FcE1RTGxmU1lDUVlSSXlIdUVHTlk5bzhjdU9t?=
 =?utf-8?B?ejdBM2Q0S2FBUXJiNjV1T3Q5TE1Jb2Q3VERtdFpndHYxT1p5Y3pwdVZxd2di?=
 =?utf-8?B?YVllSE1DWVZnOGxjZXB6NHRWbjY4L1NXQWJaMjJjaFljNXlIWURhNmR3VUtT?=
 =?utf-8?B?U0dVa2hoa3VHOG5HWXZIYVUvSlZWTVJPa1pNSmpqOGt6RS9tdExKNGFkQTRD?=
 =?utf-8?B?blBST2l2d3dYZkIyaXNKb3Z5RmFITUtlbWZTQlllcGJ1dGZJTW1kTGJNZitD?=
 =?utf-8?B?SUwvUFBLM2FXYlR3dUpBOUg2UVVFY0U1KzhZZVVaWFBTc0ZCZitxNE5YUEZh?=
 =?utf-8?B?TlRYSHhBV253WDhCTVg1WHZNQXh1MWJwWUpqaWU5QlJVS3RsTUNsbCtTYkl1?=
 =?utf-8?B?UDRVYjlOeXBpMzZmVWxVVElPUkUvN0dIWGh5b2J4TWFaVjdVYVNUYmFXRU0z?=
 =?utf-8?B?aUJNMS9CV2hTZTJpYnp6dVZkcHF0dmU1Y25uanBOaTZjTjAybjcrWithc2ZR?=
 =?utf-8?B?bEJpVUY2SEdSOXRFTkxpRWhnZU1nYWpWZHFXNEhwaXh3TmZlcm56c2Jtc042?=
 =?utf-8?B?cHlPbUcrUzRqUkhPNmVPSjRCdHJDeDNJT0ZidjZHODFSZHZLVVRsN2diTDNT?=
 =?utf-8?B?ZTIvZDN6aFhHSmVrS1pWVGhoOTdBT2tIcWdvb3o1UExOY3ZQNWtJY1JQd0Vu?=
 =?utf-8?B?MHpCSU1oUzExK2dyZ201cUtPb0d5b1lJQ2tJaVJtNWV0S1Mzd2poQ0xlQmFH?=
 =?utf-8?B?U1FiekYxV2wycmxENUFNc1hFYVV4NkJqWlFaYzB5WTU3V044cEpqdEoxMmVt?=
 =?utf-8?B?bDdyT1hnSFM5S2FMMVV5OTFneXBkY3R4LzBFOEF5cW9sZ1U5YVRNNEwzUi9a?=
 =?utf-8?B?dlNJT1RHQWFuVnlFVmhJMXZPdU5jd0J2KzZmWFBnMEY0SGZzS1YwVlM2ZFdY?=
 =?utf-8?B?NUNwLytUY2JOcVozakFOSWh6eSs5UHVtZVVxamF2OUVKNzkwclR5TGlEcWdR?=
 =?utf-8?B?WGpyb0d1VUhLSjlHRS9hb2RLcjFxZEQ5ai9wYms3Z2kzMFYzWGowTGZrZ01T?=
 =?utf-8?B?N2t0ako4QmJYNmZ4QmUrcFplbXpKYTVBREV3eXI5bnJ4eU5veU13TkRCMnlx?=
 =?utf-8?B?QmZmajlJemVhU1JPY0lEbjRGajVqd2NsTUp3MjA3WXNCT1BOMkovUS94RWtm?=
 =?utf-8?B?REZjM2w2YjRMdVpjZWNyVXQrZzl0cDBVb0dZL3NodktMR0FUMy9qbVZ0M3E5?=
 =?utf-8?Q?sMG2VLpXeZ6HwHIytNRH5VKMe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa54107-3791-4732-9d9f-08dcbaa75d33
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 08:18:36.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9zMvbvzMvjqNcl98DX1wlhJF4S5ldspol8WovHOsE1pnNFwIM6v67LkyWF9NiG7noE0pu4fvpu9pnkwOxPULA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
X-Proofpoint-GUID: EDVNKnDj7gD0NcS_03sTQ3nzqWj-mmVs
X-Proofpoint-ORIG-GUID: tEHV3BNa7WaVZNwwyzLogxCC4PUPYl09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203206

Thanks. I've sent out V2.

Regards,
Qi

On 8/12/24 15:53, Alexander Kanavin wrote:
> A better commit header would be:
> 'json-c: use upstream texts for SUMMARY and DESCRIPTION'
>
> 'Change' is vague.
>
> Alex
>
> On Mon, 12 Aug 2024 at 09:01, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Change SUMMARY and DESCRIPTION according to json-c's homepage
>> https://github.com/json-c/json-c/wiki.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/json-c/json-c_0.17.bb | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
>> index 20bcece768..92ab612175 100644
>> --- a/meta/recipes-devtools/json-c/json-c_0.17.bb
>> +++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
>> @@ -1,5 +1,7 @@
>> -SUMMARY = "C bindings for apps which will manipulate JSON data"
>> -DESCRIPTION = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C."
>> +SUMMARY = "A JSON implementation in C"
>> +DESCRIPTION = "JSON-C implements a reference counting object model that allows \
>> +you to easily construct JSON objects in C, output them as JSON formatted strings \
>> +and parse JSON formatted strings back into the C representation of JSON objects."
>>   HOMEPAGE = "https://github.com/json-c/json-c/wiki"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203201): https://lists.openembedded.org/g/openembedded-core/message/203201
>> Mute This Topic: https://lists.openembedded.org/mt/107852568/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


