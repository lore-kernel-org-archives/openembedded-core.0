Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2E9C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 01:56:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26481.1641779772394246084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 17:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n+ZDftJ5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8009caa430=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20A1msu4006298
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 01:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=mP0r5Z7CzJ+rvZjfRl/Gl8AN9I9Dmfcv3J+78ztK6zo=;
 b=n+ZDftJ52eowJ265rnAqgSc9QE71tdOmHuK5Cg9u58lVWh3AokOLVupRvoBJclCRb9MF
 Lls987H2HWTfqH+7MBcPGn2YAp+Wr60dKJeRk/M4K7eYQUVqPtdDFwN88G0uRY9CufvG
 zxvHRewgBZSwlzdrAI3+uncrju8ouZZ662uBNLb8s6pv/lbXFwkKxcv4c62TEGfo4GHX
 gDUuKuVGv2BGzEc+aam8jZB3hB/wG6lgAMWcny2kcPM7S8Iorrur+PfoxB4wNDWceHtp
 4nUujo2lNBLpb1CYUXzaUz5Y3ec/k/t4EqBx5M8RBI+i+ZW0cVcJCnNHbF9LmYjU5HHj rg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3deyu0124a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 01:56:11 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20A1u8N8021565
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 01:56:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3deyu01247-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jan 2022 01:56:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXe21j9/M8bz9JvXmdRuSjZwkRQV+86YADU9CZ2ROBP5o66VD/jL62DXbzINvjliAC+LvVAvqICVkv+fH7bhDdsLUIeC6328P9J4A/aOOdynqg70LJ2e7zofSTprKZBYR8/T9iVSg7xVBYOXRvw26HJXcML1oVWIo6hFjkeeY/Mb08rHgkbGv2EG961WbwV+5jQLqeI+6uMUjo9m9nbYHV/TZQk6aBQWjOqDYCqdnOAISoaLLO9S5CRqAIakxjPgW1EQ9qhFim5+SbhlcnuSgbtAuWLxGRgZ6a+ReqvJQ3+4DA+O26OqMA3cyLdzxRyraNqhGK5HwFTHue+ezaseNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mP0r5Z7CzJ+rvZjfRl/Gl8AN9I9Dmfcv3J+78ztK6zo=;
 b=N75JXgtA91YyFYQW5ilvzLU9Yo/nnKzmJsIQxC0nQ3H1SngL0STaxzWLHUsLf1ZVrdZo4c3PNzBGxu7BkB+oNuvh7Dx+LFygyABgdxhyBhsTSX8nRbI3VOlhWSdlD6F6VLr8QNHcMtzBf1H1c54WheD2QoZ86OEZ7whNZwXYjGkBr6A8bMTWcWAFFhBLmwuRPDL1LQK4xUFhpO0FwhjbA507IvK50MohuFwUdj0RPcm9mz0J4JHr4IvQDqPQ1PZOFJnH5J0s1XaTW1MREVVwo33SzLl0DRTlFlULVIBk84BeaplgK3yx5Ty6JNNfl2ViZe5hTxzbpX8BbRDAoLHx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 01:56:06 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::39d4:a247:159e:5693]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::39d4:a247:159e:5693%5]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 01:56:06 +0000
Subject: Re: [OE-core] [PATCH] xserver-xorg: 21.1.1 -> 21.1.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20220107151918.2061-1-kai.kang@windriver.com>
 <857c4913071abe70b2387967d8cba8e35eca56e0.camel@linuxfoundation.org>
From: Kai <kai.kang@windriver.com>
Message-ID: <9a68bf2c-6467-1bed-64c0-68b975743019@windriver.com>
Date: Mon, 10 Jan 2022 09:55:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: 
 <857c4913071abe70b2387967d8cba8e35eca56e0.camel@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------FBAA0C9DEEDAF5CA56EB5D85"
Content-Language: en-US
X-ClientProxiedBy: SG3P274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::32)
 To CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366ba4fa-c6dc-4c42-2d76-08d9d3dc5d72
X-MS-TrafficTypeDiagnostic: MWHPR11MB0031:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0031A70CEA5FB3A06073B14895509@MWHPR11MB0031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QMxXAGW+urFZEFK+UJbVQL83ukDuKn+ZZDNzhxIjwfQQuyoPcqWBMij+ARxlIFYAMAC8MioPzuBAgLIyI5vJ1QsfM+5b+ZYwIUdt43zvcLE3Tl+n4nESVW0G9Vq+X8samB9qyKWjibPSF9JPk26YYL/owYKJPZMBtpIT3CtPioktohGATOTJyXkDYQhqlIyCm82WQ9OGDqlL+dl0yXkKWYLr1inqn92DLiE3K0safPNoTFB2gOMVlgQpZMriukUbYlNQZNyhWMFXI1m6xc+F1jarvS4ozI3iSI2809ZU8gpbM34mRD0XhCQmPQ92CX+UgYO0o1TFuC0O0dU5Wq7y4BpYyIm/FXjKjVy4IuPqrzbwjX9Ypo7hXyvb333kRtpiPCyElKOI7wLTRn6B7bepnS6ra98oFnRxnn6DiHA+s/lRs4o8AObyO6IwdGTwgiq8RjPJJNb/gBgTjzKJMjkQlwuMLPXJzOQG1u+Oqb/1YaQu+ZcalH2MRKJkyg4nlDDLaaM3MPsuQFUBt/Yun+8sZKCSiSd+L1ZtPDZGWb856mWQDFkN6mvNgz9Bx/7hQ1tE91VLH+xV/8/hiCI8zddNdIoIc3XAnwJ8ZIwWt+kA2hjnqcA9aDzHTfqj2vwTOEcRLUVgaic3poi+8be2FSDkXVOgMbG3u6SbKeuWQeGGl9z4QrZngyBiL6GDeJBhL40Oku0WhO6EH2g2uXhYSAnSY1UHHNO8iaBxfbRW5EylFW6hGyljBkmUHQmy/yazWjC/lS3HoJ3RNEGkyeypWgbyyxiXmdvTmryiWkt9TP02Ew1OSNAEbw5qJSsC8WTxUbNB3CquZqZaUDMVN2JsW5ZxIpunWAfUf4ZEETotWLpmSYuaZgh4j09GURxdH065KUYR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33964004)(38100700002)(52116002)(31686004)(36756003)(38350700002)(6506007)(2616005)(31696002)(166002)(83380400001)(6666004)(6486002)(186003)(86362001)(53546011)(26005)(66946007)(66556008)(66476007)(966005)(6512007)(316002)(508600001)(2906002)(5660300002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUpCdkxOVkJyMkVybzNaTE1ORzc4S1BPcDNXTHcyamVkU1pEZE5tM1lPaFRy?=
 =?utf-8?B?UXhma01md1R2dUI3KzltNzFncjdKR21sK2s2QTNwdTRlcTNPR3dVU0YwckVH?=
 =?utf-8?B?ZnRTRFBxVE9jbmRPdG1rdE4vdFF3d1Nsekd3WU51VTRXK1RqK3dhcDVZQi9C?=
 =?utf-8?B?TFZEeUg3dnA5eE8rSnhiV1k0VVk4RitlWlZhNzVoeFA0alVkYjB2SDBIOVpW?=
 =?utf-8?B?OEZ4RGhCNGl0UnJxNkV2dzNCN2x3T3JyaEJmZ3J0MFlUcXBic1RwZ0lncGpG?=
 =?utf-8?B?d1BhUW00M3JqSDJVaytZVnJ4UUxGenpaVTBCSTBFb2EzTHRndDgzK1BJZXBh?=
 =?utf-8?B?WktEY0d4dHJRUVFYN1hGMU5HaEYrQ3dYWnlqVUhyQXdYaE4ydkcyZWNzZTlX?=
 =?utf-8?B?L2xHc096UlB4aVliZTJZdDEvUU1hTXJWNWRzeHBLZXRjVlZtZHFRcWlHR2Nx?=
 =?utf-8?B?aHdVajVKWkY1amdoYnBmSUp2aTJlb2F6cXNYSUZLWFJGTjcrbERhOEt0TVlT?=
 =?utf-8?B?YWVMb2U1b213dGV2UkVwYk5PZEtEMFNEK25ja1hVS29VZUtUSm4zM1VhUCtB?=
 =?utf-8?B?TEU3SHNQTmRRWUplY2M1NkliY3Jva3g5Y1hEdVJraEhJZVpKTFN6VmFicGsw?=
 =?utf-8?B?K2xqRURWdHk1K2trZlVNbnY0MTFmUkgybWl5bnJnQTBQSUVySTVJQnlqckpj?=
 =?utf-8?B?OVBqMWJOR1JKL2hOcTZGV0tMSk1BbWM4RmZ6QzJaZkxBc2lhaEtQMzNSakhD?=
 =?utf-8?B?TXhuRnpXZW5vS1ErcTY4cDdsSWgzMTNhTHFYWFJ6V0FhVjhPSTJnN1hlWDBE?=
 =?utf-8?B?dTFYK3NsTHo4V3pzRjN6VkxJS2Nmb0poMGhBYks0ZDZCM1Zjd1pIYzBlVTcw?=
 =?utf-8?B?K3NaU01kSXVXUGRyaThtUGVmZGMrYTE5RUwzY0dObklPZDY5SkMxRHdFN0lo?=
 =?utf-8?B?TGxVUDdRWlBWb3lMdzdDMWtsYkJYMWpLUVcvZ3pjRzB2amdDSE8xUnhld3VK?=
 =?utf-8?B?dDQyM0hVNkdMWlQ0elo2QVl2Z05iS2xuWHZpUGs5bWlBU3A3NU5VWUFGejBj?=
 =?utf-8?B?ZVl6aWdvVVFTQjBRSmkxTXlUTU1la1A0SUR6SHg5bXlxYWNOaW9oU2VsWXZn?=
 =?utf-8?B?RGZnSk4zZ1IweHg0TlAyeGRjcUliUzBKYXFhOC9FOFo0WnRHNzNvQ3ZEdmtw?=
 =?utf-8?B?aXhHVlRmQ0xWaU13aE50NVJLVEZYZGQzR28rb04renNBcUJsdVQvdWRwVUth?=
 =?utf-8?B?RVcxUlczY3dJK0cvRlZVbUxOc2NDWXBLcndpQUdzZ3BZTkU1ZjlZMEQrVk9L?=
 =?utf-8?B?SUxmR1djUUFlUHFJSFd3Tm8xWlR3VldCa1FxdWpxSk5yUjc1YVk2ZVVkNnVU?=
 =?utf-8?B?UGpJdVdsTTdEWVRrTjVSWTNHME10TFNIdVZqUUxIeStocVZaV3EvSU5PM2Jo?=
 =?utf-8?B?QWRZclRmMDcyRlZiMCs3MkhSeHZ0bDMybDlJbG4xbEw5RFduYWlpcGpwRWxr?=
 =?utf-8?B?YVFSMVB4OW1GSnhzNkFTd1dXcnREeXRJVjRRYWV4elc0VjdxeHFreDJib0pG?=
 =?utf-8?B?NjZTMUtRa3JFZ3VZak0vb2h0ZU4vWngyb3dEcDY4WW04dXlXSC90c0JXVzkz?=
 =?utf-8?B?QUtTcWIrZ1JiQVg3Z1pQVVlWNlIrUFhSaFFnRzNzMUp5TmJGRlFTNTFEK21z?=
 =?utf-8?B?OGJpK3hMbmpTbmVOcEZDNE4vcDJ2cGd6ZDE1ekMrTVBWMEE4OGpBdmdVZHVS?=
 =?utf-8?B?aEtienNUaWhteXZDU05CRXhEcmtaOE1Tb2RnRlY0MGl4Q1Rkc01lZzBoY3pF?=
 =?utf-8?B?YXYzYTltMXN5dGJmaGFBR0RadzlmeDFqdVQ4R2tpdWZIdG1GSDc1TFhUSjZa?=
 =?utf-8?B?R281ZU5ZV2JBQWZxZkpBejNSaU5SbnVYeFNtOTdvUFVmVHpHMGYraENpdXdS?=
 =?utf-8?B?VG9qVkdLb2d4d1dvb0RnN3Fyd0FOTkx6UzBxOFVmU25zZ0phL0VGTDd6WkJh?=
 =?utf-8?B?QmpyZjJYaG5NanQ4eCtpdVJTKzdHUitLSDRINWY4OGU4OUJQMjVqT245Q1NN?=
 =?utf-8?B?SHdPVW15Vm91TUJYQWh6c2krazZZalFQZlNzQ0ZGQ2dhZHpFQUowSkVObWxC?=
 =?utf-8?B?eHE5TzZLeksxQnVONnd4NWp1b3pCekh2d0Y3ekNaM2F0bUNaNGJwVzUzSFEr?=
 =?utf-8?Q?LSg/TBmKwgbJzFKkrXI3YbU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 366ba4fa-c6dc-4c42-2d76-08d9d3dc5d72
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 01:56:06.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rV2OsIPlXPuCGovVnLwbIfW6GToUPzzgEIShtpeBMptC/OLQHJqhZXythAP2KCnLMGhNMzylYLpmBeTVwjqMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0031
X-Proofpoint-ORIG-GUID: 3t5z3u2ucvNkyEC4zRnexBJVOb9lTBjC
X-Proofpoint-GUID: 9dMKJcrx06QrUTInlqF_4GIBAO0S6ZD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-09_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=755 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 01:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160319

--------------FBAA0C9DEEDAF5CA56EB5D85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/22 7:20 AM, Richard Purdie wrote:
> On Fri, 2022-01-07 at 23:19 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade xserver-xorg from 21.1.1 to 21.1.3. It fixes CVE-2021-4008,
>> CVE-2021-4009, CVE-2021-4010, CVE-2021-4011 in 21.1.2.
>>
>> Adjust indent as well.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.3.bb}      | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.3.bb} (84%)
> I merged an upgrade to .2 so could you rebase please?

OK. Will do.

Regards,
Kai

>
> Thanks,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160274): https://lists.openembedded.org/g/openembedded-core/message/160274
> Mute This Topic: https://lists.openembedded.org/mt/88262897/3616933
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


--------------FBAA0C9DEEDAF5CA56EB5D85
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/8/22 7:20 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:857c4913071abe70b2387967d8cba8e35eca56e0.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Fri, 2022-01-07 at 23:19 +0800, kai wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Upgrade xserver-xorg from 21.1.1 to 21.1.3. It fixes CVE-2021-4008,
CVE-2021-4009, CVE-2021-4010, CVE-2021-4011 in 21.1.2.

Adjust indent as well.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 .../{xserver-xorg_21.1.1.bb =&gt; xserver-xorg_21.1.3.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.1.bb =&gt; xserver-xorg_21.1.3.bb} (84%)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I merged an upgrade to .2 so could you rebase please?</pre>
    </blockquote>
    <p>OK. Will do.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:857c4913071abe70b2387967d8cba8e35eca56e0.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Thanks,

Richard

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160274): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160274">https://lists.openembedded.org/g/openembedded-core/message/160274</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88262897/3616933">https://lists.openembedded.org/mt/88262897/3616933</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------FBAA0C9DEEDAF5CA56EB5D85--

