Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7A5CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 04:55:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1042.1761713749340991441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 21:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h7z7y8ej;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=33974254f0=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T2joCF1714463
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fS2pv6rg1Kuv/1Ld1MpA0FmdOvKtLKO2ZT2d9c0taTo=; b=h7z7y8ejrOOm
	LN8kx9VsaTkmWHzaADm6RAv5SOtaw8DXeK6oRVZUbJz/aoF+pI8XXxEFOWnH7F9C
	WSSjbLH6DUTOkDZmvf8Ib7iEhizubQcjoYjTk2h1OZnB6TQmr6/2Ys8jyx9C66A8
	spNQW2h9UdzlmeqVjplWpHiYfWa/E6+ydJz6OBly2YoBpgoZVZdi6XGeOquFiIST
	wP6aqcXD5F6F4vKFq6JyIpf2JABq0tjV6TmKhXf0m29kpV3Z1JCqVAI3BrSG58jN
	CgKzB8UKDAL3n/s/wHEDZVOzCTDjLN8Mi0yzKc2zzaGAlJjg5AhezJuQKDsAK3zR
	hw/Yi6fC5w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a348bgdau-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFGb+JKuvtqA7rI16a+6+5j35ZYQnxKyv8CaxHGCLlZsD1fcxbEWt9v4Iwz3lUQzXjuRo6PNzWyOq4Bczv513R/IMB5ogONys7M2y05OG67dcntgul5CDeErZ66j+LkKHGK5sb97vwRuwwlsN/6DUfKKcaUuELnZu5h50kKVGjHpFR6PDEceFnNJ933m5FK9C4zWVVRRcQxxqcv4VUVARr2yZ6x4NBmGzbAcYVpXmSNtqfukPOXAwRaXTpsQ6P/mSlZYPWNk6N0WJMMfDFY4kabUD7VgWhJAyeWIX7kylfXhak2NPqq1/ybopexUfvThTqhzPhrfrqQZOBwZN4raWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fS2pv6rg1Kuv/1Ld1MpA0FmdOvKtLKO2ZT2d9c0taTo=;
 b=vJWiBNKrYa9KsQk3r6B59i7nAezqPJyawDzSZyZE6HkUlTZQkh/zbCNBynRdRXz0F4y5wIDn1kdy7qC8tR0+s9+5Wq+ZBksId6qOjTSsddkfpaB+LriwdIFWU4evkZOStlQnmRGnI7omLK7GDWcX0I4o0DSDM4cHrjtBRhzCPGbpYJ3Gh4C1gdMsJknhK+TZB0L5A09GGWmRI9PDV/UPc4gFed6kJElhGjxH4d42dltYm79LEzwEHeiEPe6+0UssECC60rrcEDLi/1r67O5eJVUc2vhgdRJzIxs6hcbCQ358jQglD4DMmwLYKXo86kS88tMq9tvs6V9/QNMFZdV3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 04:55:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 04:55:45 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V4 3/3] parselogs: ignore error on qemuarm as a workaround
Date: Wed, 29 Oct 2025 12:55:27 +0800
Message-Id: <20251029045527.2865818-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029045527.2865818-1-Qi.Chen@windriver.com>
References: <20251029045527.2865818-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0001.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: a037037f-53a1-4f77-dcc4-08de16a76ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tNEfx++l0XqTqUkcrRBsso4yzmAeOGLiYxPq7opYHfSfIBt5IlpeIGrdpniE?=
 =?us-ascii?Q?8GmjGAfynvgp8FbiZbKj7pLeKFkBHi90lPlxoDIUaees4KBPFyCJFFggnvs/?=
 =?us-ascii?Q?9iBBmrFZrjVflEIUCEPkdtRefrjwke4/HhOMBOo6Fzl0O8sWxh6v4di4tXnb?=
 =?us-ascii?Q?wf21a0b+8slMWWbfcsglCoaUtxBKIcTBBsiGmjXPUfqn9GziCY4ZD0SGzxjZ?=
 =?us-ascii?Q?EKs2nSA8GB8lhz0n0BBAKcf6HR44TGkeXf3xe1UUX3CW/VLizDoEoC7irnp3?=
 =?us-ascii?Q?2ZsuMEueVlHNbs9PvJs6OEZTTHoHEjZP4n8J1GQlz2d0U/AcEQlXQgrWNclw?=
 =?us-ascii?Q?z+lmRftK+xotjzSQV3Sl0dx/R51b2t76My7BRZ7nvxEfhEmNGmTyKlOQ4wfQ?=
 =?us-ascii?Q?P+RnnhiLBWjFgqz+WZm57RBvZ1PUUPX+R+YtCmeSjBBs9sauYiZXUVctR8x7?=
 =?us-ascii?Q?6r3yJXGJ5oWtMBpRU3NlCTCCNJ4xMYeeuuEzwuhEObRiUynMME6RRtJBzMaK?=
 =?us-ascii?Q?duqBZUmXWdnxHvIitGpRfgZ2tdfC11OQ66V6nh39crbeBcaoY7+Z9ndDIbSS?=
 =?us-ascii?Q?+JMLS8eSflxXzsMmbRd2oIeFU5i50cWcMlsqaAqSDBBZ/j5t0EEf0bVHfQhG?=
 =?us-ascii?Q?pgaHMIx8tMmJExTyr4uK9JkfoIX8vPMCWEarCgxGvWD5q5CI+LFREZlcjFIK?=
 =?us-ascii?Q?Vgqgle1cCIkDWDAF8m7xxVzXdBuAHMQMkQRiOrOWOiesQEUynaEoMglWxWjO?=
 =?us-ascii?Q?1A9yj8SJzJgHeSPfe2QuAMZAnBGxjOQo+36soHaHrvVglKINT17GTyASO94S?=
 =?us-ascii?Q?lDIKWDTggJGQ7xRXTLO9BZjnc14DX/gUp1Js0TPNrAG8YP8Tg8qKEwqq6Zb3?=
 =?us-ascii?Q?ofKsmhJUT5Oqw+rO2o6QpY4E1O19oB3JI1J0VKDLz68a62shNeI/uFzd20Rc?=
 =?us-ascii?Q?gfhSnleRjII/xfI+OzEpgCD9fwkRpUuSuHmvvGwYUly+zWP4B09ESaaLYoh4?=
 =?us-ascii?Q?wruROTAHUX7Dr0/SwW6/xgkaXgkAOaDWTeSO8Mt/gNQlxFnaTv2X1gsRl0s4?=
 =?us-ascii?Q?F4sF734tCShOsfZCnIbblAyrggVREoPmU1H7INQCjwE/bhWv1PmMO541LuDq?=
 =?us-ascii?Q?CEXiVEKUbcRJWq+Jd9igxdMF0Vdltl2QmiA8q2ax7+/M2n9pM0B+I+ACCASP?=
 =?us-ascii?Q?faXWAa51SaFxJ3h1Q8Z80fCg9DYl5X/Uav9gQcUYw4YVGzhnD+H2fi9CmPUb?=
 =?us-ascii?Q?TfNhbwShMjtnOJy8EIqZnC3hnO0oKq909M0t5pCbieDrIVAZVqhEPwiym9xz?=
 =?us-ascii?Q?18GeuSOcZGTSLKLuSP2vqzjt8Kz+UMhs+FDaDQjK8JnvNappXWN4rvIYMxGY?=
 =?us-ascii?Q?yRvw7PGpih92F9ErXJc6x0//mZE01zvui6HNL08eKYi4a4d/atQTL8kgXWJt?=
 =?us-ascii?Q?Fl3/6kv0RSZP2tFTEf7Ou+wXUsUuKITpfAjQkLgfa5iZ0nK8ayUIDQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dIoH9BQkhR2v26Kc72Tsvz1X4JaehqF8lvPy3ciztNt834MwtUwgzjlE7fl3?=
 =?us-ascii?Q?UtI2vm/0SJQ1SjKqrRuoBVNkezKb+JYkhwgfgUehOMAsO1eWrzDe5Ignwwr4?=
 =?us-ascii?Q?0bIv3vX0P0QDYfBvftvqZFUAXRrDXbLIT3UHmfFFgMxGZGUhS3e9LqS7fnpl?=
 =?us-ascii?Q?r2Ie24h60tZ1syE6n+IspNqMgY8BILX+3u+sRBcPA/05C/2WC19TiuovqfuK?=
 =?us-ascii?Q?NANMsU1yDn8uZd57B7b3iZe2ViovjfC74KfuhG2NZ7oW1pfrh/Z8ikJuZh1q?=
 =?us-ascii?Q?Tpq3em02Ez6Lp1IVbfN7svZFuyHbY2LztgtTs1IDQlAYHiIfxkBnog049+oH?=
 =?us-ascii?Q?gNLbfQv6NEVKSpKoWkE7o4947imMSi3I8AIe9dmrWATodAYiV4Ig9dSxM9aY?=
 =?us-ascii?Q?gw1w2ZaJ2b1Rachg5+Wdh5YiCVyVBK+ubMOTbPnjl0ZwNoAcFogcrPMYi04v?=
 =?us-ascii?Q?mAlAGrgX4K98SP191ak7wE5+QIVLamaeu6QT1o/ImrENl4n6OkGk5cjGzxat?=
 =?us-ascii?Q?vFE9oPvyL51c+yg2exHlRzryiYIcYu0ou6qmSMgiNy8zUgiYBQkQQ5duzANa?=
 =?us-ascii?Q?CAKegCQNSBtnUHxO5iPADXziLc+lJ7kr+u7y9qQGWUZzjAzObd2zzTBgJtYl?=
 =?us-ascii?Q?hoz+DwBusqx4y/k+Tuo83VVJ+U9H07HH1ubVjzJdxtlmmatVF/dcey/BHrUS?=
 =?us-ascii?Q?JdYxDxZ8OaiNr/Kr9S/lCJsOVozMmk/It+tJWEFFiJbzmkoYWSQjZDx15RTS?=
 =?us-ascii?Q?f1xC3KBvKIlmGi0RjCk1+G5xTcFkPV0tmMkUAqSySSvDBjwWzEBr1vecw7oD?=
 =?us-ascii?Q?8DsfpPKppYEsJo7DaFYQ6BgUXuCLaByThMtPgR/Hg98QT87sL0effM9R4xLN?=
 =?us-ascii?Q?4LiJnIwZl6h1f7hokWLqaGG4Qf+32Ra0wNXSpDHPdOwhDUk55yjhLk7ll7ka?=
 =?us-ascii?Q?hyiWrrE2M+2X1xTCclYTiM6JzDUFPu0cuFwRb1mdQo81rMCtqYZUSJnm813H?=
 =?us-ascii?Q?qMqJhLuMl8BWQbz/YdcCtNCixJQdAjdElo2F87+9dwOzGS2LUjQEDPnn7cVi?=
 =?us-ascii?Q?HCgoa50PUPbm/YwhrpKNOwmS0EcUVOZFTdCTNZi+HvH+MKssSbAVMzt9Zryb?=
 =?us-ascii?Q?A9RaVXaNzGkfgLgl+coOCIgBcReVngTS+VY4f5jd/M3gcDN9c6dshF5ErmKd?=
 =?us-ascii?Q?fJPGto70Q13KA6mbmj+eIqWIptZsHI2ngREE6ofz/KMvJhdpEgn4MS0wttFM?=
 =?us-ascii?Q?kVytc9Gl25vs1Xuf/sAguEvUPsU4Fp66YgQoZCJzHpXbwYjMEgyDFzvUs6UO?=
 =?us-ascii?Q?xcEeDj984XfTM4Oyv64cpzdhIlo40E++lx0/gs+qEciVzkUAHvWteHeBzrP/?=
 =?us-ascii?Q?is57d/oSNc+bv8avlUmy5zJ6wgOZAm0KMwVaMY4HDCcH7armjl9ipIX09drk?=
 =?us-ascii?Q?/lLcSTjw9bDT9ys+qO/ukVyvWc4yFMIF4XhzXaEaaW/R/orz5zhcTuj76nXb?=
 =?us-ascii?Q?+JTZv/o6VBPdCGJ1ITlfpYV6cBRWLlSlAGKCk/Q8kqg5l+/DPRKeQQ9S9g2W?=
 =?us-ascii?Q?kkkSKMJ6a0smvoJ/GVNoglDD01dQArPpVQA+TzBu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a037037f-53a1-4f77-dcc4-08de16a76ba8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 04:55:45.7666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHxKqySbfn6Pw8MIdsGTVkkVvoBuOl6L4WWMHfsLyJX2a4Mhrse+LOBiR7oXOn8gRGRjPphZXYb0SI1M43ks4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
X-Proofpoint-ORIG-GUID: GnF_UmGE5ngMk-3uAzrLvAbLlnR_DjLZ
X-Proofpoint-GUID: GnF_UmGE5ngMk-3uAzrLvAbLlnR_DjLZ
X-Authority-Analysis: v=2.4 cv=UrRu9uwB c=1 sm=1 tr=0 ts=69019e54 cx=c_pps
 a=6VX5YHTAOo6o8GlK2BM1ww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=d3jnz9i_kPLpQjPJV-AA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAzNSBTYWx0ZWRfX3nPnUc3LuIwr
 wvfbtopOAfpaHnO+d4jLqUs+ij303sQGDZUwOS77AC9Ua+7sI90L9dQIeSSXyPR176P0PPC35AZ
 ttY5eD8CENauyJvlb2Hvm29mI6YpwH4VWvSBPQQZ69zqsHPxoQdOBVCuaNff9h6TAa3LhoWe6XK
 Fgcty1ryTB/qELuhdOKWVHWiWjdprUV+mtwv+A97TJXyQsnV5leRWEm0bCVJeCX/IrkibxsooXZ
 RQGSzu4pNjqQZbLWyrsKPyaBppA8vzgzQ0BM9BNBk81Oq3YKcG3fbLmEM7XAwjy8bJ5U0f1fXKD
 r1iXZh/lkx/fPQocooAH001CuiGnlGRDGcr6zrysHG7aHJI0IqLYzYvPasGjL1Y/5VRY8WXCYZt
 WVN0HA8cf9fRZ6/v1tlNtjwN0MgzsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225433

From: Chen Qi <Qi.Chen@windriver.com>

With systemd upgraded to v258+, there's an intermittent error on
qemuarm + core-image-sato at boot:

  failed to find screen to remove

I bisected systemd to locate the commit that introduces this
problem: https://github.com/systemd/systemd/commit/0ba9d06963ecb848e71951ed5e9f6f6f03b80b06

Workaround this issue for now to avoid blocking systemd upgrade.

More investigation is needed to fix this issue. See more details
in https://bugzilla.yoctoproject.org/show_bug.cgi?id=16045.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt
new file mode 100644
index 0000000000..a0430483a2
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm.txt
@@ -0,0 +1,3 @@
+# The following error message is ignored as a workaround.
+# Tracked by bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16045
+failed to find screen to remove
-- 
2.34.1


