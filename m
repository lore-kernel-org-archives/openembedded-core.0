Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C57C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 00:45:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6095.1667522718415854655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 17:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PVscO75w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83073ca2b1=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A40edsB007241
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Nov 2022 17:45:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=27ptk1CCS9ftzPEPYx/4q/lfa0xpOF+RqyZUV3HZe5Y=;
 b=PVscO75wloU6vylvSk508M4oOvMJj4aDLjPV6b6chPtPXUsPECU8dhcCjD7g9aI915jy
 AanD49yYi+gAJ4/NnzAzY2bH9uUdirT4PlKQQ84a8EA1WoqIvkh6S6jNl72QU7D3sG4y
 YDSOnguNfvOg7w+h/MuPmuZ9BQr2PcAIcxAzIdkyULH63bjrW+lk0763r18bJjTl3gaD
 FXOCOlfi9MSj9JeqPdUja+Qtmiz/8DS5iJVTfhLMYRXtrd542YYDRlc/j1Y7HTbK5eNT
 8XASz2/pRVvj4LiTEiVMedR89MlT9N092bLnuNZzg7y1mWUJhwURB/d6wopUpZAyYqIR Cg== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kmperg2eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 17:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZEu2XpVJvpBu2hyYtNdPx4u3wZzi8F8hxNIL1SZmZPDGrwEaym9MH6gkjH/xESFH/caydsrrXQZpUkNbjYtbIjJTkBHGW0zKrZQSQiDoOJ0H1jl8dO7u+tBgXdigke80wUEVe+agHnFTo8mSUd7qfBZ1/RDus0zR7qWKpwyxihY24oKr/2o+B5Z65uOhTFrEN3NFimTH2pl6E10fdp39RJjgLfq4rGQ2SIBfkHowFux2H04cNvz7B3c++3RFX3R2QgnlEgtYokHJJpDmExOnt8sZE+ihuOFJitK8K8eF1Rn9OxWK7LUww76+lOc6+R4kG/CywBQ53nSZCht8P+OGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27ptk1CCS9ftzPEPYx/4q/lfa0xpOF+RqyZUV3HZe5Y=;
 b=ThiF3EZ0+NEpChPfuh0bx38H3JtDPRLmlvHvMooZq6cOVq7ykdFwj5/s8aB2pPFaD72b+Sa+MUOz66D7EikH1Qa4R48ybJexcsMFORCt3uVw1jGZ/EF9aTixBjzDagKvIH1eDvbntvDUJeGrt0u6kevcO948aoG/ErPB/6I32kQBaVEoBEfLVJhUHXDQxdUQrFFE8Lhk5daPXJr4zoHSc/GmLkdsn33N6Nm1U4ADjttHxHi+EmkBGnNVgYHGWcihQXYJERbs0GSvBcxSw+2rtPr9VLNAA8UvAlG4T2RgYT41bQSEYqhbZIIqQrIayc6TWvTYccRnzgKF/M6FNNZNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 00:45:15 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b46d:e5f9:f461:b642]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b46d:e5f9:f461:b642%7]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 00:45:15 +0000
Message-ID: <b1b9cdfe-809a-2a27-e48e-bb2974b03921@windriver.com>
Date: Fri, 4 Nov 2022 08:45:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [kirkstone][master][PATCH V2] apt: fix do_package_qa
 failure
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <17071B2BCB39B264.608@lists.openembedded.org>
In-Reply-To: <17071B2BCB39B264.608@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::16) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 439a13d5-c313-404e-1543-08dabdfdd5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8iS/UVIsD7DgieKw7VaEdId44MJwugc7MhnkoYWBYMlgCXpi+vJJujI2urZxrxPkWXmcQuxjyCt+pkcpubT7XhkcmiIiqS0U5a9XAuv9fj5ckIONfFCwGiePXGKsA/1mEvlsb/p3w2R/gfPotJv24jnqNyIK9yGvdXRMqX3r7an+oaLJP3fd4WEuC69Rwjjj+ruroSpOW4UT+NTqzMvODr8og6/Oi7XHV0t19f//wVTZ9sQQB0+esv7ifAHlgNgsuZtH3x0Th1uP2kRCvzWu0PzL0LgqII2aDGwT8M+2wn01Kk9OFj+jM0V1BkBqmtuwY+HzxVvhA8vJr7pavgBc/7OYV4V1vbt4HaeNCzVRFJ4L08uKzVeguSKKkTm4vEH6c+3BuN5XN/UOfuCLNSq7w+Bl6iMIPsN9NM/CC53NzOTDNoUyb2oatvyf30RE/f20ctfOA6MgueElkJhCrFOqRfbvISnUwoUZHJMuSQCdVflQ/FR/qmbIccdbB1ag4kvu5Tq/3OoINVWgCvnUyyjwZJI2hk4diVheqRq5zBsZsn1mBepQdRueCsbunaQGFginy2ZXZm/+SivXzimFPEhUsXrzeWn/DTUxdPtOADBfbk+6paiHAg0Y4EHUF5a8rIRNkKZjLu4XBxOKP0E5hEYnw8MXDof+JZEfMdQ77mIu23CNF/WLhxMOd14yfbs4ROK6T3u9ZoO6x8nkTvaaPfazEkXh2G+NPPIkSYH48uaAZSyT583WVbJisFSLpMAPV+RhXl07/bqtziCnIzY+KHq0YkGsE2K+6vWn9N3yLidKH7huVTIYIn+8UdDvZB4vCezZEIoVigHrOM1ny++LX3eqDk8MIkeXDvwOhw+WSk0cSKM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(451199015)(6916009)(6512007)(44832011)(66556008)(6506007)(6486002)(966005)(478600001)(66899015)(26005)(41300700001)(8676002)(2906002)(8936002)(2616005)(5660300002)(186003)(83380400001)(66946007)(53546011)(31696002)(86362001)(31686004)(316002)(66476007)(6666004)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2VzQS85WS9YWjV5ekFvVGF5SElVV2hGTFlrbE1WQlZFSTRXclB6dEkybmdw?=
 =?utf-8?B?VEh2UHZETmN4MEg5bnR3eTV1bGpMTWxLcFp0dkFPZjFKRlYxYklOUFZRMEpR?=
 =?utf-8?B?RXBBMHVTYktDdlNvaWZST0VyOUdmVGdTL2d2cGZxdkVJYWFCSENvMGN1R3Bi?=
 =?utf-8?B?Z1pwOXF1ZkNwbExRaC9NMEZ0T28vb2M1a25IUXo5U0o1czVWeUJrdVlLK3VE?=
 =?utf-8?B?cEE1RGF6bW54a0xxa3BNT0FqaEo4RlVDb3ByWHEwMWVFdVZlOGpsb09NMEdj?=
 =?utf-8?B?eXBZYmlOYjhmUStXc2JiZXRWMnY0SG5KMjQ0WlZFS1h2QjNoTnV0QjBuWDhJ?=
 =?utf-8?B?b0VTbm5JUWdvb0FUaUJMR0hoQThVN0s5RUZJTzhsSHhCQk1LZm45aHd0cDRw?=
 =?utf-8?B?THdNc2pBcEFvSTQ3bW1qVjhwanlnTUFyUEtpTzlaVlJndU54RVJ5WWhPT1d3?=
 =?utf-8?B?UHROdVcyY1MycHl6SXFJUEh0SzlNZ1NQcW1YR2crYUlmUUowREtFTERGSjFt?=
 =?utf-8?B?NkhOaTFORVVhblpaVXdsNXcrK3dVenlGTCtldXM4VkpOSEtwTDlPUkNYSDJo?=
 =?utf-8?B?RHZ5d3g1VnRsTk92L0xwK3Uyb1F2VTZONkxJNi9RZHBTYThWQ3RBaU5BQ1lp?=
 =?utf-8?B?bDVFUm9OR1ZzbG9ydUpFZkVOcUJnT1drSlJ2ekYvNWloYXdvV2FyMWtTRGph?=
 =?utf-8?B?SWFGTE95L2NUQXR3blNPTnpiOFJKZmhtcDkwb0Evd3haMGN6eUQ3Q29UQ1lh?=
 =?utf-8?B?NzVTelNUWmxVVWN6V2dXMFNXTC9Nd2RKT0lMb1RvWThnMHRpaWo0amI2aktw?=
 =?utf-8?B?bG5TK25xN25NWlhMb2hPZG0wUGJrdm9MK0E2QmFrb0gwZWlRWW9UQ1c3alBs?=
 =?utf-8?B?NjJiR1BQbGNlZTFodEJYWlFnTUxmMHVlbitJK1B4ODVtb2NIWjhjem5IQklr?=
 =?utf-8?B?endoVXFwdERDdEdaNVB1eURmcE1LREhoUC9tMndZZ3ZnNSs1UE5URVBCZVZJ?=
 =?utf-8?B?ZEZjOWxNUi9iSisyVFJzWGIxa2VlWTZBVkQwRUozVmtPc29vZ1FWSHd4Z0xJ?=
 =?utf-8?B?TjNLVURjU09WQ0pwRUg1M01ITVNtSzBYNFprM0RnVTR5Z2dmd3VpcVBYYS9j?=
 =?utf-8?B?ZjI4dDNHS1FodFU3d2tjYXcrOGFkRjVob0pZVXdVcjNmTFdnZlhVTExZdWV3?=
 =?utf-8?B?a0VpUFppTjJIdWFxa2s5SkVMM0Nwa1N5UWFRWm5OeE8xL0gzbzEwbFhIQTMz?=
 =?utf-8?B?cUhMYmdnemlSYVlKNklCWC9WZjFoRXJkdzdnejdFQkxocGlpRG8ycmtkaEp2?=
 =?utf-8?B?dnFWNDJQbjgyeUZpcnRzYmZ3Wm40ZGFQRk5GdkNiNjkxY1hSZUR6WDhkWUM4?=
 =?utf-8?B?c1J2ekFMQkNUQ0F1ZWdsQnR4NmFkVXl0R2lRbFBTUHZOWXBFM0RYU2hCd1BC?=
 =?utf-8?B?NlVrYmlzUFBhOHR0eWdTWHdjTmtZd0xsYjZmNk9HcmxKS2tzcWFzbWpTYjZs?=
 =?utf-8?B?UmpVUjZCNXB1aGIvMkZ5Z3JCYzI4V1drYlhGZDhUSXdqM0NXazFoSEd1M1py?=
 =?utf-8?B?eFNCVkhHRmJqejczUld1cjk2OWpMcjBvOGFoSjFSM2wrTlJ2dllJRnNoM1ow?=
 =?utf-8?B?RzdTRFQ2T1FtSzd3c1NFL2lLZXJuNzB3MHVGOG8rbUV5QXZlcVlCMDZnRjN3?=
 =?utf-8?B?TFpuT3ZSZ0VrbzNQNEtscytlZFJBK0hjNEJvd3A3d3JhSWt1ZkpJYVBJSnpS?=
 =?utf-8?B?bzRGWXVoaXB1Y2ViNjZKY01UN2hBT3VKd3NKT2c3U0JCTkZESGFvVVI0dVBG?=
 =?utf-8?B?ZnpZTVJ3ZnBRaUtVaFhLdVpmQVB3di9LSVc4cWpzUlBFa2xiemtLOXJGVzFn?=
 =?utf-8?B?d1piOWY5TksxSS9KbEMyRG54Z2NYNEQ3QnQ2SVZENXZzWHY1ZGhOWGM2VUI2?=
 =?utf-8?B?NW5IRkJWUUZwQXFGU2FjeHRxL0hBem43OTFmbUc1SHg3WkttTDFKYmtUZ3Rs?=
 =?utf-8?B?OEN2WkpDRmltVjlTclJxODFIWVZjSXNJdFZ4WVl5aVZSd3J0cnh3R2tqTDN4?=
 =?utf-8?B?VlhIY09zSjY0OXdSYWxZeTRlT1pzU0xxZkUxdjV4SGFLK1FUYzhva0s2NDI2?=
 =?utf-8?B?bS9hU3B4bmxldWhCS2ZoZmtlbGdmdmFVQ1ZIRldLK2t1b0p5M2lYZEF3aEh6?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439a13d5-c313-404e-1543-08dabdfdd5d8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 00:45:15.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4D86+TcWWLLTJaV7CC/F/0eehZn2NHVpwIIIFB+XeNdsK7Js65+YqjV8RoTEedtetPiu4prZEQffSGU4FHEsfzDItOQeXVPnWSoQ6fuA8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
X-Proofpoint-ORIG-GUID: 8NtMdn2IuGA_vanjzRPrF4VH3Nmzj7Rv
X-Proofpoint-GUID: 8NtMdn2IuGA_vanjzRPrF4VH3Nmzj7Rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 00:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172657

ping

On 8/1/22 11:34, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> bitbake nativesdk-apt failed with error:
> ERROR: nativesdk-apt-2.4.5-r0 do_package_qa: QA Issue: nativesdk-apt installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]
>
> an empty dir apt is installed under /var/log/, fix the failure
> by removing the empty dir apt as what we have done for target.
> apt will create it when it does not exist.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/apt/apt_2.4.5.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
> index 95c25e3036..cb29c41ce0 100644
> --- a/meta/recipes-devtools/apt/apt_2.4.5.bb
> +++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
> @@ -117,6 +117,7 @@ do_install:append:class-native() {
>   
>   do_install:append:class-nativesdk() {
>   	customize_apt_conf_sample
> +	rm -rf ${D}${localstatedir}/log
>   }
>   
>   do_install:append:class-target() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168692): https://lists.openembedded.org/g/openembedded-core/message/168692
> Mute This Topic: https://lists.openembedded.org/mt/92740376/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

