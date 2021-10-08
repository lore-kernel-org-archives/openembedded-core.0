Return-Path: <kiran.surendran@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60E6C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 21:47:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1687.1633729655303691645
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 14:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UmwFB/j4;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5915a108d5=kiran.surendran@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198KwRdr008511
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Oct 2021 14:47:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nF4s4/hJr+1BDsEOO9Y/CGfyGVM+EX4ASULWfr6mfI4=;
 b=UmwFB/j4wwV6YUsLH3n5v5BXeLcmkg24XIDF8cox7ByHb9fxTe42/jSpXQsxy071s5mH
 wyp4WU866zJ4iaTa1jAZwF8ljOAoqjU1sPiWIglz0DOXbVQGZYSukiEyqx3JMZaaDGkB
 5oeDMCjAekszk1ToCgP6kuFeIwvZFupQ0iLqwNk38S523CBPx60ub9SFt6wwG32HJ37i
 KulkLHaH4FVEPZPvBwxgEeiFac0D71zppkosoVY/j3YhE0pyfvD+Wil+gjPpdqxztb3r
 17/9PBGA6/XmY9cElXoRtEfkX5UbfpVxx4ejlI6mvXUQh6TM8ddjjuZlEfhE0DjpGmQs 0Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bjqtdg9hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 14:47:34 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 198LlYHq024359
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Oct 2021 14:47:34 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bjqtdg9hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Oct 2021 14:47:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhIZzNFAZw+HH7IBdGeA8fkckH1nVCqSXLx9IYyC8FILseGocVhReSHStfkXMBZiGRVyCQHHjqhDpJ7EQtu2SAEc5554xDrViMZI9PoS6qhyNBw4EcGVesOTnBa8zv/fw9/uNTzsAZffXdkrDVOpsFDYPQfwEARFGololJ5jqkSYkVNuRQGEsv2HEL+YEtThmVeHiio5TQj76MEs7Ybd4WrJCBeC0UAvGrBeqcadwlth118q3DcHiJaOd+tNZ77+3AW9UmHxUIZjuTsPEkj3y/NPBKGrjuRrgqGk2+JTpeQdeNzmsjM5zYsjLk1WwEOsTenXddHVz5L559pmpHajBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nF4s4/hJr+1BDsEOO9Y/CGfyGVM+EX4ASULWfr6mfI4=;
 b=b6m9+0NUhobchH0yrP9LXjp7Nt8AvtIgIo7M7HVcAVYejwdwpCZOow71kuON4mdXDEcQVbjW2icBJqxY4S2E94/ayUPAmoWcZf12oTmBvs8Bw9dnrpwIjDEyMUGUesKmk7dtUvcZbsdrupY0jyUsvMbsEdnmeZqxha6VFt82b9PsHzUpAweqzQuuE2v4xDaLY5SnN1ddREWoJcrBIrhAk9DmHZGVvWiczMqgPSUMdsKPGnHRz1ElulBbzDRSbVu3Z4EqVrGYWYVslCn8Fc4Zwc0DEzMUC3W3+PgYH9RJnUJ5F0ixvyD22Tke2KuWio/yUEkLJQkPZ70Q3ODcqgbUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4282.namprd11.prod.outlook.com (2603:10b6:5:1db::24)
 by DM6PR11MB3756.namprd11.prod.outlook.com (2603:10b6:5:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 8 Oct
 2021 21:47:31 +0000
Received: from DM6PR11MB4282.namprd11.prod.outlook.com
 ([fe80::6181:1d2:89f9:7875]) by DM6PR11MB4282.namprd11.prod.outlook.com
 ([fe80::6181:1d2:89f9:7875%5]) with mapi id 15.20.4566.023; Fri, 8 Oct 2021
 21:47:30 +0000
Subject: Re: [OE-core] [PATCH] ffmpeg: fix CVE-2021-38114
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20211008164857.91699-1-kiran.surendran@windriver.com>
 <2c39d3ead1cee72e752e9aa990b5fd3c9173712e.camel@linuxfoundation.org>
From: Kiran Surendran <kiran.surendran@windriver.com>
Message-ID: <65cab73b-c0d9-cda7-8c12-9195dbb7c4ae@windriver.com>
Date: Fri, 8 Oct 2021 17:47:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <2c39d3ead1cee72e752e9aa990b5fd3c9173712e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::29) To DM6PR11MB4282.namprd11.prod.outlook.com
 (2603:10b6:5:1db::24)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:5a80:ea0:aac:ac1d:a221:5c1]
 (2607:fea8:5a80:ea0:aac:ac1d:a221:5c1) by
 YT3PR01CA0087.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Fri, 8 Oct 2021 21:47:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 750c8143-7177-41c1-10d8-08d98aa53a8e
X-MS-TrafficTypeDiagnostic: DM6PR11MB3756:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB375673DEEF014E8D90CE1929ECB29@DM6PR11MB3756.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rh9VBAehdSmBBRAcLITWKS41xguo/as0Tzp0a21AF9kunQ34bW5AI2gKy5krBJd3lUlw7C6G/NErxKzOgXw3VOEELsunqU3xWPracrwRZ7x6S1StXl0Ki8mzvNudK56cHDg8v2ljTTWKnIjHCohqpjEsPoEyaWkq+GGfsfqT69V1qrJHB0jBoLprxczRcOg1xGwTAzF1AfFbFtgLj0sM799FnFchCFKQAaaU73hGCIOHBEv6K5B6XjQ2TPmoSZZj9CbNDJ+OCZ1oiJjjAuxv8G3vgMYReHBbuyauyjRnM3zyrlbXGdlpN0p4t5xD8soUzYqOZ4dkV0lgl1tHchQ6qVENB02Q46sEgee6BhO/D0y8Tdjg2mLatyQNcJ9sBhogHFKBKkAzK+KjjiYp4Oe0c6KiYaXeBLZUWLgdvYsTuX48RiMsO7tCVIv8co4pbdbnc1JH/UBoSGVB+Q4vTz0EFA4OpfzvGF+06IpJr0Jwve4JFD+8C4bwD7HpAr8MKksyUyAIgrreinuf7XvLo30cBg4QiRQlsnw4z++SwTYNxICWJjK4Xjj18Mt/Cwf01tVNtsQlndvxfmuexi61TWnp4sMaGAdP/SDY+011FL9UoJkjNfqoL423CdOLrWyrAA3etrscIbnq/ISXljMyoDVp0cxuFKZSx+oEJ2fQwj0c8+oRtsxmK6l87sb9gz6O8umTu8FlQFHrjbq5b1MBteJdVXr9yqtrfv0EMzMKgmzl1qI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38100700002)(83380400001)(66946007)(31686004)(6666004)(66476007)(2906002)(2616005)(8936002)(4744005)(8676002)(66556008)(5660300002)(316002)(6486002)(86362001)(186003)(36756003)(53546011)(52116002)(44832011)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3R2YkFUOURlZXYrY3RwMXhWeElocnhQWFQ3QmNITENKczZLNkQ0OXRDSjNP?=
 =?utf-8?B?WVFXV3BHY2RHTnB5Y3RBNjZhZC9URmczUFY5UkNvajBqZ1hlb1V2djVHVTV1?=
 =?utf-8?B?OWZqQ1htTXZXOWpiOFNuZEJlVE9CM21vbDJVTTBUby91QnJVazk3amRqaGd6?=
 =?utf-8?B?UWhKcEtIQkxJVkVKUkZUUEpHTkF4NGFhWndrb0dwcU9hMlhnUXpRcEtqTHE0?=
 =?utf-8?B?WFNsd2VISjNJZHdQaHV3TnBhQTUwcCtBamRpclJNaG5COU9GTm40cjFzRStD?=
 =?utf-8?B?Q0dMYWNkdi9HTCtUakFpNGdVd0FHTUltR3dnT0U2amlnZlNXWWtHUGE4amgz?=
 =?utf-8?B?ZUVRNGhVa25wdFRUNjBOTmFhVytKRDUyOEh0d2FaYkExOGxrZFpMOTVUOGxx?=
 =?utf-8?B?MDNQVDFUYkUwWUpmWkdZaHpGTGI0VGtxZjA3cDcwcG9PQjViNzk3ZVhiQ0FL?=
 =?utf-8?B?UW9LTWlQSUQvRUZYb2J1dkIrV0ZLbHk3STZpZzFhMFZNRmxCWlNxUjZPODRO?=
 =?utf-8?B?MU1XZTVWUjZuKzhXd2NsbWxCcUp0NVFBNjVBMXUzb0pQZ3R2RWpvaGRLUG5j?=
 =?utf-8?B?anE3eDdmVmd3NCtLVnlKUEFqcm53ald0YVJDbGtmdzZaeEc4Q0RodTBHM05p?=
 =?utf-8?B?SHZ5TEdLWW5RM2Y4clZua203QzM5MTIwNlBNUCs0RlliMHpFSW55NmhXclc0?=
 =?utf-8?B?c0NGQUZJUlRtSnFRNDFtMGZHeGFHTE1FWWhLSGI3YUhqWFV2RUhsbDVaWGtR?=
 =?utf-8?B?WEJBbkczc1p0a1REOWNrc0ZPTzhnV1JKTERrNnpNSnNXd0o1V3J5bXFLTUNn?=
 =?utf-8?B?SHR4MUoxL1F5L0pQRHpYcjhOeWtiV3FrdVlxNDJlZ3FGbkYxVERyNzI0a3Z6?=
 =?utf-8?B?M0xXVUNvTmlSZlpqdnRJamRsWWlVQXQ3ZUZHaXgxUlFlTWhTa3Q5Yzl0dHBl?=
 =?utf-8?B?QXBNbjNkT3VGMUlEdWd1aGo4NXlFNXBWL29HUUZUOEJKOTdYTEJ6NE9hWnpK?=
 =?utf-8?B?RDdDeTAzS0Zyd1BEcEZyaTlzakEzNjd0VkxCL3NHT2s3RW1YVFdwVlFTWFBw?=
 =?utf-8?B?TnhSV08xWkM3UERNWnhTY2xlNFNwUUptQmVydG93Tlhjd1d5K00zOSttZXBh?=
 =?utf-8?B?b2l3WXo0RFF5QWREaG1jYVFtU2w3cTdVb3QyN3FQWVBYYjJTeFF1ZmdZckFL?=
 =?utf-8?B?cVRaM0tYeUNBTk11enVDckFJNUVzS2psNHlnaTBwVytzU3pObzJ3eThRb3JD?=
 =?utf-8?B?cmZTU0lNSkdodE5VbC9xNWdBK3IyUEhqWThCeXp6cjBaRVhIZy9lUnJKbFhT?=
 =?utf-8?B?VGQ5TXFjNVB0V0lLWU5xNkpWaFRxZzBndmZZT0I2SVEwaXhJZnl3bGpYK2dq?=
 =?utf-8?B?cC9USjNuWVVEaGJSUCsvVXNxbmE4ak9uamN3R0c1blEzR0dUS1ZoaTB0N0J4?=
 =?utf-8?B?VndYZFBWKzYrVzF0c0ZIMXF5UytCTCtGTHJMUExKWWx2Y3V0T1pjLzBVK3Zs?=
 =?utf-8?B?MmkxdWlXajU2WmEzN1Z4eUJFcU1meTdLd3RMM0R6UEV6bG1ZNEVqK2thRFNH?=
 =?utf-8?B?NkkzQm1kUkNqazFmbzIvZ0dqQTMxN1F0dzVuTUkrUXJidEZXK0JueGtDNUN3?=
 =?utf-8?B?U09UaGVrT2lMR2tZRnExbjlsSXRSdkp2dkZWRWZrL0QvM3c2RFd2MVoxcFBL?=
 =?utf-8?B?TkZabUN0NGtERVN1ZEtOaEh2aEpSQVZYLzhKdlhIL3pSZWVoQ3pWWjRlaDBm?=
 =?utf-8?B?Q0kvVEMzendDVG5TRkgvNGRFMzZpRXFFSDM3VloxL1d3MUJ1RDRHdlpERk85?=
 =?utf-8?B?eFRoNFBzN3Z2MUg3Q1crdGRUZFhycmtNUlArWTZoNjE4dlpJS2xYVnN1WnZp?=
 =?utf-8?Q?QuTv175s7eLpo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 750c8143-7177-41c1-10d8-08d98aa53a8e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 21:47:30.7920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ljs6Clic2KdzJVfSdeja3VA1r8KBRjBQKt5LlvWikTIAHQtZjsr5nJr53ctbMcXDdvmTtwSytiGqBw1Zwy6ETG3Fpm3pvkS8McxHMPYHYZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3756
X-Proofpoint-GUID: UKtnQCB4kracDph2RMocZQHPl6Aa4YPc
X-Proofpoint-ORIG-GUID: PK6zXbiDa1WPb6c8o_MAYnxs-Ww72CXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_07,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=924 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 21:47:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156787

Ah yes sorry, tried to use the same patch I made for hardknott, I'll 
send the correct one for 4.4

Regards,

Kiran

On 10/8/21 5:12 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, 2021-10-08 at 09:48 -0700, Kiran Surendran wrote:
>> backport from upstream
>>
>> Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
>> ---
>>   .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    | 67 +++++++++++++++++++
>>   .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  3 +-
>>   2 files changed, 69 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
> Master has 4.4 so this doesnt apply? Which release was this targeted at?
>
> Cheers,
>
> Richard
>

