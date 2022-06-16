Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ABBC43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 19:10:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.21702.1655406630459175353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 12:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LSZhx7Nk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3166309cb8=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25GJ5ilJ005459
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 12:10:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=UaFpSaFPuvOfgmwtOb1JTDl88o3Z3Ss2qqTDuPnwhUM=;
 b=LSZhx7NkPD7aJUcGsIBzTZZUaHlBZaplcv61UYOS3R4JgfoHoGTeKbOjG8MwCY7K/Cd6
 9nD2nA5a1aLo8WCTyRPsblV2xVsCmKFQx/mfdDoejc5aLngwct0R+pXLiVtCUEiRPk33
 OTU3OkvM10/19p8H2PB7BGq9yDaKZOOPc8+vGFmu8zvy0bJji5En4FVnHsZ2+PGsrFvF
 sU7e/PIFt0TBfA5GTkAc0wrSYhSt1MHpmsal9UEWvBLBUJtKARs0s/dw92OtSCAL7Xl9
 q0mQ+rR14MZiuav80AnrBa7zf9/2sMP3aArKHn/4PaQA89AVOHnBXnRoGBR9qbRzoM2E 8Q==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkm7hy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 12:10:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zb2D5CkZhvLL8/wI7qVIh4YIEYF34+SE1bsqPC/QF5mpv1iztvB72E9RSax+PevAZxNYGDNXy+uJKUM+ec3PA+oCI7Ko+t8F1p2/qbnr93ic6te1+zeZBMUWjcDl4Bp64fHMydcplYjBN+JSeXKTPlZ8LuXUt2/sQlT0aSDMSBiN10Ih09k0SMkubrJMlz+8eVfaQHofMP8QENSkPbzT1GnOBJWjR2zJYi2OiiFcpDYPRtnyWdioorx1fmgdHCoH9dtCUZErbzqKeskrI/VflfqeUlvcFR4uOD+mFNvVmX1YfhElC4Lk5j9/Y7Mlu+5+XNfnSpdn0bF7XtGfgTQxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaFpSaFPuvOfgmwtOb1JTDl88o3Z3Ss2qqTDuPnwhUM=;
 b=mh+75PSWZVlZWb+tAuWmA6xJKFEgEDTg9iB5i2uuCIRF/esWqbOI+Z8jqG0emUzDP1JXTRH/kZFGOZCFIv8g/UOPh7bXdtvqBkfiGfRGoTqFUVvYumtVmAR2twcinLoUB10wcgtv9AZ32bBWc0xU3u1TjscNRGCqKDstoY0qFuePn/JBVGZSXoc/ZW50zyGakEj/IHvN5NVJgax7L1cxHkYBB3C2YHqUdd0X18y3R2optpDznrzEthFE4oh+V7A/2xvj7PLr9fkYgz8SOZXT+b1nl47R6BLndG0MSypsZreSxuWWwANW3et04Wjv+3+38wlKDQhGbrLs1Y4u8Bv5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by MN2PR11MB3936.namprd11.prod.outlook.com (2603:10b6:208:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 19:10:26 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::155:594a:ea54:1563]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::155:594a:ea54:1563%7]) with mapi id 15.20.5332.016; Thu, 16 Jun 2022
 19:10:26 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] pybootchartgui: render cpu and io pressure
Date: Thu, 16 Jun 2022 15:10:14 -0400
Message-Id: <20220616191014.3935485-2-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616191014.3935485-1-aryaman.gupta@windriver.com>
References: <20220616191014.3935485-1-aryaman.gupta@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::27) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a785373-4492-49cf-6c20-08da4fcbdf12
X-MS-TrafficTypeDiagnostic: MN2PR11MB3936:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB39369F5723B66D0A9B184D3EEBAC9@MN2PR11MB3936.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SeF4N4nMvj/OPQavpwSxlGr9up6Qdo95vqVs3C7DyV+BntzjDpBGPFxFUdeyL8/gKpF8zxj4RKi/5S3/2Cwt3WmJVxeHL5cYngsaUEcPki6FvF/sC2jTq7vM4IKRoRSfLRSuwcxw+j+I/WS9mWtR2/hb4klVVD4uwnHZn9ZPBjzXGq8qsAUog0xqzpbvFpMotkJRA6qaL0hD/VjuUsSnxgxcLL9rV4IXyuUKLP8tteQhXgSXvsPpLEUKgcqgbqPP5NTluWL+xhGqaR6aNHn+dD4zNXJG0qGIYkhgkkEit4a3u9/v/OI/1RgcSm3iCWyjb0G+fXB4bte1ydzlp4GP5MNbgAmqRvgydCbtzZLHBIHmJWBrpWoVszcC+j4XTgkgyzUhYT6GukDt0M9M62WhciL4ow5YGRJfaX7/+Fj4AFj+NjJKRx75uczBh9JxxKALDtmGpIZV1osQU6vW4iaDoT68jTzerdaBhNx1ucm+XKc7MxtUis3e1EYxlWqCjTvZgrplqjRyKImQ1MU3wGhNp8I0HGR2dhCYl8jSTDAsKKadiovIC+8S6tWoMol42Lu+Pzvs+Kb6M8F6C1sIew90lOTM+ZWsPekjq9wIDbLOimiyAQEOnd92DVf9xr6xgtXGYsVSXdy6N3hy6EBNMaOpf+5GgEArdhjP+2FaCVxOOdYEMUJ7ELQMDZF1OOuOK/Vc3Rou6Nrqu1AkMDMaOFluSw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8676002)(66556008)(66476007)(26005)(66946007)(6666004)(6916009)(6506007)(44832011)(316002)(2906002)(8936002)(508600001)(186003)(38350700002)(6486002)(1076003)(5660300002)(6512007)(36756003)(83380400001)(86362001)(52116002)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dVuTjwU6TfKiVCQFItIktZy43UdW3GdTvCdKdmHIeSKz97V4eSRne257x5L/?=
 =?us-ascii?Q?72T0eMMkOUXSPORTv4L90SOkRcl0Hczx60Xjg6mFpFt7uO8XRU7LcDcWFlmb?=
 =?us-ascii?Q?T8JEMnztqUW9gm+lF22fTA3zRyndb3kXCHSF9EbAi2MxvpMyCCEm1eorM9vT?=
 =?us-ascii?Q?qHZuJyDO+3VLkumhcdHlMio+tdxQxlfWP+N99df1XlNYJ3WrKMOyDa7QOclI?=
 =?us-ascii?Q?gK8w09tg26bS5xKw8LtCEqOR6zxVdRES9K7fIw8jfPPIC3LZ5lE//9nB1SSZ?=
 =?us-ascii?Q?ajoklC93fTz+IedaccpleG5mdIx2DxnwRLFxBuKz5HORYeRDor0Xx0UbWOoy?=
 =?us-ascii?Q?fu6Zx38qZaFBLub/JsH5b1bJhQicmiwbW2aXQi3H0aaO0G2ZurD1S5xuUleV?=
 =?us-ascii?Q?ogfaLpFDJoHiO7nBWIOMB9xWtuyEtkIOvC4rUSk5zPOreXEtUZl5Lsyvnecr?=
 =?us-ascii?Q?1yINGXW+gtIF1PKBfNFnG4is28jTK/ITm5UK1V15BPHUPRm37cimZChxUaWr?=
 =?us-ascii?Q?gQlZMJi7uqPZNAS8ZxOWKRZLaizSO3spveQ2GIVEvuPaqP5gesOYF5qmzBQK?=
 =?us-ascii?Q?zJ8JTMQVm+SSAxvgCJGYmBgbH5P+/po45GYzTuXojuMeSTT6Fn+8+DCbf3ob?=
 =?us-ascii?Q?lOzFDeZCnBIMxSeDxMp3Q9l39tChLyutVV4FiDPGK9WwsOSPf/VXFIiP+fIC?=
 =?us-ascii?Q?+OATnN3knEFAFacPa1wB09yRGujBLh7RjOWm+7bnnhHyYoR7aKPidW5BvHxW?=
 =?us-ascii?Q?2vF6K4+12sgwg/BpwLVBaSJYetHdWIZoUUJlbsawly9W3s8NL0vtDzVaYhpc?=
 =?us-ascii?Q?l4BOjIKc4pYTdhzcDg5vnEHsZE7tNLJEP9A9pmKqb3qrnWDELeKPiF2NnuNF?=
 =?us-ascii?Q?46+Q+rGFXgbs3cXkWryFiCLJzOh+43jWm5Oor0dnbvNKcbvWEff/Vv0YkVns?=
 =?us-ascii?Q?V6+ZQ5pZPZi14Pl6OhIbJxb7t07L+6H0klFoa3lXnk3841aYk/Jho8ZftSR2?=
 =?us-ascii?Q?Pj4D+TO0AQNhPNJcN252Dk492LRQ18S9WZ7TXrxeKeCBg/Dnh1ogf5n0vhi2?=
 =?us-ascii?Q?pAmEjBW/KUhDLtswA8acrIF8YmNicPcKUdv+yRiPKcToqls3c/Vwcci6BA+1?=
 =?us-ascii?Q?L1JL3a/opByd9I1ZrHP8epNSj5+XqChrl0UDXJb7j67BMPqLyEv2at50ayLP?=
 =?us-ascii?Q?NHeBLQ+iwWU+OkOATASXArWQkgYQTc/VzdR5P4BDTQ80AOVZ3hMEjEss/Fkm?=
 =?us-ascii?Q?ku3R4FKoVXG29cu+DxHSe/ROEn8ULjJHvYh0ugu8pA5ba4n6StiIwX9HaBvw?=
 =?us-ascii?Q?gnLm7DUAma4yXeCznbhvQpOHDm2s1dMuFcd0C7P7SP0A8oHuRoipIhoSLf2g?=
 =?us-ascii?Q?VWJMYxYgn7SpJUQRmwwrDJulNpFfc6hABNCbWxuctTxVYAkMN6kNp7X/Lldq?=
 =?us-ascii?Q?/aHpET86RC4wFf0rnRabr9b6lEyzGdPgfrTLY+n5bkS1mzMAuuzkFH+oGuzj?=
 =?us-ascii?Q?cI9KXZz7KNgEWUyzEtDsqgyGMmVKrW6R0ziuMLs0kYg23JBFTR/ZcG3FWDAU?=
 =?us-ascii?Q?s3tFLnvz8L2PfrQaWIqr/h4agGRmxZ3/UEeA10CNl6AEq6FkWcd0NE7ILXR+?=
 =?us-ascii?Q?N2OPtZ2aEe7H0Kj6GmsNxMMBRzUFoTCkZutvnY7KFUricxF26A+Ziewf0YuM?=
 =?us-ascii?Q?ddpo3Vuzaw2YmdtAlCRbA80w74PYmVRFlsry1uYBkL+6GvCJpajTvZLvTpMW?=
 =?us-ascii?Q?amJ+W6PS37o0Q1yyNv/bRuy7KxK5EZc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a785373-4492-49cf-6c20-08da4fcbdf12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 19:10:26.7703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8UTaI1M4GWivWpYmaCPZ/cJnZ6D20HIHwJH/QBOw0u+9m3WTskVAJVF7jNmc0hS51C91YqmdgHfqreAabNhDBA0iKKARYR2o4QlQb44fEYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3936
X-Proofpoint-GUID: iifnh6I6Lmq6CyJIHmSzmmobL-dt_17u
X-Proofpoint-ORIG-GUID: iifnh6I6Lmq6CyJIHmSzmmobL-dt_17u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_17,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=748 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206160078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 19:10:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167010

Add two new, separate charts showing the avg10 and delta
total pressure over time for the CPU and IO resources. The height of
the avg10 data in each chart represents the percentage of time "some"
task was delayed over the specific resource during the last 10
seconds of the build. The height of the delta total data in each chart
represents the total time "some" task was delayed since the last sample
was collected.

Note that the delta total graphs may appear "spikey",
oscillating from high values to low. While this behaviour is not understood
yet, there's clear correspondence between the avg10 and delta total
graphs. If the reduced_proc_pressure data is not present in the
buildstats log, then the new charts are not shown at all rather than
being present but unpopulated.

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
index b42dac6b88..0707d75e47 100644
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


