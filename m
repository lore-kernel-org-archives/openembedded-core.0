Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB1BD3E77C
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 02:41:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13588.1765420862621729332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 18:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UC9xWCti;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4440812756=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB19k5H3824354
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:41:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=FCU7DyHow0Cyx2AwDa6W
	LLOAsGqSp6t0QdHQyfqttvo=; b=UC9xWCtiMfQhip7bx57PeogEOjogtSOQZVQQ
	0Qdp20MaM5/pbl4oRIHIThTXi74evL0udpHZgGNZGCAlYqmgYSwNgUQkbqYmZmh8
	aEzKTP2HS8nAm0JF/8VX/pis9nFGBIWCwUjEjekwfkZ7/8EHtr26p/EUwjcXYIyX
	NZHA+3pHg95ieRpseD7CkgCuNfrESxNcA3qexSeXe0X1swSAB2TAo7v/r8WJbcAf
	KqNsXD0tVtBKnd7VviyY6LS07Qc18juyuPsWNa6EnASzZZeqQlVUA1icybG6Q6VP
	1p9l3PFfuNVznAY2oB80nUJwI0AhQN9o/Is1H2+RCsIGWxunkA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay022shvb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXXbgnq1sj9uMImUhjGAeSX1n7PEw0aTDowdQl0C96uDIp1mPVpI43TeGwynJtv+JNpg8llgO+JXAtJEpYUxTvMPnyfVAY+KwD/PWJRf9nlPMFea/md6ErHH4K206V209bysETWQ86tORGXpTtxQRccYcfdi5mo3s+zJIq9DCenRD+N66JiLIL2/tZGBg3eJ/XN6PxsqZqnKJasMfHaBS3fsBKQEbwwFgoxnF8eR3zOSxPc7IhXurrsuz6XMLJgix08wQI7tAHFZ95RGF19a13jExlk99S8VY4FfIJ/HvatPCFAP7MSaPCTXzhYXN614gp7dDCqW6JB36uIZt0Lqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCU7DyHow0Cyx2AwDa6WLLOAsGqSp6t0QdHQyfqttvo=;
 b=lulOG20LruuQd1ZhtdgTm2AXx/Ne+N2CMderhQY1jSMq0ufOW7Je5qhNiRNN42FQS4V1kljnXpPt5fKlaXUgB0PkF9NzJvp2+fnDHUAkLqQTT4L1GP2FrkeWJIQKEDLZA2yT+eEMlu/d8FPxsw2vepc9kMEP6FooA8S3AUxpsQqsPhYfRtNdoifAoS6nzug4qUu2C922zyxsO7HuKRmwqABY2VMCLvz0gRC4E/CG1OnDv4Zx6cWxsOpiAyDSn0JpNFkzV3bqciuPu4wmr1vzZ5fou2SCI+TTVXbpp7BkVQWRrAbrp/lpdKe81NmJ+Jz3aiXDXAFrttrmqU7dLdTsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB9501.namprd11.prod.outlook.com (2603:10b6:8:28e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 02:40:59 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 02:40:59 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemuboot.bbclass: make nameserver configurable
Date: Thu, 11 Dec 2025 10:40:38 +0800
Message-Id: <20251211024038.4089969-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0165.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS0PR11MB9501:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0df09b-81e9-4236-689f-08de385eb736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jYLdbMIdA4A3pZdHIjtx9lCWJY0EMG0Susc3JXdF/RkZGqLZMyREMhG7ui7N?=
 =?us-ascii?Q?VppqReF1OcOoJKGj3wUqbq2TDz+kmk+vCs/FS4O2jeBvOPkvNR7r9bSQwZ2V?=
 =?us-ascii?Q?+EjhjdV2uFuFFjNCZnBt4SavOe+hK1dqhD9K8Evhuaz9+zcHXYtm+HtTz8eR?=
 =?us-ascii?Q?becV7DOCawPoPJsvzCrbc7v0BoN9nJjRD5uFQ0xc1+ArZvbOjRy37DWZPyjf?=
 =?us-ascii?Q?1/LuxEeM1fAtGO8844U392MZUUdZ/X4ziD91lI6fC0EyWRQiyDS73EW66X7v?=
 =?us-ascii?Q?d0TcOZMLbaDGMX968HxUkq9a1frBhLK8UI5+NsA15r9gDOxqp7cE756FpQLg?=
 =?us-ascii?Q?CeoC4SOdjhSNQX6wuAwjAdc4O6x0PGr2nw8ngWkrdGSnoiTO1JEsQ0p/uIcf?=
 =?us-ascii?Q?hgH6rf69OYz5joCImYl7rOqN+EvRFvpq2etUp0nYtm5gZksOu4WvvFxndbFS?=
 =?us-ascii?Q?N1pjRYrrHHhY0YPKJz82auZeYCk6L1jdESKHY+4i2AF3OjQn6QayAa91aLvC?=
 =?us-ascii?Q?+CUdNEhnHdldtWtVTx6CzCu96ejvh5tnpib78CWQCMzzI9lCDqvfsSjTz2Cv?=
 =?us-ascii?Q?oEqyL9CZRX4IMDCfZVkqOxrKXro2teVtIkpqsSO5ehV+L3fmWwObeeiroWbj?=
 =?us-ascii?Q?yqpkPdIkTf8tinYQUwVtduhDpUBqdeD+pNAN7wYLxoKPwziiXl6SNuMzPqs+?=
 =?us-ascii?Q?3Z/OAGkpMidWNf0yxkgjzLBKYtFYVR6wzBv2Z9AlDE78ow7WUDJuXbBbes12?=
 =?us-ascii?Q?56YzwY5oVY7aW+hpVb5C6Y1E9YkILNcvkCjUqllf6LD8EwJRq/c6gA4wrBr7?=
 =?us-ascii?Q?BvmqKIqZ4vkDZZtgp0G7P7SB843OwIpTC73T9IeXi7pwUXNTmlugpfrPx/cY?=
 =?us-ascii?Q?+pe4ds3+wtpm0J3Kpv+4lSzQHZmhPofRe5yuqQSm0wbUaRPUu78C3YdUKqSl?=
 =?us-ascii?Q?7Q9ZWBeA2evbkigKSHByeQMPUHMDG+wN7yHnUNCpRC+KZrFZ7QMNOg6cCPI1?=
 =?us-ascii?Q?tq5FA7u4WA3X2DJ1o8pZcHZNm5gdoXv10r58NfPhVmPp92drE5CA+nLV5fYb?=
 =?us-ascii?Q?3d+gs6KbuJLyYAMVdgF7JaMDJJw+kQi48ueHwcE0Vtplcg/BUS4Q335SwIka?=
 =?us-ascii?Q?ItbGV8MgdXkypzUUVbvqcEn2l7tgCRrTrqA3cEen8Lwha9Pe0wKEka9MsBtH?=
 =?us-ascii?Q?hqiWHqWVikmJ2S4z82o2u8db7RT0LE8KQs4fhO4k6wLs9jMCmg0r/KRlihLa?=
 =?us-ascii?Q?KgwgK5qLC8grODn6A0xMV2Ju96NnyXCZCHYuBvwpUrum34woFzYsvOSVKU+W?=
 =?us-ascii?Q?fbmGrVu1VWMgCRgLgTnoxKVSxAjxyefyO4I+vFv3tAgLFtMx7Q7kz6+AxnWz?=
 =?us-ascii?Q?UGm1MkbDnid58tr+Txh12g4jF9vQM2kIwhTwDMYYdmteWXMRvkbYpJyp86VJ?=
 =?us-ascii?Q?XyBIpper9NpNEJHg1byJjpnfaDoAwH70gvtexCTddi/53j+KTGH1KjkLvNwf?=
 =?us-ascii?Q?88LT/ytz6KVZROvTD7bdEN8iORg3/IirtJUJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bPFRX3CtyGGi1tuiMzsAyrbhF9t+3LYYmeIEadJnspVmRGBB7iDG8PaFXwy6?=
 =?us-ascii?Q?3WzFpqMCWJ67OY9eTCHENONqYwhDsx3xO1IfQWLMgetdHVYgtcTG3YJxdUKF?=
 =?us-ascii?Q?QTYJFc5O/iofmOJ/+R7VpaPRCVHb/ZKSc4oXRHiNjSk1heGVMc4WFACkHLkM?=
 =?us-ascii?Q?p0hGQ/mcyhUZU4B7gBGgIfzkiZX+4CO46Qqzsks2rrXO++mRVeyanFV4ojRf?=
 =?us-ascii?Q?11f2RhntmDJBZd2Gy+7uTUz15EHwngTzyrjFe9TBd9eo56TON5mbSKOoDJjf?=
 =?us-ascii?Q?z4oIKkTOErpUg3ingTC79engYwOtZ1rygmTDoTaGDRgLIcjWZjJkpLSESAM2?=
 =?us-ascii?Q?VUcdpguCgFsxIFuTbT+Hx+PRvI+nH2mgroKWfECkdbB7oDqjNHSN60/C/hio?=
 =?us-ascii?Q?QQdNA6XpUsyr12I689EpHs0FuhZNzs8zOZ3Afs+mRP1wjK1Z4R2AJC01xrtC?=
 =?us-ascii?Q?NQBNMsEpLqTMlvdso/6rGjQ5ZEx5t/VslEYIKZH9VWbh4wno12lsCSJIMgCz?=
 =?us-ascii?Q?j5OO2E72GZMxF/MWnw0s/81dmCuUx1h0WecXq9ZjlArWrW2DcLmqrvZZaobp?=
 =?us-ascii?Q?5u6zQ8uJwP3NpyVKeFAfqx2Vlk8YmIOXrlxHMIcrZpEn3Lg7glJmgvC9s5tQ?=
 =?us-ascii?Q?ypGI5x15Whsjjk0wea5dogcHdh5ZyE/XvmZfIGkj/okye/d5bizABUTpyhf2?=
 =?us-ascii?Q?BhvcuLEObPBENzWAxkHL84u5R2szLrDYRQC2QlpDeYqHB9w3pjmijnEWq0cK?=
 =?us-ascii?Q?8wSHBqna7e8aGsBYv5rgGHb1SQfcoS4tmEqEg+MooaTuRHIsYokPxgSU5UvY?=
 =?us-ascii?Q?ZwYapzmFnWXsImzmfgRxQCrtsBv2x5qonVo1rx5y1mmCnSwVE9e/vw44MdwE?=
 =?us-ascii?Q?u1xWhrVUiRRO8K1K2RaIyLRtDjnrnTmPhta0E2AStWImGc0G6JDehEHfbqZL?=
 =?us-ascii?Q?CUTGnsrS1ttD8C2CHEZb4xOsezzFdC/uI/zalrth0VqSW9nYqOkUijTqkCvh?=
 =?us-ascii?Q?IuyAVYdz3Sge45vOoryxveuypFth0dZivmUFeShpJfLaBiO9hQf7VWLt4i6M?=
 =?us-ascii?Q?A02JAWz91tQUNhMXmldOyZpFmNL9EEo40eEQiuGnrV/nSz6e0pJTpM0OGw15?=
 =?us-ascii?Q?nv7bR/VeNcwQ6Qqgv/mshNQBZia0RI7DbipVEb5FltPaPmGHLGNg69Adr5/q?=
 =?us-ascii?Q?FhxfG+upY3MfpjOW/poQoIEOW6H1aTNQTe4pXbZmaNhsuOSGZ9rUSa8bKUwc?=
 =?us-ascii?Q?PHyX8bXwoPvOCWEaMfAj5QPRadiMmi1kpnp7rTC6nbkPqrXhxpcijy7w1aA5?=
 =?us-ascii?Q?srrDp4GHawLRTZWZgH8a9y2HhvMfSKOD6r3Eol7616Bw11xXbwos5BuJdYJb?=
 =?us-ascii?Q?q1SBdDUrkOA06gOEWUtl3Ce7NoPkPXKKqaWi+eYamauJ2jh9QKftKK/Yohow?=
 =?us-ascii?Q?NWIi1tf7xFQo48+Tk4ZZ3OFqnySaBhqlAvd83UNjrLe63SWoW7bH0HdzADHO?=
 =?us-ascii?Q?7Ho30eBhfV5y+xy+r0BclEsQyf+TiG1ZRyqDpfuIwf/2x7h5eF93cEQLZQUk?=
 =?us-ascii?Q?u3C1zcki4qCiOvR9kQ9/q08PxjOCPQwwlnUSQ9es?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0df09b-81e9-4236-689f-08de385eb736
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 02:40:59.5478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lc01G3miUguawqSj8/7W44Uq2hmWKg+JEcB1YMyBiLLA+UJixGeHtMF2gBg7yVW1Id4l7dk4+Ew8FYRLDvxSmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9501
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=693a2f3e cx=c_pps
 a=u7dnV0yUwpVRNDUrCOcuvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=YyPblJXfQVqbtQJxjMgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NmRl4GmikTu3qzTFK__K4j_Lppl6LUMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxMyBTYWx0ZWRfX6QTt76S79Lq3
 rFy0X3/V1vaC+7UuMMd3eE7gCdIs7diiszLzZTtUCMEEdbFUnorh6VY/gLvHTJDK1wJUuA6HJK6
 6Xq6Mlp6IlfCq7dtR6lgz3/uDbSI61G4mRLqFq8TohPvKVlW3jZaB2583PI1m8ya9HxVcmPI6YY
 JanaXqq0Z5rHMzL1kNs4KUVhluJumFkkpA6lNYEnzjR+oS1Ba02VdDsjnnFzCY4uKFcjOuGtdHf
 E206mFUSJ9IQnBI8gOBUtLszUldSa5wK6ZoIvJbvP06O9y7/JAo65W38I5shStWDQi23rJayU+B
 FL3kc5gpHSfb6RknAG+vTHSqaKYkh/vMbcu/Rl1F6UsIx4MGGQ8SlAfPXueBxHVt9gNTk2OslUp
 dSX0Hr3TiPZzTtW7uH3sikOETNHkBw==
X-Proofpoint-GUID: NmRl4GmikTu3qzTFK__K4j_Lppl6LUMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 02:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227509

From: Chen Qi <Qi.Chen@windriver.com>

Instead of hardcoding '8.8.8.8' for tap interface, we introduce
QB_TAP_NAMESERVER to allow nameserver to be configured.

This helps improve runqemu user experience because users can easily
configure their nameservers to access the networks they want. Note
that this method does not change the contents of the rootfs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/qemuboot.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 69cd12ec54..6778c15c43 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -106,7 +106,8 @@ QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 #
 QB_NO_PNI ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', '', 'net.ifnames=0', d)}"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
-QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 ${QB_NO_PNI}"
+QB_TAP_NAMESERVER ?= "8.8.8.8"
+QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:${QB_TAP_NAMESERVER} ${QB_NO_PNI}"
 
 QB_ROOTFS_EXTRA_OPT ?= ""
 QB_GRAPHICS ?= ""
-- 
2.34.1


