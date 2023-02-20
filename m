Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2998C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 08:37:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8655.1676882222726015407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 00:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E+jKEkG6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1415283ec8=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K7fxJb007002
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 08:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XZVHBwBxmqwXo0+7YEPAx9/3knNx0+LY5tkP8S1ynSk=;
 b=E+jKEkG6A+Smmp4F7a55gdnXr/vysQQGhonkB7fVmJLzOKTcCUY47udHAaSdjSjhgV4e
 RDILRh2zPNRZJlqvf6DYvar0iunPF1BFzLhPe2IBjkH9smqZ1w7u9d6oQUSLZTnm/kTT
 9Xyq/FMZLy/lTRIKBEwa53ITmKljus8wNJrKe5MNz+ltcVIgNt1h5bBJaDIv78PO6Q5c
 7HvX/+lj1sN0MuvyMY1aCeNrPHkaAH4WzOZfR5v2Gqlsiu+dWOylhbpCmAqx+t+JG6kK
 MXwX68HatdvVLC/igvKIeGMCPBkUs9SddQ4NlGxLzo3WQT6YUSFzrPjOVSYhcUpa+isK HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3shub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 08:37:01 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31K8b19E027245
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 08:37:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3shua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 08:37:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEfE14/Bg/INsuMqihFqf0AQK3fwWc1zs/3Pm6otDVe1ngUEnj2Oa3FFsu0B00M9wRzAlk9LAmOHtYiKbhpyxkRtWmFV0AFlFEzkPy9v5fL5w5u3xGnogLQrTytxlDTFcA2VTErj9ZsSCmXVItAbi6isFAk4qlIOvGejQukp40Cl2ktSUZ5bdD1U2MTluS01itThuxwkdGTyd9fanIAKhpw5jSrMcvVKTEv3xeNLTuEfddjPSKz+Dl4v2Yg22YJ5JmVvWxUzbSujsMS//+6RUtQPDmIWz+TNpYvVR6F6/2x+5LNlVKsgijM6MuE4im2iayoNvzhPOwVtJjYYVk2kQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZVHBwBxmqwXo0+7YEPAx9/3knNx0+LY5tkP8S1ynSk=;
 b=NUTjcFY1gDehjhqKyHVvVZXQQF830fod2l8YA7Zvb0KjGmw1d4ZMHSsWpqVn70ddC8uCY4S3sHFMN8RLJgbPa1pePjDdNwAsipJVDUzn1+q1BJXQVnZ32qLnKKP6mlAlcYFSH9WdOWTpNl2xl9O+Lvz2PI2qpRTarOTpnejwIHvPO2zqQMO+TuZsMtx5nw71UqV4P0RM6QMzdrlFLk6Ok8esIsg6n+n6eyfaFznJfTdqllNsdbXQuGpNSgWYMNKhM26mKqNTaipqILHosK6ZN3uPvJq9yjBqXXk1pKSx4CpK7jWkeF0gzkgNcqC9R1XFMhLW7eiBPAc7EX5+5LWRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:36:59 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::d5f2:3e09:17f6:34df]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::d5f2:3e09:17f6:34df%7]) with mapi id 15.20.6111.020; Mon, 20 Feb 2023
 08:36:58 +0000
Message-ID: <19896460-7a11-629a-2483-634db3530d56@windriver.com>
Date: Mon, 20 Feb 2023 16:36:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] libportal: add opengl to
 REQUIRED_DISTRO_FEATURES
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
 <CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
 <44949595-157b-943d-f248-43b65c1e0d9f@windriver.com>
 <CANNYZj87-0q6qg19Ph_Tkhu5cF_n=Gw1AMVRb+_ch=1Eac+3RA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANNYZj87-0q6qg19Ph_Tkhu5cF_n=Gw1AMVRb+_ch=1Eac+3RA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 479899c3-4358-4387-542b-08db131da135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iVcKX+EgGvi3MEEGL/5M5ESVFVL9JRAnPiI4inHk2msG5SXN4Gg/GDR80i7GPg/8LBb53hSQPcuYR646RfNc5ktjf+ebGfLNCqlMgtXMdCeeeZAkI5CPkb/6A2+/SaGyl05YH/KhejAi9vQSS20CBWbjWDNDA9miRdFjIlEEKTlcJmlUQHw88CTOqX5P+hlg/znRyrcxL0MAH5WtKgDth9fpbhiIvhHiYaEZdggnob/2/IYnwwMzYwlpnMSsHBKhb//KhkzB6lcAl7Q0skT4dm9jizs0JspORGIXLtR+aU22lFDfo7muNU7HrBmpnEK3jPlYgS5lwz3MWLYos1MLWiA5vvnCawRrOACgYcptEaCLnzTzR/qqdgr8+hbwP+btdtEPgmAoBoZd0G0CQ36WfXjZklrO5ntlcdv0t74Sb9EiZRBeD3Ie47DfOPnLk4kxtqBDEZazjRQT0uGWbS0ExeMKkngdy1L8wyw9opOsTfuYG0Aob1EfDit4iftJfWzGETo8SFbTCZuyTUyq+tO5ubLasIKl53kxdVQLX4XMsLorwtRPec0AcvlB0WA2SI7EU0kn57YMO4ae6dWqJYHLKB5rHRQznlVJlTckOu+uJngLZLMAZaIwAeOcQH/eP7EhSQU6XyQqtVbBK/ErECYjT9vOBnLxgdIn3m+7Z9ygAWcv++qhO2EZj9DW2RcbBmr64f4+iRCPrsOGrdQog+t4DjMO4W665PLFxAqtx3tsRSA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199018)(86362001)(31696002)(36756003)(6486002)(6916009)(4326008)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(5660300002)(966005)(316002)(2906002)(83380400001)(38100700002)(53546011)(186003)(26005)(6506007)(6512007)(6666004)(478600001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?REZ1ZkZLVkcwR1FLZ0c1V0ZlRStaQ1lwd1hQTUNLYVpUOHdyMVpoVDBEUzVo?=
 =?utf-8?B?Rk92Y09zaWNkaDRkak5lZjJGaDE2Y0lsZDZtREtxcTZJcWZ1SUl4QXZvK2hX?=
 =?utf-8?B?eURxbWJ4Z01HS3V2TEQ5dnlKQnY5UXNMTmNDT0JRS0JDeGFPV1NtdmUwVitx?=
 =?utf-8?B?YWp6aVFmMEVhWXVvcEJKcWxzdFZodm8zNWV1M1o1MHV2bnc1V0RtQ0NjbVNk?=
 =?utf-8?B?bnlybFFibG82THZMaTZoOXR5dk5vL2l6MktjUVhaMCs2Ymd4TlRKV2VOaUc4?=
 =?utf-8?B?b3gwQ1NzM1NuS2dUWnZFY3Jpb1ZsSjFzWnNmOGxLa0lyRmgyM3diblJteXls?=
 =?utf-8?B?dDZhb2tMRE4yWWVSUFo4L2V2WGxYZTFKczMxQzgwWW9wVytCWDJBR0xndExa?=
 =?utf-8?B?c0lMd2wzak9tS3ZncCsva0wvN0xZTU5MZWdPcFNvQW44V1dSbXJuSStNZ2E1?=
 =?utf-8?B?L0EwVUxDZlNHbWovbWU4TFhTQWZycHR6VW9EdEk5ZTdGN2NTdW5zVU9hVkJS?=
 =?utf-8?B?STY5ZE5KNHkvUGgyWFB4OXBSbERTR2o5NlBOQllwYldqMkhJKzZuemNWUTJM?=
 =?utf-8?B?MjBUTWNOZnlOcnhYc2k4OU9UbmtFSXNuYW44aXB6QkdSdExPQ3piM0tsVnF5?=
 =?utf-8?B?M1doY29PQVNrRmpBTW9RbmZDS2d5Q1JjNkpTamUrdEtlNnFsQ2V4MXhXZytC?=
 =?utf-8?B?RTNjUVhiaUhmY2ZIdWlBK05VMldYeDR3VFhJQVZDVXZjT3J0UnFnTzViV1h3?=
 =?utf-8?B?SDIrUHV6SlhQNUZwblhyYWVrSVFZNHpudmtoTHlRLzdrUUF0TE1rNHEyNEgv?=
 =?utf-8?B?SnhQSStpSW8vL2R1a2VjSVExSHdhRElvVVRWSkRBM2UyckhxS3pvT1FUN3pW?=
 =?utf-8?B?NHFSbEc3R3JreGhoNG5nKzF4dHRuL09NOVRibTZqZ1VoNjhvbGJWN2lNTEdh?=
 =?utf-8?B?T0FFVlkvM0pEbTg1SWNwOHlFR0dzQzNaVDlKZ3ljSXUrSWNKK2JzbEhWeDFR?=
 =?utf-8?B?SGQvL1JsenlIb3M4SUZtc0ZmU1JkU2Fzbi9pOXlsTHU3RGVFU1lwRUxwZzBw?=
 =?utf-8?B?ZlZiOW9NWTVENmg5MWo4d2dTYzRXemdGaWRuZkovLzNuYzRRc3k4Uk94eU5v?=
 =?utf-8?B?MTNSUndLOEhjVFlqY00xekY4cExzSThkZHVjUlhqSHR1N2xlaHowT0NsWDRK?=
 =?utf-8?B?S1ZiS2gzV3BDbXp2cTZVbjBFcXZQdHNWemxRdE9SbldjQjhWa0t1YWR1ZGtH?=
 =?utf-8?B?Y1kySG1Lc1FadEZNcDIwbXBZZURxaUZ6NW9yT3I2TFJJMS9kYndOUnNINjJY?=
 =?utf-8?B?N3JDTDg3bS9tdzZDcTZ0Mno0VXh5cWtIQmVacUxkK09nSkJLczFnTVBHd2FU?=
 =?utf-8?B?Q2ZBRFB2Qm80NG1nMW10T1hhZllXeWVEMXVhcmtSVW82UUVId0tqcVl2T0Zv?=
 =?utf-8?B?cU1DNEFxa0tubGxFT2I4TnVibVBIT1BZNkQ3Szl4YTJKRG8xQXlRVExvU1Bu?=
 =?utf-8?B?L28vS1lyaVNrVE10MGtEekZwMUJKcGRtYXU1OFUzbHhpc2J4RDJzWVBCS0JD?=
 =?utf-8?B?ZEp6c1NTTmk1TlJyMHBiakxoUnpLSXg3V09GeXBjWEgzSnR0UkY4d2tHeTZv?=
 =?utf-8?B?UGRaN1kxUmdRSVVVRzRtTHVuODJzc2lZZzhKd3Bhc1V0NWtJZWpUa1MrYjBl?=
 =?utf-8?B?dTE0VnZ3OGtVbWg1UUpVQUhQNGtBb0xvVHoyVHZ5M3FJaVNMdDkybnlBRnh4?=
 =?utf-8?B?dHNLMXliRFJJQ2tXMWl0M1dTbVRXWEY1WCtvQXN5dFhuZ2dLRnRVSy9SSHlz?=
 =?utf-8?B?TGYxWXpmWUZNemFONWc3b2p4Yk1VUVlLaGVxbG1uR3U1OGt5VXBBek83VXdW?=
 =?utf-8?B?WFhyOXI2V2hFMkFwcVBSYkF1dE44UGxiK1NyWXBjTnA5bFVpeFFPVDViQW5v?=
 =?utf-8?B?eGUxYlNrZEN2WHl0dEZCYkU4a1pJb05YbUREMllQRmtuOHhkWG95NmtJbk9v?=
 =?utf-8?B?WG9yRjJDNkxYMCthNzFSM085azFtSXpzS2hZUkJZdmo3ZkFtSWZwdWZOcm4x?=
 =?utf-8?B?S25ERytVMyszK1Y4MU95aFd5Vksxa0hVKzNrTUwxRUpCNy9QNHFGVDhmN1pr?=
 =?utf-8?B?YVA3VUllcVVDMnNWeFd5cTkyMmtBeHd5anhnNC9UWksvZXk3blN5ZmlmWHNK?=
 =?utf-8?B?UWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479899c3-4358-4387-542b-08db131da135
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:36:58.4705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6qUGEj3SAsoFSgKc8NcBTYzzxF8E4fBrb0CxGTA6j/hWv+Q8Wglb2qia6sYqG5uDHR9yLsFOvmOotd1e1Z0qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
X-Proofpoint-GUID: D2nw8h1LOQETrSp1KF_Xv07XNQvy4rKw
X-Proofpoint-ORIG-GUID: wvrJD9hlsCeE4mcvtTTDUndJSlkgAAg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_05,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=993 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 08:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177396

Ping.

Thanks,

On 1/9/23 17:10, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Mon, 9 Jan 2023 at 10:02, Yu, Mingli <mingli.yu@windriver.com> wrote:
>> Sorry for noise!
>>
>> Originally, the patch is used to fix the yocto compliance issue. The
>> libportal depends on gtk4 and there is a line "REQUIRED_DISTRO_FEATURES
>> = "opengl"" as [1] in gtk4_4.8.2.bb. If not make opengl mandatory for
>> libportal, how to solve the below yocto compliance issue?  Any hints?
>>
>>
>> ERROR: Nothing PROVIDES 'gtk4' (but
>> /build/layers/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb
>> DEPENDS on or otherwise requires it)
>> gtk4 was skipped: missing required distro feature 'opengl' (not in
>> DISTRO_FEATURES)
>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
>> providers.
>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>> 'libportal', 'gtk4']
>>
>>
>> [1]
>> https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb#n55
> 
> Thanks for clarifying. Meanwhile there was a discussion in a different
> thread about this, so the patch is fine.
> 
> Alex

