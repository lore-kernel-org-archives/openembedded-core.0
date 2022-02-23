Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A87C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 01:50:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2269.1645581013700962691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 17:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=ExygBN8X;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9053943605=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21N1KXsJ024020
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 17:50:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ZFKkKybF/b177V/YcPheOouK23FhMee/KyFYOu/Yod0=;
 b=ExygBN8XXAoqzN/OrvtVuSrI8wYA+r7ihW14ht3hNe3CvHLq/q034WDkfJxC04s0aM+g
 666Hfz8ahCcVOLEyymtLO/f/LmRnDnbobqpbhAJEhkNYM86yuwza58kB1HjMgykAgNrZ
 ObxNNwc2rXb8aIqrHZ6AKGsBwtG8bvGmH6Da1SWm51xLPQgNH5nyoGo5BncKwnATNiDo
 u/B9Rks7G9+eDt8sTtt64Lfxnb1uzlx4RkCS1ndpjJnjLtbUkPzfGgXPy/UtYWXlMNoL
 TZ0+4LSKDE0df0nXSpIhMRmnQ7/yNrDyVITqfRifeDBKjtqjHDT2cWCw7DHRRj7+8ytf +Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecj2ks7bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 17:50:13 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21N1oC2h018668
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 17:50:12 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecj2ks7bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Feb 2022 17:50:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tcqgg6flnxFg8lhJ+SbXcSS1aBh9mxrs9jyQHzMMPcNPYQyg6G1OozNyNuS1mt5pxxp5GUm9UgmnOf9hGvKnzLtBwMik2ePCbWy71RCc+ahkhEWhNp4ZXIueU0FK3lHa1zpkJM/Yn3f57nepYainkpPJnZnkpnTYXQ75SsZyc3cETXhTl5PV74MkTOfcB1tTcoLuG3ilqiL/012xpR056hLKzqUu5CPXuk7InCATgTaipGNWznOoYZNlUxrksp5blC69dYnftS1QdPalpOJ4Po8Ue5AbaXChA76+tStCfAxtMgueBCTjXIc7apB3+weDEUVb0vSuSEzy7NeLnVX11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFKkKybF/b177V/YcPheOouK23FhMee/KyFYOu/Yod0=;
 b=mH2qrMVWXR52+4vj3WD42WhJjqgVZyU56GlHMT3LLV97e/PFI3CwcSJ9PECQRqKJmHDPLIoGqcmS81uk6QD8QHj+kYUTj7v6vVZQTfFZ2wywLFnI8i07VYSIgC37USoRA7w/MUoFtz6pybhDUqKyhMg4EBYboLzYkq9KfCbPBkEbyCBhG28QGt97cuvxPXZpLzuKle79nJgb6jNAwADl7kAtehsgorZX7PgJF16Kf0KnAhMh/2hgQSRkSY9nmX9KXG+RU7/nfIG24Aj37Zvn2503Ux6Ik+TcwlW7XjmqINTPTJYskadzpxKcmV+lY4vZhnL9dwftDHL6c9/blf2hjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BN7PR11MB2754.namprd11.prod.outlook.com (2603:10b6:406:b3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 01:50:10 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::4590:4718:9f20:9d6c]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::4590:4718:9f20:9d6c%3]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 01:50:10 +0000
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
        openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <7b788487-cfaf-7d47-2697-6ac692cb7b5e@windriver.com>
 <7764a230-888e-f92e-538c-dcd536e300d3@weidmueller.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <2e481fb7-360c-890d-b651-4a83af7b11c6@windriver.com>
Date: Wed, 23 Feb 2022 09:49:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7764a230-888e-f92e-538c-dcd536e300d3@weidmueller.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: PH0PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:510:5::8) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ba49581-06b7-4096-9eb7-08d9f66ed31e
X-MS-TrafficTypeDiagnostic: BN7PR11MB2754:EE_
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2754291610C5FBE3A784D54FF13C9@BN7PR11MB2754.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pxrj2J2JocRCoTJOzqjmdVFkoVdGlHS1GjjShbXRvZCx7KXIeC8WWAuNTgIYCKrPCNggrR2QwxWQS7cnl4GKoL6nMZKq+SJc9/3n3VGTHw7YhjtfZOa9I06cToBxMZa/Lb4TEOQGnlU6o044+IBgMfY+kl2QNnHAb8n46i4HQIT6Wjasuu1qDd6kQBzmWETvZyp3XO46WSKgptaL9HMetlf4HJbPl+pDdlQ026zXkzvoq2cT6xRDj3b90RG6vOfb7LWzZNg6U1Uxv4ceQcR+trnwZuPSWKx7Y6xAbiQMPhq0BsqN2c1+aIrmAGmCswMdhRCM/hOf85RjRYQhZzBSUVmR11oZThKNd6q7iEKzsUNZOJ3e7+PLDVKCUePoTCPqVWg+6wTfgDD/hOIxPfoseqEEQ8Tye8MrAWRGeA1aS7vFneXVph8v15auQfrUjNVhRlejK2ot3MlOofqf8bzkbVFLwc8/qtPSkb0MC7X3eMzHVrqTe/YeHlApQfFNx6wTEYxMC7P9tWKx7cVfjtk71n1NEYCa5iHnkTJGE/bH62xoGQpT/gX0WBh8FTih2qNxsUa+tocmEcWF2/7w5FhzCJz9pD2y3KMBNCr57gQajb4+Ewqr51kRLN5HqHao96BiecbmhkARGtGHtG3bI9x+e30vc61NXemjxV1LAo25ihVJgWuTleWMFyDCmqiDxhvVLFOLLviwpYESTt9KfS/mVC2rC7pTwV2sEEMrgd0JGTGwLOIZ7p77JcueeNF61SuL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(186003)(53546011)(26005)(66946007)(66556008)(6512007)(2616005)(6506007)(66476007)(6486002)(31696002)(316002)(86362001)(6666004)(508600001)(8676002)(83380400001)(4326008)(38350700002)(38100700002)(5660300002)(8936002)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmdTZ1RRNHd1d2xEcXZCUUZMdU1Kdzk4NCtGQWdQOXJoQng2RDJmb3ovclFv?=
 =?utf-8?B?QTV5cGhIaysrMkNXTmgvWlVXT3VNSUc2WGZFZFNIekFwZHFJclBRbkF5Vmwz?=
 =?utf-8?B?VDN3WGRSZGMzeUhZSTlCQTBiOXU5M3djNDQwNTlWS3RrZE5lNWxJanp5SWJ0?=
 =?utf-8?B?T2RKMm5RVnhTYWtjL0N2YUcxVUZEOW9venp2ZDk1NC85TmJmL2J6OTVBSDlT?=
 =?utf-8?B?QlhWT3ZpT3M2alQ1aEdUSU0wRWVEVEtxVlRqajNaTFZscUtCTnZ6WndET0c5?=
 =?utf-8?B?bXY0aGFYNTRHM0FjV0k3M1VnMmR6S0paL214Rk5MeU5iSDAyRHN4WHJxcEV6?=
 =?utf-8?B?TjlhS3VWdHY5N2RrZHFYSERhVHZDNG1XU0pteno1RWlHVXAzMFZ3encwRGsy?=
 =?utf-8?B?dmhONnJ4dEt0MWwrcTRjYitMNVR3WDdISUw0ekMvUVBBMDdmRStHODFjZUh5?=
 =?utf-8?B?QWpFUmVxeGozb2x4Si96SVIvdXpHd1MwbG1rMElQTHBFN3h5ekVmVzJTWkw4?=
 =?utf-8?B?dXJGSExHTmxzeGVUcCtMQzgxL2NaWXc3Mm52Vlcwc1M0QVZINGxTYXlLYmhp?=
 =?utf-8?B?ZWlxUkxjdkhObDV5Rm9ZZ2Q0bER6VUNyZnh1eGx1dHpPc3prK3lMbGl2UFRW?=
 =?utf-8?B?Qi9DRUxGcS9tUUEyNzZ0aEx1dmRCK0pCdWhxSnA4c2JYdW9wSmpLZnNSSkJ5?=
 =?utf-8?B?Nm40bG0yQXlvdzNmYnFmdTlFQXh3dVo3L2FJcHZ1RVV2TDNNcWVHV1VhZWFX?=
 =?utf-8?B?bUxtSWgrQzhTZ2JrbFpFc2FRREFWbEozYnhBOXpVeHFsUDg3L3RQTStGaFpZ?=
 =?utf-8?B?RytQakVFMHNaS1hBUU1oNjcxZndFV28xOWppa0I0N21VelF0TG5XWUlvVWNF?=
 =?utf-8?B?cy83disrMjdoOGprTjJOZlVuNkNqSTUvR3dwUG51WXdrLy9TSWVBbEFvMEpx?=
 =?utf-8?B?cjJPb1g3MDhiVHZPSHJ5d1J6VHV4eDJGbTRuNDhROU5Ub3N0anplektmbjRi?=
 =?utf-8?B?WXJaUW5qTndMdUhZNlhCRllUWjdXbmQvajVTWk9OWHhnYUxWMXBXSFllU0Qz?=
 =?utf-8?B?M1ZqczFQK3FIbWs4WmxjWHF0REdZV2NjSVRUbEtzUmt6LzZwSGRrZld6VlZa?=
 =?utf-8?B?YVNiK0ZxR25VcHFPVFlJVWhQeVZVN3NOMzVST21XM0c1SDd5UWpiR05GRFJF?=
 =?utf-8?B?aURsdDRHemlqQXBCSGJwSFRRZko1cXhLdzdYM1VuRUY5TmYzOUg0bzBnZ3JQ?=
 =?utf-8?B?Kzh0ajYxQ1EyUG5TNllHWmVSUWFDZnJOenU4RGFoVkFRc0FlUlpIdEFqQy94?=
 =?utf-8?B?TTRDeklhMUozQ2pCcmoySUNLaEJUVFRWSFFUSzE3U2RRRW1hUTQwK1ZKOE9i?=
 =?utf-8?B?NW5wd1RwT1RBR0JzaEt0U3hEcjc1b0JSaVdwSkozTzVRTzBaam1NY3RyYVh6?=
 =?utf-8?B?aUU3b2FDZGNlVEE3bHNlb1g2bUc0VnBQQzhsLzE5Qjl4eGdkUHVCMmhLck1Z?=
 =?utf-8?B?aXYxMzJaZC9uWGQ5S2RKQkdLcVp2OXFjK0xMNlVkbnVJYTZwZmRjTXQ3c2tP?=
 =?utf-8?B?U3pQRDFNSEl6OWhySGcrbDNOQy9uQWRnMTA0TUxLSUhZblkybDBaTGlteG5D?=
 =?utf-8?B?MllFOFBwSjRUbGEvZGRPTUVVUEdQalZPVUxVNzBFMmJXdWJaV1hSbHp3MmNK?=
 =?utf-8?B?T1ZxNWRPS2NXa1pxWlJyT3hEdHVqVEtFdTdLYzhpWE5kbnBhWUg4ZXpjVVhL?=
 =?utf-8?B?b0ZtMVk2ZHZLNzdNeXNMNFJxN08zRHdtdnI5akJVNEU3Q2FxSVRzZXB4dHlY?=
 =?utf-8?B?ckt0UE03cDFNa1hOb0I2VCt4SEZNNHp4L2FJUGVrUGxFVFlIcDFJaWJRaUQ5?=
 =?utf-8?B?dm15ZnhZMlk2U3ZHdWZ6M0xBTzhBd1dydEMrOGpPdDdnNlpnMTRPVUx5cWVU?=
 =?utf-8?B?QWxpeCtWaWQ0cDJoWXZ1SFJXNHA0dHlsU2orbWE2M2ZMQmpkNG9odnh2VXd0?=
 =?utf-8?B?MEwvK3E4L2N2cHRPMXVLV2JwMm1qNW5OQjVjdUptQ3pqWXYrVEU2bkxjR0Ev?=
 =?utf-8?B?WnRNMHZzQVBCWHlOdi95OUY5TlJwWXJQRjc1SUdnTThVbXBmNGVQSWh4bHJQ?=
 =?utf-8?B?NHc4cmNlWFlYZE5KdnJUWWFtSnRhOFpxM3NmeHArTGo1dlFjME1yZE9mZFEx?=
 =?utf-8?Q?RUrpIDwKtfbxretHj/bnXGw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ba49581-06b7-4096-9eb7-08d9f66ed31e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:50:10.2532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zF0WvC1EUEmGXEbYi7kW2Cj20K6PraFfz/hDrXV7eMovi7FI8N+alfPSRjZQZnI/462xPl0cvRByJLtqnR2Kjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2754
X-Proofpoint-GUID: qrBkoOBm_KamjLyVZFyp0t106cSTNGDU
X-Proofpoint-ORIG-GUID: T6siZiTkj7Y1z-ypeR13QhjzhJXkNegO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_08,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202230006
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 21N1KXsJ024020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 01:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162239



On 2/22/22 9:26 PM, Stefan Herbrechtsmeier wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> Hi,
>=20
> Am 22.02.2022 um 10:20 schrieb Yu, Mingli:
>> Hi,
>>
>> On 2/2/22 3:35 PM, Stefan Herbrechtsmeier wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>>
>>> Link udev shared with systemd helper to minimize the udev package siz=
e
>>> if DISTRO_FEATURES contains systemd.
>>>
>>> It is only usefull to link udev static with systemd helper if udev
>>> should be installed without systemd.
>>>
>>> Signed-off-by: Stefan Herbrechtsmeier
>>> <stefan.herbrechtsmeier@weidmueller.com>
>>>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>> =C2=A0 meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_249.7.bb
>>> b/meta/recipes-core/systemd/systemd_249.7.bb
>>> index 739f3aae86..431781e6c7 100644
>>> --- a/meta/recipes-core/systemd/systemd_249.7.bb
>>> +++ b/meta/recipes-core/systemd/systemd_249.7.bb
>>> @@ -66,6 +66,7 @@ PACKAGECONFIG ??=3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', =
'acl audit efi ldconfig
>>> pam selinux smack usrmerge polkit seccomp', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES'=
, 'wifi', 'rfkill', '',=20
>>> d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES'=
, 'x11', 'xkbcommon', '',
>>> d)} \
>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd'=
,
>>> 'link-udev-shared', '', d)} \
>>
>> After this change, the iso image failed to boot with below error:
>> Cannot find rootfs.img file in /run/media/*, dropping to a shell
>>
>> And more detailed about the error as the attached.
>>
>> Steps to reproduce:
>> 1, update conf/local.conf to use systemd as the default init manager
>> DISTRO_FEATURES:append =3D " systemd"
>> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
>> VIRTUAL-RUNTIME_init_manager =3D "systemd"
>> VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
>> KERNEL_FEATURES:append =3D " cfg/systemd.scc"
> You have to set the INIT_MANAGER variable instead or set the
> VIRTUAL-RUNTIME_dev_manager variable to systemd.
>=20
>> 2, bitbake core-image-minimal
>>
>> 3, runqemu qemux86-64=C2=A0 core-image-minimal=C2=A0 iso
>=20
> A revert of the commit solve your problem?

Yes, the issue is gone after revert the commit.

Thanks,

>=20
> Regards
>  =C2=A0 Stefan

