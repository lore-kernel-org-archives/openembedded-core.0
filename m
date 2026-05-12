Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB6ECD37BE
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 03:26:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67448.1778556399239412698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 20:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AEFqjj68;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95926deccb=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C2upuO1097474
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=h5a4TInFqd8yF4Jbz65UwUUfshjZUuu9jGauKZ/4BI8=; b=
	AEFqjj68ANJGjIiFtjp7ioSJwhe3GkYjwmGWqU+L6UTEaQWcMTaZu6zlJNVWIpSt
	enoYRM7TlN7Ip6qFIz6C4h3k3iYcZ7UMA16+sHHiuMFqfJIKrdR15LL7fnHwYCQu
	zoxnOKjnBQLo+hzmJNwjQc9iSpotp3ujMfQqXi/33iSBTvZ5y8vfyOC+jMEdw4Ki
	1VRsMdj4A4xJ5wz6DfOUnsGUZUBkApfifFNshBY6LQOU6ID8WNJxHsNF8NPjexbp
	YkuUlyvSwd4Bo6QN7eN+rECt4za1fotdsbjhEEviXnBW3Vw9lc7+PHFZGB6uAvyA
	s+dEeELOfQwO0rLAfRH4Mw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvc0c6n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 03:26:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrDi+ntzDKJzKbJtpX+1A3E00OdqQeA2YRczxvuY+e8F8/UjqAc+cNWZJV/H/5oXBdizVvjeREw+HMU/OCzVMe/6/rouxUakeWQ5DS0AliFLnU+pAIn+1xLpQ4AK3ZOLJfI5ywFamkeyvl3juwnlG+f+1iiBrCpH6NjLBeFSkuIB0k/snT0A4/C7As4YDF05IOeeucOH3C0C5PxOgePwIRPfHvJn8DtqxpsR0hpf4S1N+ZzVE5JC8/u+REsU0zFeN+lsvW7SJv1/AmY9K9yrvoQ3qeO87NjnnpziqvH+mPlXhLUNLgSKaVeT7sPexmdf5J4qFsemeuMHVlxSAj81cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5a4TInFqd8yF4Jbz65UwUUfshjZUuu9jGauKZ/4BI8=;
 b=MUOq/RgfbcLztcf4G5PaiGcZv+9tKGa5xDdK4WSqtL1AG7yDCf3Zz6a2N85ydoJa0DfcH+h6ekiPesuPQI1+yr8GCocVQuqwU/mDupR9nXve22yIQppYA6Bb27jvplHVek4CAE2f6J7QjPKtDpiROaqHRg14ypsFdE/F1xmW5U30eG2ErAzQQ/JJ3wPDsLM4eCTu/Pco/VYfwnweNNlFsintP4Jg4DEt4hyRZWupBycXM/EKyJ3YGcNQI/wlsiW6kmvtzs5gauYOO0hmDyDwezPpWgioZx4LzM8PtNr50Bt0BAIDpwitjoeWTy3gGBvvSBe6q2NQ2/D8y48XlY0g5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 03:26:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 03:26:36 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V4 3/7] vte: inherit upstream-stable-release-point
Date: Tue, 12 May 2026 11:26:10 +0800
Message-Id: <20260512032614.2814369-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512032614.2814369-1-Qi.Chen@windriver.com>
References: <20260512032614.2814369-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2542a0-c49f-4b62-9b9b-08deafd6458f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	WMvrfJeRNzKoTxHLltGAUT00tWTTkfNOH1HIk0aeSsNM2qAnXNKXiGmGRWYaFPVmujtsa9cpLHx1+n4lg7erGerdGIVPk3lR1e6mo7AnFO9HICGIe6mjtug+UC4Va6BzuuuXXLmGZscLYdVOkQYgl4F0otjZ29R5EFSooff1UOizICskxTsCS2fIXAvwf2dXpRKe1QOzw0Z/RpAdwGh4tRM/uURudC3XgK7uHkiNftJjfMTvM4NkUhcjubYnI5USB008puvA2sx76EIc+w9I3fZpBCDNF0HWtwTsoVsHnuNwxMbmvIU0XrtH46qcjhicTM6h0XYWMKiaFZC1bxsSvJvBi01gAVWh7O4QpfUgzbTJO4WoQ3YXVNpcbaNE+2ww1T4il/9z+1jdn1HDx6Mv3zVgEpDy+l41K2OJjc68DAK5TpMM02aD4snORtS45X4B1PHqygJB59jpFxZD8J4X1t4u6g27lD1h/dcuNSacjgOkbRxt0Z3H73T9tSl6K/xvRmhSZHoDcxZdYmiBKzHmYWb/cQ3zQPMpEYcbQpeBQftYav7qYfXgTj3Dc9wfp1AKAKdwZ+0IWpgakOGXnZOn+D583Y1apLiQqFvakwuTQ6bZTn2ykXmjayKtWpMsd6Mzys9/lHWuFQFN5qoJjmw8J3s0qSbQvtVZKtnM+jJoKLU7xCT2InSwSILYlmCXfDWkvaMXW/gLlS85C2rxfEaF9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NucjK/LTyqahiyvqO8HzCkeOQE+AVevtpR+OadtF0RXnWV/NjcDiAvvRWOMn?=
 =?us-ascii?Q?P+8yrL7J7IjG+89mopxOJ8qPq9B9blDGYDWEv/B5KQnjb0TS7ZAMazW1TFaw?=
 =?us-ascii?Q?zjA0TMfK9FMPTOu04+XO5c32ghSCqPvuIjuDE35KydWU60XkS432oA+sVnZj?=
 =?us-ascii?Q?rreAVmaM7KSqTQdtxdLKQzmtJ7esRFkEk7OKY4H3OQxXHldDq1ce99iPg8yF?=
 =?us-ascii?Q?WFv+dOFEN9u9+EMU1btlfi9Riu79ovEzMEoMWbBS9ibrpA6+G/rNM1smIN0F?=
 =?us-ascii?Q?l5j8+Zgq523TYd+FHwaBT3rn97sezxDYcA0IaHkwEXiFQWV+8MXK73xjNTiW?=
 =?us-ascii?Q?e+SMy2o2/bTXFn1L/DheHQWcHaraJVXHF+3icF8+IAGu4Nn5RiXF9T1pr5ki?=
 =?us-ascii?Q?l3SzAR7wArcTqOR7xC2noOVpkOs2N/NRsUYHf6x2qv1WO/N4YqiWu8mDBPBo?=
 =?us-ascii?Q?LvIFgGv6JzrxJziPAnan8Y72DW13ZyK9nA8G+aGoCVfx77u8G38cq5Z+vMb0?=
 =?us-ascii?Q?gscWEgDnOVUTgbog0dUjkytB5JStC1hbePz/qXt4WPzHS/pk8MPPswq2s3sE?=
 =?us-ascii?Q?mOrtvRG5UEkv9ZZWXdlAzYLPCbGKwsr+Ui3YNSoXcotzgnwBsCwxnttQqxo2?=
 =?us-ascii?Q?2YC5+aIlXY31tD1WmbIs6u7Kff6OCRYIW8XxgfJYTOdtFctecp5sqVZoKVD6?=
 =?us-ascii?Q?79MTy/9szLpqFpfy/x+xnTa9Nh1r8mZNyCxTtbMh9qGTYnnDeqoqjoKB5JXl?=
 =?us-ascii?Q?lc2+G5rsdet35OS0IuFsvF2W3qRZhxIGj1eyV6S5y9tvv2ESkDCVpvEBis1z?=
 =?us-ascii?Q?+OSA0UHkqzHczbouoAnMiOtzzHtVtve9PvpW8ZjO7azvvg2LhXFGY+Xu7c6Q?=
 =?us-ascii?Q?+byHnmtm11DbViE1d2QpRMGuhEEscklJ5k1/wTSNOhBs5/FSgOxUqr/rtp6i?=
 =?us-ascii?Q?nqv5ZZQVFx1BqZd3JJUyEE9Gg+90hUnnn10y3GdEAH31UNqCcsJ+HlzfP2eo?=
 =?us-ascii?Q?TcYMfipaLdmwDIMDYhL7T+EKHRaW9Ab51tjUp9TfYX/QUuCxW+gYU8omGEH2?=
 =?us-ascii?Q?OAsTnUG9e3V53PLJERri4BdAQhul0cz8D5yvqmiAGmQpNGCFciditCUM/JMI?=
 =?us-ascii?Q?UMKky7GUytyc/BODostNB/7P7p2VvCNyUNM7mFhDCPBtDReOs3DT1GpcQUER?=
 =?us-ascii?Q?BOGW9PLi/n2Yy8IW6s3oW2i7MZ5NydDaH5gqbXozB3lli2y2iblramype5bn?=
 =?us-ascii?Q?tdo9FPVDErjcFzeF/naO+xXPm2LZmC+j4KN8m6dtKr7T8jExcqiyfB3V/d4P?=
 =?us-ascii?Q?s5YaP/czOaGyASdDrdc9PDtgTjQCBSMgO9rnp29JYZIcwGDL7z4/VZRiAu7P?=
 =?us-ascii?Q?pdM4C9KXXKgVPJunRfQ8oHiq8Ozi5fcDuR6IHPTZrwMGLHJmhjbgwVSDfv/p?=
 =?us-ascii?Q?Q/MwDqi0NfwjXJBgloZ8zwETWXms76EjLa9MYQ8qP4gB6g/w9aLtttzcH+uc?=
 =?us-ascii?Q?BgpIPTlx1x7SopE0aiw5403VpqeZ6CoS4v3SNWuOPMvl7WV4lHFdmEDBrgkV?=
 =?us-ascii?Q?yNe4pZ4DPsNd+61EC75+g7+/TwdKwA8TuuSQzZ7B8Q2PdgVg2jILezbHMKao?=
 =?us-ascii?Q?DvklSy6S/vLhriZT6kN80DAEe0EvddZeJEBCjVhA2za4cQR/apWADseZgpoK?=
 =?us-ascii?Q?snIw3p5jId0sn85LTbhVlO+tbaIjMdCdeqjVMK9jQp4sMSeQMXZS730OTmVi?=
 =?us-ascii?Q?5UVy1nU/ew=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	RxjeCMCyRHeLflb76bgj+mFvTv8tT+hcB3i7ucyy6AxPA83RljRB1BoGHdbHJz2aujMFx0J484YhvAAvMd363KXvswktSs44nC8oT4Dx8Kmr5HvSavG9/nSsF0xdt4Huahv7QyYNNMmdQQlG66BJSNk5UywY97wFqgQxOJnN0UPTCDFXxyOKVoKLRuQ8ZCS7SPgI0iX88fccQj3V9XbFnjyetT7Ws4rphaSZgRVrXiJc0kjfTzTadLFBvqc3KxeQQWuMFgVNiuM0kr+p2qSbIveAIN2yPhkOkctRMcbz7WlLtqfh/SHdkj6Sv4ugJvoOHghxDWBgYhXamjqRG9E7AQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2542a0-c49f-4b62-9b9b-08deafd6458f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:26:36.0795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOkwaSGUj+brRUD36+soPT1YNjXeMGk8iA30K1+56kJZIcDpDcQWlEsduzw0qJ5ciP82v/mA/APYVLVy44sGWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 6QrtuBRS5LuVw8F8HUk3ZanCQt-aEiU0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyOCBTYWx0ZWRfXzjE78QwgXHPc
 mE3+urthQXcbGz0B9R4bDAzy1SUBkKKFqEpGoaU7W2R0MoJBJjZ81VpUIrS7finmt9rSx9W73P4
 zJhlhkiSMQCsBe43+/PkeMGzWcaxuaHYkWdfoPDTeNVkgTJ6SLZqbRzS1ht1CGZ+wyUsEgadH/G
 NwmegBLhRoaEBlh+u/ghUSj8CQmyRV0pTxBkS7iFEXybRPCEPTxc311njols6Pdv7XB7Y+5Z7SN
 gdlGNCDylSJKU2geah6+gf6UEqfqe0WZqwEmnr3VxggvtE0i/MfzNUHG1gq+5POAVmj7tuWlwXV
 TqCG/6YpsEBVGwbSsC8T75sQa+P7uTO6o4vNOwP6lL2kk6Gzx15aTnJApiJ6eLPjNYv2SuF2AqP
 /BgQNon2FYFAlJHjEobtaRJAvAVu3HSxYSz+Eh90dLgB2m9gvr960UtoO5wR5BxPC6V9XVhNzLF
 Wb1nfg9p+kN1hQi6pTA==
X-Authority-Analysis: v=2.4 cv=G+Ys1dk5 c=1 sm=1 tr=0 ts=6a029dee cx=c_pps
 a=IGlUesXJXvI2YQKUC5af4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=_0aN1pf_025NAIwbKcUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TvHj1yRrYLyT6Ldt8igejTBoFslMXogg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236846

From: Chen Qi <Qi.Chen@windriver.com>

The last version part bump for vte is a stable upgrade.

* Evidence

  Its repo[1] has remote branches like:
    origin/vte-0-76
    origin/vte-0-78
    origin/vte-0-80
    origin/vte-0-82
    origin/vte-0-84

So for example, 0.82.2 -> 0.82.3 is a stable upgrade.

[1] https://gitlab.gnome.org/GNOME/vte.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/vte/vte_0.82.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-support/vte/vte_0.82.2.bb
index d5dced4ce6..839475f32c 100644
--- a/meta/recipes-support/vte/vte_0.82.2.bb
+++ b/meta/recipes-support/vte/vte_0.82.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "fastfloat fmt glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala upstream-stable-release-point
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
-- 
2.34.1


