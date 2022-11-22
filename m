Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAB4C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:59:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23272.1669132781323346605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fbG+O22A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83251fd825=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMFQ4wM025663
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:59:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=dkMC8YAzwgllqdw63SJYxqPA51pL7NDm0NEWlu++Bls=;
 b=fbG+O22AIB1YNrqPdUscKFqUXDMaD/+kFloy+Ghl5pfCSVMvmvIAgVbqG/rPY53MEsxm
 pPtWTei3j8Ab5sGjtigLwQ9ZW6HlyR0Yr5A9FxK75gi51shZ/G5jqwk09a7i6Vki+eNH
 e2/LzMlX0SDhUjPokaSyLn5mokpN588eXQmV9tPXw+uzHm7tskZmanLeDDYW0gwDY1iB
 m4j6cWN11Vuw5c6+HtBQqcjvpaOlAVZebNOmJOYyIh2Guan4GbXBQfiwrFivQG9WuG3k
 mSyWMx18GlQ86nsOJvTzKoHEBUpvyClzySZEwZ0/+NxycYhv6ZjxU1ffuz7c7kcR+Zs+ yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqadve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:59:40 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AMFvdgC006182
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:59:40 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqadvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 07:59:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9eXX0GAF//O6E68HEQdUqwdWPUNSdtU4qWAflxdF0/mB2MQ74If0lpJakgFywkztaHdFkatK1NeG05EAURlAVNr8M8CMluGVqHMZI0tJZ0q2QkQF/A70BFRFlVdAiVlVQiKRoarb9P5d7e20iT5MmjZe+2mgC4t9nm+NxZoohJ/FrA1GM+fPg2YnVS77YkFxIv1/SjuqIHrR7PPHfPyM8rK5IEdVXWFSx2nmZbD0080I+CKG73yNGpSqJW7tN9eoXcKrKoU+L4j0p4CcbtA6/A3zd+ieesdBpUSj1IzqEQVMcNgLf0O8Jx8SCOOLtT6Mu0ns4rUxEN62kUDugLOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkMC8YAzwgllqdw63SJYxqPA51pL7NDm0NEWlu++Bls=;
 b=AeomC5lq9ftKi4nlk+QK9o+gCUYUCpG3nyQUaJBD2fQJ7t6LWCvWsepS+NRbC37Sq7HDaQVjhiUh31rM6SFx7g64iOtoQh8akBgaGR6VVWEQqphXGXynPP+B+4UqFoNTqABBPwPVjF2jshC0vFoxbr1SuKZQVXd/Q4C6P1+4rRIpqFgY58fHS7EY990SJd2IVFoHw4n56o5XVqisbaKnRFbyOuPyUlBceo4Z4LC+lhhgzjL3IVV4LYOvxRh3e+ww9BWt5ED5KxdaG8RtDsDCAwCZTX4m/eu+8HJ+JFtFoPbPAxZL8xJQ2AHKHFKeZ2cU5TnmDA3tm+NKAs16VjNTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 15:59:37 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:59:37 +0000
Message-ID: <e7819461-2645-24a4-c415-a8a4ce87d9de@windriver.com>
Date: Tue, 22 Nov 2022 10:59:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe-core][PATCH 1/1] libpam: fix CVE-2022-28321
Content-Language: en-CA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Hari.GPillai@windriver.com, narpat.mali@windriver.com,
        Archana Polampalli <archana.polampalli@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20221028163022.1620593-1-archana.polampalli@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221028163022.1620593-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: f384a4cf-e35e-490b-37c4-08dacca28e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aYtvz5C9FPs4TQWvN8NVV4RTgCxRAWLgcVUi5SxOQveKyqP1mSIk2s+3BMpjatgb7Yoj9KYBkGr/ODn5628yKsakLXv0yB+VM9WsoAvZpHHo46f0gZC4FU0zBsODVXgxrBDQYpyFdg4C+YRtjdfj/15tyUf3OwkQVaoayxBczFtsgMYOQK11TwQ4mKajO2sQmKvPYicC0gkyY5fMOY0MQcoFdqPUEu5esXs4FyTqyoOUickmnXGMPj1apuJjeoIa8lFR76i4JPSd3+rACdLxbCTqVyBWHWj3SBp5jZmybev2e7AycFF5CDsGmMAyjfI4gm3jp0dAYfLXgCw1SvDaGwjbfqNEUBVamr/aK8soDCdacye0hS0+jUWoyDAGn7SI4gBHJPQpRdLm58Ldbf0S7zsyG+YDpt0R3gEcVfYSQmwLTixTaAJDW5dOOimgIbJ9wwfYxfCOL2A4df9CuCpwvRapvLApSkUouY6rb3qMiPvYsN/Qf8DsoSjjGylPuTSNyNF0MCtTxyQw35eMcDfgRJZ6Naqa1WANgq15qAJ8VyK7tuG7XIL//KgykfbciED6dfO71dtP7bwxZ4EhSRMrAi41E1EfHw2xWb0RI0vBw3mD0GpQvIZKpd0yjPcDQRwqwk7kWNMQhAqnPw7LOhvUfW8VAeMQlazWLghzKTSeo5SvpfPs5iriV/Sa79n+JnieDSg53/dOVqN6Gmjc0TRVjMBmG+iZQ2wAf619d4CRME8L+H2c79Yvmn3N7Ug5CKTrtExvlsgImkpcyQlHZXSP7/kn+Ouk2Rnv+EXwuw+RN18=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(451199015)(66574015)(2616005)(8936002)(186003)(66476007)(53546011)(6512007)(5660300002)(31696002)(26005)(86362001)(966005)(4326008)(316002)(6486002)(6506007)(478600001)(6666004)(66946007)(6916009)(41300700001)(66556008)(8676002)(36756003)(31686004)(83380400001)(38100700002)(2906002)(4001150100001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWFEVHNCUlYwTmVxUHVzbjUvd0Z3Z3VNMDBpQkRFN0ZJUDNlZUtNMlFoY1J6?=
 =?utf-8?B?MFE1T0lubkhNOEZkWEY2MFVPbXVweDJDNEk4cEkrdUg4QS9RK3orNm1EWlUz?=
 =?utf-8?B?ZDhUaDZzYTgybHo4OW1SMEp5akFPcDVnbloreXdXUzcrSWdZSXBkditkTkZG?=
 =?utf-8?B?QllyZTlJd0hEdlh4ejBVN3QrM0VUOURGcDRJRnU5Wk9VZnlZbGxZNy9yVWtm?=
 =?utf-8?B?czJBem9MS0xXLytCcmhLb2ZGSDFLUnV5dy9hd0NSZEtEZE5VQkdhbXBXbnZs?=
 =?utf-8?B?ai9MOFVjSTFzY25XSThvOFdhaXdDTGwvZmdiYUZzbFpzbnZ4bkVzTk5TNURN?=
 =?utf-8?B?SkYydzRKTlhCc08zYi8wUmp5QmJqQVZzQzhWMWNCbVBxMFFNM3kzbjRpcmtU?=
 =?utf-8?B?aTRIWjlHNW1XQVBjQ0xlMHVwbkh0ZVYvSkszZjlMZWR4amIwRGgyZTFnYWNu?=
 =?utf-8?B?bW5CaUxZb1VmMldjY1lyTEx6VnhIOXN4dDIwbGxjWEFnelE0ZmR4RHY0cVBD?=
 =?utf-8?B?T2JlSU9TNUVmL3R2Rk5IbWNHMVpCWmRNejJJMnBldFcrbUlWZllIRHloZDlT?=
 =?utf-8?B?Szc4bnhnUXY2bXZtR2NZUTBaUDJoZ0xVNUErL1d2cklXR0htdWJpVWF4Nmwy?=
 =?utf-8?B?TmRqaEdCWFd1T0c3ckw1QlZRNUNlK0N0bktKZDVZam9tYTA4dmwyaXIwM0Mr?=
 =?utf-8?B?QmNLQWtwOXNkV0N0MkJieUk4dzR0OHNQbVJHSFozdlkvUFFzd0t0Yy9aUUpU?=
 =?utf-8?B?RTVwRlY0VVdXZ0N2Q1dtemszdG9kV2pOeE9acmphSnlTN0RBajNxUXBsbTFX?=
 =?utf-8?B?YkVCNGdWR29odlNPU1VCOWtNTkxLQ3hPT0JaTDQ0cnVLSm9JQXJRYStRdWlL?=
 =?utf-8?B?dzM3RVVBcGFEcS82OHVSQXA2MmJ5SmxKWk1zbjJsWmY0ZFUyMlhCQlY2OEZK?=
 =?utf-8?B?aXp0SXBNeTRQaGdTODlOU1BHK2tGbzlZQUZ1dzUyUzR6Wk1QVjBwbmhGbHpw?=
 =?utf-8?B?MGpVWXQydE15VzFJUVF2TmNycHRyRUtBblNITVJJVGRrTnptdjF2TzhzT0JH?=
 =?utf-8?B?ZVAwZzhkeXpDNHBVSE5uZE1WejF5QU5DZllNUHRQT2JaZjkzMlBLdmoxamlp?=
 =?utf-8?B?TFBkQUlsNVNXNFpZN3RqSUxjNkZmU3pvSmp2YlVBRTVNY09HUXF0YVg2ZVQy?=
 =?utf-8?B?cU4wYkJLTENBUzFOMHF0VlJwLzlhVWpMM2xCMjdVT3FOUUlkemhTaEp5ekJi?=
 =?utf-8?B?TGZFcVdlS1VXNUFlM0Vyd2pSQUl4ekJxUEQrNGxJNlIxYjRjN2lFbi9mcHpj?=
 =?utf-8?B?clE5cU1OWEdXWXhwa0NOdG8wWWdpdTl6MVRpbGpHNDFtQ21YamxrTkJDc3hp?=
 =?utf-8?B?eTdhQTBFZ2FNZDRmVk84WEtCcjlaeUkyVUxla1Y1YnRtS0FPRW1YbmN4K0gz?=
 =?utf-8?B?Rys5YTFIcmtJZUhSWGVHZFZaR2hRc0JuU09kQlhHSTRPVkw5cHMrNlgrL3NM?=
 =?utf-8?B?Vno5bkpQT2lZWmxzMnZCNEFkOXFBSzlSbnhDYXdmZU92MHVIVzhYaURUTXB4?=
 =?utf-8?B?SWZSRUcvOU1tTlR1MFBvSkY4K1RDTU5pSWkxZVdPWklHVjZtN2I5SWtBc1Nh?=
 =?utf-8?B?VmhCcWRRTzQzS1lyYUZvQlJsKzJUS1hQQ2Y2VFhnYmgzanV1aHhPbGFvWU5y?=
 =?utf-8?B?cnA0UTlpR0JFMUttZGhVQWx0NWNmQjBaSDczaUIrVFMyb2dMcy8rOUU3bWpP?=
 =?utf-8?B?UHd1MUpUVGJVL3c5dmFQWURrRjhNWW42MlJHVGZhQm96VTJzbEVZeGFlYWxR?=
 =?utf-8?B?M2VrSDMxWVJwbVVhdTJOVVNlSXFEOTluQWQrMVp6cU5xRlVXdnpZYmk2VTZM?=
 =?utf-8?B?eHBKV1hxS0hRZEVIOHV1ZjN5bGNwREc0QzdNc1FWRFlWRWxiUHNZQ1ZJMncr?=
 =?utf-8?B?U3dJK0RXa2hJSWxCSVgwUDk5NE5sZ21hUXdrTWtxUlg1RFFkSEdzUDRNV1Z3?=
 =?utf-8?B?Znh3bStiM3RSUloxR3MrSlpDS3dFSzFIalpMQnZoTmQrWXJESGFHNnlMRWJ3?=
 =?utf-8?B?Z3k3Uy80RWRYU0xlUmRUckdNZ3FhREdQcGVtWWVnTUc0emNxamFUenM2cWJ3?=
 =?utf-8?B?bUVwU1l4Z0xCVGx6UWhFeG1EL1RVYmdPMzlPS2YxTEs0QzR5bXMvd1hPOHlE?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f384a4cf-e35e-490b-37c4-08dacca28e66
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 15:59:37.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWjIKMNQHfPPM9BVLTP6Q2jFQFHjQRE8DkmeCcUxJSlB2YTSF50SMTZOxeaiRLpIWcmjB3I2LfJc9XLYc287EJi+kGM9Wu3RAXta2X6GxJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
X-Proofpoint-ORIG-GUID: ilgJdqe4Gw3YHEudNI7oiTvDHAj37CEE
X-Proofpoint-GUID: -7ESOErsfNgtjhumLNjuhPRW2-hTfZpW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_09,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173690

There were a few versions of this patch but this one is good aside from
the whitespace noise. ;-)

I suspect it was just missed in the commotion, please merge.

../Randy

On 2022-10-28 13:30, Archana Polampalli wrote:
> The Linux-PAM package before 1.5.2-6.1 for openSUSE Tumbleweed allows
> authentication bypass for SSH logins. The pam_access.so module doesn't
> correctly restrict login if a user tries to connect from an IP address
> that is not resolvable via DNS. In such conditions, a user with denied
> access to a machine can still get access. NOTE: the relevance of this
> issue is largely limited to openSUSE Tumbleweed and openSUSE Factory;
> it does not affect Linux-PAM upstream.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-28321
>
> Upstream patches:
> https://github.com/linux-pam/linux-pam/commit/08992030c56c940c0707ccbc442b1c325aa01e6d
> https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813d7af55481c6ca9f
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ++++++++++++++++++
>   meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
>   2 files changed, 206 insertions(+)
>   create mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
>
> diff --git a/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
> new file mode 100644
> index 0000000000..e7bf03f9f7
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
> @@ -0,0 +1,205 @@
> +From 23393bef92c1e768eda329813d7af55481c6ca9f Mon Sep 17 00:00:00 2001
> +From: Thorsten Kukuk <kukuk@suse.com>
> +Date: Thu, 24 Feb 2022 10:37:32 +0100
> +Subject: [PATCH 2/2] pam_access: handle hostnames in access.conf
> +
> +According to the manual page, the following entry is valid but does not
> +work:
> +-:root:ALL EXCEPT localhost
> +
> +See https://bugzilla.suse.com/show_bug.cgi?id=1019866
> +
> +Patched is based on PR#226 from Josef Moellers
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-28321
> +
> +Reference to upstream patch:
> +[https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813d7af55481c6ca9f]
> +
> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> +---
> + modules/pam_access/pam_access.c | 95 ++++++++++++++++++++++++++-------
> + 1 file changed, 76 insertions(+), 19 deletions(-)
> +
> +diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
> +index 277192b..bca424f 100644
> +--- a/modules/pam_access/pam_access.c
> ++++ b/modules/pam_access/pam_access.c
> +@@ -637,7 +637,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
> +       if ((str_len = strlen(string)) > tok_len
> + 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
> + 	return YES;
> +-    } else if (tok[tok_len - 1] == '.') {
> ++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
> +       struct addrinfo hint;
> +
> +       memset (&hint, '\0', sizeof (hint));
> +@@ -678,7 +678,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
> +       return NO;
> +     }
> +
> +-    /* Assume network/netmask with an IP of a host.  */
> ++    /* Assume network/netmask, IP address or hostname.  */
> +     return network_netmask_match(pamh, tok, string, item);
> + }
> +
> +@@ -696,7 +696,7 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
> +     /*
> +      * If the token has the magic value "ALL" the match always succeeds.
> +      * Otherwise, return YES if the token fully matches the string.
> +-	 * "NONE" token matches NULL string.
> ++     * "NONE" token matches NULL string.
> +      */
> +
> +     if (strcasecmp(tok, "ALL") == 0) {		/* all: always matches */
> +@@ -714,7 +714,8 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
> +
> + /* network_netmask_match - match a string against one token
> +  * where string is a hostname or ip (v4,v6) address and tok
> +- * represents either a single ip (v4,v6) address or a network/netmask
> ++ * represents either a hostname, a single ip (v4,v6) address
> ++ * or a network/netmask
> +  */
> + static int
> + network_netmask_match (pam_handle_t *pamh,
> +@@ -723,10 +724,12 @@ network_netmask_match (pam_handle_t *pamh,
> +     char *netmask_ptr;
> +     char netmask_string[MAXHOSTNAMELEN + 1];
> +     int addr_type;
> ++    struct addrinfo *ai = NULL;
> +
> +     if (item->debug)
> +-    pam_syslog (pamh, LOG_DEBUG,
> ++      pam_syslog (pamh, LOG_DEBUG,
> + 		"network_netmask_match: tok=%s, item=%s", tok, string);
> ++
> +     /* OK, check if tok is of type addr/mask */
> +     if ((netmask_ptr = strchr(tok, '/')) != NULL)
> +       {
> +@@ -760,54 +763,108 @@ network_netmask_match (pam_handle_t *pamh,
> + 	    netmask_ptr = number_to_netmask(netmask, addr_type,
> + 		netmask_string, MAXHOSTNAMELEN);
> + 	  }
> +-	}
> ++
> ++        /*
> ++         * Construct an addrinfo list from the IP address.
> ++         * This should not fail as the input is a correct IP address...
> ++         */
> ++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
> ++	  {
> ++	    return NO;
> ++	  }
> ++      }
> +     else
> +-	/* NO, then check if it is only an addr */
> +-	if (isipaddr(tok, NULL, NULL) != YES)
> ++      {
> ++        /*
> ++	 * It is either an IP address or a hostname.
> ++	 * Let getaddrinfo sort everything out
> ++	 */
> ++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
> + 	  {
> ++	    pam_syslog(pamh, LOG_ERR, "cannot resolve hostname \"%s\"", tok);
> ++
> + 	    return NO;
> + 	  }
> ++	netmask_ptr = NULL;
> ++      }
> +
> +     if (isipaddr(string, NULL, NULL) != YES)
> +       {
> +-	/* Assume network/netmask with a name of a host.  */
> + 	struct addrinfo hint;
> +
> ++	/* Assume network/netmask with a name of a host.  */
> + 	memset (&hint, '\0', sizeof (hint));
> + 	hint.ai_flags = AI_CANONNAME;
> + 	hint.ai_family = AF_UNSPEC;
> +
> + 	if (item->gai_rv != 0)
> ++	  {
> ++	    freeaddrinfo(ai);
> + 	    return NO;
> ++	  }
> + 	else if (!item->res &&
> + 		(item->gai_rv = getaddrinfo (string, NULL, &hint, &item->res)) != 0)
> ++	  {
> ++	    freeaddrinfo(ai);
> + 	    return NO;
> ++	  }
> +         else
> + 	  {
> + 	    struct addrinfo *runp = item->res;
> ++	    struct addrinfo *runp1;
> +
> + 	    while (runp != NULL)
> + 	      {
> + 		char buf[INET6_ADDRSTRLEN];
> +
> +-		DIAG_PUSH_IGNORE_CAST_ALIGN;
> +-		inet_ntop (runp->ai_family,
> +-			runp->ai_family == AF_INET
> +-			? (void *) &((struct sockaddr_in *) runp->ai_addr)->sin_addr
> +-			: (void *) &((struct sockaddr_in6 *) runp->ai_addr)->sin6_addr,
> +-			buf, sizeof (buf));
> +-		DIAG_POP_IGNORE_CAST_ALIGN;
> ++		if (getnameinfo (runp->ai_addr, runp->ai_addrlen, buf, sizeof (buf), NULL, 0, NI_NUMERICHOST) != 0)
> ++		  {
> ++		    freeaddrinfo(ai);
> ++		    return NO;
> ++		  }
> +
> +-		if (are_addresses_equal(buf, tok, netmask_ptr))
> ++		for (runp1 = ai; runp1 != NULL; runp1 = runp1->ai_next)
> + 		  {
> +-		    return YES;
> ++                    char buf1[INET6_ADDRSTRLEN];
> ++
> ++                    if (runp->ai_family != runp1->ai_family)
> ++                      continue;
> ++
> ++                    if (getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST) != 0)
> ++		      {
> ++			freeaddrinfo(ai);
> ++			return NO;
> ++		      }
> ++
> ++                    if (are_addresses_equal (buf, buf1, netmask_ptr))
> ++                      {
> ++                        freeaddrinfo(ai);
> ++                        return YES;
> ++                      }
> + 		  }
> + 		runp = runp->ai_next;
> + 	      }
> + 	  }
> +       }
> +     else
> +-      return (are_addresses_equal(string, tok, netmask_ptr));
> ++      {
> ++       struct addrinfo *runp1;
> ++
> ++       for (runp1 = ai; runp1 != NULL; runp1 = runp1->ai_next)
> ++         {
> ++           char buf1[INET6_ADDRSTRLEN];
> ++
> ++           (void) getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST);
> ++
> ++           if (are_addresses_equal(string, buf1, netmask_ptr))
> ++             {
> ++               freeaddrinfo(ai);
> ++               return YES;
> ++             }
> ++         }
> ++      }
> ++
> ++  freeaddrinfo(ai);
> +
> +   return NO;
> + }
> +--
> +2.37.3
> +
> diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
> index bde7fef8a2..3be879082e 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
> @@ -24,6 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
>              file://0001-run-xtests.sh-check-whether-files-exist.patch \
>              file://run-ptest \
>              file://pam-volatiles.conf \
> +           file://CVE-2022-28321-0002.patch \
>              "
>   
>   SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"


-- 
# Randy MacLeod
# Wind River Linux


