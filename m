Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A959EC27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 05:08:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34535.1717736914532240857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 22:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6888aec719=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4574J3aP023220
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Jun 2024 05:08:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxe2p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 05:08:33 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45758X5B026866;
	Fri, 7 Jun 2024 05:08:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxe2p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 05:08:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF4wi0Ui9AS9Kx9cRxQikxVtgbvVGwtN+/IcBMfsE4yPMv9Vq/3Z4zKNSwAClsgVE45Xdl0xg4t9chZC79GG2vzL3oizzmDpc70dRT4M6GqC1FgEz9CPATNBzhNcjAC/0d4qKME9uKuma2RZwdUIrmrPsJHwVxwQRasATPcfY8T33c8HF79Vl0YefC+uP6uvc06DexPndvvatlGRpnvcKY6CJVX4F1/ruEE97MLzoVzWr4I+pQQTV+Gpz50sfxdsSkeYtuhUd0Zb4LUc8GyordbZ7xdXrCWoB4jOHWFnNlCKzTfUlRcr4kMKiN7CDHpT7u6ahZTfXxUJUiwf/W+2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OihtBDaK6rxD6cAzOYV0J6G5fcgJEn+e7vyyjQTPWfE=;
 b=Q9UnnNVQa+RNFnYsZ2ua1BmULbM6H9i8mdPGbnfCF3NUUjnKJX0l6pewVtd62JdwoNjzUu+wej/v4J3qg+0v3vYx+FZFiy2ummpaH+LO+Cn0LxfG4Vm6/p5pM5gdILrWEJU9ZHQPo/o5Vbyp1iD7zvKu5rG0mWxGf9W9OudXKCq3ojhTi67UHiBPaUs73kbktudpDFs+FE9VBDTdLYB+wk4yBFo/8wK88rGoq+RuGn089T7NT6MkJ1vGQLRFjjc6TwxpxO2vCmHKCfCfEgENRdpOzNEfhyws5H6eA0sHdCigsKzimKI57zxjJWB5an3BQdXpVC4mqN8BrZFI+LvD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Fri, 7 Jun
 2024 05:08:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 05:08:29 +0000
Message-ID: <0cc91c9f-32e7-badb-8b77-681fdb4e8325@windriver.com>
Date: Fri, 7 Jun 2024 13:08:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][RFC 0/2] Write out file manifest in do_unpack
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
References: <20240606140622.2494668-1-JPEWhacker@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240606140622.2494668-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0353.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e344c50-fa07-4258-8d72-08dc86afde9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnFDRlNaMCtRWkZQQ2U5OXNRbDJRSjJUZTl6SkJYWVJQQ1FBRC8zMnJDOU9z?=
 =?utf-8?B?cDlVZW9ERW4xQjdycFZOSnNjUjJONHh5dWZGTW9NRThDdlNFNHgxQnlKVzM5?=
 =?utf-8?B?eUFLcjJVQUlJaC9kTjVwQkd6dHVscVh2SGhUbHFNMy8yNmtuSjBnZzNFR05o?=
 =?utf-8?B?RE1VdFhucmJvQkcrQy9YSjBRVWZlYWkrMXM4K3BBYXB1WEduQ00xSUMxcmlE?=
 =?utf-8?B?MEV3cFZRRlFkK3YxYkxHZ0Nqbjc2ZWlabzVZbUljdm5vZUNXWWFKTStuRVQw?=
 =?utf-8?B?UWMyY3l4RG1hS1pKUVBYTmJWeDMwYjdzRHhOaEFQcnRRUkVTT3kvYnV1WFkv?=
 =?utf-8?B?dkpjelRHbEIva1pjbFdLdFErTThrd0p2VzVrQTBiVUZ4UnNpbzAzL2ZTYkZL?=
 =?utf-8?B?UmZaVDJDODArVU9FM2RCWC9tOElxaytuQjZjdUx1UEJNNzFLdWQrcEl4cW1k?=
 =?utf-8?B?L05CNVJtbUhyS1p3aWk4RHNkRTNYb1Y2U2c2SUljeXZVM3lFU0V1dzhZVFU4?=
 =?utf-8?B?L1BSdFNtaTBZSnhLaVRqbkNTYlVDN0h5Vlk3TDdoZk1ZSG9sZU95a3JsZzhG?=
 =?utf-8?B?ZC82bndDQlA3OWRlVVk3bXc5cTBRZXVWcjBiUi81SExSc2xFNXBiYjZPSWt0?=
 =?utf-8?B?dVhPL25ubWhiNER6OGpSdlZWMGF1QVZncmNGWGtwbUVQYk04TWtjdlhDTy9i?=
 =?utf-8?B?MnVFRmxMT2RiN0FITTZ0TUxMSVRXUVlLeFlTQk5yK2dGRENjcm1EdTgvZzM1?=
 =?utf-8?B?QlpZV09YZW5SQXh4a1NrSFFQR0U1UWgxVDdIQTdOQVlRNVcyTE1Ed0l0UFNG?=
 =?utf-8?B?UXNkVmZtdk41M2YyTWlZeG9jMlFwcDZ6MEkzRnFYdFN0aHVWN3hETGFwZ3hU?=
 =?utf-8?B?R2lNQ1lyUEhteGJmMTJPSmZHRXM4SjV2ZC9XNS9KM3FSMU9HNnhoK2x6c21T?=
 =?utf-8?B?RW1xTHBFeWxJcm41TlQ0SVM4Nm9LeSsrZCtxc25xeEI1bTZkd2s5alNtSVRC?=
 =?utf-8?B?cmZodUFMbXFOTHgzc2hHTG1pV25iMTZ6dnpPVFpZSnBQa2liYzdyMG1yK2w5?=
 =?utf-8?B?bFJ0Uzg3ZzNQRktaMlhEZGcrMzB4bDV1MUdibTRWWDlZN2VOSWdnUXFSdEgv?=
 =?utf-8?B?L1l2Y0J0bGIxc2w2eXdPczNiYTVmK0ozK3dGNzNtaU9iM0Y1WGFYaHZGL2E5?=
 =?utf-8?B?b3p6WkJHSjg5TG9TV3RieWNrejNhS3ZNYlI3aVlwWFdEaXJoTUw5VGVZdVhL?=
 =?utf-8?B?ajd4VWtUM3dGaUhqVDVMcDRXdmNKWXkwb2pmNjNGaFZGZitDWm1MNFBsT3hF?=
 =?utf-8?B?dnFhcnRJa0RTNStGRmNNaTRPVUp4dzJKNzY3T3IrWEloRTdZc3ExVGp6VnZH?=
 =?utf-8?B?ZCtPbGZhMW5lTWlhOVU2allZWlJPTkNoVVVMU1RMRk5BK3FBN09HZUtTVGFC?=
 =?utf-8?B?bWFSUkl5dzZuYVo0OE44WE1VaU84bmFZNVJmZ3FoYngwY0w1eXByYnpGc2Fm?=
 =?utf-8?B?MDU3alEwZUhCYUI4SXU1K2VvVmNqZ2tMNGw3ZFprUkk2MktqVHZUTzRiWU93?=
 =?utf-8?B?MmlTcWwxOFFadzV5L2V4dmtFZ1JBejhWdG12TmwzOGs1WHdDdlFXK2h5cEtI?=
 =?utf-8?B?Q1RFWkROamgrUTRhSUZEUTBHY0VQU2FZSkhhRHFtbGdSaDlZWnJkQ0NHODVQ?=
 =?utf-8?B?Slp2UVlmZkJZZU1seS9NdmdoKzJ3SzZnZ0diK1dPend5OEtXb2EyUlJ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHNBMEc2Mm03QmhlcEdOazNFY3kwNHYvazJZcTV5aHlxYU5tVGN5ZjVlenJa?=
 =?utf-8?B?d05wV0R3OEY5Mmo2WWZUUHZ4MTkzSG0wSzl3SEJJdzVLK2k5ZS9DQWJEeHA5?=
 =?utf-8?B?dk82WisyTVM3d0RPQmJiZTZlbU04Y3hSZ2xPb25yaFdzQ3R2RWFwQUVYUlB2?=
 =?utf-8?B?RmVBYzV5K01pemY2N0tLNWMzbXByTzI1eU8zZWxmS2dHajkwMGdENG42WTVu?=
 =?utf-8?B?S2RZYmI1T1hqQ1NXNXBjVEIyVjFaaFFEMkZDeUtodWREWXd2OEtsSWFMTjZB?=
 =?utf-8?B?bHVKZ3g5ZXdDQUZDYk9COUtWYVpqYVR6SEJEeDJjRkJzUVJkam9YQm1ENkJy?=
 =?utf-8?B?UlM1eFhucS9iNHZjNDJ3UlQ4djNKR1I5bmlSUFN5TjFlT3pOMmRnZnp2Sksx?=
 =?utf-8?B?MHYwd1JCUUFlS3JMVGFjODNyWS8rTkhqMEROUElleTYvVEFjZ29XRk1HcU5R?=
 =?utf-8?B?WG9Wa0FETTI3YU5VbTBncFVma1NaNHd0Y2ZOTHFmZ1hPUVY2cU1CSXdmVTZW?=
 =?utf-8?B?WWVOLzIyNmRkQndUSkNDZ0d1WjcrdmMwdlhQUFFBaFZMdWF4c0lFOUQrTWVK?=
 =?utf-8?B?NzVPKzNJeWFJZW9pNVVIYW1EbXVTQm5XWGx2M0pxRWRQUEZKZ1VyRGI0ZktT?=
 =?utf-8?B?NkZzVndyQ1V2Wmx1Tlh3NEJ2a0VBU3B6NHRLYTBDV3dYZy9haFh0N1BrUTgr?=
 =?utf-8?B?SEZWNEZ5RDNLUjBmejlyZElybnJnMndPMloxMlJMUkxKOU1aaTVrK3RzK3pk?=
 =?utf-8?B?TzNsNzI4Ti85VURIZXhhYWptUmRIbnRnb0tzRjlXczlpTFczdkJPZlpHNVdw?=
 =?utf-8?B?ZG53OU1TMHZkSXlveVVxMUtKNGlyS2dNVzFlRHlPbjUzTWpUbDFyc1dxaTBJ?=
 =?utf-8?B?NHd1MEl5enB2NHdmbGFMSkl0VmppWDVtOEVQY25lbkVGNEpsak9XK0RKWjZK?=
 =?utf-8?B?NmVGLy84bHRuS1lEM2NxUGc2d3o4bisrMDNkQTgyN2lZVHk4QjRoN0RHYklx?=
 =?utf-8?B?b29ta0p1YWh2NVh3ZEhYWVBqdEFPOFR4WXBURlNhaFF5dlFtNnphYjBhK1p6?=
 =?utf-8?B?Y0dyaGkzMkp0VWdJbDJBcjd2S0Q0RzFUb3ZvMFpCZ2pSMFR0SlFiQ3I1Q3U4?=
 =?utf-8?B?YnBJUkZ4QTZtTk1qWW5zV2dRUGRzYnI5Um5sT2hwVkN5WWZDNHN3WW5GYTFX?=
 =?utf-8?B?S1h2NHNjQmpMejJqL0VsSHREbEswdWR2bVBTeVQxeDFwd1k1R1RMNStIOHRw?=
 =?utf-8?B?UDI5K3VhRHQrK0JiLzFSUW5tR214VTFWK0Q4MHQvajF3NmdSeWVuTzNFZ2lY?=
 =?utf-8?B?YitOZnFkVXJVNE5KZjlRdHMyOG9CN0JNYjROQUFxUHgvaGZ3bjJjd0p0YnBS?=
 =?utf-8?B?VlAwc1J4UVlOYXR4YkNES1FDcGcvS1AwNHgyKzdrOGc0eWpqWmw5U08yWkFY?=
 =?utf-8?B?YlVXT01ldUhOcXNKa2ZEeTFmNm9XTlpBOEkrWHcwN09ZRnQvYlJWTVlxbnN5?=
 =?utf-8?B?UjhPbGF3U1NkQWZsMFZ3cTF2RmZySjMvYXMyejE2QnRhalpVQnVhc2swOXo3?=
 =?utf-8?B?dTUwY3pHZzlhcFdlaUdnZU0vNWFGM1BTNUIrOXdXL0YzVkJ6c2NHRGlQbTNj?=
 =?utf-8?B?UWovb21Vb1NkWU16NkxmRDR2OGRtbzl2S3lTZ1BOZjcxdTVSUVhHbVA1QmVq?=
 =?utf-8?B?YWdWZmJ2bDUwZDE1eTlPYkRmc25VS1JwQXpnQUdDR0VkaGJkN1F3bWVhVmM1?=
 =?utf-8?B?MTNkNDFFMmdTUEVkY3pYSCtWVUtzVEErOHBZcDByOGxxWFR6Y1ZrUTQ0S1gx?=
 =?utf-8?B?dzB1ZVIwYnVXcGNPcjRLRERvbktkWkFDS0JncTVGczJUVDJIdU9GMUx4VWkw?=
 =?utf-8?B?S3NmcDAzdUxFa1IydFJLekNsUllnN0lpUkZxczJJTVp2VmFmMk40cGFSRGNO?=
 =?utf-8?B?eXJCQVR4T1hMRlZkZk5PaUt4M0JNb0lBMXlsWVZmZkJxTkFBTUV2ZE91MWJF?=
 =?utf-8?B?bUVEeGlMd0l4MUE3aHV1TlMra1VVZmRVY1RWOWFDekVQa3A1OU1HbUZIS0Uw?=
 =?utf-8?B?SU9kb3psNi9zeXFkYUwreDI2K0F0ano2dHgxeFdNR09Oa1dRelNZZ1JKUk5w?=
 =?utf-8?Q?zse3qLVrRKFa0uTAnh8J2rodD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e344c50-fa07-4258-8d72-08dc86afde9f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 05:08:29.3188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDUcJbpOK6/lAn2LZvZKZqkUNZckSES4qI2229hGiyQtf67JpE0TjNxMwxzQuj7evQ6qICup5Z5hfSxG199NRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-Proofpoint-ORIG-GUID: _ilSp67ynUhLkaGmjlTugpnO6q7H54Ya
X-Proofpoint-GUID: CJz194BNd_i1y9445xfb38oO0Omf9Bni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=658 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406070035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 05:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200422

If I understand it correctly, spdx uses patched source, so in order to 
be potentially used by spdx, the function should be called after do_patch

Regards,
Qi

On 6/6/24 22:03, Joshua Watt via lists.openembedded.org wrote:
> This patch series implements a mechanism for do_unpack to write out a
> manifest of unpacked files, which is now possible due to the UNPACKDIR
> changes. This manifest can be consumed by downstream tasks to report the
> source files for the recipe; specifically SPDX can use this instead of
> the current behavior where it re-runs do_unpack on it's own.
>
>
> Joshua Watt (2):
>    utils: Add write_files_manifest helper
>    classes-global/base: Add manifest to do_unpack
>
>   meta/classes-global/base.bbclass |  4 +-
>   meta/lib/oe/utils.py             | 67 ++++++++++++++++++++++++++++++++
>   2 files changed, 70 insertions(+), 1 deletion(-)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200402): https://lists.openembedded.org/g/openembedded-core/message/200402
> Mute This Topic: https://lists.openembedded.org/mt/106523630/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


