Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75018C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:50:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.12886.1644335416086214388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Oxg6gz3F;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9038fcab21=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 218EP0qq029641
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Feb 2022 15:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rqRSslpQ1HaYzM38NPhbCEPxqL+79d+2yLULTlVA+Jo=;
 b=Oxg6gz3FXZ6e5i+pV2h5kAjG3LngeO1obP4HMMJQoQoxJCZOy2KFIizMekpV82TD0hzm
 3Y0coiE0FYdAmAAkLH9SsDlWTReIzaySZCb+ayF4yL1OSqK/2dgtL85H4SBo5cSAUEOm
 wd3z9cN/xFSkL2EzSQ/i7CAF5h/V7UYEC5P3JPHNSwEDXKaliNnkp/tDJjl79a6SjRWs
 fG/HYXynvF/NXPLqgwpkTvlEAnyGVSP1SvRhnD9jhuPfthrP+El9XHCHwRl5IfvxUOyp
 n+wm15zZ+YhzH1Kvk00bv9kD4DiEqTqSBf6yVGuvoKOJxRugsGD/KSjXCOMKPNL3/pgN CQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e329ah2yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 15:50:14 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 218FoEJ4024885
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Feb 2022 15:50:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e329ah2yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Feb 2022 15:50:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQUjA0r6qbo7ftMeV1TIxlbXGPzfTUL7eSx3gjdhWARD5pUwsWPBzmR7SMjpik8wzyAmb6q/bIB5ok8WhBwHGCkLBLRLjDVUrcs6iAB67IPxZvpbNqmxAeh7muzie8cm3CyogVl1/w1Qw0UWT1kPKdR3ElYcd8TYgAWl3AK/PYI18O2FyO1QBAWoZY2Ds3KxYchggBw9scQ38QyWBq/uN+LE8YNqYLLKznsmDKOpWZk5nCdbGuHo1Y4PtXlgLapbEGXM8wGmjHgdgs9FUnFxGjrdmO71rK7KXoNYc1vYaizJ2Mvd4UmEpZRMK6TEJ3YU0qTqcQnZTy37qsmuYZlrow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqRSslpQ1HaYzM38NPhbCEPxqL+79d+2yLULTlVA+Jo=;
 b=DW5Kl82TjYPr9LSxbE0prh5eIH8kNfZXPMMjp7xZxIZSux5tS3XZRLnXYa7ijG8n4YSn2do7y2k6QAZtb0VLV9IuwZycgMuw4Ie2JifdLwAVWNMW4dWr2zsI31NYpE5CvV3E/7GP/7+jyNdqdSLN7b1LYPz42J/OO58QTi8iquhsF5cf1tiR/CWWYQUnxv+13Dajlv8Iit+CHLjXn9vWI6zD5AWNwRYPBa91kggbnRj3Z7iw7hzOYYnUeOYKyd0oKlc4nKQjSKY4vmCAmyu80d4VgOUP/xF6InDS6btjHYSiNsQy2FVZHcgq3NtHaaWvMUwWN8q6jk4m+aO2DovbKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 15:50:09 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%6]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 15:50:08 +0000
Message-ID: <78122d10-849e-0d9c-6fff-3d092c48f93c@windriver.com>
Date: Tue, 8 Feb 2022 07:50:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH v3] create-spdx: Get SPDX-License-Identifier
 from source
Content-Language: en-US
To: Konrad Weihmann <kweihmann@outlook.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220208150211.181994-1-saul.wold@windriver.com>
 <a1b3ffce-56d1-5602-c243-b1dbaba79e25@outlook.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: <a1b3ffce-56d1-5602-c243-b1dbaba79e25@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:302:1::27) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fc641df-07dd-4033-9fde-08d9eb1aaec6
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4911:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4911C5A8BADCADBD956C9970EE2D9@SJ0PR11MB4911.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dCgeEVnKENBaGm40d+/4N7cGJNJJZLqj7HoRy9VcxjGNTRKIqd4qGvGq3g1zPVxqJ0gfC+d1gJg6H9HuOjRSmmORmO8SX6THVAsgMTmZe5AiOuUDW7gIiS6GkyJKq6HO5bi02mXqBLscq2hOi/z5zR6Yi4Oc9Wrk3mqez0d9HQXy7JzpFMfYnwKH/jOgnub+s5bBsnwUqbt9i81vmZcW8wwfSne93yLaDd7DG3tjFSPvP+YG/kO5sjiRtO+gCIoy4nfAEfJZUHSB+VfLihgScrDWjwOiMSmcyntd7blnI5dOsKA8I5ikYY6d4Kt4iL+wt3+nbhSQQA5qqNDOSrfrcv0um2V2uDQKM1HeSQqsWZeLhf1qwmeo9QwFukEkqF/a92qjZFpfgFsBB7Cjpon5Lc2TBNOntneys9uq1XMimUTnbCC5gzPfCAvy1+2wJIcxMFliYkW8K7SBoUqphvnSORzgCR7TbbVNQYWYhbLRFjsG+zXMtsEUqaM6sMsd63gH0xu8L5tGzYZQ6FeFd6Zw8sYLdfUb/VlTjkd7atlCZVc5UdMDI84v0MK4GiqF7GHIHndqxERwwNiVqzBC284kZaPNRBniEXutk3WekQ/jLMs8ehkMxCwinPS2/IHu13PLycEKhSIU1/Yo+8hdsXT6lriiUBKvA1oLjn+SO/21UpzsB9QRgryqgpuraqBFVhxgjKX4PcWzyJVjlIoNJYUWyQ5gXqsiF0OzuvJ4fm/WoNX26bmeVW6JQhWqcIOwZxBlyHNhGFJe1rZ592nGMoFJ31gTcLZ3OHV8badUakAPr1OiTGWT8dqxWZQHZJfxHNu1NW0wNREqELLumopmk9ZEfzHYorcBgj781JYCycavnKdxU1FPKmQ+KewSFQ7Yxo19LSzyXFVd1FuEZfDCgtuf8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(8676002)(26005)(2906002)(6512007)(83380400001)(6506007)(6666004)(86362001)(52116002)(31686004)(53546011)(66946007)(31696002)(2616005)(66476007)(66556008)(8936002)(5660300002)(45080400002)(36756003)(316002)(6486002)(508600001)(38350700002)(38100700002)(110136005)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmZPY1ZvSDdGTGptMWsyb2k4V250NkoyWXdJdnE1L0hWcG4zUU1pWTRzR3ZZ?=
 =?utf-8?B?MllDbjhZRkwvOEpCcytRM3JtQ3VTUnY2OHRMVzFTcnI0ZHJFeWVUcndJSWZq?=
 =?utf-8?B?SFNkNWN1enNGRlIxYkNuaERsQ1FEeHhVZGxJNEtBcEZ1b2hQYnBERC9YTjUr?=
 =?utf-8?B?ZktBTjBBeVh2TUhLaC82NG5yWGJaZWJUREtxMHJYa3RBZFB3VGFzclNsclZm?=
 =?utf-8?B?dUF0WnduOXZoclpQVG9JVmVHZXlZZy81KzRjNzZIenorTldFT3lrc2ErNWpK?=
 =?utf-8?B?dnlxdzZkN1MyRWQ4bHEyenlxNWt1bFdEMlZpTTBwOVFYZzU0a0hWRUNsVGkv?=
 =?utf-8?B?VG9nTlhYemlpRytaT2tiSld4MGV0bVFiNk9Wblpmb1lkdXpjNjBEY1UwRVRs?=
 =?utf-8?B?bXY1UjFRWXRjUjR1NkR1bWUvR1hLWmtMYnlFTkFOZk82ajBqK2NQaWpKN1J2?=
 =?utf-8?B?dFJGd0FTZDNjUkVoQ0d3T3NCVkpnOFgxbThZcFV3RTBrQ2JjY01aSmZqczd6?=
 =?utf-8?B?S3BKQXJtS282bGQ4Wm8xK25Vc2dHbFg4RmNSUXdsMmhGMDNqQVdsSjlaV2l3?=
 =?utf-8?B?aHhVVVl1OUhjNFc0U1dxVUNwbVFDV0N4NWdoRjZLOTVlL2ZpQjV0TkJjUFk3?=
 =?utf-8?B?NStGVm9URkRpdEZsMGVoY29TQVNLL2lWUlUxZW1GY2tjOGJMNnpqSlNIdXJm?=
 =?utf-8?B?ai92L0tqWkVmYTI2WVFOekoySFU3NU4walREalppUEJzc3hSRFNvMWhqb1NN?=
 =?utf-8?B?ei8zYlJuQzVaTm5HNUp1bGlLaHNDVWg3VWowa1M4TnNNU3p4WUZ6TFl3S0ha?=
 =?utf-8?B?QVFxWExyOHlyWUZMcytuOXhPQjFTSUxsNHg0ZXZCelBsbmdBT2xDa0tPOUsr?=
 =?utf-8?B?QjVjdXdXL0FCZnpGeXpHaFJwbW5XR2REVXoxTk1NZ21tdEowUGJsbHNXY2tW?=
 =?utf-8?B?WlFOZWc2OWVlbGlBQm9iWm9MOHFOcVhYUWYxbXZydmg1NVowVERscVphWnBR?=
 =?utf-8?B?ODgwaW0wbmFyWXBVVHBVQjl1WFh6UkdxVHpMSG93bUFqbXRVb1l2L2FDNkZ4?=
 =?utf-8?B?cmZZalV1Y3ExSXFOSTdhUEhBMllMTFp3WmU1dk1DSXZ5dnpLRzRTejUzN3lW?=
 =?utf-8?B?ZUk0OExWcVNNdS9uNnM3U2lyRzdtdll4dnNMcUdYUmNMSFlBa21BdW5tNUFH?=
 =?utf-8?B?eFZjdkRYRnlHNDB6VURDMFd2VmhZc3RhN1VyNkVLSFd5S2NwbnlQa1EwZHIz?=
 =?utf-8?B?NTFZTnFHRjZibDh6c2tuaUphejhDOUJZMnI4Q2FuVnpvVEliUDZpNU5Ub1d4?=
 =?utf-8?B?NUkycWpxR3Y4OUNiN1lSVjk0Vjd0cjRHTDlUZHlLbUs1VTdTTU15aHd3UHF4?=
 =?utf-8?B?K2NQbGhhaUdFVUZhWmlraGZtQUo3Zm1oN1BaRmhZN1lKekY4UmVKdnpMSklk?=
 =?utf-8?B?bGRON3FCYksvVUl0ZGI2RE5EcTNsbVFrVGw0d2M3UndZYkROdzlkQjBxRU14?=
 =?utf-8?B?UkJIelJSb2dEbXk3WUo3SFNza1F1NW15Y2FNeGMybHNPZzBkKzdxV1NmWnlG?=
 =?utf-8?B?NnpJMGRybUVkZENqYnc5U3A3WXBKSEZXZjhWL1B2RTBjT0ZKQm41UERMb2JI?=
 =?utf-8?B?T2Q0MXp5R2hRUFlTRjltZG42L1ZzNk8xVmdyL0dKR3lqUHptSnBhT3N4MEtE?=
 =?utf-8?B?Ri8zU0xaaVJxSk4xV1c3K1JuaTJiVEtqTXVKeitPekdzc1A5dWtnVUg3Qjl5?=
 =?utf-8?B?TExkd2R3cWMxcTZ4Rm9QWlhiWElERXllbWlrb3huMEcxRFlZampRRHBFWUlw?=
 =?utf-8?B?ejhRS0hDK3pBM0YwVDkxZDVIMkJNRWtpUHFIWmxiOWNpRU55VEN3L1puT0p6?=
 =?utf-8?B?b215YzcyMTlZZitPZjlDSi93YzFiZFRmREpJVHVEdnFJbmhNQTBsOE96cE5r?=
 =?utf-8?B?M0NVbmhxd00raFhBTVN6ZG1LTHFPcGNHV3dHd2RQZm5FR0g5a0J4SUlOUTBE?=
 =?utf-8?B?T2IxcFVlMU1GV0hvVncxbFFxSTZGOVJmSk13bkMvVVEzZFppQVJWUjBoZUlw?=
 =?utf-8?B?SFYrQ0drWllqelBVT0dmQjBMKzBnaFdBd2NqYXBiVE5NSTBrQ0VscXJrWTNu?=
 =?utf-8?B?bVkxaFhRSkdrbHMyRFJOaFY5M3c5ZGZVeURjaU1HTEdSV2NUMFFDNWlQWE1S?=
 =?utf-8?Q?U/PXYeSE7ykd3moIa9oSMok=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3fc641df-07dd-4033-9fde-08d9eb1aaec6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 15:50:08.6065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 e0L/haTc0MLLKeKptCbFwqwi0O7WV+/m79QNToWgXjViQeqW9bZOoQnItStuhmyAFzHTsPcZmCOIvY6OiVvuCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
X-Proofpoint-GUID: 1e60yBr4FLgWv6wNXEIWNkb1_ZL_Fm5h
X-Proofpoint-ORIG-GUID: 46lyV-HAGvTXvXlnkHuGcox-2hFB9QKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 15:50:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161517



On 2/8/22 07:37, Konrad Weihmann wrote:
> On 08.02.22 16:02, Saul Wold wrote:
>> This patch will read the begining of source files and try to find
>> the SPDX-License-Identifier to populate the licenseInfoInFiles
>> field for each source file. This does not populate licenseConcluded
>> at this time, nor rolls it up to package level.
>>
>> We read as binary file since some source code seem to have some
>> binary characters, the license is then converted to ascii strings.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>> v2: Clean up commit message
>> v3: Really fix up regex based on Peter's feedback!
>>
>>    meta/classes/create-spdx.bbclass | 22 ++++++++++++++++++++++
>>    1 file changed, 22 insertions(+)
>>
>> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
>> index 8b4203fdb5..64aada8593 100644
>> --- a/meta/classes/create-spdx.bbclass
>> +++ b/meta/classes/create-spdx.bbclass
>> @@ -37,6 +37,23 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
>>    
>>    do_image_complete[depends] = "virtual/kernel:do_create_spdx"
>>    
>> +def extract_licenses(filename):
>> +    import re
>> +
>> +    lic_regex = re.compile(b'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
> 
> Taking inspiration from reuse-tool
> (https://github.com/fsfe/reuse-tool/blob/master/src/reuse/_comment.py)
> and the way they parse comment blocks the results with the updated regex
> look good.
> 
I was not aware of this parser.

> Test sample set:
> (* SPDX-License-Identifier: Foo-Bar *)
> (* SPDX-License-Identifier: Foo-Bar *)
> /* SPDX-License-Identifier: Foo-Bar */
> <!-- SPDX-License-Identifier: Foo-Bar -->
> <#-- SPDX-License-Identifier: Foo-Bar -->
> <%-- SPDX-License-Identifier: Foo-Bar --%>
> {# SPDX-License-Identifier: Foo-Bar #}
> {/* SPDX-License-Identifier: Foo-Bar */}
> {{!-- SPDX-License-Identifier: Foo-Bar --}}
> @Comment{ SPDX-License-Identifier: Foo-Bar } ---> Only this one is
> missed (which is bibtex syntax) - no idea if that is of importance for
> anyone.

> Just wanted to highlight that this is not catching every possible input line
> 
Do we need to pull in the complexity of the reuse-tool comment parser? 
Let me know, might not make 3.5 if this is the case.

Sau!

> 
>> +
>> +    try:
>> +        with open(filename, 'rb') as f:
>> +            size = min(15000, os.stat(filename).st_size)
>> +            txt = f.read(size)
>> +            licenses = re.findall(lic_regex, txt)
>> +            if licenses:
>> +                ascii_licenses = [lic.decode('ascii') for lic in licenses]
>> +                return ascii_licenses
>> +    except Exception as e:
>> +        bb.warn(f"Exception reading {filename}: {e}")
>> +    return None
>> +
>>    def get_doc_namespace(d, doc):
>>        import uuid
>>        namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
>> @@ -232,6 +249,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
>>                            checksumValue=bb.utils.sha256_file(filepath),
>>                        ))
>>    
>> +                if "SOURCE" in spdx_file.fileTypes:
>> +                    extracted_lics = extract_licenses(filepath)
>> +                    if extracted_lics:
>> +                        spdx_file.licenseInfoInFiles = extracted_lics
>> +
>>                    doc.files.append(spdx_file)
>>                    doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
>>                    spdx_pkg.hasFiles.append(spdx_file.SPDXID)
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#161513): https://lists.openembedded.org/g/openembedded-core/message/161513
>> Mute This Topic: https://lists.openembedded.org/mt/88997967/3647476
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Sau!

