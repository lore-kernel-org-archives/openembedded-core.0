Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB6FC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 16:14:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.45574.1655828071093206205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fnb2R3ok;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3171c08643=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25LDTFrZ004368
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=vUTks1R71j2uDaemX2blApmAID8TEPC6TY0wqGWIgTY=;
 b=fnb2R3okWTSLqm4A66mm0wsUQzKJe3R7FVWTTxms011UXP2KOWcTN6dE2ukLXcOYiAM0
 lxdxvwE73FV1aHzjk3TzSWEmup426NbYEa/o1UTHFCnKu5r1ZMOruswgGwp9BLMFtfcE
 QDcWgE7labX/ryCHcixIRTsVsNVSlYVzz/xQBATjkppUsJ2SEVZo1zh0rteg7sXqsXcR
 1cSlVeKqfqSVzWf8Cq/pWiCwQRbMRzGNAD/uG0OErFlYjZywrII4wqQooU6xtB9L4rVe
 vynSmy3ZfvRZAJvnVVeuTaLq6hT2NTiU2HBngIYZSMzBO380HsgN+S1fPmdzxygm/MCN uQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gsa06a7ud-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Es3hBYWLqERQCfdVPUyZ+tqvqavX3tg7+dnU/l1MLdXjsMqvBg2kEVgN/QTyO94APigmdFkU0VCrUO7/tWOEEhO36hfuMlkd2ZuxpVV5r/wKos+6EPrdxijmnBsXNFZ+JGNIyGtx7l7emn5Hlf2YqK+8NKW9MtGmTlOBK9zmLWisYAuZ4ySkwi4qerqe9x4TY5/FsweW0IdXSNaefZkoDyT2dS4wk/VisvIXTFU7NxKeIV0mgHZTjKu2UxXZE1NCihizSEfszRS4BFMH2imHCbtkbCa3dOL2NT9PTlQ1w+B6qlkDxK7bAFfBk3KBOdMuLU87uJXNTc+8LfY2yFRNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUTks1R71j2uDaemX2blApmAID8TEPC6TY0wqGWIgTY=;
 b=gw0aAYmUqbr6x/uJImuIuzKt8ggTBhc/AJdslX2vXpR7u+dvTKaxMOR7R9RitvMq9YMHMKSvdyTjjXkKFpvYZ1NMU4T66JQRd1vCb2CZP+VO20zLtAzD7v/nvBgn71q4qUtNmNXDmGX542LV3TCykZJ67aNx3ECzF/LatECxFFlBUwiu9kULzt6BmW3vYP0/ogTZVm3Bz/P1RV8L2ZdcEI3epbk7hIO7PmYhgsx9w9WKe60KDwzW8FSV+RRiq67Jcw+3/r/EUt5/H5RA1GMpzvjx2s5WLcQO9lPCbmDfKOQLKR8bsYljb+qy42aPd4IkKjepBsqjXQ6qxPg1H7T1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by BN7PR11MB2865.namprd11.prod.outlook.com (2603:10b6:406:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Tue, 21 Jun
 2022 16:14:28 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5353.018; Tue, 21 Jun 2022
 16:14:28 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] buildstats.bbclass: correct sampling of system stats
Date: Tue, 21 Jun 2022 12:14:13 -0400
Message-Id: <20220621161413.2779759-3-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220621161413.2779759-1-aryaman.gupta@windriver.com>
References: <20220621161413.2779759-1-aryaman.gupta@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0328.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::20) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e1b4fa5-14b0-4881-aa64-08da53a11d65
X-MS-TrafficTypeDiagnostic: BN7PR11MB2865:EE_
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2865A693DA0A7A91E75C37DFEBB39@BN7PR11MB2865.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hB1jbmZDvvZ7lFfItAyMa7e+fEzVsaGZtEoohI/gQ3l37GNW6Ygme82X1PzM0/CCDaXDXavYeSCEYVljk4DfgTW47qPVUWJXzow7UjYihpKrvnJHVhI8WMBMSgzBwFoNek4Xfh/7x5zvdxjAR4hehvOPNeXaU5DOpQzZW0Bd3/n+fXFOtWaFNTLpbuMGuf09kBBDobEMnbrdk/LZK1GwBY6V0phn82q5oeoOdnXBgCXqW3qBgn4KrHx+e0azK6vHsO6ukkUK5fj2wOt7x3laL4K+QVLzS51YaaybSi/Pc+9M0QNnycr6PPO8KnGkbjJajxq2KpdB+04kSNyg4nY83jGVjFjWkMuA+Aq0cy4x2KVOVL1E/ESevopCS6lc+Hg8bb2KIhrFklfXZk57SyuvWqZEVmykNjX+kuAHWvpI+FKZfiSVJ4LeuSAuIDZtKZIHgrg0+tj/lJLhYWT1YuRsjXQAvmvn4i7Q7Qg2n19aGTzNjYSIerHDBqPm2wjQQEv2jYqHnKoOUZotj5y7jr781VpOIi35RcxsWKdncan3zmiurnRae3VYvPIMKV2+Dy6RnGr+MKZKZMsB1as1dCss1xOjZDFdeDXkkohqEsdDWwe/aRaFIuyuirTrbEHVWON/jQWOq+NXW+uqPLggwK333lmj+4+RrLgHacncImAfIkR4jvvEODcM6KMNSe5LC5y3Y8hjf5qmrg7GsGafUCZARA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(52116002)(6506007)(1076003)(186003)(66556008)(41300700001)(44832011)(6666004)(2616005)(66476007)(26005)(83380400001)(38350700002)(6512007)(38100700002)(6916009)(36756003)(5660300002)(86362001)(2906002)(66946007)(316002)(8936002)(8676002)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sn1k2D4MdrFv+lTtpwAMPMwH6AOdI6VsT/GuwlGLH3g++ikRYs2toZWJ21AA?=
 =?us-ascii?Q?4VFcTTDE7d703P/GVmWcdVJRpqcdMGUDkNaMYzX2/6CGQN8/FIFQ3pjinjFo?=
 =?us-ascii?Q?1BWCM2bhVO8pCUh62k5IbO5/p70kxlvO6a7vNXtX7hDS6BFkk5LFoBCp+7Ik?=
 =?us-ascii?Q?2L2rmPDdi7od1nV8EoS74KfZpH732P3GHmqKQdneZfSyaij/WWeGuP/nrMcr?=
 =?us-ascii?Q?y3bTJ19fQqDGD7eoTB7aUNtDucN17JjrMkNjaVaDcmcacAP0PQlwBQzCT0gF?=
 =?us-ascii?Q?VtluxLwgg2+H3k6cPXgvT8p1CEnh+xfWK6vg+WU7Iye4VFa363TXTBvFLLHC?=
 =?us-ascii?Q?M8aoq1FYoqOFLXjkk6ZunrWf9Xdo1b1TsdFsGQBLpMKcit/rh+gBR8fkFgBS?=
 =?us-ascii?Q?MwCB+zJo/JO8DeDQr1BMXpEPV1a4VUXFShYIZQu1NK9b7zCtq+EnwAbYflVy?=
 =?us-ascii?Q?+9ThluJ+VLogGx7Tz5rG3FvbJXLZRa2LqTFvpAP3JXl8dLJ7gD4L3eHvpIdJ?=
 =?us-ascii?Q?Vw6+qfn37b3yy3W95EI1+/RbHT+hx2PasnINWmnjUj4q1UC2tgdUQaUB+0Wd?=
 =?us-ascii?Q?7eIsi9KxIuiqWWiN4nO8N0qTEBfCRulznaQgift6+hUX6m2Xro/CTW4Wkums?=
 =?us-ascii?Q?Wi2je9cX/4l3WisdyrkM2nmFJ8IkknO8vgD+PuanHAaGrUOE/1IGf70gMd7X?=
 =?us-ascii?Q?zlkgHaj3dWcC07eZqc3D3IczYa6kaMF6Q/ywRlwPZMgkA3ZUlL8sgw9kZqtH?=
 =?us-ascii?Q?CRkL3TGtWPd2wwLJ2w1vMq40PzNbA7nb1YaHep3j3U/HfHBB/69EZQxE8mxT?=
 =?us-ascii?Q?hbwB6riUAaECY2kseqIqYWIBZi6wl9krNnNHszSJPMiN3FZb1kYk7DS9Syem?=
 =?us-ascii?Q?9n3+8vSwvwjtVZAUQZwzVm3nm+08IL/a3Rr3E1k1Jy7YItU6nfpPU7GWWYXW?=
 =?us-ascii?Q?bjw5jMmCTJbvIJmOGjOgTxDyX7kgrI7OBv73rRaXek2gtSfdA2RRdvH4BS0g?=
 =?us-ascii?Q?Q6ziOMQIPhhC392shVa8FvE1UvfDVp6JfAaL5iBDxwF35DSPdmQsmQIpLUsk?=
 =?us-ascii?Q?kQzJC3OtuUhTCG44uxjaj1c7Olt7x8+BoBQSNjgZgjWm2H5wv4bHPtPhqMnX?=
 =?us-ascii?Q?YOzutJBquaqwZ6iRuNIsQNUOiBVtGrqr0c0gpQgzN/qujuYTmpV7v9GATksd?=
 =?us-ascii?Q?vUsOAWyrM1IWuHoJenZUZaKS0jG65PKlAzY5hZfm2uE6YU+h3BmEVhopL1eh?=
 =?us-ascii?Q?O0KwBZ1UYxzR7m6rb9M6yxWxGiPy//VJL1tNzK9JOf7zyMPNofNsF2Kdolb0?=
 =?us-ascii?Q?YNEKgupb8+uhHSU1O1peVr8pole9bPM1X0j+RkAfBeaYrT/TK+Rx6bJZ310S?=
 =?us-ascii?Q?Hwq6qSety0QQr2NaxwB7nSqO/CZdUvsKqhjUnVGSNBYm7xUxqoQuQf6rYMNO?=
 =?us-ascii?Q?uzs6eB6PlyDVhSE1fLKeFUloHXNekQzFrcPUQOIHDOLKgVTqLW0a0XY4BUxB?=
 =?us-ascii?Q?whZeoLSTd2/RZ+gDHdTsSHc7Ihnl3NHcYbeKqFFRgLGObp69spfrleb/EUSz?=
 =?us-ascii?Q?GTUf9LzLiflcSKBKt6F0XY+aAhahajZXh51PyQDbQP5+LwlFY9tENIB9L4x/?=
 =?us-ascii?Q?jsa5XMCx04R7mjNz9qjAt/jgP24BRFmo1kOUc4MkexQokbc7Y7Ne8r5+jRBd?=
 =?us-ascii?Q?9RnlQElpu2k0F6HuldF+u43hrDQ1g0wFKyKJ5Y8BVwZnllLUo9AB6pwPYGag?=
 =?us-ascii?Q?MoJ5XbEU+ZAikSwqtlLVK0hojpzTYk0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e1b4fa5-14b0-4881-aa64-08da53a11d65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 16:14:27.5638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TMFcKhjxiwuRbBUHmrJh1Zjmln5+QOiZXYSndzI+bBCthTrstY2zn0NxqrEizBw1GeioMlKPXgkxKvHo9C0/BQ3WzQFIUVCwU0m/69EO0PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2865
X-Proofpoint-GUID: iAUrWEZGW_-Ffjhm0w9CqvrYWxCtq-MA
X-Proofpoint-ORIG-GUID: iAUrWEZGW_-Ffjhm0w9CqvrYWxCtq-MA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=794 clxscore=1015 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 16:14:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167162

The last time of sampling would be updated within the SystemStats class
but not re-recorded into the datastore, leading to multiple samples being
collected in the same second in the sample function of buildstats.py due
to the runQueueTaskStarted events. Fix this to collect and store only one
sample per second, as originally intended, by only recording samples
on instances of the Heartbeat and BuildCompleted events.

This fix elimates the spikiness of sampled data, in cases where the difference
between the current and the last sample is taken. Previously, since many
samples per second were recorded, certain types of data would result in a
very small elapsed time and hence a small numerical difference. For example,
the CPU usage from /proc/stat is a running total of usage and taking the
difference between data collected 0.1 seconds apart would result in usage
appearing lower than it actually was.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta/classes/buildstats.bbclass | 3 ++-
 meta/lib/buildstats.py          | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 0de605200a..9e25a42a5c 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -282,10 +282,11 @@ python runqueue_stats () {
     if not system_stats and isinstance(e, (bb.runqueue.sceneQueueTaskStarted, bb.runqueue.runQueueTaskStarted)):
         system_stats = buildstats.SystemStats(d)
         d.setVar('_buildstats_system_stats', system_stats)
-    if system_stats:
+    if system_stats and isinstance(e, (bb.event.HeartbeatEvent, bb.event.BuildCompleted)):
         # Ensure that we sample at important events.
         done = isinstance(e, bb.event.BuildCompleted)
         system_stats.sample(e, force=done)
+        d.setVar('_buildstats_system_stats', system_stats)
         if done:
             system_stats.close()
             d.delVar('_buildstats_system_stats')
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 64ad3ef40e..9829a0ff65 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -55,7 +55,12 @@ class SystemStats:
         # becames relevant when we get called very often while many
         # short tasks get started. Sampling during quiet periods
         # depends on the heartbeat event, which fires less often.
-        self.min_seconds = 1
+        # The Heartbeat events occur roughly once every second but the actual time
+        # between these events deviates by a few milliseconds, in most cases. Hence
+        # pick a somewhat arbitary threshold such that we sample a large majority
+        # of the Heartbeat events. This ignores rare events that fall outside the minimum
+        # but allows for fairly consistent intervals between samples.
+        self.min_seconds = 0.990
 
         self.meminfo_regex = re.compile(rb'^(MemTotal|MemFree|Buffers|Cached|SwapTotal|SwapFree):\s*(\d+)')
         self.diskstats_regex = re.compile(rb'^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
-- 
2.35.1


