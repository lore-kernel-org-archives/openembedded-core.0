Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F98FCB63F
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 06:08:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8081.1773036481830116374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 23:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fdhi3pNE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75282ffb64=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294uPNP2031072
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 23:08:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Xc4J/KCn2TIAQZw3p7IDIC+jwP5tq1syUshqNY3NK5Q=; b=fdhi3pNEJ2IZ
	E4WPeSoizF9fdq+AL6rmumAxxRFmQEuoORrqvf1Vg5l8b/vCK2NlbKJVGTJwIrRn
	rqYAnrC1zOXWB20OR29GlBLA3mlMR0Vg7vJQL3owqN0nwfIPE+sSWCNctQtw5kQA
	9M/q5eSvUuMwWmR66frb03n1M7ldXh5ZqKavku/RsDvx+A40N65BXnxEls/lhLhw
	IEdAax+cfd72UVhNj2pWNatPt4LfC9POxwA87q1od5RoKKSBzn2g7cbpDv8eQF4O
	O8ax4o0rbYsMnpEIt/tqvG2r8Zka5J6tRE3JNbtw+j3FUxx+IsJtEbM8h1JoCYQV
	NQi6uzDx8A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62ha05-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 23:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNGdhuOdt0ZhJavE7e7liZ6iNnzl/xaEVDedunsduwOR7zImJ6dRngMESxf4oagL+jlS/DcxMzQd3WOgijVFxorZLqPAZbkOaPrsjpvoSOvUwuR/n8i6KmSyrUMVmBoIvBlOZrZXPc2nDeJayDB9R6iJU+uYTIBBJQbdURm4UUh5CHBfIJp1aXnZ0oT2nZwnbng5DXO+6yzq92MDQ0yhDWulAIJ0nDNAWYhxszAx8A0enUhG2sCRj3cm2Nw85Oey4cue+XLAPlKTXYci8kFuK3cA9+E3UfOprb4IG6pHgKiUvcevXPQnxG2zuYzghpsq8PV0h7gc6YdX2Coi3K+ZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xc4J/KCn2TIAQZw3p7IDIC+jwP5tq1syUshqNY3NK5Q=;
 b=sNOJIGMUilT82omdpLnIBU/Fps8TYY3Uh1aZFktS2iLX3QSFNKAPQ42OnBXikHwdBFlnciP44MkNr7iofglV33rjeFb0RLjOT7qSydskXFOqvvuY4yJydDJsdc/oKUKMT0wiWZnVW7KQn82jD0+Izdo9UBLvcNoHPqwjRi5hq/eMRsgI6JAG1m0Z7sQFWqQkPXXu6O/vGUlL6ROg6DVAQDMGz8WmEMY8FwHmhg2xxGt6yZDeD9/XWPKZSffVzsabkWVu06sCbr7M2oAObUv3zpR1Z+AnocBvRbo/DvuSPFvyqM4bGO/8eUR4Xt3R9zKsO+y363whM+hD3KCYbA5tlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 06:07:58 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 06:07:58 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V5] lua: upgrade from 5.4.8 to 5.5.0
Date: Mon,  9 Mar 2026 14:07:41 +0800
Message-Id: <20260309060741.1609377-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DGVMFAY5L9I3.1HXXYSFNG3R14@bootlin.com>
References: <DGVMFAY5L9I3.1HXXYSFNG3R14@bootlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0032.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA0PR11MB4543:EE_
X-MS-Office365-Filtering-Correlation-Id: a74dae64-1657-47fc-bf4a-08de7da2367d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	JpodzWsPb4ZAKoj76eSNWqw/X2m2hJI9fe+0ZL2b7g0RBIDBodUzIabpTMNv9WYjCUmr9aNc0D0vyYM4ey3isdbueJvY8khnchU1eU8dyb6gO+hUsrSmJ6tUwWgPsImgLw9ZmlUlje6JynZiPNk4pF4VPOEbKYy8qeHH+0DWalq+EivBcZRE13LKDUSfvORlKNQ/Q0y71KGUB2bJkbIE18wXk5b6+BkA0dGYuhtzy9u7CrXymQFKBbwhWPSr3FSjMhytCtSUBWt9PmnelxJM3BVb+Uugl29tpjUWzm/nNQGCyPO11WmP46g9fD+9xpq8Wac78BdRDMrdiTPKx+9pog+idFi7+S7tccuCh4Yu+7zc4CJukIDaeSRIQ6oig6lDYr2bfFG2viA8vOCQNiQlLknb68S1W6F0AF3x9ofujxl4yCAMkibnk3r9XrqMqvNGW1mrnaj/kx431HcnxydMdhNOklCS/EQVVQRjgUYavXN8zzhPIliv/GtBeFIAVvg6+vbqrXKN1mLarrxZ/UFw4zVr++JNcxcZcUdRUjspYHhvKzVBToV1UiyOIKQ9cfvyKR+C+ZkIk/PKTUY22CYSljyCRuzX8vV4qfTb9UMNGcYaNDy3lRyRAZJqifne8idjA+B7wuNrn1AN0ui3qUIC3q7spgCUak4v4jlt4ogIUau+4Apz6SC1mVuIjqKaMXNeizeL3qq2HfEu1eJBy9BFXSdXWCYvxQkI4S+E/0rxsJcq8hmVVFFDCsTmBNVXASAM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qd2fLX8KHY9MZtUUlH3MipSL18W1lkZ5x2odvnG8QBd3TdSrF2Ud9nTk9NLR?=
 =?us-ascii?Q?MRSauj5ouKAJcPRQrz/Qd69FkrAXP7Un7mKau7boONe2OtguIWGOtoc5qGoX?=
 =?us-ascii?Q?YVriSOZEQzhXFDmUt/JPiTYw1Ij2i4Li8DL4exNySs7OuTiTpw0ciGAcKKq4?=
 =?us-ascii?Q?KQbEpX7f9IQu7teekP+9mRLTuhNPo0LEOWvKHlrBDRzbJmJ1JrerQB7z54X7?=
 =?us-ascii?Q?qlx0A+INYhET2rsbswcsMVsSsqcseGKhdRMqza0e2rTuOwGWBFUo6+9mNvp2?=
 =?us-ascii?Q?AUtqNwvnJhfJwWBh4UDsHJbXxgxUSiUMznNhXmiYvBjpcBeI+g+P4ReUlM6j?=
 =?us-ascii?Q?Gp6DLrjrfyyFN5g2IIBUbWggkDf5M3996zjFd4XekyseBtJjiSG7vXM/Q/qH?=
 =?us-ascii?Q?NoicSmUoZsYtUNgY/LMfRUMAz2e0VeU38FXQ1oTlmnq7PNA9h069WEKxrpWh?=
 =?us-ascii?Q?my18Am0k/LhuBygSm++3fYsjdqjscIMba5NoXmUAS/ThoMinQOfc8HKtLmgo?=
 =?us-ascii?Q?l/ji3ZBAT25TgX6fLFNmDs781h/lWrXBRqlPi1Ea7c9I1vYLK46hb+Xbcsev?=
 =?us-ascii?Q?0TT0vz1R3MqLr4JeDR+IKV8et5Tvjt2xscVDiank+8zruesKMTVbahzKadbW?=
 =?us-ascii?Q?7vK5W2BoKC8imUT13/rym6jGi0gkZ/CnDiCWoAdlPX6RHORoaDTFbWcKybnU?=
 =?us-ascii?Q?D7x3gzbdJL1Q4r5pVHSfZMwwMb3Z5JFIQWIpZvSSA8B0uS3+9PZmRbZ+9NYH?=
 =?us-ascii?Q?ESBIELAPbuHoEfyeIsgs21CTrNTdtSXI7SO03FzQzrkA0BdVHqcA8KVpMQfs?=
 =?us-ascii?Q?BtZGtM4LVp8FBdWUd/YBjUy9O6pQZj1l6qYigBFIsgvQcatOQRF7gbt4WT+o?=
 =?us-ascii?Q?7zwnCgs2uqhFrAaTDdR6KI7U3Y7O6pxTus5iUCd3N3fYyW3Sm1kPqOtZvYs6?=
 =?us-ascii?Q?6pQF7sVoLRS6d2IvwXYndD6h8BD66gSG7fkae1PlNdVYVGqd1TU4/joPQpq8?=
 =?us-ascii?Q?dZNZfLMPbR9C2OXp+pLvmOXDaNu8vw2+XKASM1AE6nwkEE63f8esCQRCyp+u?=
 =?us-ascii?Q?vzsZEume8ibfXx1h7Xz2EgBxo6o1FLZG7xQmfhXmkhas5tBTH2XSfEiO7nt/?=
 =?us-ascii?Q?0OuegJlVbR0zLSXwr44+HoaJP5+hb5EeSinbWG90WuLCKlTZbplWisJHoqdA?=
 =?us-ascii?Q?hKB1h2BzVRI3uAm/TwHh8Xk/52dBRyD6I3aUNDVbF87ThwW8sJV/IT01MucC?=
 =?us-ascii?Q?H18zNthCyoQERfZ4evHZUIbTuc3/aTZfuw0VgerOtvBIzcKdomTihAu5xHtT?=
 =?us-ascii?Q?JKfZUXWKd1FKTqsRxGgB732VJVU8HQsy+fdBUQzrkVcAitPo05EhkUWl4tpl?=
 =?us-ascii?Q?MHqNHMy96oNbaY/J32n1Ok68GX6wIt1TFcNBzWTRJGhV8SqRXpdv4x9pDk/E?=
 =?us-ascii?Q?lae302KXBLkOX7b8yXBJBqPUjaYd9X7QpUQgxUtImq8dQZ1c8w/SKoVD/wbx?=
 =?us-ascii?Q?m3KyFoJepoEnEIYn8xlPilvhXSBzW4Ru357PMNTlq5gMWsTxignUkKFc+i9S?=
 =?us-ascii?Q?S117l5Q//3XjrZRaJo4dm4ryDssxH46SQl21NOF4nOZZd8dJs+j+JdpA0pAi?=
 =?us-ascii?Q?vBZXPbB5KU0P2stxSB5chAtr0qrw1H+9Nd2CFFl3JeMpuMJR8TLF31hUniJL?=
 =?us-ascii?Q?dyTBXXPltKqhcY+EMgHJIYU864wlu6dE2em/q5CppEbZDsVqvXeRiMO8V9iu?=
 =?us-ascii?Q?IYLO9WbZz2cR+yT97nDGijh+DgYy5Mo=3D?=
X-Exchange-RoutingPolicyChecked: 
	XuIpJNUjOFcAYBv2uM+jR4Yf4CxY7sRRXZOoQA3i2INjBL5LA6yF1S9uCgAhtdJYMFhbKe46IW4DWU2NqV2w6WLxK0+7onvpJJN0QIBrLVWWB4KizWRbOJC2ZRfTjg7Y9jRV5YcZFjNVbEx3P3owJqayMGt+dOgwnxPNS/hxzq2Y2RQxYPwF3IYdNq5XUwYqK7toYDGrhReN4w5q+vO1D0em4pubi4t48OT8o2iCtyWOpQC6vfCOO77ZYgqChicaVuxAoSsVzGsGje/F5exB6qpY4CXwGddMRd7TD0BtoI4Jo0bPhTpmpPAA06tZ4TdKwd9iAHdZzcOJ7Fs9lJkGdw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74dae64-1657-47fc-bf4a-08de7da2367d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:07:58.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iebLM/B8uZljM7vkN/U+7xE+wlJ2owNrzMFgkqn/2k4rOP/k+PkS/pnptiex2UV715YB4SAy7gxbu+CE7qLSTTc/2JXU9YL1VTDVxmt50KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69ae63c1 cx=c_pps
 a=6BiUERe1gyZkJgaADwpG2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=z_5uEx5cAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=OtxFmJL_6QCy-71EleIA:9
 a=JtrFjcrP6MhGCbC1Nd-z:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA1NCBTYWx0ZWRfX1nw0B4uC80/H
 8dU6K5/i6BxMnyjNNzaAmM+WS/vxj6KaNP2waxE3x/y+LKH8F/Zc0WOa+4G1zSiU3UyAo76J2uY
 IisRzGnHIW1sjXlM27X1Xy/OYqRyrWWWUbq/aHCPKwDCXl37nHxj6R95gT5aNU8PP2arsIKRw1R
 IqX1K/cYAU/yqm/auwRdbhWEw4kUwqFjj31w7UH+UVp4PWVlOuDwFAtqUcNPVo+n9l0IXObyuas
 WBh6GvxFGdt+jHc1tQukxESUsX7IPNxj5dKcKXja+FdIjh/KA7uVNL/PYOEwSbSoEQv2WsZZkS8
 rf2DTewNVkKkHz0PVRRI+h79KRe24P+w1lsbiSGzC/VyYcxSjlpCgQ+0pMN7aIzm2imPYkHKArb
 ZrUnxilapXxHIJFpiu8lmchoFi9FSrns8NG0JiZ5gNBsHap1XPK8Kmgx7JG1wVIUUt1Iozn4Ts/
 msg/GxS9GCYxzI/YFjQ==
X-Proofpoint-ORIG-GUID: IxEcTg2rxepFKxya5YjeQDwtN6HxjAMp
X-Proofpoint-GUID: IxEcTg2rxepFKxya5YjeQDwtN6HxjAMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232676

From: "Changqing Li via lists.openembedded.org" <changqing.li=windriver.com@lists.openembedded.org>

Changes:
https://www.lua.org/manual/5.5/readme.html#changes

PLATS linux-readline is moved, and readline is changed to load
dynamically, refer [1], keep readline as PACKAGECONFIG to allow user to
remove readline dependency.

Lua use dlopen by default, and LUA_READLINELIB is set to libreadline.so,
but libreadline.so is in the dev package, which will make Lua cannot
load libreadline even when libreadline is installed. Make readline as
build dependency and detect the real libreadline name and set LUA_READLINELIB

[1] https://github.com/lua/lua/commit/366c85564874d560b3608349f752e9e490f9002d
[2] https://github.com/lua/lua/blob/master/lua.c#L520

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../lua/{lua_5.4.8.bb => lua_5.5.0.bb}        | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.8.bb => lua_5.5.0.bb} (71%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.5.0.bb
similarity index 71%
rename from meta/recipes-devtools/lua/lua_5.4.8.bb
rename to meta/recipes-devtools/lua/lua_5.5.0.bb
index 1d37cddeb8..905dd01001 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.5.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=299;endline=320;md5=0e573c143cb6491b41cf02cfbcb8c267"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,24 +12,32 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
-SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
+SRC_URI[tarballsrc.sha256sum] = "57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d"
+SRC_URI[tarballtest.sha256sum] = "5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472"
 
 inherit pkgconfig binconfig ptest
 
 PACKAGECONFIG ??= "readline"
-PACKAGECONFIG[readline] = ",,readline"
+PACKAGECONFIG[readline] = ",,readline,readline"
 
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}' 'AR=ar rcD' 'RANLIB=ranlib -D'"
 
+do_configure:prepend:class-target() {
+    libreadline=$(find "${RECIPE_SYSROOT}" -name libreadline.so)
+    if [ -n "$libreadline" ] && [ -L "$libreadline" ]; then
+        real_libreadline=$(readlink "$libreadline")
+        sed -i -e "s/#define LUA_READLINELIB[[:space:]]*\"libreadline.*$/#define LUA_READLINELIB     \"$real_libreadline\"/g" src/luaconf.h
+    fi
+}
+
 do_configure:prepend() {
     sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
     sed -i -e s:lib/lua/:${baselib}/lua/:g src/luaconf.h
 }
 
 do_compile () {
-    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux-readline', 'linux', d)}
+    oe_runmake linux
 }
 
 do_install () {
@@ -40,13 +48,13 @@ do_install () {
         'INSTALL_MAN=${D}${mandir}/man1' \
         'INSTALL_SHARE=${D}${datadir}/lua' \
         'INSTALL_LIB=${D}${libdir}' \
-        'INSTALL_CMOD=${D}${libdir}/lua/5.4' \
+        'INSTALL_CMOD=${D}${libdir}/lua/5.5' \
         install
     install -d ${D}${libdir}/pkgconfig
 
     sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${UNPACKDIR}/lua.pc.in > ${S}/lua.pc
     install -m 0644 ${S}/lua.pc ${D}${libdir}/pkgconfig/
-    rmdir ${D}${datadir}/lua/5.4
+    rmdir ${D}${datadir}/lua/5.*
     rmdir ${D}${datadir}/lua
 }
 
-- 
2.34.1


