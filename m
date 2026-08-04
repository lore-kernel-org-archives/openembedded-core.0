Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D96C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:08:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9548.1785816521529393840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BWhwOTl+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2676761eb7=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6743Vgea2876830
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 21:08:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8kr0g5DQ9X34LBibsh1mZHpiLeMj5sqZfbLU0sFNyRQ=; b=
	BWhwOTl+mK4saBgTymAy8u+960jgwcF+XDiTbYLMg5MYn/cbW0WDwNjq4d09vivp
	K5JhHmsopNXM/CGoFp0k29+7tmpU6Sg5AhqpvtaYa/HONGxerWsaFdKjcKbXUwRi
	5QekjnQgPQmoQ/2ILj88Nnq12t4rudRlOD2SEMR16gmtQMArUsMIs+2At5jABNWl
	RELJk7fnsmv7oIQWL54YhEPk9uXdoZUSxtgh+YHnPuJQ6ioy1vq1cYk+7ugoyPj7
	R1u9h8qNym7fnX+JE8mNT1umA1hi6cv/NIVXZoAdJKDXQAJqcYuKb/7D77W4cA5S
	4dh3HOVZHwunEWdAzbD5OQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011063.outbound.protection.outlook.com [52.101.57.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah3aem-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 21:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCJ6gADRYaNdKG2T87CfQ4D3SMyxMo2sDop5kunqCm5/DCYdsPB9HwDbZC4ANlF/6v3RaN91rs9JCUFJPuxVxGJzkuXg8TdFxIee5eSY4itafJb+FXss4WUy37lC5qaJ+NZEBC9d7GGVtwpyqc6YQHtocB9moj9YElB6CtWc0k93a2qVcFtYk7BNG14D1jJkZSQiZSt7Myw3tiGPlSN1U72QWpj0eqIx+Z1njThYIoA0DzaxFQWHs/UUvcN9YSAi3AJkYRLxO/9SE/YNu7G6bsCWJIMryaiuDNXAyk3BqSRESAcEBqyW4WWI5pPkcSvG/L8peg4Y0+LRgJMH58oobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kr0g5DQ9X34LBibsh1mZHpiLeMj5sqZfbLU0sFNyRQ=;
 b=uaaS5Nl4WiZbv4oe4FP7XyL01+D1su9S2X7IYZhOTeNWEwxsbDtvBVYuCpjoWPR7lH7D8y8mLke/jQ5EaWslI04xLBHk0NVL2bgmfQVk79UBWoFiL4CmbvSeAFUwMIJTq/cyoQoizuyZXTCNbLInS9ct+g/HtyZB2z49OPVlxS+xh9ski7FBZALPdVk5ojorFmeGMp1qGzAdDiSu4drK3lDK7Qw3bft3494RQtGubOSyoI3j+BUL42D8suBsPOMggGi+WvldHh/lYmdWCTSvhE4WDowaej8puodT47RqgtZLo/sKJ0wtW4d2/kST709HG+p0X/lDSftGPHr+r+Umgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 04:08:38 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:08:38 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v12 8/8] rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires
Date: Mon,  3 Aug 2026 21:08:15 -0700
Message-ID: <20260804040815.1499699-9-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d15b8c-0961-4569-faf4-08def1de0f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|38350700014|6133799003|56012099006|5023799004|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bU/TftERmEDNE4xCfCgmYxLwAk5JSEAFEqh71Z2hQpLzDtKEPVWz7T+ApKBJVjtDnuLZii/ElDmXN1UKwsgC00IIgIO1KKivAjiCsWdEycyKUgVmW7I0d42DsI6VnlSXMMoQpVZP/k/tJuZWOZ+VguCuG2R7sBL/bldChZrVzwThE+wKKxMgl+2J9qPGCTlvszOd4BgtPlwx++prqG1XXm7G9eLZ/xj6uCqaMNOQQ53obeVwut/Si5dJ1Yer/55ezbyyr1/wDki4S4PoHutIyKdZDWb0DwaZX+L/vMbU29IkpoZoBVoNz4AaZnHhLr8v6Z9kUUyfQdrvMkW4cxtIj4QenXvJyThIL3y+ZxNx1b5BZcIlPFNOhJaqVuGOW8lLktQNssEZwTCmvE5Z1Tdy0aoazaVHrCF4KHCYoYK/Cvr8zFDcKFFSTprgjzLvBCAZzNOccILJ12hhEz14+V/UR43knyfN2w7/SC24vPp9Oa/vz4HDOZyZ8xil5O9xfxs36+lnGUBOAykxL+/WCGLxNCapfvc+mVieaaCwnc2PC/NXFZ7C4e5SHpybjXhzDWV/bOyr8n8az3/cXnVbZ+ceyThhjZekJpzNwStgYi+wI7GdlzUiXpfGL8OyaPQqrannw/dq3TFkMbZVkBx5ULzOqgNcodCw093Zi2K3ewmGNpktVkgPVroHkhd0IdBEQuvChPbwOwJfDojh0c9M9scKe8zCV0PWfa2vc9/9Ly0tI9k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(38350700014)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h+PUCKX/adGPkmrEz0yIh2aW6PJ16tB04ApqZZoKJRcz1Ks3KCHaj3p0KLvo?=
 =?us-ascii?Q?5OnLyNRcA2EcS5CY7V8NeMGpfiqSoz1P/7/m+aS2p/4AR1Dm9R/3k/6Xl97Y?=
 =?us-ascii?Q?L6bXAa4gcle/Gr/Cd1qLVWWFsQRCNiE0Xxg8IJLf8e/gGBh9dXpGArdump9J?=
 =?us-ascii?Q?RzAznK7nsVoNsR/XY69m8RI+WWXDpNkPIHxGFmm7Yqway/XVHR6uAs0ANAvi?=
 =?us-ascii?Q?DHvrhJH0xZ7wR3WWPvbNzLzap4xvGdYyxqQkjwVtHDKsTuGeJuM3karHsxvb?=
 =?us-ascii?Q?JBCPso6s8579eJNK1h4bJ4XOKeKVUFGbMPAGqsbS40qwY5nirUqL6CaxxsDA?=
 =?us-ascii?Q?Z8ubfR20TT4E2NRcc0myiu5Tk8bi1mem9kgIaz3Og9M/0dgtV7TVlGK06W5f?=
 =?us-ascii?Q?hhGWCdU/K0HRA5O4+Hx/Let1TCh0ch61+lTctVVCwLlzJ46kPZmavo4xyhBb?=
 =?us-ascii?Q?CECUlWttp0cnAKWYVBB0N1PYkWLsGTigZr5bZLki5YPx6CBpqz46rXSe2syC?=
 =?us-ascii?Q?NtoII1Yb+UPx3/JFf8a+/LVkJ4Qd1TWcI4KFbvrS6WAcd3DVaTbiKQS30fSQ?=
 =?us-ascii?Q?v4t98yPJtDyZru0F73r7lWC5K7GJKeplSDqF8qw0F0Kb+QOmscDMD+06sn23?=
 =?us-ascii?Q?OfRjCBdLIGiU9R2QKq/Bm3ZK5AGtVBpKvNp9IqK7PoWm1bXjvPWcyiJkS5pq?=
 =?us-ascii?Q?aRlfO1XO00PIRSIxH7cSv5WtXnNRwo9cw32IKGfzSpA1B5w21sZOgzAq+irD?=
 =?us-ascii?Q?n/ED3cE8uWRErc9jJAVd65OMvlhI9CHnjZIINr3HWozevtdRFvumf1Zlvnxq?=
 =?us-ascii?Q?XeLzrP+GWP9EJhemp0fXTHu58jloRDnrsNwgWAIJMlk7XLdvck9REeGD8647?=
 =?us-ascii?Q?W+Kt1ClsUsMp0Rp2jbosyLVQf9mSg1us83UbBlFJPYb3KiB/7ummCM1IpJzm?=
 =?us-ascii?Q?r/Wqf3ofJYeh3HUQlYT0OFwvsky/eNXmvaxWMx2DWdjcXuEBWXZ7rSl/s/jA?=
 =?us-ascii?Q?Jn5RUUkeDOOWzVsva8HMEDtt1bCiYw+o89at2kG0jjoRDt4BzJcx9nua/vrG?=
 =?us-ascii?Q?cwSqYBgLp11DFaVgpmj87Rd//anctQqGOWpHqQtVBpOsDToPFJlR8VSIwSej?=
 =?us-ascii?Q?oUQ1pKayJjyvmKwSsdkUMwTvLLQLA6pH0r4MN8/h1bmAmOfj4ws2BukDo4wo?=
 =?us-ascii?Q?ITTXLIBzb+N8LC5BwiDk3nza5qVQZQwu5jx6QmRRLW8/3q9LouK8onGI9rw5?=
 =?us-ascii?Q?YhHDur5q61N2abGDAz2ofiigzA7dgePaXXnPLWi2DI32ps+AsmtDSA/fYPX9?=
 =?us-ascii?Q?0HVHbW7dBvdyJBTIy+pXDr8tGHoG8qNyWa6kedMhcomnx6AmRC9warL8+h5t?=
 =?us-ascii?Q?2PsmMuVleuUD+N/tpbcOha8hOdiu4vKb8UoWeBPLWvGJ0172QyRwDjHmhFZX?=
 =?us-ascii?Q?u92+RZKPG/kJABLgECYFYBNNeaG3V4FI598qE9u7vRilsbI4qrgH49LEq+OI?=
 =?us-ascii?Q?PjnrhB0YUhkvhrN2vikfCmrw9voDXMvJHdUOMCyrEuxsBI4fGqle9Z2e6+g0?=
 =?us-ascii?Q?D15yIpdkvJi9l3fakK1sLJGlGwQeDkYg3HOVHLOTVygwo5Lt4hxjvPxHpUcV?=
 =?us-ascii?Q?Lr6qhK0OaB4NNk8pM5Toze28nZeNe6XLO4OcxQ/Buy/7oCpoy0yGaDXxa/CF?=
 =?us-ascii?Q?g4Xbu7IO3rzgtL5K4ZKK48A2P6anttzZmyYqzLjjSIwLtBVQL+bFq5VpoHnC?=
 =?us-ascii?Q?SGQX8VaJcSjRTl+afYN8Kg0d4lLuLOs=3D?=
X-Exchange-RoutingPolicyChecked: 
	mZ6G7IkNSp0mI6BiP7Y8kt17+knhY14gPwm+bG5M9Pn0nlwSR0dwrtvsY/d8pz2i6RLIZHrsMQRD7NO22gp+3dCJ5RKIY/fCPDYXnBId2azf90i3hXYsz1RwFAN4oEAbuvyNuLi1DRuwQglBmn8SiUBHci469ZK2nYhALt0KFsDO8kXSLlN8xy8ELGfSUftP+XtmA+316ObbIg4ZMFNYchqOa44R4lBnhopbZB5H+9klYQN75KP+timmKC+MHwSSptzFKs6vaWWAKsrDbG6Tvd4C6TpupNYhEzsKyUiNk6iuNanroLR7DLmeV9IXe83xwOPYfncta0sG8bNl8lAJWg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d15b8c-0961-4569-faf4-08def1de0f30
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:08:37.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4F/FcBwRaI51nzOaSjU2JXiws77d0RJ2CAGs3mE82fHjyD4PNE7CvS7gWaE7X2NLQPMBtNJyeSS2HxZkRw2KbjP+S/0OGGYQyJJ5AYcmX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a7165c9 cx=c_pps
 a=MlxngMRGYcnGG1Y86Hm5lQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=HWfS6c1Ke9pW_yr55HYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX+D/nezQeVDrP
 5aazrhgKAmx+Hce3SExUw8VLy3eQZoiEifxw6gTXt4sG7z3o7PriAT+l3Bn8AeVjcOPrX+3DpGz
 3IfPWFb7EbUAseei+XFApGBhmY2CGD1oleDgGuMm/uqKYdXaprKsYZUqmmGoDuUUa0erYR7GpMF
 Azfngj4eoj3gm8HUq+3xrCD8yXENb5901EFCl+UTYCrwe6nRV+eQDWxNmukmzJEqkfAH94z5klA
 VFBZu6Iqi1sV9tAK5b2TjEdkF5ca/wK9sJv09LRw8R9pa21TUmgCpT1DtvF3AzDXN//CgSwBDPZ
 z6sgD61MSS/l8jGY5/JmkjWw8DfGMpkhlPJrtK3bUkH0tFR8+CgSRwUTCPCnpWht/s2eGDHlKTg
 0IBoNqCSoNjOd/1M0Bxez37IRNNGJRwxFSJTiy4RBk4jTtA+FioGqLecOrNBtVWPy4oUibeO8UI
 WR2ZkjZp3VKiK8vPvGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX/xFEUmBLUIjU
 b3Fh0qR+Do9lckvjiLrEfKwpIhOWGK0J4c94pmgI4AUHfeG5JkUUfcff0ya71LRsteidAk9wkIN
 tLkX5eNiwRBtUuHNY9M5sZmcNrLT7z/8/FDAwuXVPOIC6WKwvlYK
X-Proofpoint-ORIG-GUID: DhUc3P9l5aHeIIpHF4hAwajW3cdLAhud
X-Proofpoint-GUID: 7AOT7TP7v1lFNUm-Lr337G_ENOChsLff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242692

* Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
  - pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
    Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
    pkg-config is a host-only build tool not needed on the target rootfs,
    causing do_rootfs and do_populate_sdk failures with -dev packages.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Do-not-emit-usr-bin-pkg-config-as-a.patch | 59 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch b/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
new file mode 100644
index 0000000000..4b9f1e1dac
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
@@ -0,0 +1,59 @@
+From f7d33d39e48d8b8c99af1e97bcb4740a9ba6204a Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Wed, 29 Jul 2026 09:10:47 -0700
+Subject: [PATCH] pkgconfigdeps.sh: Do not emit /usr/bin/pkg-config as a
+ Requires dependency
+
+RPM upstream commit 67b68cbeb978 ("pkgconfig dependency script fixes")
+changed the --requires output to unconditionally emit
+/usr/bin/pkg-config
+as a hard Requires for every package that ships .pc files.
+
+This is appropriate for native RPM-based distributions (e.g., Fedora,
+RHEL) where pkg-config is a target package installed alongside -devel
+packages on the same development machine. In those environments,
+requiring
+pkg-config at runtime makes sense.
+
+However, in cross-compilation environments such as OpenEmbedded/Yocto,
+pkg-config is a host-side build tool used only at compile time to locate
+libraries and their compiler/linker flags via .pc files. The target
+rootfs
+is a cross-compiled embedded image where pkg-config is not installed and
+not needed - the software is already compiled, and the .pc files in -dev
+packages are intended for SDK/sysroot use on the build host, not for
+running pkg-config on the target device.
+
+With rpm 6 using its internal dependency generator (rpm 4.x allowed
+disabling it via _use_internal_dependency_generator=0, but rpm 6 makes
+that a hard failure for v6 format packages), this file-path dependency
+ends up in every -dev package's RPM metadata, causing do_rootfs and
+do_populate_sdk failures:
+
+  Error: nothing provides /usr/bin/pkg-config needed by
+  acl-dev-2.4.0-r0.x86_64_v3 from oe-repo
+
+Remove the emission of the /usr/bin/pkg-config file path from the
+--requires output. The pkgconfig(foo) virtual provides/requires
+(e.g., pkgconfig(glib-2.0)) are not affected and continue to work
+correctly for build-time dependency resolution between recipes.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ scripts/pkgconfigdeps.sh | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/scripts/pkgconfigdeps.sh b/scripts/pkgconfigdeps.sh
+index ef4581856..1cab58169 100755
+--- a/scripts/pkgconfigdeps.sh
++++ b/scripts/pkgconfigdeps.sh
+@@ -43,8 +43,6 @@ case $1 in
+     while read filename ; do
+     case "${filename}" in
+     *.pc)
+-	i="`expr $i + 1`"
+-	[ $i -eq 1 ] && echo "$pkgconfig"
+ 	DIR="`dirname ${filename}`"
+ 	export PKG_CONFIG_PATH="$DIR:$DIR/../../share/pkgconfig"
+ 	$pkgconfig --print-requires --print-requires-private "$filename" 2> /dev/null | while read n r v ; do
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index e8977aa31a..32ddebe407 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protoco
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
+           file://0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch \
            "
 
 PE = "1"

