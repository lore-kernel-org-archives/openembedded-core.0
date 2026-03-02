Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8596BE9B362
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:43:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157704.1772448217857046585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QPWYP3wK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6224UIvl3236007
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 10:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MhbTFU63Dq6v3AGMKjgBvJH1l07fdyQiPRcq1h6H42A=; b=
	QPWYP3wK9+cdMIngJslxe5MWTHhKxijy+4msmX0AyFBzMZ10cQ1G+n4hyOADzezJ
	SZdazbTJjRWEnyz7cVAFrccljeBUaUkLZdyiq+zVZXXUzSAomo7ZnTCkUKstQ6If
	0Cqz4DULfRzpUfSp0bkOrY6Q1UtqRufRp3bUMjHtR8V+bp/X8QvX1YRmz0ncqNlN
	X8mY/0j0iS05hvSEV4sNthFNNpKAZPpP+zkZ1GaKShW5AtpPvT/lezwM0fwsvBhX
	qalgLTPlRz1pRi0cKsHkeUWAMKCz9SfFU1/U/6SMY1Yrc2KP06JOteK8TMwnNhzX
	a0FhmSRhx7bg92xmOZq67A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4j6kj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:43:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL8Jd3oSLqBn3JROp5qK6ITjvD0WoY/5O5jdGyrPiPNgqewcjKNFNQYBaDizMEMh7jI6en6XYGLIxQ+hR9nleu8IYKQro+IDGG+kDApBzjTy/Yi3RZN208t9eLKTTtIlul8t3SgD/YFJpsdmx//EcINh7lSlT53uF3PZmmqzMxd5skDsqxOjlAEyA3BDvw91icr4npz3ATujcMr993hO20qI5eKuDHzg6zX9sCJctU6/XwvBgQpLP7nkwnpy8djjiDzP9v4tUfbp6OHPnGyErK57aUzZe0QJX0nzb3vv0DwyGjhxcBRwCtaPb5Bw2Sv5jethIkPoUv/I02UHV3OTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhbTFU63Dq6v3AGMKjgBvJH1l07fdyQiPRcq1h6H42A=;
 b=PLpc8uCPuOj7FP/ulvKEQSuVUSrEZTiAv6N4gx5jY/0UMPERf8vNLTtYIwHkzC/i2WmkpzcT5/yheka+U1415izIofTbQ0kcdd0x7iYp/eM7oypQD+IBewSc6PaqxwpXEWFbKsgFgiacBY3wMVnd7R2NzlRtVyWX8IL5v4B6Oizmwti3JyzBuBbf+y6kIssVAqjn7+72eyaSETPTUSLeFuw6U24qb0m8kAlRMSmwGMtCkFvmcbZiZZqQNjhLF7E+ooQS0/FUSqzlgS6jprspPmM96UUMtoov54U6uMHVIKVhSy/Ts/HzVO5f6yA0ZmqUpp31Nlrm34fZUfJ4V6vB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 10:43:35 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 10:43:35 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 4/4] rust: Fix rust build failure
Date: Mon,  2 Mar 2026 02:43:14 -0800
Message-ID: <20260302104314.301665-5-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
References: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac6fec9-7322-481a-78eb-08de78488e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	z57GTbNZOIxDP5oNziuyi9fgIdrVSH+Pzw/aeI5YWso/z3UfCciaVaoj9vSMZCd9ptTtx2wo2oG7+NMh1WMD0iVgkec31TSAofiiUcVywnyc/p2FY33UJLIpbBGBaLSw/jR8xAU06ux31b18Z99stgXzCtPoyufj9X/WwCKn26t3QODQBt+/ccRYVsaB0eGUrl65YZuGUBSczS6qeVFpAKO0T2w5Km+HRjHBIjWnTzG9L7OxLMyLW7QJegshmH2C53KAyhVWZv3Z3n15QLk5P+1Upg5nbDUOhd3wDb01kTk11viXR24YdNjXutA0kK8Ckv1pMx1z5WCwV3lFZfJH8bYKQbDedx8XbIO7EuZLTAZebDFNaRGlUtjyoDVQU1SeujYs9ZwMVY0Fi0UtKLaFV08OoYUwiwF3sMojEzuiFa9MRQmjTs7NURjWFiDIlts/8ntPscvSgRtrxHoYmCBuLudD3cc3o5jem0SBRJFQwyY139oBn/2aYUjOuMN5XwQFyUmduenTWgDfMod9xeKLImwgg1X1WV0utLuxz6fuIGI2euAjvenNzczMUtoNVeT/bOrHkJfscpQh9fm2tuJ5LZlY1UZpRJxY+YYkifoVxvvq5H4+GqNpq/4DWbh9T9t212PY1Jwa2WKuJgr6hcS8dVJ34uLlK0hW6q6tulTrrsKn2B+gw4rVEJuiXKih0AtzbvGVS9MapLNL0hkf9rigFBYgpvnmgqABZATs/UWh3XXKOH+nRMVTrMgxXQA2Iaw+MBT9KDRTwncpJdsAdJh1MMhhOpk/AAJZbNn747U2FYY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GoTPULMGSnFYP/ULxgSIXLyQZUJZsDWBZkQlr5PpYfDOkY88zair+IEdlN/Q?=
 =?us-ascii?Q?gbScSjtzXLDWVmYLv3vtNpuOs8bJ/RMy59C657nPkVbsR9Hcc3QgNvnPnm55?=
 =?us-ascii?Q?lxu/2W1ReTmG28khPVlLSlasvzA+wxQAwzxe1oVcxh98CIzimLffJ+chGv2j?=
 =?us-ascii?Q?UB3NfQ5lwtxK7OU7yGWGSV0GVPPif/g+bAMV/A5u5NDxkblvnHubLd6GwACJ?=
 =?us-ascii?Q?tiaZEOUb68JkMX1XRH3MD5WXznMlUued6TsHe787gWzWh8A0dh2T1yY9mcFp?=
 =?us-ascii?Q?c4N7kN+z0KYAxCrn93acnaCftVb/KnDxmKp2ZbTLj8dLkytWMffYUX0sDZNP?=
 =?us-ascii?Q?rwoyv4bVTKFNSFirgvntU9usCBnCBOQv/Ewo521ErmxoUNntvPr5kjv7IZe0?=
 =?us-ascii?Q?ixPsGVKlggkREUEpWOloQu5ABCnGOo3CahBK0ApHnZBgbIRmyGbfDWqIMBfS?=
 =?us-ascii?Q?aiHSWeG2lJjmrl+ftDdvAkynw3XcWAcfQPZveHr3OLU6hAX4b5diItd+pRLW?=
 =?us-ascii?Q?uXk+3fP7JmPIJDvCa/53O2h6WOe9KC9mgBPcS9968TTX/9gbUrFj8ECPZsZd?=
 =?us-ascii?Q?5o6HnksPr/9aetlfIzXQwW7O1L0uvJxfZoGhkwx4CtjDen7mIufE2iVJBoVJ?=
 =?us-ascii?Q?QwgR98gXydfZ3yXARxx60IiLK6mlIXJoyMs1dpf9i6J/x+iuhyPmjSkMHNYx?=
 =?us-ascii?Q?HTyazbRCgnJeFpYADYtODuaONAf9p7YxFXSxaQpfvik3cw3C98wpzBboaHm7?=
 =?us-ascii?Q?Qw4hE6YrcgTUjHRW4LWw1cNhn0+L2Tg99+PJhuFzfZGtOmFMQI192TN81U9N?=
 =?us-ascii?Q?MB3rKWOVRB+Jy7CBFdDTQQpcHFSwrgkIMpQRKpHk+nJYEdbvFqedkPTwcvb/?=
 =?us-ascii?Q?uMdxlLMLrr2jAjUMNTYd9RsN6NEKjt7yBUFmvYq3UxPGCQ+nnegN39HK/m1Q?=
 =?us-ascii?Q?e/M0436jGUs+NYxwLXqqrw1v77OJ3XXur5vTNEfb7IVaVoz2OMzPCqmk1UmP?=
 =?us-ascii?Q?AaGDNeCZZfZHcskJshzRq5B09LZgwhxmmnpHfNyZn+qyw+ymRi7IFwBvAn5z?=
 =?us-ascii?Q?VWVUKwLA8/bOG8DkhGoumeAx5WUj812g78InyzGYw3XOnoUxQ9l/Jc0CoY01?=
 =?us-ascii?Q?NlCNOldHlHetoKOFc1hnluQqL9tzGFRpeBFFWIP84kjT/gLepbhWYFXAm2yC?=
 =?us-ascii?Q?ca2WtTzsMrXzsW6kLf5hTiy0ZSRByBvr8wVbblO/6sa6p/el0A9RaE0SRjxY?=
 =?us-ascii?Q?Veefe0fMbcCzrreI+e8tSkIVBHDt0qQo96CeXfWk3f/LGEB40Lz21tqs2cuH?=
 =?us-ascii?Q?b99vwjCjuqiZZvGulumFPGXyZxXlzKp06igKUdXK94GCEBRwn0eLZLuG74zS?=
 =?us-ascii?Q?uny76Dvr+Ock1to4siMs5Q5ze/eoHAAupyS2vtq6LX3boAsyzXsYOnIUmP8e?=
 =?us-ascii?Q?GoNnp+pw7zQcgwylGLnjyTxCxVYXmiUjfH6Fg77uZ+8rkKvTWMFDEtf0RNG3?=
 =?us-ascii?Q?BxAV3gEdK0ZQ5QX0Zn6q6jNg1peQ3CsnbJW8oq/ItVk4FP2fxUdrenFwwNWY?=
 =?us-ascii?Q?irc6RTt3HIBjjm8NNE3ExJ6c01eEb6ws2TX7nPlrDYGVuarlj/eYFyofDmbS?=
 =?us-ascii?Q?jRlSDyLhC5Jkja0jpR1cbpkfXVf4vQsdAlXqr6Vgi0aU8f8Mgp5dpRAo/ZNh?=
 =?us-ascii?Q?HzLmb5Pr51o2uncVm7tPRHDUrU/QyKLY9VaYXoLBHGhFDC72CZRqyGOolqvL?=
 =?us-ascii?Q?c8K/777rgeaL4kt5ZA4IG/8WXKLfVuATnK+StrGoQe520FKh04++?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac6fec9-7322-481a-78eb-08de78488e38
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:43:35.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2TFCGni0La3ISTl168D/CeLaYRho4vNBBM+Lgl78nWuEfHDz9zay+5KpWrhEVGZZaBSRZsE9VFcpAfGsDvMlFvlLnTDtOD1QKiiUCQ6NtcZVtpdZHESdfq8rUaHWJmI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a569d8 cx=c_pps
 a=FRwzarAYk3lDJRtuO2pFeQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=_AV8jFXD_HeXAK5xdaoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gbM5v1sN5ZM_vqEz0yW0JJLevGP8p3t3
X-Proofpoint-ORIG-GUID: gbM5v1sN5ZM_vqEz0yW0JJLevGP8p3t3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NyBTYWx0ZWRfX+wE41k8VN15W
 Mr1CLnB96mBNmFeykgewm0qcz2G6tf+fv1tcZF+uU6K9aFcupnxDxy7AfX+8is3ADk+7Win9q0S
 PN7KNdBISON6om2YAcFjnCHk/2dNIy+kTczCSB/jS9BND6sWVkjTYptDV/X+J04KJvJviOffK0n
 FJiZPEM75bvDmJt/qprq8Ah1vCEt0drNc+PHfqlfD5UizwZj8z8/4rSWrOsUH+QAtqT/av1C+TG
 Dfamj10a6We36T/Zd2Sqg6Qk4ruEXZERCFpnqgpVNmAD4gj2WhdMJaGYfE0cYgeELJ+2tjGBc9m
 nDSOx43cSQSstu4jCLM77kDF4D6UqOY3XvRyjP1x86lbCdUN+b7XrOamvoMofqQ9Ljr2459kKgL
 EbJHO8wZJ+nPNk4VTCC7cm0S7dv9fNbrczLQZ0G3kkZfQ91ivgDoC+SF/pI3i4iWOe8oQLH0i5w
 JssZOh8u6EBhDib1htw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232192

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Target LLVM tools are installed in the sysroot because they are needed
for llvm-lit to run tests. However, this leads Rust to pick up a target
llvm-config that cannot run on the host. Overwrite it with the native
llvm-config so Rust can execute it correctly.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.93.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index 2be0bd8d89..86da4f99d4 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -236,9 +236,10 @@ rust_runx () {
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
-        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
+        rm -f ${RUST_ALTERNATE_EXE_PATH}
+        cp -f ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
         patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
     fi
 
-- 
2.49.0


