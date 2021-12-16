Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B06C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:03:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11593.1639666999228559880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XNTKnojM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7984beb1e1=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BGEZSDH026827
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 15:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=+743VTpAXk/f3E2mIfd/m1oyQ/8of7wuzbORRPP3vNg=;
 b=XNTKnojM89gUHsnmLd0cZbIh3qXRBl4BDEPapPoNERr6tLob/Jn9igjRlUC5l7CQVK70
 rXVlh9ElUidGpNOYtY+i6gzKI/+sYzkzzBh9rbN7asZqIh+LKqoH/1phRr9IGtaglLAt
 LCpU69aWGNHk5Z8jLAGoLEpO4LhM+i2On88ndEmC7Q6RFdtn+6p/A3aCE1Zp9NiSay/f
 yLzNQr/7LDiAMqUAFX9ArKQeKKQarz5+Mc3RS0N65sWP9owi6IJtTPxSfZzoYJzZFw9L
 AU0KPB9tsoojbM8uBf3wa9kJs/oyYTxRtT5dLvtdG+Z1c0cU7uKdd/Zpdi52oCJpIfTp RQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cytedrgr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:03:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVDRt2/abpzqGyoP1SnNRY4DEKZIjS0z/UQ2Fjrt9cDk2bLHi8vNpdTO4BfC/H27yDvbPEo2bP+FudqjyNgWQN0fDaRT4QVp6IriawlZGfZ1BhX+LMkALm+N/Qh4QOHvIroc2aV3XhWtznew/QPhEUjz2DJFLnKgPqvOjTgNbcaOXp1ZsIRTUkWrzKkUcJuQTbB4clOTSZk/LnpK2/VhEzPv9wNFiRBIYn4cSktYGO3eUFRtE0gbwUfZilA8unDKJrxTIKuO2ZPTNwcWCgL1DSZYEdByGqZ+5M3Jsg17cAuK6cmpDMar2A+qhLG2svjHAGNbtvvZBdCjwskt1vX+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+743VTpAXk/f3E2mIfd/m1oyQ/8of7wuzbORRPP3vNg=;
 b=QLe2IBAkVCFbvLcTO/P14tXQx6mh3cJ6znaMefrcTKgjyKp/WmItssZcQdLaKbaIl6rHZz3DYego7WJqFAQgE4DS84tqNvi8U0psA+yEfVKL2ZYm3eTvFaUHxZIBkHgRZjBlDjFOcV4Nzbuu9AQQ7rDML+EdqKLIjtjeoVQgQu6q2sDvQXPT/MU1ODtXE6Agomra6KXrxoWt21vt1OHQNG8uYr9NccOuJW4zZaXU/W2Vg6yWeJZ2+mp611NJjyDXk+wDuXAk+4SiEppCJCg8k3dwCHogQJ9rNOAWBjzf1EJLi/PSML00jcS1RRHdiNFNhT5AiPGO6110qdmv9syXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1437.namprd11.prod.outlook.com (2603:10b6:301:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Thu, 16 Dec
 2021 15:03:16 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a%5]) with mapi id 15.20.4778.017; Thu, 16 Dec 2021
 15:03:16 +0000
Message-ID: <a1fa954d-5f39-3b8f-99b5-4642cac5e9fb@windriver.com>
Date: Thu, 16 Dec 2021 07:03:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH 4/4] core: udev: udev-extraconf: rename
 mount.blacklist* to mount.blocklist.*
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20211206153511.34838-1-foss+yocto@0leil.net>
 <20211206153511.34838-5-foss+yocto@0leil.net>
 <34cfb0378a0168756a1ce573b11b292618be2aad.camel@linuxfoundation.org>
 <34a9b96c474ffdc50b4e0edfd3e9300cb1b7c443.camel@vaisala.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: <34a9b96c474ffdc50b4e0edfd3e9300cb1b7c443.camel@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:300:ee::19) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 058afc4b-7152-418a-ddb7-08d9c0a53039
X-MS-TrafficTypeDiagnostic: MWHPR11MB1437:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB14376D83DB4BF0C837B0C786EE779@MWHPR11MB1437.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Am4CznhMbZmYSZGY/FbcOwQIwBu3os+mpvW3FdumkUt/Eg9/RODk+CgSGT7CRVPOsj2SszemMGUc5OPILFKdk/pJ7t8vREHdNUs0wxm2f8uY+d8a8uoXFIZ3bAmYA3B8HK4m/pETf94KrlCdvK099q9Nt7oc9+uOWtLCQa4T+/krUiFYZ3PiDlVH/GvQC8K1EyU6P20q67wVNU09A1YkXlP8G73MFBg43w0T/d02tTgiADRFShSZ+kiJSWzajahajSYU9cXuu5/9KyaeQy+RR4x9oiIdozoYXI1JRvwpG7j+GSVfBz44lmJTtvB4oWHfxlmNjosz+NGNyn+n05HXT7OttcZxhjkwO/WG6o3Q4qwDFakI98fUcEEcd6ojRiecp0WHStHwTDjtBsViHVI3HL6jkefVqGQTKFrwrcMwXuWxRZtiZ1dF+OVyH8WSI9vguSChpuiPZoH8Avcmp5VgcrOHJCmAfZmmECjPGi9iBYPuLXmbU0+7AmWcx5tY5QbcsY6IEYq5CLGwzVi5oLghbIFjnXVYv/6WVzsBIoNLD0MYrApzfMxFqXTZWKOolOb98xUH5Shp2bLu7cN0Y5ov/e6f5ZJBxjBIQHovGhOVO4hBBBOI24JzLOhdEeIZFoKySPdebUq6y90sCn0NOclpEF23qAYV3aNATA8YkMnZj26V9YZlBNS8A/jfv84i56nH33k2ry8gIaVJHcLwwhFTxcVtfE33ra7UXfGTayrK4V2N5tGhlFzJ3AERCCu4Jtv7ks2Wn3xTPyS4jlUlYi7S0BO6CQ8tCWIsQD+G2KBZFK8+Fxp9CwQrfKOw57Oh7BZOy8zKD6neYO4onoupe5x6bLsOYOmjIRhoBqMSPfxNMKK8m8a/xsgf3CX+u1klid9eBerByFUW6YztfDnWYR1YGg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(6512007)(53546011)(38350700002)(6506007)(2616005)(6486002)(186003)(5660300002)(38100700002)(508600001)(2906002)(8676002)(31696002)(26005)(66476007)(6916009)(36756003)(83380400001)(66946007)(86362001)(52116002)(966005)(66556008)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V0JzSVZSNXY4VnlsTWt2ejVjL3I4dk1XUkJ5QkU4cHA1WlpERmhQeFFzYnY2?=
 =?utf-8?B?U0puMGpiZzA0ZGpLWml4RXlhY2hINGQxTEduWHVWK2lqb2o5OVc0aXZJdG5p?=
 =?utf-8?B?eFh4dU8rdHE2V01ROFVaK3dZR0twNmpvTWErMG1meEx6eWFsTUlqOEcvUE5o?=
 =?utf-8?B?Y2ZDa1RwVXdLTFJrYnVxdDg2b2sxQXFKeGtlK00wRGxxSExURjFUa3c2YnJG?=
 =?utf-8?B?Ukl2TldaTHpQMmdwZmtGeWQ0WlJMTXVwS3pCcmYwYzcvUEhaRjV1b3hJSTZ3?=
 =?utf-8?B?MGR0Y2tKUlViQzhjek9iaEpkdXpIcTNsT3BnaUQ1RWhLQ1hvVXhadDByQ25Y?=
 =?utf-8?B?YjJ0cy9FRm9ML2Z3UGhzUTdjWkFQanJxdHpsbVhFSnlMSHFCVkJtZHpNOTB6?=
 =?utf-8?B?MjIxdzRPSllXQkF6U3FPK2RBUC9sdm1jKytHV1NwaFZSVGpzTDIxOTEyNEtP?=
 =?utf-8?B?ZDZOdWJoM01ZN0NpaGlRNWhXN0dibnlZclV6aldMS3JjTzAxWEtRaEI4dmJs?=
 =?utf-8?B?VVQvYmZxNGRBWU1rdExBT1hLenJKU2c0VTltcFZuVkZYSzBUWkFwRUllZmRu?=
 =?utf-8?B?VzEyeDR0N2hpSHUwcU90c2hhUXlnMER1WjdJQ1Bic1dsbTZOVjJXV0ZUcVkv?=
 =?utf-8?B?c0YxWHF5RE1wZzZGNFZ5akZGRDhOeTJuMy9rcEZGS3RmZURtekEzUyt6bW84?=
 =?utf-8?B?L3YySlY0RTJnc0NYRS9mREVtazE3SXI3K3V1ZkRhL0JiV1pDeStHUnltanhO?=
 =?utf-8?B?T1c3QnIwdlJhdC9iSGZjS2l5aEpMNzZxeXBiUk9IclBRWC9XZnhhMWxvNDkv?=
 =?utf-8?B?dVNDc0ovODA2TGtjckNDNUt3bXJxNXdDZnBGR2dSbnhKSmtiQitNTmU1OEdY?=
 =?utf-8?B?MktYeEZRb1YyNitCUXBYd1pQUW9wblhnQnBWa2VDeGQxSXNlQ3lWNExsNmNm?=
 =?utf-8?B?TEN3bFJHM1d3TWcwbVR6NnBQL2VZS085T0VMTEdMOXlRUzdZSnpqTFNidDNq?=
 =?utf-8?B?TUxxcEh1b3psR3YxdU5RVE8reW5YQ2pzOXNOQ090eU5XWG1qcmZGcktZUW0z?=
 =?utf-8?B?MlpxOVN5M3UyRFpkdUtIMjNzUkVpdjNMYzJNNE5HaXJsZWExNXorLytSWndp?=
 =?utf-8?B?SiszYjB4aVltWEpITUpENmxKNGRxTXY2NGh3UlI2UWRPamc2dWV3YlMvT2Qx?=
 =?utf-8?B?eFNNU0ZHY1k0WkNGbCtYbXJOU0xWVVZUYVRHSzNLSlF3U1lvQkc5eW9mUjdS?=
 =?utf-8?B?NjZjZ2QxWmZUMzZOWEE3VTZxU1JQOFEveFYyQmVSOUlyaXpRMzVzaEtOSnJq?=
 =?utf-8?B?R2VabkFqWk5JcitSNmdxdlBPaW1RY1hjbXMvSUIxU3pRQy9CMWJJQmdhUXN1?=
 =?utf-8?B?Smo4YnhMRGF6ZEtnS2d2RXNFK0JrdWNkUGhmbHlhOHlJb0s2N1EvQkloQkJy?=
 =?utf-8?B?UXBRVG10RXMyVU9WaWtJK1dxTzYzeTJTamM4RGNHdjkxNmM4Yk9UV2hVckFU?=
 =?utf-8?B?b3lWMEliNEw0U1pLWW5TOWVOc3ErczMyRDIzdEJqUWpRbEhXUWU2dFpzOXNr?=
 =?utf-8?B?Q08yR2VkYTRLK3ZHa1FPeHFSc2VGWmNsNE1FcDNrbndsNTVUeHZQVW9URkxZ?=
 =?utf-8?B?eWE1NitPUHoxOW5kWlZ0SVpVMzBOemFKRElpZGxLODB0a0RIT2dWb3Z2WjI0?=
 =?utf-8?B?bGhNaTJneXozSnBIdGlZZUNWbDFhZzhxdHFjcElkY2RxZC83MjdGZFFpZW5m?=
 =?utf-8?B?OHE5WUJlVjJRTWdGNXE5bzd0eUdLL1BaWGg5b1JKeDRPRnc5WTk4eWpNMXNs?=
 =?utf-8?B?RU9VdTUrWnFyc1R0R1NwOXZsUnZtaW9yMmpQOU5NNkcvYkRLcjlXOUwxU1FK?=
 =?utf-8?B?Smp5UWlJcVlGNFlWc0RQcXJmNUVUL0FNQzVjS2dIRVU0Y2t2Uzl1MzFxUkRM?=
 =?utf-8?B?aHZ1bTk3V3pYVnk3TElndzJ6T2RhRlpMcEM3M1ZrVytYK3M2eGxIbWFiQytQ?=
 =?utf-8?B?SVhjYWFZTVZjZk9nWEljeGV4VVBqRGI3UkNxaVRLK3ZzZFpBSGRtQ2hwdnNu?=
 =?utf-8?B?bDZsa0dXK0pTRU51eE9Da1hKaWFDR3VJaTZjMnh0ZW03V1AveXpCSXFZM3NN?=
 =?utf-8?B?VWVia1dzVjZxUUZrQU9YMTFyQmR2THppR0RrNDhyd1FjcFZUbHBkcEFzRUdw?=
 =?utf-8?Q?DRsuRf0yO8S0BHbMnXv+B2M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 058afc4b-7152-418a-ddb7-08d9c0a53039
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 15:03:16.3211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FeSY8haANWckjaPXQqdTP/gUHLIJ+kNaLARjFijs+b+qNaCoEe9b8sAjzv9LZnIb8naSi1gs+MRBF+inm5Mc0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1437
X-Proofpoint-ORIG-GUID: hVKUQsf6wVBYxr2GzGDfn4ylXK9rKHpR
X-Proofpoint-GUID: hVKUQsf6wVBYxr2GzGDfn4ylXK9rKHpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=426 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 15:03:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159793



On 12/8/21 01:57, Eero Aaltonen wrote:
> On Mon, 2021-12-06 at 23:31 +0000, Richard Purdie via
> lists.openembedded.org wrote:
>> On Mon, 2021-12-06 at 16:35 +0100, Quentin Schulz wrote:
>>> blocklist has a more obvious meaning than blacklist and is also not
>>> an
>>> issue wrt inclusivity, so let's use that naming instead.
>>
>> A "blocklist" with a filesystem is unfortunately confusing (a list of
>> block
>> numbers on the filesystem?). "ignorelist" or even "ignore-devices"
>> may be
>> better? (or skip)
> 
> I offer "denylist".
> 
I have recently added a list of patches and files that have problematic 
language to the Inclusive Language Wiki [0], this is one of them, I had 
proposed mount.disallow

So we can see that everyone has a different idea.  Once we have an 
approved rename, we can revisit this patch.

Thanks

Sau!

[0] https://wiki.yoctoproject.org/wiki/Inclusive_language#Patch_Files


> Cheers,
> Eero
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159353): https://lists.openembedded.org/g/openembedded-core/message/159353
> Mute This Topic: https://lists.openembedded.org/mt/87542276/4950653
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Saul.Wold@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Sau!

