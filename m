Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD656C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 17:31:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28836.1639503088069526186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 09:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TockLO6T;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79825335c1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BEDNRHV032375
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 17:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4qKxatZ7pcN/j9E9OHzL/JHg+/lHW0p0n63aw+4IS1w=;
 b=TockLO6TEi+GZ5P+k14c7JC/RluqAU+YPVX80uZxFHP9qMevNr0SD6ASOdtkJlbEOLgc
 FvuLHeRgeia6b0fdJxRLgaecVRVAt9ZlSO5Hb1iSw5wieceIeYBGb/6DhPXT+el6WQZG
 LTCrn99VRWQ97dVIADK8hTDjeb8PoZXTCvmySxV/8WfHiYXm0oFYmHkQWwdbw1spZw+I
 ejJ1AjWu0x0dojxgnoAjeFJ0gPEbEimBFe8zobu2btuLFuzW1HJa2rFnIgCqWznVCaRc
 9kaE5UaKTacPeEWl3tUQ9uGf7+O9e6dTi3OyIvlIy3tWUcu3iaS8d/fM3ACJEkhMOiDo Bw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cxjt10hcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 17:31:27 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BEHQtYo019593
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 17:31:26 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cxjt10hcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Dec 2021 17:31:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErJ6rOr46LIb+1pTGCD2D44T/1gf3QDtgCrq7KKgc1dBRmOdBh/6wRH25mwu1EWlNhqcEHQAIvyi/dQJrcj4c7RQ3RmJn26YloKTBe3+0gyOGWQ0ODDKy3t0wq2sPFwlEHfSqvcHX+xVFldl9zdKAh5oQTyZBf4MvJHcYqT9maKkh6an9RlVsfifeCd1Nw3BpJy3olscJ3KeliAk3DlaLca5WZsyRk9Ssr22HZof6MQFUcJlE2gdjjVSZ/rC+Z1nWvgbFTiuTl3VCip/waPTSUfEMUwMnWGaNDWyB34VWTvbsg1cO1TrDvoIoUEeshaNn2pAv0+sXAKkT0nA3hk5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qKxatZ7pcN/j9E9OHzL/JHg+/lHW0p0n63aw+4IS1w=;
 b=eOoQvYFToIIHMKGJdOROgo7BjhlBsxW6kFAR/rBHRF0usKedJvFaRItc4G4Xzj8JfXgpetOkOAAg8uXLpV796er95FBYV30/QdXyjrOZ9YYGzNPNtjjf6myEF6Vt3z7huCRdmkQXEZc01xYlrmvdlAxY9zpES8y23E4vMXwuhniqLSDVfOV4fFl1H1C6AUw7n/chyps1eFm9Vs78ch1Gd6jOzjDPgeAU33OmmXOZN/yqbCIy/Z70bLUjDxuhjdndYqOOObaTLf5Y59A87/Q/0KT0wvMpl+fhXABDhCapdlKALNeGP2pg1sjKOj1ktJNvlrBfPWC6/BaPguWI6wqXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3801.namprd11.prod.outlook.com (2603:10b6:5:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 17:31:24 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c52d:281d:a9ee:67b6]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c52d:281d:a9ee:67b6%7]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 17:31:24 +0000
Subject: Re: [OE-core] [PATCH] gcc: Fix CVE-2021-42574
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
        umesh.kalappa0@gmail.com
References: <20211214104613.19264-1-pgowda.cve@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e76b64a8-5651-378d-2e50-68dde5add6c1@windriver.com>
Date: Tue, 14 Dec 2021 12:31:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211214104613.19264-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::23) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e56873b7-65c2-4baa-ad0d-08d9bf278ce5
X-MS-TrafficTypeDiagnostic: DM6PR11MB3801:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3801EE8BF1E5A0D86C1EF6B5F8759@DM6PR11MB3801.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ianDpIKu+qE+yWpScclfR/sjrzZqv9uyLYfxuChrHSwbdI32HhaCPcmAaGlg3cdRUbjlxE8od8KR/P/T3hB/ULjJr0LMAqhCEby69jcpdf2Xn/Adr9PL7XsPK5Ccet1S4LYZzJpxdForfQNTRaP82EjgJXJeKVOWgqtnycLFUyzwHFxoH6z/3qPCHhqPOTQVr96ybMauWn5YQvRM+09OPVDklRPaBfziYcWAUZ0nNIXUpHE/SQj/gHykY1aDPKM8q0VQsX+PIX8SMxiR5O/Veq4EdZmxk+rCbZzzXkKVSFeV+eeLq1qqcOb7mn4jz94sXGVj1f9PpISF6DL2d+MOo81wZ7a+gvZyqOfh/63Q/VeoRRFPxjoyY4YWieW68LTfnQadMDObi5zPeTJoBPAVVjNLE8i5MCjfdN5ncgwDOmWpOhSlaM1n0u2pgRHA5AdvtLXif6RhhgmOeSuaNnX6rvvAwU/hAxbPfNMNyJZVe8fvbXGGk26UPZXoBvT+8fT3vE9OX09PUh8bF6/jec0F73Zb441iKfh/MHgizL9kGP+dj5eFyKa7B/8CiZ+mkoY74l3vJQdRVNLnC+R5T0WvciY/CZWSMsxivZxI8VscwsbORJSOk0bT7KTjQ1lNSHsNAr0Fjh6q6cXWMe9F+ErwLEVyC1rq7jammllHj2U1RFMlwrn6aUgoAgAoXdZeoMCRqZYueXZlg9uZRLsT6/+72bBGNokTghazhgett3Y5jiWAUSdrNq7mfLtR4aWq+hcjEj04o6GfGbn+x/42Taj4kiMzxldwTGkjgCB9D+g9Co27FPUL6j83smHseAFWwcNtqw/xrkPuU0Wbt6javRTxkvdMnw7vKgXDINW7/EBiFf6CBcyZytX4R9m8Y6Z2eWlPZ5V6KcvTz6QRyoq62e/1Ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(186003)(4001150100001)(38350700002)(31696002)(52116002)(53546011)(6486002)(6506007)(31686004)(508600001)(83380400001)(38100700002)(86362001)(36756003)(66556008)(4326008)(2616005)(110136005)(26005)(966005)(6666004)(66476007)(8676002)(8936002)(316002)(6512007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnZTOE5OMUNDL000UG1zTVc5Yk1mSXEreFk2R09VZXZodTJVVW1HVzkwWUR5?=
 =?utf-8?B?UlZ4OTdWWlVValJLYW1GQ0Q1Tm5FaTNZVVRHZDI4SEExR1A4dm5LbTBtQitZ?=
 =?utf-8?B?ci9JZ3pGSVlFaXM4OFhzdW5FUkdoVU5wOUMzVHZ5ZHY0V3d2cGNLYXVHb2Mv?=
 =?utf-8?B?YXBHb0VQaS9lYTBhMEN6aVRKNXFZeEx0NUJvV3FKaTh4bnFwQ2taTEZqWFor?=
 =?utf-8?B?RzE5NnNKUFR4U25udWNzYTZtZ09ybGg3ZTNHVVRWdGxWUDZSemUveW10dHVi?=
 =?utf-8?B?c2ZDWjBpaXR1ZzJKckdLRFFkSDV4VW5JZkVld3RtV2dDR0c4L1czTlh5ME41?=
 =?utf-8?B?czkyRFNNWFB3SFo0ZlJJdGtyaGJQNlVJMXZaY2NjbElURnRaT1QwZlJ0Z0kv?=
 =?utf-8?B?WEZBams3VkNDSWYvSG1FYnZsNXV1VWdUSm9BZlQ2dll3UUFZeW1tcldFSE5z?=
 =?utf-8?B?eE1kZ2FSeFduZXNXdE1oQytvbGJxTzFXdXdYWHNiYU9Na3VwQS9ZMXU5VFI3?=
 =?utf-8?B?NzdidnMwRDljQnFFMUhvdjl1N3NWdU1Za0dwVTNMajQyZ0IzUy9lYml1empZ?=
 =?utf-8?B?NzZhcmVlb1RoNUc4WDhBRFZQakxEdkQ1OWM2VmMwNjZDWUU1TzlySHl4bmo5?=
 =?utf-8?B?eGRicGxvN0VmWU1scU0wclFOa1FuQ3cyQ2ZJU244QTRxRXBOSFhWVWxzaFA5?=
 =?utf-8?B?RFZuUWlLVVY0SW91N3Y0dkEzNEJFaWM1ZW41WGRCbGhVaStoZDJGeTMwd3F6?=
 =?utf-8?B?STNQUVZaQzF5WjVZaElzU3krcDV2U1JaQTNXbEVnTCt2R2NiVE44TC9yK2VY?=
 =?utf-8?B?ZXB3WTdqaWZmL0g5NVhqV1ZiNzR1anBRWkl6ZWg0dENwcXlLS3Z3RGZ6WU5Z?=
 =?utf-8?B?VmozaTNBSENkME9GNU1iVjJPWks3WFJZMUdCNkhLVjVwQlFYL0Z0RVdHRFNV?=
 =?utf-8?B?c1RVcW8yc3NSeGNtc2djUEtST1ZTNEl5S2RKRWhoV09jWmxidG0zbEx6M1pH?=
 =?utf-8?B?c2dXWEgvSnBwbWJBQ2pYZkl4Z1hlUjNPWnJKKy9pV0s0YVk5cVZFdGNsazhL?=
 =?utf-8?B?L2FwNXluNjlyd0k2aWpGbGIyQ0FodHF2UVBsMXN1TGtrYk9TcmVtaFpIRFIy?=
 =?utf-8?B?U09wSnc3ZGhra1FSZ1UzNXRDcWtOR1E5Q0hQV21ydkp5RVJtUWwzZW1kN0Jm?=
 =?utf-8?B?c1IwSnVBeFRtQUV2R01adWVQU2t1dk9CQnluNXBNMmJMTXRPTDZFOWsxbnRR?=
 =?utf-8?B?OG9CUDZIQXZlSEIxMXB2WXpKblpkVFZFOG1XaWd0QnExMWdUdlZDOTh3TmYz?=
 =?utf-8?B?SysyaHpUcndDbDdTYU5uRm92Nm42UjNYUjh0elFRTTVEOFk3N0pPQnc5dnVy?=
 =?utf-8?B?Wjd1d0NtWDYzamR2RmdZcHZkUGVGdEtlaG1JN0t3S0JucUd0bU1pM1pPMUc1?=
 =?utf-8?B?QzdTTXJueFZIcThxN3M3WXNodE9JN0VYNmtqV2tMbDlWSE1yR1BCUEJCMWY1?=
 =?utf-8?B?emVBTzYwV0pqbTRkN2xxQVVUcStFUVVQRDJLUkRiTmNGTlJKMVpKa2RsTzRw?=
 =?utf-8?B?cTNlcmJyUnYwSkJSdWJUSjZ1QjR5SzFUak9NYThoQm1MaHVCRWFYRURUbXhv?=
 =?utf-8?B?c3F2VHkxdS95ZlhITDNHOTl5c2ZYd0hxNDdDVzMxL0tWZ3ZuUy9WNVV2TFN5?=
 =?utf-8?B?Ymk4a2NWd0lMRXVvQXRjOHpSeWtHNWE1d3h4QjJSUUZzbVpkVVN2VElrVml6?=
 =?utf-8?B?Y3R4MXFvSDkyTGRIb3REaW1qZHVacTgyTDRaMlQ0aXZSZmZ3cS9NOHZ2RmJP?=
 =?utf-8?B?UHpzUG1VdXU4WDNhcDByWmxmNGhoQ1YxQ3RUcXBvSE9FQ09TR2U0Z1BPeGNl?=
 =?utf-8?B?TUtMbTRuRnZoNzdHdDNLeU1wTUFRWjZtRGcwMmhFNU1hdlpvdGEyTW9COXRD?=
 =?utf-8?B?VWFOV1l3eEg4d3BFZy9SdnhUT2lOeW5GUFcwOTlOdzVrMm9DUEU0MnB3cEpX?=
 =?utf-8?B?OU5nZFZjUXFEdmkxZEdyVm1SdEtERDZCQ2E2NkVWVUJKdGFTS1JYM2dXZlhQ?=
 =?utf-8?B?YmdPQU1vWjl1SWt6RG5zWGNyVHU1aGUyN1REZ3YveERWYXpWY2w3VTBaK1V2?=
 =?utf-8?B?eTJlL1k5YjVaVWFCMGl2eEtYOXJFSnpjSDhkelN0ZVBtZ0xORHVrQjhRTWtV?=
 =?utf-8?B?RS9UWjFWT3d3dFkxMDNzTG9RNEdqQ3NVMHNxcDBhZGdNRGNqVG5tT0xINU4y?=
 =?utf-8?Q?taGkblKwPmZc56SWfvB2L8nqbIN6SICGXHKPiSP2v8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e56873b7-65c2-4baa-ad0d-08d9bf278ce5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 17:31:23.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Qe7O+hFNQmETypXUXa9uFjiztaJXsrRebM+/CtmHJCNptrTdC0qG2pbitmsdDvmZwl3/WGGCXjN5exmGGNP4CjQpu9rE3kNDm8tjBqUH8YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3801
X-Proofpoint-GUID: LcyHsz3WAj0i1yE6b6Qqtp0yncqBWaCY
X-Proofpoint-ORIG-GUID: 6XtbeZcNZQfVeSfRAf9_XRC0M0AWzWBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_07,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 17:31:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159700

On 2021-12-14 5:46 a.m., Pgowda wrote:
> Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
> Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=51c500269bf53749b107807d84271385fad35628]
> Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
> Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bef32d4a28595e933f24fef378cf052a30b674a7]

Ugh, that's quite a bit of patch to fix this bi-directional Unicode 
input attack.
I'm fine with these changes though.


I do wonder about how or if we should fix the CVE in older releases.

For example, has or is there an indication that gcc upstream will,
be backporting these patches to:

$ git branch -a | grep " releases/gcc-[10|11|9]"

   releases/gcc-10

   releases/gcc-11

   releases/gcc-9


?

The current state of supported branches is:

Branch     	YP gcc ver      Latest gcc ver		Upgrade needed?
------		----------	--------------		---------------
master		11.2.0		11.2.0			No
honister	11.2.0		11.2.0			No
hardknott	10.2.0		10.3.0			Yes
dunfell		9.3.0		 9.4.0			Yes

https://gcc.gnu.org/releases.html


so please check with upstream to see what the plan is for
the 9-11 release branches and this CVE and report back here.
Feel free to volunteer backport patches to gcc upstream if needed.

Are people CCed okay with upgrading gcc to the latest release or
ideally the next dot releases that will include a fix for this CVE
if it happens in the coming month or so?


--><-- snip --><--

-- 
# Randy MacLeod
# Wind River Linux


