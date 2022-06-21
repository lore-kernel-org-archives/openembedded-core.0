Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAC1CCA481
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 16:14:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.45564.1655828072089759434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BCzEDrbD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3171c08643=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25LDTFra004368
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=6uQAcDNP1cNXHStFkD39KncmypH7YPv13wFYpbauEok=;
 b=BCzEDrbD5386YNeJNCiNMECVaIbvlrPJCClx/SGgLs1z9+PBQmAwZhxfhdsQ9ot0IUnz
 /RtL3aGO9pzLZF1UGlp8FzTnV2FuEoPh5m5hA/uJ2Wqh5W89M0XVI8pV3+ygL1qW9Tn1
 hHqjm3lyLCfcnydCB/jR5FoKKsFNayclkvIRjQIJIfkaEaqCG+iv1z4WOgjsccnsRBRL
 yX0alXLREwOSO4DRTizIcdIqtAH8Gp+De7sAcuCVu1HWM2NwJfR7mWlXtvP5enIbdOmD
 PnKwPo5e0yK8CHfoZbPSPHVKG3UK8S0M0DmYNU7StkKs/iqR17hsYzomDffLCWAaj2U3 SQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gsa06a7ud-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdOoNs4bpOAjHjek/uSlMBdNCLrtYOJKFjUSxwjxEe0WW4isfr/3KYlubmkl59PvfAssevXcjxqN4e9UgdPshUuXG7u3ZT5FOh2iwQqpIHHFEW868rrD6CyrZov1lfX55AqeCIEbDPWg4MFocvAgkH7BFF1zXFlK5Y5m6zlXBzodBjAuCoET/WRwjYZOIg/MpEIF/IWCCMt5f/0HDaDELkqGNsiO8vfsfnUa3mTjfrNSoVYWdLlIwLhDv/G0YNA9jP61jcXIOSzO58UBmegBCmKOGwyySXG9t5uMT2UGD4SVEeRF3JIXJKHCBXrRBj2ahCDDs0Wx24Ao4Md8O+6JwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uQAcDNP1cNXHStFkD39KncmypH7YPv13wFYpbauEok=;
 b=f3W5oo/ITJlzfwMgpIxLqoS2E4GcPTCp/vO+hrWqyMiDXsvMMVMsXeWXxYy7yljUPEip1BflHgglXjS8qcryY3f3yPltAE99hR6onF2A9MPLtHcinEsXM9h32e8UetxLGwomRqgd76U3okO5pyHoOF5X8BN5Q0lGA9L2+H2gmC4CYDisOxyNk3PzzwOZ1C4z8unqzVceRTTyRRMGhhCRaw2qQ3KEWTQvJxU9j2c134BHj4GkRLEt2Zt6uM0lxhCB23QeqzRPolcog7syC7oUePbD9UjHiWKBpT6QYzntr1k19Jr0UH5sBMrovSvJasRFVk95mAJvQ1pWnQQYs9p09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by BN7PR11MB2865.namprd11.prod.outlook.com (2603:10b6:406:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Tue, 21 Jun
 2022 16:14:27 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5353.018; Tue, 21 Jun 2022
 16:14:27 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] pybootchartgui: render cpu and io pressure
Date: Tue, 21 Jun 2022 12:14:12 -0400
Message-Id: <20220621161413.2779759-2-aryaman.gupta@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8dd2024a-8555-45bf-8c93-08da53a11d01
X-MS-TrafficTypeDiagnostic: BN7PR11MB2865:EE_
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB28655025902F546AA692ADA0EBB39@BN7PR11MB2865.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	suD6zmINHa07OLIaxJvP3Ejguqe4sEbvYQyUuEV6focIH4JE5lFifsNIOfRkEdFLQ4kzwn6yFVUlh0C+bKil7msXfcAgSdHUKF1t2xOEQZ9id3IaNplwoB13TEUJwgVnhDQ7mUiQlvYEXnmvrutyxt4ywqIKz8kdo7Ackz6fWvwJ9CrVlRYxXFtpBSibqVJH8Nq5L0LxPgBaP1ZrJ1KvM1tK/p6iXs7pIYta1fm+yIKy7LFfsko4dzhV2vqDNC65N5KV6X0s7Elro+X1Ik9MHoyaXvEbuNrJnl4aC5INv4KNLZ8bjnN6m3e/N++gBxqF3f5P9IEr8N4NmAQR4M0klpB+1//XTIgNvN7dUyUKcmMi06O8hJdQGglMyQjY5Z2p8pqm9ePlViFp/0SK80hC/Q/ZcWJ/01nd3jwz8+Iflmxjgx5BCFYkn5nDZh2miRQP5SgbZvEdCuUH2NxURifQ19cUHS6b79XY7j+CJ2yk4raVCt3x9uJHMhZ+slaxFJ5tnOL6wOU7mVCSpG8MGcpTo68zYaz4IvCezQKRpkjNfyr1XghzhVk/2ecScp5xOB1+bDgeXbch8UHNlxwqRhzLsRMa0LUlHrFi+lBh1QKNyZ7FmeErmV39siQveAqHuaAzdfjBltmHA4+f+eOqZuOsaw+0tlYMHh58pUiUT1PBUa8bZQgYPa5XpUgcVWXMqB/1PfIP9n251/9BFNcZwfJTFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(52116002)(6506007)(1076003)(186003)(66556008)(41300700001)(44832011)(6666004)(2616005)(66476007)(26005)(83380400001)(38350700002)(6512007)(38100700002)(6916009)(36756003)(5660300002)(86362001)(2906002)(66946007)(316002)(8936002)(8676002)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PYKrHme3JB/OVKWMXclgGKNLnbSAryK3eH0zzm0LWJjmOmioTGFvbxrAzUJa?=
 =?us-ascii?Q?nYu8ehAzifdWtaTsaZQ13L6V9lddMYY9xVCC7iGUimmN7b9NYS/ylSnqBbYR?=
 =?us-ascii?Q?eMVry3QZQopIy1mpkl5hD4bhVolP0U89Ug6UPtRZeSL6o6Z+pWJj5waX2jWf?=
 =?us-ascii?Q?kzgHr/chAltF3ShSCU8PgcP+Vw2OkBsB49zFgeFKkZBiirZY9ydjXFtVTZjK?=
 =?us-ascii?Q?EKBpVUiHeXSJjlPMqb3ahTJRy+Ewcn9Ql30uBU2dBg7L4j3MkiUmWAmZKMfr?=
 =?us-ascii?Q?Gxj5JDeKLQT0K1pOBcZVi6sZboRL2WD2yYrYu47RgI/KkaYc0/MHVtsrQYfb?=
 =?us-ascii?Q?C2+/dXCECuPwLYIB+SFQ6NCLQfx/HMXwLtO3DTN2jitsrpTFoRNXDbm0YSTa?=
 =?us-ascii?Q?iuTONBqQywhyFN9Uege+GeC1k9oODd3slCCRVV2noW5O1t+p/t4i8KkuN4qa?=
 =?us-ascii?Q?Gr1gojjv+Qq1ecicmn/eqp8KdKuYWHf4vGab2nZzp+7hI4hL/yUjImr+2IzY?=
 =?us-ascii?Q?ts9EdRhGtoHtrD+kqVGhth2dfTLNdEk1kXhPFU02HCV5ibhsNNmDYRlA3iIs?=
 =?us-ascii?Q?T7/9i8GdjBP0HBYrhIQaXCPnGpYAbCQwTJmo/VNTvS7cfsDUM+KizAKLNceH?=
 =?us-ascii?Q?wzZ+64Yjz9ieF/Nryu5z7ZXwM8IAxkfjkqOqoYMbqmyT7Pftuyd5bMnHCijW?=
 =?us-ascii?Q?3jwzXc95wkHl+MoVwzoLtFYyGx+7FrozC8teJUAfIsbCmgJxo23GU+vyZMFz?=
 =?us-ascii?Q?WleJJxNC1mwbnSrIFH+Oq6t/xI7vZdi0KiSwhFO5QPCI5PliHqNURsW08JMX?=
 =?us-ascii?Q?IfetjcNwJd9rJC09QPmw2rIVus7l2YXSTJniwOoy8CRtIpsvbuIUlU2qw3U2?=
 =?us-ascii?Q?4+M1Ns3jOD8T4iMiArNYhiGzbj6Ehpn/acaopf12tsUpro/r/hRndLOo+grt?=
 =?us-ascii?Q?w4MsP0K3/KPKweC443e5N7HXZdBc4fRmYr+Sdk7EAw1Bup2W6YbCdYtUFHUY?=
 =?us-ascii?Q?+N73g5E5Xizob2s6deLuZtOZW4UFyttXfs1gcAlNiM3drBn2p2IouJZ10R3A?=
 =?us-ascii?Q?tHHh4Rj26vd1fIPE0hl5tsyojB+Q38Zrz9/zos8IEGSp1Je9hvAbuxlAvYJK?=
 =?us-ascii?Q?jBAPewopr310jNckGOIOwk3KRoGVFziPkwcVZQghH1MUlEBbrZ6sxtwFJrRa?=
 =?us-ascii?Q?MoZd0iHG0npqYdGDg7kxb3OAoMzMDDJTMxFdEjJwzXj2PAMgpjX+BindDNAG?=
 =?us-ascii?Q?iVkF8Eso3LZpWSWkDRg9SoIdPqGsA1sEODK0NZpGq95THy+j2lX0CvAdjsn+?=
 =?us-ascii?Q?jZvGs7gBvhPCxp0k0EEHoTuDiMVTakrEPgE6ihhXaNlSaFeldTEHE49Gq9/Q?=
 =?us-ascii?Q?8hKmtWMJVfnna5li7i8Ybx2IA60JrJOFLx0pLfO3cpPMvTomOE608M9HzWvU?=
 =?us-ascii?Q?ZX3P2fLzKd7PtaVtMxobyRlv6lRKPWGTh7iOOYpRdMd5YZvR6y54Fp94yvEW?=
 =?us-ascii?Q?mGz36Bl+shFCIjPtAETVSo8kkIQWehm/fpaxQWTAezG/7lmd/N5IpYS1RriZ?=
 =?us-ascii?Q?brWgPeFDBf157WeXOhwqo8Y8L5M1Y1cwir0B+fSagWHT4eDgyKiNdKD9YDP/?=
 =?us-ascii?Q?RN99Vq3X52HuUsiIlkNSAeQD63YYbrYVWdXLrMr/xxAUjeuokRLQqo+JwVfu?=
 =?us-ascii?Q?kUk7sbFjjYLJF4RkK5RMUP4MWRv5nXF8QfRMZXxH1Iv6yuYdF3iFf/MUAykw?=
 =?us-ascii?Q?h7EyKXn9czY0kd9o0ZC1tGja31a8wDw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8dd2024a-8555-45bf-8c93-08da53a11d01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 16:14:26.9545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pZwPFrElvi3UK62q/00HY36Yl+GJeawpnW4J8hlyqT61vhLRSsLILVolrjYVjHYqSD9K4VDxXqztiZb06adhgklD5iQ+dARwnc+YoWABcCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2865
X-Proofpoint-GUID: 9sxaCVYKUBO7dVmmwonYrILJEp-eFj4G
X-Proofpoint-ORIG-GUID: 9sxaCVYKUBO7dVmmwonYrILJEp-eFj4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=799 clxscore=1015 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 16:14:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167163

Add two new, separate charts showing the avg10 and delta
total pressure over time for the CPU and IO resources. The height of
the avg10 data in each chart represents the percentage of time "some"
task was delayed over the specific resource during the last 10
seconds of the build. The height of the delta total data in each chart
represents the total time "some" task was delayed since the last sample
was collected. If the reduced_proc_pressure data is not present in the
buildstats log, then the new charts are not shown at all rather than
being present but unpopulated.

Note that the delta total graphs may appear "spikey",
oscillating from high values to low. This behaviour is fixed in a
subsequent commit.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 77 +++++++++++++++++++
 .../pybootchartgui/pybootchartgui/parsing.py  | 28 +++++++
 .../pybootchartgui/pybootchartgui/samples.py  | 17 ++++
 3 files changed, 122 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index fc708b55c3..a13df3a3fa 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -80,6 +80,18 @@ MEM_BUFFERS_COLOR = (0.4, 0.4, 0.4, 0.3)
 # Swap color
 MEM_SWAP_COLOR = DISK_TPUT_COLOR
 
+# avg10 CPU pressure color
+CPU_PRESSURE_AVG10_COLOR = (0.0, 0.0, 0.0, 1.0)
+# delta total CPU pressure color
+CPU_PRESSURE_TOTAL_COLOR = CPU_COLOR
+# avg10 IO pressure color
+IO_PRESSURE_AVG10_COLOR = (0.0, 0.0, 0.0, 1.0)
+# delta total IO pressure color
+IO_PRESSURE_TOTAL_COLOR = IO_COLOR
+
+
+
+
 # Process border color.
 PROC_BORDER_COLOR = (0.71, 0.71, 0.71, 1.0)
 # Waiting process color.
@@ -415,6 +427,71 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
         curr_y = curr_y + 30 + bar_h
 
+    # render CPU pressure chart
+    if trace.cpu_pressure:
+        draw_legend_line(ctx, "avg10 CPU Pressure", CPU_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
+        draw_legend_box(ctx, "delta total CPU Pressure", CPU_PRESSURE_TOTAL_COLOR, off_x + 140, curr_y+20, leg_s)
+
+        # render delta total cpu
+        chart_rect = (off_x, curr_y+30, w, bar_h)
+        if clip_visible (clip, chart_rect):
+            draw_box_ticks (ctx, chart_rect, sec_w)
+            draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+            draw_chart (ctx, CPU_PRESSURE_TOTAL_COLOR, True, chart_rect, \
+                    [(sample.time, sample.deltaTotal) for sample in trace.cpu_pressure], \
+                    proc_tree, None)
+
+        # render avg10 cpu
+        max_sample = max (trace.cpu_pressure, key = lambda s: s.avg10)
+        if clip_visible (clip, chart_rect):
+            draw_chart (ctx, CPU_PRESSURE_AVG10_COLOR, False, chart_rect, \
+                    [(sample.time, sample.avg10) for sample in trace.cpu_pressure], \
+                    proc_tree, None)
+
+        pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+
+        shift_x, shift_y = -20, 20
+        if (pos_x < off_x + 245):
+            shift_x, shift_y = 5, 40
+
+
+        label = "%d%%" % (max_sample.avg10)
+        draw_text (ctx, label, CPU_PRESSURE_AVG10_COLOR, pos_x + shift_x, curr_y + shift_y)
+
+        curr_y = curr_y + 30 + bar_h
+
+    # render delta total io
+    if trace.io_pressure:
+        draw_legend_line(ctx, "avg10 I/O Pressure", IO_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
+        draw_legend_box(ctx, "delta total I/O Pressure", IO_PRESSURE_TOTAL_COLOR, off_x + 140, curr_y+20, leg_s)
+
+        # render avg10 io
+        chart_rect = (off_x, curr_y+30, w, bar_h)
+        if clip_visible (clip, chart_rect):
+            draw_box_ticks (ctx, chart_rect, sec_w)
+            draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+            draw_chart (ctx, IO_PRESSURE_TOTAL_COLOR, True, chart_rect, \
+                    [(sample.time, sample.deltaTotal) for sample in trace.io_pressure], \
+                    proc_tree, None)
+
+        # render io pressure
+        max_sample = max (trace.io_pressure, key = lambda s: s.avg10)
+        if clip_visible (clip, chart_rect):
+            draw_chart (ctx, IO_PRESSURE_AVG10_COLOR, False, chart_rect, \
+                    [(sample.time, sample.avg10) for sample in trace.io_pressure], \
+                    proc_tree, None)
+
+        pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+
+        shift_x, shift_y = -20, 20
+        if (pos_x < off_x + 245):
+            shift_x, shift_y = 5, 40
+
+        label = "%d%%" % (max_sample.avg10)
+        draw_text (ctx, label, IO_PRESSURE_AVG10_COLOR, pos_x + shift_x, curr_y + shift_y)
+
+        curr_y = curr_y + 30 + bar_h
+
     # render disk space usage
     #
     # Draws the amount of disk space used on each volume relative to the
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index b42dac6b88..004d6fb953 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -49,6 +49,8 @@ class Trace:
         self.parent_map = None
         self.mem_stats = []
         self.monitor_disk = None
+        self.cpu_pressure = []
+        self.io_pressure = []
         self.times = [] # Always empty, but expected by draw.py when drawing system charts.
 
         if len(paths):
@@ -554,6 +556,27 @@ def _parse_monitor_disk_log(file):
 
     return disk_stats
 
+def _parse_pressure_logs(file, filename):
+    """
+    Parse file for "some" pressure with 'avg10', 'avg60' 'avg300' and delta total values
+    (in that order) directly stored on one line for both CPU and IO, based on filename.
+    """
+    pressure_stats = []
+    if filename == "cpu.log":
+        SamplingClass = CPUPressureSample
+    else:
+        SamplingClass = IOPressureSample
+    for time, lines in _parse_timed_blocks(file):
+        for line in lines:
+            if not line: continue
+            tokens = line.split()
+            avg10 = float(tokens[0])
+            avg60 = float(tokens[1])
+            avg300 = float(tokens[2])
+            delta = float(tokens[3])
+            pressure_stats.append(SamplingClass(time, avg10, avg60, avg300, delta))
+
+    return pressure_stats
 
 # if we boot the kernel with: initcall_debug printk.time=1 we can
 # get all manner of interesting data from the dmesg output
@@ -741,6 +764,11 @@ def _do_parse(writer, state, filename, file):
         state.cmdline = _parse_cmdline_log(writer, file)
     elif name == "monitor_disk.log":
         state.monitor_disk = _parse_monitor_disk_log(file)
+    #pressure logs are in a subdirectory
+    elif name == "cpu.log":
+        state.cpu_pressure = _parse_pressure_logs(file, name)
+    elif name == "io.log":
+        state.io_pressure = _parse_pressure_logs(file, name)
     elif not filename.endswith('.log'):
         _parse_bitbake_buildstats(writer, state, filename, file)
     t2 = time.process_time()
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index 9fc309b3ab..472dc27be0 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -37,6 +37,23 @@ class CPUSample:
         return str(self.time) + "\t" + str(self.user) + "\t" + \
                str(self.sys) + "\t" + str(self.io) + "\t" + str (self.swap)
 
+class CPUPressureSample:
+    def __init__(self, time, avg10, avg60, avg300, deltaTotal):
+        self.time = time
+        self.avg10 = avg10
+        self.avg60 = avg60
+        self.avg300 = avg300
+        self.deltaTotal = deltaTotal
+
+class IOPressureSample:
+    def __init__(self, time, avg10, avg60, avg300, deltaTotal):
+        self.time = time
+        self.avg10 = avg10
+        self.avg60 = avg60
+        self.avg300 = avg300
+        self.deltaTotal = deltaTotal
+
+
 class MemSample:
     used_values = ('MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree',)
 
-- 
2.35.1


