Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DACC61DD7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23334.1787780765973560845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zyql8VPC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKdIFE745864
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	Zyql8VPC8AEE8BUHvpCrW6ZHxsrbO1TGMuEeOIX2jlHoh40vxfS0MxkZpAqmBTKm
	O8zLSgRgTVy5DwE57LoVAb1HyFRJumaz29NMRYiLFzT4tab8zhCjVIa+qIJ2dx82
	aNnPmiQw/xknALkF2GNyrHUqNv+mMNWN4H6yZ5X7qlRtJlYFoS1atIKae1JNdYg9
	IYxJOu3MepLM/JiZeNm2BlP4Yucx3p6ZoLFJtEu23GD2Zv9NJn4yioj2PHKBqWRl
	+gdSjyifKs3SvoG9FLNCyWV29PaBdUH571tNzUp6JS5/Hv9n1ydnsN0wV3Ol1Dqx
	D2ar95AEbMfoM0lx3aAvGw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020100.outbound.protection.outlook.com [40.93.198.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100qm09-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 21:46:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0DiRKOoLJncOxKTwSenVW2pHAW7FdBw0rbPb5ahsIaWSKlEE17AkF3o/EGTeyFBz2JLy1uyslm5KoteYLbPZriBrIWwtaOah3kdu2sz+k8N6Z5J7J30/XKnb2v25DWEloJk+mIoNOtcKRiR18Ffd7nH1QvCt0WJKMhKFIzQDu8y1GSKuvBT7JgjljvPPgQfkTttRcKJ33byFPU/qYxbj8zQdW4vPM+JJcxDrW1BajQvX+97gcR4YIeeQTouGv/xc5EotqIF1NGT2wGBRswVA2ZAVUZMuD5SIh90QHdsbWWTdP2F9N+BXOhM3CKBFRBblMkCK3scXVHDKKrgE05QOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=Qf8DbTXbcwgZxSj1BramYRWpeqrQNyxsQBFSW42BIjRoRwUOCDCpgrUFLQJ0Ra9Jo3rHV0Bknhh8Tq8klKQWXAdTxXcGUuQbc74Xd0IXH0RJbw/aytHZEFk/8Q5aeBsrPtBBOrdXrmi0T4h6NWuuE6tFfWUiam6VA7Rp7tXRlG7mspVgVAUXaG1GUyVUYfrthNDOOYSa7nGRYdvzUTU1VM+8wGkhqx5/+wL3OYZ1lIRVBYuEt8n1mCK/5KymWJ/32sUwdLDpX/vS+f54GG33yZ6q9HXTBN70CuIvWytUScVSoG0HukRWcOHVew03c6rx+rAqZeat7OhjhEcPFX4KPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by SAWPR11MB9898.namprd11.prod.outlook.com
 (2603:10b6:806:54c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 21:46:01 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:01 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 01/16] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Wed, 26 Aug 2026 14:45:33 -0700
Message-ID: <20260826214548.3002838-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|SAWPR11MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 81919ffa-a662-45aa-7b9a-08df03bb6bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|56012099006|11063799006|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	LOl5RPIMWBcgiHehcIl7oPdJaLa2uGL/TM/3jd8QI965ZXCOpVTT3ANaCPiwi0yM1gT9qbgWlzKEv+J6xVFiz1apf8EY0mS6yIKct/9ZY6//jKrMHSkQeG6ZL09ohbB9hdyryp/IvrhC+XUKjNkUG433ravn0QCaQ5gZIfnHzxRG0VClYmEHCOYoFElGiqvf3wINEk4ky3m1d9N1wXMfLw/n49Fvw/dYT1l1GkN7tBBO6euTQOpJlp5Z6VpDjbesXp1VogOBQwhIzh0owxQr4UhzPDZhfnzHNpCfa12qKbIkRVxgqzFmcPnZRqHnAFlQHG+MmY0QvlnjQykS47naWdjLl+DPPd51julWOHzZRM7y48fmrMBdg9xwL0Cibysa0eSTQFtLD2hdheM+BegZVWQjHPF0+bUqe3gKAarb4YQiJ39wtuL0xEzY281QyAqezJx1+0FPCZiH+STjGwBhrDhAy6P/MZ5qYCrjTx62nE1IV2MVMXZ8H4tz023tYsVI8PMxMkXejTXuj2BJ9svi2bm8HzUF/ytLAasZoKpw1/yWOo6CzBRS2J2avElFVOw6HzGAyjNSjH12Pi2LTy1gVo3/n5QHUMvIDToYuu0yvSvv36NlsBVWhxdpP36bbrnROYml5nSh8MslSmg/N8d0TwXbuIZLMupmm7UIO0wyoLQJOvW+gaCu81giZPXcRXD+7F30LMzmrxpiDUCV1A6JEGqiiTKUjV+mi+ve7BFvDuQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hwMofioK8SKkGeE7JKxYXhVhXBqKJq5voKu4Lb49LoAVja+ZlA9z+l3Vges4?=
 =?us-ascii?Q?t41LSe2rEVwU382s6jo8YiZi13J92e7v2RseYmGhMCI2es29Y6IKJezThSy3?=
 =?us-ascii?Q?BQmsw8IpaxHgUwzcSuOaSl5Ulgf48bKpsicmc/I5vWJ5AYz+tNudv46zu7hi?=
 =?us-ascii?Q?sBf92jaDAM53xFCuuQXwb+GhPELEUUee5cYYpUPzdgf+g4Fu4Y4AK+u1zkKl?=
 =?us-ascii?Q?7AXvIDudnQ/rDqJ5Xi9TtUkJ2skS8bXPJRANAPHkUgHt4adlFUqvFSIaZvSC?=
 =?us-ascii?Q?WvY+TVfKwHC/3OphAtArBC+2j8wTvP0CKEAcMguNQJ13sXk2K/WAlqcfYatJ?=
 =?us-ascii?Q?JI4ff4ShXlBNd9HugYYIPIEp4w13LePbjRaIn2QpcwiBLUSZIPqL/R+kvEmN?=
 =?us-ascii?Q?8NQnr0ff8qhBRkn49yfhwqSurtCT5x9y1ilNhSOPmlt4a+tIaH4svNdS8O6l?=
 =?us-ascii?Q?PC7qrefUPLibAKTUFRBdc6v7CzZG1JyT5ZBz+KJAtz3hag5o5mi0/o8DaYVY?=
 =?us-ascii?Q?3Lbooo7WWabB3/bp253ClCYwDFp5+3XqgDvU/AjWXbiQf40Wy5sbZSFTBtYi?=
 =?us-ascii?Q?Vrgqdf3sWQxRnC4keh4S/FvyVsKwitK886L8xc7BZ6LpH7tQ/AoHgUUojt6y?=
 =?us-ascii?Q?hupDZwRA+/lVm0FHYpQcs7vliJfzu8aATciNIhNvejtGWXkpSphNJjyPRcfK?=
 =?us-ascii?Q?Dm6be9WHQG5HvfPWL/ChPp/FAhE60vF5FfHYIXRxLQkF+drobKEIstxJbgFw?=
 =?us-ascii?Q?aS7nONltSbAjZDHsulAHrE5gK97snVX7L2HJOlyXdsHFVC2uR7Omo+mcI3iO?=
 =?us-ascii?Q?zcHZZDhgaSgg/1WH/0m043r6INxjFMRDC93P4qPLtuWllYeY0+gY1RtycY05?=
 =?us-ascii?Q?+iTo3Bc6r1CRoaYvjNAf6gNgAWMfXd9DpeEFLscuXfeSeRlJX4gAvGWJ63ra?=
 =?us-ascii?Q?BkLSfA6NWS4f3ktiBan+e/Y/3kr6GQddHG1fCO70qSzC8ISmExp51FbsdmEc?=
 =?us-ascii?Q?F6SwVtHpe6CpxhcM6o2TqHvLIRa+rNjj3ZEHO1tvYrT34qHzrHLgtzn4EEQI?=
 =?us-ascii?Q?mp2CiSijgXU4PO9drihStBN1o8eHa/+9MQOz98zWaaRCqzyLsXSWZofDkT5+?=
 =?us-ascii?Q?9NPj4OVfXubrgtTvarPV3KMx/DXSpYkltuq1dffPxTo3byXVqhz2dLLk4PeE?=
 =?us-ascii?Q?Ej5b82M4ynw0EECNaW636Ffgr4ZaQd/YPzCOWRscXH/11D9Vm69cxdKzQOxl?=
 =?us-ascii?Q?CkT0/HallgFx8uaL5Ru8g5GXAc4bySbaJNbn48PI+mhmTqwZMVhgaUjkWVCb?=
 =?us-ascii?Q?xIUdMQeOZ4APp92iMTvy/IFPXPxBIgCQMnEFXo94X3jdqUc8l77q60vlDJTc?=
 =?us-ascii?Q?bM3BJ/oI6Zc0A9bUqDiU4+g0PN7v+n9Uh5OIVILoKZs9iQhuE4Vk+tgr2YgH?=
 =?us-ascii?Q?SeG/KL3egWertOqKPYc9re2wmnHqMC2r9DBUg25BHWrEBf9Ccmp6ReUIJ/Os?=
 =?us-ascii?Q?pyaJNjKH2i5zQPmyDF9rSrnZL9YkWah6RGW5whPq+XQ4wWnAde0mgIFIWmWe?=
 =?us-ascii?Q?aDOR4pP+FMSUM3dFUUvRqp7g7huvKgRJTxxRH2LYKNiyz9Ke3ARwYRAxOOLA?=
 =?us-ascii?Q?kHvkYI+mMtz6Q9SS9RByLWkHItmTliBj+bH0FAK9OkCI9Ls+jCyxZ+Bye1PS?=
 =?us-ascii?Q?V+AlqMMlk+rgs6AuvqrdWaJROzBNPGa6XulNLPWiW03X1nivEebwaAzZusmm?=
 =?us-ascii?Q?cgWnlfOEBbvu9EC3CH3/YZwuum3ZvRg=3D?=
X-Exchange-RoutingPolicyChecked: 
	j7FjtCEs0ht40JkLJdNBZVtSMMwnHrZXRHvvpI2xvqoI8Ps8qn5pNGc65UubYJoU903WZuphfuqtL5Tx3JeNrowefRhKn1r1s/rYQd7H/knzAe6TALCW2M7YKOrLiqnx6jsraBOXp1C0ws6lGFrkhLUL44lMbbO/wSSCvABoJgCLk5cjTMhlPCu/Xh2tVLxwyd5NWiZqYAZ0wLvBdHP2pGz32xEWd8MaVGV82f1uFJAyPOq+DUvtY71axWRgCoZIVLbXBowu16FfEIVCFcoyUZDSXdxOD2HobknWA9y77f97GpgNRSwEb4wQPEJeDaMIjTd6awEdYjWJ1cGyhu6ZaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81919ffa-a662-45aa-7b9a-08df03bb6bcc
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:01.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rOhkJhpvI+YnD+1Hp+0qsLqn5lYAetko7bALG+m0/rWyyK5p9aQKrwVxrOYzl/yUEM2/2KmRGMfc1R8pi+K4P1744cgdPwIX17JKBTUigs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9898
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: UiHX8XCqEWFOzdK0WguZ1X_IY9TIDklJ
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8f5e9c cx=c_pps
 a=rsLXg5VPEOJQy+C7BNxFIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: A7sUvjE9NpbqOxKII1cuVPaI74FxT43y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX5LMsQkBODDfG
 yDhLFEleFMuXOAI/L2swLDnLuXCDSb69SbJDNyJLbGZnlTa1X90x0pAAK53wsEiG0tNl4SC1MLM
 iilCApjDOtYMYC5Z2rKKubSTmDl/SwXGUh523Xq3cQNC8t1JdJZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX+TIExJF74dJC
 98CaC0bk+brWPSjE/jvPzqAWFXExssP8l5TRtWrNOpo20PqUkT9IvI8t+6OMRGQ47gUx68hpduN
 qd+TubcRETid5eovPt/GLW4Eqj8/VQVfu6rnYdsbVXb1bbOw7yKAhElwAZ25sw+SqilP4+axE7h
 Upzzs9Um/sjwOmVxwNMv1FKguqzW3zqxgGcEZvQZ8H/QjWRgk6NpwRLHAGRWzDEBe5uzap+HWQa
 gDImcuBse9rJJHRv5qvR4NAMHnblnGww3AacpdCGiV4HzZdvSUSg9siRJw3Ignngm/FIOY8HUiw
 3IStYH5VrP7mxiCOr6ZyA5B7obTHll5VdVNANIL/d00ouckh4nJLWxIEFzZlfGHTzhfXD5HnKJX
 /PblX7mMYteW5ocms2TQSsW1bivYvovYzMpnPrsIqzPk9Vsog9tWBfCyqBnl0LQR9MpVUr/0rJ2
 QM16lJIXx+6VADe+IcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244419

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides,but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9eacd91cbc..f286d3a0e2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -311,7 +246,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -365,10 +299,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -630,10 +563,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -658,7 +587,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -668,12 +596,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

