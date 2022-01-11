Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFA5C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 23:59:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.16556.1641945543187980032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 15:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=i+IYFh+F;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8010f76d9b=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20BNsIeN020017
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=4veZL1KTLakNolFm90Da2MLLobjULX9TzR3KUBSdKFc=;
 b=i+IYFh+FBUoCN+gwvTfxuMp1IHrIo0n047xHahj0Hud+i63ZuwiYkKCfx2uw8Pwiqvap
 xD3Az3kXfN7Q4McGnCjKK4yQZNbMpQ8y/3ig1exxnlO2Df8UZzdvB8kg7dWWAjr9jnwz
 u+TJZXgOvcz4q5CvoB6wrP7DcjU0pBT1ZHFxIAWZJ7n+bjR1OqNsF1iz53/Z6koGZpxU
 34lsKYAKjrcOsZXXjh7ybqa4DoUTuQBMzS3UJs1zb2Bo05WK8+P6YQkzR1Jeiazfm0g2
 RHCOqcfREv37V9OvtT7mFRRY4YwOqXkCTTr6VThaG6cRchIEqPOGtVCethvcUfF5f2Jw kA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj1gcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 23:59:02 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20BNx1v6029112
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj1gcc-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jan 2022 23:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNc7NrEm6xBYKO6uW9Y5S3cC4+OvgyGquzq5jTU4dS5MsutXyHgIKsCPh7KmAcV+lXK8gOH2K1Ssw/dglZjKKaTRBwYW5fxt7wn3BMfsxwz9wzWEGNU9CX/3Q6eAit2yq2kKIGB0p1XpeL07jIy1LEuAaP0+9Q+NUvZPztCYxRso8XgsR05/J0bdXnQhe2iOBXwoH5S65seXTSAFq3xJF50qX6ey6RJBBL3OTHVmHK5Uty5N4WpUKxznZoexdTCsZ0p3xGZ5zZCS1whv75SdsV+laXTzBX/LotcTLKD3QLZUy2wrg45liK+XSnZfwDbx1nw0LVoGEwL5Ed8vYp0f8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4veZL1KTLakNolFm90Da2MLLobjULX9TzR3KUBSdKFc=;
 b=Inh2NwvcgHPKjWHcRUzOV3aMQFDKSxzp7b4CJwXhzMTgp2XMCJX+D4TYSTRb9Ggz32xiccfqsH4FBeyFXyoMKAxgaIv0GAWGd6vNVag51ljkDvzXVHXJwAJ95xEDMNo9VwyyGfsQDgU5zsDdUUvWkTnPTKyH3nOx0r0P2RVW9SW84TGcoNn0uRkCuTO/e/p/51BvX1HonG7R11kbZLt0zwg+tPloe0A1JpID8eu2mbTbBIGXzwO9/sPip10iwvoaW/Feujfzs4RmJxTCaTXL4qXHgJ32QoEeEbTKS051aRMNX3BLRNlWWf6zgN1y44fnhUuaiM2PaNxF2gzNqfxFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1280.namprd11.prod.outlook.com (2603:10b6:300:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 23:59:00 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 23:59:00 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC PATCH v2 2/3] package: Add support for kernel stripping
Date: Tue, 11 Jan 2022 15:58:39 -0800
Message-Id: <20220111235840.81471-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220111235840.81471-1-saul.wold@windriver.com>
References: <20220111235840.81471-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:5:190::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d032c27-6ade-464e-d2b6-08d9d55e5671
X-MS-TrafficTypeDiagnostic: MWHPR11MB1280:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB12809635F74810B1652C9241EE519@MWHPR11MB1280.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HhpOyaLoqABFoHdLoLRprSr7Jt7uKBvfftj+KNUx7MtLs2jy9wRxiYUKNReVrCmh8LI2n5WEtvTmiQHf8HxFFXlLaMJmS9wGwv466oOLD2Y9B0R96nrrKe9fZKfU0uPQ5b1uiCcHR2HcbZY7OOzZfDQHPnMAl1LTl/qXTNF+94IdcDuZrWCHsf9j3QH2tHYxyyshfi24JALc2KpIa8KfNMyPzzsh9P1KaSqytvxxAIeTGqu5Xa1w7W+JdZx8ZIdEgUFd9pcqX7pgsyXHtasV9sNSHF4V4anrd5BTHVvuR1+V5xlV0MKPvfGzOw8JZvYpS/0u6ERwrzThtP3FEoBbxe4yjhETzGePRg+qsctIEEj8l7cjyJFLZTqOZt18H+qNNVeIL4h1sB9sRk/Q5peDyAVJeXwLoMl9TNa4JD1eycL6HzVtSPy1Jw8LPaqqA6hpy3VmI9Gc+Ek6T01NgdUmC6tOnFxIht4b6hMvgkEZzx04wfoO4hUdeY38cjdmYOr/nwtYdVxAMk0zfJhUSNrngw6IWzZjKFlnhjl8yPjxRXNiH70XDEHiTLCCHRZ4IMLlqseZXUzetR6qL2TuFIdV2ma7+al9ddVZ+iUc/znmExla4p+COwIvTFGHiVTA3Io8ScndvHrOzhMNG97/mMH4NcwjxpZheBaO6XHA+Rp2gyDj/qzAPFUgJ27hcvf3smnIwKIy8IoMClwyMvxIXYMW+5Wkt3l2RdAJA7svTfCVn4s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(508600001)(36756003)(107886003)(52116002)(2616005)(2906002)(44832011)(38350700002)(6512007)(5660300002)(86362001)(26005)(4326008)(6506007)(66476007)(66946007)(66556008)(38100700002)(186003)(6666004)(6486002)(8676002)(83380400001)(8936002)(316002)(168613001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LpvIBPGWzKr+jteMquYhQafEQcJE9wiKOL7Mgsqs8k7SwQ/sDC3pDulqsoiQ?=
 =?us-ascii?Q?ZfgdDCIQ1pe5rpt/87dHb6bMYG56SsAPsnTZnXiGvhVJ9K/HbS3HWXs/GL3L?=
 =?us-ascii?Q?YF7rlJ+PpfiDZA+bxAtzLHv+pOKQRmSszhKx65rLR2NY22qWCSAELXX7Pr61?=
 =?us-ascii?Q?eiYUAMy1N88fF8NgDUEjLQWn7PoHBDAq54uui2tEaqTmIknaJJjjkW9Be3Jo?=
 =?us-ascii?Q?rUsRfWuw7t6D9wLkgyArd//qnQoYK2IHLdz3U94dbd8duowdOYvF0D0GNhen?=
 =?us-ascii?Q?N/YefXh91UH99Wa2Vz+2lJ6n5eqzbTUDlbekiBgA0Oi4m1qkIvMuWdcxniDT?=
 =?us-ascii?Q?VsiKdVzDvIZt05z5/woT3XGB1dugZRNvidrPr+iZh17HLdalBxuXmDe8YJ2H?=
 =?us-ascii?Q?816itsZBhns93QeNlSu2+BR8ItyHMDU56Mni0BGDo8qyZ4Sqs+ucDwDz6GWC?=
 =?us-ascii?Q?ysXlycV+Cut1EBvd9qM6r/4r+7rdod4hMMGO/7adunzyP3OtOWRNPUqLVU/u?=
 =?us-ascii?Q?HYtjvhJbvky1IL+dXBDMqa/B51ZyINF9TPFWWoO+EbLpr7R4RYkBavOzSiyf?=
 =?us-ascii?Q?16mef1WFUN3cjlR1M552BSqRtxEgq6vW1VEQruxICRyBmdbXEkBaZd74USQA?=
 =?us-ascii?Q?cN2eJ9U69jxthQ1vnXUDhDW2P3Lxk6J10p5Dcr0cLOSFZglRhdMbR8XUzhMK?=
 =?us-ascii?Q?DbiHrgaf/PXwyvxgeRON/8UWX7gf2hLI9cZ3UWz1qRHpcNP/boqy7QxNAAMT?=
 =?us-ascii?Q?UO3Ake08hBZMk6pkfLx1CT6Rih+q6hM8k5w15Vbw74IMjei7VUwxgpkdEwln?=
 =?us-ascii?Q?SCTficeJGKAe1BqNGVZOZGBQZ3igIEhLtNEYHBPZW47gWDZeqchwrU2T2N/Z?=
 =?us-ascii?Q?5d6GGD2W+K+20v7tOKnURwS0vyJW6ly6SGrtbU4PokM9q8NGSWeudektJUhH?=
 =?us-ascii?Q?AYzC2/Eper/ZYLcrBv2v/U50yJ1lWLlyN2Z6IYSEmhtsAI2OD+0bhPbV87bX?=
 =?us-ascii?Q?VVZ/eG5JjjDtk4WheIORiGmdlbBvHk06NOTi0vR+X/GOjtZdf50tDtTPqm7G?=
 =?us-ascii?Q?IitEQYGqK6ZmIChdmmgt2YTRsgzyp302OgREOCaUuMshrSYCgGLot/0yM1Om?=
 =?us-ascii?Q?lWRTegfwZcCV7fS7KwbRKgpUkEutghr23ZMR1U94bEGHUGF96Tbi/le2JzTc?=
 =?us-ascii?Q?2U7oZe3h+M13dJa+YQPQ/xytOGEH456td97SofQJcSL20iCCLonzU7RMBq4K?=
 =?us-ascii?Q?mx8+OPP3g8n295gD/v2v50ae98ocY+XuBkAmGnILIU0oDSDxvOiFxviAph+2?=
 =?us-ascii?Q?0WRfIzMZUJZzn/BB96A/eqMmVuPTNKNJZn3P/P/BRRQI1QUmWYOVuxP0MMQv?=
 =?us-ascii?Q?KjtVBDqFlf8wLaQGbu0oYDS/njNSkH0yxm5V2T7TGLrjeGcsZLB7F8U++C4o?=
 =?us-ascii?Q?+FX6NrzmO2ara8mKDu7RYta9xR7iyH3eQLc7myVxqaJsbV0KLXdZRKiUF2fA?=
 =?us-ascii?Q?zcyW3rNwr3PQkJ4PeFpO/fUyhAQt+r5jY1O5/5DVV+ojc2Z6A5n5PMTRosKP?=
 =?us-ascii?Q?g0MMagQ5Bn5HvWvXCYAkRUbf5szfdvq7rctyqWaC4L+B9WEk6IFhIzTsfO90?=
 =?us-ascii?Q?/oWpp9CJIDf8xque7YRRgnM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d032c27-6ade-464e-d2b6-08d9d55e5671
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 23:59:00.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9I5aok5WUGLq1EilCgEcFwqPJCstLlaygLQFOvir5Vmg5bfqyY9uPM3x8xhxcasorKfxwLfGLwZEY8HGJQ4y2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1280
X-Proofpoint-ORIG-GUID: eCQgT9YrjuGPj6MzdXy8ZigjFESdU7S2
X-Proofpoint-GUID: Ib463KAiMij9yOoHogizNT_2k-5hfMlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201110124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160474

Extend runstrip() to accept additional argument to enable
sharing it with the kernel do_strip() to that
KERNEL_IMAGE_STRIP_EXTRA_SECTIONS can be passed.

Since is_elf() understands kernel modules there is no need to keep a
seperate list for kernmodules or hardcode the values to runstrip.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/package.bbclass | 21 +++++++--------------
 meta/lib/oe/package.py       |  7 +++++--
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 09cd376f4af..794996e6d6d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
     dvar = d.getVar('PKGD')
     objcopy = d.getVar("OBJCOPY")
 
-    # We ignore kernel modules, we don't generate debug info files.
-    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
-        return (file, sources)
-
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
         origmode = os.stat(file)[stat.ST_MODE]
@@ -1122,7 +1118,6 @@ python split_and_strip_files () {
     #
     elffiles = {}
     symlinks = {}
-    kernmods = []
     staticlibs = []
     inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
@@ -1145,9 +1140,6 @@ python split_and_strip_files () {
                 if file in skipfiles:
                     continue
 
-                if file.endswith(".ko") and file.find("/lib/modules/") != -1:
-                    kernmods.append(file)
-                    continue
                 if oe.package.is_static_lib(file):
                     staticlibs.append(file)
                     continue
@@ -1164,8 +1156,11 @@ python split_and_strip_files () {
                 if not s:
                     continue
                 # Check its an executable
-                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
-                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
+                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) \
+                        or (s[stat.ST_MODE] & stat.S_IXOTH) \
+                        or ((file.startswith(libdir) or file.startswith(baselibdir)) \
+                        and (".so" in f or ".node" in f)) \
+                        or (f.startswith('vmlinux') or ".ko" in f):
 
                     if cpath.islink(file):
                         checkelflinks[file] = ltarget
@@ -1311,12 +1306,10 @@ python split_and_strip_files () {
         for file in elffiles:
             elf_file = int(elffiles[file])
             #bb.note("Strip %s" % file)
-            sfiles.append((file, elf_file, strip))
-        for f in kernmods:
-            sfiles.append((f, 16, strip))
+            sfiles.append((file, elf_file, strip, ''))
         if (d.getVar('PACKAGE_STRIP_STATIC') == '1' or d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
             for f in staticlibs:
-                sfiles.append((f, 16, strip))
+                sfiles.append((f, 16, strip, ''))
 
         oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index dd700cbb0c9..7842a614e9f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -16,7 +16,7 @@ def runstrip(arg):
     # 8 - shared library
     # 16 - kernel module
 
-    (file, elftype, strip) = arg
+    (file, elftype, strip, extra_strip_sections) = arg
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -40,6 +40,9 @@ def runstrip(arg):
     # shared or executable:
     elif elftype & 8 or elftype & 4:
         stripcmd.extend(["--remove-section=.comment", "--remove-section=.note"])
+        if file.find("boot/vmlinux") != -1 and extra_strip_sections != '':
+            for section in extra_strip_sections.split():
+                stripcmd.extend(["--remove-section=" + section])
 
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
@@ -172,7 +175,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
     sfiles = []
     for file in elffiles:
         elf_file = int(elffiles[file])
-        sfiles.append((file, elf_file, strip_cmd))
+        sfiles.append((file, elf_file, strip_cmd, ''))
 
     oe.utils.multiprocess_launch(runstrip, sfiles, d)
 
-- 
2.31.1


