Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BF5CCA47F
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 19:21:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.11915.1655925687856432758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 12:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e2oK2kk5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3172a7b279=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25MCriDs023689
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=SHqpb6CSW8CRPBLL2I8Ydj+EO+dRgwiD1oEXjo9eIzE=;
 b=e2oK2kk5P2aL+8enLNrraz4TeTAB2+/bfMiorDDbchBx1OB70XwKr9JvSBqGIcO9mkRt
 iPigWXlsLcaXFovMpoXQFzcCKiBihnAsgQMTtYnNykEDrGD83sDoKLTpeBBIdOv7vl0n
 WqDhi/5QVA4uiwNc68DV6fSdtisw+wJm8+dJZ9WcNNyz7ofjsNGhj4ZovK3FoQGjmfsI
 fZjoEJscDk57sK6DYQXC+EoXWJyJJbtUFrordPrSZdvPKI75CuUFSaXKjNEbrLS5a2LD
 kbt+nQdNfnfiUUx+Vstc3H+gleKW7RURv6SRDxrCegmorm4usghQpcGHEGf81CYyobgZ wQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gs3x1bgm3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 19:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipL/xB6m0mbjNv/0928/0bauQa+/1FEw2AdC6sG8Il7DH9WvFMHImp1GlxeVSjdZZOfZn9Aegc6S5aAcFGJkfsb1A8kC+DwJV6xxlJHvZ67W3NWgMLHxEpOXl4YA6ONEjNyEKqdCRedl9NSF7vkyCXCZ70ZAnC8i+X2hFgwBA6oPcpImtb96ShFMo9SyGuf/VcD8UPKTauVnucOzqyP9Lemip58bD8+jupBkoQIjqr3JRieVeveBHwCo57SuptbzkTdUXA5k4BCOFK+p2k6qYSuUIYxawbONRod5Tp8W1lV8kRU2MGET+uV6/Sm02FVzkBKsWIBQBWODC8dVE0jk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHqpb6CSW8CRPBLL2I8Ydj+EO+dRgwiD1oEXjo9eIzE=;
 b=OJr3GOucqmyzLb3x5K34RoNcDJUREcSYiFZgNlMXyN1T7LQM0gG2Wh53VYA4HjisJ6+W3e3yukyvJuveI61XzgIoGZIbiJ5b01QpbpfubEYotPETOieflaUUjUSOZD5jfBu0LskrD133ufDl9dOlBWmEL7Ai+bFhmVhq5HlKqsLqx1g1uhtMYIYbdopFWhVz/nd0/vRQZbp5RqaReOTwzpH6AdejBvSSPNGOTyvQzwHW2j4YS4dIVjc7AAq7/MUgHSMJvpg9pcK3t0mN551IU+5eF/tTGt1gLrE1rCjiIz7okECEbWU/RtsMCt1mecpo9yR/p0GFK234gwZmAeDRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by BY5PR11MB4497.namprd11.prod.outlook.com (2603:10b6:a03:1cc::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 19:21:25 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5353.018; Wed, 22 Jun 2022
 19:21:25 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] buildstats.py: enable collection of /proc/pressure data
Date: Wed, 22 Jun 2022 15:21:03 -0400
Message-Id: <20220622192105.2177756-2-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220622192105.2177756-1-aryaman.gupta@windriver.com>
References: <20220622192105.2177756-1-aryaman.gupta@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::42) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4af491f-4c18-4c9d-527b-08da548465ff
X-MS-TrafficTypeDiagnostic: BY5PR11MB4497:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4497FA0D9369BB843014A546EBB29@BY5PR11MB4497.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+W2N30LVTORg8brL+FOIsuVJ7SWMFG9Mt5TcztElXiS0UCJx1IcSy+BP9z1/A0xblRcPcWzqK6a4SmHbQ5JNb3lhLBJcZwrFHXaCkaQdMrSLZ3nVQXHvQs1z2CDPgEgh4LBqKz4GW4DvgJW2AeNaxMOKvmM0FT2f1xVHy0GCluvvZ7vpWS4CtbeFf/Bd/3ugSbIS7XgkIUJoQbUxUzrlwYBgphSBU0+KNtaxSti4YgQAiuiJ2B6Um4mMuWTU0lIW2sDZCgswTfdfUba1GJQf3/Yt1sRBc9pt+vLJvqnnZEt0XdtzNQrM+3iAJjZ+K6NSyp0XoVPFvZiNKhf8BowuVqnRU1vUB+9fIlUHKGBdIEMtIIKX8rpmq9kMyDTnemtCCXwJjAjkejKKJjjxNGY974lKiZlH8vK8ozgbv5YYGI/sJZBYAVOgAtRDAiwnwrV3f0BKD7gqPw6E0tIdB6w/F8JnghOe4W+aJMi1oIbLlb+GWKP1IGTBHEapcHEgWTSH1dMrw4aNPG5dkIefpyotCIFNw2I74AgxeeP2AfzWMQzk0zlymISdOzdWc+YE7bILx5B0JomiKQl2i+U7esUFcyDDp5WqYOpJy+G11Yf0vzzwUoBG/5pKba6LjMWIKK19AmrmW7xkMiE3zanYasV8lksmq81+3f/Ddzf5iUlSh4dTRywYjzwm3IwrHXhzUFfqo/lxpXkWfozkP+hAHUXqwgshZ1+tzMdea6aN01GoqSQKUc/r9y3RMtGAY0ouqlvpWHaTg1NwSSpk7VGOEBnoukIekeQZhKBMCs6aXWH+YLg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(83380400001)(186003)(6666004)(478600001)(1076003)(41300700001)(2616005)(38100700002)(38350700002)(86362001)(6916009)(5660300002)(2906002)(44832011)(8936002)(52116002)(6512007)(26005)(6506007)(316002)(8676002)(66946007)(66556008)(36756003)(966005)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pNZ7qZRGHRUOq9mQMbi81E3OjpP18I+sFplj/9KGsrgEcVbExY048tpBaLOA?=
 =?us-ascii?Q?vqt9HVaEn0/qXO67G3te0XP0dINb0gUmtLSTU8i6hxogP9ckfP+wgKLJEK4m?=
 =?us-ascii?Q?HvuApiuj2W7RaB/3Kl9E/KxslpsnLDqwQ3u3ochMRc5VbF+7o9HxJkfYZLVn?=
 =?us-ascii?Q?Ib8tnqzzGqhkKFlDYRbkud0FzyvmthfVusST/UoLuLbu2zUQewZUon17jEK6?=
 =?us-ascii?Q?pa6h7b2LXukb4m3ixpUl9k072bhn3DTJgETtuu1ss+RHItpP4EeWaWI/TzMo?=
 =?us-ascii?Q?aT+GycBnVtQJJH8H6cqWiGAq8hhNw8Wy/gcMEgtR16wwVCQmDHulRsGkU4tP?=
 =?us-ascii?Q?IVMVFXqOEueINzU9f4vgjTCp1FokMAqSnTk+KrsWSVusZ6PpTf5V3y2T3/sD?=
 =?us-ascii?Q?uXeL8Py/SApKkwH1JAQ2x3NwRiRxNtI3ewcz38x7NJoNLTvqAwEISNqk7LMV?=
 =?us-ascii?Q?1YhXMpDgdzl3rxKesVNfT7ssM4T3FU4p+JLU17GwhJ6aVmlQV3Oq9v6oCsG/?=
 =?us-ascii?Q?YYqFVvnp+5QzfCjBiCOPYXYymtt2/Z8vmeNJyXZvKEDU4Ej4QeWUp8X2/uQX?=
 =?us-ascii?Q?yZx47xNcOpKcrV6kdPQkRp2Nx5FpsCaj2CrJvV3e3YvgsQpAIb+haxN+rgPY?=
 =?us-ascii?Q?QEXgPK8ciRedpv2hkqBcnbiv+g1YL5LmiYVpZTeCbrKafqu6ct8mLR6rTu+b?=
 =?us-ascii?Q?zEPq0GmIOjHVNcOz5J9B2UJQTT+TWaq3NHSQ7cptzcUHKA+RuSXEPRX/h6zD?=
 =?us-ascii?Q?A72F0RodiZA+9C6S9YWHbxzJkWi9fkE6yoInRwl0gezGSjAMg5px15Bl+Qj5?=
 =?us-ascii?Q?g3kRbqHagMOTZVcVAF/gDOmQwd8V1MPAU06sazy5UJLbdyqvPjlrf/LQq7g/?=
 =?us-ascii?Q?0WdqbHKIRwnWcKOpJs2SnJI6OgK0nPQmsTs190PGmmyQ3bfNzNutgcalTWIP?=
 =?us-ascii?Q?PuWa4DwiFxKdIJoDN2CqCjObnFQrf6SLTbJXrjQPfDUHIr3Pnp7/qpONXHMp?=
 =?us-ascii?Q?4gIAOSfMIzdkbI8q5lrAyC+1hrFffELMiLY03VPlK97lF3ajyfvWGzeXw8y8?=
 =?us-ascii?Q?Uzu7WtnZPsNJ//lrv2iHbBd0gzQkNoPqlk8ZPHSstUiVny9N5ZFO0yg1CJNL?=
 =?us-ascii?Q?lAaB241ha31GMyWiZuk4OCCD7JqC8kkfl2BVqeghIE5idCc2SV/y024tohOA?=
 =?us-ascii?Q?2dJ98uAdU6+fpNylk/XzQKBLSXy0tTsSArWF8pddE2mEbnA2SEyhD4dbhZck?=
 =?us-ascii?Q?4uY8Sl+Hkby5xbF2SC+vw2IppbojM87FjhbiR0B2a7sH9oZGonabwR5a65h+?=
 =?us-ascii?Q?FD6pDbEA67FKYInHELJHXUoD+aphZP3sR5LM0KO8Y8QvgFFS/u1l7sEn6Njl?=
 =?us-ascii?Q?9pAjZYlwWi1k6iGymtWrQCmfvt1bSggA2+pXi+yCuueVwj8MOQU7wI0BVmc2?=
 =?us-ascii?Q?MbC+fbAvcDmOQA6UPfZDmns9oiZakYABAAHsISuFzAAc/L2X3toymJrNnF7a?=
 =?us-ascii?Q?4eOq5SVbCvn0Zrg3VtPAF3C3FJe1MV9VBef4gMp7BHt5yp+grUHtxjPlowmX?=
 =?us-ascii?Q?lyG7kz/J/d01zEugLQscVGWXfQ6VBImwJoTACE0PKK8bDTMVGESPwFJznLEE?=
 =?us-ascii?Q?+ekswnwmfipgVuhLve1uayx0qIe3zfUxpyaydBa49/ntNDYNrK6BFx5VUJjE?=
 =?us-ascii?Q?c1tDvPZMNfaKSmAY1dM+2QZjrvE8hIxcDEeEnZpjGeOjMrz4MHH1/wa81R0q?=
 =?us-ascii?Q?68nzlVGRydBwzsfoIn4NJiAxCXcPgSg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4af491f-4c18-4c9d-527b-08da548465ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 19:21:25.1400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Kp7a2H26zdMEYWQo67VQEoCoLppTJKO9+1t49vj0Bj5AEvXAuCUd3rqPlg117oJyg5u18T7nszoilbAQiIs1a99SRTuVpP+OdY/R0zi8Lk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4497
X-Proofpoint-GUID: UWAHXoF0a29Z3b8eJTwdplt_VkfdFskX
X-Proofpoint-ORIG-GUID: UWAHXoF0a29Z3b8eJTwdplt_VkfdFskX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_06,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=662 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206220091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167253

The Linux pressure monitoring system helps determine when system resources
are being overutilized by measuring how contended the CPU, IO and memory are.
This information can be found under /proc/pressure/ which contains 3 files -
cpu, memory and io. In each of the files, the format is as follows:
	some avg10=70.24 avg60=68.52 avg300=69.91 total=3559632828
	full avg10=57.59 avg60=58.06 avg300=60.38 total=3300487258

The "some" state of a given resource represents when one or more tasks are delayed
on that resource whereas the "full" state represents when all the tasks are
delayed. Currently, we only collect data from the "some" state but the
"full" data can simply be appended to the log files if neccessary.
The "avg10", "avg60" and "avg300" fields represent the average percentage
of time runnable tasks were delayed in the last 10, 60 or 300 seconds
respectively. The "total" field represents the total time, in microseconds,
that some runnable task was delayed on a resource.
More information can be found at:
	https://www.kernel.org/doc/html/latest/accounting/psi.html
and in the source code under kernel/sched/psi.c

This commit adds functionality to collect and log the "some" CPU, memory and IO
pressure. The "avg10", "avg60" and "avg300" fields are logged without change.
In place of the "total" field, the difference between the current "total" and
the previous sample's "total" is logged, allowing the measurement of pressure
in between each polling interval, as was done for /proc/stat data. The log files
are stored in:
	<build_name>/tmp/buildstats/<build_time>/reduced_proc_pressure/{cpu,io,memory}.log
mirroring the directory structure of /proc/pressure. If the /proc/pressure
directory does not exist or the resource files can't be read/opened, the
reduced_proc_pressure directory is not created.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta/lib/buildstats.py | 57 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index c52b6c3b72..64ad3ef40e 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -14,13 +14,27 @@ class SystemStats:
         bn = d.getVar('BUILDNAME')
         bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
         bb.utils.mkdirhier(bsdir)
+        file_handlers =  [('diskstats', self._reduce_diskstats),
+                            ('meminfo', self._reduce_meminfo),
+                            ('stat', self._reduce_stat)]
+
+        # Some hosts like openSUSE have readable /proc/pressure files
+        # but throw errors when these files are opened. Catch these error
+        # and ensure that the reduce_proc_pressure directory is not created.
+        if os.path.exists("/proc/pressure"):
+            try:
+                source = open('/proc/pressure/cpu', 'rb')
+                source.read()
+                pressuredir = os.path.join(bsdir, 'reduced_proc_pressure')
+                bb.utils.mkdirhier(pressuredir)
+                file_handlers.extend([('pressure/cpu', self._reduce_pressure),
+                                     ('pressure/io', self._reduce_pressure),
+                                     ('pressure/memory', self._reduce_pressure)])
+            except Exception:
+                pass
 
         self.proc_files = []
-        for filename, handler in (
-                ('diskstats', self._reduce_diskstats),
-                ('meminfo', self._reduce_meminfo),
-                ('stat', self._reduce_stat),
-        ):
+        for filename, handler in (file_handlers):
             # The corresponding /proc files might not exist on the host.
             # For example, /proc/diskstats is not available in virtualized
             # environments like Linux-VServer. Silently skip collecting
@@ -48,13 +62,15 @@ class SystemStats:
         self.diskstats_ltime = None
         self.diskstats_data = None
         self.stat_ltimes = None
+        # Last time we sampled /proc/pressure. All resources stored in a single dict with the key as filename
+        self.last_pressure = {"pressure/cpu": None, "pressure/io": None, "pressure/memory": None}
 
     def close(self):
         self.monitor_disk.close()
         for _, output, _ in self.proc_files:
             output.close()
 
-    def _reduce_meminfo(self, time, data):
+    def _reduce_meminfo(self, time, data, filename):
         """
         Extracts 'MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree'
         and writes their values into a single line, in that order.
@@ -75,7 +91,7 @@ class SystemStats:
         disk = linetokens[2]
         return self.diskstats_regex.match(disk)
 
-    def _reduce_diskstats(self, time, data):
+    def _reduce_diskstats(self, time, data, filename):
         relevant_tokens = filter(self._diskstats_is_relevant_line, map(lambda x: x.split(), data.split(b'\n')))
         diskdata = [0] * 3
         reduced = None
@@ -104,10 +120,10 @@ class SystemStats:
         return reduced
 
 
-    def _reduce_nop(self, time, data):
+    def _reduce_nop(self, time, data, filename):
         return (time, data)
 
-    def _reduce_stat(self, time, data):
+    def _reduce_stat(self, time, data, filename):
         if not data:
             return None
         # CPU times {user, nice, system, idle, io_wait, irq, softirq} from first line
@@ -126,6 +142,27 @@ class SystemStats:
         self.stat_ltimes = times
         return reduced
 
+    def _reduce_pressure(self, time, data, filename):
+        """
+        Return reduced pressure: {avg10, avg60, avg300} and delta total compared to the previous sample
+        for the cpu, io and memory resources. A common function is used for all 3 resources since the
+        format of the /proc/pressure file is the same in each case.
+        """
+        if not data:
+            return None
+        tokens = data.split(b'\n', 1)[0].split()
+        avg10 = float(tokens[1].split(b'=')[1])
+        avg60 = float(tokens[2].split(b'=')[1])
+        avg300 = float(tokens[3].split(b'=')[1])
+        total = int(tokens[4].split(b'=')[1])
+
+        reduced = None
+        if self.last_pressure[filename]:
+            delta = total - self.last_pressure[filename]
+            reduced = (time, (avg10, avg60, avg300, delta))
+        self.last_pressure[filename] = total
+        return reduced
+
     def sample(self, event, force):
         now = time.time()
         if (now - self.last_proc > self.min_seconds) or force:
@@ -133,7 +170,7 @@ class SystemStats:
                 with open(os.path.join('/proc', filename), 'rb') as input:
                     data = input.read()
                     if handler:
-                        reduced = handler(now, data)
+                        reduced = handler(now, data, filename)
                     else:
                         reduced = (now, data)
                     if reduced:
-- 
2.35.1


