Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39A6C3A5A7
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 01:03:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3505.1670374976753269813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 17:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9340152798=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6NiFR4030020
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Dec 2022 01:02:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7up0b2r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 01:02:55 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B712th6028095
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Dec 2022 01:02:55 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7up0b2r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Dec 2022 01:02:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxJVuGomXVBq61nPfcajKBMXpgO/ntg2uXEQVvZrAn36jC8e22KqGeYJaUW+T3QEvio12jUjCK55a/8LDUiDdEMK51CWsf/rtqo0AMrP1gH3+WiD/NFHp71/CRHw9A+CEJI9qa/k/YEqV8AQIFu991CPh9aBAaOU1SgWoQ9nDWLoeHhxtaGKN895QjdZBHObigL3+rAoB/6uz40Lw8OUCHufnjea53BbljppqTbBGfOsy//iVA+LYm1kz4sjXsqgXkobveVzkL0l7OvVp2FF4rOArtFZ6IWkKCCpbMjQabWdV0nI+HdMCgEIrYSNmeXnSG3OGciuCaEt4Jyjg9DjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51JgHutpU2EsgRlXR7I/4TP+uVgtZlPuyiYL8o829K8=;
 b=jXfEne4KhmMSt3bLiUVLHCkNPm8EB0IXEjmcC0UfetYxYxyLnVmL2dXkGcJmhpx4KKYSUEuwB9J2ZrARum60WZwnex24lt4fJtf2FeE/ZIl2mz0682Io+j0dnbIoClB75g+y8GtahMRY5nI2H4Lp0WnD1DM74K6ma8SAOzkNteveKOfDCFWX/RNz68QUd0mt62rTJZATlFST4J+KXr/tBUmgOEs2dvUTbHj+jyx2xl2tevVDvFJwupxEHitBQAXR0hoDfOB+1kR015a8A+Zy2dUJGT4VUUG1LCl2e/AThrVWL/yAJVDGdhD9i7WUtpPqVhBx/UZUc7JNPrc/M9rHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CY5PR11MB6164.namprd11.prod.outlook.com (2603:10b6:930:27::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 01:02:50 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 01:02:50 +0000
Message-ID: <27c5bd08-7160-0ce6-fdaf-38f73d7086fa@windriver.com>
Date: Wed, 7 Dec 2022 09:02:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][Kirkstone][PATCH] sysstat: fix CVE-2022-39377
To: openembedded-core@lists.openembedded.org,
        Steve Sakoman <steve@sakoman.com>
References: <1728EE7C5FA3921A.29986@lists.openembedded.org>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <1728EE7C5FA3921A.29986@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2PR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:100:55::25) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CY5PR11MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df2f4e0-291d-4a2d-950f-08dad7eec30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wW3ndPjPx26nBC0jStcS82S4z3849y+51PD7jf58NfZnnSNjzUF5qY0BFC9Z8IzXU1rt0zgi2SYs2WxPuuQ6MOa5RKKlj5gIdj1XPlmvhqJUaAVbJ2opIX7xkzNxc/TQxGvrvAZ/j5FwFgnRyIM4FsGMIB1Bncpc6mcKkID1bh/Nss/wAUqemAbq0YklKzLKiIxhBWHzYuk32Eflgdlm0yJCSzWg4UqJYYA7Ay9IPNjmlQ2Ij/EbEweqNLL+kMtERBJ2pxyPfxZkuk59Z2KVSWJIlvtPnZgt2yAacN9CUAYaWWW+ZRtv25YcjWvGWWqQlc1kay+xKtp/sDgmSEhxuC/CUpVZCHICL+MAWQBUF00Pl0PNcu2Ce5bM9d0insT5cmyKkU9MN8SoXSLXsyGKVWkvzGSy87OBKntkH1S3sI8zsrMOXagxYSytMe2P/fGDB56VRhfl3K2IXdL3uYbiaoMM8ZTXIpZVWF5YVDRYqhmF7wVf2skydM2QZlj5PX+t0pB7z0UUiVbyLfEK8kKtm6pWolzac88/CwJ/C0EgPeG2YelsEKGIx988U8/wY6mZv40RcbQH2JBsMlUjp0I3WMoWvQGVMAYzKOQlK71bhUQm3oua5vsUAET6eOP0sKRGdT6KK/d5YPYFkO7M+cTyCNEvK+8UmIenUwdj0aurOMmSA24vghV5L+xjWOY54mOcEFmjcPHCPJidHGubHDmLZOPk1srkImOPa+wshRtn+nyCRJRsHGK6/AfaBY3rvDQb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(39850400004)(396003)(346002)(451199015)(316002)(2906002)(8676002)(66946007)(44832011)(66556008)(9686003)(66476007)(36756003)(6512007)(83170400001)(53546011)(186003)(26005)(478600001)(6486002)(6916009)(966005)(38100700002)(6666004)(31696002)(6506007)(8936002)(83380400001)(41300700001)(31686004)(66899015)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VjN3d0tMaEYxRFhWTEU2b1FzcUd6c1NnUWJGY2NPN1VwU28yRFBMaW11Wmli?=
 =?utf-8?B?WGNOaGJJR1RIMG12aHM5TGRjQXdKSWExaHZFMHFLQnlLVHg1dHdEY3dQeGpi?=
 =?utf-8?B?bzZoUFJIaDdEa0VFbWNrNTc2cEFLa3pnR0NCY1U3K2lXWHYzVW5RMk5sc1lv?=
 =?utf-8?B?WlVpS2lYMVZIYzNLS1pDekVzOThXdW55SzRwMytvdzdLWXhpOWpjSXFsYzRH?=
 =?utf-8?B?ejFoVElPeWp0ek1EdFhnU0t0SzhyWjY1UmRMUTUzb3VwNzdrYldsZEI3U1lS?=
 =?utf-8?B?b294aW5OOHhablJDeXErQk1iVm5UVHhSL2loQTFaYktmaFgySWJIc3k3eUdM?=
 =?utf-8?B?bngwUXF4N3lwNTgyamdqNGFJaVh5Qm1VK0h3Mjk2endOTzRsNHpZYVdRbm1J?=
 =?utf-8?B?K0pWa0RYUlVwdDJsYkd0bkwrZlNNQmg3SWdabUs1ZFgrV3FxS0NheWFrVW94?=
 =?utf-8?B?RTliN0NldFVkYkZZTWF3cHg0TWhkU0xFcFFkNkZFRnFadUswKy9aUmNza2lp?=
 =?utf-8?B?bGtRNCtURjlyRmxmcGpzRDdkb083Sk54NFRCL0FQZWl5cll5Y0RESHdNb3Rq?=
 =?utf-8?B?Sk9ncXhPM1RJZmZvMVE0cmVkSTZHQTRZNXBIQjBWdTZUNCtuVm9VYnpEdHZT?=
 =?utf-8?B?RVdJUGdjTGdJeDE3eEtINU90TVFSVVpKcGNLUEFVN1pybzF1SlJjOWtYbUF2?=
 =?utf-8?B?TmN3WlhDa05yR05sM3AyV0ZXQUZOWGRkZ1cybWg0L083RFJLL25hd2VHNUhB?=
 =?utf-8?B?YmpzUkdGZ3U1M3VzYnNhdFZHRzlGRG1RQnljb09tc25BelBZSTAzRHpYclIv?=
 =?utf-8?B?Z3M3YjJvVS9nbVlHZ0k2Z1ZoZ2x0aUFBZW5jUlJWS3MzVE8vZXBIWEMwcTV4?=
 =?utf-8?B?M0wyUSswVk5BNmkyUXZYcGMwSTltQnZXNGpBVWFNZXF6WTk0YzRUbzBiVjRi?=
 =?utf-8?B?cm5tZUNSVnc4YzdxeU1nQUREdTlIYkx4dzJtWGd6dTdRRWNzMms3TGRUbHJn?=
 =?utf-8?B?WVpHdkpXYlZsTFM3ZTJacnE0MERIV3o1ZWRYS2Rsd1hHa0I1dG45L04xTVdV?=
 =?utf-8?B?bHhpaUU4alhCUXBIenZkb2hxN1haWDJ0cjBRQXc1UEJ5MHJFSDZSTTJ3dmxy?=
 =?utf-8?B?aElSN1FGMCtxQm03ajdpZkZnbk5NL1VCVFd6eFkzSWRwQ090RUk0WlhQSFVB?=
 =?utf-8?B?VmVPcWhMTEdnSncxSDZTNmJsU2hhT084RzhtZUllU0llUDNwQ01iaGo3SHVa?=
 =?utf-8?B?a3VoaTZPN25mQjBmYU1xbXpyUjhLeWt2ek1jOENYYnRvSjhUd2N0R3FtVWdp?=
 =?utf-8?B?ODZVaTFUMXJyczJrWXhVN0dxQ2hkdEdHSGtFcmFzeXhCQy9MeFVxOG5oZ0dv?=
 =?utf-8?B?U09Cci81UnFydzF0ZFl5L3lYV2N4TkdEU2JnSUxGNXdZUGtxYVJmbk9USFZE?=
 =?utf-8?B?K3VQRk1RU0lUVDZIQVJ6NGtnZWZTZGpwSFdPN3h6QnhGcEROWUNQYTFwQ24y?=
 =?utf-8?B?ZjZHS1JPeDlqRFR2ekRGeGNoOHdmalcreFQ1aHRQL2V4b1hwakNxNC81VVcz?=
 =?utf-8?B?cXlidTNwUmxUTW5COGRoZ0kwNkhvZTZ4bEhhVEVIbGdsY2wxeFZOd0d1LzNi?=
 =?utf-8?B?aUlSa0dQSTdaS2ozY1VaVlBla2FyQjJZYWx5cDVLdmRTYm9SWXFabGtOT2ZE?=
 =?utf-8?B?QUcwQWFPd1dkdm53VFFRSjBlbzRaY0swRG9GOGw2c1FMZUdwUmtZeFlPdkJP?=
 =?utf-8?B?TS8zWHA5MzZjUkJQRnh4TTcwT1ZzMFo3N2tVVzlQSUFKdlNhWTdQanlyRUdL?=
 =?utf-8?B?Y0tuSnk0YTU1ZytBaURuTUFyY2phWVVDaFJOYlVjb3RBQjF4S0w4bUFPQW9Q?=
 =?utf-8?B?ZlBjRW1EUnVBL3JOQUJoa1dRV3BJamZxcE1TUCtTTm1DM1RsV2ZOVkNBcTRY?=
 =?utf-8?B?cVBXQzBIbXJwKzRQVnpoR0cxR0UrRFVRcjVqQ1k4ZlRVRGhVbUQvb3dKWnhw?=
 =?utf-8?B?SkFqc3FNWVRMalhtaUp2QjE4ZzdiVnBMczRhWEZMS0tFaVhJSzZBekxCWldR?=
 =?utf-8?B?NlJTS3UvemFOTTJkS1ZZamFtelBsRDhaekYxMzh2SkxSb3BrRklNUEJwVjBE?=
 =?utf-8?B?bDVNK3dQWVd2M2NyYU1FMDV5cm5VTWVoM2xzWng0dTI5Rll5Ym9rcWl6Vis5?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df2f4e0-291d-4a2d-950f-08dad7eec30b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 01:02:50.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcWI146f/KXXbrmm8g+hLUfqIxlWA8qTUvl3bZGfX9eIIM/9zeqSXfMtioKkYRe6XA6SoOYFq12xHt6kBTB0+/J+FPpdFySJiz18ze8GmP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6164
X-Proofpoint-ORIG-GUID: i3BulqsgOAeo-PigSTn-Ts9KG6b8D5ob
X-Proofpoint-GUID: VSNYtCOpzN5rdECwMAR4WR0pZxOxQxNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_12,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212070006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 01:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174339

Friendly ping.

On 11/19/22 16:17, Xiangyu Chen wrote:
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>   .../sysstat/sysstat/CVE-2022-39377.patch      | 93 +++++++++++++++++++
>   .../sysstat/sysstat_12.4.5.bb                 |  3 +-
>   2 files changed, 95 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
>
> diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
> new file mode 100644
> index 0000000000..dce7b0d61f
> --- /dev/null
> +++ b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
> @@ -0,0 +1,93 @@
> +From 9c4eaf150662ad40607923389d4519bc83b93540 Mon Sep 17 00:00:00 2001
> +From: Sebastien <seb@fedora-2.home>
> +Date: Sat, 15 Oct 2022 14:24:22 +0200
> +Subject: [PATCH] Fix size_t overflow in sa_common.c (GHSL-2022-074)
> +
> +allocate_structures function located in sa_common.c insufficiently
> +checks bounds before arithmetic multiplication allowing for an
> +overflow in the size allocated for the buffer representing system
> +activities.
> +
> +This patch checks that the post-multiplied value is not greater than
> +UINT_MAX.
> +
> +Signed-off-by: Sebastien <seb@fedora-2.home>
> +
> +Upstream-Status: Backport from
> +[https://github.com/sysstat/sysstat/commit/a953ee3307d51255cc96e1f211882e97f795eed9]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + common.c    | 25 +++++++++++++++++++++++++
> + common.h    |  2 ++
> + sa_common.c |  6 ++++++
> + 3 files changed, 33 insertions(+)
> +
> +diff --git a/common.c b/common.c
> +index 81c7762..1a84b05 100644
> +--- a/common.c
> ++++ b/common.c
> +@@ -1655,4 +1655,29 @@ int parse_values(char *strargv, unsigned char bitmap[], int max_val, const char
> +
> + 	return 0;
> + }
> ++
> ++/*
> ++ ***************************************************************************
> ++ * Check if the multiplication of the 3 values may be greater than UINT_MAX.
> ++ *
> ++ * IN:
> ++ * @val1	First value.
> ++ * @val2	Second value.
> ++ * @val3	Third value.
> ++ ***************************************************************************
> ++ */
> ++void check_overflow(size_t val1, size_t val2, size_t val3)
> ++{
> ++	if ((unsigned long long) val1 *
> ++	    (unsigned long long) val2 *
> ++	    (unsigned long long) val3 > UINT_MAX) {
> ++#ifdef DEBUG
> ++		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
> ++			__FUNCTION__,
> ++			(unsigned long long) val1 * (unsigned long long) val2 *	(unsigned long long) val3);
> ++#endif
> ++	exit(4);
> ++	}
> ++}
> ++
> + #endif /* SOURCE_SADC undefined */
> +diff --git a/common.h b/common.h
> +index 55b6657..e8ab98a 100644
> +--- a/common.h
> ++++ b/common.h
> +@@ -260,6 +260,8 @@ int check_dir
> + 	(char *);
> +
> + #ifndef SOURCE_SADC
> ++void check_overflow
> ++	(size_t, size_t, size_t);
> + int count_bits
> + 	(void *, int);
> + int count_csvalues
> +diff --git a/sa_common.c b/sa_common.c
> +index 3699a84..b2cec4a 100644
> +--- a/sa_common.c
> ++++ b/sa_common.c
> +@@ -459,7 +459,13 @@ void allocate_structures(struct activity *act[])
> + 	int i, j;
> +
> + 	for (i = 0; i < NR_ACT; i++) {
> ++
> + 		if (act[i]->nr_ini > 0) {
> ++
> ++			/* Look for a possible overflow */
> ++			check_overflow((size_t) act[i]->msize, (size_t) act[i]->nr_ini,
> ++				       (size_t) act[i]->nr2);
> ++
> + 			for (j = 0; j < 3; j++) {
> + 				SREALLOC(act[i]->buf[j], void,
> + 						(size_t) act[i]->msize * (size_t) act[i]->nr_ini * (size_t) act[i]->nr2);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
> index fe3db4d8a5..3a3d1fb6ba 100644
> --- a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
> +++ b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
> @@ -2,6 +2,7 @@ require sysstat.inc
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
>   
> -SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
> +SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
> +           file://CVE-2022-39377.patch"
>   
>   SRC_URI[sha256sum] = "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7e85dc04b7eee5b"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173512): https://lists.openembedded.org/g/openembedded-core/message/173512
> Mute This Topic: https://lists.openembedded.org/mt/95129830/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [xiangyu.chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

