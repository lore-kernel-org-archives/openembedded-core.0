Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031CAFD4F15
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:45:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1320.1773164696882358806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 10:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FiySzWb2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75297c066b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AArC5l2882629
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8HZQzy4XNOeQ7N2tsn01YN9BYHkyUN3KPgZAirZO2q0=; b=
	FiySzWb2vwvys0NI6lmpkUP513dLVPsvJCST30IdpyB6I6iPOuk4Hvb1zVdnRE40
	jSG+qBXVXnM4iE/Zz6a+tPTiNagiRkW10ti06rRtLbMt+dtUco1BC+FbdqPKsKJG
	ayAqaJ6A5pAvVgeLng+MqzXuE8eKl7BWmq5k1cQQ/B6AAl5h4zgBZ2tLR57XeX+Z
	A1OZRp5BBMJ5eTwL80xNs+BbuzRx09DotR7yPj+2CkI2xgH9++qEdPh2HpDrsldw
	aQnI69ijgD31YwE5O4hnbVQ9nqirptj3FtXESI6UcJq3hnfX7bV01taqIY8sOR6K
	O+P/D2jNAJMuyDn9dZGXIg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010018.outbound.protection.outlook.com [52.101.46.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb083q9s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:44:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFCfeVrRw1uCM64ZO3Q7Wa3ymic67BczEjG9x8csHRIgJ/Cd9XZNRaG40m2JlixS4hDpW31TrgpTg8+yu2/LTeoAj/4FiuxVlHvQmQPb8dPfPE2F5XMcPT1JkdAtUxv+qavTtueBX/VnCe2ks08WNCBM3kfzDIHSz3U49GvodHTA4bhDj1tOP1Kq7XNXD8D5qcp1rSCA5hck3W2sHFnAoZAmMfK98a6Se3OHHBq2tGVJJOYH+eS/aI2ivL5J51gX53gWXq0WGIWlsvFmfIiMp0AbGQ++e5IbusWVB3G4uLZ1ZddagJaiw7L9LIH3zJrmi1PbTxxInSMPeU4z5EMINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HZQzy4XNOeQ7N2tsn01YN9BYHkyUN3KPgZAirZO2q0=;
 b=ThSp6UBN4oRmOh4H9GQvTr+CAntBkOfuJ950V0QpbiPZi4W3uU9PVwxwSC3G6UCt44IrD4zPZEIfHom6C+jSecV54ZOXsKlJv/T66h9dlQBeYfH4uBt4a3pkQA63Ut9vJvgDiagGIeM73vpQ5n/SQ7HIQ9SWUb3TjWnC1G4g5GSYQ5EBxznl/zTdjHWRXTcBtnFzkm4+7SD6UiupZfZYHmFO3hp4ihwtjQyJhfB4LNgAIUQD8XjRhwjs9qKYWqSvd6URYz8AGctcgggkmBlE/li/EZGcfe5ocG8VG/b5MmLQdMFPx1fWKzH/S1iaCa4GGn6TyViCpm9ntawFyAzAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV2PR11MB9538.namprd11.prod.outlook.com (2603:10b6:408:378::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 17:44:54 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 17:44:54 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        Hemanth.KumarMD@windriver.com
Subject: [PATCH v3 4/6] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Tue, 10 Mar 2026 10:44:01 -0700
Message-ID: <20260310174403.2309825-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0580.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::16) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV2PR11MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: cbfb8a3d-0b69-4110-a805-08de7eccbccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	egeDSrRoZEwo136/XSTSLKOfnZJfDSUwNeC88itXDBpexZpZSZ0JadDVyGGlzEQUGgOKFB0pfZutmatkfo8WNHkMkN7+wxV5WJs+inQ6FG8WwWkLQwwlW2Bf2/iPeCc/ADpBhxxecC4GrP5c1xoGc684UpVK6iaI164EeG388D82zdOc1BiVnYiuAFzvJwcM1x1VllZiUzJIdcNgEbrRZaSWHhxSSihjpCuLhGt1BefbjP/YtHzJAoYYWcwG6ysGSka53AeFIsbRXbThv+c7LPUwR7rGCQCMUmSesmSnayWkmhqWEEZIw4YvrEZTVo6qNDe1XWv8A9LdoptsDoaJw0bonGpr5uSkTDb94M5er2bzNeBhBfwa6vqc56rKfupp01aNlwmXC1TKhEq0wXDZIk9T5lERcTy77HB+4gNeZlUIr30v9q5mp5S58Q2kp6SzltkqiWGa4swM2QJHMsW/tQFF4qdWoXjSIeWw6mYmjM8uGBmuKbW8BBXanMXQDQMznU7umCQnkWbcUyVacubLxewnl+OZdKkc0TqQVLXK00Qh2hi7wi6D+t4mdal4RfTUJghDeGHtNfrTvt79VxwAcmNmq7xYU7WS0UTqi6C+QjHVJgnyb+qb5fhYhOR4Jx+GqshSm7nPHM0kBKG6fyLiy1htzJoSVCGQatxL+bEIPfQatEEApnpC24XOcGeCdUjvHfLYuMjWZ+KDnv4C0HAZ9IJEJ+AgACIh16baTcmmiqYltFpfr4vqPA/ZAbtL6quNB1LuKIXnr1lwK62oJ9jPiJUHS9ImZKSnb1Qpw3l6/yU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+whpdB9iYBzWhF7L/64kRa8uKxjsLZiq82YWl2bZ40dr8UkHfMjs/jWLFm+V?=
 =?us-ascii?Q?fR2OI2ebhYic6ISRi5ez434ofe1+ozInx7n01RUqAlYDYwFnsqN2cBgOpcob?=
 =?us-ascii?Q?nh6/ik4sBotBGm6BjWbxQwx+33+o1CocFtn/V4tbaszjucOzmOp4n+KYMIMc?=
 =?us-ascii?Q?JpFd2KzouKgvs/mKzk6nfD4Jlt/mzBWVxd9UTnylESsxXN5dVE768aA040pK?=
 =?us-ascii?Q?oa1B8WIdgM0Q4LE1DzAmZPK+Oz+3NOIuv+FMMwaLt3knXu199p2Qv+gVorw6?=
 =?us-ascii?Q?6kDUaQG2VdFJo0WAw02kmvpQXZcOky8y9kRQhZYi+py1uqWVQNZwqrD1dEHW?=
 =?us-ascii?Q?KtON6mDMCBvANf82ydb6h4BtBMD8xDU3PdLzw3ebxndGoKQ+6SqVTsi0HKQ0?=
 =?us-ascii?Q?q9DkGZu1okjvJG0eCyCi74hlLLfNoVDv4OGqTW197OohixHau6nXrxJe9a2m?=
 =?us-ascii?Q?GgUSmDgmgQffAzGMjA2NzHDPLxSNW9IoYId4kYRljeUVpSoOkj26k2p4fVwM?=
 =?us-ascii?Q?nvOVtOpLHVv5hVFtBleRNwh9Z1ZZftzq2ZUEkIY4OEcVv+WGdsfEfsjmL+yH?=
 =?us-ascii?Q?Wl6Twvg1ehuLKKW/XHMT7EHtjC8HfyIqhFKUAxGF0+m//8NXX45zd86qE7lm?=
 =?us-ascii?Q?Pj53DPn5f+0Qr7xyrzsRX583ZqPClWOExqLpCyw2Jt6pKYGZgSzgv+3x9F4S?=
 =?us-ascii?Q?aNmLF5TRO1ONNooht1CkonFB0hx13d8e+IhY3U7/kRUxEU07z4KDKifzXq8D?=
 =?us-ascii?Q?/HzqZNWyNKsAZB7u9cZQz7RF/L2K+/Ggzk1isGVbNiXeTqhybNXDDxdVbxQG?=
 =?us-ascii?Q?MGMCMxEUvZ71yvIhT/7H6feB9gZn8FnkfGZC9YB2zHoSAxX9ua5agk0+z3Ub?=
 =?us-ascii?Q?bnHLC52SOyBlEgVW7ovK832l96knL2Al/e2RSG163THDIozsBxpitWo/OCBu?=
 =?us-ascii?Q?oqAQ06cgG8nJ98bggvEesYuWuIh7lVR92rLAmK7NgxOEjySMRKJW4dw18zgt?=
 =?us-ascii?Q?Id8u2xCuWYn0J9E1fBoccpQ1gzo64t9/QHFZS99so94Fwq+4aK15Qk1h1vJu?=
 =?us-ascii?Q?oaxUYMg64IjmAHzFTW91+uvqsuyXIUNeVaWsymUOXVmg4RfX3y/G4GhrXIIi?=
 =?us-ascii?Q?fcSaaXNvdmvoayS26Rl0pk2TVH0gf3Vg6Ii9KMtMUiPUGjHOTvZPy7JTvYxz?=
 =?us-ascii?Q?csTx02iFXESebYEwIGk5UXvExllcOhdonIYYMP1R7eiXfG6IfuaYIUVwGZXu?=
 =?us-ascii?Q?oJ5X6HS8CUGAZceuZUsR49rEOtYVCDfweDR7sSD4L7zk210OYijczcM63vpz?=
 =?us-ascii?Q?l9bN6ij+YDgjAalN3rC99BlD7t0DR+wpn80ymqKOooMsxJMXMZuKFgP/OhSu?=
 =?us-ascii?Q?uUyHyzDwFIgbgQ+y709MKmPG5mmnsoiKMDDHTAoAYC12g9tcgkwqQ66RDKo9?=
 =?us-ascii?Q?IlTWe66Ol6Yp3Jhs33EO856OVgR3z6s6k31PQGQ1SLsRkYSRmWnLqzkulBMu?=
 =?us-ascii?Q?TFNQfwSYkfOHZe3+R3d4VAVT74f7M6AFf5e32QhF96cRvwf7176x9Ik7nogK?=
 =?us-ascii?Q?QPLq2x/wfUDYFPzqmtiMu05VzEx/4kfuwYK6D1aU3gICMRFmu+RPHteXflMV?=
 =?us-ascii?Q?9LjU7OH5TJkhC0AZfpvmW0Os/wK4A2B9n00JHV0NEaG1lYUsU2IAK4FKSziv?=
 =?us-ascii?Q?0n9VRS4D/ov73Uwso5mGhEV04Je7Xfz49JjqnW8naOBpXjG3f6K8ut6fHkKM?=
 =?us-ascii?Q?JGNIVJy1AUp7VVwUuA7hAnMFQlK6Rrc=3D?=
X-Exchange-RoutingPolicyChecked: 
	JBxmE5oDkfEMxAarTsIxU7LCIgDMWgaqvfViZeov3F1ftu4hy993piEBVOcD8swhSSrWgCTf9bmnnAPvFz9ZDOkPULb/swenijmdWU+0l3XUerUhS/Gswn/334d7tODqEYfj1SARYJCxCl8bgi+TVAPc8eO8QIRndRrVMQVbT/pdKZIWGuvh1YO1NG+bwoU/CM+YDcgvNtB3dllAIs7P+gLiOIZc6rKL7NmRMwCgs3TTiQlWvlJgHvj/mgDlwRpP8hp4ANGng76NLTfhMhzTh/RDtsPTNyZwdVilBfY9rWv/CLQB40uSYSsWN9oR8pYfGdg8FjtkLDtmcGSwZNjXwg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfb8a3d-0b69-4110-a805-08de7eccbccc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:44:54.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kpSIWtPtD8/iT4xiGTMvi5velhGvP3wmwOSxLEj/OEmabcg/0+y4LrVzmgutDMKbzITpYcpTKY6ZzpgKF2sFtYpL0jLp7yfQ4UUcbyyEkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9538
X-Proofpoint-GUID: THYRKsidKGnSSYFcpIiCrfP4aWihi2I8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE1MyBTYWx0ZWRfX/hWA7/i0hwv+
 uu6j5Tk1fw6fJM2iruCOO2K3jrEfUYvMKHXsMxckAxtpL/yObqwVheMd4RPCujLZ9xi2FcAWmA3
 QrlDSobhSGE/N5kqqjI+bKCOj2zN3teYEcROpxra+bag2LVqAOZsrFf1aMocKUy8PKoPS4f9h0H
 T+6bJ1W2nyV3e6PH49t+EgLhm4Y5z3p56EkurwV09Gn9Q4tYd/BgMNe0IZAP6Fe0h01NT3lUrFf
 f4IqIm/fs/ZOoWXS+efeppWChXYkC3dyOeAxG/mT6kJuWG6bLT+Hlixq+goyCURjEyix+bME7ax
 UIXvh18TLWQ/gbW6WpBeJKBfYzzDSLUYr7U3OHNguEAenJfSFUZDz7Ei5mPayLeWJd6Criy1bIJ
 ATB8Xt7S1wTTzeF+uwyJg1U0rbFADPHrozRu0gvwD1Yf8xPzZmo5g/ti+r6vK5Mz3Y35GNmD3v7
 VA0cCpMjne+J9IIqjTA==
X-Proofpoint-ORIG-GUID: THYRKsidKGnSSYFcpIiCrfP4aWihi2I8
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69b05897 cx=c_pps
 a=xtX6lszn+wSwJ/mzueWfcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=tMzWTzsgICAPQ4D7orcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232804

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building nativesdk-libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9aed0b9d81..c9cd5e6ef4 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,6 +17,7 @@ PROVIDES = "virtual/crypt"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
-- 
2.49.0


