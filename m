Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E145C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 04:13:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.40461.1636344829029873537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 20:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cd3fLbc0;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=69465cb01b=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A83u2dq023330
	for <openembedded-core@lists.openembedded.org>;
 Sun, 7 Nov 2021 20:13:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=iz0Ta3/VuOJfhKqJgdLLDDvAdb8UQW+YSfheAtUdlLo=;
 b=cd3fLbc0uI9HGOp0f48+PmlpfkN8PEj+y0bLvAqi+kFgdyW+/EMc7jRwr1VrXZa6tfea
 TE0xfR6/NpVyf2Y9Zhb2+UqiiXzUs1TQysYJtpZn3FjMM8tXV7szwjWT2Gx5bk+T4lm4
 I3kaDEsMfEogDpVu3Sty8fZfk+iUtwA7WALnT4/f/6Osxsv3Z1QIpM6+bxdwbWSJ6lmt
 0w2SZhs8OGq8tILbcUEYEcYGyb9CdWefmDfbs/2hihEXviTEwEX1ASn9DDHJFgW1/jRS
 wpJp/q15Stcy/xdWZZaSXcFFswSmEl6wo9b4Jez7eHZQxgq/4yNJGfSnPoLWLXEojN3x QA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c67wwrkmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 20:13:48 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A84CrnX022481
	for <openembedded-core@lists.openembedded.org>;
 Sun, 7 Nov 2021 20:13:47 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c67wwrkmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Nov 2021 20:13:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfpQskWTVVtXCsaVOYilm2fGm/ror98C0yPCK4BPy2gtXiOpYVQfsHF0bER8DMq5I0pBOjVasV1d+l5vNssR2cQQwv1Negm8FxrYKaa4csmyTYRglHmE0iPsS2qgKRrXf5gz0HWz5avSakQdjVYBK5XMXlp402vrGRgkqVhIKJxqU9cbjO6w+DG9O30NtnV5JkVEp4omF64C/0XPS+WqIXZrFl+mHoN3A+XUqKcuElGR/ii2BiQFB9d1lSnKvBpZ/cCLZYwAjMOP5hMScpcT9PzB/GOnMhKk2BYKh+HUfQ/j7uK2C2XrAFNTB8DVMZTy46l/QA1ujLS3XjVFNAu4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iz0Ta3/VuOJfhKqJgdLLDDvAdb8UQW+YSfheAtUdlLo=;
 b=dN2JLX9rSCeICM4dBlm9OdjD9nVHY46sIetqBF8Hz0d4N0FzsIRZ86V5nYnyM/yJ6pTvOcFkry3hRjIXW+58oQHj+80CQqZxhm/pR9+84z3MB9ZuP+4AA9WFGgr8skyo5tGPyFjx++Fr5sKYQSsB3bQyWsNgtn/u+69B64FElnxX3V2+iniU/0lnjqUrkc/hPMKeAFV0/fvHpg6vHGeKKIx7BJ5joOk4l3ydbXICiazUjH08KD/12GY0GKswgUf8rVbg5klx27bqfIc0rgz2yzJhbfzEra7Sh2pNCUS/qVA859uPXGjD+nTrvnvyPPEDCqankI3tTD/BsXeud4aj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5666.namprd11.prod.outlook.com (2603:10b6:303:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 8 Nov
 2021 04:13:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%9]) with mapi id 15.20.4669.011; Mon, 8 Nov 2021
 04:13:44 +0000
Subject: Re: [OE-core] [PATCH RFC 2/2] conf/recipes: Replace VIRTUAL-RUNTIME
 with PACKAGE_GLOBAL_RENAMES
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20211104110516.3616891-1-richard.purdie@linuxfoundation.org>
 <20211104110516.3616891-3-richard.purdie@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0dedf813-f6a6-1feb-13fa-8a08a287d522@windriver.com>
Date: Mon, 8 Nov 2021 12:27:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20211104110516.3616891-3-richard.purdie@linuxfoundation.org>
Content-Type: multipart/mixed;
 boundary="------------E091AF37FB769C1E85E43F89"
X-ClientProxiedBy: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from [128.224.162.158] (60.247.85.82) by
 HK0PR01CA0058.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4669.13 via Frontend
 Transport; Mon, 8 Nov 2021 04:13:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4ae6626-9639-4b66-0eee-08d9a26e275b
X-MS-TrafficTypeDiagnostic: CO6PR11MB5666:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB566624E387829E7B2A0EBB2CED919@CO6PR11MB5666.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8NfpbfgtW9VDv+OU2QpVBuEjdRJphryKWzkk/kRXNytVOatQrUvFEQM60QmUsmOmTo5u+QSHnWOUAjIdn8RFMomIHlaF6Xn+fjcHFyAzXtf3uFw/TnlrlL2PvhOK84Wn4ipHEd7SGH8LdxKQJOYjoXSwiwbqrPjtmYIdkJjIGPN3WwXWvx4sHK01Rdnk3FMwxKNN2aY62XUfop5i8Z5Y1UmoQu1IWI/AMAjjhBjxSUaeW4OH6Dv4xjQi0d80b99TeT5o0nEhoHKgyOaVpVWgfFNA8mXUbfbbXAYJRQvkvQr74QdNAe7DL6131orHm08/V8zTMC4FzfV6bWv5rzLmR3NDAmuud+b/zSmLhhqBO3cE04W313ImLQn7ey04MWoyyBc8oynUpIZd+BwcKbcrUniDKr1m3ww8JtRJZmH1J1gAvNbSMxyugmKr/v0u/g8QO2E628lUZyrxIwKb9s/VpztEHQ9uGe7TCQgJTlZZeP1tcn1F6y39rURviynkxNKdvIS5WVX/UHP4AXgky2waiCy3Wkq098KmvMz6Ka8NuSDG/NRgKvB+LWR8HghFpQblBNk/bVk7VmAPKMNahOs7JanfXL2HfKCZhiR2H7f/QNsnVXcoOhYidHHhjmtUsGYP1286jh6NOV+iI6133jBF6Ph7HaTvYYQQP2effryEvEZT1Vokf1AdufvXzXmcOYKoQf25jLApZNVSG0xuSs0d3Vs/kN6QnSAo4ulBPEutHBKINISw4v4043Myxz+ZiJnBiRmzY1Pb89PfMk8KkFIAqJzju2czsRE7IKFf5A2x+wqqpBvU4soRCHEorodGJO3jGj/5RBzgmnxkj/R4iT09xxsOJpWEVCRSY7IgkM4BEAohjIpmsWSSFW5leDhgNpzA12OY+rDJd0Y5oUt/pJ7T6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(186003)(86362001)(6706004)(2906002)(8936002)(83380400001)(16576012)(66556008)(5660300002)(166002)(31696002)(66476007)(26005)(66946007)(316002)(235185007)(38100700002)(6486002)(30864003)(31686004)(21615005)(33964004)(38350700002)(52116002)(53546011)(36756003)(508600001)(966005)(2616005)(6666004)(956004)(21314003)(78286007)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEdXQlBzZG8wR2pBdGhPWTBrVmZ4M01kSFcwZ3kwc1ZnYmVWSnY2S1d2RjNW?=
 =?utf-8?B?ZW1lVjJzMlVJaERCdHhaQWEyM2wzSGtGNFlDN1ZCb3o1eW5Sa3g4OWdWMytW?=
 =?utf-8?B?Q1MxbXFrZW1mR3NpSVVTb3kzcEtRU2hBdTFYWFNrc1hKdnFXV3NlUGFRR2Mx?=
 =?utf-8?B?WHNOQ0dNVlcrZDVCV2lCQStOK1l4Q0hQK0xTY3NuSE14enVjOVRmRUhrOTRv?=
 =?utf-8?B?a3lMUURBdnQrTzR1bktRNGtmOGJNOEZuZFNIUkh1MDdDOVRWQ1h1ZGZJazNu?=
 =?utf-8?B?WTZPeGdycDVueDJvTkx1SGtJZ2JEQkVkTThoOWpkd2JzaHAyRnphMzd4NGd2?=
 =?utf-8?B?VExDckc3RE5LZDdvZXZGbnNWeU9NaHIvT2M3RWU4UmtMazNQRzNYU3BPNkM4?=
 =?utf-8?B?QS82Z2ZOUkhHOVJWTTdYY2ExQTRHZXlnckEyU2hCR0N4dHFYVWxjbG5GS01m?=
 =?utf-8?B?WmJuaENWWW92TGZkL1Z5RmllM2lpZVJjTHJpRU13Y2N6dy9nRDFHS1RnWDVK?=
 =?utf-8?B?ODRzNk44OGpWR293YUxsRUZENHA3Qi9acGpWMzNyM3pGYzlyUi95TGNOOERK?=
 =?utf-8?B?bFo5ejlvUEdoSmdIeVQzOWwzYmsrWU1sOUYwSkxTb2pCQkNVWHVzZEZld3JZ?=
 =?utf-8?B?VmljcFRzYjExajNzUkcxaVdkSlMxa2o0S3ptR0ZoUkFmb080V2hpYWJXSnR4?=
 =?utf-8?B?bXEyQlJLSTNwd1l2S20xdmhsR0pSUThYWWpjeG1XejR6YXB3UEhSV3JONGsx?=
 =?utf-8?B?Q2NkUm5iQnpzZEhsSjBsOVhxK3hFWnR6MlZCZ0RRSmFPL1dkWDdhTm1hWlIr?=
 =?utf-8?B?bWpOMVIrdWV3WWFzZk5oUnR2WGNlckROZGZ6Y2lKZEdtYndiSDg1aUdCWGVK?=
 =?utf-8?B?NWdvdkZhQzJibWJ5VmdBUVhERTNqVE5XV2M0M25GbVdtU09DQmJpak5XZzB5?=
 =?utf-8?B?b21UQ2JUTWYzaVVZZTJ4UjJ1L203UVZBVXoxV01aZ0FCa1ArbkNtNXZVc1dP?=
 =?utf-8?B?UGxKejJBVmVleVAwaFRjbDY1bEVOSW45ek5SY2RCdWdmcnBZMjBlaTg3K1pE?=
 =?utf-8?B?WWFPOTk4cmpGY09TOWgyR1g1aU5NWGVUUEFyY0lWb1VScWV1cFhnT05mTjgr?=
 =?utf-8?B?bS9hNXpnNXN4SWhrY2MvUjB5UFR2cUNaMDY3VmdLRnh5Ris5YVRwUjhlMkNM?=
 =?utf-8?B?eTZ3WUkveWl5WjMwbEZDVjN4MnlZTTYya0hhWU4xdTdMRnZWbytQeUExMlNH?=
 =?utf-8?B?cURLUGZZUkVscmhCcmkzK0x3UG5uRlVFMmlGUUhIMmVwdkNSTWVXMDFMQW1x?=
 =?utf-8?B?TmsvSW80akdkdU5icDJtU2ZhUUZPSjgzT29abG5jTVZoeU5rT0k0MFJEVUNv?=
 =?utf-8?B?RnczbmR5dmt3S2VqMUM5a05qaGxZeE9HZmFXNHpadlI2S3NaUmNtWDl1Nlhm?=
 =?utf-8?B?SFRjQkduQmdZclA5ZExpQVhiajNKbVg1MTg3Qkg0NERCUHVPd2VGMkZxOXVq?=
 =?utf-8?B?eFZzWmdnU0ZkNE94V1FJcXBaM1E5Qkl4b3g4VlRNN28rN2hkc2o3ZzBVb2Qr?=
 =?utf-8?B?RW5SVnB4bitHZDhoRjFGdUFlYlhndWlMV1RJYXFMK1l2UE82d00xUElqNGdu?=
 =?utf-8?B?bGNnYlpuajE4RG5xc1gzZHE4OFZuREZSR1oxVjlSdnloRVNDMDNxNTBsOXFM?=
 =?utf-8?B?TVVqcXN1SXpMNDRvMGF1Mko1UTg5MThOdGZvbmwvMm13Z053Y3JwMkFDUSs0?=
 =?utf-8?B?RHMyT1M2V2w4dENhb1AvcndZc252RmtYSFR2Z3lBNWpjMG9vcjRFNTBiam5F?=
 =?utf-8?B?UXExdVR2SEx3QWw0UlhRV2ZLK09JMStyZ3cyRXVtaXNWaVgrWks2RTJnbjVY?=
 =?utf-8?B?Y01tOG80dWhNd0Zic25iOVdQTDB6MVN5cWNobFUrcXQ5UExhR2J3K3pNVGly?=
 =?utf-8?B?cWFIN2Z4cko1OHE2ZndWVXArVSszTjhlZThOcXpVaVZzK1dJZDhZcUhla2No?=
 =?utf-8?B?cXdzRE1uZ0YzUnVkc0lpZ2FpY0FWaXB1Q2RqVHVubVMxaDg3dDM5Y3dtRWcv?=
 =?utf-8?B?dDA3K0ZLUUhkZm8yMnYyQVdmSDhMN1lLemEvczhySURUTGZBSjdxbnk3K1lI?=
 =?utf-8?B?b0ZJVWxkSDJpdWR2aGI2a05OWGI1QzJqcE9ENDBlTXJITXNxNXFQTVg2Y05O?=
 =?utf-8?Q?vf6GJCQc7jLNwiCBm4N1aIs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4ae6626-9639-4b66-0eee-08d9a26e275b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 04:13:44.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RYiFmIsgtNmR8XWjEZx7n0BSuKvfJPSI7/JyBMedBVRo1FsVdYITQAfI4Bc5ZHAZaUZXe5Km9Bt4P+OEJJfABA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5666
X-Proofpoint-GUID: sEuXwEwrRDbD9g-YAHaMqsJGhcWwNoFc
X-Proofpoint-ORIG-GUID: NkaqOJMTb3T3M9FTxAgxvPF27AdLxMkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111080027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 04:13:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157963

--------------E091AF37FB769C1E85E43F89
Content-Type: multipart/alternative;
 boundary="------------72375EE16E04807DC8163093"

--------------72375EE16E04807DC8163093
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2021 07:05 PM, Richard Purdie wrote:
> I don't think anyone has ever liked VIRTUAL-RUNTIME as a solution. This patch
> replaces it with PACKAGE_GLOBAL_RENAME.
>
> There are two types of VIRTUAL-RUNTIME. Direct package replacements like
> getopt or keymaps and "namespaces" for things like "device-manager" or
> "login-manager". The later are different in that one recipe may provide
> several but they need to be configured individually. If they were all
> "systemd", we couldn't replace the correct ones.
>
> As such this patch introduces the "virtual-XXX" namespace where the
> system is expected to resolve these into final values as per the configuration.
>
> The advantage of this approach is that we no longer need to have specific
> VIRTUAL-RUNTIME parameterisation for a user to change a particular dependency,
> they can just do things like:
>
> PACKAGE_GLOBAL_RENAME[keymaps] = "mykeymaps"
>
> or simply:
>
> PACKAGE_GLOBAL_RENAME[keymaps] = ""
>
> to remove it. You can see examples of the virtual-* mappings in the init
> manager includes.
>
> This patch uses the PACKAGE_GLOBAL_RENAMES variable and mechanism from the
> previous patch to function but to be clear, this only works at package
> creation time, not at build time. As such we have to inject the virtual
> namespace into RPROVIDES. Filtering all package variables at parse time
> isn't really viable at present (the multilib classes show the work involved).
>
> Known issues:
> a) The changes apply at final image build time which means that the original
> provider would be built and the alternate only swapped in at do_rootfs.
> b) The patch throwns build-rdeps QA warnings (probably as a result of a).
> c) As a result of b) there are probably missing build dependencies
> d) The tests are unconverted.

Hi Richard,

I think this is a very good solution. From my point of view, it solves 
the problem that VIRTUAL-RUNTIME solution will never scale and is always 
tending to expand.
I tried out these two patches a little bit, made a few local changes and 
core-image-minimal built successfully without warning.

There are mainly two changes:
1) make recipe build if required
     e.g.
     PACKAGE_GLOBAL_RENAMES[A] = C, and B rdepends on A.
     We need to make sure C is built when building A.
     I order to do this, I tweaked the rpovides injection logic a little 
bit, making it apply to all PACKAGE_GLOBAL_RENAMES items.
2) make sure pkgdata is written out correctly
     As yocto uses pkgdata as the key database when creating packages 
and performing some package QA checks, we need to make sure the database 
is correct.
     In order to do this, I tweaked the write_if_exists() function a 
little bit, considering PACKAGE_GLOBAL_RENAMES, RPROVIDES, RRECOMMENDS 
and RDEPENDS.

Attached is the patch.

Regards,
Qi


> As such I suspect this patch won't quite work but I want to share it and
> see what people think and if a better solution could rise from this as a
> result. Adding "filter" support to variables as JPEW and I once discussed
> may be a different way of handling this which would also handle some multilib
> issues.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/base.bbclass                     |  6 +++++
>   meta/classes/image.bbclass                    |  3 ++-
>   meta/classes/multilib_global.bbclass          |  5 +++++
>   meta/classes/package.bbclass                  |  4 +++-
>   meta/classes/packagegroup.bbclass             |  4 ++--
>   meta/classes/update-alternatives.bbclass      |  5 +----
>   .../conf/distro/include/default-providers.inc | 13 +++++------
>   .../include/init-manager-mdev-busybox.inc     |  9 ++++----
>   .../conf/distro/include/init-manager-none.inc |  7 +++---
>   .../distro/include/init-manager-systemd.inc   |  9 ++++----
>   .../distro/include/init-manager-sysvinit.inc  |  7 +++---
>   meta/conf/layer.conf                          |  2 +-
>   meta/lib/oe/rootfs.py                         |  2 +-
>   meta/recipes-core/busybox/busybox.inc         |  4 ++--
>   meta/recipes-core/busybox/busybox_1.34.1.bb   |  6 ++---
>   .../images/core-image-minimal-initramfs.bb    |  2 +-
>   .../images/core-image-tiny-initramfs.bb       |  4 +---
>   .../initrdscripts/initramfs-framework_1.0.bb  |  4 ++--
>   .../initramfs-live-install-efi_1.0.bb         |  4 ++--
>   .../initramfs-live-install_1.0.bb             |  4 ++--
>   .../initramfs-module-install-efi_1.0.bb       |  4 ++--
>   .../initramfs-module-install_1.0.bb           |  4 ++--
>   .../packagegroups/packagegroup-base.bb        |  9 +++-----
>   .../packagegroups/packagegroup-core-boot.bb   | 22 ++++++++-----------
>   meta/recipes-devtools/dpkg/dpkg.inc           |  2 +-
>   meta/recipes-devtools/opkg/opkg_0.4.5.bb      |  2 +-
>   meta/recipes-extended/lsb/lsb-release_1.4.bb  |  2 +-
>   .../packagegroup-core-base-utils.bb           |  4 +---
>   .../packagegroup-core-full-cmdline.bb         |  9 ++++----
>   .../packagegroups/packagegroup-core-weston.bb |  2 +-
>   .../packagegroups/packagegroup-core-x11.bb    |  9 +-------
>   meta/recipes-graphics/wayland/weston-init.bb  |  6 ++---
>   meta/recipes-graphics/wayland/weston_9.0.0.bb |  2 +-
>   .../gstreamer/gstreamer1.0-omx_1.18.5.bb      |  3 +--
>   34 files changed, 88 insertions(+), 96 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index a65fcc6c1db..1395df4a02c 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -334,6 +334,12 @@ python base_eventhandler() {
>                       profprov = d.getVar("PREFERRED_PROVIDER_" + p)
>                       if profprov and pn != profprov:
>                           raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
> +
> +
> +        remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
> +        for m in remaps:
> +            if m.startswith("virtual-"):
> +                d.setVar("RPROVIDES:" + remaps[m] + ":append", " " + m)
>   }
>   
>   CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index b3f5421697d..605dcc9eee2 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -43,7 +43,7 @@ IMAGE_INSTALL_DEBUGFS ?= ""
>   
>   # These packages will be removed from a read-only rootfs after all other
>   # packages have been installed
> -ROOTFS_RO_UNNEEDED ??= "update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
> +ROOTFS_RO_UNNEEDED ??= "update-rc.d base-passwd shadow virtual-update-alternatives ${ROOTFS_BOOTSTRAP_INSTALL}"
>   
>   # packages to install from features
>   FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
> @@ -240,6 +240,7 @@ fakeroot python do_rootfs () {
>       runtime_mapping_rename("PACKAGE_INSTALL", pn, remaps, d)
>       runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, remaps, d)
>       runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, remaps, d)
> +    runtime_mapping_rename("ROOTFS_RO_UNNEEDED", pn, remaps, d)
>   
>       # Generate the initial manifest
>       create_manifest(d)
> diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
> index dae015cdaf7..aa32d0aeaed 100644
> --- a/meta/classes/multilib_global.bbclass
> +++ b/meta/classes/multilib_global.bbclass
> @@ -161,6 +161,11 @@ def preferred_ml_updates(d):
>               extras.append(translate_provide(p, a1) + "->" + translate_provide(p, a2))
>       d.appendVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", " " + " ".join(extras))
>   
> +    remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
> +    for p in prefixes:
> +        for flag in remaps:
> +            d.setVarFlag("PACKAGE_GLOBAL_RENAMES", p + flag, p + remaps[flag])
> +
>   python multilib_virtclass_handler_vendor () {
>       if isinstance(e, bb.event.ConfigParsed):
>           for v in e.data.getVar("MULTILIB_VARIANTS").split():
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index aad58ead977..f1b4bb04e83 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -655,7 +655,7 @@ def runtime_mapping_rename(varname, pkg, remaps, d):
>       new_depends = {}
>       deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
>       for depend, depversions in deps.items():
> -        new_depend = get_package_mapping(depend, pkg, remaps, d, depversions)
> +        new_depend = get_package_mapping(depend, pkg, remaps,d, depversions)
>           if depend != new_depend:
>               bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
>           new_depends[new_depend] = deps[depend]
> @@ -2519,3 +2519,5 @@ def mapping_rename_hook(d):
>       runtime_mapping_rename("RDEPENDS", pkg, remaps, d)
>       runtime_mapping_rename("RRECOMMENDS", pkg, remaps, d)
>       runtime_mapping_rename("RSUGGESTS", pkg, remaps, d)
> +mapping_rename_hook[vardeps] += "PACKAGE_GLOBAL_RENAMES"
> +
> diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
> index 557b1b6382b..de01c5d2cb6 100644
> --- a/meta/classes/packagegroup.bbclass
> +++ b/meta/classes/packagegroup.bbclass
> @@ -53,9 +53,9 @@ INHIBIT_DEFAULT_DEPS = "1"
>   python () {
>       if bb.data.inherits_class('nativesdk', d):
>           return
> -    initman = d.getVar("VIRTUAL-RUNTIME_init_manager")
> +    initman = d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager')
>       if initman and initman in ['sysvinit', 'systemd'] and not bb.utils.contains('DISTRO_FEATURES', initman, True, False, d):
> -        bb.fatal("Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (%s) matches the entries enabled in DISTRO_FEATURES" % initman)
> +        bb.fatal("Please ensure that your setting of PACKAGE_GLOBAL_RENAME[virtual-init-manager] (currently %s) matches the entries enabled in DISTRO_FEATURES" % initman)
>   }
>   
>   CVE_PRODUCT = ""
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
> index fc1ffd828cf..c28134f33e2 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -277,10 +277,7 @@ python populate_packages_updatealternatives () {
>   
>           if alt_setup_links:
>               # RDEPENDS setup
> -            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives')
> -            if provider:
> -                #bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
> -                d.appendVar('RDEPENDS:%s' % pkg, ' ' + d.getVar('MLPREFIX', False) + provider)
> +            d.appendVar('RDEPENDS:%s' % pkg, ' ' + d.getVar('MLPREFIX', False) + 'virtual-update-alternatives')
>   
>               bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
>               bb.note('%s' % alt_setup_links)
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index ea88bd4876a..5afd3ae415e 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -21,13 +21,12 @@ PREFERRED_PROVIDER_virtual/make-native ?= "make-native"
>   #
>   # Default virtual runtime providers
>   #
> -VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
> -VIRTUAL-RUNTIME_apm ?= "apm"
> -VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
> -VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
> -VIRTUAL-RUNTIME_base-utils ?= "busybox"
> -VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
> -VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
> +PACKAGE_GLOBAL_RENAMES[getopt] ?= "util-linux-getopt"
> +PACKAGE_GLOBAL_RENAMES[virtual-base-utils] ?= "busybox"
> +PACKAGE_GLOBAL_RENAMES[virtual-graphical-init-manager] ?= "xserver-nodm-init"
> +PACKAGE_GLOBAL_RENAMES[virtual-hwclock] ?= "busybox-hwclock"
> +PACKAGE_GLOBAL_RENAMES[virtual-syslog] ?= "busybox-syslog"
> +PACKAGE_GLOBAL_RENAMES[virtual-update-alternatives] ?= "update-alternatives-opkg"
>   
>   #
>   # Default recipe providers
> diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/meta/conf/distro/include/init-manager-mdev-busybox.inc
> index 12091cba68c..f9f11b15f82 100644
> --- a/meta/conf/distro/include/init-manager-mdev-busybox.inc
> +++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
> @@ -1,7 +1,6 @@
>   # enable mdev/busybox for init
>   DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd sysvinit"
> -VIRTUAL-RUNTIME_dev_manager ??= "busybox-mdev"
> -VIRTUAL-RUNTIME_init_manager ??= "busybox"
> -VIRTUAL-RUNTIME_initscripts ??= "initscripts"
> -VIRTUAL-RUNTIME_keymaps ??= "keymaps"
> -VIRTUAL-RUNTIME_login_manager ??= "busybox"
> +PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev"
> +PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "busybox-mdev"
> +PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "busybox"
> +PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "busybox"
> diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
> index bbedf898f76..b28c48ee6d1 100644
> --- a/meta/conf/distro/include/init-manager-none.inc
> +++ b/meta/conf/distro/include/init-manager-none.inc
> @@ -1,3 +1,4 @@
> -VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
> -VIRTUAL-RUNTIME_initscripts ??= "initscripts"
> -VIRTUAL-RUNTIME_login_manager ??= "busybox"
> +PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "sysvinit"
> +PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "busybox"
> +PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "udev"
> +PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev
> \ No newline at end of file
> diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
> index 7867d900283..49a8c9915d3 100644
> --- a/meta/conf/distro/include/init-manager-systemd.inc
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -1,7 +1,8 @@
>   # Use systemd for system initialization
>   DISTRO_FEATURES:append = " systemd"
>   DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
> -VIRTUAL-RUNTIME_init_manager ??= "systemd"
> -VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
> -VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
> -VIRTUAL-RUNTIME_dev_manager ??= "systemd"
> +PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "systemd"
> +PACKAGE_GLOBAL_RENAMES[initscripts] ?= "systemd-compat-units"
> +PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "shadow-base"
> +PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "systemd"
> +PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "systemd"
> diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
> index aa2393944d6..d35c6380c00 100644
> --- a/meta/conf/distro/include/init-manager-sysvinit.inc
> +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
> @@ -1,6 +1,7 @@
>   # Use sysvinit for system initialization
>   DISTRO_FEATURES:append = " sysvinit"
>   DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
> -VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
> -VIRTUAL-RUNTIME_initscripts ??= "initscripts"
> -VIRTUAL-RUNTIME_login_manager ??= "busybox"
> +PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "sysvinit"
> +PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "busybox"
> +PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "udev"
> +PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev"
> \ No newline at end of file
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index b3cc8a249e9..fedd21090d2 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -58,7 +58,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>     resolvconf->bash \
>     docbook-xsl-stylesheets->perl \
>     ca-certificates->openssl \
> -  initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
> +  initramfs-framework->virtual-base-utils \
>     initramfs-framework->eudev \
>     initramfs-framework->systemd \
>     initramfs-module-install-efi->dosfstools \
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index b0dd6255397..5d8506f4a74 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -268,7 +268,7 @@ class Rootfs(object, metaclass=ABCMeta):
>               # because its database has to available while uninstalling
>               # other packages, allowing alternative symlinks of packages
>               # to be uninstalled or to be managed correctly otherwise.
> -            provider = self.d.getVar("VIRTUAL-RUNTIME_update-alternatives")
> +            provider = self.d.getVarFlag("PACKAGE_GLOBAL_RENAMES", "virtual-update-alternatives")
>               pkgs_to_remove = sorted([pkg for pkg in pkgs_installed if pkg in unneeded_pkgs], key=lambda x: x == provider)
>   
>               # update-alternatives provider is removed in its own remove()
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 622325aabb3..f6bc46254e3 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -50,7 +50,7 @@ CONFFILES:${PN}-mdev = "${sysconfdir}/mdev.conf"
>   
>   RRECOMMENDS:${PN} = "${PN}-udhcpc"
>   
> -RDEPENDS:${PN} = "${@["", "busybox-inittab"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]}"
> +RDEPENDS:${PN} = "${@["", "busybox-inittab"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]}"
>   
>   inherit cml1 systemd update-rc.d ptest
>   
> @@ -307,7 +307,7 @@ do_install () {
>   			install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
>   		fi
>   	fi
> -	if grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','busybox','true','false',d)}; then
> +	if grep -q "CONFIG_INIT=y" ${B}/.config && ${@["false", "true"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]}; then
>   		install -D -m 0755 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
>   		install -D -m 0755 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
>   		install -D -m 0755 ${WORKDIR}/rcS.default ${D}${sysconfdir}/default/rcS
> diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb b/meta/recipes-core/busybox/busybox_1.34.1.bb
> index 6aed0f0476e..3bb7560e2a3 100644
> --- a/meta/recipes-core/busybox/busybox_1.34.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
> @@ -33,9 +33,9 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://getopts.cfg \
>              file://longopts.cfg \
>              file://resize.cfg \
> -           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
> -           ${@["", "file://rcS.default"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
> -           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
> +           ${@["", "file://init.cfg"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]} \
> +           ${@["", "file://rcS.default"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]} \
> +           ${@["", "file://mdev.cfg"][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-dev-manager') == 'busybox-mdev')]} \
>              file://syslog.cfg \
>              file://unicode.cfg \
>              file://rev.cfg \
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index 664fe7310e9..9f1a50f04e9 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -11,7 +11,7 @@ INITRAMFS_SCRIPTS ?= "\
>                         initramfs-module-install-efi \
>                        "
>   
> -PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
> +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} virtual-base-utils udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>   
>   # Do not pollute the initrd image with rootfs features
>   IMAGE_FEATURES = ""
> diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
> index 47470849edf..839dc5b4da0 100644
> --- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
> @@ -5,9 +5,7 @@ first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
>   actually generate an image but rather generates boot and rootfs artifacts \
>   that can subsequently be picked up by external image generation tools such as wic."
>   
> -VIRTUAL-RUNTIME_dev_manager ?= "busybox-mdev"
> -
> -PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} ${VIRTUAL-RUNTIME_dev_manager} base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
> +PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear virtual-base-utils virtual-mini-dev-manager base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>   
>   # Do not pollute the initrd image with rootfs features
>   IMAGE_FEATURES = ""
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 9e8c1dc3abb..00343b30bb2 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -1,8 +1,8 @@
>   SUMMARY = "Modular initramfs system"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
> -RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
> +RDEPENDS:${PN} += "virtual-base-utils"
> +RRECOMMENDS:${PN} = "virtual-syslog"
>   
>   PR = "r4"
>   
> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
> index ecbd567d6ca..a2ee92dee44 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
> @@ -5,8 +5,8 @@ SRC_URI = "file://init-install-efi.sh"
>   
>   PR = "r1"
>   
> -RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
> -RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
> +RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid virtual-base-utils"
> +RRECOMMENDS:${PN} = "virtual-syslog"
>   
>   S = "${WORKDIR}"
>   
> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> index 674d49ecdf9..d3c24f83859 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> @@ -7,8 +7,8 @@ PR = "r9"
>   
>   S = "${WORKDIR}"
>   
> -RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
> -RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
> +RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid virtual-base-utils"
> +RRECOMMENDS:${PN} = "virtual-syslog"
>   
>   do_install() {
>           install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
> diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> index fb194845554..2ee1c62d3dc 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> @@ -1,8 +1,8 @@
>   SUMMARY = "initramfs-framework module for EFI installation option"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -RDEPENDS:${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
> -RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
> +RDEPENDS:${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid virtual-base-utils"
> +RRECOMMENDS:${PN} = "virtual-syslog"
>   
>   PR = "r4"
>   
> diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> index 4d48d54e9ec..6f8d506ea6d 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> @@ -1,8 +1,8 @@
>   SUMMARY = "initramfs-framework module for installation option"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -RDEPENDS:${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
> -RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
> +RDEPENDS:${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid virtual-base-utils"
> +RRECOMMENDS:${PN} = "virtual-syslog"
>   
>   # The same restriction as grub
>   COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 7489ef61b03..182b9d399d0 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -41,9 +41,6 @@ PACKAGES = ' \
>               \
>               '
>   
> -# Override by distro if needed
> -VIRTUAL-RUNTIME_keymaps ?= "keymaps"
> -
>   #
>   # packagegroup-base contain stuff needed for base system (machine related)
>   #
> @@ -139,7 +136,7 @@ RRECOMMENDS:packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
>   
>   SUMMARY:packagegroup-base-keyboard = "Keyboard support"
>   RDEPENDS:packagegroup-base-keyboard = "\
> -    ${VIRTUAL-RUNTIME_keymaps}"
> +    keymaps"
>   
>   SUMMARY:packagegroup-base-pci = "PCI bus support"
>   RDEPENDS:packagegroup-base-pci = "\
> @@ -151,7 +148,7 @@ RDEPENDS:packagegroup-base-acpi = "\
>   
>   SUMMARY:packagegroup-base-apm = "APM support"
>   RDEPENDS:packagegroup-base-apm = "\
> -    ${VIRTUAL-RUNTIME_apm} \
> +    apm \
>       apmd"
>   
>   SUMMARY:packagegroup-base-ext2 = "ext2 filesystem support"
> @@ -175,7 +172,7 @@ SUMMARY:packagegroup-base-alsa = "ALSA sound support"
>   RDEPENDS:packagegroup-base-alsa = "\
>       alsa-utils-alsactl \
>       alsa-utils-amixer \
> -    ${VIRTUAL-RUNTIME_alsa-state}"
> +    alsa-state"
>   
>   RRECOMMENDS:packagegroup-base-alsa = "\
>       kernel-module-snd-mixer-oss \
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index faf7bc0026d..89e875033ca 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -10,32 +10,28 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   inherit packagegroup
>   
> -# Distro can override the following VIRTUAL-RUNTIME providers:
> -VIRTUAL-RUNTIME_dev_manager ?= "udev"
> -VIRTUAL-RUNTIME_keymaps ?= "keymaps"
> -
>   EFI_PROVIDER ??= "grub-efi"
>   
> -SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', '${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
> +SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'virtual-hwclock', '', d)} \
>                       modutils-initscripts \
>                       init-ifupdown \
> -                    ${VIRTUAL-RUNTIME_initscripts} \
> +                    initscripts \
>                      "
>   
>   RDEPENDS:${PN} = "\
>       base-files \
>       base-passwd \
> -    ${VIRTUAL-RUNTIME_base-utils} \
> +    virtual-base-utils \
>       ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
> -    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
>       ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} kernel", "", d)} \
>       netbase \
> -    ${VIRTUAL-RUNTIME_login_manager} \
> -    ${VIRTUAL-RUNTIME_init_manager} \
> -    ${VIRTUAL-RUNTIME_dev_manager} \
> -    ${VIRTUAL-RUNTIME_update-alternatives} \
> +    virtual-login-manager \
> +    virtual-init-manager \
> +    virtual-dev-manager \
> +    virtual-update-alternatives \
>       ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
>   
>   RRECOMMENDS:${PN} = "\
> -    ${VIRTUAL-RUNTIME_base-utils-syslog} \
> +    virtual-syslog \
>       ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
> index 74074cfdd7f..2955e0ba540 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -6,7 +6,7 @@ SECTION = "base"
>   
>   DEPENDS = "zlib bzip2 perl ncurses"
>   DEPENDS:class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
> -RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
> +RDEPENDS:${PN} = "virtual-update-alternatives perl"
>   RDEPENDS:${PN}:class-native = ""
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
> index f5c7d11191a..2760fc58786 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
> @@ -73,7 +73,7 @@ def package_qa_check_openssl_deprecation (package, d, messages):
>       return sane
>   
>   
> -RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
> +RDEPENDS:${PN} = "virtual-update-alternatives opkg-arch-config libarchive"
>   RDEPENDS:${PN}:class-native = ""
>   RDEPENDS:${PN}:class-nativesdk = ""
>   RDEPENDS:${PN}-ptest += "make binutils python3-core python3-compression"
> diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
> index a3bcaf51c34..fdfb652674f 100644
> --- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
> +++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://sourceforge.net/projects/lsb/files"
>   LICENSE = "GPLv2+"
>   
>   # lsb_release needs getopt
> -RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_getopt}"
> +RDEPENDS:${PN} += "getopt"
>   
>   LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
>   
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
> index b17cba4a789..d7470d8fe83 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
> @@ -9,8 +9,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   inherit packagegroup
>   
> -VIRTUAL-RUNTIME_vim ?= "vim-tiny"
> -
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   RDEPENDS:${PN} = "\
> @@ -54,7 +52,7 @@ RDEPENDS:${PN} = "\
>       time \
>       unzip \
>       util-linux \
> -    ${VIRTUAL-RUNTIME_vim} \
> +    vim-tiny \
>       wget \
>       which \
>       xz \
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> index 14a7bded953..a9bb8a91ffe 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> @@ -114,13 +114,12 @@ RDEPENDS:packagegroup-core-full-cmdline-dev-utils = "\
>       patch \
>       "
>   
> -VIRTUAL-RUNTIME_syslog ?= "sysklogd"
>   RDEPENDS:packagegroup-core-full-cmdline-initscripts = "\
> -    ${VIRTUAL-RUNTIME_initscripts} \
> -    ${VIRTUAL-RUNTIME_init_manager} \
> +    initscripts \
> +    virtual-init-manager \
>       ethtool \
> -    ${VIRTUAL-RUNTIME_login_manager} \
> -    ${VIRTUAL-RUNTIME_syslog} \
> +    virtual-login-manager \
> +    virtual-syslog \
>       "
>   
>   RDEPENDS:packagegroup-core-full-cmdline-multiuser = "\
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
> index 0ce91ca9403..69d72ffd276 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
> @@ -5,7 +5,7 @@ PR = "r1"
>   inherit packagegroup features_check
>   
>   # weston-init requires pam enabled if started via systemd
> -REQUIRED_DISTRO_FEATURES = "wayland ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
> +REQUIRED_DISTRO_FEATURES = "wayland ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}"
>   
>   RDEPENDS:${PN} = "\
>       weston \
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> index 9ca058b38bd..5596e18de97 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> @@ -9,12 +9,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
>   
>   PACKAGES = "${PN} ${PN}-utils"
>   
> -# backwards compatibility for xserver-common
> -VIRTUAL-RUNTIME_xserver_common ?= ""
> -
> -# elsa, xserver-nodm-init
> -VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
> -
>   SUMMARY = "X11 display server and basic utilities"
>   RDEPENDS:${PN} = "\
>       ${PN}-xserver \
> @@ -23,8 +17,7 @@ RDEPENDS:${PN} = "\
>   
>   SUMMARY:${PN}-utils = "X11 basic utilities and init"
>   RDEPENDS:${PN}-utils = "\
> -    ${VIRTUAL-RUNTIME_xserver_common} \
> -    ${VIRTUAL-RUNTIME_graphical_init_manager} \
> +    virtual-graphical-init-manager \
>       xauth \
>       xhost \
>       xset \
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> index e02da0c3589..79b05bd60cd 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -28,7 +28,7 @@ DEFAULTBACKEND:qemux86-64:x86-x32 = "fbdev"
>   DEFAULTBACKEND:x86-x32 = "fbdev"
>   
>   do_install() {
> -        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> +        if [ "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)}" != "systemd" ]; then
>   		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
>   		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
>           fi
> @@ -60,7 +60,7 @@ do_install() {
>   	install -dm 755 -o weston -g weston ${D}/home/weston
>   }
>   
> -INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
> +INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", '1', '', d)}"
>   
>   inherit update-rc.d features_check systemd useradd
>   
> @@ -68,7 +68,7 @@ USERADD_PACKAGES = "${PN}"
>   
>   # rdepends on weston which depends on virtual/egl
>   # requires pam enabled if started via systemd
> -REQUIRED_DISTRO_FEATURES = "opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
> +REQUIRED_DISTRO_FEATURES = "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}"
>   
>   RDEPENDS:${PN} = "weston kbd"
>   
> diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> index 59ab217a3bd..8e31075e9ed 100644
> --- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> @@ -25,7 +25,7 @@ UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>   inherit meson pkgconfig useradd features_check
>   # depends on virtual/egl
>   # weston-init requires pam enabled if started via systemd
> -REQUIRED_DISTRO_FEATURES = "opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
> +REQUIRED_DISTRO_FEATURES = "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}"
>   
>   DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
>   DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
> index b2c1eb3ea06..da4aaa22aea 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
> @@ -43,5 +43,4 @@ do_install[postfuncs] += " set_omx_core_name "
>   FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"
>   FILES:${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
>   
> -VIRTUAL-RUNTIME_libomxil ?= "libomxil"
> -RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_libomxil}"
> +RDEPENDS:${PN} = "libomxil"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157839): https://lists.openembedded.org/g/openembedded-core/message/157839
> Mute This Topic: https://lists.openembedded.org/mt/86813101/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--------------72375EE16E04807DC8163093
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/04/2021 07:05 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:20211104110516.3616891-3-richard.purdie@linuxfoundation.org" type="cite">
      <pre wrap="">I don't think anyone has ever liked VIRTUAL-RUNTIME as a solution. This patch
replaces it with PACKAGE_GLOBAL_RENAME.

There are two types of VIRTUAL-RUNTIME. Direct package replacements like
getopt or keymaps and &quot;namespaces&quot; for things like &quot;device-manager&quot; or
&quot;login-manager&quot;. The later are different in that one recipe may provide
several but they need to be configured individually. If they were all
&quot;systemd&quot;, we couldn't replace the correct ones.

As such this patch introduces the &quot;virtual-XXX&quot; namespace where the
system is expected to resolve these into final values as per the configuration.

The advantage of this approach is that we no longer need to have specific
VIRTUAL-RUNTIME parameterisation for a user to change a particular dependency,
they can just do things like:

PACKAGE_GLOBAL_RENAME[keymaps] = &quot;mykeymaps&quot;

or simply:

PACKAGE_GLOBAL_RENAME[keymaps] = &quot;&quot;

to remove it. You can see examples of the virtual-* mappings in the init 
manager includes.

This patch uses the PACKAGE_GLOBAL_RENAMES variable and mechanism from the
previous patch to function but to be clear, this only works at package
creation time, not at build time. As such we have to inject the virtual
namespace into RPROVIDES. Filtering all package variables at parse time
isn't really viable at present (the multilib classes show the work involved).

Known issues:
a) The changes apply at final image build time which means that the original
provider would be built and the alternate only swapped in at do_rootfs.
b) The patch throwns build-rdeps QA warnings (probably as a result of a).
c) As a result of b) there are probably missing build dependencies
d) The tests are unconverted.
</pre>
    </blockquote>
    <br>
    Hi Richard,<br>
    <br>
    I think this is a very good solution. From my point of view, it
    solves the problem that VIRTUAL-RUNTIME solution will never scale
    and is always tending to expand.<br>
    I tried out these two patches a little bit, made a few local changes
    and core-image-minimal built successfully without warning.<br>
    <br>
    There are mainly two changes:<br>
    1) make recipe build if required<br>
    &nbsp;&nbsp;&nbsp; e.g.<br>
    &nbsp;&nbsp;&nbsp; PACKAGE_GLOBAL_RENAMES[A] = C, and B rdepends on A.<br>
    &nbsp;&nbsp;&nbsp; We need to make sure C is built when building A.<br>
    &nbsp;&nbsp;&nbsp; I order to do this, I tweaked the rpovides injection logic a
    little bit, making it apply to all PACKAGE_GLOBAL_RENAMES items.<br>
    2) make sure pkgdata is written out correctly<br>
    &nbsp;&nbsp;&nbsp; As yocto uses pkgdata as the key database when creating packages
    and performing some package QA checks, we need to make sure the
    database is correct.<br>
    &nbsp;&nbsp;&nbsp; In order to do this, I tweaked the write_if_exists() function a
    little bit, considering PACKAGE_GLOBAL_RENAMES, RPROVIDES,
    RRECOMMENDS and RDEPENDS.<br>
    <br>
    Attached is the patch.<br>
    <br>
    Regards,<br>
    Qi<br>
    <br>
    <br>
    <blockquote cite="mid:20211104110516.3616891-3-richard.purdie@linuxfoundation.org" type="cite">
      <pre wrap="">
As such I suspect this patch won't quite work but I want to share it and
see what people think and if a better solution could rise from this as a
result. Adding &quot;filter&quot; support to variables as JPEW and I once discussed
may be a different way of handling this which would also handle some multilib
issues.

Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/classes/base.bbclass                     |  6 +++++
 meta/classes/image.bbclass                    |  3 ++-
 meta/classes/multilib_global.bbclass          |  5 +++++
 meta/classes/package.bbclass                  |  4 +++-
 meta/classes/packagegroup.bbclass             |  4 ++--
 meta/classes/update-alternatives.bbclass      |  5 +----
 .../conf/distro/include/default-providers.inc | 13 +++++------
 .../include/init-manager-mdev-busybox.inc     |  9 ++++----
 .../conf/distro/include/init-manager-none.inc |  7 +++---
 .../distro/include/init-manager-systemd.inc   |  9 ++++----
 .../distro/include/init-manager-sysvinit.inc  |  7 +++---
 meta/conf/layer.conf                          |  2 +-
 meta/lib/oe/rootfs.py                         |  2 +-
 meta/recipes-core/busybox/busybox.inc         |  4 ++--
 meta/recipes-core/busybox/busybox_1.34.1.bb   |  6 ++---
 .../images/core-image-minimal-initramfs.bb    |  2 +-
 .../images/core-image-tiny-initramfs.bb       |  4 +---
 .../initrdscripts/initramfs-framework_1.0.bb  |  4 ++--
 .../initramfs-live-install-efi_1.0.bb         |  4 ++--
 .../initramfs-live-install_1.0.bb             |  4 ++--
 .../initramfs-module-install-efi_1.0.bb       |  4 ++--
 .../initramfs-module-install_1.0.bb           |  4 ++--
 .../packagegroups/packagegroup-base.bb        |  9 +++-----
 .../packagegroups/packagegroup-core-boot.bb   | 22 ++++++++-----------
 meta/recipes-devtools/dpkg/dpkg.inc           |  2 +-
 meta/recipes-devtools/opkg/opkg_0.4.5.bb      |  2 +-
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |  2 +-
 .../packagegroup-core-base-utils.bb           |  4 +---
 .../packagegroup-core-full-cmdline.bb         |  9 ++++----
 .../packagegroups/packagegroup-core-weston.bb |  2 +-
 .../packagegroups/packagegroup-core-x11.bb    |  9 +-------
 meta/recipes-graphics/wayland/weston-init.bb  |  6 ++---
 meta/recipes-graphics/wayland/weston_9.0.0.bb |  2 +-
 .../gstreamer/gstreamer1.0-omx_1.18.5.bb      |  3 +--
 34 files changed, 88 insertions(+), 96 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a65fcc6c1db..1395df4a02c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -334,6 +334,12 @@ python base_eventhandler() {
                     profprov = d.getVar(&quot;PREFERRED_PROVIDER_&quot; + p)
                     if profprov and pn != profprov:
                         raise bb.parse.SkipRecipe(&quot;PREFERRED_PROVIDER_%s set to %s, not %s&quot; % (p, profprov, pn))
+
+
+        remaps = d.getVarFlags(&quot;PACKAGE_GLOBAL_RENAMES&quot;)
+        for m in remaps:
+            if m.startswith(&quot;virtual-&quot;):
+                d.setVar(&quot;RPROVIDES:&quot; + remaps[m] + &quot;:append&quot;, &quot; &quot; + m)
 }
 
 CONFIGURESTAMPFILE = &quot;${WORKDIR}/configure.sstate&quot;
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b3f5421697d..605dcc9eee2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -43,7 +43,7 @@ IMAGE_INSTALL_DEBUGFS ?= &quot;&quot;
 
 # These packages will be removed from a read-only rootfs after all other
 # packages have been installed
-ROOTFS_RO_UNNEEDED ??= &quot;update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}&quot;
+ROOTFS_RO_UNNEEDED ??= &quot;update-rc.d base-passwd shadow virtual-update-alternatives ${ROOTFS_BOOTSTRAP_INSTALL}&quot;
 
 # packages to install from features
 FEATURE_INSTALL = <a class="moz-txt-link-rfc2396E" href="mailto:${@''.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES',d),d))}">&quot;${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}&quot;</a>
@@ -240,6 +240,7 @@ fakeroot python do_rootfs () {
     runtime_mapping_rename(&quot;PACKAGE_INSTALL&quot;, pn, remaps, d)
     runtime_mapping_rename(&quot;PACKAGE_INSTALL_ATTEMPTONLY&quot;, pn, remaps, d)
     runtime_mapping_rename(&quot;BAD_RECOMMENDATIONS&quot;, pn, remaps, d)
+    runtime_mapping_rename(&quot;ROOTFS_RO_UNNEEDED&quot;, pn, remaps, d)
 
     # Generate the initial manifest
     create_manifest(d)
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index dae015cdaf7..aa32d0aeaed 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -161,6 +161,11 @@ def preferred_ml_updates(d):
             extras.append(translate_provide(p, a1) + &quot;-&gt;&quot; + translate_provide(p, a2))
     d.appendVar(&quot;SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS&quot;, &quot; &quot; + &quot; &quot;.join(extras))
 
+    remaps = d.getVarFlags(&quot;PACKAGE_GLOBAL_RENAMES&quot;)
+    for p in prefixes:
+        for flag in remaps:
+            d.setVarFlag(&quot;PACKAGE_GLOBAL_RENAMES&quot;, p + flag, p + remaps[flag])
+
 python multilib_virtclass_handler_vendor () {
     if isinstance(e, bb.event.ConfigParsed):
         for v in e.data.getVar(&quot;MULTILIB_VARIANTS&quot;).split():
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index aad58ead977..f1b4bb04e83 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -655,7 +655,7 @@ def runtime_mapping_rename(varname, pkg, remaps, d):
     new_depends = {}
     deps = bb.utils.explode_dep_versions2(d.getVar(varname) or &quot;&quot;)
     for depend, depversions in deps.items():
-        new_depend = get_package_mapping(depend, pkg, remaps, d, depversions)
+        new_depend = get_package_mapping(depend, pkg, remaps,d, depversions)
         if depend != new_depend:
             bb.note(&quot;package name mapping done: %s -&gt; %s&quot; % (depend, new_depend))
         new_depends[new_depend] = deps[depend]
@@ -2519,3 +2519,5 @@ def mapping_rename_hook(d):
     runtime_mapping_rename(&quot;RDEPENDS&quot;, pkg, remaps, d)
     runtime_mapping_rename(&quot;RRECOMMENDS&quot;, pkg, remaps, d)
     runtime_mapping_rename(&quot;RSUGGESTS&quot;, pkg, remaps, d)
+mapping_rename_hook[vardeps] += &quot;PACKAGE_GLOBAL_RENAMES&quot;
+
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 557b1b6382b..de01c5d2cb6 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -53,9 +53,9 @@ INHIBIT_DEFAULT_DEPS = &quot;1&quot;
 python () {
     if bb.data.inherits_class('nativesdk', d):
         return
-    initman = d.getVar(&quot;VIRTUAL-RUNTIME_init_manager&quot;)
+    initman = d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager')
     if initman and initman in ['sysvinit', 'systemd'] and not bb.utils.contains('DISTRO_FEATURES', initman, True, False, d):
-        bb.fatal(&quot;Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (%s) matches the entries enabled in DISTRO_FEATURES&quot; % initman)
+        bb.fatal(&quot;Please ensure that your setting of PACKAGE_GLOBAL_RENAME[virtual-init-manager] (currently %s) matches the entries enabled in DISTRO_FEATURES&quot; % initman)
 }
 
 CVE_PRODUCT = &quot;&quot;
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index fc1ffd828cf..c28134f33e2 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -277,10 +277,7 @@ python populate_packages_updatealternatives () {
 
         if alt_setup_links:
             # RDEPENDS setup
-            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives')
-            if provider:
-                #bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
-                d.appendVar('RDEPENDS:%s' % pkg, ' ' + d.getVar('MLPREFIX', False) + provider)
+            d.appendVar('RDEPENDS:%s' % pkg, ' ' + d.getVar('MLPREFIX', False) + 'virtual-update-alternatives')
 
             bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ea88bd4876a..5afd3ae415e 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -21,13 +21,12 @@ PREFERRED_PROVIDER_virtual/make-native ?= &quot;make-native&quot;
 #
 # Default virtual runtime providers
 #
-VIRTUAL-RUNTIME_update-alternatives ?= &quot;update-alternatives-opkg&quot;
-VIRTUAL-RUNTIME_apm ?= &quot;apm&quot;
-VIRTUAL-RUNTIME_alsa-state ?= &quot;alsa-state&quot;
-VIRTUAL-RUNTIME_getopt ?= &quot;util-linux-getopt&quot;
-VIRTUAL-RUNTIME_base-utils ?= &quot;busybox&quot;
-VIRTUAL-RUNTIME_base-utils-hwclock ?= &quot;busybox-hwclock&quot;
-VIRTUAL-RUNTIME_base-utils-syslog ?= &quot;busybox-syslog&quot;
+PACKAGE_GLOBAL_RENAMES[getopt] ?= &quot;util-linux-getopt&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-base-utils] ?= &quot;busybox&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-graphical-init-manager] ?= &quot;xserver-nodm-init&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-hwclock] ?= &quot;busybox-hwclock&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-syslog] ?= &quot;busybox-syslog&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-update-alternatives] ?= &quot;update-alternatives-opkg&quot;
 
 #
 # Default recipe providers
diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/meta/conf/distro/include/init-manager-mdev-busybox.inc
index 12091cba68c..f9f11b15f82 100644
--- a/meta/conf/distro/include/init-manager-mdev-busybox.inc
+++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
@@ -1,7 +1,6 @@
 # enable mdev/busybox for init
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = &quot; systemd sysvinit&quot;
-VIRTUAL-RUNTIME_dev_manager ??= &quot;busybox-mdev&quot;
-VIRTUAL-RUNTIME_init_manager ??= &quot;busybox&quot;
-VIRTUAL-RUNTIME_initscripts ??= &quot;initscripts&quot;
-VIRTUAL-RUNTIME_keymaps ??= &quot;keymaps&quot;
-VIRTUAL-RUNTIME_login_manager ??= &quot;busybox&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= &quot;busybox-mdev&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= &quot;busybox-mdev&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= &quot;busybox&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= &quot;busybox&quot;
diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
index bbedf898f76..b28c48ee6d1 100644
--- a/meta/conf/distro/include/init-manager-none.inc
+++ b/meta/conf/distro/include/init-manager-none.inc
@@ -1,3 +1,4 @@
-VIRTUAL-RUNTIME_init_manager ??= &quot;sysvinit&quot;
-VIRTUAL-RUNTIME_initscripts ??= &quot;initscripts&quot;
-VIRTUAL-RUNTIME_login_manager ??= &quot;busybox&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= &quot;sysvinit&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= &quot;busybox&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= &quot;udev&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= &quot;busybox-mdev
\ No newline at end of file
diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 7867d900283..49a8c9915d3 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -1,7 +1,8 @@
 # Use systemd for system initialization
 DISTRO_FEATURES:append = &quot; systemd&quot;
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = &quot; sysvinit&quot;
-VIRTUAL-RUNTIME_init_manager ??= &quot;systemd&quot;
-VIRTUAL-RUNTIME_initscripts ??= &quot;systemd-compat-units&quot;
-VIRTUAL-RUNTIME_login_manager ??= &quot;shadow-base&quot;
-VIRTUAL-RUNTIME_dev_manager ??= &quot;systemd&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= &quot;systemd&quot;
+PACKAGE_GLOBAL_RENAMES[initscripts] ?= &quot;systemd-compat-units&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= &quot;shadow-base&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= &quot;systemd&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= &quot;systemd&quot;
diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
index aa2393944d6..d35c6380c00 100644
--- a/meta/conf/distro/include/init-manager-sysvinit.inc
+++ b/meta/conf/distro/include/init-manager-sysvinit.inc
@@ -1,6 +1,7 @@
 # Use sysvinit for system initialization
 DISTRO_FEATURES:append = &quot; sysvinit&quot;
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = &quot; systemd&quot;
-VIRTUAL-RUNTIME_init_manager ??= &quot;sysvinit&quot;
-VIRTUAL-RUNTIME_initscripts ??= &quot;initscripts&quot;
-VIRTUAL-RUNTIME_login_manager ??= &quot;busybox&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= &quot;sysvinit&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= &quot;busybox&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= &quot;udev&quot;
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= &quot;busybox-mdev&quot;
\ No newline at end of file
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b3cc8a249e9..fedd21090d2 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -58,7 +58,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += &quot; \
   resolvconf-&gt;bash \
   docbook-xsl-stylesheets-&gt;perl \
   ca-certificates-&gt;openssl \
-  initramfs-framework-&gt;${VIRTUAL-RUNTIME_base-utils} \
+  initramfs-framework-&gt;virtual-base-utils \
   initramfs-framework-&gt;eudev \
   initramfs-framework-&gt;systemd \
   initramfs-module-install-efi-&gt;dosfstools \
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b0dd6255397..5d8506f4a74 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -268,7 +268,7 @@ class Rootfs(object, metaclass=ABCMeta):
             # because its database has to available while uninstalling
             # other packages, allowing alternative symlinks of packages
             # to be uninstalled or to be managed correctly otherwise.
-            provider = self.d.getVar(&quot;VIRTUAL-RUNTIME_update-alternatives&quot;)
+            provider = self.d.getVarFlag(&quot;PACKAGE_GLOBAL_RENAMES&quot;, &quot;virtual-update-alternatives&quot;)
             pkgs_to_remove = sorted([pkg for pkg in pkgs_installed if pkg in unneeded_pkgs], key=lambda x: x == provider)
 
             # update-alternatives provider is removed in its own remove()
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 622325aabb3..f6bc46254e3 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -50,7 +50,7 @@ CONFFILES:${PN}-mdev = &quot;${sysconfdir}/mdev.conf&quot;
 
 RRECOMMENDS:${PN} = &quot;${PN}-udhcpc&quot;
 
-RDEPENDS:${PN} = &quot;${@[&quot;&quot;, &quot;busybox-inittab&quot;][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]}&quot;
+RDEPENDS:${PN} = &quot;${@[&quot;&quot;, &quot;busybox-inittab&quot;][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]}&quot;
 
 inherit cml1 systemd update-rc.d ptest
 
@@ -307,7 +307,7 @@ do_install () {
 			install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
 		fi
 	fi
-	if grep -q &quot;CONFIG_INIT=y&quot; ${B}/.config &amp;&amp; ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','busybox','true','false',d)}; then
+	if grep -q &quot;CONFIG_INIT=y&quot; ${B}/.config &amp;&amp; ${@[&quot;false&quot;, &quot;true&quot;][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]}; then
 		install -D -m 0755 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
 		install -D -m 0755 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
 		install -D -m 0755 ${WORKDIR}/rcS.default ${D}${sysconfdir}/default/rcS
diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb b/meta/recipes-core/busybox/busybox_1.34.1.bb
index 6aed0f0476e..3bb7560e2a3 100644
--- a/meta/recipes-core/busybox/busybox_1.34.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
@@ -33,9 +33,9 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball\file://getopts.cfg\file://longopts.cfg\file://resize.cfg\-${@[">&quot;https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://getopts.cfg \
            file://longopts.cfg \
            file://resize.cfg \
-           ${@[&quot;</a>&quot;, <a class="moz-txt-link-rfc2396E" href="file://init.cfg">&quot;file://init.cfg&quot;</a>][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
-           ${@[&quot;&quot;, <a class="moz-txt-link-rfc2396E" href="file://rcS.default">&quot;file://rcS.default&quot;</a>][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
-           ${@[&quot;&quot;, <a class="moz-txt-link-rfc2396E" href="file://mdev.cfg">&quot;file://mdev.cfg&quot;</a>][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
+           ${@[&quot;&quot;, <a class="moz-txt-link-rfc2396E" href="file://init.cfg">&quot;file://init.cfg&quot;</a>][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]} \
+           ${@[&quot;&quot;, <a class="moz-txt-link-rfc2396E" href="file://rcS.default">&quot;file://rcS.default&quot;</a>][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-init-manager') == 'busybox')]} \
+           ${@[&quot;&quot;, <a class="moz-txt-link-rfc2396E" href="file://mdev.cfg">&quot;file://mdev.cfg&quot;</a>][(d.getVarFlag('PACKAGE_GLOBAL_RENAME', 'virtual-dev-manager') == 'busybox-mdev')]} \
            <a class="moz-txt-link-freetext" href="file://syslog.cfg">file://syslog.cfg</a> \
            <a class="moz-txt-link-freetext" href="file://unicode.cfg">file://unicode.cfg</a> \
            <a class="moz-txt-link-freetext" href="file://rev.cfg">file://rev.cfg</a> \
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 664fe7310e9..9f1a50f04e9 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -11,7 +11,7 @@ INITRAMFS_SCRIPTS ?= &quot;\
                       initramfs-module-install-efi \
                      &quot;
 
-PACKAGE_INSTALL = &quot;${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}&quot;
+PACKAGE_INSTALL = &quot;${INITRAMFS_SCRIPTS} virtual-base-utils udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}&quot;
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = &quot;&quot;
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 47470849edf..839dc5b4da0 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -5,9 +5,7 @@ first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
 actually generate an image but rather generates boot and rootfs artifacts \
 that can subsequently be picked up by external image generation tools such as wic.&quot;
 
-VIRTUAL-RUNTIME_dev_manager ?= &quot;busybox-mdev&quot;
-
-PACKAGE_INSTALL = &quot;initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} ${VIRTUAL-RUNTIME_dev_manager} base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}&quot;
+PACKAGE_INSTALL = &quot;initramfs-live-boot-tiny packagegroup-core-boot dropbear virtual-base-utils virtual-mini-dev-manager base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}&quot;
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = &quot;&quot;
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 9e8c1dc3abb..00343b30bb2 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = &quot;Modular initramfs system&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420">&quot;file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420&quot;</a>
-RDEPENDS:${PN} += &quot;${VIRTUAL-RUNTIME_base-utils}&quot;
-RRECOMMENDS:${PN} = &quot;${VIRTUAL-RUNTIME_base-utils-syslog}&quot;
+RDEPENDS:${PN} += &quot;virtual-base-utils&quot;
+RRECOMMENDS:${PN} = &quot;virtual-syslog&quot;
 
 PR = &quot;r4&quot;
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index ecbd567d6ca..a2ee92dee44 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -5,8 +5,8 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="file://init-install-efi.sh">&quot;file://init-install-efi.sh&quot;</a>
 
 PR = &quot;r1&quot;
 
-RDEPENDS:${PN} = &quot;parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}&quot;
-RRECOMMENDS:${PN} = &quot;${VIRTUAL-RUNTIME_base-utils-syslog}&quot;
+RDEPENDS:${PN} = &quot;parted e2fsprogs-mke2fs dosfstools util-linux-blkid virtual-base-utils&quot;
+RRECOMMENDS:${PN} = &quot;virtual-syslog&quot;
 
 S = &quot;${WORKDIR}&quot;
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 674d49ecdf9..d3c24f83859 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -7,8 +7,8 @@ PR = &quot;r9&quot;
 
 S = &quot;${WORKDIR}&quot;
 
-RDEPENDS:${PN} = &quot;grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}&quot;
-RRECOMMENDS:${PN} = &quot;${VIRTUAL-RUNTIME_base-utils-syslog}&quot;
+RDEPENDS:${PN} = &quot;grub parted e2fsprogs-mke2fs util-linux-blkid virtual-base-utils&quot;
+RRECOMMENDS:${PN} = &quot;virtual-syslog&quot;
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index fb194845554..2ee1c62d3dc 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = &quot;initramfs-framework module for EFI installation option&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420">&quot;file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420&quot;</a>
-RDEPENDS:${PN} = &quot;initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}&quot;
-RRECOMMENDS:${PN} = &quot;${VIRTUAL-RUNTIME_base-utils-syslog}&quot;
+RDEPENDS:${PN} = &quot;initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid virtual-base-utils&quot;
+RRECOMMENDS:${PN} = &quot;virtual-syslog&quot;
 
 PR = &quot;r4&quot;
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index 4d48d54e9ec..6f8d506ea6d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = &quot;initramfs-framework module for installation option&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420">&quot;file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420&quot;</a>
-RDEPENDS:${PN} = &quot;initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}&quot;
-RRECOMMENDS:${PN} = &quot;${VIRTUAL-RUNTIME_base-utils-syslog}&quot;
+RDEPENDS:${PN} = &quot;initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid virtual-base-utils&quot;
+RRECOMMENDS:${PN} = &quot;virtual-syslog&quot;
 
 # The same restriction as grub
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 7489ef61b03..182b9d399d0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -41,9 +41,6 @@ PACKAGES = ' \
             \
             '
 
-# Override by distro if needed
-VIRTUAL-RUNTIME_keymaps ?= &quot;keymaps&quot;
-
 #
 # packagegroup-base contain stuff needed for base system (machine related)
 #
@@ -139,7 +136,7 @@ RRECOMMENDS:packagegroup-machine-base = &quot;${MACHINE_EXTRA_RRECOMMENDS}&quot;
 
 SUMMARY:packagegroup-base-keyboard = &quot;Keyboard support&quot;
 RDEPENDS:packagegroup-base-keyboard = &quot;\
-    ${VIRTUAL-RUNTIME_keymaps}&quot;
+    keymaps&quot;
 
 SUMMARY:packagegroup-base-pci = &quot;PCI bus support&quot;
 RDEPENDS:packagegroup-base-pci = &quot;\
@@ -151,7 +148,7 @@ RDEPENDS:packagegroup-base-acpi = &quot;\
 
 SUMMARY:packagegroup-base-apm = &quot;APM support&quot;
 RDEPENDS:packagegroup-base-apm = &quot;\
-    ${VIRTUAL-RUNTIME_apm} \
+    apm \
     apmd&quot;
 
 SUMMARY:packagegroup-base-ext2 = &quot;ext2 filesystem support&quot;
@@ -175,7 +172,7 @@ SUMMARY:packagegroup-base-alsa = &quot;ALSA sound support&quot;
 RDEPENDS:packagegroup-base-alsa = &quot;\
     alsa-utils-alsactl \
     alsa-utils-amixer \
-    ${VIRTUAL-RUNTIME_alsa-state}&quot;
+    alsa-state&quot;
 
 RRECOMMENDS:packagegroup-base-alsa = &quot;\
     kernel-module-snd-mixer-oss \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index faf7bc0026d..89e875033ca 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -10,32 +10,28 @@ PACKAGE_ARCH = &quot;${MACHINE_ARCH}&quot;
 
 inherit packagegroup
 
-# Distro can override the following VIRTUAL-RUNTIME providers:
-VIRTUAL-RUNTIME_dev_manager ?= &quot;udev&quot;
-VIRTUAL-RUNTIME_keymaps ?= &quot;keymaps&quot;
-
 EFI_PROVIDER ??= &quot;grub-efi&quot;
 
-SYSVINIT_SCRIPTS = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('MACHINE_FEATURES','rtc','${VIRTUAL-RUNTIME_base-utils-hwclock}','',d)}\+SYSVINIT_SCRIPTS=">&quot;${@bb.utils.contains('MACHINE_FEATURES', 'rtc', '${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
+SYSVINIT_SCRIPTS = &quot;</a<a>&quot;${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'virtual-hwclock', '', d)} \
                     modutils-initscripts \
                     init-ifupdown \
-                    ${VIRTUAL-RUNTIME_initscripts} \
+                    initscripts \
                    &quot;</a>
 
 RDEPENDS:${PN} = &quot;\
     base-files \
     base-passwd \
-    ${VIRTUAL-RUNTIME_base-utils} \
+    virtual-base-utils \
     ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;sysvinit&quot;, &quot;${SYSVINIT_SCRIPTS}&quot;, &quot;&quot;, d)} \
-    ${@bb.utils.contains(&quot;MACHINE_FEATURES&quot;, &quot;keyboard&quot;, &quot;${VIRTUAL-RUNTIME_keymaps}&quot;, &quot;&quot;, d)} \
+    ${@bb.utils.contains(&quot;MACHINE_FEATURES&quot;, &quot;keyboard&quot;, &quot;keymaps&quot;, &quot;&quot;, d)} \
     ${@bb.utils.contains(&quot;MACHINE_FEATURES&quot;, &quot;efi&quot;, &quot;${EFI_PROVIDER} kernel&quot;, &quot;&quot;, d)} \
     netbase \
-    ${VIRTUAL-RUNTIME_login_manager} \
-    ${VIRTUAL-RUNTIME_init_manager} \
-    ${VIRTUAL-RUNTIME_dev_manager} \
-    ${VIRTUAL-RUNTIME_update-alternatives} \
+    virtual-login-manager \
+    virtual-init-manager \
+    virtual-dev-manager \
+    virtual-update-alternatives \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}&quot;
 
 RRECOMMENDS:${PN} = &quot;\
-    ${VIRTUAL-RUNTIME_base-utils-syslog} \
+    virtual-syslog \
     ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}&quot;
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 74074cfdd7f..2955e0ba540 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -6,7 +6,7 @@ SECTION = &quot;base&quot;
 
 DEPENDS = &quot;zlib bzip2 perl ncurses&quot;
 DEPENDS:class-native = &quot;bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native&quot;
-RDEPENDS:${PN} = &quot;${VIRTUAL-RUNTIME_update-alternatives} perl&quot;
+RDEPENDS:${PN} = &quot;virtual-update-alternatives perl&quot;
 RDEPENDS:${PN}:class-native = &quot;&quot;
 
 UPSTREAM_CHECK_GITTAGREGEX = &quot;(?P&lt;pver&gt;(\d+(\.\d+)+))&quot;
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
index f5c7d11191a..2760fc58786 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
@@ -73,7 +73,7 @@ def package_qa_check_openssl_deprecation (package, d, messages):
     return sane
 
 
-RDEPENDS:${PN} = &quot;${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive&quot;
+RDEPENDS:${PN} = &quot;virtual-update-alternatives opkg-arch-config libarchive&quot;
 RDEPENDS:${PN}:class-native = &quot;&quot;
 RDEPENDS:${PN}:class-nativesdk = &quot;&quot;
 RDEPENDS:${PN}-ptest += &quot;make binutils python3-core python3-compression&quot;
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index a3bcaf51c34..fdfb652674f 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/projects/lsb/files">&quot;https://sourceforge.net/projects/lsb/files&quot;</a>
 LICENSE = &quot;GPLv2+&quot;
 
 # lsb_release needs getopt
-RDEPENDS:${PN} += &quot;${VIRTUAL-RUNTIME_getopt}&quot;
+RDEPENDS:${PN} += &quot;getopt&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README;md5=12da544b1a3a5a1795a21160b49471cf">&quot;file://README;md5=12da544b1a3a5a1795a21160b49471cf&quot;</a>
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
index b17cba4a789..d7470d8fe83 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -9,8 +9,6 @@ PACKAGE_ARCH = &quot;${MACHINE_ARCH}&quot;
 
 inherit packagegroup
 
-VIRTUAL-RUNTIME_vim ?= &quot;vim-tiny&quot;
-
 PACKAGE_ARCH = &quot;${MACHINE_ARCH}&quot;
 
 RDEPENDS:${PN} = &quot;\
@@ -54,7 +52,7 @@ RDEPENDS:${PN} = &quot;\
     time \
     unzip \
     util-linux \
-    ${VIRTUAL-RUNTIME_vim} \
+    vim-tiny \
     wget \
     which \
     xz \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 14a7bded953..a9bb8a91ffe 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -114,13 +114,12 @@ RDEPENDS:packagegroup-core-full-cmdline-dev-utils = &quot;\
     patch \
     &quot;
 
-VIRTUAL-RUNTIME_syslog ?= &quot;sysklogd&quot;
 RDEPENDS:packagegroup-core-full-cmdline-initscripts = &quot;\
-    ${VIRTUAL-RUNTIME_initscripts} \
-    ${VIRTUAL-RUNTIME_init_manager} \
+    initscripts \
+    virtual-init-manager \
     ethtool \
-    ${VIRTUAL-RUNTIME_login_manager} \
-    ${VIRTUAL-RUNTIME_syslog} \
+    virtual-login-manager \
+    virtual-syslog \
     &quot;
 
 RDEPENDS:packagegroup-core-full-cmdline-multiuser = &quot;\
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
index 0ce91ca9403..69d72ffd276 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
@@ -5,7 +5,7 @@ PR = &quot;r1&quot;
 inherit packagegroup features_check
 
 # weston-init requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = &quot;wayland ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}&quot;
+REQUIRED_DISTRO_FEATURES = &quot;wayland ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}&quot;
 
 RDEPENDS:${PN} = &quot;\
     weston \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 9ca058b38bd..5596e18de97 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -9,12 +9,6 @@ REQUIRED_DISTRO_FEATURES = &quot;x11&quot;
 
 PACKAGES = &quot;${PN} ${PN}-utils&quot;
 
-# backwards compatibility for xserver-common
-VIRTUAL-RUNTIME_xserver_common ?= &quot;&quot;
-
-# elsa, xserver-nodm-init
-VIRTUAL-RUNTIME_graphical_init_manager ?= &quot;xserver-nodm-init&quot;
-
 SUMMARY = &quot;X11 display server and basic utilities&quot;
 RDEPENDS:${PN} = &quot;\
     ${PN}-xserver \
@@ -23,8 +17,7 @@ RDEPENDS:${PN} = &quot;\
 
 SUMMARY:${PN}-utils = &quot;X11 basic utilities and init&quot;
 RDEPENDS:${PN}-utils = &quot;\
-    ${VIRTUAL-RUNTIME_xserver_common} \
-    ${VIRTUAL-RUNTIME_graphical_init_manager} \
+    virtual-graphical-init-manager \
     xauth \
     xhost \
     xset \
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e02da0c3589..79b05bd60cd 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -28,7 +28,7 @@ DEFAULTBACKEND:qemux86-64:x86-x32 = &quot;fbdev&quot;
 DEFAULTBACKEND:x86-x32 = &quot;fbdev&quot;
 
 do_install() {
-        if [ &quot;${VIRTUAL-RUNTIME_init_manager}&quot; != &quot;systemd&quot; ]; then
+        if [ <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains(">&quot;${@bb.utils.contains(&quot;</a>DISTRO_FEATURES&quot;, &quot;systemd&quot;, &quot;systemd&quot;, &quot;&quot;, d)}&quot; != &quot;systemd&quot; ]; then
 		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
         fi
@@ -60,7 +60,7 @@ do_install() {
 	install -dm 755 -o weston -g weston ${D}/home/weston
 }
 
-INHIBIT_UPDATERCD_BBCLASS = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager','systemd','1','',d)}">&quot;${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}&quot;</a>
+INHIBIT_UPDATERCD_BBCLASS = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains(">&quot;${@bb.utils.contains(&quot;</a>DISTRO_FEATURES&quot;, &quot;systemd&quot;, '1', '', d)}&quot;
 
 inherit update-rc.d features_check systemd useradd
 
@@ -68,7 +68,7 @@ USERADD_PACKAGES = &quot;${PN}&quot;
 
 # rdepends on weston which depends on virtual/egl
 # requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = &quot;opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}&quot;
+REQUIRED_DISTRO_FEATURES = &quot;opengl ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}&quot;
 
 RDEPENDS:${PN} = &quot;weston kbd&quot;
 
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 59ab217a3bd..8e31075e9ed 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -25,7 +25,7 @@ UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://wayland.freedesktop.org/releases.html">&quot;https://wayland.freedesktop.org/releases.html&quot;</a>
 inherit meson pkgconfig useradd features_check
 # depends on virtual/egl
 # weston-init requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = &quot;opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}&quot;
+REQUIRED_DISTRO_FEATURES = &quot;opengl ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pam', '', d)}&quot;
 
 DEPENDS = &quot;libxkbcommon gdk-pixbuf pixman cairo glib-2.0&quot;
 DEPENDS += &quot;wayland wayland-protocols libinput virtual/egl pango wayland-native&quot;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
index b2c1eb3ea06..da4aaa22aea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
@@ -43,5 +43,4 @@ do_install[postfuncs] += &quot; set_omx_core_name &quot;
 FILES:${PN} += &quot;${libdir}/gstreamer-1.0/*.so&quot;
 FILES:${PN}-staticdev += &quot;${libdir}/gstreamer-1.0/*.a&quot;
 
-VIRTUAL-RUNTIME_libomxil ?= &quot;libomxil&quot;
-RDEPENDS:${PN} = &quot;${VIRTUAL-RUNTIME_libomxil}&quot;
+RDEPENDS:${PN} = &quot;libomxil&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#157839): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/157839">https://lists.openembedded.org/g/openembedded-core/message/157839</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/86813101/3618072">https://lists.openembedded.org/mt/86813101/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------72375EE16E04807DC8163093--

--------------E091AF37FB769C1E85E43F89
Content-Type: text/x-diff;
 name="0001-fixup-PACKAGE_GLOBAL_RENAMES.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-fixup-PACKAGE_GLOBAL_RENAMES.patch"

From 886c08192caad518baf924c5798a445a971f11fb Mon Sep 17 00:00:00 2001
From: Chen Qi <Qi.Chen@windriver.com>
Date: Sun, 7 Nov 2021 19:25:23 -0800
Subject: [PATCH] fixup PACKAGE_GLOBAL_RENAMES

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/base.bbclass                          | 3 +--
 meta/classes/package.bbclass                       | 9 +++++++++
 meta/conf/distro/include/default-providers.inc     | 3 +--
 meta/conf/distro/include/init-manager-none.inc     | 4 ++--
 meta/conf/distro/include/init-manager-sysvinit.inc | 4 ++--
 meta/recipes-extended/lsb/lsb-release_1.4.bb       | 2 +-
 6 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1395df4a02..54d14b6e16 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -338,8 +338,7 @@ python base_eventhandler() {
 
         remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
         for m in remaps:
-            if m.startswith("virtual-"):
-                d.setVar("RPROVIDES:" + remaps[m] + ":append", " " + m)
+            d.setVar("RPROVIDES:" + remaps[m] + ":append", " " + m)
 }
 
 CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f1b4bb04e8..2cd90918e5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1604,6 +1604,15 @@ fi
 
         val = d.getVar('%s:%s' % (var, pkg))
         if val:
+            if var in ['RDEPENDS', 'RRECOMMENDS', 'RPROVIDES']:
+                remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
+                for m in remaps:
+                    if m in val:
+                        if var in ['RDEPENDS', 'RRECOMMENDS']:
+                            val = val.replace(m, remaps[m])
+                        elif var == 'RPROVIDES':
+                            if not m.startswith('virtual-'):
+                                val = val.replace(m, '')
             f.write('%s:%s: %s\n' % (var, pkg, encode(val)))
             return val
         val = d.getVar('%s' % (var))
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 5afd3ae415..0cabbef092 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -21,7 +21,6 @@ PREFERRED_PROVIDER_virtual/make-native ?= "make-native"
 #
 # Default virtual runtime providers
 #
-PACKAGE_GLOBAL_RENAMES[getopt] ?= "util-linux-getopt"
 PACKAGE_GLOBAL_RENAMES[virtual-base-utils] ?= "busybox"
 PACKAGE_GLOBAL_RENAMES[virtual-graphical-init-manager] ?= "xserver-nodm-init"
 PACKAGE_GLOBAL_RENAMES[virtual-hwclock] ?= "busybox-hwclock"
@@ -47,7 +46,7 @@ PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
-PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
+#PREFERRED_PROVIDER_getopt ?= "util-linux"
 PREFERRED_PROVIDER_openssl ?= "openssl"
 PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
 PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
index b28c48ee6d..0dd737bf7d 100644
--- a/meta/conf/distro/include/init-manager-none.inc
+++ b/meta/conf/distro/include/init-manager-none.inc
@@ -1,4 +1,4 @@
 PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "sysvinit"
 PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "busybox"
-PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "udev"
-PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev
\ No newline at end of file
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "eudev"
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev"
diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
index d35c6380c0..0792bf39d4 100644
--- a/meta/conf/distro/include/init-manager-sysvinit.inc
+++ b/meta/conf/distro/include/init-manager-sysvinit.inc
@@ -3,5 +3,5 @@ DISTRO_FEATURES:append = " sysvinit"
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
 PACKAGE_GLOBAL_RENAMES[virtual-init-manager] ?= "sysvinit"
 PACKAGE_GLOBAL_RENAMES[virtual-login-manager] ?= "busybox"
-PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "udev"
-PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev"
\ No newline at end of file
+PACKAGE_GLOBAL_RENAMES[virtual-dev-manager] ?= "eudev"
+PACKAGE_GLOBAL_RENAMES[virtual-mini-dev-manager] ?= "busybox-mdev"
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index fdfb652674..1a5d423745 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://sourceforge.net/projects/lsb/files"
 LICENSE = "GPLv2+"
 
 # lsb_release needs getopt
-RDEPENDS:${PN} += "getopt"
+RDEPENDS:${PN} += "util-linux-getopt"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
-- 
2.33.0


--------------E091AF37FB769C1E85E43F89--

