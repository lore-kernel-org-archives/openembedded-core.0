Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78012C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 15:12:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.873.1632841956011766987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 08:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hbgNgzDt;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59050711c4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SCNRJd016455
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 15:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=yYWvmY9qexOIbPdx5Ex/JrsOfM9KxSAqs9iJRR8cMtU=;
 b=hbgNgzDt2Ot4bdeRyjl6Tz793E5CfkGrL1xeUCgvwIA/BRasU1LPtoijgioTc6w2uHrD
 wfSscyZDf714XU2ZkROe0Ycpbsx1xAQQlRvmMgSAFJw64o/xpMYRw7OK21R33ps1j6AU
 2AwdDCbRTByfHO9ULB4lmsCg3szyeuWiHz2PjKaGFM7Tbi92YdWmWYCLMfg7B6gLc2rD
 uTb6GtIGGV2JZ78NCDRb9GuNykxBWL6UyZptAb8OJrwr2CBCqkXpuSNfANBvItp5vE1s
 jwUz5N47FlR7pKBYax5O11L7iFVvCl7nZl15Ahmi3Jc0lkq+/IAf0e8Zgkt22FcNbG1b bw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bbbxh95yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 15:12:34 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18SFCYtX019701
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 15:12:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bbbxh95y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Sep 2021 15:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA4eO5IaPDJZdXfkMwxpW5V+g6h5n7TaHUTRZ+7PvR0OGMLydWQ0b10VAUeMJsrnONlKBxpXeiiqC67ReWet3VTlQCajuHGkYxPIcHpEhplj/yHEjBLMBMGVK+5otxnB7pQG9yC/j3Qt/+ey+WleLSLrrO69gKkO1Y+kaonFuC8E7e5qecCgby3wzpSLdX3KSKdiZrE7jRkSq1Bc0CsstQJM3kdLrqHW3qgEak1zhXk43ZxFI6pk3l87J36qiYDWve2Y1HMhQm2HO+HXCsoj7LhNZvVGsv2rhReiKVOGbnLwWwvvj5mBZZozfHfgzQV6IqDwUpRtYhMRfNsg7DH7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=yYWvmY9qexOIbPdx5Ex/JrsOfM9KxSAqs9iJRR8cMtU=;
 b=HdsyySdJzTTDBHgACQAE7xqUB5fZH7340bpEzGnCtAHYratSkyCAWU2Ufowshc8kwnz8tnyNbIiAp4scksU8NW3qHYVFjz+z9syq97CnfDE5JnIyaopc76sU5tIaHX3G0J4nJ/foH29KRNt1yvxPI0jJpnsFeZa6puzI6A7WnD+Y0tLDvSjDyxHHVgIyNTNncRglNGpqqtWAdRjwNv4g7zNhvrLzlVvRpEBVIK/A99kuPQyDWbg9r8bWWwDNIQx0V56vuaIKvnwGpSSyeqp2BdqRszkTXl3fx4FlriMovwOcR0mJLmXpI+dMmLiGI8j/6jt4LuK1rYv1lPfgF7Kb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2265.namprd11.prod.outlook.com (2603:10b6:4:50::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 15:12:31 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 15:12:31 +0000
Subject: Re: [OE-core] [PATCH] state/staging: Fix directory not deleted for
 race
To: Pgowda <pgowda.cve@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
        Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com,
        Vinay Kumar <vinay.m.engg@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20210915114618.157245-1-pgowda.cve@gmail.com>
 <16A53DBD300C0C8E.4388@lists.openembedded.org>
 <07fc5dc3d216f0fa6c081506aa92701508604bab.camel@linuxfoundation.org>
 <CALY4984U1txY2y6yJQQKts20Hb6x-86gtXhHx9UoEeDxF1yyTg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <9a55811d-b950-281f-1f7a-f12b39a2ef9b@windriver.com>
Date: Tue, 28 Sep 2021 11:12:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CALY4984U1txY2y6yJQQKts20Hb6x-86gtXhHx9UoEeDxF1yyTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 SJ0PR03CA0160.namprd03.prod.outlook.com (2603:10b6:a03:338::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 28 Sep 2021 15:12:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed940e54-4131-475b-80b3-08d982926452
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2265:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB22654DC48F62732CEB5019CEF8A89@DM5PR1101MB2265.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EsK01v+xTahbXdvLLZDPfeIwLVXa2CTAkCwiy0E10u+goZiLjmoeBGOVe5dNLstl4Zy4Dt39gexEzKbbt4vNVRzR9ke4qFmqlIudSnXlgPD892rlAdd4pAxlW1ldLAefQWdlP9nOiNI5kO0w1R9Nnp7jC86zbc1xDbTHBb5vCuBsiAxkNQnUFv+82f/LdVSgIxeuQjE8O8sXXYkls2IyB4vyrb0zn3/mxrMBHjguHYCL+i1RiQ9I2Ck/WJrrBhUqJRoDyRWrwt0yhfeV6iqBp3QkosCe0wAZS0Ieqktx+LLEoOxb+l6c5Km/0DVFwIurBUCHQ6qfAyvP6qXQJwpaVWPJZB1DcTWbu0VzBaWXKnVAz8iQIFddKYGtetv44kzem3fvYQpbgW9v85GlnFj0PUfBF57o3LCj7xtLlwZC220IIjbPZRDHziY+b1qyLFgnCbI3DsbMrt5diIytuEbi2pp6qZpm7+rJLNbMXBMzO0+P4qqJXlTmmjVvyZQsV7QPyEWGlcu8+7SvqpwRhbyaCX3t/DHApd9Z8rtoGzK8tD6UVWudznNAHm5A88fUiKLggg0Y5Pi4dttFEP53jxfXky6/C6X6hqDv74OKob0xrJOKbCIGH6HMQOiIDTSCztmoHr87qHImvG2rNRxkW/mQKyZyB1ijKGjM33IQtjt/tFEPHNmtdsq/dNaY4oW06ppC5chDdAiGZT2wr+0Sc9ZviT7tnCuUhQZB6xztpVl9hCp7vrV+wvtXR9zyC8lhdQr9ZRPevTnZLoplVBY2turY9MbfmFVUj80XC1ublGFIEpEgbkwnSe3Q/AbO3Q2gIAPsrzG5aSksBNJnJZaPnDv09/DjaDSV1YlbVFHqFDYsiE9ikVFQ/+d88vHCO+ivVlJgui3J3CdOj3DjEd7AXGugnQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(86362001)(6666004)(316002)(31696002)(54906003)(110136005)(4326008)(66946007)(38350700002)(8676002)(8936002)(16576012)(66476007)(38100700002)(6486002)(2616005)(186003)(31686004)(26005)(53546011)(5660300002)(83380400001)(956004)(508600001)(2906002)(36756003)(966005)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OTRpRUFHMnZvQU92Sk9ORDJ4OW9HYmVmQmNHdExPekZGQzh0WmdiQVBaWGcr?=
 =?utf-8?B?V29tZmdpdXc2V0U2djA0TEp4cDBHNFBVenFVc0tYOGNzYW9MdTN1M3BleGdE?=
 =?utf-8?B?cVRLU2diUWVKZXZ1M0ZZN1JCbExjekk1OGV2ZStSVWppSmx0aVFsMjVNK0RD?=
 =?utf-8?B?Q0J1TjR2QVF0R0dZZXhKdWNmZmNLU2hITEZIS25PcEZqR1FmRUNFVVp1S2tT?=
 =?utf-8?B?Vk1kb2ZGWVdCQkZzWGFQQmx4c3pTTng2eWJvTXc5a0VNTUpZWk1oaHBIbTdX?=
 =?utf-8?B?MnJUQ1VTYkM5THhRRjhYbE9CcitsK3NoVGR2TmxUQjFUNlBVMnZDWnV4cHNX?=
 =?utf-8?B?dEdJb2pqd3p3MEVyeHdZRXVhTmNwQzNpSlY0R0FvMHpOM1hEU0N6TzZaSUxt?=
 =?utf-8?B?SWR1STVNakUxUHVRY2hiNWxPNGRLcXVnY1E4OWFNRHZiRnlXcWFwTGFjTEFt?=
 =?utf-8?B?ZTEyaHJoeGlFdk1KMjF0OTZ3RGVna0FwdGNXQ1ZaTjBqdmpacWhpMFM3WGJO?=
 =?utf-8?B?RHlia2RaZ3FQZFVFTjRibFJIRWFtK25wZkVjKzF1bHBaNjcvclI4b2tHaEdX?=
 =?utf-8?B?TnVibzZpQ3htNDYvV1J4YU5nNlB5Ykw4YWhwcjNPQXBpNnNublJadGpuWUln?=
 =?utf-8?B?Q0tleERWYjNLek5QODgrRVNQOXhudkpiT1JSWmg3RTFHcENyZmxTMW5iUU94?=
 =?utf-8?B?NlRhYlA3UXk3V1ArYmFIU2ZFMFQzck8zUlRNYS9TWHpvd2RXc0E3aHZOeGpR?=
 =?utf-8?B?K0VYOTl3Qm5FRmsrN05EVktOaFB6QnRyc3FOeFowdXJxa3FPdU5DbXNpRDhj?=
 =?utf-8?B?Q29WNGhLV0VFcndUNnduQkhPc3FPUHNRcjNSdWtYUTFJWnZ1dGxrV3BWVTAx?=
 =?utf-8?B?dUxkT0g4QjgzZHJhcVJHanh1OFloVVNpVVNaY2ExUi9Wd1RSMU9rQWVHaGlZ?=
 =?utf-8?B?cXl1dE9tcVdvbWRzWkZRSmgwY2ZKSnA2SDhjQzUrR2I2WTlaa0RRQTRNZ3pv?=
 =?utf-8?B?Y1Z2TEMwTEdKN1FKT1ZtOTZjOVJlVDdIYVJjTUtwb1NLY2ZFV0UwNDhNWGRN?=
 =?utf-8?B?QVg5ZytucTZqenZTSHdkVXorbGt2TUdaQW16c2lpZzZFenIvcUlMRHNWS0dy?=
 =?utf-8?B?R3lRb2ZNUkF0d3NBbFhRamM4dnZEc1YxL3Y1VmozT0pQWUhpZmhVV3RMaEg2?=
 =?utf-8?B?cC9iTlZqTjZ4QWlZcnZuci93WW91NUlmdlM5MGVpWE9lUU15bG5YTHBoNGIz?=
 =?utf-8?B?cUswbUJuSzNTNWM0eFZGTVZQdWRBRHVOQzFQOGpLTzJjczFGS0llNy9NSkoz?=
 =?utf-8?B?VWxFdkE3YTBxVGhUVTlEenplaFVTbk96dVZNcnNIdkw4eVVOcEtFY1ByZVZp?=
 =?utf-8?B?dU5ueFdaUzFnMm9JbG9CcWlDeUFHSDNSWjVBcENaZ2NTYy9iNFFFUWdydlFh?=
 =?utf-8?B?eWJTT1FubWZ6MmR2Qml2TC8ramlrbWE3WHozZEY5anRwZFJXaEFKKzVraTh5?=
 =?utf-8?B?L3hwTjVDVkdscmxVTnIwSjcwc1RoTGVqelJPKzFSRW5Dd05JbE9xTWRCVURp?=
 =?utf-8?B?L1l5bndLNXZyUWpYVjZ2T1AxbEJXU2FPMDBPRkl1N05CeEtmSndRMHRuakdW?=
 =?utf-8?B?eFZCQVl3bTloTVJsem52d0hMQVpHYUxaaE5tZ25qU0xRY3FxblVtREkxaVFP?=
 =?utf-8?B?dGtaaVpRY2NQMG1VTVF0SzJ0SXhaY292MjN0eUQzZ1FqUXRFYlE3SzkwN1hu?=
 =?utf-8?Q?VoMr1VKMTwZ3oR/Vl4Bi6s4y1RFg/2cC4KtMaGg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ed940e54-4131-475b-80b3-08d982926452
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 15:12:31.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iMCqAny/t7vmdsG3BRPSxRe3vdYOAKh57040EFf4CSkE47ZbncPe0vREFo3AJyIxFwn49nmHECCv4mA8zOB+5GtNtu7ZQbALJPTifGHcOGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2265
X-Proofpoint-ORIG-GUID: OY2U4PxhWQXbgIdbEIhDBlDWoJNWviZV
X-Proofpoint-GUID: R07YVOuNmavo0cQisVyR_lLQPHZY74vR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 15:12:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156425

Add Khem (aka Mr Musl). ;-)

On 2021-09-16 4:28 a.m., Pgowda wrote:
> Hi Richard,
> 
> Thanks for reviewing the patch and your comments.
> 
>> Looking further at this and your description, I think you might be saying there
>> are multiple levels of empty directories.
> 
> Yes. There are multiple level of directories as follows:-
> 
> /tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
> /usr/include/c++/11.2.0/x86_64-poky-linux/ext
> /tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
> /usr/include/c++/11.2.0/x86_64-poky-linux/bits
> /tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
> /usr/include/c++/11.2.0/x86_64-poky-linux
> 
>> I would also like to understand why these files overlap and are symlinks in one
>> case but directories in another. Can you show some specific examples of the
>> files in question?
> 
> It happens when we build rust-hello-world for glibc followed by musl
> as follows:-
> TCLIBC=glibc MACHINE=qemuarm bitbake rust-hello-world
> TCLIBC=musl MACHINE=qemuarm bitbake rust-hello-world
> 
> The recipe do_prepare_recipe_sysroot tries to populate the sysroot file.
> The glibc build had already generated the sysroot and copied properly.
> When we build the musl later on, it tries to remove the above
> directory and symlink
> the newly built musl files. It was deleted properly before the race
> issue was observed.
> However, after the race issue; files are being deleted but the
> directory and sub directories
> are left undeleted which resulted in the error.


All of that makes sense to me based on first reading it but I'm not
intimately familiar with toolchain sysroot setup.

> 
>> The missing json file sounds like there could be some file not being handled by
>> sstate but it is hard to know without looking at the code.
> 
> Thanks. I will try to debug the issue further.


So do you have additional information Naveen or
do you maintain that the fix presented on this thread is all that is needed.

../Randy

> 
> Regards,
> pgowda
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156105): https://lists.openembedded.org/g/openembedded-core/message/156105
> Mute This Topic: https://lists.openembedded.org/mt/85625195/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


