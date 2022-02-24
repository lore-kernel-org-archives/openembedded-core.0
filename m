Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582A8C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 02:47:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5609.1645670869578013109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 18:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=rTrUIVfy;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90546d8fae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21O2hBa5013014
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 18:47:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=cl6FHcGmc+lYwAykWlfdCdvj1I8kbQelOKfVpG8PFBo=;
 b=rTrUIVfym6C8Brdm+NuI6Ot0eF+BcjT44U1JwCGXRFy9OODF1bCSHvgrxT9qd49dKog6
 tK1geYCoeMrf8py5rK6OoHs4D0QLW3TBEUhKGUp7fTLj2tOgvwVvo/Prr3GzlXmqJydC
 ZBFT/LlTdMXvIM+s1ab+Icm01EE6lFZeMKj9/BcLgyH74ImdJg1klMvMX9nn3OgfWp1i
 q4E9CDBpkhLhdwaNULQaZVuo8quaRAYRBeGz6jS4fvRSgZc8YiDFisdCdiPdW75o3MgK
 O4TE1rk0INkfF0Py/FIZfilE+XgIhafs54fY9jbVgS3W44mD7n+QmrtcTj+XfccwaKsH Qg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecj2kt95m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 18:47:49 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21O2lmHR022394
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 18:47:48 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecj2kt95j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Feb 2022 18:47:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjzpm4Iz3NIbbJ8dFrvtsGjeTmg27qpvej8oiPvhPxx4OqOmNisot+AD0azhyU4wFl+dOMZ/HV11mVXoFfATUIitX+2bMLCDfRuBJ4E6g+Ou2/L3XME20N+pA/L+YZU+eLrDk9834xgbu7nmR3iIyvHp6nusNoy6jfumLtC/ZAB6IiqtMpVxL2mFclN1kEUcGCXowx5+xhlIYXJfhkaYmoOAnJErJAZkTpdrwzPqOZA4EePk628LCVi+NjYxUD09wU+QQy/WXyS5zN7CI4EKzDz93YM1FfAX6aEepwwtwFShAu1YH0lQFW4EUB/I02tZ1qZdHW90FoOEpxRyKB5oEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl6FHcGmc+lYwAykWlfdCdvj1I8kbQelOKfVpG8PFBo=;
 b=lVjAYkKFDUC4kopXHdiAapmcu7Kzhz/SYSPMeLoFueOuvuqbISb68dNLjf3yW+a5iCDvzq8+UnTQ79ZXcFo0d/82T/Pn3wKTourtTqEbHkx1ANwckFl5Jb5y8Is4PBNGnYLPbVp04zcwfnSxMmx5mgg30CXvD7dJbdcquP0goEu1DnMizmNueb5e4MGAgqaQiKNKw3YRilQieke7U84s5nU6/4SqNlLHfooCeYSfKW/rhd6GJW56kAlkfvxtxWPLBBnDkYykK99R43NG8mG56DktW/brwTMPBtZsn3jfaTmxKgKc79kXC2dNTlCn+hw4ssnJoE28Y4MDOkVotxHx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SN6PR11MB3182.namprd11.prod.outlook.com (2603:10b6:805:bf::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 24 Feb
 2022 02:47:45 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee%5]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 02:47:45 +0000
Message-ID: <fc74428b-86a2-739f-808c-ed364884f173@windriver.com>
Date: Wed, 23 Feb 2022 21:47:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v3] Rust Oe-Selftest implementation
Content-Language: en-CA
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org,
        nathan@nathanrossi.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
        vinay.m.engg@gmail.com
References: <20220223122218.42996-1-pgowda.cve@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220223122218.42996-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b290ca08-5194-47cb-bca5-08d9f74008fa
X-MS-TrafficTypeDiagnostic: SN6PR11MB3182:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3182B5B80BFF2A747167E736F83D9@SN6PR11MB3182.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c2J0Dll4ZMESofghwvPucQ1kPCg/BX7JJbYxzY7CnAGNOJ+BggFfH/sAvrd4fXFL6zTiYtygZgTyqLvgMe900b/1c2pEIUS1td6njbOUebKp0aRaQVa7xvh8f1YCE3Ks2uKAg9CxcldvZYlSpe2WLoN0ijM+ylH34TjIFc5uyzjIXg9mNfiQQCUTslRFg5TSezzgRhb6/FQIUisR+5m7vFRLES9ZzyYSCXbZ4YQaxDwz75ATFb1DFyBzzkgZtbtDCpLuzA535tFXmrsCxMJV9Fl18JGC9ALVbsI2eVtcNlcd/CXl6xb8IBe0UfTIibPPu8As3/rKA1cS/5qvRPqR6wuvOQsuVTYsGhlOqfzxJi0j5IwOAcpAuPDhog8sEyJrYt0VdMY8dicDUM0vFKB+9Q6pZiSdiapjmr7joi/AaQbjdI3EBPLHyzRxlAqA6Czyyx9M2yY2ApokOEnVyzMBdj9HDBoDvezKXoO1BbwJoC+vNUCq5M7U1IAU5mxEI51gp45ZbJkpHu2x2XmZFUEFINIiNO/tyN9PKDgTJol9KlTce678d3NyXCEKzqc1BgfoxJVmp+9k3//u1FjlnJOqNtN+dTGN6bd9tl4Jo4FwPEEzZciKF4WPTd1dI1neCE+k3NIcSKLsbEHxkqSFP0vzNysPyU6GU3Hyp8/4HBc5E7ZXCCmmEHPU3wtEaBiObWmAJ2yO5sMK9d6wXalatqICkX5zi7yXuLRlHMhJjbf/wG9Nw+xSRiVT4DfMqeMJFOOWrQaxmJZbOh6qhMjod/iAXvf5QZjkb5v0wilYuNoPg01rMdF9y7Wvj1WiCii4cirO2J5dHMueamab01xOZeQ/OEKd7cny5FlPAThvfOqb7Dw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(6486002)(966005)(508600001)(6666004)(83380400001)(2616005)(26005)(186003)(53546011)(52116002)(6506007)(6512007)(110136005)(31686004)(5660300002)(31696002)(2906002)(36756003)(86362001)(66946007)(66556008)(66476007)(4326008)(8936002)(316002)(38350700002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWV4QnMxNjJSMlRMVTdDbU16YThRQ05ZTHZKZ25VNnBoMW1SMUh0SVA5VWdZ?=
 =?utf-8?B?VGdNa2dSUlowSStKWlVYVVJ1MWNDZG9DazNHeDE0OU4xeWYwU2dRZlZKb2Jh?=
 =?utf-8?B?bStOYXR0VmhWd0FmK0VBQTFNa1Ryd2tuWUlQdUUyWGtZc01wTmpndXZld2w3?=
 =?utf-8?B?dlo5YUVtTGhwOGx2NU0xQmdwVGM5VFpaa0pBNnRuUDlYckE1akg1Vnd2dzhM?=
 =?utf-8?B?NHB0NGxSemlGV0R4dkFPcms1NE9GWVgyWHRpOVlLSjFMR002Um1QY0dWV2R1?=
 =?utf-8?B?WXNmbTMvRmtKL09IZWZXdDN4bzJubGs5a2hVRXdGTUtvcGpQc1dFcm1aaHB0?=
 =?utf-8?B?cXQxS2JuRlRRZlVCbGJCRFB1U3Z6UVBNUXpMSmpkQ2Y1VzBWRzdaRDhBeWpK?=
 =?utf-8?B?RUhmQWZDRWVPNS96KzltRm9nU0lwaHp0emV5Q3FwVXlCd0lyLzVNUy9Pa3Fy?=
 =?utf-8?B?Ykt6d0JnUXMrMEVHYWxpL2hYcnA0VVZoMi9jQjNDRzNvemRrcC9xR1hJc0Jz?=
 =?utf-8?B?cWp0bFhBWDlvcUhQMnBRVkNJdGtpdW9Sank0M1dBdzdTUUEvNTc5aVFJcG1Q?=
 =?utf-8?B?RENjNGRZeWV3M2JXa2dZaXZLeDVKU1FpRnFMYVlnblNSbFlSa2Y0UkRQa1M2?=
 =?utf-8?B?Zk9mRU00OXZGVlo1NHc1S0ZTcWI4MjF1MkdMWkdQWk85YjUyY0NHMTJjcWZ1?=
 =?utf-8?B?b1hlUndCZ0p5NCtqMUdWV2s1UXFRQXErSFF6dXF1WkcwYlhWN2p6ZGZBeWZr?=
 =?utf-8?B?QnZGR0FQQm90dEg5Nk5DaE1ZOEtyK2pPb0VOVVkvOXpqV0V2aVcrUnBab0FR?=
 =?utf-8?B?R2NRa3BGRENjTVZya2o5UTNHamYvcXBXaCsvNlMwY0pUajdWV25TcWc4MUhl?=
 =?utf-8?B?YUxJdWtTN0V2RGs3SzA0NjBncEx1Q0NGWC96VGt3UlZsbytGNjlVNkY1YXZ2?=
 =?utf-8?B?T2hkMXFDY1lOVFdHSGFUV3gvYmdTWFc4UUI2MG5PR1lNT1dzMllIbmVDTnQr?=
 =?utf-8?B?OHpuaTU5Q0hYbjZLRW5MUEhwR1QyMVVmL2RhS05oZ2RwSEJqQ2MxQjNRTlBN?=
 =?utf-8?B?Vm5EYjJBVHA1THJYZWV1WXd5eXhSNEt6MjdlWit5ZHFGaXZxMGFoSUxvWVVs?=
 =?utf-8?B?Ri8zSlZucU51b3BpTjQ5STF2NHJBSloxQmVyM05LeXBYWHJyNzliS3Nvc25J?=
 =?utf-8?B?U1VtMGR0bk5ZUEFqOWJDUkZ1V2FnTzRPcFV1Z3JVcnJMZHA1N0tiU1BxM1dJ?=
 =?utf-8?B?bDFzRklUSDRCOUkwbURNcFMyWGpsMFY5WWRTM0toWHdjWnNXZ2R1enUxQUFz?=
 =?utf-8?B?TWtaQzRISjEwVkZVbWk0RDh2dlRsUjE5UzBtVkY2b1psdjdJSjJJQXM4V0E3?=
 =?utf-8?B?YS92eHozOVpOL2pHb05sUkZzYUJORHhveXhzV2FLZ0MycTg1THg3VUtubWFh?=
 =?utf-8?B?bCsvbEN4N1N4OWZrd25jY0VJWHQxdFFXalVvL0Q0MldETkpKdm15b3BvUzV1?=
 =?utf-8?B?OVMrbEpVRk9YM1MyUkUzMnBXZTBEdTdCQlNkK3ZwVGJsOXJqYkFiMWEwV3Nh?=
 =?utf-8?B?Q0t6T2ZQOFU1RFFkWTl4ckY4RkVBek5uYVFqU0xmSTdwYXJ6UmxpeERvYUx6?=
 =?utf-8?B?dUU5cTJTSVREM3NFM1phdXpMUDdTKzFXdFlXMldwcy9oTHgySCtKTFVucjVO?=
 =?utf-8?B?K0JrZFNmdWxaVDFncVNVREFuUURJWUxUZ0d4ZHB4VDl4Mi9zdklxMGtLOWxW?=
 =?utf-8?B?QjdzaVRjdS8rRm5EY3pvbVB1cEZpaENSaTEzU0tjdC9tMU55OVlQQ0ZhbytI?=
 =?utf-8?B?S241SjZWb2IzZ1NBTUg5L3phZXVuTWxIYVpOUEIwOXlnZHVEWTFMbSs4ZHJr?=
 =?utf-8?B?d29ZajFxOVN2R0dDdnRUbnlpcDdOWWVqeGJEWkpmdjg4ZGgwb1V1Vk85RTVh?=
 =?utf-8?B?MDhyQmVacFFvM2RMYnZHOVRPMWJWaE1nQnA4bnc4MU0rZFBJVGl1bGJoaERD?=
 =?utf-8?B?TGZYT0ZHUUR1WitobWhvbGRMa09jRGlIc0NlNE1CYyt5amZHcXd1cE1oNUdQ?=
 =?utf-8?B?T1FxSEpXaUwwSUpaT1BWaThVZzNqbU85dEVkTUNEVGNFVGRSU1FyVVhTRXNk?=
 =?utf-8?B?Y2pJeVVubkJEdkFpUHpzaXRIaFZFcm42ODc3Y1h1Y3BpcXBnamp4Z1ZFVmFF?=
 =?utf-8?B?NytQdHB4aWpWR1RGYmlTK2d4OHRwdm9YZUVkN04wQmxGWmNud0t5TnREZUlX?=
 =?utf-8?Q?ew5IpJLpy4ckfStMiKXScpFXe/KPwIjZP4uZLeztvc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b290ca08-5194-47cb-bca5-08d9f74008fa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 02:47:45.2440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yT2iQ4Gm7rgtNca+8mzFPIs4kFPv1pegRWaDzaa7Hu7/f6Ni4v5Y2yuUuefqpUQmvQJ2zhiFKal62SP95xixSTRXrjqmPwXJvUoBuueazbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3182
X-Proofpoint-GUID: TcI9ZdlHNAkhdjMMxdEIIx395P4fKm46
X-Proofpoint-ORIG-GUID: 4qspRetBDd4uEUIcllhfhDlbQ9GSv0pO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240012
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 21O2hBa5013014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 02:47:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162288

Hi Naveen,

On 2022-02-23 07:22, Pgowda wrote:
> The patch implements Oe-selftest framework for Rust test.
I think you need a bit more of an introduction to
the patch. I assume that you and Vinay based this
in part on the gcc.py test suite so you might say so and
explain what is different and why.

Additionally, people will not be familiar with the rust test suite so
you should try to summarize that in a few sentences if possible.

I have some suggestion below but in addition to that maybe you can
include a link in this commit log to, and outline how this would differ=20
from:

 =C2=A0=C2=A0 https://rustc-dev-guide.rust-lang.org/tests/intro.html

without discussing the implementation.

> Some of the functions are as follows:-

Rather than just listing the functions, say:


To support the rust tests in oe-core, the following
functions were added:
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemutarget image.
>
> The python file builds remote-test-server and executes rust testing
> remotely using background ssh. It adds the necessary test environment
> and variables to run the rust oe-selftest.
> Print the results in case of failure of runCmd().
>
> The patch has been run and tested for X86, X86_64, Arm & Arm64 targets
> on Ubuntu-18 successfully.
>
> Most of the tests excluded in rust.py are due to the following error:-
> These tests will be included in Oe-selftest after fixing the issue.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> "build-st/tmp/work/core2-64-poky-linux/rust-testsuite/1.58.1-r0/
> rustc-1.58.1-src/build/bootstrap/debug/rustc -vV` (exit status: 101)
> --- stderr
> thread 'main' panicked at '
> kind: NotFound, message: "No such file or directory" }',
> src/bootstrap/bin/rustc.rs:175:37
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


In this commit log, add a summary of APPROXIMATELY how many tests are=20
run when building
rust outside of a bitbake environment and compare that to:

1. tests run before skipping the broken ones

2. tests run with the patch below that skips higher level modules that
 =C2=A0=C2=A0=C2=A0 are broken.

i.e.
on ubuntu, there are 12000 tests and 11,555 pass

before the disable patch, 9000 tests ran and 7777 passed

with the patch, 5500 test ran and they all passed.

I just want the reader (myself) to have an understanding of
how much we have disabled. If you have exact numbers, that's great
but I'm NOT asking you to spend hours or days gathering that data.



>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py          |  57 +
>   meta/recipes-devtools/rust/rust-testsuite.inc | 163 +++
>   .../rust-testsuite/rust-oe-selftest.patch     | 995 +++++++++++++++++=
+
>   .../rust/rust-testsuite_1.58.1.bb             |   3 +
>   4 files changed, 1218 insertions(+)
>   create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-=
selftest.patch
>   create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.58.1.b=
b
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
> new file mode 100644
> index 0000000000..1379b09af1
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +import subprocess
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_va=
rs, runqemu, Command
> +from oeqa.utils.sshcontrol import SSHControl
> +
> +# Total time taken for testing is of about 2hr 20min, with PARALLEL_MA=
KE set to 40 number of jobs.
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +	def run_check_emulated(self, *args, **kwargs):
> +		# build remote-test-server before image build
> +		recipe =3D "rust-testsuite"
> +		bitbake("{} -c compile".format(recipe))
> +		builddir =3D get_bb_var("B", "rust-testsuite")
> +		# build core-image-minimal with required packages
> +		default_installed_packages =3D ["libgcc", "libstdc++", "libatomic", =
"libgomp"]
> +		features =3D []
> +		features.append('IMAGE_FEATURES +=3D "ssh-server-openssh"')
> +		features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.format(" ".joi=
n(default_installed_packages)))
> +		self.write_config("\n".join(features))
> +		bitbake("core-image-minimal")
> +		# wrap the execution with a qemu instance
> +		with runqemu("core-image-minimal", runqemuparams =3D "nographic", qe=
muparams =3D "-m 512") as qemu:

meta/lib/oeqa/selftest/cases/gcc.py has a quick test:

# validate that SSH is working

Given that you are about to run a long test, that seems worthwhile
even if your next step is to copy over the test server.

> +			# Copy remote-test-server to image through scp
> +			ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D"roo=
t")
> +			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1=
-tools-bin/remote-test-server","~/")
> +			# Execute remote-test-server on image through background ssh
> +			command =3D '~/remote-test-server -v remote'
> +			sshrun=3Dsubprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=3D/dev=
/null', '-o',  'StrictHostKeyChecking=3Dno', '-f', "root@%s" % qemu.ip, c=
ommand),
> +                                shell=3DFalse,
> +                                stdout=3Dsubprocess.PIPE,
> +                                stderr=3Dsubprocess.PIPE)
> +			# Get the values of variables.
> +			targetsys =3D get_bb_var("TARGET_SYS", "rust-testsuite")
> +			rustlibpath =3D get_bb_var("STAGING_LIBDIR_NATIVE", "rust-testsuite=
")
> +			tmpdir =3D get_bb_var("TMPDIR", "rust-testsuite")
> +
> +			# Exclude the test folders that error out while building
> +			# Need to fix these errors and include them for testing
> +			testargs =3D "--exclude src/test/rustdoc-json --exclude src/test/ru=
n-make-fulldeps --exclude src/tools/tidy --exclude src/tools/rustfmt --ex=
clude src/tools/rustdoc-themes --exclude src/tools/rust-demangler --exclu=
de src/tools/rls --exclude src/tools/miri --exclude src/tools/linkchecker=
 --exclude src/tools/expand-yaml-anchors --exclude src/tools/compiletest =
--exclude src/tools/clippy --exclude src/tools/cargotest --exclude src/to=
ols/cargo --exclude src/test/rustdoc-gui --exclude src/rustdoc-json-types=
 --exclude src/tools/rustdoc --exclude src/librustdoc --exclude src/doc/u=
nstable-book --exclude src/doc/rustdoc --exclude src/doc/rustc --exclude =
compiler/rustc --exclude library/panic_abort --exclude library/panic_unwi=
nd --no-doc --no-fail-fast --bless"


Can you add a comment in the commit log listing why these are excluded?
It seems that they are extra features that we haven't worked on=20
supporting yet so if that's right, just say so.

> +
> +			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttool=
s.
> +			cmd =3D " export PATH=3D%s/../bin:$PATH;" % rustlibpath
> +			cmd =3D cmd + " export PATH=3D%s/../bin/%s:%s/hosttools:$PATH;" % (=
rustlibpath, targetsys, tmpdir)
> +			cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rustlib;" % rustlibpat=
h
> +			# Trigger testing.
> +			cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" % qemu.ip
> +			cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s =
--target %s ;" % (builddir, testargs, targetsys)
> +			result =3D runCmd(cmd)
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +	def test_rust(self):
> +		self.run_check_emulated("rust")

I haven't actually worked with it but in:

 =C2=A0=C2=A0 meta/lib/oeqa/selftest/cases/gcc.py

the tests can be run using qemu-system or qemu-user mode.
It seems that either mode is possible for the gcc tests.

Nathan, Richard,

Should we support both modes and which is the default
if you know offhand.

Are these gcc tests actually run in parallel in practice?
We should look into what parallelism is possible in these
rust tests but first we need to make it work even in this degraded
(skipped tests) mode.


No comments on the rest of the patch so I've removed that.
I assume that you have moved the patch from one release to another
so just out of curiosity, is that minutes, an hour, many hours or days=20
of work
to fix up when we next have to update the recipe?

Good work, hopefully it's almost ready to be merged.

Since all I've asked from you is changes to the commit log,
I hope you can provide that quickly as v4 on this thread, and
then people CCed here can provide additional comments.


--=20
# Randy MacLeod
# Wind River Linux


