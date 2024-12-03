Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEDCE6C5FF
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 04:53:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12248.1733201607518555846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 20:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20671066c5=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B34J30x010701
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Dec 2024 20:53:27 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q2fy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 20:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcUXxh6LvIuEkvtwDspF3LrxZuYADIhCtrK2mHKl+KzPsLZp+QJ4RAbUipINe44TCErTLYWS+p8P7QdZcrAgeUZ7ua/Q0H8XqW8ropX70w+Eo4s9aRn6XlkzOSoxdCdqD8IshcqShttjAkE0tSdS15ipI1ZHyxvRerDYiwqYWEGFQw+BXzhJb/v+bu9I0UQpzW6BcQTHXDMUabdxscn/Kw1rmMZr139YwDFJwvpD4XtrxuYo7vXPV8wphGWSCK7+qvF/xGDkQCsouN4vqO5/8XOO7V5PiI1pjs43fvCJJps+qgn7EN5pQL6wjj893vbGhLG9a16Cvt5NY7T7VTYklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI94cj9ztE0f4qCaod7mxjpcX6zbzlaBI51xvSVvKu8=;
 b=LgvIfyaJc6D9za6F8Qd1fnwCuYXZYeuouqUBlpts2KdH59cWcTkTLLKPt5k9sAKXfFOBM/W37K0wQoHotbZV4YI4prr0kDGN3XFrdX9MY+/eHco8ZYbpBgXt0aazDFMuGX06EZrdkelMX/hwtYDOo62xJ0utsx3VpPYMhDjJbM7izkpKkjifS2pWUpXvchfghoH0mB2v6+f16/t1JRsr0MwXcQHJ6McgiCVeFlFUq53d0kjl63a2lL19gQJbEu/q+zWGDNIzLXaI4Z5t/a7WNIN2ur5ZCnSzeW02AzMtDUXC7FOSFrJegSyi3Vz4zksZ3Y6sHobN/MCKQOW00Fbhfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 04:53:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 04:53:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] meta/lib: move buildstats.py and rootfspostcommands.py into oe
Date: Tue,  3 Dec 2024 12:53:09 +0800
Message-Id: <20241203045309.3293310-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:404:a::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4783:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd562b8-1118-445b-e577-08dd13566b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?A0BdU9dLTEsdqwELpoS9bCSK6Qy/OGDo/Qy7TGaXgzISSYuNiACAPIg0xpaF?=
 =?us-ascii?Q?gPtQX5doeFwBbCDzctrVOOlH969NGm7PCOohC1LyluBUTnKdCks/U31oRZ9x?=
 =?us-ascii?Q?5lALy/BoaN0vJ1TpoPbJYRqjngInsO6yLvYkxaHEMVrHey4lJDXKkEuC31P3?=
 =?us-ascii?Q?UziEP+QcMQNhmfwNZJjaEnmSlDjQwlweATnpGcM3PyIIdnnS+R6jIFfGbHX5?=
 =?us-ascii?Q?VAxXibu+cYYp9dnVxryXorSxFSz8b++4ryiv4jiwpQCgNkBkr7NSbegoERRo?=
 =?us-ascii?Q?H8VTokxpywqEnHr3gm4Ic6FLhh9nx/WSz83K8PLx+ahOAbZbQra2VvKjYja1?=
 =?us-ascii?Q?Q4EJQ6wQFLunThy6TT4/zkUcYh/lIxMk2tgNkp3vvkhxvDpvzq8cGHmQshKx?=
 =?us-ascii?Q?LVcd4CQzRIgsdNmkNBXKgaR0AzJjgx5mVr5l5+8S9UhAhOGBhm+PQF9xgC3w?=
 =?us-ascii?Q?YTSU3uNWPvN14UYJZ9eJaIVULUGXkxsqsHk+0C3xDTz6/AXH5FEwD/sU/aBJ?=
 =?us-ascii?Q?O8YXcYW+mEO++AtXLnUa8nc9LzDiQ/0HG13ZkmBUNO3PqDgwsRa+s2OrzBVz?=
 =?us-ascii?Q?SDKFQLAX0r5J4SwSajNmyvuKIlGJulf/h6t0ZwRYKE9zzphFiSExL4I9xHQA?=
 =?us-ascii?Q?WR6GJcAE71MceRrhUV2FiaQhNPeXN22cqjXnPDNOqsc5j+jFeaQEAeEad4EV?=
 =?us-ascii?Q?thku55Ne0NC4xJUtteJITE2HAfVBCcRnBV9q4nJj5g4PqPMskLHP5gVTdMbz?=
 =?us-ascii?Q?g/MoMX6Wl8V8IauQBncOPbv8Ri03oAy9gtCwaFCY/M+wiuRXAUJVR7GmQNMm?=
 =?us-ascii?Q?CIAhtrQD1AoR+W0Q1b5HWNiGeluETwb7AmLOkUvOG5cJMOPf84SoOABYQ5Uw?=
 =?us-ascii?Q?+qsdNbLH3xYQKbhgIdQ1+3lUgbC1DSXeJ9smunNX7zesGeyzneOLujnkQKKH?=
 =?us-ascii?Q?mm4fopGfCcDCmG52U8pVqEUOflu032IPHCDG4tJYfFAHEidxvOK+Li9520+G?=
 =?us-ascii?Q?8lJth0Bfd74Gu9Dta1LzXKKUw7Nrd5xHr7GkhJwviq2xHOQ689c1sncMUfcr?=
 =?us-ascii?Q?yZnWFnneLzlsWvs4juVOtWeBoiWVRQf6zEiL4mqYUiMaPq5c1ifTX7y0RfOq?=
 =?us-ascii?Q?+dPAkR0aHWzEWXHhahhuXu9LDJXzcW46j6mnbUaeGynVtCdJ5nzTo+5cV8yp?=
 =?us-ascii?Q?GsA6ejhq3lEsEX1uo70yp9wyXLROQRRpdzGotCbj/ffEHan7fbv5s+Khlv7D?=
 =?us-ascii?Q?OPDYwZHHmmbp7BLOHthP23AQpfMwV6xS3dulr3gNTmEGi1vCc8bUolSMO07S?=
 =?us-ascii?Q?vq7PFG/QGY9i4edeYOUOnpJzeuCxeujQfYbF7MwWQHsvT5Q/oKdWoTp6m5EQ?=
 =?us-ascii?Q?tl9WQAONc6Ebyx6XDQ6H4WgpjQ/1Y3hed7Jwy0VkZ6s88mEzxQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J8Rh4Z1wPCb80TC4pM2VIc4nQ9XzsW8cl9Y1TQQ3rLeWuLE9HvgwHj0vJbnk?=
 =?us-ascii?Q?hr5RT0FHXUWbYdVkyxOaG52n5ANgROk7ZFvD4JZmAw8PHeJonk1NA2JXYkz4?=
 =?us-ascii?Q?VIKCX5wttNviIDnDQkAp4xZLBpvdgyAbzANMGocAmMBC+ZODeAyHnKvzc8IH?=
 =?us-ascii?Q?k32c80Px7/z5So6PWFXi+ajong+rbnwU6AatPJpjg+pqiYbl5++e7QJYLW+f?=
 =?us-ascii?Q?vmoWjUoNHnhGZsNH+MUSl76CMFO6ZTUjVYsTWXS1d4pg7UPBIVeswcmAFujj?=
 =?us-ascii?Q?B2YNLxqb1bDmAzCGxh+oX5Cu/fPCPNLRMhy3BM+M6mGTOsQwuWx65CWtuXP4?=
 =?us-ascii?Q?D2DEL6chni39IM7s2xt/ZuWYvGapNF8y1SZi6ElAVfE4oRaP0bkpc2eB4I+o?=
 =?us-ascii?Q?3d98Js6EYBn8MyiqgvgZje9FJhPjNvCSnmHk5wmT8REwJWKHml9p0Atwpi+M?=
 =?us-ascii?Q?h97B3UJCN55j8jUsGQiwM0gar2xNN33E/X9qxZyCrbm14TKnisAuPGjXHw9B?=
 =?us-ascii?Q?PBMoOR8NTymUaiQJb/IIhaNwcdrrGBm0bNd7ThEUwXuuuLc90fvQkhNvhIju?=
 =?us-ascii?Q?zbEYd4e8v/VZicVSTRrqoZr9U0YsAWScsUsBzJyCKOWEp702dMuGHk9j97xc?=
 =?us-ascii?Q?y57MOMNuRrd+n21bTbgxIT6seWZ7gCZawInn9K8P3ce0QludOgOTTOqIxmP/?=
 =?us-ascii?Q?JdwdbZrwgFroSS6q+kgyXdZ1+4Iu0RqAffDSOWREBZQqPDYSP8orzJDv/I0Z?=
 =?us-ascii?Q?5PnsHO/gbpCdCviNoSRFR8ZWXL2f3r7RkjFXIuhWvAWgNfs6OPPa6pUz6Svz?=
 =?us-ascii?Q?JIbRROaq2NAhsJiZrzQ4K5rMnizDXKAlxO74IHF+VizhCKQdU0NUg18UjL1c?=
 =?us-ascii?Q?lU2BUAjzfe/pl+ToVK82I6iV74mn7pWVHN+mqwcwHztGKhKkjPWITuHnc1zm?=
 =?us-ascii?Q?XpWVPWbo5uzee1Kf6aQbF1ZOraN7ISJ5wT31Ud64yiEMGXsC1ADC1TEmNX0T?=
 =?us-ascii?Q?Pga7sky/oc4E3XqamvhFVpYL6IGiApIZBR6mjhCe4kTK3DNJzMaxoN+0Ap1e?=
 =?us-ascii?Q?hvj1V0rT93gfecxYCVNURF9AYmnms4webkKxnUm1vHzbIpurTkgF8yD5sWpH?=
 =?us-ascii?Q?FHw4GKxU/McH7rXztt/M9HV0gKKJhu9RSMB65YRr1tdYZtGp2UBM+VTLlV9p?=
 =?us-ascii?Q?jViynNYp6F82OPLcR2ini/9x7bogp8f1tgQOl/ELrc3ur3mvT+90Si0uXBkl?=
 =?us-ascii?Q?2MEBbO30Y6mURKOyooeHCxdAhAm189+/3M5jtDL6a+RclJYVYWrIByRYhlKX?=
 =?us-ascii?Q?hn+YpOQHqtsERSnUnIOh49KWFeIarDHx0HzwYbsKUetF14pxfHutYDmsZpOT?=
 =?us-ascii?Q?kp6ypXfdoNp35SnKUnH7hio1Bc9eAcpEobnU0BtBeo/fClH2xlF/U3n71f6P?=
 =?us-ascii?Q?O7ZUv7DTIhJ9GCPOH8NXo/DOEcbeHn6tdzCXDYACqdCtqFq6rzrPOn5UTbjw?=
 =?us-ascii?Q?Copn6a++G28Spgq0sWxbuTHJA3nOU+hdu67fkJ8VOpC75IHy/Axg5B5N7kIV?=
 =?us-ascii?Q?7vjzUUKVoczlvoze+BVSJGHRaUMUrNLOKNFFcb4M?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd562b8-1118-445b-e577-08dd13566b0f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 04:53:24.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIs97paf43k29MfxycCbLKKfyHS7ilFGyBRzA3SKS5XPeL/SsHGKnnL8q2oKxbaG1rmku+/vjO8LW+VjEG86cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4783
X-Proofpoint-ORIG-GUID: v7ECmpX4Ct_r6kmb6N6v7zjyNSINhCLL
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=674e8ec6 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=UXqmzmZr725mQlld4dAA:9 a=lW7eM36Nki8unYNC:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: v7ECmpX4Ct_r6kmb6N6v7zjyNSINhCLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412030039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 04:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208178

From: Chen Qi <Qi.Chen@windriver.com>

These two files are the only ones that are left in meta/lib.
They logically belong to meta/lib/oe, so move them there.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/buildstats.bbclass          | 4 ++--
 meta/classes-recipe/rootfs-postcommands.bbclass | 8 ++++----
 meta/lib/{ => oe}/buildstats.py                 | 0
 meta/lib/{ => oe}/rootfspostcommands.py         | 0
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/lib/{ => oe}/buildstats.py (100%)
 rename meta/lib/{ => oe}/rootfspostcommands.py (100%)

diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global/buildstats.bbclass
index f49a67aa4f..8a50bede5f 100644
--- a/meta/classes-global/buildstats.bbclass
+++ b/meta/classes-global/buildstats.bbclass
@@ -276,7 +276,7 @@ addhandler run_buildstats
 run_buildstats[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.event.HeartbeatEvent bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
 
 python runqueue_stats () {
-    import buildstats
+    import oe.buildstats
     from bb import event, runqueue
     # We should not record any samples before the first task has started,
     # because that's the first activity shown in the process chart.
@@ -286,7 +286,7 @@ python runqueue_stats () {
     # closed when the build is done.
     system_stats = d.getVar('_buildstats_system_stats', False)
     if not system_stats and isinstance(e, (bb.runqueue.sceneQueueTaskStarted, bb.runqueue.runQueueTaskStarted)):
-        system_stats = buildstats.SystemStats(d)
+        system_stats = oe.buildstats.SystemStats(d)
         d.setVar('_buildstats_system_stats', system_stats)
     if system_stats:
         # Ensure that we sample at important events.
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 50e77dca76..70ad3670d7 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -308,19 +308,19 @@ serial_autologin_root () {
 }
 
 python tidy_shadowutils_files () {
-    import rootfspostcommands
-    rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
+    import oe.rootfspostcommands
+    oe.rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
 }
 
 python sort_passwd () {
     """
     Deprecated in the favour of tidy_shadowutils_files.
     """
-    import rootfspostcommands
+    import oe.rootfspostcommands
     bb.warn('[sort_passwd] You are using a deprecated function for '
         'SORT_PASSWD_POSTPROCESS_COMMAND. The default one is now called '
         '"tidy_shadowutils_files".')
-    rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
+    oe.rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
 }
 
 #
diff --git a/meta/lib/buildstats.py b/meta/lib/oe/buildstats.py
similarity index 100%
rename from meta/lib/buildstats.py
rename to meta/lib/oe/buildstats.py
diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/oe/rootfspostcommands.py
similarity index 100%
rename from meta/lib/rootfspostcommands.py
rename to meta/lib/oe/rootfspostcommands.py
-- 
2.34.1


