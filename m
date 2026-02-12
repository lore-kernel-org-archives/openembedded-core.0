Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8F8EE36BE
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:05:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51609.1770919529222642910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b/DDBby4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C9VuK03497631
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:05:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PkXGVKAlaeZ36mVnjcqdupSYYaoV2kd1ZBAYH7pggRY=; b=
	b/DDBby4Vu9CDwp1CVb5/a3mxwL5QBh03pmiT8IMJutRz+rB0pwgXXlAp69IPwvX
	XexG/iD2Ao6dkCVHulmsDx1IKEDnkOZoCALCJv7Xrn9+rYyDrDQy5YfSW7VlCB7Q
	xGqnafEUsYnEfWPgSlxfxgOcCETxT5tHu76OMtLU6eUjwuuvMrOQ6PxDCgguA4o9
	g7hAZA+9TwgM+J2lXlSkvdiA+RVg9m15QDOnHubN7NZw2kWTEeRQM8DyqUJ8186Q
	H5aGNHld44JWhaCZ4nm0DC4wCJCX43vYwCf9lUkH5X8+oqaQexPhxZdcBrciluJD
	H0YXVny4u1P7vV+rK1pehA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj665d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:05:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnHTyhApoKlykthu77CKpIsclf4L3wK3dAO1RlKjPG3dLzTTqn5aL+6xCzy4XZ8oS2Y3a0wW0FTZWtBgyEHaviidhMQx+wh/huJ9RIxAfHbCFwX/MP2sYyjViClVn2eIeJg4KyTjTLlBms5H2LFJvM59StRvWJzsK+uRq6gGvkerHoLjQcSSJrLUulBXX7JIsLVUhgKqSTsbIs4Th827pKXRJdjHFbrxv426jYHW2dIvhNFCz5og2JJmiy7jVvsVAksE70OdJRAwEW8MSXz7qlp2s/WQWr78mN9XKUxzO6cF9/JB7sLtPFdNLGDvOOw2hyTSHEVLAV6/g6MD1hQfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkXGVKAlaeZ36mVnjcqdupSYYaoV2kd1ZBAYH7pggRY=;
 b=X6P13w9RSnQPIKbqzsfVoUJkjAx/Dc5qkB9e3PEfHpcstwullET3U3Jpw9WhNVcqkRdk/slFyAVR84n35TXJgOxSjQN9spYHmq4Oe77Eafpegs87JfmmeUKNBgpcG25jlt4B3zyS1E4QPs0Gv8lMpFbvS5FwmXYC//dmvhzKIVRk36nPLHDT8ZPE5hFOD8NINuC052FdNCGw1CReSVXdWXkSWVykUxM44EUYo4rWNGW1s3fiw6gZfH4G8YSqG4XmPKr38YchRba/D/6cTr6hT2c8AGrdKcTmJOrkZ8NYY8ENrZjwzzpTljkUWythiMzB+FueytZ/TQUeFheVvEkrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:05:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:05:26 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 02/14] rust: install Rust library sources for 'make rustavailable' support
Date: Thu, 12 Feb 2026 10:04:21 -0800
Message-ID: <20260212180433.1825988-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
References: <20260212180433.1825988-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d5d4f3-cf67-4cf3-8e05-08de6a614c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vJiJRbBkF7b7GM4TLG9Y7u1e6Z3oiFlTT0FU4hUiWEa1YA6FJoVq6eqx7oTG?=
 =?us-ascii?Q?jI/rdyGQ0zeo6EasuCYVehxoFv8p64EdApkhI7qom2KO++Mg+LfkzckrxY/h?=
 =?us-ascii?Q?DCAIxmBqoqfFFduGk/sfLu0IYiKPM3FyytimCifKxdqlWiw698yjA/jSa4hy?=
 =?us-ascii?Q?4SdKcC1y/dCaHmJwUKWysa031KyQfYv+s6vxdW7wNuusJioun4Vzm1hTCcMq?=
 =?us-ascii?Q?sueLjyTXZGzK44D1F8FNTi4Ze+yfSnQXExauhLhrFKAX0VPzxlZS0bEP17iH?=
 =?us-ascii?Q?tTW4zol1601YNCRK4PApRIhmPzG9pGeuPZeQzka0fEreeiRbREI5tNE+yEDx?=
 =?us-ascii?Q?Jd3Udo9furVXhGMz8AYIHdaIawTbAqB69XbPWAjbpFOGftKDtrG2qJ4nCkpG?=
 =?us-ascii?Q?onLBVCqlKpT8HprL6FJ+koDBQLCpttTgVKWJvIcVaw/gsPstQG7h9VhOhBMk?=
 =?us-ascii?Q?9/8iuDNKkL81x7mSNY+pwReoetURZOLPUa0yY8RWkCp1xreqbkVCZFJZMxY0?=
 =?us-ascii?Q?XR+eiWtK+bHk9yl8LclLwM//v0BxG5jPVvmzpQB1JBaEuepopbTzMpFC5w9I?=
 =?us-ascii?Q?Y/q6qUoH+KJZGhBGpby3wjM7JFl6rK9pwo/MBln4BCMzlQ6FHhaMydIaopDW?=
 =?us-ascii?Q?ISU4PsPse8qU3afgi2GESkHjTw9gwRhEIjAFt4FpjSm1dIiP4I1Nddez9bVQ?=
 =?us-ascii?Q?ekY5ImyNYO7iB4WCb6YuG6HyN/NkALgZWdy5IUReHNKG7zAxB58NEwwjJtls?=
 =?us-ascii?Q?dvbNbM/2zc83eR3U4VxEKuF2pFbj5jIqMqV3bhyq/Exnx0P9WNE/3SUifw25?=
 =?us-ascii?Q?bmHzxdEXdui7g/gelo9K8kjL7aM6f4Lcz4UYloefTnRc+yrx2kQvBtlNCRa1?=
 =?us-ascii?Q?bI7Nv/s9ShzqNIHa90n9+EFJQ7stgwG3sLCAfKbsn3PzqruKioOaGKB9MX0K?=
 =?us-ascii?Q?1WeSpbTKwPU3XbSgO55LsrDJDUdcFMQqwOpVivNi/UgAB+BHdzmtcZlh2i8c?=
 =?us-ascii?Q?jpk9X5OyqBWAaZdbrfCP+DAn7piJfWaJg+tNptoIqftJC6IODGtQNRbH9g3c?=
 =?us-ascii?Q?aDHwVEI2eNW/s7DPzFoOE8MHynyBu1htOueib4Hm7oZbuem8L2TfOfHbH3oY?=
 =?us-ascii?Q?b9VU6HXvoyPR/s+8B+yw06iw2wnaaZGGPEHx2LbE3gilKoG0971HDw30HBeU?=
 =?us-ascii?Q?9Cgd/m/P8aEITA41nrCHsfzJ6ygakY2Iq//B2Lln/QPytO1BNhwIFjWG0zxt?=
 =?us-ascii?Q?EsYXpam85Ehrv9VmTNIIqaGE7O3J9EyZ/k1ZDt4iNhp5LQqaipajvK9FcG9r?=
 =?us-ascii?Q?fUrbBfecuQH2J6FZxTd1Ev9E8Ryny1CjWoMOGk8QHgkntU2+aDjjDH6o0D3m?=
 =?us-ascii?Q?ckIi8J2yZpTpkfJlcdUdKcZF37stq7O2tccI/LxkO+U5JaChT0K1odJ+iYGX?=
 =?us-ascii?Q?EaX5NrZ1jDnepFcx0Gm72KRooyz0TVj1UcKEZmef4YtWDWcRdgNY+w7RyQxD?=
 =?us-ascii?Q?GH88VFe1MK3emjqZ9l12xJsBa7vdSK74OmML4WaXtfd9tCdldPgnOYxWkJPM?=
 =?us-ascii?Q?7gKVpFpY04MzUlnUI/lRfuR0Pyd2oQNhNaIAZMhkdPRuhwGLaduVgkPacKeb?=
 =?us-ascii?Q?ZD12DNynD3whhN+RXg5D9AU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UapgGAuMgWI021ydBn+6KdYBEA0C2lCx2PUmvsOC3OUM36Ws34px1Zv90DPw?=
 =?us-ascii?Q?G71pw1zTFg0GJrOi0camU2eNwa1OittC2l/aO35A3XD7uqhRHtl4Gc2vgLTU?=
 =?us-ascii?Q?xliqg10D2LSdXvJFksRFrEnn94LfUVkWPVwi0GkMqyIwPXUmUopSjMboet0x?=
 =?us-ascii?Q?mwr+5Ngu90DWXijuAuYA1p5gncNIFE6rPbF0YYi/u5Cw1jYS6Mpys/8eg6mN?=
 =?us-ascii?Q?aHnXzXbUnbRuWxXqEMMmg79dPq3XGG6/cdvqgYEXA5pc3Bk/uC7V+jjCyFmf?=
 =?us-ascii?Q?W6Mxe9reiOSb2kztwP9TqGgg8sQGhLigSzRPAixb7zSa19ePEouSjVfSPp95?=
 =?us-ascii?Q?mU1GRSI6Mo8tm7Xw1PJHFqcDOCJXjM9hFu9gsNhz6WNcs19kPfwNZyc8Jnbg?=
 =?us-ascii?Q?A1PvUWzn7UhJ7nABauXrZ8as8hWjhH5n9KYXCwokzgAnjIG3EQsZnaMkJWKx?=
 =?us-ascii?Q?05t8mJM2mU18DVWwqMh7NHoea21eqvSVJsu7BtDeR5JdA4kEd2CMGqCqNDqw?=
 =?us-ascii?Q?RhiUbS0qBaZC8GsCfOEJBas2H14QG55RTbwobvDmrw87gw8unwsC/uxZyHH8?=
 =?us-ascii?Q?+cEnkpD7cyS9M8/u6k78wJcj2d+HX56q44OJJ+v4CBuOF9LXrfyQfSELyVRg?=
 =?us-ascii?Q?UnWDSupOpxtST3rGfWmAgtGb21V/rq9YHephjLdHfcOvqdm+OmRxCgdGUL5J?=
 =?us-ascii?Q?/PmB42fVLJDAMW1WKHYPHI5Ce7SDvR7xsfxmsjm2ImXSogfgLrNwzzKmN7q7?=
 =?us-ascii?Q?L8GG1ir0UpP0HDWN+4GCAdXlhaaq/VO32n2zBFQbzcJjK66bOIZVN1EBGlmz?=
 =?us-ascii?Q?WcohFEl8YvPNWnOTOjwzLQTh58ygEUQcKeLisYu951iy5RbF3Rr4xepkTKvU?=
 =?us-ascii?Q?NLslbSvMfhgwnAEmuaMNxlOL8pbq82gbRP9Z1WdSJNjJF+b5lUfjP5T3ccZH?=
 =?us-ascii?Q?3biwA16p2bPSx1VIOzkO2VRhaTqWl+wrW7uaYzCjfZ4KexGijCLoUvKS3QaF?=
 =?us-ascii?Q?Lgn0XzIWF1NX7IUSpKzpNUEwO7a+pjulGMUJ3kUk8iPTGw5xhAJ2/3v11A8c?=
 =?us-ascii?Q?NLhQ8aLnGo3UGwM+Hxr0LjCkkzMcDANeZD6BeYfgEODlFkGFTQRQW2mLYREc?=
 =?us-ascii?Q?R0hULJOt6tSDoYJujggAke65AIVOR4zbmDvkLs4IvEG8PnHJyvpzo1ihGJmi?=
 =?us-ascii?Q?BCPgVgofQmbYBnKgwufovewWCj1Uw66Y5sgPgtgFpYloZKpiRc9/5WRxSfA6?=
 =?us-ascii?Q?JGxyZAeE5ZqJdWGsNh44psHcHF5piIn/wVAHJgpEPq/yk3uyJUwNSZmqko0w?=
 =?us-ascii?Q?rOCc02kSmHeteNPLDkartZxo3gv0IqPrTVJErTRDqot0hZAjpDyn328E7cjR?=
 =?us-ascii?Q?v8LqtdNkAwwfQNkRuBbgA0toE77aYZjGcHlqyw5IRJgxRf4gn5rII2BS52Y7?=
 =?us-ascii?Q?rznUgQ17Wo89iHK0JExzXkLSil5yJkov9uJK/LDzGtdUA4LCZPXZjZwcY17C?=
 =?us-ascii?Q?xopOEucPUwbAsq9wJJsrN1MeOeFbCrbs2qoXpZ2T5sotuMqHADh1Al8mL0Ao?=
 =?us-ascii?Q?z7mG6EdY29Hxn0VInhOnrbJX9DpAHrsNGoV/sx3FAF68LVWTSqRA1ZG/oGV9?=
 =?us-ascii?Q?fqC/Kc9FBQuEdJ2Jo6etEtGUoIh2A7J7yvVss3wyIlwUurf11vJpauaB7Iv0?=
 =?us-ascii?Q?dGbPEE6k88+wyxnwP5sGuFF0OkrN1SKrTQMNcQ+/Ehj3Y8KYfSfSpfOvk5Sp?=
 =?us-ascii?Q?R9LFtzV2FTuj9nwwq/V2YiH4KTesUec=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d5d4f3-cf67-4cf3-8e05-08de6a614c62
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:05:26.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8P4qc1uTAUKYqaNvcZr1PwFs/UhU0EohFlRB7xKxhBmSUgeKlPRUcD/d2jhbVhMxhoWzP7hAyU/JHQJwdAn0jZB0LUv+h48H+DQxXB2okg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: -wqG3JtphF68oiinATCTLGBUNkoWGBHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOSBTYWx0ZWRfXyyIlqqzduoVL
 aLjBsOzRJIfdxc54mGyigNUNH1vA7fQ33Yv3f77ePtqpzE0OLvgWKRNHm1k3LJMH04oJkTtm3+1
 YRMGSDnwT3/sTwOmHZ0Voo7x56odIGced4mQP8fEtoI8tRu32rrZAbgBxDtdp1hJ0R0VMyO7YrY
 U3jNTA7uWKijMKtM3V/IIhMgjCjv0FhaO/XREnViM6y7kfk2wWZLaoq8jw8YFv7T2b3xthdKNFn
 O44pr14QV3WtHAy/rM6hOgZ93N/dpaKWdw8zJqYjqieBGclr5+WVMx/s9wFct1tcXejd7JIzQ2t
 A8IsuypESlq3tj7f2wGj//NmW0fI1tYKq6ZkdJhV2GPYbjDk8c2/hljI2kTRGp9/ob5RYg1cdyM
 7otrRd4JDSp5sSfYhHcSLEm7KRP0eqz3FDy60nDfZUC7/rAjJ6kGYGZzFHOlEZNojR52wRMA9eD
 qX593u4LbrYCfWd0mgg==
X-Proofpoint-GUID: sCumVPzjGtFqK6_pUiWtk--7NmkQBCO1
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698e1668 cx=c_pps
 a=espmfoAAVKQgPoIy+vmhGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=nzq_CVlEzhOWP2AoRwgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231057

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Installing the `library/` directory (of size ~50MB) into `${D}${libdir}/rustlib/src/rust` for
  making them available during `make rustavailable` for native, target & sdk.
- packaging `${libdir}/rustlib/src/rust` sepearately with `${PN}-src-lib`.

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.93.0.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index a25f65f674..0e9d21ff21 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -264,10 +264,11 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-src-lib"
 FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+FILES:${PN}-src-lib = "${libdir}/rustlib/src/rust"
 
 RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
@@ -284,6 +285,12 @@ rust_do_install() {
     rust_runx install
 }
 
+rust_do_install:append:class-native() {
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+}
+
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
@@ -314,6 +321,11 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
@@ -334,6 +346,11 @@ rust_do_install:class-target() {
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/target.json
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust -name "*.sh" -type f -delete
+    install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/${RUST_HOST_SYS}.json
+
 
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
-- 
2.49.0


