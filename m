Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CD2C61DC5
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12587.1787621612424887852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nc/seJBI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P1HqnX332143
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2VmIH08WPmFh9RqJ7GxQqVf6zQjX4kwBgtVH+Gtn370=; b=
	Nc/seJBIjFG4RrA8tG8U2oqQi9VfAHtMD+hPAR4mBKHvOJaIeHN5Q7lEujzjUEjx
	VRPrS0A1R+4/HFdLE0BQO3ahVZqn2PWV06au8+jPhKrWvqFY7edEl0hi21d8b3gU
	dWV7rFBLobOPaXa8aVA5XLd4yRDgq+HC7Oj42kvHVazsCvsP2Zu9pjEv/Kx9XNwR
	M5NWoVba/S0M9Dmk7VdFH6ueJlnr6ZPvBLqWkQKOFZQ2U83xCqfdDYb/dLwiOn/d
	7JwsaH6dNjhIraVz+r1u6w6jGimFICVrFxb0OBS8RWn/YosCC+1gOfuaDUTSMqca
	wJB74DIEjCNL8DexH2GaxA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022106.outbound.protection.outlook.com [52.101.53.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkfyx-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vP5v+YHdRmASKzU5DLoaWCXVKKG7sjkoMFnAhvVjN2aMjpsEgyOqItf99OSdrkBa9pL6mM8iFzrm9nw5s4A1lSUxR8HdgSUy4F9SvCYAvggAmRv00KX3+7yq2QCBIEFLa3Yr4RD9FvLajMuRtqbRxvZDX+xpz+DItFE9nrKOXvn321O0TT3OlaG9JsGLqM0bENib1dVs5OEqaKnmcRfJMCjckc/yh8oGWSP+dHaD9BfFQoveJAuIbrPgnrsOCkpBVxdT2ozLwisVlcGA3WTW9tXuowFW7roh/aH5mwgDJReOLt5x2IQsJ6gjLLlM5J8sfeplGbnj8OkDZAKrz/2MNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VmIH08WPmFh9RqJ7GxQqVf6zQjX4kwBgtVH+Gtn370=;
 b=ZuxXkO3o5PtyDxbownyPdoz6AA/iYQlf3hsHUmm88ANbqQ4nYjN+8xQVEC/SbxV3U0vm22+5Ori78q8z9e2Zm3ojJZr3ntnvKOTZxeQQIEVX+rGilknf2Os3Qxts/eAfoV0J1FbtFao91HQAo6D8yz6ZPwjXJT7InyRmePGALevC1W6q8ri8XMi6wPkipR1k69bsn2ODgWfg4cqSh83TUkjSsjr+hXJV/Ybw6kU4V4kIrG4fmmME9ERnjszMc9hEV7o4rFcGTm8i7pEOEwMM++yun3QiFkY6QXTGhzSFDxwEF0tjJbHShDLgY2oeIfBZMOyiiSMQLJIKD7w0kM8uCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:28 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:28 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 04/14] lib/oe/package.py: Don't redirect stderr
Date: Mon, 24 Aug 2026 18:33:02 -0700
Message-ID: <20260825013312.2695028-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b17aca-22aa-478e-9344-08df0248dd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: 
	XoSpd8+oITfIGh0HOIBX1SAoNk2BwUBa7NvW9vUO6ngPEjUKM/mbKL/dZnt5sgzv1QfUrfJJpYajtQnfw6Mg5hvIcf4AKjN3QkGehsurHJA6DHbv6HU1dGDZrGXGX3Tp7Pt7hhuUXvqrY9/H1b9LNgd2AD5LzSSqG+F0gid4MqVclychrT7cDfuuRSFnXzdQ9ugBzJ9WcJ9EWoQgRLzegprjqV08a/qQzIDXjAqKfJstS8XqBsY/pH6uQxX9QZn0WDerTC2Nv45adkxO2Yz+MuyDiZIA5oK64+9sAQFre+n7cReNEJpv13O8HdnliUzC3gPrLYR1NLfOa+Lfrmo8DoHShwXhIEE6tCKhgTgQiYCndP2yOAbCsaiM9RnxCBPPyQkDzzu13ZmtsoSxperZ3GBpbdKj2wmiGuvLul1RqhElvuKu83gmWiT1vje6T12m5oLzsm5MGfOFLMLnNNFe3dCkv+fdezxSQTtswnsBJoyHyk/cGRT168y6YfvtIVu8CxxUcGKuS3IpSqjhMJ/15ayMffR7rUjvqAHMY3e+ZeSc6n+ufom7UAfFUqd9v/k3aBmrxNmwm2ofaFRxu9c/qzO3Ru+ChO8ggelB8lD+ay2Qww6ufKY67dr6ljt2OSUMSvyPWOD8Nvwj2erH1LrXPl7VCeDdEoPTA/sDaG/Y8E4241oEf0prsm3hHTqrW1jauoP/lZDL9+BS4UbgACxQnGAItlDxGmBUaTJkJJoOCI8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZIFyiIKHLmh7V0zksdZNkw7zYXbb6gOK/2y/FvxwNtzNLGxDuSCiWJR2pmI+?=
 =?us-ascii?Q?y+iM1x8WvVgzI+WgGNOuL7s5ZDaRlO6CTqe01T0EqIxuCOzd1Qcv+Ks3gpNl?=
 =?us-ascii?Q?TBA763KSeDtUULyOqCjlnZn4HvjEKJnPBCulSmIUQDY3FBtDbaHn54Risqs/?=
 =?us-ascii?Q?UDrXl4kNPqAsvcSPjDy969CJKN51n0UykAWratXlOY/Xl6xoiipuRoM4BDaL?=
 =?us-ascii?Q?jBwHY6pi2JBz0NiKAsMbSCAiT+13Eaxkbj5QfLS/DgoSwL/iGYMyivbQWTmA?=
 =?us-ascii?Q?HRND6AAyRsBbveIa0ORIcRQwyuyffU1bx8YfZQjEANyZSp3V+9eR5iFEYAaw?=
 =?us-ascii?Q?2gO5zdcfiznN6xKNeFp87QXn0+6Hn9jDqtH/SfZTR2vJY5m5RgzN1cpIVWiG?=
 =?us-ascii?Q?aNvU7HxLQAgq/zdieSr3hy2s48Z+bSv2Kuhnnth6LgtwnQt4yDY9GU3ZIMPj?=
 =?us-ascii?Q?V26q1xgo1d43ZL2ZJh17pVRFOr5IXc4yKE+7eAMrqpEfD9sBTn+NNQUZavFQ?=
 =?us-ascii?Q?4oEkfmpEIjfhSSvpCkXIcTxcAtHsnMmeZu6GfQFs9WiRIfGzrzhEpRpsjS3a?=
 =?us-ascii?Q?06SGprGrQ2eJAd2D3NdtVIghJWyF4zkEAiCJ4X2igpjMmlNisLMhjVG9w1P2?=
 =?us-ascii?Q?aUrcBID78jQl7zYXqTQ+BKL/blnRZ4jKBt7hJ2rnrqtjqlslh5EwIXiyf5JS?=
 =?us-ascii?Q?bwUyrplqnyqv/0n6SmmAo3xwFL6gBd+KkTrPBTyR/Bg+fp7pxPqShPxLpeFT?=
 =?us-ascii?Q?2bltYB6WcaEsmkVUVDkdT1q8vXe+b1vXsAEep/OnJAfHURGJpO3VAe926bhT?=
 =?us-ascii?Q?8lwaYSWdxBiXkTIW75ohhLrxYKOal8dgymVUTGokt2Vulp/Uw0ptpmJrD8Lm?=
 =?us-ascii?Q?9Kv50pasMVV7hdJvIyIom5M7oGMYSXpnjIvFHJkoJWcR0+/VfxlTexuMMQz5?=
 =?us-ascii?Q?gUiCQ15dDMER6VdQG3DdayNItaOJpK7OSvoy+8/CZQ9B9DX0eExHozQ7677L?=
 =?us-ascii?Q?BGWYG5Cbz1dn1ZVA/NMvDKd7KxBWfMYe8dIGJ1qi5raAU05tqUMHAGFjFooj?=
 =?us-ascii?Q?Dp8ew91NObl8XB4/A2gCijko4EMz8OND9/ULguBv0tvTOZ9RTBd9txq4XuS2?=
 =?us-ascii?Q?EZ+T/Vczfvp9Wxyvd/vAsP+qYp21V11UIIyOFQQx3oi1msa43M31QiIbStWH?=
 =?us-ascii?Q?eFAXUjx9hki59Lw38zSuJbcQAILRlT/UmOnmx2TOEwjkGiOJ3nec4tPsY2wY?=
 =?us-ascii?Q?nhqbAmvlaeT1C14U1XaegLAWg+bSl8zRMxlTdqOrbYnGlGborFWhV1uanbL/?=
 =?us-ascii?Q?NTcZuCQ31hgO4d4O+AtJGElhgF3VSaq6CXWSMSgfBn7+lTfsMjq58eggklCI?=
 =?us-ascii?Q?RIkzRGHCSBdInAHgocOgSpJOq+AFhem7AmRaFDiN/YHr4yquK/6UfZGBjeX/?=
 =?us-ascii?Q?ywRBdwuXyY9w7/pf5FzzU1SeupisiDIsFDLX+i5vZqaza/q40BznCsL9SDQc?=
 =?us-ascii?Q?C75QldsLsyTkUK+naF9ry3Fs2mpdtrt8JAuiqiI2zdpHWbx5BSNw7uR/D0nM?=
 =?us-ascii?Q?ic3iPRHdsBoKCnCcjO2wTOW+Egw2o6KAeS1Pr6dJqZUSVLaSmNOB0aLZwGwB?=
 =?us-ascii?Q?eS3mxHHXCI4bxGUaRPpx44YNLahyAiHdmjLQa2XYKKyF4sEf68Dk4Cfkv0ZN?=
 =?us-ascii?Q?fEFU4+8BQ0kEprmorzAiiGklHrGMfAkcYAt8M/bsdssk/DRuS1ef3YPMY6zO?=
 =?us-ascii?Q?1vmzQlKCYVYDPqLGUgdyCDKk1RP1150=3D?=
X-Exchange-RoutingPolicyChecked: 
	zS9X+/tKNwSqI/8RXn4NllCVqMHJq2z8rbrYQCCd+RwGESj5+o2Z1N2m09SYAu9qNgMSn65LyLd61Kygrk2EANOHKb/GhC1u81Piff5MHGb2ElYri4cMfUnXd0qzFZQCOPJptMI4OCEyRG0Sih4DngcBwleAbSf62e5zk4uMbVJOAcL/kO0AIgpnsndS/gkWQU3V3T2sjcHmQQ+Qx6A1nHL2DTZl7/+fmW0ZGpZq9NTA4uKMZqEjtkyD1kosFfmWjRFqXwBHTqiOnufEYAcwqOue/ddwjHNk3M03ciCprv2nZ40PbJoyEl6GLfz9T28muzSnKcNT/8pLLv1VxbuHAg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b17aca-22aa-478e-9344-08df0248dd34
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:28.5386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DypcWNgY++SoAr3bZr2xpPHoXylkqcXuhdrBNzQGaiDTuZZagPCi+AVtosJanUXeMiOvg4e0ZCmluHk48teDhcwL0asFnbOef18iHyVFsRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: yujGP79B7XYxVhP0CGpBkvuDVJalglQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfXy3Yr+0cJDBik
 qrupKRo7DEKo65AaAdEmELDaPH6aigPz+hrl7J4qIpy3clykJLDgnqtDhkAfH8NYT09sS4P45hy
 MR0Oe10sTm2f1Y0PBDDbmGgPhxfqun6yFt4ytzWAeMMo+iDWI/92LTFCzDsFfbsT5+XA6bDSjRM
 OntObSrZ1aOjXJAHZKiDCwHLS/3iWyK+fUnHGqXpkMbLB+99x8KPt+X9vu/5pVLUMZwHXKjRGkR
 n9N2Vqe/QU9tQoz0hZNv/N3vdJPyKlQEc3V8UxJGYqhSVfY/2IknlP7mh68d/HlmxWNUeWv3Njv
 nPcrIu2nrH2hH3TO4NvpLSoX2YH7nrfIJm+CBvFqzReDTHcVAmm8dWImW6mXQSNLdJVx72P496h
 /XNxbsc7NCA8Gv5nVZJWRHDBKP0+j9h/4Zjbam06kEUMGRor/ztaPZRp4wQpaZMBtPOlN2S9lz+
 XHjvtC3Hmwwn+fWx36Q==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8cf0ec cx=c_pps
 a=lgz4Zsbfm4nnj/Www8P8jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PQK0jo-3iuBRWFjST-iv3mHt2k1-4Ber
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX2mo02wcRZtML
 tFT8WAfwrWoJ4voO+LmS1WODK6UU5KGeSmUuLOgnOL7UwZsOjzie6ug2IjS8MR7u7d8RpxgcEnF
 ZnQprNu5ItdzqlSy1kz49Vw9Egejo9oXNSwpZKBp101TV8/FtTxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244175

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 2e348e0a10..ddf5956393 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -277,7 +277,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

