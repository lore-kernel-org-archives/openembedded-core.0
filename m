Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430C7C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 08:05:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5093.1749801914210982802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 01:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8259fd66e0=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D4fNKL032599
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 08:05:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd96jnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 08:05:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+cJTgPgypOB6m1gzBu62epwDkVJWNtlfMaEFLpdqR9fgt/GFHNpArGlG6JdYREbQzAhm/NC1XVxcgO7j18mb7EfPEVyHE75VenK39i9U2SyVtc5CVUdolnRrYJTRm1Wnp9AQEftJvHssMoSTiIWOlh2SBT7RA8TohNuLHO7qi7Kj+H6Wajxn+1hPoSu4FLyaE3FuJyQgxr98r7evovy185x6+wRW5iC9//IoBmUUX7tmSFoRkkHNbZdTODJke4CuS4opmOWV53iYzyM+H7TTQQbWLYVhLCMpCs9pwPowBGhgmcnaOTRGSdF3Y3jURy+mTe15cz3pOEXlZy93G6aMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcNGVyIYf6M+qsJdQIawKVBSEWgmsfWIyp3Lnl8SBfU=;
 b=lx63gQ0uWE0BGOoyiZq35Bp42X7ms7cDj2ivYyFqzlPjc46S4EimOpq2uS3dkFX/3WYu75cFvn2pSuOkCan5n0DVH6s9Mvfos4lq911H4wgem7B0ocwT5XyKHVfecPot/bIO7dr4fx+HGN2Bzr5xscySYcZ+2BE2P3H/DDzLka+D2G+Q44egNoJ5qNU8Aojb1i3JeZiYA1hp1J1LlJ0ZtUi40GimMkFUj2R6DDZvdMQBk0jJJ8AIgS9WOgU2iB96MThzf3sck7mQtRQzuTOrnEZX0/ucgkclxZg8iz/Vqw4DV5NOjGJWV0hb4Z8j8sPS+F9vFGZ2vy6IW9wFIgzioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA4PR11MB9322.namprd11.prod.outlook.com (2603:10b6:208:562::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Fri, 13 Jun
 2025 08:05:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 08:05:08 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Gcc-15 test results summary
Thread-Topic: Gcc-15 test results summary
Thread-Index: AQHb3Dfh5IcJfInPxk251xlXxET5MQ==
Date: Fri, 13 Jun 2025 08:05:08 +0000
Message-ID: 
 <PH0PR11MB56580BF59A4AB6491B2982F1EF77A@PH0PR11MB5658.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5658:EE_|IA4PR11MB9322:EE_
x-ms-office365-filtering-correlation-id: 20a786df-0635-4892-212a-08ddaa51039b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?ZqvGs7JFyMJZCF0G2Y119q2s8DrmpW5ftLVDMXpJHB7xfY1mObzvpYkda0?=
 =?iso-8859-1?Q?f2ymwrkHyyV1YXG2RZ2OciTNxdVH3kCHqJHggRuiXrn91+elRd+X6XXkgT?=
 =?iso-8859-1?Q?tULFCb0oprvoeZ7nMrlTN3P5L1Cv/doMWPB3SqpfyxUpscxpc/vhFay3fO?=
 =?iso-8859-1?Q?t3+CcUZJWckjnLWVVkqgN9SDOKtYVT1YvmCH7uFq4z6fxYgsHJtK8W9z6e?=
 =?iso-8859-1?Q?PMevVrHsBJtiBHohFnvHPnJZC3m6LhiclNIAYHSTa1BT4J/nua3uEgHwFB?=
 =?iso-8859-1?Q?zvR/JCH/UKNbVn6K15xM2QYUtFnzL4+fS9AZQAT2qFKKLJpC5nEAp/xEoS?=
 =?iso-8859-1?Q?X5org8Ab1sLc6FIdtm/emhnHUSSKhp0iqU1VHqPAiu5CE6ssp80F5j6XgE?=
 =?iso-8859-1?Q?onq99Askmfm9JJyIKY9QaX9ov1ZcZxpB79vGzNgTEC8LCCvTR9sZRLabGm?=
 =?iso-8859-1?Q?gO+h1ca8RjVStO9J0oIsZyZTZRoeX5yOhnza0Aafd+aB4MIFARuC/P01k+?=
 =?iso-8859-1?Q?4rVZhOgBSSinYfw0hPrtMYOyIKcAZLlbMH4cP5hf16sNXdoYH7HFGQt4a1?=
 =?iso-8859-1?Q?GaZ9S5ELjfhzh20I2ZNWTq+e32nGH+UKpZNcXTM+UtARpDRfE+E8R+KUrk?=
 =?iso-8859-1?Q?Yn4Z2BU6uDi/RAgT52wdM5Hdu1XFHT2CAx7wrczpxZKh8Qk5x6H/8aZHft?=
 =?iso-8859-1?Q?qrWDXK7j1TE9EbrKY8LwDpHmoUvZX22Me812fTQWjmtmzzkuQXEmzLN5Kv?=
 =?iso-8859-1?Q?vTCVH3ZPs8Ha6hcsfgt2oRkbenVjJU1gsxi///cmkmCubktaL4Dd0XmqIN?=
 =?iso-8859-1?Q?ASytg+wqxdkJdndIMxACl8OcG+o6Z1OQshNbsbPRA76vR6LdWvbpPMKljx?=
 =?iso-8859-1?Q?/e8oClNyFegffzSSsryBnk8JMhaZhXJveZImH5pkkoNvbIyswEmSgqbtVf?=
 =?iso-8859-1?Q?0hUvSqgKPQxIjqZGEc/9jZrGu5ruYBDlZ1gzcQMwkWG0eQUsyCb0cZqxva?=
 =?iso-8859-1?Q?UKIz0UtJFtspyXG3yahJjgcjXdZ5cQl8AS1DmE+ZPf6GDh0+lPZ27xZuIw?=
 =?iso-8859-1?Q?nPXhD+Lr9S43/xNsqmc0lfGcD8BDF13Ye3tPc20aVbts15zQjPk3BPzgXb?=
 =?iso-8859-1?Q?UYkR7BhJc812MjtGXq3P8hQ1LOIuZCMGzJ0p0GPCvEv47yg2ScTsBKtBLv?=
 =?iso-8859-1?Q?oSFhJi8Apww+Vijs/+jLl1bvob9OWCSrdIXoUxFSN/TOWjqp5um5gPK8Of?=
 =?iso-8859-1?Q?It2LMWZ4skgrFmJPiXS5pCsm/H51znWC13/tIr23qLgTgixJmmoZaBE2+V?=
 =?iso-8859-1?Q?lcvLPaDUgFDB4UxJeGhzj2DbQm0j8VyQdKmEZq4NpR2ydQPXwHIf6oJcep?=
 =?iso-8859-1?Q?iU4HzjJyvRLtlIV93xyN05TyDZY+AGxohBabeBjVHYT81N1tkgp6jkBYeg?=
 =?iso-8859-1?Q?XubgS54+w1Jng+o5ih/NvYrX//SRIy/452fSqC1TA1Z0xN6AvR0VBpYEED?=
 =?iso-8859-1?Q?CIj4XD2oLEl4DWwirHibQO9iL4WXsgmDg83Tj8bFfa8g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/Z8qbQGV3u49pdOy+lFiliQi+M+aAsoZ/Rs50Jbui6eEWBv7mmu1iisfEK?=
 =?iso-8859-1?Q?ULZfiGGk2D/CsLf68UkFm7kZSn8yXhAaAHkxuethBRaEj24If+ffc+kvhI?=
 =?iso-8859-1?Q?jhPyy5N+Smjsg5s5JY7UVRzQx/jFrASs5NiyzHjZkj87/33ZRQtwsvEsXj?=
 =?iso-8859-1?Q?k+1OV5zfeeAzT/hkuFIb4s5Eib9tjwOz41gC9DdMvkx5PgVNeo9i1IyZ0I?=
 =?iso-8859-1?Q?sADraB31qUwgpwaH7+YjqGEVee4NyAU1sJy3WJdIhZ0k6WZBJbWxBDoen/?=
 =?iso-8859-1?Q?KSm0Egmg1bo2apRu9LDhxZ3aMqnuhLXyEom8keZAStZDM6XnIfWyZXgA37?=
 =?iso-8859-1?Q?byCqQm7ilhHs0b8fU3baZLZGDHtxdvjZ7Hcj6TdhDHO4XP08ielmcdFDwU?=
 =?iso-8859-1?Q?fnBOOAIOlHxE78fT5mIpT3/CvDwR89CiubGnLxXt3hSN/n8x8+TAr5s0xP?=
 =?iso-8859-1?Q?gJ8Z98VDrY0Ya7IFiprqZA71T2a9x3Rlk23Bf0hf1elOKiqVt66gj5XIRf?=
 =?iso-8859-1?Q?spGjT1I7IPuDXl3uAV7/RFg5bjQirhcuUDb2mMG0RzSp5vE0CROCiypU1b?=
 =?iso-8859-1?Q?mCA+zC2Qh0LGMYndTlMiTVaE3TQ+R2W2G8U34MBkK0gJab4rqIvrmgGQ46?=
 =?iso-8859-1?Q?CPzjAFRA0zqqPNyPYK+c4T8FCFTodJvTT29PCLGajYWbibt+xszjwmS8UR?=
 =?iso-8859-1?Q?z5YAINYed+46sMq+o1TkvqEpETU/XtV2Gu31eA2DKKrkTLcQHjviR3T0qW?=
 =?iso-8859-1?Q?vnvQa9DNtpz9H1eZPmY+fWsl5Lwx9+sF+F0rORky+mGe3WZclKGh/knbyG?=
 =?iso-8859-1?Q?rpz6v7d81oAbdX8DBDf1KVcs0ZI9SO+OhPTDdDsU9x+bxGRRSkJBxWwJF3?=
 =?iso-8859-1?Q?6zBLD/eDq/XL6Ym1c9wj9veom3gEw1S3tsHg8gdY5sFskr+K0VnWTwdBs2?=
 =?iso-8859-1?Q?ywWlYNHgjod3TlFjwxP1cWoIyy7wpGqT+ySGnbpeLrJKereMn9tkKIXjXh?=
 =?iso-8859-1?Q?R79+Cj2HNSyux8A4t5GBGxzm7Nrl61yQ5vsBtxyJ6YHkafR/cPh/VBfA7m?=
 =?iso-8859-1?Q?29myohHxrm8Liwsj0NGCN9++LoNKuAsncV/jqhgYLk5x/HxUhRb2FWhz63?=
 =?iso-8859-1?Q?XOrLIMblzy2l2kjwfW1QcthQUHJwAtEpdLS3kSdAfcY7MCTO8fxs+ywABs?=
 =?iso-8859-1?Q?QKbbGQIroMe0c+l3J1MWfUIGbQMsldkvUuPCOYX2plshnqwbO2k49bsKEE?=
 =?iso-8859-1?Q?gzWY5hsB0o4zUvwQFF9AiCkMyjGhqn4t619pT0c6tDi5YU3uV80GHl6VE+?=
 =?iso-8859-1?Q?8o0fzN7M/hnVboLQ/quIk25L9xOHrfIDrirDoMHyhTEXTfQJtmIBWizZDG?=
 =?iso-8859-1?Q?ARZLBD+JVAGPEOZ7ZzO3FJ4V5mX6LhQMFb66Ri+Hv8JJ5OU4QA77Ro0ntE?=
 =?iso-8859-1?Q?qC4qIDzo+94BzpvRtc99TAcbjRW6tDGricBqZ9FvHXVi28SO6khPI6G548?=
 =?iso-8859-1?Q?5FzlqE5R56q44vzN2QKfKa7/4x2Pu0uj2cC11cP9ousISDQM37WeRz7yjs?=
 =?iso-8859-1?Q?Or2hedVcNsuJz1VJ1Sl04dvL9gM0Ii9hoQ3teU1Tzx7s6gjOjmyzXqKFuH?=
 =?iso-8859-1?Q?wCjcAUgMBm1M6zc8X1VKvmXePf0DXTmQQqgEPO46Me97C8rMmydjlAKw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB56580BF59A4AB6491B2982F1EF77APH0PR11MB5658namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a786df-0635-4892-212a-08ddaa51039b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 08:05:08.5673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mn6K4Ckn2ajMR4GKT4XAU/zaNigpUWf8qwijTxjvzBVtYOCidGKfs42AAzKFYtJheD9Ld3OCe6u+rRRwFFcEPGrTBIWda9ld67hpl/IcsHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9322
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684bdbb8 cx=c_pps a=gkowCl0aGI9AdbyrVFZYCw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=Kwa909tCeGxzum0CUUgA:9 a=wPNLvfGTeEIA:10 a=YOKxKeozNw6yPJP8tBQA:9 a=mSw1hdgMuSi52loC:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA1OCBTYWx0ZWRfXyxaH8gJlis+P fPw2r0XW4PVA0/RfpB3A21vy/U0eXEe3eLRPCd5YRHs5KQ7vRnN0fduXZ3FvTFb8125RJ09ZB14 GUTkVH0DdJhjNiIRwkz+x4tbBiuvW2VDdoI21v1U12F6zmWY2J95LUdcV+RD2CWKkJOFjGyOFEw
 rlurufBl8jak6pkhoMznJJf+MrWWiL7J5decdp7ehGEU0MNi2l5rqjyWAoqFrEOSYIqLNzhoWNt Lf2rCWjjq7kMU71Ab6LedIpPq9mrhQcLmQeOY37wr7ukypA6/0RfhYSHsPKK+VfnaeDLfXydO9Y 9Bd8uPhiV7W9svYxkliStev9xB13NOi3tUustcMVIx7U1E/FmtM2PCLjxERNIoXLqqH9Zi5faQT
 Ab2ehNkFzZWwI03E5xFUUP83fdjcpqcdMHa4f04I/FBwUfsiLO/rNoRov8jxTIq1kckbv3rw
X-Proofpoint-ORIG-GUID: B2Tzneqobq1LSp0stI33DVMJ2aWovH1X
X-Proofpoint-GUID: B2Tzneqobq1LSp0stI33DVMJ2aWovH1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=663
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506130058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 08:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218586

--_000_PH0PR11MB56580BF59A4AB6491B2982F1EF77APH0PR11MB5658namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

Gcc 15 test results diff between yocto and upstream gcc

For x86_64 architecture :

Component
Metric
Yocto (gcc15-yocto-x86)
Upstream GCC 15
Difference (Yocto - Upstream)
GCC (C)
Expected Passes
202,970
203,217
-247
Unexpected Failures
69
23
+46
Expected Failures
1,462
1,465
-3
Unsupported Tests
3,163
3,226
-63
Unresolved Tests
4
0
+4
Unexpected Successes
0
0
0
G++ (C++)
Expected Passes
240,928
241,892
-964
Unexpected Failures
21
69
-48
Expected Failures
2,271
2,277
-6
Unsupported Tests
1,649
1,486
+163
libatomic
Expected Passes
54
54
0
libgomp
Expected Passes
5,704
5,824
-120
Unexpected Failures
4
0
+4
Expected Failures
46
46
0
Unsupported Tests
475
382
+93
libitm
Expected Passes
24
44
-20
Unexpected Failures
19
0
+19
Expected Failures
3
3
0
Unsupported Tests
2
1
+1
libstdc++
Expected Passes
18,244
18,354
-110
Unexpected Failures
36
0
+36
Expected Failures
131
131
0
Unsupported Tests
781
744
+37
Unresolved Tests
0
0
0


For arm64 architecture:

Component
Metric
Yocto (gcc15-yocto-arm64)
Upstream GCC 15
Difference (Yocto - Upstream)
GCC (C)
Expected Passes
369,469
369,509
-40
Unexpected Failures
33
47
-14
Expected Failures
1,814
1,824
-10
Unsupported Tests
6,171
6,188
-17
Unresolved Tests
0
0
0
Unexpected Successes
4
4
0
G++ (C++)
Expected Passes
424,871
425,745
-874
Unexpected Failures
6
63
-57
Expected Failures
2,852
2,588
+264
Unsupported Tests
3,240
3,133
+107
libatomic
Passes
54
54
0
libgomp
Expected Passes
5,664
5,784
-120
Unexpected Failures
4
0
+4
Expected Failures
46
46
0
Unsupported Tests
489
396
+93
libitm
Expected Passes
43
44
-1
Unexpected Failures
0
0
0
Expected Failures
3
3
0
Unsupported Tests
2
1
+1
libstdc++
Expected Passes
18,248
18,338
-90
Unexpected Failures
2
0
+2
Expected Failures
131
131
0
Unsupported Tests
798
754
+44
Unresolved Tests
0
0
0

The results looks good, however there were some minor differences we will a=
nalyze further.

thanks,
Harish




--_000_PH0PR11MB56580BF59A4AB6491B2982F1EF77APH0PR11MB5658namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
Hi All,<br>
<b><br>
Gcc 15 test results diff between yocto and upstream gcc<br>
<br>
For x86_64 architecture :</b><br>
<br>
</div>
<table style=3D"text-align: left; background-color: rgb(255, 255, 255); col=
or: rgb(36, 36, 36);">
<tbody>
<tr>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Component</div>
</th>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Metric</div>
</th>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Yocto (gcc15-yocto-x86)</div>
</th>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Upstream GCC 15</div>
</th>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Difference (Yocto - Upstream)</div>
</th>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>GCC (C)</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
202,970</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
203,217</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-247</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
69</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
23</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+46</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1,462</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1,465</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-3</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
3,163</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
3,226</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-63</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unresolved Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
4</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+4</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Successes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>G++ (C++)</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
240,928</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
241,892</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-964</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
21</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
69</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-48</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2,271</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2,277</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-6</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1,649</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1,486</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+163</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>libatomic</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
54</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
54</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>libgomp</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
5,704</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
5,824</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-120</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
4</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+4</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
46</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
46</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
475</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
382</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+93</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>libitm</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
24</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
44</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-20</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
19</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+19</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
3</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
3</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+1</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>libstdc++</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
18,244</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
18,354</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-110</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
36</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+36</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
131</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
131</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
781</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
744</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+37</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unresolved Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
</tbody>
</table>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
<b>For arm64 architecture:<br>
<br>
</b></div>
<table id=3D"x_x_table_0" style=3D"text-align: left; background-color: rgb(=
255, 255, 255); color: rgb(36, 36, 36);">
<tbody>
<tr>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Component</div>
</th>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Metric</div>
</th>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Yocto (gcc15-yocto-arm64)</div>
</th>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Upstream GCC 15</div>
</th>
<th style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Difference (Yocto - Upstream)</div>
</th>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>GCC (C)</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
369,469</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
369,509</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-40</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
33</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
47</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-14</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1,814</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1,824</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-10</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
6,171</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
6,188</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-17</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unresolved Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Successes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
4</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
4</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>G++ (C++)</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
424,871</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
425,745</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-874</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
6</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
63</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-57</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2,852</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2,588</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+264</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
3,240</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
3,133</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+107</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>libatomic</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
54</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
54</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>libgomp</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
5,664</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
5,784</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-120</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
4</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+4</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
46</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
46</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
489</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
396</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+93</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>libitm</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
43</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
44</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-1</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
3</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
3</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+1</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>libstdc++</b></div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Passes</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
18,248</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
18,338</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-90</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unexpected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+2</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected Failures</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
131</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
131</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unsupported Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
798</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
754</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+44</div>
</td>
</tr>
<tr>
<td style=3D"text-align: left;"></td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Unresolved Tests</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
<td style=3D"text-align: left;">
<div class=3D"elementToProof" style=3D"text-align: left; margin: 0px; font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0</div>
</td>
</tr>
</tbody>
</table>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
The results looks good, however there were some minor differences we will a=
nalyze further.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
<b><br>
</b>thanks,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
Harish</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_PH0PR11MB56580BF59A4AB6491B2982F1EF77APH0PR11MB5658namp_--

