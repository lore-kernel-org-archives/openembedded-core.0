Return-Path: <sven.kalmbach@loewensteinmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23C5C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 09:53:39 +0000 (UTC)
Received: from mx08-00640e01.pphosted.com (mx08-00640e01.pphosted.com [143.55.148.42])
 by mx.groups.io with SMTP id smtpd.web11.2404.1740563609954858407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 01:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@loewensteinmedical.com header.s=pplm042024 header.b=o7CUSj4r;
 spf=pass (domain: loewensteinmedical.com, ip: 143.55.148.42, mailfrom: sven.kalmbach@loewensteinmedical.com)
Received: from pps.filterd (m0376841.ppops.net [127.0.0.1])
	by mx08-00640e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q5WiNf030516
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 10:53:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	loewensteinmedical.com; h=cc:content-transfer-encoding
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pplm042024; bh=XUROeRw4q+eK3t/5dq8AE2nY7R/D9y5+YASsuHRiXgw=; b=o
	7CUSj4rutWkJXxeOBqZ3enZXxHJIpWKtU5IP9IQ3cX3lb6cIpKxjuMR2mUyCy3nE
	GPUWsB+KfQoeB1WKt0syULABplryfERB7f0FKvbUjnuTG8ziEg5NqZ0mly/YEDGt
	/kCJh0Cf1Vr+X2YhkSMGjCF2vezQpBooLmpQRJU83WOdF5G+4HXBQQZWZV/X/nvw
	R81Z+u6XS3HRrDZRa5Nj5fV8+ZGvrcLPUZhiPkEcrW+1vfjmRjLON+LGs5HCXVY+
	KrfbQNxSReHrp6Kc34nhcybalu2et4mBs9infkKV4zI3UDlsGN/qPOcMwY/KviyN
	/T32JUyhopx4UtK2pyEZA==
Received: from outlook.salvia-medical.de ([91.26.250.91])
	by mx08-00640e01.pphosted.com (PPS) with ESMTPS id 451pu6rb5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 10:53:28 +0100 (CET)
Received: from LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) by
 LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Feb 2025 10:53:27 +0100
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.77) by
 LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Feb 2025 10:53:27 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKUMYDxyKjd+cgM3dlIO5WdRBIEyq91ji8DBHHxZdkl01l5sqIpRajaEqF/qjKefUZ6Ml5VcVFDtp0fk/4KapTUsUu2d9ZvJ4KxudfJjRko1zSnQGx4flyRU1CDvkH3CLBw6ZvMySFy0U9g/1yvIvcdHWMpq3h90DNd2v3GLzKtQSv2PQRVJrkLCCER8ouc2M9hRYMRXGqir3sK3LkH8E+D+V3F8GotGwc0/7JdngfjNUh59JgCiGkLf5zEuIobg7an2XF4Ck/pYQilqBs8SJ177leOlgV9l0RM3vwi6HudfELg+k0dmCYk3adv3ZV6dNkMFV7GOc38ssCbJ7wDMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUROeRw4q+eK3t/5dq8AE2nY7R/D9y5+YASsuHRiXgw=;
 b=IPtYQgHLFdxOVyVx0Cd8/4kFktIt06lWaF3rNsTvNUBNsqu3jv027ugwzAe/nyQ+bu1vxBQvAH4L7YqXOydjbaA1gIbFE3w3NktumcLHvhEEHMeVYeIC934URxuhk/PwJm3M3am/54pAZqre7rNRrzKES56ke5GJ9y8KlvIX8+QOTdNKx0j+RYkxRJtsYI8TxBA+Ya/+xOFEwjRdsuyt79KE2CozsjyNvK3Q8OblA4Ku1K9w01uezX5y2Ns6mM2kuBnCbDIQQ4gcqZApx1Q9jvxSxLY06kPaq2AwDE5ZuFW302Y33XE4mRW7L//hdI3rB4WmixAUAWQgIyEGotrOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=loewensteinmedical.com; dmarc=pass action=none
 header.from=loewensteinmedical.com; dkim=pass
 header.d=loewensteinmedical.com; arc=none
Received: from PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:c8::11) by AS8PR01MB8274.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:341::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 09:53:25 +0000
Received: from PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 ([fe80::3120:42a:d1fb:90e3]) by PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 ([fe80::3120:42a:d1fb:90e3%5]) with mapi id 15.20.8466.015; Wed, 26 Feb 2025
 09:53:25 +0000
From: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
Subject: [PATCH] cml1.bbclass: do not escape the exit value
Date: Wed, 26 Feb 2025 10:53:15 +0100
Message-ID: <20250226095315.29536-1-Sven.Kalmbach@loewensteinmedical.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::15) To PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:c8::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR01MB7568:EE_|AS8PR01MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: cb43c582-23ff-4b7d-3bbe-08dd564b6986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vLHx4gb3nM/c50Bfq68aNd83hVT9LsGLc1fekmlzGYEO9pjNX7eJZeWsurSw?=
 =?us-ascii?Q?Rwg0KiRO78W0rNq8R3IREi6XHi6yKorf8TF1UkSCN+k94RNohNQaq3dERbK2?=
 =?us-ascii?Q?geB+h4tl65LEChE+yeWocp/NM2nBbxBJnrIcSu4oMsbI0K6Q7V0Be6rBiQ3R?=
 =?us-ascii?Q?9K1SlDFayOFg7RwlO9IT0Kz5bkgSdvefbMi5i0Jx6rgVUJeVQqIleeYgCzJg?=
 =?us-ascii?Q?TmKR2zrY2yDveLJYGmOvs7BkLJuG+TZvOCxMrh7izNm4NRgeQb+chjzIUw8W?=
 =?us-ascii?Q?T4b99m4igOSz9XvLJnDV80RkkwKem8fNGtZAM5rmc9aK3uree2hkde8uBytg?=
 =?us-ascii?Q?bXyORIWLbJTTjZ+wgDSc5QpjgzpdOGqBV69p7OrOX9wl4ZUV53dZJXuo01+i?=
 =?us-ascii?Q?UUpAtkv/FZQxxmqv8zvnF5IHU6BPSGdcAEl4joXGXee1i/W2AgRrQ6nBxcL2?=
 =?us-ascii?Q?vp90rIV7mQ4tReCNKdpxvuBh8BnUjNK6c3nhs58lymrJ/UGZeAQdHrqlDCCi?=
 =?us-ascii?Q?ny4+IWR5QsLJrSFlL28UYUyP0Vp24UXKc9mMIcBghMjaIB+0kuuv7qbFGuIf?=
 =?us-ascii?Q?wUHz1NAIfbm7w3J6yQnno/BJRp7yhwkHidkXq6kP9dLkWjqZOXeyJ3KckVci?=
 =?us-ascii?Q?mKSVQ/QlXv7rzW5SE5TzNFZMU/ypFz+WntgRL9ijtUHBHiI1g168g2x6/v2O?=
 =?us-ascii?Q?OcCJC0xyxPnkXUUskn+7XPGXQ0M0YbUK7JY6pLtQ52shok6WO6ICmeqJND5g?=
 =?us-ascii?Q?gM0V5jbDHn2QRBXKKbKftiRT/DoCioxkJtpDm3fMh6wYXzhOpU0EMU6Gc/27?=
 =?us-ascii?Q?fHtM0VynLaQBNJxs5hE6nn3laJzne4olEpBF2Thx4FeM+yH7dPQ8csWJp9Kh?=
 =?us-ascii?Q?/vT3huNBCd7ZqRbrwDIbTJu8mFqmvR5w+QXHch/TL7VHu7DMd8Gc/O8q7TXN?=
 =?us-ascii?Q?/xk0ZCGduePFU0DR6kDN8hLt910d/muc5KvLF1bD6B5id94CGyJhZ4CQGxwK?=
 =?us-ascii?Q?G1mN91E1q31UmfmJl399Pd9+FbqAc6resvFqcpRWX7aILoRLhBJSEX76o4X7?=
 =?us-ascii?Q?iMi87tSMtHSE8XnBod2BX2kzxdPGxclgOaJaPujWIf3SkpLEAtH3v0ApEann?=
 =?us-ascii?Q?aggQepa7JnuwSJTWAf78oAkX4qw5/ByJc3/mCkJn8QkcJ65SGmMwUrmHWoX2?=
 =?us-ascii?Q?Fsp6yLRxJgwUUlDJvs5R1JOoGVppH9YD+dwrIDMjKyJhgT0eGWntQLFUrPDg?=
 =?us-ascii?Q?qYZG28/BNdago3eAdmMbT/2owEBAoHOnFu5EtyHnsRrXqQnP7s/qSDU5fJzV?=
 =?us-ascii?Q?2Bno6Pv7VrHoyNhVF+o7a37Rp0MakgVu8aXR/mXz6VyTz+tfraMwf4uV0c/s?=
 =?us-ascii?Q?VyMtvvYliD2cHuhqiGtT0exXspW3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB7568.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kuuMevQcIjyJwIh1SA8EHRLkUz25QoOz2fu6cpshDdMVQ36wMyCqmQAUsV1E?=
 =?us-ascii?Q?/RAN6Hc9OADmWd1pUgb2+3oh1SRuM+QDF9486ErB0nszbVcqCyvRXUXV+6pK?=
 =?us-ascii?Q?ftOYWjkw1W6xo5srSl/E0+P3Z3+dAN+D9FXaXHHGEUHGtpWhiz1Z0i3T9s+h?=
 =?us-ascii?Q?x5+qupkyoVjEjaiZxljhzDSerNBefkeuwpIbTFHSRDwJNNuaNRUuCp45KV+H?=
 =?us-ascii?Q?+0j1D5sFV7uzZmDEpPG6ZyliQC/fyqqs7rcQe7PhF0vXi72XQOAMxA06GDtU?=
 =?us-ascii?Q?Id8w6ovYG3mykwwSBc+pTeDloop2HtCpp13mybBBOSUElnIDX8A7SFtkM+SL?=
 =?us-ascii?Q?V3V4/h1C5o4GD4TLeXbCl2fK+anKcNNx7AhO+T13+TsfUBXeuYdgYcereh3x?=
 =?us-ascii?Q?SoZkQ1Y92X7M4f0gHfQ4KTpt+UuBHK6FbiInp6v6zsQPb9Ti90fIdN3BE7ED?=
 =?us-ascii?Q?ZLDBGlQ0T8O9k2+EB7XvU1W7IV3e6Hb7q+gt2bLHpw137iSTzAMLuZefs898?=
 =?us-ascii?Q?JPV2etHrPVhDnvmtm2LHql83w532o9xvAQPUNsYZ05HDaaQz59GqPE8O22Rp?=
 =?us-ascii?Q?v8mK1LE/Q5j57ppfLK48ukK5f1oDlbmg1N9csR3A1jA5TYyCZNBGckUHKK5+?=
 =?us-ascii?Q?mJ4mYRKKiPsA3eJNUr+YGNcd8ovF0Gtzw8QIE9G/P0MTtZM72qCVJ4MHf3iR?=
 =?us-ascii?Q?0UCpV8k2FUMQDYyOeHyaD/lVfLcXVHta9jU8LOD1epygA2v8w/AQWTf6AwCc?=
 =?us-ascii?Q?PPHRR3d31IN6b50MUNEdRjcWMhMa9KrRynC4dvQhJfUBumZuWK3p3IRZ8b9A?=
 =?us-ascii?Q?a4DgkZPwrwUb5Jq+mhH9AsDG53blVu1RJe8fyQLPSZQz9/qIaqOpjT9WekqM?=
 =?us-ascii?Q?3Yql1N1mn/F5xvwSv3NET8zmKxRCIaD0DUQiObYzk8XOrWw8eak9at2qfIAK?=
 =?us-ascii?Q?uwHATT4fG1lki6ruZeS1S0G86qYYdrTfras9EfYBYf6kLaLnV7EM3ikcIuOm?=
 =?us-ascii?Q?SuMHpZ0rPhtzhEgjZOJX791dWV02um89beftqaKcYO/XSeSXQMUHYFBZz4uf?=
 =?us-ascii?Q?yY6XFLIPzApRsJHQcWEp97iPy+Zai4vb16fJkUCaWx7FzvugkYIuneHXqjq3?=
 =?us-ascii?Q?g0gakty6leYLKFiAh0n+Yej3jfgQ6qpv/s2m6HE91MMoan1rvth3S3z6RzV/?=
 =?us-ascii?Q?o/ryoh4nPtRlENXcI0qsq6tOLyJfXN/bawFP0Dd+QvYUbwWj806MQdXbhLb5?=
 =?us-ascii?Q?IO7gfdrUdflI4aPmFM6Uv2UgWEEVU2ioRHF0yIYp9uqspYDEshNlyiDk1Fik?=
 =?us-ascii?Q?HRhrvrn4RQBselyk0A4Ia2pkBQrn83cf6wNqlDCsz6iUtxWWo5wuw+xWyF2N?=
 =?us-ascii?Q?4nwQGKO3g/0YEWNLkBC2OKEnt1gHKIDPNSsVGgBPC25pvE4XHIcxczH5H2gB?=
 =?us-ascii?Q?w0m0YOaNnFl+tjm/kmLEuYvAmTN2iD8Ej0H5hFbkjBMKdsb9tfQbuuT5eRaM?=
 =?us-ascii?Q?jlGIwRdbsmgeWEJzVUT8Wf9MfGNyZo4oJfdDiBiWqedCw1YMoissyjgh4QwF?=
 =?us-ascii?Q?2VFVVoL72RYZDDeD/Slnf89adYbcQReNYo7jlUw6IKUTCVMMAc+4e5fYahXg?=
 =?us-ascii?Q?/CiocCQRx5I2gf39AR/IuIY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DPYw7I6GJPQj7r1ldLObTmPmSnqEXSFA6+V/dDHrE6EJ0oxRNEQvKovWPEXY0VxsVG+dz30BnFvlsImgtdtL5YX1p4RfTEP54Qop/g63ZkLq/uKMp/btI33G/NjxKltetBcJKB9cwMplfmk83sNlgsa/G7ECJPFXZvHC10cW2JYEDexU9q3nAqwAZ4SuL3/bkKUKhGvo9wiNazBTckBrcwEviyOIhS1OsqydxBbjTeg5w1ZhWVsIcDzC0Ug3KLdREsMOkKiyDoVzfbwhYRNBuDWQJfTaHwh/2CQpcA+9wqua9v0JppkoVIcRtRl1/9k0egWjyz4NnrT0qQhAw/b1FZYe/gjP3RXo/FIOem7AHBJYjq+V6r1WBlClRKJOOJk4X8qZ1myR6HtpHaYj90cvc8EQf7vi2PGZqgOq5zI/bDVZmA6pFly93iFRmmQYQwO5mWXol8RSnCuE+FLzbsONxhJ+sw8pAcz1JdSXGUO3ZRdC4PuctJhXvJjq2bbnMW6iWk4Tc1Cr9idb0mLggFcANnM6ZJPEMJ9o1WgOEOjmgWYe9FtLqCsWcbobWcQqfYk2TbedIdtItre29FaxGYvJDcpFniDBGw2+JAMvprpGu9mdhPNtEPCbGBEuSP84gIN+
X-MS-Exchange-CrossTenant-Network-Message-Id: cb43c582-23ff-4b7d-3bbe-08dd564b6986
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB7568.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 09:53:25.0541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4620751a-8ca3-4df9-92a7-6fb9b06279d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64UK2I6L6lHt+jHtR0tOUtwt0a7+bRHRE9AQmL3zNcJokQuxur1S91QDAqzCDjWQH01RWfxeyUpvZhajXZJMvm9F2JE/X2UneXGLuY7gerh2qPtFj6VxUTjMw5RDcLNE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8274
X-Proofpoint-ORIG-GUID: NnS8HnDUn4nZjPG748jTEqIxFTzOLPmK
X-Authority-Analysis: v=2.4 cv=Z/QWHGRA c=1 sm=1 tr=0 ts=67bee498 cx=c_pps a=FEALSKi4AvoWtY0syLDQ7w==:117 a=FEALSKi4AvoWtY0syLDQ7w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=pnnnEMm-AAAA:8
 a=HmD6kAHYlZBo5eqVHlMA:9 a=L1VgJ4hi7dtVfwbEAIjz:22
X-Proofpoint-GUID: NnS8HnDUn4nZjPG748jTEqIxFTzOLPmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502260079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 09:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211948

Remove incorrectly escaped exit value, which causes error handling logic not to run.
This resolves [YOCTO #15731].
Signed-off-by: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
---
 meta/classes-recipe/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 0bf171a668..d18b008aec 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -58,7 +58,7 @@ python do_menuconfig() {
     # ensure that environment variables are overwritten with this tasks 'd' values
     d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
 
-    oe_terminal("sh -c 'make %s; if [ \\$? -ne 0 ]; then echo \"Command failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+    oe_terminal("sh -c 'make %s; if [ $? -ne 0 ]; then echo \"Command failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
 
     try:

