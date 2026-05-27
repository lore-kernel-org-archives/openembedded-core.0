Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CFBCD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:35:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20554.1779888940760926948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GdWwxPlM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxt8j3067731
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=foi4a79sRi47jTDa7PymYyCCSCoCuj5NCRysM39K5VI=; b=
	GdWwxPlMj2KTNrUiyw+sy72dbyj8Bl2c+oey1HxQOmuYwO+GyKiDriBeSyO/Rb8q
	QiB7lY5MXNayvh/lq6RDkNLRscLBRRgdKh6JQz5vc3cdt/cYfoTATf35LFpxFL7t
	Qr45nsswaYgvWAVD6r8zksOKpVIpKTkTITppZrDt8TmZtFa6LjaSmorSdtRq1XMX
	LWE8D6XCJYO6RV7wOfTrfmhHw6W1NfSpYsKX10MZKKPXcl+Paj+OVo4VC3awwuS2
	MCARi9llbQM9hU9mox7Tnv8hMyhY4Tyl0u5+HeCkSC6ShshdHXD3GIIrA+lba/KN
	fNeVMLHUM0jejVXbGUa0YA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dytx-8
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aN00e9NO+k96m5cq8/ZNZs5rjkwddqBIOxBxkZ0r+F2orBYj2BoGJqPuJh9xmEDbTIxbe1vcpkTrp9GE3ZE+sHc98/v9QtLMYEfRKLHnC10ni60il2tBiI8cpLdXv36xqzN7ycnwacugEu6wu38YkH81uX4JGQ+Wb4ckWGEfMAZjdlCEiR0Os1N7k9iptGUYIa/YWOLoe1Mx9jUn+EAGhcqe+8qW4nv5akDSDD3wJLW0yvMkQh+GjAm3iF5HWueYKMt7ROOJQBTCmWpGloL3CGM79b6kekzBAvc3HojMUCpDAAH1XnAqgv84z75pekMZ+jwpIDpj5mgFyOyG2jsKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foi4a79sRi47jTDa7PymYyCCSCoCuj5NCRysM39K5VI=;
 b=GgFTGQRvRaPXIyxWAcZHyPOTvD/sP1HlbmKhlWd6UrcX/ramUkt5beihsrShCq1IBjxGvE9n6N5wy2v6pTfU5kjhIjulyPpn/BUAiP7ZYjsK85PmkoTl6XSuvnBdSVHqOJd+Np3rb1iSA01YsjzN2Cp4h0CoG1Pxk0VhXo8OVJg/K5tKbnObmUX51AuEDEfpP6K9Gl3lZ0IN0EEl+d8gxF0C15WsZE78GSMgT2W7o6PGNBc60EP4oqLprLG5y9c+hnyDuQmoJz6UUVzc5JywSFc41Ze3gg3PUNzPluekqEaMyibx7xoeahkc/OFDwXwffIwrm137jHH+25MM6sRnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:35:35 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:35:35 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v5 7/7] libc-test: limit libatomic-staticdev ptest dependency to GCC
Date: Wed, 27 May 2026 06:35:13 -0700
Message-ID: <20260527133516.2337150-8-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aabab84-b1b3-4651-5a3c-08debbf4d537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|22082099003|38350700014|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	kves51WoOQ88oBNQcWT1gJTjpdNrS1IkMYCT9x22HwtGEHEbvSckbg4ZsYTD1fScNT5d1TPhfAV22ao5HPGYuaJ0ayYisf6bU3trkgh9YtkvO3FoJ4VodkagAFhwTV7dSjUHfASs5FD/Z6vss3d4TDVUMbmFqMiEEHNLbrZ2H8YfxJStazipgZ7aFSD/+v/peclwBK3wmkFiPLiv0J96JT8M2sPJp75o44J/LrGZKesqRjsSfI/pFWlgNt7vOSkMr4jtflPu5o1wLN3OfKzNgxCGQ60u3KHsw9tRw46g7nlJRKmjj3DBLBYjVPNqoq0fAEFYNU3lEdgVXMgkRCq1PLKWuNOWMzHBSldEBC5psG2ylVOd+3E7aI+J4MKTfKhSdDOdafYoL+YqfH8dp7FWwvAhHGGXhxh6Rpdi9yi+F/YKDDQPKskA6DXJnV5sb9HTaAWJm3HsovAyUl3ENcow3dtGHpYR9UnwvE+Vr8CmBtCeWKoCLALdgMODB/pxX34+/mGPZHvEccM0Cpz2vw6P4h3bQBURbHspctzHwmJCWA0v1W2f3Pc3IDiDd0/JaO/mM41UCFcKnxRK268lM4buycqROsgc23QOhBh1lTUvQl/+GPwQ2AHfR6o3O1RyK+lKIIWN3DaxJyVX11rRcUf3/xgtOv6shRTxIK12zmSigMHMJ+fopsU60YnC2NuYbmLHa3JgdQa6GLzHq8Sx3ixVHyzrgDZolUS50ii38g7QCIcvDjHf2ogC4vjIqMF/8MBs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(22082099003)(38350700014)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m1KZTX+JEvLN5RXwN4vBB379RX5gJVfMmv9xTrAAZpmxTRc6PNlzxXbLl/t2?=
 =?us-ascii?Q?gDHIePZrUZjVFj3wJL7svRtlHXhbewIyhSULlTQTRE2bDI+OqP/zyWEk1HKJ?=
 =?us-ascii?Q?EgF0kt8OuaNga/Vji4Lhfw0N15UM4opdBwoFX44CSQj5Kob66mzpYfNaFJTh?=
 =?us-ascii?Q?iGMlJfvlCzG02PjuHxqJ/vVdqHbOI8VyXGkvg3RGn9HEVndn6bKz+soQKN/8?=
 =?us-ascii?Q?Mzs8zYUa0RFYcBDXp5G8B1Paukt+zeHKMe3kzwE6DZGUSnLzmYltyQz1CbTh?=
 =?us-ascii?Q?hjQg2MIRzbaGLe60aV3teJh50WJw2DAi3TGZXxyr4rm6TpP/aCQIdzeDDCxc?=
 =?us-ascii?Q?ypUv1dhUyRb0y74CFWA4cG5vaxvRtY5xshMr1x80P/ixQI1ndMSm2aOWmKdS?=
 =?us-ascii?Q?JUiJM8qSj9Dp1hdsMQcIaah/wlyIl7XFzOLLvUgoYscm1GdavU87Ojyz/Oya?=
 =?us-ascii?Q?ccQH1nfXFqcfF+jC5O7nlrldKbQtQW/uY5Awv6QqnbchtQA7Da7srOkR8/+e?=
 =?us-ascii?Q?s/9+LEdmFwEeLphosPhjzlzewgdMoMGxlFTHYXTFlNKsDTQkGCmrgkusBEOm?=
 =?us-ascii?Q?HsBJGNPdMH268XZcQ03AfXI18fYEPp/4IlB7i2wVPXnDyBWHGAI7H4xwtl/+?=
 =?us-ascii?Q?cFTk+YpG41Cw/nL0BDbLkGlT+XFO73VbtDjJwZzHb94eJy94stfPpsQbbsR2?=
 =?us-ascii?Q?oJMDa5VGocX9KLqVgKNHcR/reQoi6et/WnUmoEHoulvPROD07Bt+cnqubzk+?=
 =?us-ascii?Q?AwfAK05wK1yznWGoKPDTaEsqxziUbSupiT5vkbPOdTMTQZSGG6zUsFb/2YGJ?=
 =?us-ascii?Q?ak8jrHOAcMZ+uJHXejIfv1XPRZp779K2pvWqOnzMJ8rgqHOv1zmZpp6iPKNP?=
 =?us-ascii?Q?B5XTtvYwnv/SUXpri+7t8/JyIM5i1zFV30QdwhtoiKe1ElD4SOwtX3T7EfzR?=
 =?us-ascii?Q?qrwd9aOOOR4J4P7ZS804fPCZLjK3nQdFzjS4xJ3+GcWEzxHCc28PK7VmiFEL?=
 =?us-ascii?Q?mrWbiw0UB9D9sbVVmjVlcpFQm6icU/hEFnkgvulYTujf5gLJ7Lt+1mwLNjvK?=
 =?us-ascii?Q?6z6/71jNiawRJpl6YwyPhYTYuiP6FqaALJ3QAQN+HYnGE8KLIYMeDmHbxWE5?=
 =?us-ascii?Q?GqqfvIhP4D6CUnurIkYIeWyM/RKXhU3eigcY/ww+wUGNdK/sow5aqHpbmYPz?=
 =?us-ascii?Q?pUfKrWync0V+M4TcVivvEZD9VDSZMFU9W8v1FV/mO+pywWjzrBcKvfjuRLxC?=
 =?us-ascii?Q?oYctNqgOapLeRkHlmoNeeS7QOVJf6Xzlv4zkkf0z5VR68HOfi6YAPPu6UtSQ?=
 =?us-ascii?Q?sDbVg7I13ZtJPwbGY3cBZgyXTRToRcPE0GvgAbfRe8J+5kXZ3mp+MzJAj0bR?=
 =?us-ascii?Q?Tw2a/r1lOPkhSc+xMOjJZrpla64EZg51HeZZu3n72qPE20rz4y6QzMsz5WXX?=
 =?us-ascii?Q?oHQDjqZ94qKLb4Zv4Fwg7xEYLrdwc4TYs45ppELe1o20JTl+A0FZP8BSCRlr?=
 =?us-ascii?Q?pD3kEhNiNxgY5PTXLOhaWJxrU/lIJ70jbjXhcSHaGN4GDDSpPX4RcZ8EwJCG?=
 =?us-ascii?Q?4vz/l/Ai4Mok1bk8Xs7Rnk5rQkX/WI3Upd14vDcUmWrFt0QSlkp7+ifoW+BG?=
 =?us-ascii?Q?9dODUUsCxv66DeqHSzbw9bZm4aw2HuMScdDTLXwePwtcRpTdenHzMtdIjdWw?=
 =?us-ascii?Q?pNM7HrXqRmLzXm8uSCtNlEnwAI6ykHqKaoIUpUdNbgyTguUrLu3IurDJarVq?=
 =?us-ascii?Q?781yZkbYrqEC2PejNNCRsMPvOTghUJQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	GbhJa/YqaPtUig8seZ0bRv8sjmbNOi92YrtWvAS+B+tObsEMMyjwv+yX5rqAzlFUsjHSo1N3CRK4b27RcUt442WvcnFSej2PJhrhhZLy/Blcmeh40R85uVnTz2jy+HySThshy2mM9rJQY3hvVYb9XpzROAhWOrporV5x6A73bk8cHuBDbp64hMH99UguiMXb8NOUfWwMQsFIwNJYVsuI+SP1gH7wy/mbeH0ftJVK6EG1cxRVfMOBqshF8QI5Bk4ENURmNxoYkBjBWwrZ4DXZtydREMVdAt3aScTyOTAvvZ1Win5Caj5ARn5udFsguXdhvOI5ovA/ZTg2THjdC6oL3Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aabab84-b1b3-4651-5a3c-08debbf4d537
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:35:35.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5itqs+YpQ5THxy+W+2M+QT6Pmlw8GOQeBzMfz61TtlrLqDpNk4asKImyMAgeWeqBGPIWkBQILrnWIE56TPPUFnC4dPnvPAUDhfgFwPEEU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMyBTYWx0ZWRfXx55LL9CO8eTL
 W1Rcpqm3XX3QE7tpV75nHwXv/0GpH/rU67FXslF1GSCevd2d9YQsnxNEsdvonv0+X+V970NI2Fz
 EsY1ZVXJKALAkDq8gXte4gbTWxBh1Nehcc2jFxRJ8F7th5xZ44R5rWaM+8nd7H2vunqm5r8sbQK
 9QtZN2XpXGGc6Kq5A2bym3hiMBhsHgudsqRW0AYE3FmsSeNwlEV9i3Q4dLO3q4r7J73ZMZueH62
 /9gIs9spBPAnm+0K4S5WQk8OJsHGkvRREySpRoD0LepPs6pTpL+uFsHkYD6eenxi/Ym+S/Xe+yI
 vXnkGlG7h8DvY/AOhNQNCSgE5PbLNvi62c/rj8pEVfapMO34yBqS/FxPUKuj2b2H9QqUbMq5B+o
 /fvISLKhsq/4xMe4Fh9ujJL9/313CGrL1zAIbxNQ0dKoXiKga3zR/D4YNs3gxNI2Z87AfWfSzK9
 F+Zyg3g0dtVW2lrQobg==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16f32b cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=lPJRS1RxyxnzQ7hN9tMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RY6_E4MusJhIzLgyAbya7KSE5sdYWDqK
X-Proofpoint-ORIG-GUID: RY6_E4MusJhIzLgyAbya7KSE5sdYWDqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237668

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

clang does not require libatomic-staticdev for the libc-test
static tests. Restrict the dependency addition to GCC toolchain
using the toolchain-gcc override.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/musl/libc-test_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index d9999ec377..15a2ce42f7 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -36,13 +36,14 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest = " \
      ${PN} \
-     libatomic-staticdev \
      locale-base-en-us \
      musl-staticdev \
      sed \
      tzdata \
 "
 
+RDEPENDS:${PN}-ptest:append:toolchain-gcc = " libatomic-staticdev"
+
 install_path = "/opt/${PN}"
 FILES:${PN} += "${install_path}/*"
 
-- 
2.49.0


