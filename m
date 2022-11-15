Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5560DC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 18:08:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1661.1668535699786502479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 10:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Yr8XmEpX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83182f8b2a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AFCBp4F029854
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 10:08:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=L97FavJ6oMWhjNJi9Xui/gwq9OHvFTCYDlokZwvQRrU=;
 b=Yr8XmEpXaNEKuxOYdloynjYHJq3BWD0fGAEpXoKYGpfZg9u38c5RK08YYAtbkbdMAXL2
 CH8oNXWGg0Yg9W2ieFKq/dUCO1A9h4UQ7wJ2yEzeEWASnKiSumWiPdksqOgf+7xklR6U
 +d5QVQYeMx+JLc30b1+suYIfb0jmcCOXbKYNtos2YWX/1k1IZwSebiOlMI7RjiUzy5Xn
 1tR6Oj8uF2qCmG4QZtFLjQSlLlLVetncJBsTFriBaDdtgxhZ7dj49UyYsErOXb9eSF46
 4VKI2/iLJ45BS16MhRdvjef/aA3CftBIxWy/+1VhU7nGfU8Ox9dnwuomm/Z4v1922347 /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ktbvrafgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 10:08:19 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AFI7Q65028744
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 10:08:18 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ktbvrafgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Nov 2022 10:08:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOdXKHYohen0rpoEC/KmPg6izQdcs1IYdL7MfujXv+0ohVpR+Lm/aCMLONjwBTbLCQJ+RzXodluOaG7efDJ0lB5E7F6v57rDx7aG0qS+PESmCFBf5nSnGtb5QyfwVwT1FNvN+ECcasm2GAnR5od7t0/qt6MOXuJ3qD0aYfXRZNgdq7gAPBrc0DluROpTYfD7RuLe28HvHHh7qF7fgN7eVVrY3UwtxOeAxvs00EHqf3x7e2I9RTHnPGxNLDP+UVlLTAX4rCuCyT/SpTDqN5xc9CMja5pKL0GlAVs7hkJfW1CnYcTEuGu2vQBQUsqUcbOTCuR2sKDDrp+z0XkYiwuLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L97FavJ6oMWhjNJi9Xui/gwq9OHvFTCYDlokZwvQRrU=;
 b=MB7n0u6u/KLet0QDqVM6w5UwbrAgnYpAcLI9bhDCOgwrhM03LvvyvFLE2FoOwfL3vpnMGuRutQOc4tMWGGvJAmIFoTZQ9BwolEy4Yuotekw/k8rC3GaSXP9ndUu3r4qehC69t+1Lyox/Jy+/kf8oMgLMBxOESif7gCBS5bzOEJGvwD64kORE+MwyGKwz+8zVlLj+NJBaxbLi5uDY9LuiNbkSF1DCfKxl8IKn4y6ZF0I4ha/JYPzC9co6nCjeukXVpv75HQ9FyIrJO73M91Z6dsdCEs+g+ncz1ZYiKE//SaxrH3Vl/G4GBVf0g1XseslaQtZEy1w1flLTfbymCboRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 18:08:16 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 18:08:16 +0000
Message-ID: <1c2bdea8-c90a-cc38-93aa-e73343395714@windriver.com>
Date: Tue, 15 Nov 2022 14:08:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][kirkstone][PATCH] sudo: fix CVE-2022-43995 potential
 heap overflow for passwords < 8 characters
Content-Language: en-CA
To: xiangyu.chen@eng.windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20221114052721.21489-1-xiangyu.chen@eng.windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221114052721.21489-1-xiangyu.chen@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0287.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ee6911-02bc-4492-8e85-08dac7345e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rn0GwcKkQZRAzg5lV8xbGC6QX2zNsmMUP9lLHuP/j057AtAo4WtgvpvmlnEU4cUtyHFQSOjjzINWnYNSaQxsZqE3gO0I4JhhhuN3sTaA5DjOMUrU0U5+5SLlJqHpdBGL+LJkNlYHGoNr13TUYV1ihWzNdWBikdLS3Fb7anDbBUZ3Z5HOsDu2I7ZNsxOpSMkfOr0t8rTqP6qEcwUtnyrIKz8CeR2h986IzMcbcuNIUPMBLf0jjgaIU9wD+jKPz5evCOXZcRd16ckrLX/C2Y0CpgeCeQMw8dILvXrYN7gzjElgk4yMgl2YReJTNplqFKbSwVlX9xSPkEBP7vjaGJCNRiiyioQsi5cq3l5amfhkND+lB8cb8LfWslQI5uSCjYGST5IwBorNpopB4M+eLZ2DP/ZSg69WJGGAkadq6P21eYAuXzhL6hKTS9zA4HcForuRo16ZN2b3fQGN3fWm7zAAaRghtkY+aXanShjWu9Dntdk/TsfcwxTEwkd6M05RqPj6PjtC2uaWfAH9Z2jrRFqimCByk08he+twb6m/52tcngq2b5kYuUbP0cUBW/ACo0pBzei4eMHgw6HHw13mQtzmCqe6OOzHwUhyFqvDzdKLR76v9NE378fPiisBsRjBMI3CBKCwUDj2Lq4zZMlMO4m+6NuIVVxNePZDVBO2SVcuKYi0hnDn/AkvKeVv2hiXmDokOSIsU2bdxEkBRFypL11S5BYAoYAXE0xhUOJClAM399/wG3yrFX2TfIWEKqxSJhJlNe9IzAqF9Zz0JsWATrT2CiOTJhB+nrggn6X8T1cGxcj4pZm7Vi2Zsi2Mvh/y1auTMkJKOH1ZQDyFaj2jXFtnw4i9qxQrYNbTRvPYv/BhNtigEwM3x/4axxxrQH9TGj63
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199015)(2906002)(5660300002)(41300700001)(31686004)(4001150100001)(8676002)(66946007)(66476007)(66556008)(316002)(6486002)(6916009)(966005)(6506007)(6666004)(31696002)(86362001)(83380400001)(53546011)(186003)(2616005)(26005)(478600001)(6512007)(66899015)(8936002)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUk1Q3htYmZsanF1Q3ErWGlkckxpUVIvelYrVEw5U2ZwbVdPSDBCRDkzWTZ4?=
 =?utf-8?B?UE80dnRHV0wzanZmTEdUT05mT1FkeVFSdld4QVRScW12S0NRWFZGRFBDMy9P?=
 =?utf-8?B?SWZpN3ZxMXpGam8zV2YxYWRmajFIaGp5RER2azZoNXdVVk4rcXBmekRGZFd4?=
 =?utf-8?B?dFlDNWdqWk5YT21pbTFEU25iSXorNSt5N1JlOWhvYU40NC9VUTRQOGlUdFBF?=
 =?utf-8?B?RTlFQWYxdHdIUDlEYnRheUl6S1VSbGxXRXU3ZWY0KzV3dFJPWnp1eUhUTHhK?=
 =?utf-8?B?Mjdla2xNMXdMZVUyZFZkZGtCaXN1N0MwRGhWMjBWM1ByOVZuR291UW5zQ01G?=
 =?utf-8?B?VkRKbExPeVRiWVQ3VVliUzNKSkw1U05TS1dydmI0WGxYZ1Q5MVl6d2d1K0c3?=
 =?utf-8?B?aVY3NmtlVnFreDRKN0I5QVZwaEhTTkMvb0xYNVBiQWZ1QVFrSTVPMW85NHlh?=
 =?utf-8?B?MWpSbTRpaWQ2RGZIQ0cwVWt2dHN5d1F2YlJHYW9IUHZrMFluSXUwcUM5WGZu?=
 =?utf-8?B?UFh6NEZtY3pnV3RCUUxEU0JJM2E4aGFTblgyZHNmalp0aU42bW0zR1NBNWY2?=
 =?utf-8?B?MHRSRjRVVzRCNWZtajU1VkVaR1YzbWxTUXJWcDg3Y1N6N1V4aTNXSUJ0MHNy?=
 =?utf-8?B?bnRlTVRxYW1rOWRqeXZkS0pUdmFRTndkaVpYVnBJTGRkQ0lhcnZBemVTVlV0?=
 =?utf-8?B?RHRNRzBQSVZzd2RNTW9SUkJjZEZ3bkJZTHZZNjZNMmxVYklGbnp3aTY5YmNU?=
 =?utf-8?B?elpJQmlKRUJseTNzYVFPMEdjdEVCVjUrT3NDSWNtdVZaVENqNmIrMS9Wekoy?=
 =?utf-8?B?SXlXSTlwVjRpcDRPcXByWmVRN2N6U3ZvcWFDS1VlWjNvM0wzaGplTEdKZUVG?=
 =?utf-8?B?dFF0UHYwdDF1V2hNZ0FncUw1U3UxWW9FMUJDK1pjZUpUcGxDcEVyNWtPM1BU?=
 =?utf-8?B?emRKbHdYanF5QkNDcFlwY3ZiUngxclNBd3BUMG0ydnlidXphZ3FLdThkVkRr?=
 =?utf-8?B?ME9XVTlodWh1Z0lERzR6bnJqOEFlbWhiS1psTmVqY3hWSStOTFNKVDAxaWNK?=
 =?utf-8?B?Z1lwalMxN2o4dnZMbTNUdkpQM0Q4azBlZms1WStqVE55ZDVaa3I1UmZ5bDZz?=
 =?utf-8?B?bGMvNXBXdkpqdkQ4UHRHSGM4YUJnVmZSd0dLKzl6SHU4MlRBcVlxV0cwdnRm?=
 =?utf-8?B?enc2eUt1VCtQWUMyK1NrbFlmVTVWbXVmZlBxSWdyVlZUbFhySEpUQWM5Uk51?=
 =?utf-8?B?eEhWQTVGejdXcmNWbVo5U29Qc08xZzlGdnhXczVSWWw1NHo0N2psMVBiVGlU?=
 =?utf-8?B?MkVteEJxeldRVE1uUWI2N2ZuRjRCMmVvcS9BcTBMVnpUL1d6UFZGN3pJTzRz?=
 =?utf-8?B?Y3A4c3BabDI1V0w2V05STWtHN2Nub1BRTFVWMzZKaENhYlJEUUJwbHU1NS96?=
 =?utf-8?B?TThPSzcrQUJOS2krdFZTZEkvTVBXRzZ0djZSaFJzMDVUTUcyZ2dTK3FnUGxh?=
 =?utf-8?B?dHZJUmFwL2tUQkhPZEExRWlrSUNhVXUva3BvTlRNbGVKSm1zdGVPQlhRZjBy?=
 =?utf-8?B?MTV0QlQ4a0l5bGR3ZGlVci9wMDVUQTlVVFl0SkpvOVB3UDJrWFExdUlRVmRC?=
 =?utf-8?B?YUpnUjJqbUkrRzl4ZWtXaWVuZ080NW90c0FyMVZtS2QzUGxEM1FGRFEwcGdx?=
 =?utf-8?B?TGxieXpqNkVJa2IzQkVJTXhsL3lqeXRObTkveDc4bWZtdHg2OTRKNEJBbXlT?=
 =?utf-8?B?YzhsZnQ4Z2dXbFVubmtON0ZZeHp6T3ZMaGhjcFh1QTZ4eU5rRHVoUWpmbzls?=
 =?utf-8?B?bkpKcXJ3QWFQRDE0cFMwUEw1MDRiK0o0UzFOY3JOdVpsOXIxVnNLR3pieThE?=
 =?utf-8?B?Nm5CQ2Z3KzRremhublkzR3lRaGswZ1NGSis3WWgwN1Z4WG55dW1MRlE1TEcv?=
 =?utf-8?B?bE8zQkIyNExTWUVIQmdLL0h5UEtxcU54dzhBSTkrUVY0eHRncDNyYzI0ZUZs?=
 =?utf-8?B?ZmxIUmF6dXlCQWFXcy9FQU81WGg5d1A2NCtSdnpWbXl3bkUrb016LzF5QkhP?=
 =?utf-8?B?L1VWY0d2dFQ4dldwUlpLMWhVMXJwRkVudWJERGZxMTh0UUw4WmI2N2NkWXlp?=
 =?utf-8?B?Y0NObThXY29BZVIvTm5OWHRvbEhEc3hvWS94dDkvK043SU9MQmRtejZ2UlFQ?=
 =?utf-8?Q?RnkEHAveCCtkXEVdTj+sW8I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ee6911-02bc-4492-8e85-08dac7345e71
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 18:08:16.6667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMIM5cXnIJ3TmULXsUblBycXmCVFajuwto+MPYIDVfFnQhSLodU/8yu6Tex5TiLpoSnlRmjXuOo41rZPmju8WVs9LKyJlZ2tQF1HFGFEiU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
X-Proofpoint-ORIG-GUID: UwM1b4OtrTO6kenLaaIHL8ECk46pUp6R
X-Proofpoint-GUID: ra6WeL7KBHVtbE_JxEvcWSftHXpC4aW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211150123
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2AFCBp4F029854
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 18:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173353

Thanks Xiangyu but for kirkstone/langdale I think we should take the=20
patch update:
 =C2=A0 sudo: upgrade 1.9.12 -> 1.9.12p1
that was sent to the list for master since it includes this CVE fix and=20
more bug fixes:

$ git log --oneline SUDO_1_9_12..SUDO_1_9_12p1 | cut -c -99
7a103879a Merge sudo 1.9.12p1 from tip.
3df1e9a07 sudo 1.9.12p1
7ba318470 Include time.h for struct timespec used by sudo_iolog.h.
b2c8e1b1b Display sudo_mode in hex in debug log. This makes it easier to=20
match against the MODE_ de
7ec1ee0e5 bsdauth_verify: do not write to prompt, it is now const
d242261dd Store raw sudoers lines in the debug log. Also add a=20
"sudoerslex" prefix to the token deb
966731311 The line numbers in sudoers_trace_print() were off by one. The=20
line counter is incremente
4da22b101 Make the second arg to the sudo auth verify function const.=20
This may be either a plaintex

bd209b9f1 Fix CVE-2022-43995, potential heap overflow for passwords < 8=20
characters. Starting with s

c78e78dc5 Move debugging info from hostname_matches() to host_matches().
6a3fb3fd7 Add debugging to sudo_set_grlist() and sudo_set_gidlist().
366217571 configure: better test for -fstack-clash-protection The gcc=20
front-end may accept -fstack-
6a2075b67 Check that compiler accepts -fstack-clash-protection and=20
-fcf-protection. Previously, we
794449419 Fix compilation error on Linux/mips.
3d2b84ed2 Added tag SUDO_1_9_12 for changeset b53d725f7c88

../Randy

On 2022-11-14 01:27, Xiangyu Chen via lists.openembedded.org wrote:
> Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
> ---
>   ...95-potential-heap-overflow-for-passw.patch | 57 ++++++++++++++++++=
+
>   meta/recipes-extended/sudo/sudo_1.9.10.bb     |  1 +
>   2 files changed, 58 insertions(+)
>   create mode 100644 meta/recipes-extended/sudo/files/0001-Fix-CVE-2022=
-43995-potential-heap-overflow-for-passw.patch
>
> diff --git a/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-p=
otential-heap-overflow-for-passw.patch b/meta/recipes-extended/sudo/files=
/0001-Fix-CVE-2022-43995-potential-heap-overflow-for-passw.patch
> new file mode 100644
> index 0000000000..be52af27e1
> --- /dev/null
> +++ b/meta/recipes-extended/sudo/files/0001-Fix-CVE-2022-43995-potentia=
l-heap-overflow-for-passw.patch
> @@ -0,0 +1,57 @@
> +From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
> +From: "Todd C. Miller" <Todd.Miller@sudo.ws>
> +Date: Fri, 28 Oct 2022 07:29:55 -0600
> +Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passw=
ords < 8
> + characters. Starting with sudo 1.8.0 the plaintext password buffer is
> + dynamically sized so it is not safe to assume that it is at least 9 b=
ytes in
> + size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
> +
> +Upstream-Status: Backport from
> +[https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27a=
e3329c677d48050]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
> +---
> + plugins/sudoers/auth/passwd.c | 11 +++++------
> + 1 file changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/pass=
wd.c
> +index b2046eca2..0416861e9 100644
> +--- a/plugins/sudoers/auth/passwd.c
> ++++ b/plugins/sudoers/auth/passwd.c
> +@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
> + int
> + sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, st=
ruct sudo_conv_callback *callback)
> + {
> +-    char sav, *epass;
> ++    char des_pass[9], *epass;
> +     char *pw_epasswd =3D auth->data;
> +     size_t pw_len;
> +     int matched =3D 0;
> +@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, =
sudo_auth *auth, struct sudo_c
> +
> +     /*
> +      * Truncate to 8 chars if standard DES since not all crypt()'s do=
 this.
> +-     * If this turns out not to be safe we will have to use OS #ifdef=
's (sigh).
> +      */
> +-    sav =3D pass[8];
> +     pw_len =3D strlen(pw_epasswd);
> +-    if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
> +-	pass[8] =3D '\0';
> ++    if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
> ++	strlcpy(des_pass, pass, sizeof(des_pass));
> ++	pass =3D des_pass;
> ++    }
> +
> +     /*
> +      * Normal UN*X password check.
> +@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, su=
do_auth *auth, struct sudo_c
> +      * only compare the first DESLEN characters in that case.
> +      */
> +     epass =3D (char *) crypt(pass, pw_epasswd);
> +-    pass[8] =3D sav;
> +     if (epass !=3D NULL) {
> + 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) =3D=3D DESLEN)
> + 	    matched =3D !strncmp(pw_epasswd, epass, DESLEN);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb b/meta/recipes-e=
xtended/sudo/sudo_1.9.10.bb
> index aa0d814ed7..e1f603a125 100644
> --- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.9.10.bb
> @@ -4,6 +4,7 @@ SRC_URI =3D "https://www.sudo.ws/dist/sudo-${PV}.tar.gz=
 \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_=
URI}', '', d)} \
>              file://0001-sudo.conf.in-fix-conflict-with-multilib.patch =
\
>              file://0001-lib-util-mksigname.c-correctly-include-header-=
for-ou.patch \
> +           file://0001-Fix-CVE-2022-43995-potential-heap-overflow-for-=
passw.patch \
>              "
>  =20
>   PAM_SRC_URI =3D "file://sudo.pam"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173225): https://lists.openembedded.org/g/openembed=
ded-core/message/173225
> Mute This Topic: https://lists.openembedded.org/mt/95013602/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


