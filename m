Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A765CC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:59:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3905.1637787581840327162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=isiurPxK;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6962479c96=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AOKp7kB001473
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : cc : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HDV+e1WSDuKiyFlCkSwTUHcqvaUjrT2yLVqkmq0r2lU=;
 b=isiurPxKq8UB0TueoV3LFW3ET5Yr9mhNfrnPMwVpyl16Q6AerpZpgV6+PhUHsCO4asra
 AU+BBx+MKqmjNDZ/mwMSx/s35gBHlleL5Shi2pClDeSH8FOiwWPgtSUBi1/5ky8DROuT
 Nq9OoP7DvD3VXXxxoSr97dULnp35A69Zj5Fdo37XGoihg0XSZffV9ukOJN2g2zbZdeRL
 I0wHHSZlk8TsU4xlKkZFUWNt/SkKLbra0L6lh/yUAdmFdVnmIPT/dXf5MwmV3pueL9zo
 Y2tYIf7KTm65oRKuG3P0JR9zlfcrJ5AHILV5RspQRfPtb5U+q6tTq4mKhlY6pTIi9bey eA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chce58s5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 20:59:40 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AOKxerP019337
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:59:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chce58s5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Nov 2021 20:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcJxODABPoanTaY9SPYi2DUFmY4SJ82EUnJLDX6CjmpbimZGq5PHB9e9Tw++BLa+xTMC9bZoChVgPPp/Y2kQ2B+jS65zYXvMDM+C+/loGM9X19MrT+8pGaDrMTPh+ZtgEOvT8Om/ZTyBjakNSo8rx2DNZpok78vmNv9NqnVGIJpMe1Fg7YzAGpDoHwyOBIiVeYJnJOKeRU8zGqoHB5AluD+9VqA6oroyiKCt+zH9q8E0PFged+wkzMMameDVIIVWtMYavl77Uk6p/8tRiVlLX5GGTi9jHYxSOPSygesYuITR6J9zZ9lDClGx0FgLMzQj4YsB/MkXjhOxQ2rQyYk/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDV+e1WSDuKiyFlCkSwTUHcqvaUjrT2yLVqkmq0r2lU=;
 b=lfS8zotxoxXV6ZZN4rgWXKUo6ELbn9BFAelq/c38kh6636VvL5p6EYRuoRQeHIeuRbfy7bsx3hvYh68OuS4OCOqSWKKetXfjfhuYWxqwdOJmccX+hhEwNfTaEJvEzwtSXtdAGMv+Y3sce6EZqshK7n20n0t2GgTlwS//MpaHs8/rnRdlA/SdhZr4QiGzvHrim2VSRL3cYsZT25PMIdfx+dyfeO6wA9Yr+DJHbKGvpXJyaNOS41Cn9bfCPdBpq/Oboln9XQIh3RlxiEKCn9KgXDyXt1KeSd3+sEnxMTsWQslo0zi//DizCKaP00WyPQyTeB99kZuBwQCkkBmsrU5gvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Wed, 24 Nov
 2021 20:59:38 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f1b5:133d:c04b:46a3]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f1b5:133d:c04b:46a3%4]) with mapi id 15.20.4690.027; Wed, 24 Nov 2021
 20:59:38 +0000
Subject: Re: [OE-core] rust in SDK
To: Khem Raj <raj.khem@gmail.com>, Peter Bergin <peter@berginkonsult.se>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Anatol Belski <anbelski@linux.microsoft.com>
References: <b92810a3-656a-8ad2-a8d9-960ec64cc616@berginkonsult.se>
 <fbd5e08f-dc57-f796-d4ec-072b457873e3@gmail.com>
Cc: "Gowda, Naveen" <naveen.gowda@windriver.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        "Orling, Timothy T" <timothy.t.orling@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b01f7d6d-95f3-9c44-b3e8-9f87c0978401@windriver.com>
Date: Wed, 24 Nov 2021 15:59:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <fbd5e08f-dc57-f796-d4ec-072b457873e3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 20:59:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abfaad92-4ec8-4a9f-65f8-08d9af8d539f
X-MS-TrafficTypeDiagnostic: DM6PR11MB4721:
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-Microsoft-Antispam-PRVS: 
 <DM6PR11MB472196B31AA4A8F7B7938636F8619@DM6PR11MB4721.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 25JhSBUkQYi9GENbUSCDqvom9qe/4QYUBStRZHnDWOczNpsVOgBrsFj03Gt1qVHkc/5BC4P2c8xsphdKxbugXVW8SwjEUikzk6nC4HT+IF3fB3DX7EXPi8Or+O+BqFcKNGSK6ZBzT7Pc84K2fumdwb24pEBlBgS4XPKtntAYtFGWhp9Dh6mQ0j4uR0T/G3BFld46Ez2XM+d8pfy87uuaQcvDIRf8eN/aKXSXnpqQujC+pzgDf4n9Mdqs4rX88Qplo/wLQxgcxmZPl//CEuUr9UQaiizUNRK3YFPb9R4/CVA75pl+cg/lHB/4szqhgzk7+rHIRb7UYchdt5GHbayWcjZZHY/7VU2c6lNGPgXSXB6L+0dnZ+WfSqPg5Bqpy87G0j8txjtLvU3HVJ0zqc2lrlyofugMHzKXjK+BAT7YnWqkJC34HLixtNiLLDI7q4CObqYg3HN6715h0sOe97a9EjWwyh7MElJriurqtGKncWL0uSz7xHN3mNRWBR5ZGw3fa7vqta3kqdn4soVrXJbNuxuLLg1M8fk84lILODOVA/2R2QbFRL6jdqnKTR2hqMf7eK8mooPc9aBNnCQS4fVnQNIEQvBUdlDZbDnT3sxvOxLAhbW9s2LI5w2lWwRwf/OHf81VclcJnJ7CnP1GIk6b+vKcEYk0vGft9N/7P8dk4mv5a/5dV8HKCLw1kRx0Q5dlhGgWBpCESlhndpYTGFSCJdSz/KTCpUBUvXxSqW5VJIkjtdiB1i4GyT4S6zFTh4NMJAFqPuyWKhAMnLEJphN+7A+unsNu2Nps2WGVPfvTBPjtGbUO+DCBaOMZwg4Z4X1KDAu+gBBOXWA4RYOygfV76s6liJ1t2spvc3p5bqx4U5s=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(54906003)(186003)(8936002)(66476007)(66946007)(4001150100001)(53546011)(966005)(5660300002)(16576012)(6486002)(52116002)(66556008)(8676002)(6666004)(26005)(110136005)(38100700002)(508600001)(38350700002)(86362001)(2616005)(956004)(4326008)(2906002)(31696002)(31686004)(316002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?a1JtYjRxdVBxRWNXSnc5WHBmSlRnTjRYT2NaN1laMkRlSGJ5UDI3WHBLZnBN?=
 =?utf-8?B?cnpaMWJPd1I5akZ6OC9QZHFLOTZYeWx3MkFlM3psMWIxVHlXVHJ1YUh6Wk1W?=
 =?utf-8?B?Z0RLNmY5L1ZOdnJSaFBRMGxRQXZQWTh0TFZYT3NiejlydHcrRFVpb2NpSk9H?=
 =?utf-8?B?TEl5ajB3TFZlSi9hMFg1NWpydXgzU05iKy8wM3JxWE1EbElZWFY3WXUrU1Vw?=
 =?utf-8?B?VlVPcHVCaCthMm5JR25HdTJMVFZ1VUZCZ3BLUE9lSEwxaGhCSm4xRmwvK0Fy?=
 =?utf-8?B?WGNaY1Y2WUJ3OThuNnBQZzQvWSttampzZjlsQXFNL0xRNjFVdVRnVVo5Z2Iy?=
 =?utf-8?B?STkxeklESjVJdWRYN3JWUDBBdXVaVWt5SVAyYkxwMldUb3AwVUJpUkp5aFZP?=
 =?utf-8?B?bFlTOXlKZjhoREVBMDhKM29QM2J6Zmt3bnZ4RThkUms3V3hPZkVOM3NNOWJp?=
 =?utf-8?B?OUJNdElKUy9oYUdjU25jMjRXM1dhZEJVd0FTVUFDTlFCSGVLdkxXS0x0YjJJ?=
 =?utf-8?B?VEhhaGRaWFhyRkcrcXMyTFIwZzNrZVkxOG12S2NvNzcwMTJkVHduRzZUUk4z?=
 =?utf-8?B?QU52cXkwZzBHOTN6Q3Z5NXZlVzFLUUYwZHVsWjNnWENQclI5b0d0ZWU2OFZn?=
 =?utf-8?B?RkNXdDFQeU9HcEs5M0sxa1dqM25Na0YzVEpNcUk4alJGbzRPdjI4bFg1SVJj?=
 =?utf-8?B?YzVRZElZdVE4L0pkWnpTbXk2Zk1QOVV5NzZMUnliOHZxMWkyQUpkbEhFRlhW?=
 =?utf-8?B?TWwwbjZTYzNpSFVocFVIb0NpOVlQc3BWLy96VVpUWks5Uk4vU2ZGMUJDZ2J6?=
 =?utf-8?B?TUpFc3dTa3MyRFFvSW9Db01vVy9hTzdZSTdwaGdNR29kK2Rqd1o2aTNlK2gx?=
 =?utf-8?B?ODhGMjVoRXc1WERPOEM2a3VyT3lqeEZxSEJTMWpMem56akplNjU0SU9HbkNt?=
 =?utf-8?B?czVpN2ROZGl1SFM2SE5EWTZqMXVtaGhIcGwxVXg5U0I3ZlhEM0REcDFNWkFX?=
 =?utf-8?B?bTFIRDlNcVR1U2xjVjdnQk9lcUh5MVdBODRHT2gwY2JNSHlvQ1IyZlJjenJ2?=
 =?utf-8?B?OWVIWW14ZWtxU2VCSURBMFp2S1pHdEcxS2ZnNFlhYldtSWgzaUI0NFBzY25V?=
 =?utf-8?B?dmloR2I0SG5QaG1SK2xmSUVvNDZPemtycTRPN2d6TUxXTXdZSlJlVVZLOG5U?=
 =?utf-8?B?RENUWS90THZhN1J3TWIrS1FSZU1OVHhOZml3VkZ5VFVNemdRQndzbDNKMzBx?=
 =?utf-8?B?RXRrblRrT1dVMW9rT0tYK2d5WkV6ckdSZElqbVBjWVEwS04zcmRMcmpIK1VY?=
 =?utf-8?B?WnlkTnhmNGYwV1JFVXd5WlY5Nk9lWUd2NEFHd3VSb0d6Q2pDM05pK0tWS0N3?=
 =?utf-8?B?ZU1NN0ZSanRGQ1A4NW9BZitYVGtaVDAwNHBEOWNKZmdvY0FvOEtQTzdKdm9B?=
 =?utf-8?B?all2ZkV6Rzk4UDRNUHp3UFhuaWo1enhNMmdOVWkwaUI0N2g5NlB4bnFyeEF6?=
 =?utf-8?B?SUc3Qyt0ZUNsWThGK2tRZnFUYUI4UEZ1MVRhRTdWekVQc2plRW9yTlJEM3ZG?=
 =?utf-8?B?bFREZFdnNVByVEFxSGVrYUErNWVNd0ZEb0ozNkNXdWtYcUh6Z21oMTdmUWNG?=
 =?utf-8?B?eCtNWEo0OWphUjRIOHNEYjlBNytVenpZNFJ3U2oxeDhzSG1DVFBpZGlSYkU1?=
 =?utf-8?B?SkExbEJ6NnE0STlpTXhDKzlVVXNrMUlXNTFraUZ2OWdBdzFXMUtPT29GdS9U?=
 =?utf-8?B?NlZLaDFtVS9FZjI3d1ZJeHVsSGxyQ2pFNUhGWHYwVzhNc01rcEIyWmtHODFn?=
 =?utf-8?B?bUhJOGVhN1dDVHhDR0ZFR1FYSG1TY21LalpkSEREa2lVdXRBWUd4ZHptRzRL?=
 =?utf-8?B?NmtaR1VTRE9wb0lZQTR5Rjh5bmhYM2p2R0hKdE5TYStRVi8xOFh5MXZkMGZk?=
 =?utf-8?B?c0FXb0FGeTF2T20wdUljUnEzVGdxYkNteTcxSzhFQ09EV1o0K2lUVkhKaHgx?=
 =?utf-8?B?aG1aUHlySnlYdzY0d0VwNk50V0E3TWxIVnVFSWxZU0FkZ1Jaa0F5NkprOW9h?=
 =?utf-8?B?bFpReUVkUUJ2Q1hQSEdFRGhscUtmU0JjbnVYOTNuV0hqM1dHY3d0TkFPaHFL?=
 =?utf-8?B?K3V3Si9WR0prL29kVFh3dng4MHJzcnpsbnVHRXJDbU5PdVVWVXhVMHljb0xH?=
 =?utf-8?B?Ync0UmFuZkp0cXBPdVZ2VTArR1VUVnVhQmNFbnRVRjdEZEU3R1NaU24rM1Iv?=
 =?utf-8?Q?uMrDHTZ6NZ6jfa+PPzakeA/ALdReOTgzQxo1L811eY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 abfaad92-4ec8-4a9f-65f8-08d9af8d539f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 20:59:37.9549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qZMYS6Cs/XojfmvqNpOhxKzOKiBnc5L0Rh6emTUSWI/QyrHEkAfVux2ckRw9hzlGc2DBsPgfCnfZUKE4GwM/B19O42qRTrT6IGBEnF7GnBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
X-Proofpoint-GUID: Q3jHciJoF3eLpgkAig9zz0lFDCvIRZRx
X-Proofpoint-ORIG-GUID: iyqA7mkl85YIw4fM6eW-CBDDDK_fT-He
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=913 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:59:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158744

On 2021-11-24 3:14 p.m., Khem Raj wrote:
> 
> 
> On 11/23/21 11:59 PM, Peter Bergin wrote:
>> Hi,
>>
>> I'm looking for information about how mature and tested it is to have 
>> rust tools in the SDK. In README-rust.md [1] there is a phrase "Once 
>> the Rust SDK support is added to oe-core..." which can be read that it 
>> is not ready yet. In the first bullet "What works:" it states 
>> "-buildsdk and -crosssdk" which I can't connect to oe-core terms.
>>
>> I have suceeded to add rust tools to a SDK by adding 
>> 'TOOLCHAIN_HOST_TASK:append = " 
>> packagegroup-rust-cross-canadian-${MACHINE}"' to my config. With this 
>> I have succeeded to cross-compile the simplest hello-world example for 
>> aarch64. Is this the way to go or is there work to do (reffering to 
>> README info)?
>>
>> Any information around rust and the status in oe-core are appreciated.
>>
> 
> SDK usecase would partially work but the relocatable part might have 
> issues since we have hacks to expand on install paths at SDK install 
> time which may not work out of box for rust compiler tools.


Hi Peter,

The core rust/cargo toolchain works well. we're using it for librsvg
and in meta-oe, mozjs-91 and likely other places. I think Tim has work
underway (that I'm going to one day help with !! ) to uprev 
python-cryptography [1].

I *still* haven't personally tested the SDK workflow so you're comments 
on that are
appreciated. Back in Feb/2021 [2], Anatol was working with the SDK so 
perhaps
he will have something to say about the current state of affairs.

Naveen has and is working through a several bugs so if you find 
something, please
report it in the YP bugzilla: https://bugzilla.yoctoproject.org/

../Randy


[1] 
https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-cryptography_35.0.0


[2] 
https://lists.openembedded.org/g/openembedded-core/message/148546?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2C%2522Current+native+SDK+glibc+compat%2522%2C20%2C1%2C0%2C80874524 


> 
>> Thanks,
>> /Peter
>>
>>
>>
>>
>>
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158740): https://lists.openembedded.org/g/openembedded-core/message/158740
> Mute This Topic: https://lists.openembedded.org/mt/87277113/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


