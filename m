Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C95BC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 22:18:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9281.1700259490776236636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 14:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=EuKz4JvX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96858e386d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AHMA1QM024250
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 22:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from:cc
	:in-reply-to:mime-version; s=PPS06212021; bh=z7TjJ/8TA8ifdU29PVs
	b2O2QDUw/2apla81CxL1R+Wc=; b=EuKz4JvXYyN7gdue3iCfDIM0oa2OAgFruwr
	qddD4NHUYF+nVp03cTGzbrDRRIvVT6XUQdCLCgGtTrIlLpu80POBCchZmGGz92LX
	jQME0/v65abcvPh1lXoM4sRbkOXcOunu1ZQlXG8+A0cjClG87+sVN3JfvrIRigD9
	b1auPfNBzHyypYXaQe/Dc4qUM0l4PZg/Pk0vih5MUqT6Ci89JxkXaXcOCb9NxEI/
	ILAFCY4HeEItTf6eM4HA56JYJmhuCJkmRzoeLx2R5nhOocraMYglCwLZ7AxDQ0su
	Lj0azCaXTqX2BznAo2dYV6cbx/6PVN7j3szWi2wk2Y+Gw3RwqtQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udy8c8uqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 22:18:09 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AHMI3Oj005929
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 22:18:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udy8c8uqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 22:18:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mADrdBFsuVKVyikh90Q7hFoUfX40wfGdVDl/j0FM1+n0zjCeb6dBEOLKuP3y4odbanH6GBSGN5s33sJJkvyO64WVBA9Cf2TaZJmAUZwSnMm64E59RPsJkQLF7putbuaCjKnQI8/Zt6Hy/mkrpBf7BVeifrJtq8Evi1wJ3snh605Jsogc1MU1WEzYZ8IaIzDquaWRK6RzOYy2P3gp6i1vovsyrbqsvkqymqchNR/m+H9dcRumFw7AxGF67LjL70jNrdxs/LuI6sUSoxJWbkG5KvhePdrbEdWRBhcsKmhZeapzMPW6e1TtBQAq1BdTL7eBvxdP1GZ2Xl2UmAcELzox5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7TjJ/8TA8ifdU29PVsb2O2QDUw/2apla81CxL1R+Wc=;
 b=SVpmlojn16iAhzwUHxcRIyee8tj5FHjqa3qQ8DYDtJE9TaUifg0nRCIbeHVT0cnLmKP951MVAqRh13ZvjTJ8YljDXe+cHP4LVbJVPUCaczxnyQxuA8SNM9+uaRWXjiXJQRekHHNqiyzeiOVkCGMkohE/w4GvZxrPlaUzHso8v5XlA3wYW/2+iWI74r3pUq+awoXI9LlanCjMi4IxfGV6I1JieQJicb0kRyLuBdA68eugTdmS0DjZE9N9Zgh14ZbcABipimf7wsIMb3U5EL80k1NwzakFjPw2n4FjHF+aNHJwWreWTTYsYM4gmZmQ9a4raF5Y7uV8a/D3valQrrofHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 22:18:04 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d821:a486:84ed:e64a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d821:a486:84ed:e64a%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 22:18:04 +0000
Content-Type: multipart/alternative;
 boundary="------------akGPPlPbhe43UgKFKL53QMBa"
Message-ID: <bc68d35c-f7b1-4f1d-ae1d-4c8f9a153079@windriver.com>
Date: Fri, 17 Nov 2023 17:18:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 1/5] classes: jobserver: support gnu make
 fifo jobserver
Content-Language: en-CA
To: martin@geanix.com
References: <20230828124834.376779-1-martin@geanix.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
In-Reply-To: <20230828124834.376779-1-martin@geanix.com>
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: d607c1e2-942b-4300-9716-08dbe7bb1177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OzVE6Tl3octBoE+cdjpC7V6+aCsNbc0Zi0y82g8DhQ0zVtvynvDOe+ZigWJKhrxA7auyA6Y2p6H6NdfFXl0A4PvhAq2x0fGY5KKtd8nvErCZaZM2/RNlgEDjSQ3r0gM/Nkxisuzxj+S+UD6f//7/TZSb3FOPg6Mto+i1kO4xzSjAGGXVIdJNfVETxN/dVqEJn/7EtNrTQoEs0TacwIe26Rg72EH8d5pUy23tw0c/A+m8mdfxONH5LLrv3LON9DlFy0/qo59s62PGGS7eoIDZMd/DxBwv14i6Ln0y6OZjOKQg1WHT8yAis0qW6xQ7Bih+6P0vGkGy8MJezGZZXE7GuulEkPlZGD31z1xT77GjNqASsfv7W6fVMadLrIvuZUAYtn2zuNyXb6vWmgf8MZOFhOcBfRiF2iYRfFlqBiAJiWK35D9Qxcm+kWN/oscvYOomMomE6dlss+xg2jnFpHje3A8C7z9qdb+12k74kOevo577CTtvGbHqoZGZWNuP4zouIsxGiSqIYgek93i+Y/atEMKU2FweUEvuW/SiwdANiUJwMYXfukCCM/p2AWwxAZLcQxGSRDMmJKDw2XZV2bXnyicozvKPVuzfLE0d12BL6mZGtaXpY/A7ksevPZ1Nj/cdi/5bDyhXXm1wnXv4Zb9A4p3mLOdwPIhret0GlpN8SCsUz1E6INJzK5RV+lzFwZmJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(366004)(136003)(346002)(396003)(230273577357003)(230922051799003)(230173577357003)(64100799003)(1800799009)(186009)(451199024)(33964004)(26005)(6506007)(4326008)(8676002)(5660300002)(8936002)(30864003)(2616005)(2906002)(66476007)(53546011)(6666004)(31696002)(86362001)(66556008)(66946007)(31686004)(66899024)(38100700002)(478600001)(6916009)(36756003)(6512007)(6486002)(966005)(316002)(166002)(66574015)(41300700001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0wrNTI1QUdkV2crbVFGR2tHOWYwa3lRck5HbitRMmxLQjBxRXNwYzRnSjk4?=
 =?utf-8?B?MWhvS3pmVzJLWk55OGI4dGk3T3M4a3F0S01DYXhtS1A2bTVWQXVRUDA5QitV?=
 =?utf-8?B?Z3MrcUNwRG0yR2RlVklJckVYOGNjYnZoRTJMWE1YNzNWQkp6dmdtSE0yR21z?=
 =?utf-8?B?cmttZFJzS1QzUG5sK0RuYjdPMFZMSUFEcVI4d05LVDBoTFZqWFN5QmU2RXhZ?=
 =?utf-8?B?QWZBamxXUGR6NkN3MTRqdVUwUzhPVFNGN21DY085MmRGbDQ4YXVncG94M3U2?=
 =?utf-8?B?enF5TGNxekVTZlk0cUdnLzNicEt5Wnk5RjdTeWJEdGY2SVlWQU5aWmI5UHow?=
 =?utf-8?B?cWR6KzVpMGVnSXRLVW5TUjhnUVhtWjZwUDdSRTNaTDUxbTVWS1pENmtOVERN?=
 =?utf-8?B?MWpEZ2VpTUxXOWJZek9rUVV6THRiSHZuVkRZWTVIbkVrYWg5eGJNa3lScm5E?=
 =?utf-8?B?anNwbWlheXFFZlhSTXVqQnR4VTNkbmJGSE41enRCSW4rQzNSQ2Z5SDZLa1BS?=
 =?utf-8?B?cXpSVExwQ3V6TWgyTzdmdllJYjM3TkZ5c3hUMlU3UVMwSmVQR201T3NYQ21T?=
 =?utf-8?B?UFZnbHkwWWZmYmdzTzhpQ3RQVk54QlV5bE9reXBCTGxLNGlCMUNzWWNucE1a?=
 =?utf-8?B?cUI1WTNnSWY4Y2xxUFdJUUpLU0YzaFh5bm9QWDlrWGpYOWhqZ2UvTVZHSzhO?=
 =?utf-8?B?b3FuYlhSbmZvZmsxaExpQUhaRmhzbnhibDNnOHI5SkNKM2VxZmFNajE3V3Iw?=
 =?utf-8?B?M25yV0tHckJNSDZhMmVYdmtHNmtRNkFjMHEyeWFhZmI0cmIvR01HTmgwUDJX?=
 =?utf-8?B?ck9PVU9hMmJIODhHdmM2aWUzVlUyZ3UyWEtsdEs5TGJ3MzZKbkk4aEpseURF?=
 =?utf-8?B?RmFsVGNDcXNJMTZsdVRJbUNTaldibXplSHI4c25KMVlDLzgwZUFTc21USWRL?=
 =?utf-8?B?V3NVUjhYZkNHWDN0UUwwWWtxK1Axd3grc0ZiWlJxb1UvQi9tenVnUlNoUjgw?=
 =?utf-8?B?NmNXTDF4WXk3L0dyZ0d4Z0JpVjA3Y1BHK1FpV3BUSnpWOXhCeGp1SVBKKzRn?=
 =?utf-8?B?RVlSY2JOSXI3c2sxMWIvNmdMaDFZa1EwOWNqWDhlVVI3OVlqd3hyZnlTYzJw?=
 =?utf-8?B?R3RKRWJpMkR3SGdiNTNIT3FqaWRpQTBmV05Md3hsQkFLSjJPM1VYSExXN0ZI?=
 =?utf-8?B?VFgwMVhZWHdnZ09pa2tTb0NQTm5ZcjNUL3BjM29pZ2VGMGRsQkVDWHduZ3pl?=
 =?utf-8?B?OWlrdHFjV3RXNHJBdDdzbnByYUNNK0ZVQm1UN3hUOTNKS1JvRlpZZ2tkemd3?=
 =?utf-8?B?R21EQ3J6WmszVFc4VytrUWRuSThYNk9ENkhvMmkwMnhHK3BDZDN5WWQvdysr?=
 =?utf-8?B?SmNsV0c3Ni9KN1MxMCtiZnJCOXNlUFRNWjNMVUtFWHpUOUV6cWQ4TURpdW1G?=
 =?utf-8?B?aUlGZG5KeGE2aWVKRUY5UXZ3eHpQY21MYmVNVVMxS1Q0L2lHZ09PUElqRmpJ?=
 =?utf-8?B?RUpmYWZoOXYvU1R5ZjhzdmVDMjY1VWtGaGwxOTROOFplV1hBbXQ2VzBMMkU1?=
 =?utf-8?B?cmE4VzF5eW1pa0RmV1ZKTmNEVFVNZHJDdXBKcmNjNGcxZVdoOTFJUGZ2ZUhp?=
 =?utf-8?B?Q1paeUtEZmR3MFA0dnFFMGhMbVZ3MHJnTWtKKzdHVFNIYXU0elZjV1VhWHYw?=
 =?utf-8?B?ZDVHdSs3STdZQU5WUG03VFl5MFozM0dLcDcvSEdmbXNzV09VQlRROWN1dlVG?=
 =?utf-8?B?MWU1RkpnNHh1LzRLN3MyVjNHQnNWZmpDamZNVTNzZnJTdjFCS2g0b0hUdXNB?=
 =?utf-8?B?TzFMa1hEdlJqRi9ENU9FR1draVJSVmpWd3BYM1FwSzRkenJvRGJjODNpSGQy?=
 =?utf-8?B?UVY5NXRwZWVaSjRVRUozRzlCUFRzdWhjVm9LdlhCd25ZZTEyd1JjeUVyVHBU?=
 =?utf-8?B?bTZBSEZRVXZ6cHNrWWQvQ3pPTVNLUVVLT2lEZ2JJNEpVZkprZGdYL0NNOVFx?=
 =?utf-8?B?MmI2Z3NRbFpzWVNMYUdhUzZEN0ZVUmUyL1c2aFhoSTJQcC9xd1JnTnJ6bjlZ?=
 =?utf-8?B?bTQwdXNkejNBMDdBY2xVV0J0WmZ5SGFxaElPN2FlL3J4Sm1aTWF6OG1hUTAy?=
 =?utf-8?B?U2NHUU9ZcnFGaGhIdnJWNHdlMWVnRllKMnZEdkl4aEJzRGFCZko5bGNnSGdv?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d607c1e2-942b-4300-9716-08dbe7bb1177
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 22:18:04.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igFU54O3U/MCYlVkPXCgqG4EvrSHMPu87waGgNPc5nAxq/emBUjMPQJDiY/0DBHpMtoNEgBt/aKUG+ia4lL1CGVXJp5SlZHl+99M3dw75Qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
X-Proofpoint-ORIG-GUID: c95fiCWrOsgSBN7bHLA6-ZrJ7NpckFnd
X-Proofpoint-GUID: U0mdTyPlVh0dVuoctx3wHWWxQsOKcpC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311170167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 22:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190861

--------------akGPPlPbhe43UgKFKL53QMBa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AHMA1QM024250

Hi Martin,

I tested this RFC series briefly when it was posted but then some things=20
came up and I haven't gotten back to it.

I was talking with Richard and he thought that his original poky-contrib=20
branch commit, which it seems this work is based,
had a list of things to fix before the jobserver could be merged. Can=20
you find and share that list here?

I may have time to do more testing but I think I had concluded that the=20
default settings:
 =C2=A0=C2=A0 INHERIT +=3D "jobserver"
didn't have any impact on build performance, as expected, I suppose.

What testing have you done so far?

../Randy


On 2023-08-28 8:48 a.m., Martin Hundeb?ll via lists.openembedded.org wrot=
e:
> Add a class to implement the gnu make fifo style jobserver. The class
> can be activated by symply adding an `INHERIT +=3D "jobserver"` to the
> local configuration.
>
> Furthermore, one can configure an external jobserver (i.e. a server
> shared between multiple builds), by configured the `JOBSERVER_FIFO`
> variable to point at an existing jobserver fifo.
>
> The jobserver class uses the fifo style jobserver, which doesn't requir=
e
> passing open file descriptors around. It does, however, require
> make-4.4, which isn't available in common distro yet. To work around
> this, the class make all recipes (except make and its dependencies
> itself) depend on `virtual/make-native`.
>
> Signed-off-by: Martin Hundeb=C3=B8ll<martin@geanix.com>
> ---
>   meta/classes-global/jobserver.bbclass | 80 ++++++++++++++++++++++++++=
+
>   meta/conf/bitbake.conf                |  2 +-
>   2 files changed, 81 insertions(+), 1 deletion(-)
>   create mode 100644 meta/classes-global/jobserver.bbclass
>
> diff --git a/meta/classes-global/jobserver.bbclass b/meta/classes-globa=
l/jobserver.bbclass
> new file mode 100644
> index 0000000000..c76909fe50
> --- /dev/null
> +++ b/meta/classes-global/jobserver.bbclass
> @@ -0,0 +1,80 @@
> +JOBSERVER_FIFO ?=3D ""
> +JOBSERVER_FIFO[doc] =3D "Path to external jobserver fifo to use instea=
d of creating a per-build server."
> +
> +addhandler jobserver_setup_fifo
> +jobserver_setup_fifo[eventmask] =3D "bb.event.ConfigParsed"
> +
> +python jobserver_setup_fifo() {
> +    # don't setup a per-build fifo, if an external one is configured
> +    if d.getVar("JOBSERVER_FIFO"):
> +        return
> +
> +    # don't use a job-server if no parallelism is configured
> +    jobs =3D oe.utils.parallel_make(d)
> +    if jobs in (None, 1):
> +        return
> +
> +    # reduce jobs by one as a token has implicitly been handed to the
> +    # process requesting tokens
> +    jobs -=3D 1
> +
> +    fifo =3D d.getVar("TMPDIR") + "/jobserver_fifo"
> +
> +    # and old fifo might be lingering; remove it
> +    if os.path.exists(fifo):
> +        os.remove(fifo)
> +
> +    # create a new fifo to use for communicating tokens
> +    os.mkfifo(fifo)
> +
> +    # fill the fifo with the number of tokens to hand out
> +    wfd =3D os.open(fifo, os.O_RDWR)
> +    written =3D os.write(wfd, b"+" * jobs)
> +    if written !=3D (jobs):
> +        bb.error("Failed to fil make fifo: {} !=3D {}".format(written,=
 jobs))
> +
> +    # configure the per-build fifo path to use
> +    d.setVar("JOBSERVER_FIFO", fifo)
> +}
> +
> +python () {
> +    # don't configure the fifo if none is defined
> +    fifo =3D d.getVar("JOBSERVER_FIFO")
> +    if not fifo:
> +        return
> +
> +    # avoid making make-native or its dependencies depend on make-nati=
ve itself
> +    if d.getVar("PN") in (
> +                "make-native",
> +                "libtool-native",
> +                "pkgconfig-native",
> +                "automake-native",
> +                "autoconf-native",
> +                "m4-native",
> +                "texinfo-dummy-native",
> +                "gettext-minimal-native",
> +                "quilt-native",
> +                "gnu-config-native",
> +            ):
> +        return
> +
> +    # don't make unwilling recipes depend on make-native
> +    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
> +        return
> +
> +    # make other recipes depend on make-native to make sure it is new =
enough to
> +    # support the --jobserver-auth=3Dfifo:<path> syntax (from make-4.4=
 and onwards)
> +    d.appendVar("DEPENDS", " virtual/make-native")
> +
> +    # disable the "-j <jobs>" flag, as that overrides the jobserver fi=
fo tokens
> +    d.setVar("PARALLEL_MAKE", "")
> +    d.setVar("PARALLEL_MAKEINST", "")
> +
> +    # set and export the jobserver in the environment
> +    d.appendVar("MAKEFLAGS", " --jobserver-auth=3Dfifo:" + fifo)
> +    d.setVarFlag("MAKEFLAGS", "export", "1")
> +
> +    # ignore the joberserver argument part of MAKEFLAGS in the hash, a=
s that
> +    # shouldn't change the build output
> +    d.appendVarFlag("MAKEFLAGS", "vardepvalueexclude", "| --jobserver-=
auth=3Dfifo:" + fifo)
> +}
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cf7ff3328c..8cf188270b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -946,7 +946,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD BB=
_TASKHASH BBPATH BBSERVER DL_DI
>       BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot =
DEPLOY_DIR \
>       SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
>       SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DI=
RECTORIES \
> -    OMP_NUM_THREADS BB_CURRENTTASK"
> +    OMP_NUM_THREADS BB_CURRENTTASK JOBSERVER_FIFO"
>   BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_=
PATHS BUILDHISTORY_DIR \
>       SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TA=
RGET_SYS"
>   BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME SS=
H_AGENT_PID \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186824):https://lists.openembedded.org/g/openembedd=
ed-core/message/186824
> Mute This Topic:https://lists.openembedded.org/mt/101009092/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------akGPPlPbhe43UgKFKL53QMBa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AHMA1QM024250

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Martin,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I tested this RFC series briefly when
      it was posted but then some things came up and I haven't gotten
      back to it.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I was talking with Richard and he
      thought that his original poky-contrib branch commit, which it
      seems this work is based, <br>
      had a list of things to fix before the jobserver could be merged.
      Can you find and share that list here?<br>
      <br>
      I may have time to do more testing but I think I had concluded
      that the default settings:</div>
    &nbsp;&nbsp; INHERIT +=3D &quot;jobserver&quot;<br>
    didn't have any impact on build performance, as expected, I suppose.<=
br>
    <br>
    <p>What testing have you done so far?</p>
    <p>../Randy<br>
    </p>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-08-28 8:48 a.m., Martin
      Hundeb?ll via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230828124834.376779-1-martin@=
geanix.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Add a class to implement the=
 gnu make fifo style jobserver. The class
can be activated by symply adding an `INHERIT +=3D &quot;jobserver&quot;`=
 to the
local configuration.

Furthermore, one can configure an external jobserver (i.e. a server
shared between multiple builds), by configured the `JOBSERVER_FIFO`
variable to point at an existing jobserver fifo.

The jobserver class uses the fifo style jobserver, which doesn't require
passing open file descriptors around. It does, however, require
make-4.4, which isn't available in common distro yet. To work around
this, the class make all recipes (except make and its dependencies
itself) depend on `virtual/make-native`.

Signed-off-by: Martin Hundeb=C3=B8ll <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:martin@geanix.com">&lt;martin@geanix.com&gt;</a>
---
 meta/classes-global/jobserver.bbclass | 80 +++++++++++++++++++++++++++
 meta/conf/bitbake.conf                |  2 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-global/jobserver.bbclass

diff --git a/meta/classes-global/jobserver.bbclass b/meta/classes-global/=
jobserver.bbclass
new file mode 100644
index 0000000000..c76909fe50
--- /dev/null
+++ b/meta/classes-global/jobserver.bbclass
@@ -0,0 +1,80 @@
+JOBSERVER_FIFO ?=3D &quot;&quot;
+JOBSERVER_FIFO[doc] =3D &quot;Path to external jobserver fifo to use ins=
tead of creating a per-build server.&quot;
+
+addhandler jobserver_setup_fifo
+jobserver_setup_fifo[eventmask] =3D &quot;bb.event.ConfigParsed&quot;
+
+python jobserver_setup_fifo() {
+    # don't setup a per-build fifo, if an external one is configured
+    if d.getVar(&quot;JOBSERVER_FIFO&quot;):
+        return
+
+    # don't use a job-server if no parallelism is configured
+    jobs =3D oe.utils.parallel_make(d)
+    if jobs in (None, 1):
+        return
+
+    # reduce jobs by one as a token has implicitly been handed to the
+    # process requesting tokens
+    jobs -=3D 1
+
+    fifo =3D d.getVar(&quot;TMPDIR&quot;) + &quot;/jobserver_fifo&quot;
+
+    # and old fifo might be lingering; remove it
+    if os.path.exists(fifo):
+        os.remove(fifo)
+
+    # create a new fifo to use for communicating tokens
+    os.mkfifo(fifo)
+
+    # fill the fifo with the number of tokens to hand out
+    wfd =3D os.open(fifo, os.O_RDWR)
+    written =3D os.write(wfd, b&quot;+&quot; * jobs)
+    if written !=3D (jobs):
+        bb.error(&quot;Failed to fil make fifo: {} !=3D {}&quot;.format(=
written, jobs))
+
+    # configure the per-build fifo path to use
+    d.setVar(&quot;JOBSERVER_FIFO&quot;, fifo)
+}
+
+python () {
+    # don't configure the fifo if none is defined
+    fifo =3D d.getVar(&quot;JOBSERVER_FIFO&quot;)
+    if not fifo:
+        return
+
+    # avoid making make-native or its dependencies depend on make-native=
 itself
+    if d.getVar(&quot;PN&quot;) in (
+                &quot;make-native&quot;,
+                &quot;libtool-native&quot;,
+                &quot;pkgconfig-native&quot;,
+                &quot;automake-native&quot;,
+                &quot;autoconf-native&quot;,
+                &quot;m4-native&quot;,
+                &quot;texinfo-dummy-native&quot;,
+                &quot;gettext-minimal-native&quot;,
+                &quot;quilt-native&quot;,
+                &quot;gnu-config-native&quot;,
+            ):
+        return
+
+    # don't make unwilling recipes depend on make-native
+    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
+        return
+
+    # make other recipes depend on make-native to make sure it is new en=
ough to
+    # support the --jobserver-auth=3Dfifo:&lt;path&gt; syntax (from make=
-4.4 and onwards)
+    d.appendVar(&quot;DEPENDS&quot;, &quot; virtual/make-native&quot;)
+
+    # disable the &quot;-j &lt;jobs&gt;&quot; flag, as that overrides th=
e jobserver fifo tokens
+    d.setVar(&quot;PARALLEL_MAKE&quot;, &quot;&quot;)
+    d.setVar(&quot;PARALLEL_MAKEINST&quot;, &quot;&quot;)
+
+    # set and export the jobserver in the environment
+    d.appendVar(&quot;MAKEFLAGS&quot;, &quot; --jobserver-auth=3Dfifo:&q=
uot; + fifo)
+    d.setVarFlag(&quot;MAKEFLAGS&quot;, &quot;export&quot;, &quot;1&quot=
;)
+
+    # ignore the joberserver argument part of MAKEFLAGS in the hash, as =
that
+    # shouldn't change the build output
+    d.appendVarFlag(&quot;MAKEFLAGS&quot;, &quot;vardepvalueexclude&quot=
;, &quot;| --jobserver-auth=3Dfifo:&quot; + fifo)
+}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cf7ff3328c..8cf188270b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -946,7 +946,7 @@ BB_HASHEXCLUDE_COMMON ?=3D &quot;TMPDIR FILE PATH PWD=
 BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEP=
LOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIREC=
TORIES \
-    OMP_NUM_THREADS BB_CURRENTTASK&quot;
+    OMP_NUM_THREADS BB_CURRENTTASK JOBSERVER_FIFO&quot;
 BB_BASEHASH_IGNORE_VARS ?=3D &quot;${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNOR=
E_PATHS BUILDHISTORY_DIR \
     SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGE=
T_SYS&quot;
 BB_HASHCONFIG_IGNORE_VARS ?=3D &quot;${BB_HASHEXCLUDE_COMMON} DATE TIME =
SSH_AGENT_PID \
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#186824): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/186824">https:/=
/lists.openembedded.org/g/openembedded-core/message/186824</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/101009092/3616765">https://lists.openembedded.org/mt=
/101009092/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------akGPPlPbhe43UgKFKL53QMBa--

