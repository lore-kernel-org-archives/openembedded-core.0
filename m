Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2854FC4167E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22086.1650551268824363325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 07:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VcCNs4pk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=11109dcbdd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23LDxcvv022089
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 07:27:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=dqhaCAoDLC6L6zEYpbXsXEl20jjCipOjsctjP5KtmF4=;
 b=VcCNs4pkGCwGqcHJqo4SLt4h5GfXVYILxKvDrwEhb/Ml3mCs0klt179ule3+GISNviZG
 VKLgMLeF0HjTD6JSEHnoGNcG5lh17wOTjQKrQauycmVSrxNjALhTTOfn7IlcfLvO80iO
 q4xX5tgZQrqbgcWkUo+xItU18pB2Y1i68JxmH9rBlSVI5huGSjeVGbOZxTDj00au4ZTG
 72uktwZ/n6nnQHCK2XSrWmJeY/wkUdH+v9uKXvBoaaWc23dsdQAELRyr0UGZCthb1zlv
 qecHpL24UP6hpy200AsHogSqykCjQP9YfYfMUWa6LKJtCZUsCCF/bixku1Bpb1zXxEt8 ew==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs313tb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 07:27:48 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23LELRHe009394
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 07:27:47 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs313tb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Apr 2022 07:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeLwUUQgWmfNoP7FoTJCxQsIn6UUIImFvM1GCse77yU6efJodJJPYRer2hWuSyEl4d9CtudPhb2Ucw6e4kjoGO9dVm131ogCSztN+gVEXEl3NmfrB1lqwE9OsqhaXf38lGLUFvUei4EYhYzk/QGPT4ykM4tXNm0J18z3VinXMifoazIFHogwe82l41XDup8iWrC9UvGVMAFt0J6UjIxbFao8LVWGAC2s0CbhLoxZ+hYX1c+JtmmulmDWTSMqrqx8YdTPRngwRoTSxX7QtkXv5LZlyN9C/bI4pOMyBvJLfYAJXRgg1pN23rjSCihHwZYN36BYe1HD+Z7pa1ONThRTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqhaCAoDLC6L6zEYpbXsXEl20jjCipOjsctjP5KtmF4=;
 b=h2nNvQxEbvPAG7qesNCEgoUrnp9+vfpjQEdc18Ckcal37OT0sPZC/4CHRmhyU0W/9C5xxtQsvrwTIObCSjmcBPeeuUH1mYj/Pp82NdyQyxVGmRwa3SATniisXUYIHStDCYMsJpolm8Q7nMv0y/hb9Vy3I/PQZx1Rns9Xi7GuxGdCNT3Z8Dn6x/A6qi8pXltubCCPJvy39+6uljqUxoijwHUr1M/btMh+yRBpd2+aEXKVeQUQ9cF4uvrTJFfcw7P/fXvzvb3D/vr7Hmbeuc+43EEEkGNka6+QGabQuYpICyFLR5qLmpjZwf3qKG0UU+ga7llEt0MDNGJRWmE6NvBR8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB5396.namprd11.prod.outlook.com (2603:10b6:610:bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 14:27:44 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 14:27:44 +0000
Message-ID: <5b865e71-f562-5fdf-e283-bb3b16000df1@windriver.com>
Date: Thu, 21 Apr 2022 10:27:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core][kirkstone 00/27] Patch review
Content-Language: en-CA
To: Steve Sakoman <steve@sakoman.com>, Randy MacLeod <rwmacleod@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <16E7A00050A35F84.23874@lists.openembedded.org>
 <CAOSpxdbjagCMneqiUTotst++FJspGQXsd577H9TOfnVTm+xMpQ@mail.gmail.com>
 <CAK6=ix5yd8nrnGYEsNLrqsAVmyzZmMh-q5O-kvv16CXEZDJRCQ@mail.gmail.com>
 <CAOSpxdaOqjOFv7RaB-+ym7OZEji1tL5S6C08WAuOGLGnarWV6w@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAOSpxdaOqjOFv7RaB-+ym7OZEji1tL5S6C08WAuOGLGnarWV6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c30a1e8-1f32-4b18-5dd3-08da23a31969
X-MS-TrafficTypeDiagnostic: CH0PR11MB5396:EE_
X-Microsoft-Antispam-PRVS: 
	<CH0PR11MB5396ABB9FD7CB5A5FD36A75AF8F49@CH0PR11MB5396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mEUwmGV6bqDFJSPR1p1EytASGE8dHN5tiEMP44G0qA++xPUgX4nV+tqFR76LpUtkLE2rUvd9mXn287jA5bmg5HhmXOz9LE0rGciG5fQg13YcMFgEXkJd9bkmu2mEfJ+0X1OXt1QSqTO5AgTI6UV3GqnuHVYM/KSka4cANzLxSxuos1qeC1ZX+fLx9fNh9K/wpH64GbKYTn7l0xRKtHY1z3R1uJbWyDO3qo/yKHG/52f1FwHR9hiQmehuFef82qTer2TmzCyAQd/GpCDfPD1WVT9vP1AnI3e6hGoWhbTS1diUbytLUIUYpRYzKc5PKwpQzV7/1MMt8f0kkP7UQBrnOFafWbR3NmJ4ZMfN1wvrB5kw6JUYmPgNfwVD7wAzDvv6sKdC7ZmXQNT9J01JvmcsR5k/oBl9xluBEVXZ96oH2tK7gfN6oKh58yyur3MD3fi68m55KVtlgz2t87CPSIzyw0C/vCBI5rtMbmCjBY0QcPB3NLGU9iJfGphQrKyK/huEg/nj5E1yRPqKs+4jxkft6OxOJhcPMSoORPRHERZR7NaGODDWDVUZeLB2/V3/OfNh3kfeG4OjaWaRpFenuPgsYMi8h+KC1559rsAURs/fVhvaUC24JOuHadVmMBdIBxL2aciEdQZFl/4+4YiJfN4/xOQlGUAqyFcAIqc5WLqdAVrona7gndgMei0p+6sK+cTpteqCY7Y/zhJxKnZyN8bsuqkImbj/kXLB33N7WXJN0YZdul1fvG5+Ak4xcTMKFCXqTJQT3sP4W7BdYJqkmz76cDADp5il7ChFXTsMsACUyUbg37+O97jUeCzLjSglYOXGA+xy6AQajiW+UEsUC4Jk1a7q3cJk6+U9tOo/sQJ1XsIdQtThkqc6KvAdEWaOscJgEfIH3ydfCZvG0hoACaoxAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(316002)(966005)(6486002)(5660300002)(6666004)(31696002)(8936002)(38350700002)(86362001)(38100700002)(2906002)(508600001)(6506007)(52116002)(8676002)(53546011)(66946007)(4326008)(66556008)(186003)(66476007)(2616005)(83380400001)(36756003)(110136005)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1pnOEZXeXM4RCtyV0hjalU0TkR1bzI3Sk9tdjB0UXN2bXk2Uk54MXBaSWZD?=
 =?utf-8?B?SXQ3a25hOHhaSXNjcWlxeDZpaEhtR3MwVVZNTnRDSFJlWHlYVmtkUFpQK05z?=
 =?utf-8?B?UHd4TG14RnNrdlEwT0UzcUE1MWZrekNuMlpuS200WkdKNTBtT1ZjcUtVMFFk?=
 =?utf-8?B?WnVUMW1HczFmcWkvTmhoRitZMGNNZlpoV1B4L0tVZ2YxS2FDeTFiSnE0ZVlI?=
 =?utf-8?B?NERFa2RXS3loMnduazYyLzdDS0cvTEdXbDJRNEFxZkNGc0dUOUF5Y29IRTZU?=
 =?utf-8?B?ZTJjUll1cUVHNmJhQ2VnYnR0bnRyMnNxZDVkemlsZ04rLy9TQkZsU1cwMGE4?=
 =?utf-8?B?SWk0ZHpRWU1UNWIxZVQ0dVV1Mm00VEVBSXVxNkYvcURJaStDb0VkU1hxc29Y?=
 =?utf-8?B?aWRrNU5hMFpTdkYyVWQxV2ZUS0hwNmxtSGRkenBodWswendMS0dmbVZ4UFVF?=
 =?utf-8?B?eHlpOWFrWmVaMXpWMmdXbVBteFpUZW0ySTRnb3UySEtROFlzRzhnT3V2YTBQ?=
 =?utf-8?B?MUIyOVFtRUdZei84OGlHaWUwTEc4TTVrQWNCbG9GN2ZPN1RZNzlqQnZHSnUy?=
 =?utf-8?B?d0tZRWQ1dFpJakt1UzVqNlpQTTdRWFpRRUZmNisrYWtPamg1QWd4WHhQUzJV?=
 =?utf-8?B?V0pWL1dkZHRzWTNRRTkxdjNONTR3YmtISlJPRlQzNGN0MjFWalgyU21VVm8x?=
 =?utf-8?B?NzNNYzUzTUxLU2J5eWkwR1dxVFQxOEM5WmF1aGNtTG1UV21OWU50QjdFQVJZ?=
 =?utf-8?B?aDd3anEvQ1JaaStBNUZQamNnVWdaUEt0bTRaSU9qNkRNN0hmUnV6MkZLajhh?=
 =?utf-8?B?ZGRZRTJwOGJaVElsZHpJTnJYWGV4RUNDaDVramZla2JaRHVnMWNROUJGT2ZR?=
 =?utf-8?B?UlFIY0drYklQdGFWMWZBQ1R0ZWlXSU5ybWlNWTNKY0g4WTdaRFMxdlRNanA5?=
 =?utf-8?B?WkRub0QwZDllV3c0blJpNVpRUW9Cckt4c3hlWTFVL0svSWxPMXlaaldERW9y?=
 =?utf-8?B?WXRETTQwcVJSYlVQOUtqL1RvZ1VkbDIyNTVnK3J4RmxHUU9xOHprUjJaQ3Ja?=
 =?utf-8?B?V2xiZjg0REx1ajUwZUNlTUxKOG1FSHdZMWJsQmZidHdQVDd1NmZJK2VLaTFZ?=
 =?utf-8?B?QzZQbnp1MytVcWhocVVGVC9oOXUvcW4xaGdEcGpHdldHaHFLazQ3Tm5OZGxO?=
 =?utf-8?B?T1E2QXBlOW1kRVRQQ1ZONEpHZ1J4Yzd3MXVLcm5xU0czWHNPQ1ZJRFBwdHAv?=
 =?utf-8?B?L29RYnVvc0hCeXkzM0VxYkMxYXN5MHZseG9RZ3BUMDQwZkJvRHJvYnpPZ0sy?=
 =?utf-8?B?blFXOEdHTldFUlhqK2NCSFJ2RUpJU042UmtESjBBa25hUWtEYWpkNUVDTEhz?=
 =?utf-8?B?dzc2WTJHMU1qdU1Ray9JRVIrWHFiWm1BQTkrZVNTMkI0c3JVckN2cm9rd3BO?=
 =?utf-8?B?K01RQkdRM1Y4NTNRN2lIcUw5NkRZeW1JUHV6Uno0YUpzRW5VUTV5bThXYzg2?=
 =?utf-8?B?L0ovYzFyYzBnRytiUlFydTdickp3aGhWY0xFWG1YSDZYa1EvbjN0NmdYM0ZD?=
 =?utf-8?B?clV0NXVKWWFSRUpRMkJ0a21CT05OZjM4RHM2ekQ0OTlxb3JIc0ZvMnlaMTZm?=
 =?utf-8?B?Y2ttM3Bad3dZK2JINm9HR1M0dUtWMXVLNkV2Y3lZWTE4U1MwcUR2MmlGWHpj?=
 =?utf-8?B?L0Z3UTk5Tk9ZUnViS3VmRkpZS05wUFRqbEFtUkltZzNRamUxSDNzYkZMUnZj?=
 =?utf-8?B?cG5oRlN1WEN5VENwT1JIZDZQakNtQWtMRGhLRUEzb0RUb1Rua3haS0Fyb0J3?=
 =?utf-8?B?c2pVVmQwSzFyQVh3ajBiRWQ3R0dxdXdocDVZWVdwdnBDUndxVGt0UWpLdVUz?=
 =?utf-8?B?WlNJUVo4Mk5qTndHY0xidmJDV3BIMTNDSEExRmtidVVNczNZclhVT0FmeTAy?=
 =?utf-8?B?RFpXR0NKRzVzdlA3c1YwaUZ0c3BqdnJNR0FLdGgwTjJZK2ljYUl3SlhTTk9j?=
 =?utf-8?B?QTVKZHV6M2lFK216UjNubXpYcCtlMStCTHJPYjJSS0crUEZuaWtBcHdXK0xG?=
 =?utf-8?B?dVh2TzByMlk0ZlZrYlpBK2NqYmNQQ2I3VWh5dkwzb0RTUEs2NTJIbG5HbHRH?=
 =?utf-8?B?QklNTGlWU2ZoTXVFU3RoeVA4Q2FOa3dHSGE0SG1uUTl6UTErTldMeGN6RlB5?=
 =?utf-8?B?RndTYnE0T0s1aTBrU29MSmV3V2s3SFdIKzBSWGZIWUdmMnNMVkxqa1FXcTgw?=
 =?utf-8?B?TUgwZllubThwVTJNZVBJdGFYMGVkSGhRVDFPSDRGYjZvQ1BkSnV3cTZpQ1cz?=
 =?utf-8?B?azd1Q2FlOGZBclY2QVhYMDAyMWFpbWZOODh2UHMzYzZvUXJpdmRIM3FBa0tn?=
 =?utf-8?Q?0WnJAGP3JmgVjfk8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c30a1e8-1f32-4b18-5dd3-08da23a31969
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 14:27:44.1354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 as2L4+TQj+OrRsCuxd9RDkW5mI9b2D3MEvrwax7bZHgutRrXbROHa7k4UjS1mluQceuDuW5ECl0yhd4zTwyUXTEAfZiVfwl5T6mUlbm5AB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5396
X-Proofpoint-ORIG-GUID: ZsJD-4qP5FOIA7R7Qe80UfkSagJdWYso
X-Proofpoint-GUID: quxVDaBngRVMOAeYMO_ILYELc3mJ-C6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-21_01,2022-04-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204210078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164763

On 2022-04-21 10:00, Steve Sakoman wrote:
> On Wed, Apr 20, 2022 at 7:14 PM Randy MacLeod <rwmacleod@gmail.com> wrote:
>>
>> On Wed., Apr. 20, 2022, 10:54 Steve Sakoman, <steve@sakoman.com> wrote:
>>> On Wed, Apr 20, 2022 at 4:08 AM Steve Sakoman via
>>> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
>>> wrote:
>>>> Please review this set of patches for kirkstone and have comments back by
>>>> end of day Friday.
>>> I'd particularly like feedback on the security/bug fix version updates
>>> at the end of this series.
>>>
>>> In the past I took these only on request.
>>>
>>> Would people like me to be more proactive on this type of upgrade
>>> (such as this series), or should I continue to take them only on
>>> request?
>> Proactive but reasonably cautious. ;-)
> That's my feeling too.
>
>>>> Passed a-full on autobuilder:
>>>>
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3547
>>>>
>>>> The following changes since commit d2ba3b8850d461bc7b773240cdf15b22b31a3f9e:
>>>>
>>>>    lua: fix CVE-2022-28805 (2022-04-19 14:02:08 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>    git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
>>>>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut
>>>>
>>>> Alexander Kanavin (1):
>>>>    webkitgtk: adjust patch status
>>>>
>>>> Davide Gardenal (1):
>>>>    create-spdx: fix error when symlink cannot be created
>>>>
>>>> Ferry Toth (2):
>>>>    apt: add apt selftest to test signed package feeds
>>>>    package_manager: fix missing dependency on gnupg when signing deb
>>>>      package feeds
>>>>
>>>> Jon Mason (1):
>>>>    qemuarm64: use virtio pci interfaces
>>>>
>>>> Kai Kang (1):
>>>>    update_udev_hwdb: fix multilib issue with systemd
>>>>
>>>> Khem Raj (5):
>>>>    babeltrace: Disable warnings as errors
>>>>    xserver-xorg: Fix build with gcc12
>>>>    systemtap: Fix build with gcc-12
>>>>    gnupg: Disable FORTIFY_SOURCES on mips
>>>>    mdadm: Drop clang specific cflags
>>>>
>>>> Konrad Weihmann (2):
>>>>    git: correct license
>>>>    ncurses: use COPYING file
>>>>
>>>> Martin Jansa (1):
>>>>    systemd-boot: remove outdated EFI_LD comment
>>>>
>>>> Paulo Neves (1):
>>>>    selftest/lic_checksum: Add test for filename containing space
>>>>
>>>> Peter Kjellerstedt (2):
>>>>    u-boot: Correct the SRC_URI
>>>>    u-boot: Inherit pkgconfig
>>>>
>>>> Richard Purdie (1):
>>>>    buildtools-tarball: Only add cert envvars if certs are included
>>>>
>>>> Ross Burton (1):
>>>>    zlib: upgrade to 1.2.12
>>>>
>>>> wangmy (5):
>>>>    linux-firmware: upgrade 20220310 -> 20220411
>>
>> It's firmware so it should be fine but I don't know much about such things. Have  firmware updates ever broken older kernels?
>> Certainly there could be performance degradation. I guess it's a release note item for others to worry about.
> I've been doing these regularly for dunfell and it hasn't been an
> issue in the past two years.
As expected but that's good to hear.
>
>>>>    libsoup: upgrade 3.0.5 -> 3.0.6
>>>>    apt: upgrade 2.4.3 -> 2.4.4
>>>>    libusb1: upgrade 1.0.25 -> 1.0.26
>>>>    libgit2: upgrade 1.4.2 -> 1.4.3
>>>>
>>>> zhengruoqin (3):
>>>>    wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
>>>>    git: upgrade 2.35.2 -> 2.35.3
>>>>    ruby: upgrade 3.1.1 -> 3.1.2
>> These all seem like bug fix only updates.
>> Are you assuming that third number updates don't change API/ABI or looking at commit summaries, git logs, or using a tool?
> Yes, my criteria for including is that they are bug/security only updates.
>
> I don't assume anything from the version number, I review the release
> notes (if any) and the git logs.  In many cases the version updates in
> master don't include this info in the commit message.  In that case I
> add either the release notes or the git log to the commit message when
> cherry-picking from master.
That's great. The only better response would be if we could run API/ABI 
test.
I'll see if that's something that we can work on for release branches 
but no promises

or timeline for that so far.


>
> So it is a time consuming manual process :-)


It is; thanks for the careful work.


>
> BTW, those who include release notes or commit logs in their version
> bumps get smiles and brownie points from me!

+1


../Randy

>
> Steve
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164762): https://lists.openembedded.org/g/openembedded-core/message/164762
> Mute This Topic: https://lists.openembedded.org/mt/90584508/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


