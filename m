Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7C0CCA479
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 19:21:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.12268.1655925689047053655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 12:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=g9dy3+91;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3172a7b279=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25MBfm9e015681
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=h+QFiApoTY1dRxNtmZFBdIIE1IE/sRVQfAR/AIDJazk=;
 b=g9dy3+91CMSRYjSv40qIoSv9rejHpAfEYVjDsSIdJseTfI9OFnpmvSLborg1rpXHN3lX
 fQdtkLTaip94GAMq4EVOIp/CPS8aj3l+MT7FACT4KnOVZaIbb9Z98s7cUodabowv/s/1
 b2GRB/sV6ZD7/8nUJ7tOKyKCB2z9vSy3z74eEto5F5+T2ADXjvbS8iPO4RNbH3c47B1b
 IUTkF4Q/UDkl+x1FTiEaOMk3WYH89Nn5zDv8jbOk4/uI/LwrEexgHR8bVm5tsyjDzNbA
 dw0H9Mgjqglq6LkDFsQHgXUQMLSRa0EFJWwbmqfynbojXUSz2VvRKEeeT8CtA05TwL3p 2Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gs5p9kejf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 19:21:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItyD4+gfF5zBR1Q1G6yAkRJCv7zTdyLHwQcQ0El961fsFG3GLdbfpla276pNMtQv1lqetNu2P4Ov4QUjbGtk/Qey26UOYi7K1kLPYvSkLlD+8d6D69Hpu/gcNxrs4wwJgW5GlyWwT6vXzp+XRLZq/ots2Zj9QOcjwOwfjazip4ok2tsBbc23gYueVvsYDUyuAq4ctBw3nHxlHSzpS+hl4rafPNNqoIk9rWMQdpmJhDvuw0zmr5UEKwXPfwQininCBEWP9UjXULFPdl8/ZXPOyYH90CPfOAJm2HrFTm8kNo9+hdu37BX/Z2GRD0+FnaCnlAg/OxShHAFJ6eUAuVGa5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+QFiApoTY1dRxNtmZFBdIIE1IE/sRVQfAR/AIDJazk=;
 b=MOY418om6F+YuglsVp1dkfWPbBEDEcaqeVT7ErXOd/lIHWkla2jbbIbCCpBitTlbZ8WRM4/Wb5pEqJ3kBOt+AlWiwVr4SgqYwhmLb5X247zfuTUSxakdOGr7JJASl06I7vi751NTJFxBeIxNMbjmRbwUHKURm8DYtcENH05eNSTSGIAI1xUqqX0e6mlVr3BqIsRoLGZdT1iNXzsQ6AsPrmuv1zZRKxiDjbE9xHSBIOLnMBIm7N8bsk1AXf8pBGmzY0LC5KvrAtUYy4cLZ4tuQZ+YqNoVE9HX3dZzhPwIXrXHps2QISSIJxD6sRyX+JBq2/u0o0CFkpQ1L/LYjlVUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by BY5PR11MB4497.namprd11.prod.outlook.com (2603:10b6:a03:1cc::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 19:21:26 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5353.018; Wed, 22 Jun 2022
 19:21:26 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] buildstats.bbclass: correct sampling of system stats
Date: Wed, 22 Jun 2022 15:21:05 -0400
Message-Id: <20220622192105.2177756-4-aryaman.gupta@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 84736e50-f978-436f-e798-08da548466af
X-MS-TrafficTypeDiagnostic: BY5PR11MB4497:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4497D4E5A7CAA37E2C6C9DDFEBB29@BY5PR11MB4497.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7M4Jz677qCDXCU9fLpvzmxZIdqygbapZLMra8ecvO72Txhmh+B7W1/1iVdmFyCDor26zefgg1uDm6uSK+iAsOVxxlj8PzaHUPFA4egEH9wwQRHKD09YrPdrhaipOcgQA3YhG05N9znE3Qy39FJiYgPMt7xBbjdRx0gnBPNPzy1mPPjoXY6CbCZfu+ebjw5GwixREy58q0a4ci1pkEx0mRSrUrL6XEuF5n3/wXMkzqJrI0ywVvGz8DdxaYOmWENNwAUzbrxCx/wU50gtPV+i0npcenV0sinkRzAUbYRjeND23dVC9t0FPyNrJEO2amP6krDs7R0JJCs81B9Yc0nxX0dyApDRrpb2Wr1RZEGfIo7yyp5eASTO93CNOgu0O4ek93etqL+dCP1kc6w2p0AC4gSiREmsq08LURgs0IaUucSVLQfr+WdLFjoIb+41Xd7FPRVYt3XvaugKoUCoRPEjEHbH/Kc5RHEoMAYpLbOHJxLx1RdjeqY6YahRFYZzL53i7p9quYNASaGfCtSZBKUJ1UFEcMF0ilm+bpbS9f9l95fQBxfOjDJQwsYwskJWq7uBVaOYZjsiudIf8B0jc6r26OzXJ17DgqW8Eb5CnyTgm7ZJgNb4RyoNAFkh9gRntJABTPeFB7d1RJf34lUzp2pec+gJnLqk8dQcrOwHJ0hrTTQ8ookbO/+N2ydFcc3kNgj+iBddgzVhglGRcjUMDqnbwXnEscVN6KoYwUbPm4slcRXAo5b9H8DErhOTYSebjpeEm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(83380400001)(186003)(6666004)(478600001)(1076003)(41300700001)(2616005)(38100700002)(38350700002)(86362001)(6916009)(5660300002)(2906002)(44832011)(8936002)(52116002)(6512007)(26005)(6506007)(316002)(8676002)(66946007)(66556008)(36756003)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2OjlOUkw53aa2fGtWCQZcaDxKX8fEohNuvz11AEzS6DR7YIFkvglspF27rIV?=
 =?us-ascii?Q?cP3hco65Ws7yzp/R/ZJryN/aWSdTPL3c49s1bFfyCS3HAPdk3UFjQt6TtvbJ?=
 =?us-ascii?Q?81LBpmCoPfE6+Qwf0pdcSuxHfJ98N1l88AoXKOLCCwrH991XuPnqGalhyg1Y?=
 =?us-ascii?Q?5zP3mwuHI9EajLfCuNl4BqgCplf5APu/3NiSEucgugZ3K4QnPBgrGB0KcvDu?=
 =?us-ascii?Q?/y0DE1Iq5kF7F7Bcwn6LIUoRKxvSrOIVNM6+pozgnPtOzGx/y0w8gjpXp/iZ?=
 =?us-ascii?Q?BMmy78pGI3Evk48/locLbkyoJVmimzOjbDeuP9B+N1sRo+QiVvaiYJaMlmbp?=
 =?us-ascii?Q?eUpM05/Z19UOMq1LsCnweVg/L/t2g9qXhQ1XSHTjksCE9vM6j1/ryj7OrkRw?=
 =?us-ascii?Q?v2i0HJIYRjBP2OZ7IdKG/yz5f+ny0nEN85DFBysiaNYL1l3pWU+ME+xbAYS7?=
 =?us-ascii?Q?nnMJqbqABW+dyeFnWCRg9BKEyfDOoaG6wYRIBfO29bfZdmM5ECdpYSiIdZLR?=
 =?us-ascii?Q?BpOF+eL+qUsrr2zCyt2HriKM7RCEYmqEbtLnQcGyq8mnWA5Shfz0urLRS/42?=
 =?us-ascii?Q?Lyv24RXX11J2/Usoqwd9CaojbCzxWmujiDV3DsV9OMLPhV/D/nfpPGgkP2GP?=
 =?us-ascii?Q?8rpW8fRZYu1izTyjt1Jau+W4aIXHsiCTDuN3u6tF82HAujk3KutdDiuz0VRY?=
 =?us-ascii?Q?JX7Iw1Cp1mIli+VObkOyY2Wf3zapxTNJTucUIb0TGJAXNW+UdY0LvVoHJ7La?=
 =?us-ascii?Q?DpxOjBl0h52pU4MDi/4KnAPB6fqtqFA3X9CX6XomJ0YCvdx5qrwWlF3xL0Ru?=
 =?us-ascii?Q?wcBrtkUvXKWdyismEaklInKwSPtnDGEe3ClX4fY4AH5e2B9cyRf3w9NrO/Zc?=
 =?us-ascii?Q?1zBVzkeVfPNGAg9+EwH0uf7nIGxUxM2ma5czKdZbshoGQTcZpnuQ5bhNja/E?=
 =?us-ascii?Q?8tJlzPss29A5ead1GK82iM0xSPXyGPpfBMfqkiacA75WuGsyrqbj72Nc2Umy?=
 =?us-ascii?Q?+Kow0zn+zsPH9Bb+j/MR8ll28mwuz+2MS8x2p7umLO5udfM/s4K28E2vJgTD?=
 =?us-ascii?Q?rZ44+7n5/30UPSoxFfyJajWki/gdd/3j3Fz4dJXevTPvm8VUVqCbRHjfm1aa?=
 =?us-ascii?Q?fFGpkLOLJMfoaukXZcetMNwXBNsJfszosxznWH10w7wjLjxUSoYNRFPHeS3g?=
 =?us-ascii?Q?Cx7AKyKkjH2BZ8Y+H/4jKg1jAxJ+4KZ6S3CA0HpGp1Q5LIYYCh4vo0STDg6h?=
 =?us-ascii?Q?MDO3G87GtEQEaDjFIkiLBTYnqs0j2f9V2xUXwE30J+FxiIWRaPCBmW/az/vn?=
 =?us-ascii?Q?EDioE6WPjoN5EbfAYHzua52AGaxs+bx6d9uPChmFua6r5efzNkq1YBPIoYtT?=
 =?us-ascii?Q?idqnnS9xDiotIrUm1+ClfiLGGB0UIddc86crQvEWLbHoSwUPKbThmvgdltPP?=
 =?us-ascii?Q?kQnqnvzzdmkGT7DPrmf93l/R7MLYyC58tqdqYHjgm6c+/BHoCH7ImsL+GLGv?=
 =?us-ascii?Q?eeStH24UvGjZlEjW4L0DKmn4aXFki5GIht9RclO6pjE+qWUCVScT/dWA1WcN?=
 =?us-ascii?Q?mW/VxKDmBMYnMXM+zIaGCZ0YxTgUHPSwribkjtjNZO8jcDMMZCkwYXI33r09?=
 =?us-ascii?Q?8OocWlD2CUJ6qhMGtgNzxEej+MGSJDVyMVIdBZTbqroYCtl2VaeD5ZROqnoY?=
 =?us-ascii?Q?Ed9614SXUsPC0wy6aEa+UTlrd5WxayvgfzItrH9FDj42YpPtCb1maFXLXWWg?=
 =?us-ascii?Q?su/EffjdS56OgBffqd9e+Fo+1Z2rvLA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84736e50-f978-436f-e798-08da548466af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 19:21:26.2816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WyHzo4dIA5FkO/ufU8HxEgdqi9knksSOo9dJNbd7j9tqqdblFRfCrdFTtAwPF5PlLtaZtFDlf9PDbN6J9F7ervZod93OXYHR0G/O2TRsojU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4497
X-Proofpoint-GUID: sth7ButSVRHM2EXrCstTOK1bknXwPsJS
X-Proofpoint-ORIG-GUID: sth7ButSVRHM2EXrCstTOK1bknXwPsJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_06,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=845 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167254

The last time of sampling would be updated within the SystemStats class
but not re-recorded into the datastore, leading to multiple samples being
collected in the same second in the sample function of buildstats.py.
Fix this to collect and store only one sample per second within a
certain tolerance to deal with variation in the arrival time.

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
 meta/classes/buildstats.bbclass |  3 ++-
 meta/lib/buildstats.py          | 23 +++++++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 0de605200a..132ecaa98b 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -285,7 +285,8 @@ python runqueue_stats () {
     if system_stats:
         # Ensure that we sample at important events.
         done = isinstance(e, bb.event.BuildCompleted)
-        system_stats.sample(e, force=done)
+        if system_stats.sample(e, force=done):
+            d.setVar('_buildstats_system_stats', system_stats)
         if done:
             system_stats.close()
             d.delVar('_buildstats_system_stats')
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 64ad3ef40e..5d32a81906 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -51,11 +51,17 @@ class SystemStats:
         # Last time that we sampled /proc data resp. recorded disk monitoring data.
         self.last_proc = 0
         self.last_disk_monitor = 0
-        # Minimum number of seconds between recording a sample. This
-        # becames relevant when we get called very often while many
-        # short tasks get started. Sampling during quiet periods
+        # Minimum number of seconds between recording a sample. This becames relevant when we get
+        # called very often while many short tasks get started. Sampling during quiet periods
         # depends on the heartbeat event, which fires less often.
-        self.min_seconds = 1
+        # By default, the Heartbeat events occur roughly once every second but the actual time
+        # between these events deviates by a few milliseconds, in most cases. Hence
+        # pick a somewhat arbitary tolerance such that we sample a large majority
+        # of the Heartbeat events. This ignores rare events that fall outside the minimum
+        # and may lead an extra sample in a given second every so often. However, it allows for fairly
+        # consistent intervals between samples without missing many events.
+        self.tolerance = 0.01
+        self.min_seconds = 1.0 - self.tolerance
 
         self.meminfo_regex = re.compile(rb'^(MemTotal|MemFree|Buffers|Cached|SwapTotal|SwapFree):\s*(\d+)')
         self.diskstats_regex = re.compile(rb'^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
@@ -164,6 +170,12 @@ class SystemStats:
         return reduced
 
     def sample(self, event, force):
+        """
+        Collect and log proc or disk_monitor stats periodically.
+        Return True if a new sample is collected and hence the value last_proc or last_disk_monitor
+        is changed.
+        """
+        retval = False
         now = time.time()
         if (now - self.last_proc > self.min_seconds) or force:
             for filename, output, handler in self.proc_files:
@@ -187,6 +199,7 @@ class SystemStats:
                                  data +
                                  b'\n')
             self.last_proc = now
+            retval = True
 
         if isinstance(event, bb.event.MonitorDiskEvent) and \
            ((now - self.last_disk_monitor > self.min_seconds) or force):
@@ -196,3 +209,5 @@ class SystemStats:
                               for dev, sample in event.disk_usage.items()]).encode('ascii') +
                      b'\n')
             self.last_disk_monitor = now
+            retval = True
+        return retval
\ No newline at end of file
-- 
2.35.1


