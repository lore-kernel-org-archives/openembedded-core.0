Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6B5C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 19:21:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.11840.1655925690336042840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 12:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HuA4+LpM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3172a7b279=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25MHKJlE004781
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 12:21:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=6uQAcDNP1cNXHStFkD39KncmypH7YPv13wFYpbauEok=;
 b=HuA4+LpMvFTplPJPy/S4UQmr1nHEEPeJ8y0JtsXBBDdOJOQf1yb2OJn4TGaWS4hYpVg6
 cQqsl2nn/Opzm7G1Wbe04l+Mq+Q3wV4dHgrcfNGWU9iAwD8B82lUx7JGmsSFmM9jndV6
 32O9kUekQhm3eAUTAzugjTjvFCU70twndHHbAO85FiZkBDv5iYNRcuyPdjCMCcCw3XrG
 dzYZFiBbOpYVBjnFIUmoI+hdt/AqiUIsAFQgd0oGT22IcxvB2Wad+Qefv3p/gFplivIR
 OdgOWmADs83hcDOGR97eM6arQBP+7of5WXT1TSvbLeVHot62ydfj2J3xEPz7eIQiZjL2 fA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gse7ku84w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 12:21:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVtBc7yurutN5ktPbB3ZJB6wLHema0ISR1GY/K/bHE6eyFbUkCPJQFnvWdR5isS/CRJTBCJzp8iqK0mil/tY5lEMVp+pkW7T35fRI6jngdIgrnjSVdB4yi+EFF8vhP1wi8fjOKDbKDiPiLNAPHNrZXD3qWNZ6bxhLxqsiPF+TeacCXuR81MSszpmacoRINdjpPZfHaHpmX3NvWg874h4eDtWfuQkkzvDoLhcW3yfMtFbbKAGXWCiVjamJqimVzBOtQRT15+28/3SwVWr05AMIpklTVtkmMAhQD/M4Re8jWJejFYhCsog79cSfqynuHOjQ6fopb3F7qX1DjjCxvrp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uQAcDNP1cNXHStFkD39KncmypH7YPv13wFYpbauEok=;
 b=nh+Wa6h3PVLt/0eSo47MmlUQeH9Do2e7H1kx37Z8LHHnhua8tk9rOOXWNGRuJI15U6hX22w0LYFaZmXy/uGM8exxceS7saDIbzcXk4rFAHrpRM6v2pgYFu1GRWeMmXEHODckZb27NRecoLM/gw+sXQtr27q0LVAJ9uhW2BlfZihfLaAi3tyD4YzhBdHrBPqE4DIr4vJhb7A8pyAiUn0ptIshct1/oTEfDEnd9b/iUaO+84U4ochwRkbIOqyOluTK2W75aEl2nE0+s+DP7bV5u3PqqKoa5qAVXJjIGBrM6PwdSPO0N2FNUn5wQc0HkIG2oy8HdGsNiadKbLp4TG5m/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by BL0PR11MB3011.namprd11.prod.outlook.com (2603:10b6:208:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 19:21:26 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5353.018; Wed, 22 Jun 2022
 19:21:26 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] pybootchartgui: render cpu and io pressure
Date: Wed, 22 Jun 2022 15:21:04 -0400
Message-Id: <20220622192105.2177756-3-aryaman.gupta@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 023a9367-806d-4d26-c0c0-08da54846652
X-MS-TrafficTypeDiagnostic: BL0PR11MB3011:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB30118FBFFA0050FA6838C6B6EBB29@BL0PR11MB3011.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DSCMdeylPcczXp578E8hXBXCAVsMB58GTBNbwNbTpWGHBiu+WxRprg8F35AkW4E47zu59ompqo+T/2Ja7P/37EvWzOLpU6XrioEe/UgAjYGdJt0SmCyo3DW0pKb+hVJvp42EyxPgiQmC57mS9kcpmca3Qzw/qE/jEExmQtI/aXh5jGAshOlWtmrvSrAflosA3xER+vII6eva/2VAEJVm7Kgbcas8vSe/hWLuNQX0fjW+FgDwFtAWmNyCB72UgxSKBUUzh9i31KfopjK/mPUzclfkyS979co0AJbKHtZTE8xzFWjH9JYS+AjE0wsoTfGAeXLoFRfcebQ2s3bjGrODZby3N90PKfwYhSHicR1wbQr8+/jALcFpGfMF5t4/S5yswCbv3V7q4/ddRCz1oG6+YGUjT1tF7p5NAqUhLpC3xk4Diygn0zlLopupVy4GCIHuR4kbZBI+vWSW7JV+bW1DOxIuyK+Gd4jGo8SfiUpiGjKO2l5rc8WSuMJkv3h839XMeCIjuhu8/8NSnlrbo88cm8MIjSblX106qBBhOU/relKV5BaVho/dUTloqgVUwzB3loaYNP9vbQs9DwKtHl6OQFinZn2KRnO0cVzU9C+F6PgMYC4xE1QJ1u276ji5BgE1skvmURFyg9K1TDHeDuSI4GnpV99V2bioeMC+5gZNJOOw3Tgl/KWP8HUrBYme9fMK22IsfGE0Lbp8aEipSMKW9epbEUruYz0unhQMf4EikktjZNW/Eg5r+SlNN9ISDMG4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(1076003)(186003)(83380400001)(86362001)(66556008)(66476007)(66946007)(8676002)(6916009)(316002)(36756003)(2906002)(6506007)(52116002)(5660300002)(2616005)(6486002)(41300700001)(478600001)(8936002)(6666004)(38350700002)(38100700002)(6512007)(44832011)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rUMggCW6sgh617v+yJ/RFLNgIMdT6twucJXgJFHvkvB2nGoPj4FvL9+TM7Ui?=
 =?us-ascii?Q?p8dYtiQgSpXIe0bJAaZUqRJp6IEi37nLcSpeB4/HWyFuwivWMTmeBJAsW9Tg?=
 =?us-ascii?Q?GApZPSTSmKd1l2Q3nolZ8mVvA71Yx82C3UBuKLD/ytHIPAFfgL0qYZT38lGQ?=
 =?us-ascii?Q?/VxoVUiCZ1iQ0mc2HSWGfzzHPsGqUpScofW7IS44Tz6cc806gE2atom4VN6J?=
 =?us-ascii?Q?87qJrzNCkJKk/N6uRoG2j+/NIxfK7bMVMKQ7gQH7ieX3uMbkwEROH9WdwRTj?=
 =?us-ascii?Q?xP9f2RcLBz/IHD9aXmvNSXQdlbCalPdV4Ib0rA+JSCMdZY24vtqSru41/8bF?=
 =?us-ascii?Q?VSCUEXAnruRzjiVNlyvb/2EbJX0YuDsM9xEIVyOfhkkKiYzx8pcyyB/ASWi8?=
 =?us-ascii?Q?zPu/2MVam7MjUCd2BJXwoB8Vb/qRd7/fc0Ul/21GFufPEcPmelIPZiLU4cwY?=
 =?us-ascii?Q?VWBI6S4o7mSbz6FeMoZNcv7C4qmM0fKTfwFFu5iZA46hPJ8k91IdkfH9ANoh?=
 =?us-ascii?Q?PIgBQ/2RJ/RCHD33S403qH4Ee5U9bmikwhCC883aXKemBjPtJUbYRwuX2GHl?=
 =?us-ascii?Q?iYQrGtvn7yVIFNprVw/0bL+4001jPrRiuA2VftaqbVFOGmb+20X4qdAqayIR?=
 =?us-ascii?Q?BieuG7ZFrDGDz/ZvHMT20R8NCq/B/jkfKIl50hV6TnpjL+s9yk4qyxhviDjU?=
 =?us-ascii?Q?9f2sHfDTvf4h5PSaIo3CJTJyHhfyCVA9Xzx6Dp8UJNPf9iZDzCQ18Mx8ojYj?=
 =?us-ascii?Q?SrBVvvIFOzRM0GOBREgGk6mN9IA0fd4C0UkRGsXW/tKQ06VXGyI36plOWaZy?=
 =?us-ascii?Q?QCb2lA5E30uuX8RWv8ogQfDCoPfHsQqjAkNgwnmYL48c1EtJrgj6jW0dKujI?=
 =?us-ascii?Q?Aq/KDrwM7K2qxp/FrKZzakv+7DuCtwUIpO0nAxd78wKsgPnux+qNFL6ByyIB?=
 =?us-ascii?Q?4SHwMFnLUHsMq9qG85KeAU5F3hl7w1dRlH78uU8YJOKuV9vU5RIYadyy/dRM?=
 =?us-ascii?Q?tZDkNWVKfiYLxl9N+bl9CNstxMsPaWt5I9s3mPYwE5+tvYCciwllGLUkWBh3?=
 =?us-ascii?Q?DAcGS8W17+8sgxLF7kZcJr485yOjtsKeU7TqYBpVtg6NB2vb0bVIvbwNmu6c?=
 =?us-ascii?Q?fvgpW7m2LgcIkKdpRIPEvywIA8u6DUHZ2coRyCHoWNiQsdKknY/zsjxqGpAW?=
 =?us-ascii?Q?IbtJ3bJTdNbJbRLKpOKwefFc+LMHAN9q6+WYc5RlZyDuLe3se/L+Mj1nzUEz?=
 =?us-ascii?Q?XZ+qBhLeMdrzGBUqRw7ezaM1bGFTafCsgSlh/y95Jp4SKYjH+dC4fNsUVYt5?=
 =?us-ascii?Q?XfAijpzS79EP8getqMiGakygSAmudKaAGQ00Cap+jQgngAi6kONmh0c0kiIW?=
 =?us-ascii?Q?TwuOF8+JufPYMN9MvMu+BcNIKG76dWjfDn423PYCVXA+bYrmTMiBar3+e/hE?=
 =?us-ascii?Q?Wn4LFpJ2h5KAz3g/jASj93geh4kUy5iVmwbmz9GoTCf0vTyS49ui0tp4wF53?=
 =?us-ascii?Q?4whOFMJLXhsby/DcLz09XNil9jDrk6Y7/vf/nNvMOMusCZ9GGebR6p7Cj46V?=
 =?us-ascii?Q?PQgG20I4zmWbEI8+Lv194SMWyfq3BimaiMtK5SbbrQsBlMcocslqfqsR/Vkf?=
 =?us-ascii?Q?yqHqIlQmcf53XC5sxpi1ZbxLnawJ+PZp8BCiyP8THyRjHtOR+u0jK2MFlOWg?=
 =?us-ascii?Q?Rzg6OBjkl1Ao5aI/z6npQYbKQOKNtRQtAgCgeBNVDlawEpspmtW7Bl3gKHd6?=
 =?us-ascii?Q?VU63lck7yPp3HDrMe4dTFKvyFN6wvT4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 023a9367-806d-4d26-c0c0-08da54846652
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 19:21:25.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mPNzux6qB2VhSPqNUPeBkrLl9ktBqjpXJRpeLfcuX9tn4ssQdXr39/bxbHnZzk7pqRYdVztGb6ZgUKwQNee4ec+fbHnVqJqNCcPMI9sBjEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3011
X-Proofpoint-GUID: RO13-vyJiRKh5-lkbwwkRtMdI1kmFrPj
X-Proofpoint-ORIG-GUID: RO13-vyJiRKh5-lkbwwkRtMdI1kmFrPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_06,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=799
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167255

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


