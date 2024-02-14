Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF920C4829A
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 01:07:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31575.1707872862059116633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 17:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MmcXXCw4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2774398e6c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41DNVR9x006942
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 01:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:from:to:cc:references
	:in-reply-to:mime-version; s=PPS06212021; bh=1tsbsAmlRJuxgdgF4hz
	omSRtmF7qsRgrho9PfPEhxsI=; b=MmcXXCw4N2EikFVfeFp6jXAdyl1C1zXHSak
	X71Lw9skK2D+KBubyrCjGsX1k1CflNPWD0OxAjfRoBJLQ4vTWWs/zSjRA5mjOr6z
	u9Zd6GYfgjZsfTzLJ8eP1fjQDtK092X3Fzm6YsSvVLj8rpbbziiGGXtLmaLEGBD4
	gAEIlWuphWL6S/aBkpsnCFAgtyNyHJvaf9TtJdfJNxjiIgLI6VTptjTlH/K94hlq
	qH/Q6x+kFcF+3nZZqtBEzQZtyDanoSoUMFRIOQEr16/Ngu5LxVj6vvp4wxszT3jO
	UnFFVH6Hw8QzAOrDFHIHXkZ/Hiy4QxsJbpWMJ3nHtBLDTwzZF+w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxubr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 01:07:41 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41E15k4N004629
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 01:07:40 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxubqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 01:07:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URwKmMNhb7otEZkpVqM8ErgcTzbZe2mmem+z4te5DCXMzzze2kDvJU9xFjFfYSUcayGHfqWb2lO9PGmauSc47e0H735NToDUG3CfUbT/lfh91AMuWZHDUVQlKNkBP29fJClNTyr8IvVfGIhr/U41kmHgdbSP3JeFMLeRlV72QmyqdHR/a4EGVIqOa7KOK9cz/NT781bVo+QqY5TVBnSK0jeqDit/1CN7DknAyOTm34MfEdWe3ceoP1dAqqcvc9y/cXxgfiR1vuIwOzFI+LcqYrqfp16Qkun00uePWBAPMUuMQG2QQ9TBBmIbNyDAhpfRgg5eX0Xlsh847RSml5gl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tsbsAmlRJuxgdgF4hzomSRtmF7qsRgrho9PfPEhxsI=;
 b=kknseeDsmdW6YH/CLNFgutLrvtRp1hmZUTXkjulCUx5Fr1UYxhtX6ZkwYBq4+KosrJop8etlq2gFj6CafCmDwQy7wxgPhPWMh9BTaVaeZ1HNSGxnLe1t6OT4PDdr9cUKngGcRRFopwGD50QTfs8vS4dFzQnn2wnLDJT2EbeyMtJhg98NMZDg/vyolFSRbhPdspZ16d9UaI/Crqeko3gQtzrPp5emhrSarTPchj2Bb2tno0XSJISKUNbEUl7OLfDGbAJOkKuTItHEhSumqSS3AagPcxD5KmQbF9dayG5oKyCf4Rig6xs0Me2gz2U6JGO0/nRGk1zS6gR1MIE3kybgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Wed, 14 Feb
 2024 01:07:37 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 01:07:37 +0000
Content-Type: multipart/alternative;
 boundary="------------zvvzguiMcfuaKKygfnrhi8xI"
Message-ID: <2f1f7635-8a23-4ba2-9016-8ca2bd9f47d8@windriver.com>
Date: Tue, 13 Feb 2024 20:07:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] valgrind: update from 3.21.0 to 3.22.0
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: Khem Raj <raj.khem@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240212220501.3571864-1-Randy.MacLeod@windriver.com>
 <20240212220501.3571864-2-Randy.MacLeod@windriver.com>
 <CAMKF1srXDihZLKoPUtAq1uGwiOftJR=yZGfYSGKZ3dLRS7Ct-g@mail.gmail.com>
 <4e88b287-fecd-4ea8-8d91-189b64c49a68@windriver.com>
In-Reply-To: <4e88b287-fecd-4ea8-8d91-189b64c49a68@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::28) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|DS0PR11MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: a73ba851-741d-40ba-8fb6-08dc2cf9558d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gkqHhqJ8YvVIzgG/dWSsRKiWrcwHKchjPn7ONGtyXNTpHHn5eVT/4Wj2G36rK4Rh0Df20dvVad/x2N7Hzud1MI5UpwjmQSaSwVAjdvthA1mq8BWW0pD8G7YmpzyTPktCeg9nY9pfuIEw+I2+rB1e5wfa+Y2llAFn+g/fDfVG4HdI6zCSpJlgAQ1p+Pai7m5tI0KTFzNBMNYwn62AbtXu5u3LJ2axugStclYwXEOynzqmK5Ptm50S2OHXIWrj5i1RdYzmV6PGfXiQ4QvGJgQNPiX2M/Jxx7Do5KuQb5vjzHw5a1z9C5XHp5Wzz7vzz7CsRwpTheqxCcRqPPaDsNZfSA2egPUgq/yAim8++CRzDxUCJcEmIshZ1EvscDsjoDxYCmY0F1TWwZ6wtxZTv9Bz5ACGac/GIESjiIHXJ9xKlrbG9wY4t7NWeBf+PPnP0zF3IzvG9he4QzQ0dabXW2bW+1t2S6uOBRQYpohk+AubIPXqiScyZu0CE6t/dCbzdykdpTg/6qMQLfm+GH1hz0bKUJJ51/luAnC3aIIlFkYie+DMfkw5mj8kEP2+LEl+iMJV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(346002)(396003)(376002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(38100700002)(5660300002)(31696002)(86362001)(6512007)(33964004)(53546011)(2616005)(26005)(6506007)(8676002)(8936002)(36756003)(110136005)(478600001)(4326008)(66556008)(66946007)(6486002)(66476007)(316002)(31686004)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGVmZzFhaHY0OVNqTkxlWFpiWkEyeWJOcUlaK1VQRldTL1Vyd2s0cEdqdGQy?=
 =?utf-8?B?UTdyMjNQL29oc0kyaHR6OEwzaXBMV0ZSY2ViUmJiN0F1amVUQTI1QjVJOVRh?=
 =?utf-8?B?TEo1K3BVWDRLOGNhSWJ3aWY4OW9pZ1N6eXZqUUVSa2dNalVONDFkL25sZWY4?=
 =?utf-8?B?RzJnSkd1eE5LdXRkZnZ2S3N2dCtzUXBjQVpqMmhibk42eVljRjlQR1hTZ0hK?=
 =?utf-8?B?RDVhUU5Oa25RL2F6dUF1ZkRrNElyZU55K0pXQzhUVi9VbDFzKzJ1VG5Wc2JS?=
 =?utf-8?B?aC96d0JQb3R6ajJ2clo3RU5JLzVkU2VSaUNRdFNmb3FjZkxYMDUzdG40dGE2?=
 =?utf-8?B?YkV5Qkk5ZmFGNlM5UVFXbVVyd1pacEFjVnZKV3BvMm91SUt6NnVPUWtXbWFk?=
 =?utf-8?B?MVR0eXkyemNwYzZjcG1nb29iODB6ZHNud3RVS3ZnRzV6YTRiWDJuYkJWMXRU?=
 =?utf-8?B?blRZcmRpVlUvUmE4c1cvY3o3cHBaWDhlYUZERGREM1AxRzIrRm4yYWdZdWts?=
 =?utf-8?B?QXNQc2U0cFA2ektZRHFnS1FuSlBaYjlueHN5NkJRVXlIOEdTYXphQWNhbGEv?=
 =?utf-8?B?Smoyd3A1UWFEdnZqTm1iQlVtbXQ3Si9WZDN2b3M2ZCtYblg2eFNNT3h6azFy?=
 =?utf-8?B?dWhIeWs5aGZuL0xXbjdjV1dQQjcwZXRIUTZNc0RyVTlrdzNKRXRYcG1QQis2?=
 =?utf-8?B?aTVvZVFRWElBVGc1YVVFVTl5bTFPclJyWWI3UGVDZVRmTlI0amREUDRZRERw?=
 =?utf-8?B?WlB0ME5Jd2dEQ3J3Rk1Gd1A4QkhXNU0wcGh3UDNieWdWNGRneU5Tc2R3ZXRl?=
 =?utf-8?B?Y3Bnd1JXbEVkNWQ1Vkh3OWtwYTF0NFlDQnZIOW1tN09YNkYzU05KV0VHd0VX?=
 =?utf-8?B?L3JUaldGaVVpMWg4VngxQkJ0VHVrdDdqRWYwVkozT2tEaHhTSEpkUTY2MWZx?=
 =?utf-8?B?ZFg4bGxqNUdKdzZOOUF1YWpPOWtkNndBS0pZY0tFbGRrcTFQaDFGZWx3NmFt?=
 =?utf-8?B?a2ZaSjJWWlpXWUs3VEQ1bDdFWEs3TDdjMHhwR2dyQ2JWUk1qblRpYnNxQjRa?=
 =?utf-8?B?Y3A1MjVpL2FHV1VhRWYrVmlibXR0ZWlVYmQ5TndJOC8rYTdzSTBTZFZzSll4?=
 =?utf-8?B?c3RmSCtjb3F3alozenBjdW9zMVMyT1BrSDdmb0xvSVZGbjhwdGtTR2VsUnNZ?=
 =?utf-8?B?cGxOcUVtQXY4QWNDWlh3UzFCaThJd2Z3MDJDL1VRZHZhUWJ0Rkh2OVA4U0NB?=
 =?utf-8?B?blVCL3htR2dTSUhQYmZ2SXhCQ1UxbTZTMFVUZTNidDNOUHpBcENRU1l0K0JI?=
 =?utf-8?B?eWs2eUJUVUtmYm5pSitnMmVhOUFtTWhsMnZqczlWYThtdjdNd0tRVmsxOUp1?=
 =?utf-8?B?WGVFQi85K1hkdE5jR0pEM2sxaXpRcURZTDFSQ3l1b2FlZTNlNzRacThBMGla?=
 =?utf-8?B?bHlkVmFMbElFN0VQTjFZdjBBSUk1emROZFhkQWtITkpBUjhZbmtyRjdYenNr?=
 =?utf-8?B?blBVV3BocU1URi94K0F3ZWRnRURCR3dWQ0RXSzNQL2hxSTVVWUcwUnB2WkF2?=
 =?utf-8?B?YVRzSEdxT3MwdHFUVjUzb29uVFNXcFA5SWROMnFhT1FIWjBhaTZXY1EwYzdY?=
 =?utf-8?B?WVlVOGVlMTFyclk1aGVjMHQrZE85SDkzK0pEVjRBR3FFYXZCVjhvZGQ3Y1lE?=
 =?utf-8?B?RE5rVzFyME5xNWEzNzZsY0hOWTJDcDZxaVF6ZjlpNFU5L0Y2bktFY0dYb2Fl?=
 =?utf-8?B?VjdHdlAyeC8wMEdEalc1K29WbkVERzFnbHhvRTZTL1JjZzhtYWxkaGJFMDJn?=
 =?utf-8?B?aWRneklmdEs1bXRWNEVNQVZXMkxONzA1Nk5JNEhza1VZbG1hYXVWZWQ4T1V0?=
 =?utf-8?B?Y0dKU3pIZjNnSEwybWYvbDdDYmxNTlBRTVZ3RGdWSGpoRjIxa1pCZHhlOWds?=
 =?utf-8?B?OHRoZ2ZZa0dkVWtPM3ZjMkhKMnlkS2V0UE9saEpFM0JkQUFhcjhkU0lxS2k0?=
 =?utf-8?B?ODRUempENXpzQTdEYXp2czFmWmxZWFNKMFRIZG5yeElLOWQ2QlNkMElYWVBt?=
 =?utf-8?B?Rm0zMmgrOXQ4ZU9SN1VDVVlqNEFhd2pTZXR0YnFsazRBVC9QZ0NlMFY0SXlN?=
 =?utf-8?B?V3NERXZhMmdKL1c1aElaREVHb1pLTG9zNEUrVmFqQUl1TEJ5ZUNNWXAycHZY?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73ba851-741d-40ba-8fb6-08dc2cf9558d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 01:07:37.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2ohEd3J0vqSkBBk4LT4apab8sqYe+VlcwksWvEdzumHYUQcu/U4FgRS9IhjgfRxmFPUXM05E8H2A88R936VaEFAta6tyqnKdPHQ5RrsoCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7630
X-Proofpoint-ORIG-GUID: NylMK2kX923Xc158t9CZXnTa4LoUPj3P
X-Proofpoint-GUID: dGA3ogpIJb1aq2QoaT65zfAdMyycdsl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=865 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 01:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195449

--------------zvvzguiMcfuaKKygfnrhi8xI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41DNVR9x006942

On 2024-02-13 7:23 p.m., Randy MacLeod wrote:
>
> runqemu kvm nographic qemuparams=3D"-m 1024"
>
> # ptest-runner valgrind=C2=A0 | tee vg.log
>
> I get the valgrind ptest logs (1), but the ptests terminate before=20
> completion
> with errors along the way.
>
> I'll try again with more memory but there was no evidence of the OOM=20
> killer.
>
> ../Randy
>
FYI: Same error with: -m 2048.

--=20
# Randy MacLeod
# Wind River Linux

--------------zvvzguiMcfuaKKygfnrhi8xI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-02-13 7:23 p.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4e88b287-fecd-4ea8-8d91-189b64c49a68@windriver.com">
      <p>runqemu kvm nographic qemuparams=&quot;-m 1024&quot;</p>
      <p># ptest-runner valgrind&nbsp; | tee vg.log<br>
      </p>
      <p>I get the valgrind ptest logs (1), but the ptests terminate
        before completion<br>
        with errors along the way.</p>
      <p>I'll try again with more memory but there was no evidence of
        the OOM killer.</p>
      <p>../Randy</p>
    </blockquote>
    <p>FYI: Same error with: -m 2048.<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------zvvzguiMcfuaKKygfnrhi8xI--

