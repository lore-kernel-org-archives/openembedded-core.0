Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35E0C52D6F
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:16:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3626.1724289413798065246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 18:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89645d55f0=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M1E27n011993
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 01:16:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6vub9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 01:16:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPXSDUiSMSZUmOWvDtVUR/ErlNTE91R72UzRC/yoXUmjYPn6LJtKKS5yzsKGRZN11Xxc8/LDobcRFS2Ee20KXDBs4sWMeB/aBeJk+bhGaKJOR6WRAmnang2XTjkjkiHm45JJXtGHW3NdsOQ/UqEzWPaZtMhZL/fBQ0/THApWmV650T4eZZgMsEyw8zAJdw/9r92VkTeMh9SfP2/bnWoKlBVAe33+uJAVCpcNmaA1H7V2EQ9fw9bpETWs2lgXEf5h97XoBaQBjHzBNCnxLYXIQcnEfRPiNeIYK0fzXZhURvoXrxm9nbsV0IuHcTSe8JDPgHXWvapbZBAlqHvMaUAX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erBdQ1ZNvzptn3x6L/aocx95DaF9SerpuXfQ4jKLpOo=;
 b=D3UA2lzIalnmC+CdtMEDmNUOmc6QZdzlifcECAOaVftEcqDNloY0VuvSNVqdh8BGAifrfn/RDZ6nXq5mAbQrMcZS0P1xC4m5Lqfca/oDD3LF/xkTB7DyKIwTRUoLNzxnSIRU6k5P3KfPUAu11CIYVziXrtvPKNSQOmITnhNZsURaYktCNGJ5WTbvy25kNXjFnOK/5dgDQoVG2nRcklSM9wEmShuxEgDHql47fLgnQOf2sK0HyMvjcKhLBmxu+Dg2p5/pJG8e4LVn47pn+Ob/+GlU9otti9ZiAAVq5R+Ch4RmIaKsl3llDZAOPzlTeLKkbPVJ6EsQYOyNSUsYedWuQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by SA2PR11MB4795.namprd11.prod.outlook.com (2603:10b6:806:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Thu, 22 Aug
 2024 01:16:40 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 01:16:40 +0000
From: guocai.he.cn@windriver.com
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH] libsoup: fix compile error on centos7
Date: Thu, 22 Aug 2024 09:16:21 +0800
Message-Id: <20240822011621.2721757-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|SA2PR11MB4795:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed1d80b-f51c-492c-5862-08dcc24813a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z1hlYmNFSE4xNzVleDIvaGZnQXQrelBzVjBDemEyUkJ1RWEvR0hZNWtvdVhj?=
 =?utf-8?B?Vml0MWJCV2VtTE9xcGMyVDVyMU5kT29tUFI4b2VuRjczL3lKVzNkbS9XVFpR?=
 =?utf-8?B?QVYyUHpCcDhVYWNjRUpsQzRFcTh1UEU3L0R3K0hqL3dpL1lNeHRkRGs5dzdF?=
 =?utf-8?B?dVlHNjhmZDYwbU5PL0ZjSk43dXhZOFJsbG1HRXV6WE9aVTNua21ndnpVeFpy?=
 =?utf-8?B?d1UzRllNaVpwS2ZUYU5zc3hkZWNSRmFXQVJwc1Z1eWpmS1RJOU9jZnhCc0M5?=
 =?utf-8?B?ZzZCemg2ejQ5K0VIaWE3RHdSQjdTZzJiWUJ3R25LUk12emFOSmNzZjQwZFRB?=
 =?utf-8?B?QVF4OTJ3dFRIUzZyVGFHdXR4VnhDOGEzTlpGUGpCaUoybk1iTFlKdGtmZGtF?=
 =?utf-8?B?RFBwZWdtT3g2Wk9YVCsrSW9rVEorcjViU0hqTlhqbkVBcktXaFkwU3JLVGU5?=
 =?utf-8?B?QUp0ODFUcXY2R2NSVmdackl5TnRyQ1JIV1NlWjFMYkRlTEhTVHdsUU1HUDc3?=
 =?utf-8?B?ZlZkSWMxM2dYQ05YSWNLNE5SREZMODFKNHdLc0pvMjhYLzR3Q1pqZlVhYU0x?=
 =?utf-8?B?bE9kZ2RSdVJBU0ZmOHNKckZOamRMU3lLVzY2UHg5THpiRWhoMUlGMkpiTlpI?=
 =?utf-8?B?VnRXSEdJbFFuMUxubktWWVlRWDV2N2MrV1laR0xCalFsVExOZ05rVDIvczg4?=
 =?utf-8?B?V28wTDVOK0FNZXcva0pYM1V0ck1LRWRJNXFlcTRQSmZrcS8wdEhHelJQV1c2?=
 =?utf-8?B?K1hZb3JndTJxM0F5bVgwaFYxSDcxb0paOWc0dEhGeHB6d2ZlRXAyQmF2YjFp?=
 =?utf-8?B?czNkNDBaUDRSeWxUdHJmQ1BQZVFPSW9PMmlQRDdSd3JuTkNFUUdqR290SlFH?=
 =?utf-8?B?dGVuck5Hc0ZDUUhROFcrc2hBY0laRlJpYUFNSURxRDVJWngyRElraCt1ZzZ0?=
 =?utf-8?B?TUNRbGRaU2xhSHZLMlJPMS9RdmpmRy82cVd2RnZDckFkWWdCZGVZSjZMZ2Nx?=
 =?utf-8?B?NWErR1lWU3h0QlBUZTVjY2pPL0JSRkwzK2pZeW53YmZiay8ycE1reHpmMGJ4?=
 =?utf-8?B?Q0dzUkZuWmtkN040blFYV0s5eWpETDJoOUpDM1hXNlpoUTFuS0VpTDZFZVFh?=
 =?utf-8?B?ZlRRY25BSWN0MFRKSitLVlU0bTlVKzByMzBEdVM1cGYzMHlTbW11cGMxQzZ1?=
 =?utf-8?B?My85WWJ5K3RsVklJMExtNDhSQ0ZMemN2STJqaEVqZDNzM1k4TWRkN3dQcmE3?=
 =?utf-8?B?ZnNYTWlGekQvS1c2RFc1YXoxRmEybk4xU1c5aU4zY1NRYlBCQitjZG8wV3NT?=
 =?utf-8?B?dmxEbTVYRDJNazJBS2NNZ3FNMVBzVlNibkQ1OFlScTl2SmduWm04WTZudUNa?=
 =?utf-8?B?aXNyYlVSQUJEeDQ3dWFNR3I5OEs4dGs4b1RLelJIOW9XbmdWWGQyVEtWaW1o?=
 =?utf-8?B?bDhibDFYdjI3Q0F2NFFLOHFNZXpLdTZITkpYWkRYTTlYVGdBUEtHVzM1ZXh2?=
 =?utf-8?B?YkRyZ3pPUVhRc3N0VUZFYTFjdGNiQ1U3R3pHUTNrUENJTjhLZlptUXFSWWww?=
 =?utf-8?B?SkNkSmJqOEFvM3IramhTeWovaXFJYzBzNDZic0dFQUF2bnptUWNGZnZFa3Rp?=
 =?utf-8?B?SU8xaGN0cUhySkpwNlAwUzgvbUFtSUFJeU1sUmowWGtyNEJUWEJuZGtvRjU5?=
 =?utf-8?B?NWhBN1ltb04wQk9BRUJCc0U1MHJTUDQ4bE1sdFNBRXNJbXRObm5YemNITXJO?=
 =?utf-8?B?bmY3bTRGSm83MXdOdVNuWDMybTFyQWJjRkE0SGIzb1JRRTJLWkFGR3dOV2VO?=
 =?utf-8?Q?soRv/HeWsxdSNqdc9ry7C5F0bFtx2jyEa6Glk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RW1oL3Y3WDN1Z2ZjRnQyNFVHT2JURFhMUkF5aFNpOVRIRlh1MUJta3I2ZnA4?=
 =?utf-8?B?b1F2OFBMM1RiNDVsdzdqVXludWtwQitTUVUwaWtxYTZDQTR5RXVtRndrZHha?=
 =?utf-8?B?Y0FSWTIwb3N1OHIzeWlLSXo2T0w0YWpQdFVSN2hNVE9uelRCYWsvTU9wODMw?=
 =?utf-8?B?NDZHV0RHclc2NnhxU1A3d2s5WVVIV0twcjdmZ3RsVFdSUytjUHZCS1RHayti?=
 =?utf-8?B?SmxIK1o1Rk9MdHh2QzZpQkxQWkZoMmRWb2VIOWVjUDgxeDNsOG5OMXBtVUQx?=
 =?utf-8?B?MmVrWXVPdGlZc2ZTL0JOazc1QmYwLzhIY1h1emFxZC8wK2hwei9KUytkbXNa?=
 =?utf-8?B?OUhsaDA3YU12Q3ZycEpsKzFwSWczQklEY1VHbmxBbSs3bWgxTnlTMVZ0R09x?=
 =?utf-8?B?a0s4ZWNUUjk4K3V4OWxEL0c5NDZETkpNREdjUG9hejd3WU1KZnd2cXc0dWRi?=
 =?utf-8?B?MDUzaTd5TjIxRHlpakRXTWVMa0xocXpTR3RDRXVyRWQyVlVzY0lrNktqY2dH?=
 =?utf-8?B?UUpzY2NqSEo3VlBxU0VhQXVyY3c5Z3gzd2E4ZEpFTjNtM1JvOHJKVlBremVI?=
 =?utf-8?B?bVoxZG1KdEZ0d0FHTDFRdTFQQkdnSzhjZDdJQWpnVVE0VFVITkZFMXd1U1pu?=
 =?utf-8?B?elg0bDJ0QUZkMjJnTk4rZWkvZkp5RTFOdnowVFlvNEJLWXNUazRpMmdha3VF?=
 =?utf-8?B?YlpxRlE1VXBOeHp4TkpqdFVNdFBuaktvSmhQZkZJVlQzdUc5VmlYNUZOeXZO?=
 =?utf-8?B?QitqVE1HdnUxTnFGOGUzbUlmWFVEWFVXeWplMzV4YndtaXJNZnhTY3Q1V3ZK?=
 =?utf-8?B?QUlJUGJZcTdlTDRCWVV2ZDhyNi83VFNEbFVuQ25aNXV3NmcrMEVIWkoxUlho?=
 =?utf-8?B?cDZ4NDkzZ0dpV2VaN3NVcWpieUo0ME1aQWtTZUNna3RvU2tNdFRwUklQeFND?=
 =?utf-8?B?Vm9weUhzdjYrQmw0SmszYXN0Qnk4YmVxaWx5M25RZjhOVEhWbnd4dTFqMmZK?=
 =?utf-8?B?bHFhVzNvblNDbEM2R0s5aGdhVGJVVWFOZ2N3MlREL3Y0d2lYbzdMaDFsdVBp?=
 =?utf-8?B?bkcwSTg4c0IydnJlY2pQM3h3OG5SS2o4YlB2R2Q5S2tRa3ZFQ0JFZ1NHMWVD?=
 =?utf-8?B?eTNrdzdLcjhWejM3TkNjcTE0d0ZkL0JmTEZYK2N1YzNNY3dMRWpkc2l4WHNJ?=
 =?utf-8?B?ejZ0K0hUcWE1T2ZOVVRudWJVMnFOc2h5RWJiUzBNYWZpcVVBZXVyMHlqTlMv?=
 =?utf-8?B?ZVlSN29NL0pJNEp6RHdTam1BSGtUTGlmMXZyanhZdFBtT3NTYzNEcSsrbXFO?=
 =?utf-8?B?VUJmYWk2MndwaDA0N01GZ0REMDhzaGZBVm8wc0tXY01LZ21CTmNPQmFwN2JS?=
 =?utf-8?B?ckJlNmNKK3lkZ2NUdVV4a3l5ZzFKRWM4b0ErRnJoS2gwWmVYUUxiRUh6NTZ0?=
 =?utf-8?B?UzR6d0IwYXBoc2lVdXJIOHJvMzNJM0p5WnFDZXU3WXlNYUxwMlRJalp3ME1J?=
 =?utf-8?B?WStsZzN6MEFtalVvVXBxQmM0OEdPUUhGNndybEhKL0dUclZRYWk2ZWp1cmtR?=
 =?utf-8?B?dDNwNld3UDZqNWhGekpIbXdsd1Y4V3BTVURreVVKVnhUNDliTk9HWFo0RzJZ?=
 =?utf-8?B?U24wRHF1SnZDc3hIS29YanRMRWZRWm5sY3c4bWQzb2hHL1pRcE8vbGpFTXhn?=
 =?utf-8?B?QWdIa3lxNVBVNW4veER2Ym4zNnF6eC9qdmRJT2RmZmE2aWRlWjgxVGhuM0kv?=
 =?utf-8?B?L2FURnlxWEprVXlCOXh6WG5zZU5ROE5ubllvbXVUVkVXQnZYVWtUUnZPeEh4?=
 =?utf-8?B?aGgzWC9MUncvUCtoeWIwb1hObCtlMkpDU2JFb25YbTlXWXVIMy9HOG9UOXV2?=
 =?utf-8?B?TGpnVkZSeFAvY2FaRnViOFY4RVc1U1RRa0tkMENDL2JEcDJXcU02Q0pvRnRi?=
 =?utf-8?B?T2tDZFM1aGROUFk3WW5GM1R1dnorNmgrd3RxT3ZublpKd0labUtRVWJKZC9P?=
 =?utf-8?B?ZHdDa012K2pvOHFiWjFaU2lMZWpzRlNDaXkxZVMzL3ZTQXJpSkZ0Uk16aEdl?=
 =?utf-8?B?OE9KQ3J6L3NPajcrRkpINXZFVEtNMGpGYTArUWhrZE54WHdZc0RBV2t6YllP?=
 =?utf-8?B?UzJJZldNM0FNNitwZXVsa1cyUDFiRU5kcUJBM1dhdFJQemFuYUNRNy81a1FT?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed1d80b-f51c-492c-5862-08dcc24813a9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 01:16:40.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgOitcgMYby4pSr7LFILJmM8Faxer/wE89OQdfIWhql9h6bvbhzrvtou0vz8zuXREu19rAHEr2seWQUOIpYROY3BQ0eHFql7kP53daXe/Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
X-Proofpoint-ORIG-GUID: 3S2JpAerNt6EGbuYWfmKzFSDJ0pLhRt4
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c6917b cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=GHR8O2WEAAAA:20
 a=pGLkceISAAAA:8 a=YRHvXXt1AAAA:8 a=aLquMYcZFZkjG6VAuXEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9bw_jnHfPby8klRCszyn:22
X-Proofpoint-GUID: 3S2JpAerNt6EGbuYWfmKzFSDJ0pLhRt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408220008
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47M1E27n011993
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 01:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203612

From: Guocai He <guocai.he.cn@windriver.com>

Backport a patch [1] to fix the below build failure.

FAILED: libsoup/libsoup-2.4.so.1.11.0.p/soup-address.c.o
In file included from /usr/include/glib-2.0/gio/gnetworking.h:40,
                 from ../libsoup-2.72.0/libsoup/soup-address.c:14:
/usr/include/resolv.h:75:15: error: unknown type name =E2=80=98u_char=E2=80=
=99
         const u_char **__query,
               ^~~~~~

[1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2=
a23e31e83f815ab667c

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 .../0001-meson.build-set-c_std-to-gnu99.patch | 44 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-meson.b=
uild-set-c_std-to-gnu99.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-meson.build-se=
t-c_std-to-gnu99.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-me=
son.build-set-c_std-to-gnu99.patch
new file mode 100644
index 0000000000..4a7d189515
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-meson.build-set-c_std=
-to-gnu99.patch
@@ -0,0 +1,44 @@
+From c41784deb1d4a923007ffe14cfa676f785808f45 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 21 Aug 2024 06:48:32 +0000
+Subject: [PATCH] meson.build: set c_std to gnu99
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Set c_std to gnu99 to avoid the following build failure with gcc 4.8:
+
+In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-=
gnueabi/sysroot/usr/include/resolv.h:65:0,
+                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-=
gnueabi/sysroot/usr/include/glib-2.0/gio/gnetworking.h:40,
+                 from ../libsoup/soup-address.c:14:
+/tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/in=
clude/arpa/nameser.h:115:2: error: unknown type name 'u_char'
+  const u_char *_msg, *_eom;
+  ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f=
47c3376f21
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/5c3d431bdb094c59997f2a23e31e83f815ab667c]
+
+Signed-off-by: =EF=BF=BCFabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: guocai <guocai.he.cn@windriver.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3cc56fb..506c5a4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2,7 +2,7 @@ project('libsoup', 'c',
+         version: '2.74.2',
+         meson_version : '>=3D0.50',
+         license : 'LGPL2',
+-        default_options : 'c_std=3Dc99')
++        default_options : 'c_std=3Dgnu99')
+=20
+ gnome =3D import('gnome')
+=20
+--=20
+2.35.5
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 6ff393c9a3..be286e1849 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -11,7 +11,9 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 l=
ibpsl"
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
-SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://0001-meson.build-set-c_std-to-gnu99.patch \
+          "
 SRC_URI[sha256sum] =3D "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b78=
23b6018b40d01159"
=20
 CVE_PRODUCT =3D "libsoup"
--=20
2.34.1


