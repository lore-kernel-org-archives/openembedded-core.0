Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB30EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 03:32:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.447.1689046341866960649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 20:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=sM6Jt2GC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=655671ae7f=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36B37akc008937
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 03:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=/2vTPCYB/6/zVAjpZx0UxEAb5WzLB3TMleFs5miAQZk=; b=
	sM6Jt2GC8MfibladfDrDtF8hF5o7cbf4eZQ7oFNTeki6K4v7If4vX2grOx3qavhH
	ThodOuAK4tVKTxNERAKJkEiPRozOjB2lmO/rnjJ38lyh1AWmOjD9qip92ltZIYlf
	oiJrUnULrS1GfkX+UbycogB2U5oIO3JiqI5aiRusXjs6tlIllDNlPOCyLvUZmLny
	O8VlwKDQtijnJNMlBWZfAtoXc8xJrne7uSgCQN54guXImrsfm/Vit9oRpA8b3HHi
	2/B9xpFkcrSqDmc+hlgiugoaNS6pY0PxvM49EiY2a1uypXnx9ZALoKHmllxTEl1Z
	HL2IyYcF6GCBBJV+39Gvqw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rpxs5a5yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 03:32:20 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36B3WKvj010694;
	Tue, 11 Jul 2023 03:32:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rpxs5a5yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 03:32:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGNZF9f0lB7nYPzWzjafCCQGC97RGDhvNqBOToLd0+jgZkmvIOg5EAXAe+cluosTqK9GmevmLE8A5pcqmWwNnX4PyYYWCnPBB1tOLymPJyQQW/glyhFWAgG5+TwBlI3ZJiInJORgPiuZvoFklecxagKVxbZw89rhTzXPfTvcrOp8HHHQZE7Opw6cwo3HYCr/+UuKPJu182asnbawaFYRvRfGnIq0r+128zLVlxoTmm16RICcPg5dO5uY9n9fD06lUzrXwBzKdMsCZKTEzepjkgcnb+ZRcp+xzD9uJGSPlALnwaG05FkMQpC+gLuIh0EqKEwIBSrnzA6iYkFvGmphyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2vTPCYB/6/zVAjpZx0UxEAb5WzLB3TMleFs5miAQZk=;
 b=EQ4Yzk04ltBLbYJdiuU3OmD18XHMok/P50cktktPZHai7lF6BChsfNTuDJX8watTYOMitUosaZUmE7PitmMvuEKriDeVsr8CNLFo5pyZDN1a74WL9I91owYxanp2kpGfBxcC5faBnsoVOur7mVV/FRoJ2cXrRdry6UYxM/ysrPf+GqPllZ/l7Gv4imiNcHkVjVZPT58Vf/PUEWZNeLYe8KYB+/fcjLs8ZyA1zpun+uWlrG+zMAsBy05P03UkqboDEkw3oonpsztQUzvfr0nKAh/SRCwARO1VOnZLU6VDLXDqvJt7ib0PwiRLL8SEBLU32B3mkbNUiMR42rXX8c8hZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by DS0PR11MB6352.namprd11.prod.outlook.com (2603:10b6:8:cb::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.30; Tue, 11 Jul 2023 03:32:14 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c0a6:3283:d97d:aafc]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c0a6:3283:d97d:aafc%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 03:32:14 +0000
Message-ID: <1a263848-46cd-e3f7-c3eb-f3235230355c@windriver.com>
Date: Tue, 11 Jul 2023 11:32:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [master][PATCH V2] systemd: fix a dead link under
 /var/log
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230629101038.3772750-1-changqing.li@windriver.com>
 <54b0fde47c4a83f27b045d7f988fafcfd8bdc8ff.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <54b0fde47c4a83f27b045d7f988fafcfd8bdc8ff.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21)
 To SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|DS0PR11MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 64dca022-86e5-400d-fb5f-08db81bf6b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UdJ0w9dOXv4wuAS4AqVi+cb3ok9dnl2q38uv9AOpOZRBDJfjmLNk1X4TxdhQFj+Q8hl+YTq8wO4V41VXjVcVTiH4R7w+7KfnZCoYpoEhR6KzdODz4EqGfQQSkYf8B+ijWMXTfdAi5GGGeUE1lolW3RzMywWoEdXs3taDsBPWRmlVWYHq3HcRqRJqbBHxewQVvMt6d+KiSHEuRaVmJV/xBmK8DQJ8utTUph9vE76XiJ8MVFQ1ui5gDdPS//eVaIY9k7yyF+Mx2lMPHYNYsSlWkhBKWhlEp31R02rSHE4mpMft/kQvTJWpFB58+eW7abmMrHFwwSN67D8lnkXlFirIq6Vs/WTAPl7EIOxBJAQCI1+qCq4gBdPbZDXLVgNkxgXwwz9+Ehj8TOEClkGQREsGNA5IDOltJu60pkgxaSAWQCjve5uw72MTAof+gomrJ6iM4i2q5oVTLyYw0cdZcyoKrABwDAl3lF5FIdyNGBWqg0ykyB7KyjcIZsWD8dXcFkAR250XSO2sfiX+/CpFzmF3l8F8Zs7rFuHxlNzlb91q+msO/NdANCaFGpUD0JiTLH2EbN0xFfXo7uz7DgYM2/OINYYfOnImKpwPmMH4IxaZVXSnPE8dWM+d07i/HD1OhfP6/uZOpoWQFi48y0sas/g20A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(451199021)(6512007)(966005)(38100700002)(83380400001)(26005)(53546011)(186003)(2616005)(6506007)(44832011)(2906002)(5660300002)(8936002)(8676002)(6666004)(36756003)(66556008)(6486002)(478600001)(66476007)(86362001)(66946007)(110136005)(316002)(31696002)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGF3UDVSb1pyNlJYNUJva0Z6YlphWG9SdklPbWMvWlpGZ0NBN3VGUmtjU2gx?=
 =?utf-8?B?OENZeHZqaytIZHhIVnAzSWhrZnU2STh4QzcxOGFkaUpLQnJ1MHV6eFdadXBI?=
 =?utf-8?B?ejd5eC96THMzbHdqVjJQUUwvYnhtbU1MQVZsTVhrT0dKc0ptUjNZa3BzcW10?=
 =?utf-8?B?MmlvZml3VWlmYmdrVitvR09NcUluQ2tOeCtLN0I4eGN2VVU1ek5sczJnRDd4?=
 =?utf-8?B?N0NPWk9mV0NFTzNsWkxpelZnLzNUcDJLak0xUElFT1lYSFNaajBGbTlhOGxQ?=
 =?utf-8?B?bzFTV1J4NlFVLzIrZjhxb1B5cFNRbFZrN0R0VythSUZvWmFsam1raUFTV0hT?=
 =?utf-8?B?K2wyY0VLQUtSM2RYQ3MvUWl5YU5GK000T2FEZzRBZzlTWCtFQSt1SmVOUmQ1?=
 =?utf-8?B?TFdiZmF6TGJtS1lNdHJybkZWZzBqeWpCc0lNQnNHdmIyR2ZBVkNwSG5QbWNY?=
 =?utf-8?B?S0NNcy9rb3RLZjl3ekZXdGMwbkt5VTYxVFAzU3EyYlNZMWFWS2o0emNaclFx?=
 =?utf-8?B?V0ZGMkRSRXl2clU4QWVqTEgreXg5NFdFbkxXNHFGYitxTEl5eXc4RXYzQmk3?=
 =?utf-8?B?Tm9iRkQ5ZkZNdlBJaThrNnVBS3pwY3B0YjZla25RSmtvdkgxb2xJdlBRL0ZT?=
 =?utf-8?B?ckJQcXpBQWNHaFdkbEZHUVJ1aWZPb1BNVEFocC9kU3RJNUY2aTUvanJDdVYr?=
 =?utf-8?B?Yk1uY1piZzhobkw3U2NsWkFwa3R3anF3ZUdTRVJVZHNscXJEWUtrYVpCaWM4?=
 =?utf-8?B?QnViTFp0ME5MZktPZnBTU3JBWm5UTnAzL1M5N1NqUzdvVmlISnIxQWVtc3pE?=
 =?utf-8?B?UGZTL2ZTQzR6Ylg4cWJXb2lzb0M1NVMyR1ZPUFh1VER0UkhCTnZJV1dCaExR?=
 =?utf-8?B?M1h5SGZET21QaWhuWkR0Y212TksrS2dkbTdmMmszOWV2cVdxVEdHMjU0bzYw?=
 =?utf-8?B?Y3QrYytJbDAwaUJKMy9tVHhZYWtFMzg1NzlLT3FIV3B5UEl1bW9UM0xaMFBV?=
 =?utf-8?B?VlNldFVIZnJqU2MzZFpIVWFZVGRBUWFDUVh5d3pmTEtvYkxlQ251NCsrMjhD?=
 =?utf-8?B?MXFmWDdiV3I1ODYvQlY3ZGE3Wk1PSm15VVRCK1Jhc3Fnc3hmeVd0d3lEcEJC?=
 =?utf-8?B?WFRBaGpCSHVUWTBsWVdrOWNrdS9XV2owUG14V0p2NitiMm0zZGNtcC9oeWlG?=
 =?utf-8?B?QUNpTW50ZGNtWWRVYW9nQTUzNFFYWEVQM0tmNFY5VUdubDV4QWJKeFZ4Vk9t?=
 =?utf-8?B?R2lWVzJERTVudWZqQ0NWTkhYL1M1cU9oOVk5bVFSZkk5RzBzc3E4SXVTUmVU?=
 =?utf-8?B?ak94K293RWowdk9sVnJ5RU9wTXdsUUZFQWhNbFVKZkZtdWlVTUl2REpUdjJa?=
 =?utf-8?B?TDQ3SUwyK2Y3REMveGp4VnMyNW04RVJmV1FBd0ppck02UUh3bEUveWlKenFV?=
 =?utf-8?B?RjdVMG0wZU5BZ0hJNXpGa3VaVXpmenlDZEZkb2NRdEF6SWJxQloycisvV05r?=
 =?utf-8?B?ZFVTN3FSUy85R3AwQWdkeDZpWFVXeDk3Kzhyd2lESDNNOG5TNlhTb1VQVW9w?=
 =?utf-8?B?RnQ0Q0h1bXNOWm1lM3JhN2VIKzNvZkhDcWN2b3IyamVIYnJIelIzQmtPeVdk?=
 =?utf-8?B?MWcwWFUzajVhOXlEZjJmTjltc0gxN1ZJZ0F4ay9rbTFpM0VKSk4xMHRvbWpS?=
 =?utf-8?B?SndzeFJpNndzb01QTmpEbElZcTBLZzRzWUlqV2YyejBYckRJN21zcGN6bktH?=
 =?utf-8?B?cGVFdTB2ZElRenNwM1BYOHRSQll3M1Zwd2F1VHlDTVI3N0o0aytvcjFNNDR5?=
 =?utf-8?B?YjdMNURiMzhvM1FKaTBiVVl3VjFMQnZVTmRTbzVycFBIL2liaFVLb0NmNFFi?=
 =?utf-8?B?UTZuY2JRdUNHNERObmUyclRkZkRpWkRVWUxGTnVXOHZ4ODBpelYxS2dzY0My?=
 =?utf-8?B?MnZwem9yYUIvMStsZEJKYWlrQXhsVGI2UzZiUmJtUUVycmErQmxDNXhzeGdp?=
 =?utf-8?B?OEw3TUxyVHlVbFVPdEpvSEdhSFNXTkpIcXJhUmthaVZFeXZ6b3MyMS9ILzFC?=
 =?utf-8?B?Q1ZDcWc4TmVzMDFkL0NvQ3dMcUE2VkpPOUlhZU5zNkdYSmtCWWdjQVM3UTFx?=
 =?utf-8?B?SnN1TGlhdUtIem5nT2tTNWg2ZlkwRCtUMXFiZEp0K2FrczQzY1pZYUVvUHYv?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dca022-86e5-400d-fb5f-08db81bf6b0c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 03:32:14.1271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/cTfKb+UW1pmwOpoFM5Pi9ZBs4Mv8HtcUDCSslgG/7sXRlTlspUOhqQyLJl5WSr96cCP9sNyTc8HNHtBR7ThSwFc+SPpsx4DFGt482d/Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6352
X-Proofpoint-GUID: dKq3c-Eudu0VcawIyf6I6PBohJKfLJn_
X-Proofpoint-ORIG-GUID: xuoupBcB2ZJJ_GENBZiI6Z5N5Ao1P2eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_18,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307110030
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36B37akc008937
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 03:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184113


On 6/29/23 19:44, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 2023-06-29 at 18:10 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
>> install README.logs under systemd doc dir.
>>
>> But for OE, systemd doc dir is splited into package systemd-doc, when =
it
>> is not installed on the target, there will be an dead link:
>> Eg:
>> root@intel-x86-64:/var/log# ls -l README
>> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/s=
ystemd/README.logs
>> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.l=
ogs
>> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such f=
ile or directory
>>
>> Meantime, relative path for a symlink also will meet issue like
>> "No such file or directory"
>>
>> Since OE have set ForwardToSyslog=3Dyes, this README is not needed.
>> So remove this symlink from package systemd
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   ...on-t-create-symlink-README-in-this-f.patch | 42 +++++++++++++++++=
++
>>   meta/recipes-core/systemd/systemd_253.3.bb    |  2 +-
>>   2 files changed, 43 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-core/systemd/systemd/0001-legacy.con=
f.in-Don-t-create-symlink-README-in-this-f.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don=
-t-create-symlink-README-in-this-f.patch b/meta/recipes-core/systemd/syst=
emd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
>> new file mode 100644
>> index 0000000000..a2644bba8e
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-crea=
te-symlink-README-in-this-f.patch
>> @@ -0,0 +1,42 @@
>> +From b17826490c1db2051dda23550ebdcd7f10e23479 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Wed, 28 Jun 2023 13:49:41 +0800
>> +Subject: [PATCH 1/2] legacy.conf.in: Don't create symlink README in t=
his file
>> +
>> +Commit 6fe23ff31c0 changed README to an symlink to README.logs, and
>> +install README.logs under systemd doc dir.
>> +
>> +But for OE, systemd doc dir is splited into package systemd-doc, when=
 it
>> +is not installed on the target, there will be an dead link:
>> +Eg:
>> +root@intel-x86-64:/var/log# ls -l README
>> +lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/=
systemd/README.logs
>> +root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.=
logs
>> +ls: cannot access '../../usr/share/doc/systemd/README.logs': No such =
file or directory
>> +
>> +So remove this symlink from package systemd
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + tmpfiles.d/legacy.conf.in | 3 ---
>> + 1 file changed, 3 deletions(-)
>> +
>> +diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
>> +index 4f2c0d7c43..62e2ae0986 100644
>> +--- a/tmpfiles.d/legacy.conf.in
>> ++++ b/tmpfiles.d/legacy.conf.in
>> +@@ -12,9 +12,6 @@
>> +
>> + d /run/lock 0755 root root -
>> + L /var/lock - - - - ../run/lock
>> +-{% if CREATE_LOG_DIRS %}
>> +-L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
>> +-{% endif %}
>> +
>> + # /run/lock/subsys is used for serializing SysV service execution, a=
nd
>> + # hence without use on SysV-less systems.
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes=
-core/systemd/systemd_253.3.bb
>> index 87fbf6f785..d8b94e370c 100644
>> --- a/meta/recipes-core/systemd/systemd_253.3.bb
>> +++ b/meta/recipes-core/systemd/systemd_253.3.bb
>> @@ -28,6 +28,7 @@ SRC_URI +=3D " \
>>              file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-loa=
d.d-to-.patch \
>>              file://27254.patch \
>>              file://27253.patch \
>> +           file://0001-legacy.conf.in-Don-t-create-symlink-README-in-=
this-f.patch \
>>              "
>>
>>   # patches needed by musl
>> @@ -760,7 +761,6 @@ FILES:udev +=3D "${base_sbindir}/udevd \
>>
>>   FILES:udev-hwdb =3D "${rootlibexecdir}/udev/hwdb.d \
>>                      "
>> -
>>   RCONFLICTS:${PN} =3D "tiny-init ${@bb.utils.contains('PACKAGECONFIG'=
, 'resolved', 'resolvconf', '', d)}"
>>
>>   INITSCRIPT_PACKAGES =3D "udev"
> The whitespace change in this patch shouldn't be there.
>
> I'm not sure we really want to carry a patch doing this "forever".
>
> Could we turn off CREATE_LOG_DIR or would that break something else?

if turn off CREATE_LOG_DIR, " /var/log/journal/" will not be created.=C2=A0=
=20
By default,=C2=A0 VOLATILE_DIR =3D "yes",=C2=A0 this change will have no =
influence,=20
since we will remove content under /var/log.

if VOLATILE_DIR set to "no", the current default behavior will be=20
changed,=C2=A0 log will saved from=C2=A0 persistent=C2=A0 to memory.=C2=A0=
=C2=A0 our default=20
Storage set to auto,=C2=A0 if " /var/log/journal/" not exist, the log wil=
l=C2=A0=20
save=C2=A0 in memory /run/log/journal.

@Richard,=C2=A0 do you think this change of current bebavior=C2=A0 is acc=
epted?=C2=A0=20
if yes, I can send an V2 to turn of the CREATE_LOG_DIR.=C2=A0 Thanks


Refer:

[1] https://www.freedesktop.org/software/systemd/man/journald.conf.html

//Changqing


>
> Cheers,
>
> Richard
>
>

