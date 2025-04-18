Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6527C369CB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:39:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10045.1744976394516385643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6203b7563d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I8VlKV006508
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 11:39:53 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1qke6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 11:39:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8ssPCB6ZH7YHOzTqsToPXMZSUKoV1/ZuNTw+uY1JL0gHWdGOdmkkUY/0zM3TJAA8+BdCBvG/EFPnLmwjdTSgCg03DtP+3qhiw1Fk0vlt+7DWAuS35MSgxTu8Vt43quv0XBpNr1+w+y+d0JC1Kswg3VW/VJwZLHG+3atU1SfF/WFVsmaVJU6yqFavOI+K23ErT3Y6fqcaaN2fCo6EYF14Sf1BfdVE4g1X+8Yhq5I6r2VWpvUtRwo/xuoXV56loqmCJtyb0Socsu3Tn1quBRIMrThpBIpcwlTBwaZueUJkNl8tZ/9MB5A9pMFpgqoNHDAQQkoRAWD1iguvaJP3lqhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANtLLH/UROohxLckZstMQFTOlh/RaT/MT6YrHAZCJTw=;
 b=LnmvpwlOkBLsv9rd1RZ+4zNyk44QlxDBeGCTMfoSoWZaLoEXumLA/6e8MIpsQjUF1aWiF9anxn0lYg+JtEIXPPEhva2lFHKD35GPwvqpHCQ9uPZs3uygZNDN6donpneeSlLklG1jBjJmp7I2+6KbCfLC6/JtjUXOKja52DQ7QurtZEg2UgcFeVjmdQ+UcdbUN0IWtaTCqOinCAiLG+mLmP4U0AV+UK7s2WHS64sOMGsmvkGQLAgOa2/VwMwILa7yBidgEp4SIsdG/HCx9Dlbw0F5eONCpo7Fsy/hkQgCEVQcwkj336nMyRH+dEM6l1jtBxbk2as64JF/Fz7OGQA8iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7560.namprd11.prod.outlook.com (2603:10b6:8:14b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.25; Fri, 18 Apr 2025 11:39:51 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8655.025; Fri, 18 Apr 2025
 11:39:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dpkg: drop suffix from version number
Date: Fri, 18 Apr 2025 19:39:34 +0800
Message-Id: <20250418113934.3332397-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6f4b28-83ba-48a6-3938-08dd7e6dbaa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+osRP1qB2ejQANIgKQDVlkGADCOmeSwxz56v1wANpRQQFX2HNmI+EJdleNYf?=
 =?us-ascii?Q?jqRizMOHiyqfQFCCMd+hR9sp0hOOkMQAPZCEAlCLy8FxZBAaZIYAVWnTlFSC?=
 =?us-ascii?Q?A2Yda0+G/GPNoOdvsW0OCuRRF9U8rxVlbB+kJdaLQZ6ljFC1vaO+l6WavpuV?=
 =?us-ascii?Q?PyVTwagQ0KWBmwNjToW1Q+j4ZSzahaSTVXbEMJTmwPq8Xzoa2tbzN4z0y7zg?=
 =?us-ascii?Q?zfMFvqYblnpxVHtNpVShNMnyjkXQ0PWlBGYolYV3txF2oBMns0EbR1sMhUif?=
 =?us-ascii?Q?/SlCt+5skfJl5qf5yr+pQNe3dGyqSn91Z/yPMuGsMIN5MdNDQ4rMmVNNIvx6?=
 =?us-ascii?Q?B+QW7YkjFY7T4e9febEs1mmO5cMNGS1hfXq3WZhe56qfyL+dc9gXWjpLlFid?=
 =?us-ascii?Q?7a0/gZeWm9D65cnT4I8Cr4b98W8pgiVS0glcFTR6qzSzTy//Bo5JjLlPMANY?=
 =?us-ascii?Q?+mtHoXtCJsiRzm3iSPBnyacDwi5E68EFR9Tk/N2mC4ESdBmKGzYhDRoWg0dW?=
 =?us-ascii?Q?+YK7kK3k2QY9jmoWvXJP94HIUqheN4dndlaDL3LNLyT8LXrKd8BIBPe8te3Y?=
 =?us-ascii?Q?FXooFQKbbFXd7qTSSXi+o+3IPriQ1ZRMmhX9581lRzPN6gG2FQIubib2Ju5n?=
 =?us-ascii?Q?nFFI2cIHwK5FMxSwrQslVKlR+x9RkmjIBCLp2H+WlTN1BEK0qMwgeLMxEyfQ?=
 =?us-ascii?Q?qkS/DrT0DKD1fAwe0tLMBVv3azYA5KFczek8Qr/cASCN8YBXilyNnhWu4iyY?=
 =?us-ascii?Q?3Y0468VZ1GXDi5kynFL8T2ahyAQaYRXCP8tMaMoDjCBBgCMiHpI76ai+N1m3?=
 =?us-ascii?Q?dl60zjakZGhyrasixf0MJTD0HToF+p5MPkW0SaL4Fy//3XMBXLMav/myNumO?=
 =?us-ascii?Q?qc2UKSGiuslWnfvgiFqJhMVPY/LiIZZo/jYzflpMyqrb/l8vqigyfim9YSX0?=
 =?us-ascii?Q?r6xuTnd8bmX8K4j0jLRKP7Cu9HAE3MfuvsolIa3bLlmkuHuTh/3KHTaPy2Ve?=
 =?us-ascii?Q?FbDu1jdxU5Zs2ty71lZRdarh7H7SbhvCFTDy1EdRmse0Yd2Z+oFHbL1j1rF0?=
 =?us-ascii?Q?vax95yhiedOR23RJ08nYVPSa2JDunq+lkOEKdMQIkDJraFm9vIalUpCW+cOY?=
 =?us-ascii?Q?rlHsL8dMVaxDNjchUfi5hnC9tGi756mB4+/ATAPxqNshhgpQB+TTcuyWETnb?=
 =?us-ascii?Q?kIEhPSOGK5tj+2wcV6UiFy4KgoNRfDVmz0sFmugr3m48IbHcmu8nxNURwNSs?=
 =?us-ascii?Q?bWt06j915wmhvLORX3r7IiBGp1T9O6q3kGBnhIKV48upm+kV3jVlQ+KV1E8F?=
 =?us-ascii?Q?APWMfUstzgVs6/WGdQkwZsCHO/2Ivn+ywrKO+bRunU03fZzqAbkrk/rU1BvI?=
 =?us-ascii?Q?oedGaXigpUBkYN52zdjEB+Nzvnv7V9sXTp4lCLPMg8nB74z1ZDouhx6ibnWu?=
 =?us-ascii?Q?q11oLdnVpgmO8FfbzvenGKe9pgOEUkevY5TVnHqR/yYJyDUEFo3YwA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IdmDNt7yr0D+uIhh5cccuFnkIgTA+Q/hbPv4kuNboM9OfktNWBrXaf8Nuhei?=
 =?us-ascii?Q?4XDXf3V+WDHPcFtpEl6wnFKKatWq39dV1AmN1mejrI7cjJpC+XOzBih2EXyD?=
 =?us-ascii?Q?7Zvq30JB3SA1LlZnAAAE3NOXR9MUV0Ck6Uc+JdhGz6ooHrY37YOeG38zZ4/r?=
 =?us-ascii?Q?KkO0+iSZJcwnvvMN97/OTHGatHLmmY/P9LOkW/kJJF71d5D8Kny6zQOGXBTA?=
 =?us-ascii?Q?FLjAir42dh7BhC3bNj40C1SzU6Qxn9yVe7RVcQ6bOj/HM4b/wqGj5P4b2Xm/?=
 =?us-ascii?Q?kDm65cL+3nDQ8IntaOtUhN5UxSkLlSqthaSL6sMj55UpSirtuvWp3PMvawFS?=
 =?us-ascii?Q?PRULUHkFANQjjH5N/x+wpjhsJnAULd9J5e10IR5vs/FpQ9S7tFsN/wnBRlE9?=
 =?us-ascii?Q?nyPfCC1koC6Ykz9dnC9/ZIwDj2qjV+2us0H0L2wSiJvlZa8IwZlqaC8ClEyk?=
 =?us-ascii?Q?TRPN1MrKJpEokstb1YIi22ooLA/eI/vobmk0G8Aaf7jKX0vrZQFo4ZTtLbik?=
 =?us-ascii?Q?EJRrHVIqNmxu4QcHP3+IXaQlaXnVolvMEd6aET9dg02rLHuh8AjvshQxL4kM?=
 =?us-ascii?Q?A0O2szxL2bXPTLZ1lL3hSTNfXVogsxKfZLx4/tjmmYeB0PFt2QHf60Bf1hQw?=
 =?us-ascii?Q?WVunr91R42hjbijpOk5rqlaETa8bbuFPbU3EAeMfvwLZ2hdaTfDNF3Pdutcj?=
 =?us-ascii?Q?dPUMVkMKN8r+K+blsF89pb0gQDzShwookCqD5n4U2Jjrr4sdHZynTG924CNV?=
 =?us-ascii?Q?kjkTHkXKmTsx6CZB9bhL1VxtK57gIat/Z7p/uaPVUhtdIe0LBgqOToNDfNK0?=
 =?us-ascii?Q?vuMXWzO9CF/Jz/rmxN/K0Knr5NQ8ilT05IHejtP+oVrFEA6Dfn0ztVV2crCe?=
 =?us-ascii?Q?wcRvHjJBO0ieg1awdqk4ezhrPU1LhRQ3RKtiqHjQDQIBlY2A0xcUrjREcZbY?=
 =?us-ascii?Q?p+N30iE93MNcY5K1j6uppQqWDfCw+dK8R5JvLJ65DhyEmckfbd6Qt/U2FMB1?=
 =?us-ascii?Q?yYMJdrmf7vh8Fe0+8GL7ayGp6v8Y8yvXmIoYyxK1W3+Qxdab88iaCpIzlWVn?=
 =?us-ascii?Q?olMcL3biElYKgeSKXUzhbJW1S12jGEriLgb3eUyZXaHT7ilHG5gBvZpDZYdx?=
 =?us-ascii?Q?DGD2EvKqREegsyKoK/X6vkiZImDRqmL/x/llSHSRhO/MBJYuVI+W2zb5EePe?=
 =?us-ascii?Q?Jp7+m0ZxqUXU56HSjkOtpCsg2rWbUmr2pAGfAi6mCixVML6LOydY1H5JUXnt?=
 =?us-ascii?Q?qSQOTEalGhnEmSBQLmh7B8QlHf7NA3eXmVltxsMAnUx94Q1O4baP4nlU8pXf?=
 =?us-ascii?Q?/edoWKOXGVOK/YPNpiXa6Bm9aIquut9GFXHVwBKqaQILUHVpHVy36yI82i4f?=
 =?us-ascii?Q?dY4+KBwG+RhzAvTT1wc8ex+gxHlEZOf3jpvOhuMmCy3IX8KoktDBryelgn7W?=
 =?us-ascii?Q?yrBhmyarUHzZPQvZ9vaZgdDM1X9CLn6Mgc1Uu+X0jBsGgfytIumQNmASAiGw?=
 =?us-ascii?Q?U4nfSd7j+3yujnPE8CgRgJXvOicyWwQOaXtSzyYzn+bOw63pxyM02eM4Bggl?=
 =?us-ascii?Q?l9X+FuJFTPrt2IpPYb2G5dBsEMI+ePxUD1MgFqUQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6f4b28-83ba-48a6-3938-08dd7e6dbaa4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 11:39:51.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EG+xrUZ0jgiL2DmdftGBwKMNXwTpR8v1s05qEngdmSG64ST49bau7VDqcHLeRWj/RIprntQ7w8y2A9zmvwB+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7560
X-Proofpoint-ORIG-GUID: kza46h9mo2sf7l--H5-s_2TPuLE6Xsy4
X-Proofpoint-GUID: kza46h9mo2sf7l--H5-s_2TPuLE6Xsy4
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68023a09 cx=c_pps a=TWVVkEr8Ytp/jGYVlMgQuQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=t3WEfrcAyPBvRxX9QowA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504180086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 11:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215129

The current dpkg runtime version is generated by 'git describe' command
in build-aux/get-version. But since we have made changes to git repo
locally, it adds a -dirty suffix to the version number.

Add a .dist-version file in the source directory. Then get-version can
determine the version through .dist-version instead of "git describe"
command, thus removing the -dirty suffix.

Before the fix:
$ dpkg --version
Debian 'dpkg' package management program version 1.22.11-dirty (amd64).

After the fix:
$ dpkg --version
Debian 'dpkg' package management program version 1.22.11 (amd64).

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 4c1d42e0af..45b67bf168 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -43,6 +43,8 @@ do_configure:prepend () {
         # update dselect/po and scripts/po
         cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/dselect/po/
         cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/scripts/po/
+
+        [ ! -e ${S}/.dist-version ] && echo ${PV} > ${S}/.dist-version
 }
 
 do_install:append () {
-- 
2.34.1


