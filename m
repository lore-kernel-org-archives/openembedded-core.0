Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00F8C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 14:43:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9345.1659537805255319247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 07:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=g7IzrNHt;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5214809a34=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 273BilHR004468;
	Wed, 3 Aug 2022 14:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=8dtKuEh0U0L6dJexpzKSjpkGjbLkewup5bDhKtnv/kg=;
 b=g7IzrNHtqNIZ+aZl7DmsLjDmQoINTWEGBSL4z29VC3jcxy3RFOcMJMVnuuptnzb1VeBj
 WABID5oWEVcC8NCuqKbkvCzbW1k3OKOHgsxj0pZb/UkD7qjVbqGeju78v6GnbISYlQUv
 FZix3H81j9sRyEFgOzrqm/fu/ZLPgGN2iy4hqhEx9bSpQvyALESkpnUdcaQ8hkNY4aLy
 A7nyKRVTyTHp/25HiupdDwuQ3qIJ693ODBQAcEtqk7PB8QzDxWSUkWXSnNPEfHEEdGT3
 biRkAgUuljrn4zQSBvMMXZCjD3s0NsCXrL6P2rASf63vHm+RTOA4U8zHnOAalgFOigMN mQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmsv23ce8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 14:43:24 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 273EhNI8005064;
	Wed, 3 Aug 2022 14:43:23 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmsv23ce7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 14:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNpVvMbfZ5L0lbL5Qsde4jb2WE/wOfAryZJyojj6sQxRggDopIHMItGBFnsoYdGIHzkQ9VhlsjhAoV8/BPf6yK8EyerXtGV81XX3EPLO4PNEMg+1GXLtwaassJ6nP6cP05evZPE4tHuaJ44keufIXD2PiItUpxkt+99UPOQCA4jTLTEfaqIOv5eEspqHLAU0rDWH1+KZqnJ3yG75kTP2Mkm3pTQCSTGDdSUPj7m15X4jC49NtoiyEar+PDSoVMNdoKSUhbrfy90q2j6EzgDo2EbnPXAPQrGA0LfIEPnHTBiMeaYxVmQv2MeIPkgXZ79s69DdmTRJRedoO5d2kkon5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dtKuEh0U0L6dJexpzKSjpkGjbLkewup5bDhKtnv/kg=;
 b=QNNYJf19wJ2LHzcXm5lYjUdN6rnNp/oLc9ynssjn5yljiMKTdsy2X/a+kPPwQciAX+fyQWSjs5Gxek9cuW6hwDLT0I5+5xnBGItx9cPnSfeSgA5U9dDrzRq2f0fZxaXrrKxzm33mTm2caXQe/c9hBXwWVq9Q11+6tI8nEooq5g+ueemGVkPkb9d0bnyPCAhJhWu0Ccjpnv69IyRUruR9Ec9WhXf5N+diR/KLleKqZUvSh5faFp0k4SGDajk5+e0JrCmhbqdLZxdw5w8eKDFrcNfr6rxC9Gsf7xaZ4//5Q9zBCFE3kJQHJvR6gAW8742hx2FQbEDwY0unI1ZQQzryAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN6PR11MB1937.namprd11.prod.outlook.com (2603:10b6:404:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 14:43:21 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 14:43:21 +0000
Message-ID: <b809b2fb-0495-1feb-76b0-a0bfb2f0f387@windriver.com>
Date: Wed, 3 Aug 2022 10:43:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v7] Rust Oe-Selftest implementation
Content-Language: en-CA
To: Pgowda <pgowda.cve@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
        openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
        Vinay Kumar <vinay.m.engg@gmail.com>
References: <20220802122005.31100-1-pgowda.cve@gmail.com>
 <1707D9665C148D1A.1831@lists.openembedded.org>
 <20220803154310.2cf9862c@booty>
 <CALY4984fqAjM=_D-N9VtPmgknvYNAjY-0NqNjxK3Ahuv9k8g_A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CALY4984fqAjM=_D-N9VtPmgknvYNAjY-0NqNjxK3Ahuv9k8g_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a06cf298-1956-4114-dfbd-08da755e8333
X-MS-TrafficTypeDiagnostic: BN6PR11MB1937:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6jQLof4fZSiL9aNlJQJDPtaYauguKzqOaXTJBj62iapuArtrIzBL+UN1NV04tFnPZHY8HwRgScnCfNI7W1OoSRgqjR5lGuKD7/574hqsCxzoNNGyTrythGRT6cpJsCLl0m7VfQLi1/yvtsQstsmUvQ2sUncGOAI8kwUfbHWHaXb276lIHpWfasY1DX/DEwqUx7P4yC+jDwexPB82E7lFLSLWUJvmvqnKp0pcSX2J9QDQwEsPlqEmE9IPKbsFrjA35QG5sf1bVOyid9c2UJi1K41Qhu13m72cgy9Mt2UW8oY5wh3D45nI0WE+gWcricCNyJItGkupy152chhNwcbMF5NXCiMbBwjkTwVhQ8/Z0/HSV4LleZCT5zsvZKkH9TdmXHiTs8TCxgJSw3DnTGMvCXgaIam7MisbQziV/3PseBcalL2zBQc5So9Rog3FMvkrcT4qFXAB9pOEhcbPgsKw1dmq/pko9uQ4DyS0CnLa3c0IvGbTbdY4IFlzFRIsHFp5s/DgRTKDGm80+kzrweQjKvJIhdjAYAUg/7fq+L+DQNtDIb6y50MxijdHw8UYXRqV9qXn9wAnbGn5BC4g8CfhP7q9FKkGEzehNqB6lsdYM+fRPluxUnv+We0Z+RJt8X4sqlfnpDKdcEZZ36CuanXmS23IrNnSbHDV06ScwYpACO1F5xgUzzEcBGKY5LqzBNubYYms3AqNY+7WGMF942PWDTBUF6MHm9bYTwUf/7AHFQ0C03h3fStV00cPF33ZwpSd9HzH+c4EJHYGceVkIA53q4GdkA3hvAh/2Cm5cTN61L9l1vtPuXWVAZtnNT6aVSG7S2uX2ij0zDRGEMcD7TMcoDMsjP597gzRxFd/IJ1VPTa14N06Wzq5H0K994+XLyVy6BsBi49h1PtD2xeZFF2yuSH8bkFx/vWsukech+EchAho7P3njfcKtXE2dY34aXES
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(376002)(39850400004)(31686004)(36756003)(5660300002)(478600001)(316002)(54906003)(110136005)(8936002)(8676002)(4326008)(6486002)(966005)(66556008)(66476007)(66946007)(26005)(6512007)(53546011)(52116002)(6506007)(186003)(41300700001)(6666004)(2906002)(83380400001)(31696002)(2616005)(86362001)(38100700002)(38350700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGtuR250aXNEbzNVRWs2SnozMjJFOUxyemtiQlFEeWFCV2t6VFRXSFhIQmVa?=
 =?utf-8?B?eG8rUGJQbWdYb2lnV0lZYW5ud2w1TXF3RmRocm9KVHJVV1UrNFVTRWRiMDJm?=
 =?utf-8?B?MTZDcFZxT3RTZEdyemJJVnpVeERhVUY0MzhPQ29acjFoQTM4ZllHZUdCc0Uz?=
 =?utf-8?B?eC9zejFNbm5WYllEa2plbEFZazY5TDdyZWJNRHdUYW1jMlZvYjhJTDIra1po?=
 =?utf-8?B?Z2lzUG1NcG1QTEUwWUhJNXhnZTZzN3pldW5IZ3c4amgrdXdnRFoyVkpiRk5y?=
 =?utf-8?B?WHFmS2ZIVnJPazZ4Y1FocXJEeE5tc1FtNW0zb2lObzc2YnRHbXNTTVpUam5I?=
 =?utf-8?B?RGNPbmUxRGhzY2pFZDJLRzkzYlBQTTJiSGJWeUxZcmVLLzByUExmZEVZSkhZ?=
 =?utf-8?B?Yk9IbE1hbTM3YkRxSjd5d25jWXlIUUtDMmdKUUphY2xJcXM5RlNTbTE0a2dh?=
 =?utf-8?B?WU5LMUJMczlsRDBCSlcwOHl1bWdsOVMxYS9TQXZTZ0RZb29raTVlbjFlN0Yv?=
 =?utf-8?B?TklhUTlKUFNwVGNvWVlZaTF5SzVnTjlGcDBuc1VoQ1Z0LzdXU3YzangvOTZ1?=
 =?utf-8?B?cnVnQXhrU2hSZXQ5bnhFcGR0QXhxSFFHVERSVTJhajJmN0Z5OGpIMzVmdXFz?=
 =?utf-8?B?V3NCcGFVUC84cmdNbjNzTlJ4M2xNQUNxOEZvRzY1SUZ0N0tEU3I1V0xCWlZY?=
 =?utf-8?B?bWpIQVhqVmJKQS9zbE9QVU92VnhnbmR6b0lwVDdtZHRKWUNKKzNZVWxPd0Zh?=
 =?utf-8?B?S28zaXU1YWc5L2tZU3JVaFdoMUJmT3BhTU5kMDFKcEtYYktuMFNVSEZlWmVo?=
 =?utf-8?B?UGJGc2hRbXdOTmVZb0l6WXBXTUE4Zno5dXo0UHlOMU14MHhTdTdLY3hXUEZX?=
 =?utf-8?B?SXN1Uy9ndG1IdTJ3c01tT1ZhemZEZmJsOXE4UlFYQ2picXhOczFTUnhqQVNw?=
 =?utf-8?B?Z1lrWWxXWFFNTzNqSDZrTlpVbnZtN0R0YWtMcEMxeWUyaHk4VlZHMHFqaDI2?=
 =?utf-8?B?b2xiR3JhTGJzTXl3cnp4STgrTmR4cnNmaFZ3eDRoT3Z4RE1DakwyRzRCSHg4?=
 =?utf-8?B?Nm9QS291c0I3WlBLV1BJYmk3bHREMHZGV3pySUt2T2E0ODZadmNOcXV4NlRQ?=
 =?utf-8?B?VFFRS3d4c3VYV0d3TkF2ZllkRlNUNFV2bmV6T1paUHFjNk56b1FkY2JNWjBW?=
 =?utf-8?B?eGN3bEV2Qk0yQkpFblJvRjFzRVJBQUlNendraHFLY0Vlajg3aDZWaS91bWhY?=
 =?utf-8?B?RWJ3dU5SSG9zd2JMMm9BdGV3VjRRM2FIeCtIWlpKbEYrQ1dyUU5YNy9qTENz?=
 =?utf-8?B?bWZoQ2xDU2V4YklzUW1HcVlCcm1BSkNpaU1xMGhDeWhoakJpYXRQeUpBMlgr?=
 =?utf-8?B?TXNnT0Z5Zm9JaXFnYVJzK213VFpqMG41Ty8vd20zR0N2VlNLa3Z6VGVyZUxV?=
 =?utf-8?B?elBFWmRHOVk3bVRTZkk1Q1JqVklmcHBLeG16TE56bDA2bFp2WWwwdFdOUTVn?=
 =?utf-8?B?S0NiMENMWStReHRDY0FSaHpUQWlCbS9CL2VzdS9RRWdaaGxVL1c2aVljeE1w?=
 =?utf-8?B?dWlYSE01RCtRSDNpZzdsTTBrQXlkNGV1NXlIaEc4OTNXRkVlOFAzUmNjbGgv?=
 =?utf-8?B?TXlpL2tRRks2ZnhFWkg3NzVoYTdHVDVwbXcwNUVXcnZBcHJ1TkY2Z1QyUFVk?=
 =?utf-8?B?d0VVS3ExL1ZCVE1MQnpTSU9TaEh3dU5tKytHemxqTFNlbVJHQ0hYZEYrSjND?=
 =?utf-8?B?cCtjZjFFa0wzeFRKS0hZbkk5Z0MzZUpxOXBlbllUYTJicGFMTE54dTdHbENa?=
 =?utf-8?B?bFdtZlNpNGdVZDN3VVFaK3pIQkVZT3o5bDBEYmhKbmZrbWx3NUJCeVl1dEEw?=
 =?utf-8?B?czdyd3ZEK3Z4Y1VxWE42Z0hQdTNLczg2VHNzQm1FdUZuakFuOW1wWFRKS0p0?=
 =?utf-8?B?REE0Q0xCSG9yamVYUzAreW40bXVYSTI2a2VSK0I2cDJIL1hhelNTamtZUW9I?=
 =?utf-8?B?VlN6MDFpTWdIeEtZRlFCQUJ4UGxQaFZ6dDE3OWlHc3JUeFRKRDJkUWxHMDV1?=
 =?utf-8?B?YjRLc01rR1djdzQ0SHlMWEQvYVJQbXJLYVBjZ0VsYURObGpaaTBwQlBXcFpu?=
 =?utf-8?B?UVk2d2JsOWF3QmYwTHVjQTB1ZS93c1p0bFN1cFBEYW9nREZQdzQ4R1o2NkNv?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a06cf298-1956-4114-dfbd-08da755e8333
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 14:43:21.6030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YKRbdJFWruKUQiAuKg+jgmxH43yON9im/jFg+MCJ8OUZB4iN/ekinfF6m70dWmCjqfTS9gsoq3lYr0mJ9/vKZZt0CdhuzcFwzDB7b0G87Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1937
X-Proofpoint-GUID: GZHD9Fdl1BsNygUMgTUmE-E9zVJMeMj-
X-Proofpoint-ORIG-GUID: NVvBMbNBrx5wI2govCSSGM6q9YsXWtWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1011 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 14:43:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168821

On 2022-08-03 10:28, Pgowda wrote:
> Hi Luca,
>
> Updated the maintainers list and submitted the patch as:-
> https://lists.openembedded.org/g/openembedded-core/message/168819
>
> Thanks,
> Pgowda

Thanks Naveen.

For future follow-ups on this thread and when there is more than
one version, it's good to provide a brief cover letter / section that 
explains
what has changed since the last version. eg:

https://lists.openembedded.org/g/openembedded-core/message/167252?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2CV3+%2Fproc%2Fpressure+buildstats%2C20%2C1%2C0%2C91929131


See:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

and part of:
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html

We don't require this but for large patches that have several 
iterations, it's
very helpful for the sender to summarize what has changed so that the 
gatekeeper
doesn't have to dig up the previous patch.

Thanks,

../Randy

>
> On Wed, Aug 3, 2022 at 7:13 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>> Hi Pgowda,
>>
>> On Wed, 3 Aug 2022 15:40:15 +0200
>> "Luca Ceresoli via lists.openembedded.org"
>> <luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>>
>>> On Tue,  2 Aug 2022 17:50:05 +0530
>>> "Pgowda" <pgowda.cve@gmail.com> wrote:
>>>
>>>> From: pgowda <pgowda.cve@gmail.com>
>>>>
>>>> The patch implements Rust testing framework similar to other selftest,
>>>> specifically the gcc selftest in OE. It uses the client and server
>>>> based method to test the binaries for cross-target on the image.
>>>> The test framework is a wrapper around the Rust build system as ./x.py
>>>> test.
>>>> It tests many functionalities of Rust distribution like tools,
>>>> documentation, libraries, packages, tools, Cargo, Crater etc.
>>>> Please refer the following link for detailed description of Rust
>>>> testing:-
>>>> https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
>>>>
>>>> To support the rust tests in oe-core, the following functions were
>>>> added:-
>>>> setup_cargo_environment(): Build bootstrap and some early stage tools.
>>>> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
>>>> do_configure(): To generate config.toml
>>>> do_compile(): To build "remote-test-server" for qemu target image.
>>>>
>>>> Approximate Number of Tests Run in the Rust Testsuite :- 18000
>>>> Approximate Number of Tests that FAIL in bitbake environment :- 100-150
>>>> Normally majority of the testcases are present in major folder "test/"
>>>> It contributes to more than 80% of the testcases present in Rust test
>>>> framework. These tests pass as expected on any Rust versions without
>>>> much fuss. The tests that fail are of less important and contribute to
>>>> less than 2% of the total testcases. These minor tests are observed to
>>>> work on some versions and fail on others. They have to be added, ignored
>>>> or excluded for different versions as per the behavior.
>>>> These tests have been ignored or excluded in the Rust selftest
>>>> environment to generate success of completing the testsuite.
>>>>
>>>> These tests work in parallel mode even in the skipped test mode as
>>>> expected. Although the patch to disable tests is large, it is very simple
>>>> in that it only disables tests. When updating to a newer version of Rust,
>>>> the patch can usually be ported in a day.
>>>>
>>>> Signed-off-by: pgowda <pgowda.cve@gmail.com>
>>>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>>> This patch fails because of:
>>>
>>>    AssertionError:
>>>    The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
>>>    rust-testsuite (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/rust/rust-testsuite_1.62.0.bb)
>>>
>>> Some logs:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3917/steps/15/logs/stdio
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3866/steps/14/logs/stdio
>> ...and there is another failure, this time it is an actual build error:
>>
>> | CMake Error at /home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/work/core2-64-poky-linux/rust-testsuite/1.62.0-r0/recipe-sysroot-native/usr/share/cmake-3.23/Modules/CMakeTestCXXCompiler.cmake:62 (message):
>> |   The C++ compiler
>> |
>> |     "/home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/work/core2-64-poky-linux/rust-testsuite/1.62.0-r0/wrapper/build-rust-cxx"
>> |
>> |   is not able to compile a simple test program.
>> |
>> |   It fails with the following output:
>> |
>> [...]
>> |     /home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/hosttools/ld: cannot find -lstdc++
>> |     collect2: error: ld returned 1 exit status
>>
>> Full log at:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5569/steps/19/logs/stdio
>>
>>
>> --
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#168820): https://lists.openembedded.org/g/openembedded-core/message/168820
>> Mute This Topic: https://lists.openembedded.org/mt/92768863/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
# Randy MacLeod
# Wind River Linux


