Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853AFC7EE2E
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 02:08:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.29991.1686449324757048105
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jun 2023 19:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mgXzI6s1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5526756141=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35B28h2V028808
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 02:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=6Up40l54W4XymdEfhqzw8hbhHsgiQcM7evJU8JnV1EU=;
 b=mgXzI6s1j+Zv8m9S6GIzJv9HBZPnq/9OebIGjq8ceqVsBVg/QyEYMkKkRc0m0kIPkN5O
 09OdzpdV9c6/usqH53tIeyNETHb/0ei8kkO0T2KGBk5eKuCLImo6X4Cq3Me8LCspXJkQ
 HFrzJDtYs/jDyTjVceWSALLBqO7bjPIDevUt2T6joH7S++bWTJq/pWdQ/vOSkXwEPP86
 tVhaXROJlt5T+CR/p25wOaYsjQZWobqNkftfktKbgu5EigX1JRiSJCQGD6b8HGAWkoC4
 Cq7vhvYk8tTWrGuw9NCERum9GK0O/MMj8MPGFNE06tJH8l2PHP9sNhxelVW1LMSJm8tq XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed00ndw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 02:08:43 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35B28hom028800
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 02:08:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed00ndv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Jun 2023 02:08:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGseuDAZU4KuuEAD8rmT8HrHUWiVwwGwZeO8DhVwqctSE7Ld2WYajLDrEApmJ0v1LN0w9L8xOTD0G7x2/mx23UNDfcreZ1qXv8zRqiejAxnjE/bEYwQnJbmR4CTjbityaXNQiZ/rLAW6YxDELvT3wTfBlFj85nDrVO3n8kjyGY14aoQzWizh9LZ+E8bN0ZUoxDsvUPEitocCrtkyRxGSZIaDVNLC1qAY8XxwVlQohvfa10EQFS31WQB+Jt5Ff+Uxa/lGg4SYARb7QCJ5a3Egkn6kA6w1pUHTcQBQjBEbBlPUvt1jgfLD8wb1xA2YSWs5xZvtk+HJYwb6KD66zm//mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Up40l54W4XymdEfhqzw8hbhHsgiQcM7evJU8JnV1EU=;
 b=YRTf2XaSjFna4SZVEEFlVvh9kNptOAfTrO3GFY4ggW8Igh8j8vbG3Cb+E6qmSQQHnxbxVgwFJpyeHcJR0uLbuFtx53v6NQ3UbweMFJ1CPCM+5195olzFSK6Dz98a9MZm3zrruRhgcwVYxmcu5biWPgr3C6AA0PtaVZCPFRrv+V7fXMC4Rz7BigjBUwTyO8ckVUAV+FKXv9k7PLTjmh5B0CLBSMOtKaqHaVypNoVViadPGrR+0oNe7UAdxLsHEPeFbncLiQq84hXUEXgGTaXN8lSJHcDRVw0nIQIwh1ISX6eiEuGAAG0j2I38kq9IA28J/AjTdtWlLQrsG01PFCitJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Sun, 11 Jun
 2023 02:08:41 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::61d5:7319:52f0:cc4b]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::61d5:7319:52f0:cc4b%6]) with mapi id 15.20.6455.039; Sun, 11 Jun 2023
 02:08:41 +0000
Date: Sat, 10 Jun 2023 22:08:38 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemux86/conf: TEST ONLY. Drop smp boot
Message-ID: <ZIUspsqML9XJtx7P@windriver.com>
References: <20230608193901.363242-1-bruce.ashfield@gmail.com>
 <3871317432553f8027c3c0d6aabcc186d6f32b07.camel@linuxfoundation.org>
 <CADkTA4OGDBUgFhmeV9BkHoWv8aPu9Y6A2B2iPRBTEhB3ny0eSw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADkTA4OGDBUgFhmeV9BkHoWv8aPu9Y6A2B2iPRBTEhB3ny0eSw@mail.gmail.com>
X-ClientProxiedBy: YT4PR01CA0295.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::6) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|DM4PR11MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2b6cc4-e989-400c-c7bf-08db6a20c6ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8Ih6eg+8jfPedxh9L+DbqGgfAM9NgGxyMucmGVq49IdvQfh7Xzxth0P2LkJDWtYAW2R1QtNEGYqDB2S1zy3LoNLUHvqQmKO8A2uHWELo1SMxh2xze+eg3LHCYURfhY1bdesIqZGLgKK/8kSNkgb0xTc5gnaIYtqVUYeiEuGZJRXGkLTZ6rSjsbM++sAE2WuFykR4EQa6AnGvubZNXF7/U0DGSN9YJk9eWu2FA+JENZOQXHa6rGgnXT/dweNXIdT4r9eCnmg7owZ4RgZQS/mrlq/0x0f9Xz1L7r7kkUQCHmGqW8uzSuICJGEfLPfnwWI6lvg9Qq1JF7Zq+qGU44hY0kV+vHw07MYxiP5k802gyofqtuZD2UdTj3rfdJ/dgKgxdsjtaPD20qSlHkzmxdRFOyTLBzgFeQ5bGFENCAXf2IUPt3V4vQHzZq2mLdlCYYSlecQHxlWreMhJTR93HxwW54MGePP9loR1u1tnnXrl60FIOF0BzLPafM9G5RbwyYbBxapgsuVJPAnkXqXB4emmXoKw5nynMZ4UpBM4028QwBU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(136003)(366004)(376002)(346002)(396003)(451199021)(478600001)(8936002)(2906002)(5660300002)(8676002)(44832011)(36756003)(86362001)(4744005)(66476007)(6916009)(66946007)(4326008)(316002)(66556008)(83380400001)(38100700002)(41300700001)(26005)(6512007)(2616005)(6506007)(186003)(966005)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9qgkDNx7srZuccJGF8TOForxDIhi+gDO1XfCg00lFMUBpZqRlT7NfaOtzolm?=
 =?us-ascii?Q?u8QkGZOG3jPwPsMGSCdktkr+B1UzOMQgTF+oZhJctS4X41WDK8W7txnrYa+E?=
 =?us-ascii?Q?2o50IGxskI+n5jmWDoR4z2cLmr6/JZbr+0vKP9kKrCIgiHJy6m9GfqRNzV81?=
 =?us-ascii?Q?sOJXSeYgiwPvPxbWY6HA3poddmRgZP7uUt5r6oFw8S4xCOOQ2J+TOlKEFEPm?=
 =?us-ascii?Q?+JebZwRXksarHfJCcKXX7bE5WvybZOmDR1/hirUASraPd+/OfyFSXFqx+auz?=
 =?us-ascii?Q?z7n5eV7NxJe4+fOFz5GB6MxfxmUXMsqUxiEMF3liQdLdVO5lTmBpf4iN9vkj?=
 =?us-ascii?Q?hCV5NPKqZ5wLp8E5R8nmRoHCUbf7OLDOqIqJsg8pfCKpi+OtDVwa9YqR3CLd?=
 =?us-ascii?Q?eyolDuuR/SM+VhqDbZpfLtLk+FlRaOQ08O5lk1+W4yL1Wb8NWArncHsW3AOx?=
 =?us-ascii?Q?GLIEEm1tCAZiFDLuenRoH7ks2PyKsbbeUKRG8swich9CywnrW/Vc53MVPmGY?=
 =?us-ascii?Q?Q9gsCTmhTNYUX0eBwq/AaSZ3w65ubygEUDMdJqD72d3XHFTXGJ6OVEtTy18c?=
 =?us-ascii?Q?KeKbu0tygTo4XSDmhj8m1UzdJ2LyU9svEHUP2MXpMfAK22rs68iGL5uRsYn/?=
 =?us-ascii?Q?cly//+jS5HOzlN5G+ijmugGbvdFZdnY2CSmDCQsPtl5gcMvExpLJCOHWIRz4?=
 =?us-ascii?Q?4puUoF5D3ccLqE/xqpQ8K2kvi5CppMCSOPCMglzhXqGlgWV5DYKxIPRauh12?=
 =?us-ascii?Q?tKkstVy3wxlGtu4ciu1z6a+2ct9djy6UPuGgrQrvyWx/6K3PPhXk97tiG3FB?=
 =?us-ascii?Q?wFe7jR+kkhyU9/Sn8b1OnstQXKgPY3FRqF83VEcajrHWF4o3/pHGSzS+X2rx?=
 =?us-ascii?Q?xqeLC3TfrJFAqC+ayHQ4/YyYLiwagkQkeNQwjDxQ25HAB5GioX8PABiXsehk?=
 =?us-ascii?Q?vqVntGRriKfIB72sUa9wwsFPwYbwWiD8KRFfsO6/05Av7ZcXVt1DvWtCi2sW?=
 =?us-ascii?Q?BkhDHamktiWaYw19gWofawuxl0oKWTCqoEaNd0HpIKgUKeoF8mdNUGcLAt+T?=
 =?us-ascii?Q?yLVlZlLyaA03aqf7vdQxbpqw0IH9a9ZdE/TYomYXIcoxqZrnBRoDjHb6TL8F?=
 =?us-ascii?Q?etO70bkuk4U00o/Fo8cklXt7f08zP/VEgNaHq1KQbHLTtqpduV7gzD/qZFPC?=
 =?us-ascii?Q?v260uXPtjIqFnXJnLOaW0ZxOONVddOopn8Yb1Zs0KQf23IXILJ3EKhRwytW9?=
 =?us-ascii?Q?JY2F+86+7DO6ool9Pih77sABWcHsur1mbA1SGVWuml8KmZQYCmF4/kvJSUdU?=
 =?us-ascii?Q?6NMAZNnYmijv2VRnZxSD4INR4IlyTU3j/DkiLjJ5VkTTSYkh/g/BJpdlLaQm?=
 =?us-ascii?Q?Yj5At9ZbvEkjfuV7i62g24Bw+V1B7rELPXoNfVKDO/8Q0+/HhVltY+5SeCCc?=
 =?us-ascii?Q?hbYlwVH0o1pLH5ucLu4MjPDdsAxPRIgNTsHED7zU5Y1X2N+ygscn/voPMwuA?=
 =?us-ascii?Q?Zf5RvidmLgwYVRjEnNwL9gdFpnJfrRxq7FPR0Qlmulk0XzXeOOaub2OS9Asw?=
 =?us-ascii?Q?Ims5wOPixDquM7COnUgax4/aDvRaUvooJpr6kL3NTeWOQxj7obO8cqp5fwnU?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2b6cc4-e989-400c-c7bf-08db6a20c6ec
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2023 02:08:41.2878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox4poQYpipgumCJ5YgX2kUG1GVH5Ktie1Paw8OQxi36bFYLL6g0vW54ga370tfYGhcREk9k23V5dVh5x3vNiQaau7T4iNlAdRyXHvdRqMwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
X-Proofpoint-GUID: cNKW-QUiAeCX7LN4UG8w4lHfcW7b8sLm
X-Proofpoint-ORIG-GUID: TCTrPh6V67nHA5JyUmDO0OoOGX6lDpo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-10_18,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=729
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306110018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 02:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182614

[Re: [PATCH 1/2] qemux86/conf: TEST ONLY. Drop smp boot] On 09/06/2023 (Fri 10:08) Bruce Ashfield wrote:

> On Fri, Jun 9, 2023 at 2:06???AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >

[...]

> > FWIW, this patch didn't change much. With it applied we still see:
> 
> 
> ok. so at least we can rule out it being specific to secondary cpu startup.

I'll own some of that.  I was looking forward in the dmesg where
secondary CPU init was, and ignoring looking backwards.

I have a new thought.  I still could be completely off base.  I updated
the case with my theory.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15138

Might totally be another wild goose chase.  Who knows...

Paul.
--

