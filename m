Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB1CD10BE5
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 05:50:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5706.1729921817618893367
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 22:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0029ada225=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q5iUJF018324
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 22:50:17 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42cc9m0ux4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 22:50:16 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49Q5oGQl027874
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 22:50:16 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42cc9m0ux2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 22:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFrNtvBwiWX6k8hI1uxMcSnHJlIAJ8lN7o/PjIK98ovkMu0y4tzS05tVExJy+pxnlc6kf4Tjr6qky0yDCIawC6b1EBUCr16eBNn62vOUVVQWjD+z3BxXHgLPPYpYdSIefV7Jg5ctvCsFiUFpjGDpLkYj9i9RPMWJhybqZymqFEN/oe7HNbtidj+k9Po09JsXU6iTtrKrddBr4DiX+bD1aw73duxlKoO8CcCus2L/JXiZmlZptQotZR2GcFQAK/5LOy15NZ3IfkWmIyKmcMZTzcQUPAte0esEjksUHKGKHPsSiIWp0+LWWhkny3dHPzwSK2JJ/9SWrXkQN9LISf34Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/yq5jloQ9q79hwZo8U4fSpuKno8FLmV4PXK6DgMZwg=;
 b=WwQ942j2mXKlQZFpBrj94d+/ZmINHP2CyvO+Y2beI8oMHjfcNu91gi4rsxsM9ySi0E5d0XJtN/iHWGzHifM/u90BfqKMWK/eprcinM3k3JHe3sIS3KHKPC9+aNTOv6KbQY2w2dfYA4d15RHAFSCe5O8lvI0p2qOMxsZntHYLPrtSTsDCBHs02UDw1KfYlsyEbmHp7/ZWXOq/7C2vWTf2jD5y/Wa4BtEN0JMvCrCN+gwKCdvhSIAm00B/4wq0UP8O7kaN+MssEVdH7r8X5jdCiB86Rlnp4o/nUAtGDF0hMGOv0K2i7amV6yuwvL5V06XekNKISsER8QEuAuWQ2BKBpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Sat, 26 Oct
 2024 05:50:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8093.018; Sat, 26 Oct 2024
 05:50:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: rasmus.villemoes@prevas.dk
Subject: [PATCH] systemd: fix broken links for sysvinit-compatible commands
Date: Sat, 26 Oct 2024 13:49:46 +0800
Message-Id: <20241026054946.1621428-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0029.apcprd06.prod.outlook.com
 (2603:1096:404:2e::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA3PR11MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dfcb729-5f0f-4f4d-61fb-08dcf5820efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J2du1xmFrU2Bxk5anoSJjJWcnbLUU7SZRfRizvBmx5rg+a17wgtLNXhHVXAZ?=
 =?us-ascii?Q?F7oqz1OqYtwi/5hM1Fw5QoENQO1JwGF54vP4DUGQXKPku+g4ebfl2usRBu6Q?=
 =?us-ascii?Q?S8anSlLIBI+NaYrqdeOMSDX3I1ivTB0vopZfkj0AQ2d3OwJ6dCM9PvH1Shx3?=
 =?us-ascii?Q?mVxoUmatCcGmSX5bumpefL5Gi58F2J7lxAWTqAeTfcRwdsWSrGy3xtrdtwPZ?=
 =?us-ascii?Q?1NYr4+vEuAdLseRVTx8UfZAcQmhTJRQBpZj9Fn6y0jK9wfR6k2NjTZT13SAC?=
 =?us-ascii?Q?b9iRyZ+usCMgYH4f82xfLyb0dyaxMEfDrHCREuOmELEitWMxDji2iNjgVNcs?=
 =?us-ascii?Q?gwpbGLj4Sfz9xIyB+VHYF8vB1OLKYQPF5yXnWdnEHrxIAggps5vPmJQfo/cN?=
 =?us-ascii?Q?mIw35dgzJshi+i9ekG7OJJx9nPE4oGzjquzGOVXDsI0EaPBtneMnUDrZ767m?=
 =?us-ascii?Q?5qytDWfuoitqnN4Ps7hx5Xty91bBVHeQKp5vj3P2rDffjhQ71UrrwBPrqy+p?=
 =?us-ascii?Q?nBFIPIBpMTWnd9qv7PQCSra/HwON1amjZ4TpvJYRdYdDSBTP/yOhTFWawHEn?=
 =?us-ascii?Q?E/VPDQFxz1VkHJAlW/NCkkkz7DpfApE/yeEhh51Rk6PcPNo1WshzJzJ7rwjx?=
 =?us-ascii?Q?1+CA7bKHZO4CKATO1yWnfCLXjfx5Grtkx6DDCQ2ldKbqXO8cWjyEOw0w2i74?=
 =?us-ascii?Q?pCHRfDJ3vz1pBOC+CEtprulnM154zOy9tL0PJ4JkFNQV5bhHxsvrAkzdWbCQ?=
 =?us-ascii?Q?1tQ9+l5MFDucB6CoRespWWBslfx8g7vVyPxmoa4X54HWbDQBVYWJzJiI+T0X?=
 =?us-ascii?Q?a22FR75rCSC+P6yaihEAT5zRV9hwgR2mzii2WJ3swD4Hl/qwg+JiAt7rOFBr?=
 =?us-ascii?Q?wqQWJIH6EEESRYeC+G+pmBcTpUzWnNhTVXnzfG/KSI+XPJRuCMaJUwDqSz7w?=
 =?us-ascii?Q?/1nH5dPmm5MvRQ5+xkMXxGhS8A15c8M+cKR97sHW+ZQAFVPB1LtwSI87PjDq?=
 =?us-ascii?Q?ehwZS+QGZLV3b5w54iXXAc7Vdo49eMdo7/Hv3jY/uswbbc3mJu2vEX/lAwuf?=
 =?us-ascii?Q?nRrcBtr8iMjP6BNeFnHPUIUusl3aTwurzcRkRx/nuo40cZLn0Lg+5COURAjM?=
 =?us-ascii?Q?ZfuaJjvzsp5wimx9I9y3QgCxGcUPpdyNYdirbAUcxwwIv7nQifKnMsDmD7ox?=
 =?us-ascii?Q?wsbySa9XsZZ+cMfHOdZsbmSwiLGOKFzPMsqOwBYkG/18w50YFGhl1X9iOF5L?=
 =?us-ascii?Q?EaQzDBso6nNqVwWtUHNOQ8zBFlCFXkHYT6cgiyPYDxCvwYQd+oFcIpPj/slG?=
 =?us-ascii?Q?sGsD3kc6N8NtZf9Zcv8PDO1x?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gFcjWXe77uT8dWHh76GAHU0wuOEBn+Dx2ezldn8eCM3Yv7JQ8Swyc0C+ycyQ?=
 =?us-ascii?Q?xeolfdfQNEox6v34PPsKrr20iek745iFrVWkxi2yBeksmuT9EJUAk9CDdhy5?=
 =?us-ascii?Q?9dGqj+fjQf9aK0A+nJG89yWT9GvDMPtu2f+SMMuEUQwlMwBN5Eo6JqGT+qYo?=
 =?us-ascii?Q?aTY5CVzr/osWMnCh716TMLH6cMjDMuiFBophuoAzudzMRjbk6J7ApqOG+E7L?=
 =?us-ascii?Q?w5kdqGXmjFuBY3mbQGDrJetlcHJY8xObtEfj2ZzaHyea21Mj5haK5iocwruq?=
 =?us-ascii?Q?tnHZYftg1usU5uVUs2MRCZW4PazmH4FRGRTi+gF0kqJMgg1CH5AFHEqjEY7i?=
 =?us-ascii?Q?E8vxgPuPQ1Ij7ZnoRI/RuiHECYxX5eFNTN2lhXNZqeviH4gP7eNCH2vAqkjc?=
 =?us-ascii?Q?TMFYWafpFJU0H7KIDNNaLRUXIytYYTvs/K/1MJjbvmOQtfLL6snqq0tZzZah?=
 =?us-ascii?Q?OBQe7c1D2pYDOGro7+reIN8SyyzOB3s86fm7UB4bPxROI/3YEl1GEBxKla+q?=
 =?us-ascii?Q?T/8p4RDGvUplSke8QmmkxvGtmh8hRuW/QJVIUar2Q7ucOI/taelErLv/tzpV?=
 =?us-ascii?Q?4NB/HNIALpesGtJI2wFvsevxT0A6C3lUiD5hmoMBLjQAZTpAA+vOMZkYI0JA?=
 =?us-ascii?Q?Y9lyrdVXnQ6hO/neQTCczf/TCizlBYSPSPUTPvwIPUJkyfQxYxfHbNWwGiVK?=
 =?us-ascii?Q?A6FRLE4HMpMfPdpDUJ3pFu/xWr9uBLx43KlGOU/qSC24W6/P7kcIY4Vdwglh?=
 =?us-ascii?Q?VCirc5aML+USSY1LN6AVsqWI+nSrSGd9tDm5bSfrQ2SC55+PopQzRXGpyszB?=
 =?us-ascii?Q?WRkiclbAMa3ngyFcwouJBQAQZmYbqux71LUp1FutElfJC+4qeCoC3TIQlU9Q?=
 =?us-ascii?Q?zEqeglRC4g+/PhW1WX0UoskPw8zhZ52u6K4lf0Wdk98uGk+8/EKm3wKTMjZS?=
 =?us-ascii?Q?a2J134VMilcgXmH8LcfhwCuDF0tMVwkHqC8PHD2OnWfEIcEU4cztMgoocz9S?=
 =?us-ascii?Q?WXgqEIqs9l7lddVfTZjr3V40wrXPVHgfiuMubK69fNbhs3kRHHi7Ept7HnSQ?=
 =?us-ascii?Q?CRBS+0DFYF3JBfzf6u7KjllLTr+hDEz6gCGxn5vb9ewrbtb3ohC6eD8y95tZ?=
 =?us-ascii?Q?RqPgAXr+4qWmdi8QxvNDY8VC03gNAraPFnosylgqiTg+YUcDpI04KKO2Ay+o?=
 =?us-ascii?Q?jMJwchJxgujjitdBVJ8zCsB27mOPfeEiL7nkgVwVPTkMzJTi1R/+AUzT8aCj?=
 =?us-ascii?Q?2XJzv/NQhCBow5tgPx5Cu3nsgJzvV4VlW5zuSZTxKuSHBWe/5WjpGVtWXNmk?=
 =?us-ascii?Q?VIdCwpYB3XYitJpgWESCTK+KS36UVuPjDilmRA61P37NEJM2B3DaGqE6TrOb?=
 =?us-ascii?Q?qoAuJhALPtInLw/qZ/oLKY6l81DJWLtSH63l/PglLH6PpR4KyCvsGRdrtnSb?=
 =?us-ascii?Q?gGihZEhZ407VXw58pduCCBwWEIMKGYhZRFLq0Mvem208ExFCajkgAbKRSH+y?=
 =?us-ascii?Q?MeWcSVXaWZ1Y+zC/9qdwqbG6Z1v/NI0xEp9NWSEqLdmebN8MVaJSb58CQPSV?=
 =?us-ascii?Q?ry7MiFBbqhLrNVTVCMG7T4AsujzyTwQEdNg2S6HP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfcb729-5f0f-4f4d-61fb-08dcf5820efe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 05:50:12.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJr4YrvHwdRHSSvLKaVvUqjhoE/gVemAjXtTZ+kblbQyZ4uXWXrHnhuYycfbNSPP0BbDoicksG+59Y6iz+X1Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
X-Authority-Analysis: v=2.4 cv=ZYlPNdVA c=1 sm=1 tr=0 ts=671c8319 cx=c_pps a=Syk5hotmcjzKYaivvMT4gg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=d5ef1JGLapNL_JmEL7gA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Lo0q6GxLNujccNMNg2-XY4ifZ4YkV1vI
X-Proofpoint-ORIG-GUID: Mo8kerjbqWsN7ZB9XHG3nU_ESKEnEsBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410260046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Oct 2024 05:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206386

Since commit[1], PACKAGECONFIG[sysvinit] is not enabled by default when
sysvinit is not in DISTRO_FEATURES, which causes the following
sysvinit-compatible commands/services to not be built and installed:

  runlevel
  telinit
  rc-local.service
  systemd-initctl
  systemd-initctl.service
  systemd-rc-local-generator
  systemd-sysv-generator
  systemd-update-utmp-runlevel.service

Therefore, links to these commands/services should only be created when
PACKAGECONFIG[sysvinit] is enabled.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3668235fd60a9027608f37251c4b453ed21b3687

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/systemd/systemd_256.6.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recipes-core/systemd/systemd_256.6.bb
index 68f15ab065..af810c0fcd 100644
--- a/meta/recipes-core/systemd/systemd_256.6.bb
+++ b/meta/recipes-core/systemd/systemd_256.6.bb
@@ -339,7 +339,7 @@ do_install() {
 	install -d ${D}${systemd_system_unitdir}/rescue.target.wants
 
 	# Create symlinks for systemd-update-utmp-runlevel.service
-	if ${@bb.utils.contains('PACKAGECONFIG', 'utmp', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'utmp', 'true', 'false', d)} && ${@bb.utils.contains('PACKAGECONFIG', 'sysvinit', 'true', 'false', d)}; then
 		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/graphical.target.wants/systemd-update-utmp-runlevel.service
 		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/multi-user.target.wants/systemd-update-utmp-runlevel.service
 		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/poweroff.target.wants/systemd-update-utmp-runlevel.service
@@ -841,7 +841,9 @@ python do_warn_musl() {
 }
 addtask warn_musl before do_configure
 
-ALTERNATIVE:${PN} = "halt reboot shutdown poweroff runlevel ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
+ALTERNATIVE:${PN} = "halt reboot shutdown poweroff \
+                     ${@bb.utils.contains('PACKAGECONFIG', 'sysvinit', 'runlevel', '', d)} \
+                     ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
 
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
-- 
2.25.1


