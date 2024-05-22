Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E47C25B74
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 02:25:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.763.1716344742788421884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 19:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5872d61a9d=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M0qJDk015597
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 02:25:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y96h881x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 02:25:41 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44M2PfM5013567;
	Wed, 22 May 2024 02:25:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y96h881x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 02:25:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z24OIMOufVjRpV4gDGDC61F75q+77sNXV+DWCUhMNmBJ6klCgt5+p1EgLn5dSWU3hP+PrOlT6VdhKSenKkowMBedPApv4W1PSMf9kcEQr6kBgZBfK+3JEwd2EaBKoQceOdpQho006ImetnOEOy2pRq0x+nLR0m733u72jjJppEUiEH1+3NExJHERDP2wqQ+YUOKJCWnGProktB2AmTfSbC+Usjr4r79RX0Y61AmrFCWaNOSVnu3dFSZL5dPiudw7jSXmI+XBgyYMxQg18DYXb+3eKX72JxqWSjx3o7sC4vecmyY5K3B5+kJxRN0K+nBxHi+9jBp9kUbJyKXBJxEoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6kfkTd7uRn99clusXzSXoouJ5gAXbMbXjnSZGAlosQ=;
 b=WfdcgjV+wTrJ4Cq8SLF2WdtpZBm0kLWMrs2RsrhHvoDDtgaAXFc4QRkL71ukbVjXcJ3QnACNLM5h3bnYQWYzAyxHf3KWzlVZewqIiMtPejXQ9tEAleLI+2QEP5SbX5yZvl3kbtuJX7XkO4gOVmFL7b/zdLEBugAxheqjnoZsUQjwolLwD5laMFkHDD7YYP7pJ8fuRjWNN4TSD/taV1jLyDj766EIm8uXU2Jus1VPpFB3G8/4+T3nSJd5GEXNiVcSZyH7Ul93eNPl3RZG83tf1vvZY0zvqfyL3rOOHiFj6h70gQe3fevkUaZ2x+VqIAadT+L1snxOyR3XiQB+Sgwwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 02:25:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 02:25:37 +0000
Message-ID: <8f196355-3413-19fc-5445-39f1631911bd@windriver.com>
Date: Wed, 22 May 2024 10:25:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH 6/6] kmod: upgrade from 31 to 32
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240520081040.2380736-1-Qi.Chen@windriver.com>
 <20240520081040.2380736-6-Qi.Chen@windriver.com>
 <075105cafcddc506ff77f43791e330d1ae12485f.camel@linuxfoundation.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <075105cafcddc506ff77f43791e330d1ae12485f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SGXP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::24)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e58644b-07c4-4b27-9c06-08dc7a06771a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OForUVpvck5VdERkT2t2bEZwK1JmUVp0eUNJOWNuN3YwSy9FQ2dnc3dUK3dC?=
 =?utf-8?B?K2ppVDVXenRWUlRiSVNHQ0NVQnZhSEtLRkhaVktObTduVlRIL0gvWTFVNHJU?=
 =?utf-8?B?NHVXRmlhUWFjK0pKL1pUV28zOTN4L3NCZTN1TEt1WlBsdnlzVkp6QUplRFpK?=
 =?utf-8?B?cXRmeHRhVFFQR0FpUzZQdXFTdkNSbTVuQVNTamo2ZE9lcGYrSThlb296ZE9r?=
 =?utf-8?B?akwxZFVQdEh1NEh6aWV2RzVNeUMwQitCS0h5MVZCVjZuZlk1RS9vOEVMY3Ft?=
 =?utf-8?B?SGxBRURsa0VDbXZrYTRLeG1PeStaRWZhTnBDUUljcGl3U1ZkOGVNRk5KQUNX?=
 =?utf-8?B?YzBESTR2UFRPVkdWUkJacTBqcG5TY1FZNVNVeWZ5L0tJcnFnb1QxOS8yWGd5?=
 =?utf-8?B?ZytybzhvTGhmUy9Fb0dsdUdNTTZycXRKdXlxUFpVK205YXlVSFRuUjZiNDZ3?=
 =?utf-8?B?elZEcUN2TnNzN0dRSFVWMVIzNG40KzlFajZOT2VYUC9sZ1VWTGgzTzIyNjQv?=
 =?utf-8?B?cFJPVFdWMWxBcGF4SmJHQlhGZ2VranFtdVp6WTZPZHpKNUt1eHI4dWdCSGpS?=
 =?utf-8?B?M044bTNUYW51Zm1ZQWN6MjlHY3lJUm95SkRiV0l5QTNiMkJ0dmRoUGx3cXpo?=
 =?utf-8?B?VHQvNkFnb0h6Zlp6eWdKdFpUdG12MURDYkJrdUh6bkMvc1hWMlFXd2VEdElq?=
 =?utf-8?B?a0U5OHh4NUJKSzVmVFZyb3pkQzZRd3FQZ0ppYm13NHpTd2lJTFZyb0VVdTYy?=
 =?utf-8?B?ZHpkVVpwa0Mxay8rUjdSbkEyUGhzd2UvMDVuaWZKRjF4SElKai9wM2xVTFFa?=
 =?utf-8?B?TGRUcmpqblNKYmJ5cDhMaFRJU2hqaG04WlFMT0tKZlR5YzVjbE1sTnVPQUw0?=
 =?utf-8?B?RnhHUFNqNlE2dUJ6MDNqWW1tUUNuNWJHMDc1VGJrQ3VkYytXU3hNOXhZK1Ax?=
 =?utf-8?B?Z2RqLzRvbVM5TzJPaEpoNHkrODBKY3JnWjJMLzEwQ243VlA1TGxJRW9hRmF6?=
 =?utf-8?B?RkNTNm5xNUM1WWhwREpOallQT0s1aGFCVGpwcFFrbG5icC9FcGJEdGVwQm5s?=
 =?utf-8?B?YytkNGc2by9IZFpwL3RFOHJLN0FWekIvZTkwR3M3T0FMNXdsREQxanFjMGFR?=
 =?utf-8?B?NkswZXdVaURvMVV3bTV1R0c5NTVCNlVuTDFQcFpFWDlSdXFocHh6c0tlVmk1?=
 =?utf-8?B?RnNKMUMyUEk1MmUwQWVNM3ZkTFd3WjBKT2s3TG9icUxTeHVjOStxb1YvQmVl?=
 =?utf-8?B?VzJsUTVuT29ib2xPcERlM1ZIY082bHg4NnFBZU5sbEt1WGFMK0IvMjh4eHV6?=
 =?utf-8?B?SjVLL2QvOWFJVlZEYTZQcGJseWczR0tUR2V4WmlsVEVkVzNBZzV0M2VlaFE5?=
 =?utf-8?B?bjhKQXYrdkREMUxYOFdzVDFkaWhZNm5kTThsU0xVVGxvYzJXR0tHTWdURjlk?=
 =?utf-8?B?WGdrbkdEZ0kzSnJxV3l4YTZSWHA3NGNvSkNGL0wvS1FjNDdKMTVZVEpPVUNs?=
 =?utf-8?B?TC92SUpJU01Waks2K3VDTlRDbkZ1ZU02b3RpNjZjbnRteE9QRGdONjk1SmVt?=
 =?utf-8?B?ZUlpRWpuUTFOeUFGZDdGc0VGbVo0NmVYcHVFNmwxT01NSExVTTUwVVFOOVNO?=
 =?utf-8?Q?prNYeYgk93xcc931syAY46IkzD9PuFaKIPLeYBywATz8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHZkUko3T3Q1NE54VUpFMk1pRGFjbFFaYStWelErWjhHYW9NZ01rdkZLcldJ?=
 =?utf-8?B?S3dMR2d3UktpbXEyclorU1BqaDJtR29DZlQwTndFTTBjV1IxbUM5SmQ5bVZs?=
 =?utf-8?B?emN4VGU3SVIvSHFkZ3hQRUdTV3RuNHcwNDBkMytid2NlWDBoV1FnTHFsNy9V?=
 =?utf-8?B?M0tZbTEvZU9YaVBwWVJHb2NlSkFpbW9ZRE9sc3F3L25COEtaOVhabi9YczVJ?=
 =?utf-8?B?ZitFNDRydE02VjFWZ2pCNkpDYVJwaSsxY1F6RWRRendSblBvNldrdFJLTHU0?=
 =?utf-8?B?Sk1wK0kvUmJZbkxmanF0ME1IeTQ4MUMvR2Rkck5iUEdzU0FZRld3eU83RW5S?=
 =?utf-8?B?Y0IwQVhyTHh2VmNJU3MwRHlJZjU2dmFTd016aXVTSG5FanJBMm4vYVBYWFBo?=
 =?utf-8?B?M2p3Y3FtV3RZaUExMUlGa0g5WDZiLy9RL1pXZmNzbEdXcXJwTTJ3azhHWFdy?=
 =?utf-8?B?eXJ4c1pOMFZybjhLVUIvbHQ2V3dtdXd1ZjF6dUtaVHc4MFN3VE84ZVovbHVL?=
 =?utf-8?B?UE92QkM1Z0FmL25DUHZkWlB6YmUxdElqazUveHRXenVhV3pKNzhtbUJXaVB1?=
 =?utf-8?B?cFpXeHZnclpaZ0d6QjRLY1VzeXd1VjlmdE1iOUtraDh0VDNMY3NoUDg4UmpY?=
 =?utf-8?B?NGVCYVBnbnRZV1lTV3lzNVE5aWRmTUplVEJtUUkwejR3eWc2VVh3eVUrNWdm?=
 =?utf-8?B?VzErUVdENjlvS2RuODhOdUVRT0swcVV0NkI4REFmOHVpOE1HazErZER4SXpn?=
 =?utf-8?B?YThYNW5vK1RLRHd0QlRLWGJpSXhYRFE5SllLV2NLQjlPZVVGWkw0MGp3L2pU?=
 =?utf-8?B?MDUzS1V4YldDVjg3SzJHNG0zTGo2c2E0bkxyRnFXcGdxZDQxNzEvMEJtdE8z?=
 =?utf-8?B?NUJSVGN3QlFEalZpRE9BMUFMclJmNlp0b0ZTOXRwTXRNMWc2UGFsc0Yxdk00?=
 =?utf-8?B?RkE4dmQ0d0VHZ3QwK0ZITkd3VWhaZEQ5L05TMVhwZVRkclFMN1RMNUFhQTZM?=
 =?utf-8?B?UUZ6QXVyT0ZOVUZYR09PUlR2Wm1oWU1hNVYvNTlrcmZCR1FrR2gyOUFGdG9i?=
 =?utf-8?B?V3BWSVVkNHVnd1BPbDZDMWFrS0FkV3p0YmsyRTVtQXUxdGc4eXd4Q2FaTDFV?=
 =?utf-8?B?TXFSZGZ5UGdNc2NDMks4dEtRcEpuaFhVb2JkekdZZ3kxaHhva0Q2M2pQQmdM?=
 =?utf-8?B?cUVEazJuNERIRzRuN25FRmdiaXhWc0FDUkZ0ZFc5SnIvS0t3a0N1SG1KWjBn?=
 =?utf-8?B?YmYyaXZnYk9ycVRoQXBKRTl2aWxnbjA5UGlQYVd4dUMwMGc4ZmNlbFFxSUpT?=
 =?utf-8?B?dURRRi8zeXJxVk5LTTM4RzFOeXpMMkNpT3NxNTBMMTJGcGRadmRpNHBoekxZ?=
 =?utf-8?B?bFA4a0xkQnV2ZjNuclhVRTcvSU15UWc1SkhVTzMrSE1WQ09Sb1lVejVkaHpB?=
 =?utf-8?B?R0xSUmQzNyt1TXlWNWx0NTdUMndqSnFkYm9BZHM3MUtPSGhONThWalVwRUxt?=
 =?utf-8?B?TElPblhQdUxuc1dCTFNCRENKZGlORHhyV2lkck5YMEVTazFQQlJBZmRINlJT?=
 =?utf-8?B?THpZYmNlUklGWG5QRWE0MHYzcmZNM0ZRQVRHRENHblByK2JTT3d5aldkMnl3?=
 =?utf-8?B?Smdtem1QN0hWN3FyMkJzbmY0VUFxeWZlZnRrUmgySHArakRKL0NhWktqYUw0?=
 =?utf-8?B?b0k3TjhHME1YOUlxQWp0cnFsUnV2OVBhc1UyYnV3YWRhVWhpNDcwaG1ZUlZt?=
 =?utf-8?B?YVNwa3NzczdYR1B5YTlibGlucUdEallEYmZpS0MvT29mUXVKTHVpcTZLUjl5?=
 =?utf-8?B?T09yZ05TMlplRk81Ujhjd0ZMcDNEK2h3aVZ2UEk2TGxtZHAwMUw5dFcwbVNu?=
 =?utf-8?B?NzBYNlNwRTkwZUpwcmN0aVBSREt5c2h5VG41YnZkTTR5Ni9qc1FxTllLSm5E?=
 =?utf-8?B?NjRTYWNFQnBkajVHVlN2NXdNcHZ6c1RMVDVLOG9zS3dhT2JxR041SVQramxE?=
 =?utf-8?B?NlpXUVBKaEVOeDM0RmRTTGF1bHZOSXRVSFYwVWVQWmZadFNndFAyazlvWXZY?=
 =?utf-8?B?TGhBNytpTVNYTDZoQmUzT2FaeGtnVXZxMjBFdDNUWW5kVVRwdjVraUFsZ1p5?=
 =?utf-8?Q?6f4y3KeQ4+4+mIeg2dTCkS0LT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e58644b-07c4-4b27-9c06-08dc7a06771a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 02:25:37.1254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FI8qRB6sqNWfn70pCdY+fiLzrhSoTnPzg/rYM75yjbQJkwXrQXeGCpew5D19J+oyG16MuNJu8zs97kJVg6fy0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
X-Proofpoint-ORIG-GUID: mfFk2WBT25P-C5jqyoa-NVqbjOLk8mLK
X-Proofpoint-GUID: y8LA3Jzz5BwUeLRJ0lK68oUOnMJV8d3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_01,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405220016
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44M0qJDk015597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 02:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199679

Thanks. I'll fix it and send out V2.

Regards,
Qi

On 5/22/24 06:26, Richard Purdie wrote:
> On Mon, 2024-05-20 at 16:10 +0800, Chen Qi via lists.openembedded.org w=
rote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> kmod now installs symlinks in 'make install'.
>> https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?
>> id=3De98cef6f3f8cd6f8bfb26d147b2c209297453cca
>>
>> With this change, we no longer need to deal with the symlinks in
>> do_install. Besides, as upstream chooses 'bin' instead of 'sbin'
>> to hold the tools, we'd better sync with it. That's the reason for
>> the sbindir -> bindir changes.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  =C2=A0.../kmod/{kmod_31.bb =3D> kmod_32.bb}=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 +++++++------------
>>  =C2=A01 file changed, 8 insertions(+), 16 deletions(-)
>>  =C2=A0rename meta/recipes-kernel/kmod/{kmod_31.bb =3D> kmod_32.bb} (7=
8%)
> I think this is causing libnl ptest failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6437/=
steps/12/logs/stdio
>
> https://autobuilder.yocto.io/pub/non-release/20240521-26/testresults/qe=
muarm64-ptest/libnl.log
>
>
> Cheers,
>
> Richard



