Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24A2CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5927.1779102233644398100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P9Px2jjl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAvnx91174249
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8XPbZgjMin1DspNpFmFHx0ebJETBpd+3R1VKtxTZUs0=; b=
	P9Px2jjlA8kk0dVQY1FLKW3cz+Xd2J4Bz/NRIWrlvW5ecOQyTux+cX9OYSP0UKsR
	p5h6RPjfGgAuossHsKNOaTD6s0jv7LPij6fumdYV5Gz9QSZJ+7LIGRSei6GFDUz/
	cJMvumSFmSiHT5Tl5H/WSaPRvhqXzPI74h/Vghat66NhY+X4GOZFQQgRVXBzzBmF
	w+hqs9ibuRIgBlEe3Jcyg7IZzDtK4jZou+XjAdW5091KF/3wrLMlee2g8M08vqNV
	CZbU1f9rdg7sIbaEsIvQ0ozavAhGMPj+0RW/QNrhzzPRDWjXCWVB3wiOsqK7RtRC
	ancnbjvKmQFDh35KaW1fbQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1tp9-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEEEJwmv1eAapglhRTNMCUhF48S3TlONoxNXx/22P4bATvK5d8PqynLPYy00Bi/0VrJv5xf/eiytJJd5IvepJ+W6AzACGrqqzDHz9xU7uxZGfc0Zq+MA5KVaP1kMQYqIAK14tYMQr0Lez2l8uZkhruDsXA65XSfLIiFuKFu1t4RttlGmznCQFNV4Ju/0rW3I04PLMYy4g5sB5SvwBwvMC3vYqCtO4+H2xpaszoF7ElVoeMr8MQtY0ackNL7gSbfZZYtnOB+slKr/yB8Oce70kYq901zhN4sWPFDDGbndXvXy5LNrXpIAjXMfvQjSVpJsTAXmkVSbXI+fIGaGUWC5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XPbZgjMin1DspNpFmFHx0ebJETBpd+3R1VKtxTZUs0=;
 b=DJMwuLWbKvKjRkf0y20wt6fTkiTuUaZEXDsprGeIQdTsT4+eZJu7wNX5kC5mJgP7YL0Jjr6fCRB7zmY6pKkV/BDHRkLVIssafUiyVccR+RQ8iBII+kLHrHG9JCVbf49U4hpEzPFxkKnKfIEfhRlru8FG9NrcQTTW6RmYwQ7ki/GrzX8/xw7bEfa93B87NXvo53KiHfQ/FdurpXBb6cX9135RiKagh4PYRoNkhDKWdqVtvg46rKbPx98wocnTiAaRN28LNqIPXuM1ufSHHEPrX4IDjcL0/4MB+Gks7TDcnZmKgRIWI3IHVj08PjQjG0UtcuVozK+xyIglnWTh1wBIZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 11:03:50 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:50 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 11/12] libc-test: add libatomic-staticdev to ptest RDEPENDS
Date: Mon, 18 May 2026 04:03:26 -0700
Message-ID: <20260518110327.2347543-12-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a3bbb4-171a-4786-27b1-08deb4cd247e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yMBYL+57pQtPSKViu6G1i7T3Dvtk83Dn+qfyTc75Y49xe9TmZnIAE0p3LQXAAO0+a9E75mrCAjXvQfVG8dv7LB7YAylY6XOJtXX+cVl79D0qGiEYBkuz8GbraUyYMhaXOO2BXQs3TdNKWXhuk9jYVDcGK0TxUKHVilMmCWLal7mk2esFpldqcotjfvgZGS5l8QyxThqUD2jtAqVAWKoXUuAQLT+lu0aH4ur8DaD2eG9LZYqLdaetO8aKGjBLbgzNUKSHHhYWKElQLUjoDWR6XoontrFm1j/xNMiE1r4fwMG5t+T4wN66pyPEd17xTvgy7Z/7SQWs/Lo9/bDGX2RgSFoqtfGZGH1DednaGSuejbxaRJllvbx0yBgwYzQdSHX5daFxXatsjkj8SUF9LjolwExWhjKGApQ/XRZFo4NIiUa3u+dTxgJo7RgMGuEy86YYbqHv56UN/Qv4ZtmBjM5fsfD71z9SwigYDxWoMyl1SkzWui6pE8nJigAtKC0u1z30MlXZOqLsFmhtyESMkoQ/RxW0mG2kDUjfARma/kL2M5zU3xNuttDN+9BVEl3UBrjbhwo2L3KCBLglgK63Uuq2xH9neVOiSmkUJLH4qMqe78Ww37Gq0fSu/gR44zQ4MBNyLGwr+XUkVOL2u5VN6AvBbKuiKnnUNMOkKV63V0UFyf2B2fASgFGopicuq0v9bmqtYEMCNPOal7NGGY0BntfZe9JKawUKvsJgJOt7+Qy9yT9RRnUiZOUXoP9z/TPCYXHi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dLQU2t6X8KuFw3yxDnWBEmGV+JzFUqG+FwhLAuY2riB71m/LgBd19RgcAfY3?=
 =?us-ascii?Q?GvZKgQF8+0ZfJsjoKeX8JExc7Pyqddi7svLpKLIPDvJt4A6Fzr3WgPul2pSV?=
 =?us-ascii?Q?5axbsmQMJWonxgW6jtSrujWccimPJKkscFk1oZse4pJcvi/MF4iEvUbTO9EV?=
 =?us-ascii?Q?jlxEzezzXBiweLkw3p2gP3iBihEJcvHKgS8GUIDYHyn+kNEIX1J8dgCyM/ah?=
 =?us-ascii?Q?IaPubH806ezNhJvyG1OgziaDuPWG3P39fxP8CrF+VgS77bYIhjk6wn722xIE?=
 =?us-ascii?Q?66eaYV1ElyB9goq0zTF0mneBBbSglMNauV5K+GE6n34m+WlTim3tGgwHz1im?=
 =?us-ascii?Q?1XrN7UrQfMF0RCRmT7HLvFBYjIFFdWqq1fLSvcocTT7+4lrF4bqq+Bq0+3dJ?=
 =?us-ascii?Q?Jk7Yqis577FKwrSMNT29o9x91mVRof/wyvbmXlCmlMUFoH/nmXXQ3OBZjXVz?=
 =?us-ascii?Q?mi4nGvP6MzL0FWhmkWd+TPAxvQzGNfdvmUN8RsEDLVnNVKmhodDJAJYLw5TR?=
 =?us-ascii?Q?v/OvJ4LKKdnsbMHC3cFK6XDqO713TIsPYweoY0z/kPbcHxZRL1gWoL9qj9Vv?=
 =?us-ascii?Q?JMIHQad/uq3yR77o+nCw8/5iCrVSek5DVRL2ns9dZcHVwyXYWmCKpd67zX8h?=
 =?us-ascii?Q?Wt+DSBpWgDwc0G4tRWldCtoMs5Gt8N3KUak/sxupyRbp7b6+BEKiEZj19Rlk?=
 =?us-ascii?Q?E8zoCbGMEOJ1NwRVVxIaJxEjAuNT7H6oF35nZkvoGNgJFYOWl5JEhINzkXmO?=
 =?us-ascii?Q?1/lXCSqFWqulJzEUo4N5BaqM+Qh0Y4ZQVGkCuOMe7maT5RKDsnai15CvG0aT?=
 =?us-ascii?Q?THZMhH9Qp/b3hObtHnOk8sUNMz8bEKThMB9PjxSUnMiEl0ocG3aiCq8g67ws?=
 =?us-ascii?Q?1PNmVTa1ejhIYbfhahm77EHOye/zHZUf3Zy2z1nKDmkSzslBIccITW5qoutv?=
 =?us-ascii?Q?t8SVmDzW9FKUVouTiIk+ZeB7gbUgMt2JqJ7NOuSkuZPbJHqgybeuq4OD4MU9?=
 =?us-ascii?Q?BZMUOgDqo1NX86TxFWJFGG9m3fzph/IaOZD+yXEUzktsHdwU/gV5eh+uTw41?=
 =?us-ascii?Q?r1vXYQZoXTE7h2Co/XZjgl/5WKcDwwgNk+5EamjYuzNX/n7GVRUOsabfrA8e?=
 =?us-ascii?Q?yh6bu9Rvbz8t1pUtAar+oiDe5ZphvR/Nx7abIBsmyDklcj3JbgjZS2JjNzAR?=
 =?us-ascii?Q?ObZuWFAxZmbLC4IvGuHh23ImhgbMdtLbVsol018Jz+UEJXcH0ukxkhdvK6Uv?=
 =?us-ascii?Q?jBlb3lTJV6kG+I1iqHKVZO0ZO16dAT4THaUlCuila7sqs+sgzQ0l48+IDoUW?=
 =?us-ascii?Q?elidoUX4nXBqLakSuD4wZBBqcvofmC4zsbSqmXU1X+1u7VwdIIYVsRc1iMKy?=
 =?us-ascii?Q?b5qBIMV9mie4f0xg5BqlUXeZKKkCZm+h8IzToLqQneS6/tdgWbgf/4MdZ/i8?=
 =?us-ascii?Q?NU0+FnLytsh9zZX0fOzEBtATB+povwqaTIfCeGSgmW39twnyCkTzr2y6DVB0?=
 =?us-ascii?Q?lp2fJV7wg20mHEloS5zz7C1De0ZIXz9Raq9DgCGHrkZjsnX6yNkTPkg/7HaO?=
 =?us-ascii?Q?Fk8m3YWax4oeRVLhIvFU2jyO/gAMV90NI81TO8dq+oAexnTvbO9ux0mCWrbG?=
 =?us-ascii?Q?Se8P/qqP9KfDrr4xlrenm7KcUpunRecKa8AfgUwpitNuoG/ZAAQCwffpQoSV?=
 =?us-ascii?Q?St9fuS3LkBgeqXQthaBadhrUyls6JMF5NhRnyTm4r0MXGaWRy58+emMoickq?=
 =?us-ascii?Q?AiMUypJYi+UA0j+TRwRtAnl/bhgd5Ug=3D?=
X-Exchange-RoutingPolicyChecked: 
	kjxWf+BwVHkPZBsa+zdJ6/lX7oN2dnnqlpJDvZdJOx21olekF87LRznu2XkLFesLv4OBIWhK6BZ8rBt3rMXPR1vIJHvTFwCBIJT1tjgaEfZ2Z/xa2FWNNxUhXDvupg9edP75srGuRMkyWiTZQH2Bxc7pBo+dmfTcWS2Z9CveJBFZXtB7WlcmBWep/da5QY1TnySFClWALpaVYzPc2URdkNHce+3LpYbCC5OCy1G9ovVwYASRPn5VOZ7iJzMidSTRcv3U2EGABjzGVRLEGhKecLkRxnYBSx3YJpPQT+hhdQ1VlsuWCCz9M5l9og7S5XzPpkmimwmr3bWmtu62F5guZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a3bbb4-171a-4786-27b1-08deb4cd247e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:50.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5FhEwUtdKya/qazfAo4zM8AYrIDN2z9+yzFQaLM2etg0CxJIIX9kguvE8Y0ENzN+pN/MFptafb91muCGyb4VydFjO8P4dpXmPkKY0BDxbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: -sVw2x-33TGi56o9Yrcu4Vlu_iUlVt98
X-Proofpoint-ORIG-GUID: VMKEvyzPurWoNoOrQPAxZv_Z0QVyixOI
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0af219 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=Dw_uWjk0AuXv41BXO6IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX81aiFpgu2Er0
 ZWwOr58C/y/SuJhaNYICj2SYS7TYgWRNvlqEg310Xg+ZOemEXXGJhwDG0d8DsKCT8ZtXVRvGNwQ
 JqWdVnjDzQfgvZm/ji5xtlk7jHWdhxQal9vrB8NWmAp3ZRrsfjnp2AToC2hHUcf4kZwcXopaYF4
 kp7IYgc+Jraignui9lwkfVer8GT8h91AYSUEg+pY/u6VJP/nNSMO/jC/OXQ5+muaiEKJOXA+RB7
 q2I718l3hm8cpNlEEjjHiuw3altrPZk6eaaUfPalMnFh04YrW6BLIo47NQXq9mojHva1L2kEvrg
 JMb0wqA7kaRlKqSvPbeUyULNblr7ebtdsNT5FeK0gS4c7l3ix8VjcSoTsJ5HHRfNKBObCJ+arPJ
 3tk1gIfjBtQ9fzrNKLI80p0xq5tj0Jwc9tl5dBjgPWwbU4FSrLZL9xiHDocC+RtrYOBuSr1P0sF
 cbnC89EZc1GdWMVZBbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237231

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 adds libatomic_asneeded.a which is required when statically
linking. The libc-test static tests fail on musl without it. Add
libatomic-staticdev alongside musl-staticdev for the same reason.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/musl/libc-test_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index 9d159ea9d2..d9999ec377 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -36,6 +36,7 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest = " \
      ${PN} \
+     libatomic-staticdev \
      locale-base-en-us \
      musl-staticdev \
      sed \
-- 
2.49.0


