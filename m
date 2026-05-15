Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F486CD4F41
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 08:39:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30769.1778834339322608270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 01:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bHTkOt6B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95954df25a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F8EL731446667
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 08:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=X74N4vN5rvG1Rhnh6OUa
	v8XFljUcImGwUc0rLEsXefg=; b=bHTkOt6B7nhuttMC0p3s2x0yx95oalQcf6kz
	QsQMzr69X4QoSHv6LjssOn30cJuryzbhvxiwyVNa104nxmaVZf1vZ7RmIUqKxPUf
	nRsCsFy9bVpbF81z9BBfnwq/Tzf0ZH/FBFDIfuekkVI0em0uMvUXhkkA4may6zJi
	ulmp8OOS7U4cupe+Uh9jGmDJ2Bs0Khztz1b84aZIoGN+XgWQ+XOXDVkH/NmpdEXc
	lIR8/R9BXygvJncmS1UCAUi8cZNqsT9TlCqgbCM9Ct96ySmaoKSRoUD0KeiMRPWH
	F2pnnd4XfUSRK1b6iQw3YcYPY/QN2AJIiCbXQqTdZMSVpof63w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m6c0nnn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 08:38:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mM4KnYTFdFLM7AddZwHL8C3ZhO115MaCqYd1rwaQNEgc1OP0LlaoQesgUx+aZx6SkA6WSayzia76Ha43+WB7Y81WkU+x25LNjtw0bWGgrboWVxg3TPcH3uBr+UYDsKHTfnijHSlLnSHweYLvnceVfiPBuQE9Qm9l0/WreTPOZdTEeI8ep2FBW4UB2Uv/9droerXA0HT/GrJvw69LpBMTTFxvvKQmBhP7b5XcEF2XgeYaeRX/iF7pu26LojbJeQAxgovuBCPjgxCxZkHf0OzeURIiyj4akvsYEVei2sQLEuQu7yvhQb2zt9G9GajrlpxHlLgqPtJSE9V8jwIO/VMkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X74N4vN5rvG1Rhnh6OUav8XFljUcImGwUc0rLEsXefg=;
 b=R0Xi7yxcCEVXff+65cLEjhIVb4DZcwH0hoECFKGLM8I0NTZas+UeE8diufYfUqHbxj+FCinC1hLmpa6uEX3JovAD1DlIgPn3Cl9T9xXsHwKX/DTXwscscVExBxZZOHy0qyhtTAAB3fXEk7RI4vq36FMUry6H2LVJI30KLllxHLg4FkIe7+XXNomI80BSBxIf5DQb+AINAK7li3FuuKqywrs0WKfuWe56fzway5LoZ7B8asz7bJtAE4iDDwIQslRyqXx/4ZiXWley0njNBt5HgKlGhG91m8GxNv4PzXWt1W3abcZ66YQtJhzuvTA4f6BCORX91a69U1BAU7Z6gjxOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 08:38:56 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:38:56 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] report-error.bbclass: add site.conf/toolcfg.conf into error report
Date: Fri, 15 May 2026 16:37:50 +0800
Message-Id: <20260515083750.2884492-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: df05c681-ac10-4646-76a1-08deb25d6721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|56012099003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ku8EkS9Tl4tTNxjK/bfljbR10s3Tk04yWH5U7GkYHNtZrBi4dd/WM7/pWVHTHLFQqAGSCL0JX7o6ajeyYLYhzcNi7bPoGifzw4nNSClhaw0AG1rSke4n1zp5SbONQDBqq296pOGZAR97xqL+OZTU0RkWxXI7NNIqzVkmqCajHGKC0gNjUiGw8m7tn7gL56F26YfEKMmcs/e1JMXJ1br+IIsKmOBy9oOU/a3y63vdsASYsLHl6QyJe05oHZJ6Iyf6/5NeDDAWBUYoD2kLRrjrv9KDzXH1gYY8qLdQ9J7kMgLHQ7uYLTy5bBN1rDRFMExLDaLoQrBJy9qGtLRDx3bipbu/AsV5nHAFDE60ABS3V6X/JEQCKDoZvv632d/GoMyoJzZiCTX0hgiYmWki1obzgrtuvvupKXwd14cvj9qf9yyHj2PAiSuaU0trSLC6b01nGF2Xg50WyYuxspt3xkNrArP2WZLfUWrB52bpOUTv++ntrLtTOmcJSdJCfcdNdxEYCRZjG8XBQ2BDoRq4CMFXfF3TFhA10J7T4Prorhw4ws5km132X9BL0RwuDfIjg2G6D61lzcf1ng5ing4M7pZJ9pybaAhoilUotvY259M6g2EGZddXXkYEIQhcLxBnrlbmWWTL4aW1eCC7lDiz/SNCG1hs+xchtcET4aV7XQ/Tjc/n3QaCY+VlnJ6iapq4AlpZY0HuNIKN8mXLTuDawNt+qA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(56012099003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nHpZ/m1yHRPuNf4iRr+NFHsJV0xfGdlbRZ1LNpBFkWHkx0pAvN9xsnrlppgE?=
 =?us-ascii?Q?J3V+PWdWwoFn6yEutE8TU+Kw+Y5AFDnbCjsC1ZFgztk5LT7M7WVg7jsgDbMP?=
 =?us-ascii?Q?b6EHd6dovhUNBIA72p0qKJrP6iixvxIYxXK3A7LQQNp7ElNvPdxn1EZOWA6V?=
 =?us-ascii?Q?8FCcYEOzIoHQFGZ+X7xYBe5ahf2+wFuiTTf2AElLtB1mZhaZtp5cl4j3xjHp?=
 =?us-ascii?Q?MHKMMKJQdHv9Kmj+jFaCEJTI/YwgNLYyKxHr9piARz+iMd6JhZv2hrfsNFxc?=
 =?us-ascii?Q?yfwxFQdEp15sL0hqaJGwpCxwAeE0V0Oi5IcvVW4Km7VIuhNS/m4nRKKbH85t?=
 =?us-ascii?Q?HGxem7Xv+MJ52VeS70FzG5/v69QA7ImHxmtRgHm1Rz7xZjl3fJgaD9yXHqqp?=
 =?us-ascii?Q?g+FLQcn3QaR1gMPtNFmZj/mIxEfC5wYOfEsPu6S02y3Swt7aS0npqR0Y1VZi?=
 =?us-ascii?Q?tJS+lM9D3rdjHqAwifefL504r/cWdz1f/w8QOtd5wJcJ9BgIYfviKXh2SuO8?=
 =?us-ascii?Q?BDqsIpTj2d4FKKOpxAU1wrV3hMv6747/9ZLOxwO55j4+e6GhWzA9jYioxJwI?=
 =?us-ascii?Q?go3QB75kNxb3dipjGWT2EaNesfHZ1/ZQzRq9divDMH/wO7ieAf41UqZV+kag?=
 =?us-ascii?Q?pSDDCNEDSFiCsuF7SnModBqQ5JqV+Xcwcl87MG+VmnP7bKXhIXxDUlynNx0p?=
 =?us-ascii?Q?HoNyZnX2CMVHWBOQr2+yQPF+J24t/n3UpJQNVJF1Ob0h7UezdQikKlZOUCqM?=
 =?us-ascii?Q?DI7wwDWcB/vqoRAvX7mP8IrfqjkDH+i/JrMyNw50Zhlt1eDAM1Me/ssHkBAA?=
 =?us-ascii?Q?a3Xi75ZoRv2akmYK0umxCIqbqtn0M5dJxbVb89rnzjO+YZIzxaP6jG48+ofk?=
 =?us-ascii?Q?SUSJ4hwUnCjHdpUMzRejJas4I5DyqzjL1ldpXGZgLXhUOGqKzcRYS3KbvwoX?=
 =?us-ascii?Q?30d/mem1tef8elZ6zwQ9NwxVPq1ozK5wsaBoe9VKfq0F2jrz0UGJ02oXJn3m?=
 =?us-ascii?Q?xZ4fhBa0SHg1eiA2+5dQsrnsXAmiWJQ5aLXqsyt1ELKYrq9WTirM0K9vtYHT?=
 =?us-ascii?Q?tXhBiD19JMJvfZWkuS9I8HDbsBIfCsJMKJfLqx/N3GrDdeWj6eTYxXOOqjWA?=
 =?us-ascii?Q?MIbwX8H/06Aw0bdTLvnuEji/uJ9HFeEw/2XpUZRivxKWXW7jo8jco4foQFPD?=
 =?us-ascii?Q?LU3XQy3gkJkrvA1aHYpaqbZ2G2pcMpN0htcVVCANFNw+6kK0dLWtgxPRJ2u+?=
 =?us-ascii?Q?qlZ8rl8jdwyM3oiSMuj8aXOMNttc8O+vvA0tOKa+efx7oQrtKPGpuN2S0rJg?=
 =?us-ascii?Q?Bt7fajZhyBYeJwSPBmXU2bAZ6nC8GUIR2p4tNjwLShiRnGEAn/NczoonfIF0?=
 =?us-ascii?Q?tjBz4bZKHokzM04ZIBw7YMnHJEWulRZn5/TzA10YYmxLxWSq6ozdRy0fupyj?=
 =?us-ascii?Q?wUf2cKQsn0aIDeaopl0DE0nc9T9J4DPe6HZNyJATxYWa9RPrLsgQXhjzcV6K?=
 =?us-ascii?Q?J9xVIT1ZP5zo1sfQrqw6v29zuwGxhQP7SqrDT4x3/V2Jf9LyQaiQgB9hMUPo?=
 =?us-ascii?Q?Edo7szgZGCTTTrmMXZLNONeEHkXH+kXFYke7SPv/u6hpRxZsSM+S4ry84Imy?=
 =?us-ascii?Q?s3cwbuosgONoE9WvpFgbxnXxHBnJpnxPNtWJuKEtCUUEbLPw7HbfUA/pM0+p?=
 =?us-ascii?Q?kynJWj4koX5tUjzfS7wcvUAAxv0509/tUusrNUI0lHb63CPPTf5DRuKsE+ts?=
 =?us-ascii?Q?z4EjR3kUERJU6Qw53JOtVHKDzG1Onx8=3D?=
X-Exchange-RoutingPolicyChecked: 
	JYoVA+CVS3Y5Kov0OvuBcrflpuHcX+YZYIFaBnBT6XaRlbefARSvEfuf1Hv0Wfw8Z8T1HNq9paELJqb9NKczTzU0BI6mPJIqOtuc5Z/UkoMqGcABVC23JheMuXRjxpfDtk3OevmC0E6xYoy/986a0VlMC+Fb6RNZQAt3cEMK3Q3XfTX4Sv+jMJOFu7feWsLMRAXXS4WjsO4pAhrPpL3Hi18BzVJZAPFeQXQbj73Bp0/CO1pBUJMD7IcmAJ8hy3qjQ/aXymgSC9WuAfGdSMCzaOZ8NEkOdqhyzYJacq/p2dMrSBbi50h/kZTXw6d8s1GMN/mfsDygpP1UW3CbWTjgJA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df05c681-ac10-4646-76a1-08deb25d6721
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:38:56.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7GmT5Pc9qOHEtGAL0GIYucuGmU9Dm7CPCbjbOh7ht6w1Qak3cIBygjt/GF66oxXrQKfgfkWD088wfkhNWOwaw5Et054bdTSK4y30SzT0vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
X-Proofpoint-GUID: xFqOqDm091bGQnPsNDY0rHHiPHPr5Uk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4NiBTYWx0ZWRfX98eFILhBt3dM
 aKjJnAbA+nTV1f9d/l6vo+zsQMugodbV0ABi5mJQJNFDdEnGJHCGgjF0EaiFClrqNIQ+jokOU3X
 ov+iShuUg0iIXJpBq8QPTWfU9LMfmuVRLSF3976C9uSpqQKWU7jwJxkRpuhMT1tNIhax11l4phc
 yjIG836+VtVBW+XEoPu5ItQotNPc9G2iO74plRXFr1cjkyAPw8wjgJuVwHuftLgI/Q/cPhlODkP
 RlxzU6BqdC+GVMNHIiFY/obcGsXj47n14r8AsINu7ce278x0oB9KZQJt7te7vANS6e45E2IhYBc
 vzoHFM46lhB9nxbuNAFA2yTI8nXJkwx/T4RNcvgCTyBCPVg4iYaLp5xVV++YK16kJCjJksuXiU8
 /eEBJVCGrzSB72WvXsDiF5EImb/74hI0RhPqxmsVViBuJBmSqfoaq7TZbbIQklcsAcpbkJXKog/
 Z40gvA/MvgiXPOh0y2Q==
X-Authority-Analysis: v=2.4 cv=ZYUt8MVA c=1 sm=1 tr=0 ts=6a06dba2 cx=c_pps
 a=zXfEoyyUBsLHcbwyVEaNwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=3Tz1L2WpBboNMrdT5G4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xFqOqDm091bGQnPsNDY0rHHiPHPr5Uk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 08:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237069

We had add local.conf/auto.conf into error report to help more easy to
reproduce a failure through error report, recently oe add a new default
configuration file toolcfg.conf, this commit also add site.conf and
toolcfg.conf in error report.

With this commit, the error report file will have the below snip:
[snip]
    "site_conf": "DL_DIR ?= \"/bitbake-setup/bitbake-builds/.bitbake-setup-downloads\"\nSSTATE_DIR ?= \"/bitbake-setup/bitbake-builds/.sstate-cache\"\nBB_HASHSERVE_DB_DIR ?= \"${SSTATE_DIR}\"\n",
    "target_sys": "x86_64-poky-linux",
    "toolcfg_conf": "OE_FRAGMENTS += \"distro/poky machine/qemux86-64\"\n"
[snip]

[YOCTO #13252]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/report-error.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 01ac1f2a37..ad31ac2583 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -48,6 +48,8 @@ def get_common_data(e):
     data['layer_version'] = get_layers_branch_rev(e.data)
     data['local_conf'] = get_conf_data(e, 'local.conf')
     data['auto_conf'] = get_conf_data(e, 'auto.conf')
+    data['site_conf'] = get_conf_data(e, 'site.conf')
+    data['toolcfg_conf'] = get_conf_data(e, 'toolcfg.conf')
     return data
 
 python errorreport_handler () {
-- 
2.34.1


