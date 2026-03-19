Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D7D1088E76
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 04:36:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4035.1773895004269264321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 21:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BU7q9i4+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75383f0eaf=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J3hLJH1970870
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 21:36:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9Kci2N7hWOo66bc/mIbf
	HJy9ppbb/tZoKMNnAgXM0Bs=; b=BU7q9i4+jmR/6MUdw1X8QB0XloL2yd0esBxW
	TtDGuC3KA1ytse0QDxv3QuBH1PpW4BWk2Z6hZpdq9mYtg54L/lIeEY964ZE7pMjl
	+MKfv3XkHBt9LyS89vVppEB/glvVXw+Jju9EgEUaeLX86SGr0OCs9KW1TiBFadEZ
	BhdlozaEkpiv9SqqXyRxO+VlH+rjdRIAExpHlflAWsRms/6zRkoVazG2syBLFPmO
	7h/Z+i4Ob3eNEIQ9ShiBMVxNjZGAKVei5L1ins/4C2Qd52T8TztB4iXSbQxtUS+4
	Zih0elNel/vElGNDEppV3kdMzVul3DZrhh1ZnLdrsMs1DPfBXA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011013.outbound.protection.outlook.com [52.101.57.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dwms2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 21:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ac+GY9eqBstJgpKF/ckEyNYvLcgeO9vJyJyrdyPuJKWDDCSZc8kT4+PSKtJPg7tw4B/hCtu6Numi2W+/RkDf+j44CXrsvwCPuQAW24U04idJrE0ccMOGR6zcgMzYk7lo5GP9TnJjsnNlg+uoB2ffU8XV4Xdv1sCUpnq33Vm8D98LBp9hzI3jt7ilgeVLiO7xqIuPFoDw9wggsYWNVnliUyWzQkAfkXD+ItAMvJ9Bvf7J+n55zmCPp0FbHfydma5WSG0U/d3gEdwlS4KxpMZeKWYlA08A4ED2rB9XBwg/uOtbOXUhQraHoV5YPr+RrHSqKh0UVbeQRdBTmxffUMsRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Kci2N7hWOo66bc/mIbfHJy9ppbb/tZoKMNnAgXM0Bs=;
 b=O6t+0nqwVnTo4qLnbIi515NMzRxrkFAJuNS/zk4TLKE6GdC67IjWZkhLFkGPdDanruB3e1Iz9QuT77Ttoi/b+IsBwyMXHPdl2oxv34nDIoRBLheT5Z/LgCtxj5A++G9cLfDgy2/oQ1riz88r99Ue7lOOIp07vq28xKMqzTbhgA9IZz7bgQ0h6SVv6tp67ifuK8NguRfHMwWFtA5ujPYvohudW+PGp3XKq4HCi3f8Mhjl6U3ek9VyCDMCsw/vDY7e0wbK7RY+EdPt3vwsFyJ79l3CgP6C3AAZyvw59IWuAlz3RlKTavSPLkZKfeSOcsAYNXsOJucVg/MOE5JVdLTA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6965.namprd11.prod.outlook.com (2603:10b6:806:2bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Thu, 19 Mar
 2026 04:36:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 04:36:39 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] fixup! runqemu: restore support to run inside SDK
Date: Wed, 18 Mar 2026 21:36:25 -0700
Message-ID: <20260319043625.3641522-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0459.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: d8222949-eecb-43d2-c92c-08de85711c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Cg6RN5ZmDGRhfA9uPByZo5v3+CHhUqzcEioN1K7AxkypMKEpzn6QEqjdVgk6S0OR8B/TNAL9P+XnNsEVpm0nkSv0cxKTBsjpHFruXOjclj7X2YmWoqC9J2w1tMJhy5UnsHZ8BmuxqkR7Ipnc7MXIXU7HPL0BKcRkAUNWwfWERsyEtTpckNc+tJRPrCSQYbsEIErgSv87K34w39iGB0653+u9zXBoOifdEaQKpZkR8jqCR5Lyqz9UyqY22YFAhQFOcdLW7MngczhXcVHUpxDBaSxPiZHQsifliEZc3noTb2BwHX5XoL1aq1aKCT/CvNQWtJw32W/aszlC84CPu9DxXAucbyZMXp3t9pA2JZrHpZAza9awpdC3xs010XGDJAMZNixA1chmrwz+bcSPCT/Kl+MgxCx+VgZFtzEEzsA9DAwa5gr2FozE0MrQ9Ahf6jPE52NzoN9fjyRuTxue4njtTpuZYNIvq4S2+y4JEiG28+LfQ1d8gJxzT8MMn+WXlVA9EQkTCbFRIVQ9rwnkxo/hs0moQHDdj8aDabExDlFm/jUfoVpiKpdTqNimmLlOn/Nws8hlZgM9jQXJBVL5ieiO5clTeMcc/KMdj/9vqwlpjKwGYU12S+hN4NOW7hpgUqw6/L3BqSC83KwvPLsJfqiFMAxNG8rVRM65lnZ2VUGQUswWSEikabVUZP4usrUqDaZX72qz3vPhxoH51PlMuVxyQa1etv6roEd+rGrsJtLcNNEzz4B05/UGaFzf3bSVaOFPAIyhEQMQJ6fxaReBPROqLEbUhBwQXnkyXwKu09dJ480=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vw7Bma+/TzULp39Xy+9lnCeSPpIFkaEjFUNptdiZKplDuhtR7Sr8bi6jtD5q?=
 =?us-ascii?Q?5Mi2L82HgkVUmvWw1yPrn1stHzLJxaYhtz2me0RUL0NQ4hdUROKJUWgtz5VY?=
 =?us-ascii?Q?3cy6cd30sYQeuydee8+TC87fk5yDbYbJSiQG11nAiyQFNS810/4ZxuA8zLU3?=
 =?us-ascii?Q?ZxKTw4q/Hzk1k85eTzZGjIdV4Ce4cmVI+4QGoDUULpqVEg+l3fHP5a5+Plxz?=
 =?us-ascii?Q?QY3Ohp3xegv7Wd0MNLnf+KiX30Z4mRXkmDQWqJiF3iIA16jd9F8dg6q7SMF1?=
 =?us-ascii?Q?T9HL+iKoqLXS8G7VijWezVy4E4t/obMHqMb8bQgkNbDJiQTqb8c0o+74AGY3?=
 =?us-ascii?Q?zXR0rRBF35W3jmCO6OWGgV3NjnHkzvfJKhIkLkTjJlTn6w27iZ8TQRozIgi9?=
 =?us-ascii?Q?tkn9gRLQAD5la1OX3hJBmTP2RFgmgQB+saafoIW1GBnnRvu/qwo+zUJ9PE3s?=
 =?us-ascii?Q?pp1EVuwRysYomKgBzymR8XG0p085ub2zueC4cbloUX3AX8fql3veYuhzbH+9?=
 =?us-ascii?Q?eUxp8h5q12pm4V2eLh7dmek+ctwQqMmIfLW3hslIyicWitVGNbmx+a+P1sy4?=
 =?us-ascii?Q?uDfBXcR8EtbW6k/+wAIb3Xz5a+VL4wG1joufYsZkdd88kSXPo30EsMyJ+7lI?=
 =?us-ascii?Q?hmGLkeMIhWgxBsnRsldMoMPXO7hh5OMbkNQFStdlpY0dvizMNGmxrFamo7Om?=
 =?us-ascii?Q?ylzDTNEeWQ5YvGOdMP3ptnnJjjxN7WuwITbxre6WGj3k4U0bv1eDr6Q4wJ4b?=
 =?us-ascii?Q?8Z1buXXb1i36LehEF3lIrQsSt5XYitY3z9sXqlgwFC8lDLb2MDrDTnq6T+0Y?=
 =?us-ascii?Q?IJak6P+Q329alf+A8GOYaqV8glmB9VZl+gljwHs5MQdWYOj37Z8oSEmBGi7g?=
 =?us-ascii?Q?eR0RwxApc+ozg1R3ZsiuTQorJi7jjTf7na4I+WkJIAc/6hncj/IeSSG7P17f?=
 =?us-ascii?Q?dDcbPXEoJeR72Kx2s+oDKNimyqMrTaa0bS6nuJVQAgsfV8AKai0cyMTRg3yu?=
 =?us-ascii?Q?snM80NgqXgvdzSvA2I7rCOEoGm5Gx8t1RUAJxW2dJzMjr968o6ACm7I+d0tT?=
 =?us-ascii?Q?qVG8f2cFlvus9AxXCBLJKdcIyxtLUZkSnX9/MuPsBFVuLfuiqgyOgLfH5Pr7?=
 =?us-ascii?Q?U4V6YSfAaRYeIRPaUAmdtE+FQ2AGY1X9pejxDs/noNh126o378Sw/2HhM+ac?=
 =?us-ascii?Q?HGxaJNeg+6f80TL8rUSvFKmcYHImQJ0bzESWazNkUDzt49P85p/dUExbAx/4?=
 =?us-ascii?Q?ND8+0+dDHaeJUqc4ggJNBRJ4JUUmSOONCGlPMVDjBo6ydi9hTewwHGvONab3?=
 =?us-ascii?Q?s0yprjkz0nXP4ewN/Qamu3xy9U4n18/E09B8zyTimRlpcy6lFnF9yvmhZsC6?=
 =?us-ascii?Q?fJsvJwp24yaC26LwFHz9UcD/HqvLQo2nr7gfb8OCFVVpcVdEpZweBKKSiPQW?=
 =?us-ascii?Q?kz/ceHLENb4EhAEUZqPLYB9wTy5Zy0AXGalZl66ENjBpxZTPSlCUP20B81Bg?=
 =?us-ascii?Q?MAmVE9gEUcgjnKfriCwGWIA1FAM6tWocFljixRCD4unpH/jAEh/e8D/nTqL3?=
 =?us-ascii?Q?O7Rt4Bm2O55yayvKdsRjTWrRvd8oorGCnb1iFlxFeFNjX9kPieXMCT95evjK?=
 =?us-ascii?Q?H6scckpUPoyahAMubA0L2smw9bmLHmcHvdTk1kMhecCLSsJmBUuJjqOOoRFG?=
 =?us-ascii?Q?u+1bx1kRaPXqY4Xcq95McvAfwAV3BsUVhOUQ9Ca1QS+DPxo/c0SIyahfc0Sb?=
 =?us-ascii?Q?1pSbair64w=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	lsg5i0u72fG0aCYEbeHj6jYR71uR0Il0VNmMHn7jmrwCepdcGh2wOsbC1Id6g+LMFuPJO2JxEubVvmncJFFhcQdF1BPuENiZfK6PqpUdOQx5Dk1iUVK2qH4voiPG0/bKlYcNTzaG2LNgyxggRSORbv/m2h5qKQ4h571ncgQTXNW70RiNA7qZloznPmddpxmLhJwHNHZjqLhHcY2LCtw04r4Yt47/ttnEgcq1LrapUYF1a07lmscMWWEq390b857tTwctt4kl/uWuWk8zTB9IITfDVyYM/hCnNG+6jl78jqIntICSGKPwwwkmG+od76MoMgyGpwLERW/SnRGQYoBYsQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8222949-eecb-43d2-c92c-08de85711c99
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 04:36:39.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNOMyiDDhcPIi3dKQPfO+BNLqTTSuZS5q1i4bfteajhATUFddNiiR0yfXyYDjqDOqSOt/j/r6wlt6RuBKxuPpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6965
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69bb7d5b cx=c_pps
 a=g4bHFsidlxN+L/prI/sWbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=qTdl-SqEKb-V9jfSsi0A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMyBTYWx0ZWRfX95isMaylwz1I
 S0XYBkNx2J9siedSHIP3t17vuI8W16ZX6kW3d3/LyhE0X5uzno2B8FtwChWPWr80GIViMNpgrIh
 3Wprb04kMbx2HbysHgxpNV17ScDCj9dDXX9qBxHsllgjAaGwW4Mnv7AQQXIlKelFwTmuIskVciR
 cjIf9Psko/8LhArOQy00Ru12QiEDapl9NFsXYp/yRb57mH24gEaKEcgaUya2EGWVaFRFprF1uzK
 uUiWzhLOq9KfV80+6S8JPGFowXnIOxtcL2QIuJ1b+7F/vCSIROl6enV7dJZCawLQeOhflQiOjkG
 zfEXBGGPoUa9VSRpC4aRoJSjVjLP0NKxPZ3mGFRKQKB+9GxAH7B96pgBexJPses+Nf5HH2OPiSD
 d6H+BiZdjL/lrfxvDMNTeKetYLHsNhm2RiCD5ffSW9IDlmQG5HJm4EN6RZdd3tqDo8KYk87mzUi
 Ui5Ct0FGd0COyvn3QEA==
X-Proofpoint-ORIG-GUID: ynZsKHxntDBpk3aJc49p4D0HTDD__tZt
X-Proofpoint-GUID: ynZsKHxntDBpk3aJc49p4D0HTDD__tZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233458

From: Chen Qi <Qi.Chen@windriver.com>

In previous patch[1], the os.path.exists was accidently called twice.
This is incorrect.

[1] https://git.openembedded.org/openembedded-core/commit/?id=972155bbee02dd8061fee9c07a40f8e9034b9a3c

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5587d47865..d84c6fdc1e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1005,7 +1005,7 @@ to your build configuration.
         # If the STAGING_BINDIR_NATIVE directories from the config file don't exist
         # and we're in a sourced OE build directory try to extract the paths
         # from `bitbake -e`
-        havenative = os.path.exists(os.path.exists(self.get('STAGING_BINDIR_NATIVE')))
+        havenative = os.path.exists(self.get('STAGING_BINDIR_NATIVE'))
 
         if not havenative:
             if not self.bitbake_e:
-- 
2.49.0


