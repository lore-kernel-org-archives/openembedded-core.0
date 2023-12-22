Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F720C46CD8
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 07:32:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19109.1703230320857048664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 23:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MKCdE9ei;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0720462997=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BM5vOXj011092
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 23:32:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=OfacizuRU+diBJiUzRhNzE+zkwnVwbj6lLyqarRjDSs=; b=
	MKCdE9eiuWxdfnTmnk1Uuty88CcNSNZUg7Qb+diIwG/JznIr8pDUtQQ6Dz1hxTts
	LiZv6kK6B6MWvciRWkj74A6oQ1By7mgXkEoxmV42JS/R7f/oQsouk0BDoK/z95Px
	e0+ZROzln4DwkJj+0SLQ35CjLGGweLdxeQhAA2EucrbtZnFSZqUVCmzMEQ0cmoV+
	WOGoljeaOAS5H/AGW3ltHg/V+joyxWFxO+I4cKsra5gQKuVDAkSVus2N5HzqyC7E
	p4N9w279xnHFsEXSRcDZNQw79J6rYRb+TASCfDDsdoK8Nhe8l4cgNzcSegVKLUkY
	+rg264qJBQl2upocnugz4Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9kq7kc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 23:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGEMD9fpf1eoQrXVKJ5nUhdcvKO24nxdvWlYqq6oUhjC6T7zCQFG1bEYqOSGm+5i6fm5sXDiOKsSFTCvheX3V1Xx2bsGH/yue2Z+MQHLaSuRcA9/sZRkxOmWE10myc80D9Il/gOYU0lWSvwt9oeDzRFYcGfVYSkXbOGjHwKRjZ/hosiSwAiixSc1O9/nW5oRwkPRs6LAiF/lPNWuNa1y/Z76DT8Xd96Nyz1Wq63q3h9Ud7uWq+8Bzbx5lQ9GVNikHr0rQefwqzRzoNYtCBkyy4VMF7eIA+4kIKsFY8uZ28MP9m+1bWGVBFzSVENWaARKYEjzshNZ1NKoi2SktUowaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfacizuRU+diBJiUzRhNzE+zkwnVwbj6lLyqarRjDSs=;
 b=ZM76MpP9Do/8bUwZGAZeM00XKaS35s4PlSSHrIJkT/eSGwSd6TGrloBCnpTGLFKVBCNCcIsHHDcOCS0FJrW1TbvFfk46rjwpTyI+1RbPVXcqTPzalujbhwJVcWV0U1d3R+b6cEmzFmUxUXt9MrtCs9PxegCRI6qfFC9lb4syMmevqk1z+Jc1YoFxzDg6qKJzvio/hwEr0w7STEI/1kyQHXp+6menOFhPDiBxP1DCJ0M92zN2NXubt4LK1d8M0aY+jBYdz9z3BQtiKT9fZlKCRi5UraVX3+8OFR43BNh5/jkZ3OD8LIjiFz7rnOiaCPImYTqdYhvf/QEGKbebIISMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 07:31:58 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7%7]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 07:31:58 +0000
From: liezhi.yang@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/1] archiver.bbclass: Drop tarfile module to improve performance
Date: Thu, 21 Dec 2023 23:31:49 -0800
Message-ID: <c8789ebbf118dc635ca8ecb0f4a16c0f7b74c732.1703230207.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1703230207.git.liezhi.yang@windriver.com>
References: <cover.1703230207.git.liezhi.yang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::26) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|CH3PR11MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe9c282-be09-4b06-7ae0-08dc02c013e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dgYoPLGksymIa9GJD5x2zaV7PMcM6WAMXBonPjSkxnvOjD2Sr4WnnyPX0nBWe83BLIJt/dP0plXAGiZEpQF4oS02P0ZZkfcy15oQHGJiIocSjP0oL6FZAafm2IoDgPETBfXiq4fcWeICzcLydqswRZcyl+mQ9BcLt2NFkZKSOwk3HYQ76I7N87m8Z4p900KwNXKSadJRxMgfERqy7p9IarB/M3iPjNq4z5OuJBV+xT39O+6qCbl9nc10azrGLGzIYSTmoKl+CNv4cEOLUj7xxpuodXewKlXQQeVvBVFGknbk58GyBPKFNhOA+Gm92KMgyu0T9l7k5lWSvl2P8AuVZ13rrH20vUkN7oOImBil3jOeanEOvXJQW7p516wniUoN9Bj5Yj7r12L2E6OB5RIyXIpwx1pq9CP+XKk9qEbrDtw9s9zoE78foL9wYW1wj7dyxLo6F6eTal/vQvQVo52Szp+3ldygi7tuS9lVQ4X7KJhg8YLtIFgIUS3GlKJnuzGRIrU3RY+rSjcMeRz0remqq31tF22SeX0ppwZMNXft5RE64qQJ3bFyn/1NKBxg77nhjkB7gPw8K/+1Ab5+APbVFx+aExoiqMMy4GYjvQ14pA6rECjZLiexLRXYpsIggUiK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(346002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(83380400001)(38350700005)(41300700001)(86362001)(2616005)(26005)(36756003)(6512007)(9686003)(6666004)(6506007)(478600001)(52116002)(316002)(6486002)(66556008)(6916009)(66946007)(66476007)(8676002)(8936002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xI6JGucfkiN3jDncpi+NIHMZeujn3BYV56HGQ3G8eICqxB/jgj55KRL+lLJ3?=
 =?us-ascii?Q?NfgIKQHzUf/O7MpwJsVt5Nlkx+mdsl+1TOcH/s604+dX/QaHNHjx+HaEvias?=
 =?us-ascii?Q?7YxzzUoiloRTYx7lfaS9fZ6jiZ2+3xwPYsBKMPIZtVOzNlhwiPi6zngxOM9f?=
 =?us-ascii?Q?sDi9laoTL5HraWtuzWDi8HJtpNv2bDXFXVD1lAUv5XyfV0r35qY2XkwItfRV?=
 =?us-ascii?Q?2l2i4Sls8f+4KnzOL9pK4ji8KOv6WLCp2CnZdSLLLmwUwqbF13kf62J/BJJk?=
 =?us-ascii?Q?IBgZfe2gdrGc84GrxxNsmlIM/DaVlQj6XGH3fnvkSLEbDJAq9V9uIRfdRhpZ?=
 =?us-ascii?Q?2OXJ240jhbKMZDma3ypNVtFeagtYaTXI7NhSocy1DSorZejFHptjGtleZXue?=
 =?us-ascii?Q?S9EN96oX3v9I85BxsI6r5p0xdE9TKcbgD08k8qDEQoJHWQlb1F2LNJBeaLjZ?=
 =?us-ascii?Q?IDTOGiWE7+MpST/a/4ANwlCfYZ1vSOB15w5lXKZ9Xx8VZEntfJMdjPRvovEA?=
 =?us-ascii?Q?rtmbG3M8S3lhE1GbS1EuvRs1CFjs3VA09qllJl4ClUTC2+B2+V9SRYWs+mRg?=
 =?us-ascii?Q?zdUVrEYOqM9y6R5nUmhS6z1Ydj94RYb/Ouaq/1bpg6iMshWswg/f1DHmh2zf?=
 =?us-ascii?Q?SU4d4/zvQMH5qRpuLq+efo9/X1Dluq3NPxJFLaHMpOlnNaf4BFkfvbljNOiw?=
 =?us-ascii?Q?asPGUCiqtGjd+CqfQA3F12HdD4edxfKS90TXtKepqk0OIREk854CpAnCmTA8?=
 =?us-ascii?Q?+OXeaDINC3/Pq2NbcU7+wjJQFGsPatz0WusD5hPEmYYuilBz7/iOvawY1K1A?=
 =?us-ascii?Q?JTGyJywq4ss/TXaFqRrcZGfheu/dhzaEBbJoFTjbfxd0HZvxQU131WoUlpIU?=
 =?us-ascii?Q?EEKEMOONf+mxO5QHFbsZJCstl2RNfLZWbdLxak5Kh3upKinvAGu4iQnlaZND?=
 =?us-ascii?Q?OqrHXpFHMmgxsB9ZZHNmwEmsjjd+3GV6hNCMuk2fFu/V48c3L5RctHD1slNc?=
 =?us-ascii?Q?X0AjSaA8PnRInmXTBNUrC8doDUBDYfdq5ZFLKsnGKmqviKAPyXJv4tPmLpMq?=
 =?us-ascii?Q?8+LVU40CKxHPJlFwAivG1nYgvLqrDo61XT93mlt2kex3du50OwNc0LM0qRIs?=
 =?us-ascii?Q?O0VDmZOOGf/EwjSmNqrQnys4gSgJn1ywK/w3JckNGzzBFwDaAZjxRPiwgeHC?=
 =?us-ascii?Q?XAzpI4pJIlMkq8Bf+XrwCqwaYGrWf/OGBGtMKcLfqP07/CzPFDoA5tg1dr6H?=
 =?us-ascii?Q?0MEvcKC3SVyf17hU91DqGgI0GCeeho7ZI4lvjmDqz9sf3yVvRmKTOhSM1FdQ?=
 =?us-ascii?Q?zPtPRPXJmFdyYJz54S8yw15OUCWR/RbtC58fMXUADoAS6a9F9UKw8e5WglQq?=
 =?us-ascii?Q?NiiIOMixAPvQo0h8/ZuZzX0HYBklluJu74/RbX80PikBn4JGBeI2h8VGW9wR?=
 =?us-ascii?Q?TRD47TFkjw/pthirg5IFu+1GHTBYqUW+8JL0K0kxzuR0RAgGJ2jOh3CUEIqk?=
 =?us-ascii?Q?NeGGQBoBXZ/SwZ5J0XGwdY+Djy7S3gLFl1eAybowzMkkCQl1NoAGTatq6cEZ?=
 =?us-ascii?Q?NTapN8CBgcpDiyZxdPBvHlLZsjmCiuMeidVXFb0i7P4qMu9aKN8N8JJAos5Y?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe9c282-be09-4b06-7ae0-08dc02c013e1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 07:31:57.1979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOuTEnfAmJ9RiM/qHX/U7Oon02iBxpgjLNUXtp2FigvmDYv/+soHVSxu8msWs0zuyagRcG+ZS01/PqtbKKR9ABXUU/Th7xHcjcnzm3QdDWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
X-Proofpoint-GUID: ATL0qN6HJtuMBFZXffEB_NbB5HvIVjoC
X-Proofpoint-ORIG-GUID: ATL0qN6HJtuMBFZXffEB_NbB5HvIVjoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=904 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312220052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 07:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192864

From: Robert Yang <liezhi.yang@windriver.com>

* The tarfile module doesn't support xz options or environment varible
  XZ_DEFAULTS, this makes do_ar_patched incrediblely slow when the file is
  large, for example, chromium-x11 is about 3GB:
  - "bitbake chromium-x11 -car_patched" hasn't been done after 3 hours on my
     host, I checked the partial tar.xz file is only 1.5GB, so maybe more than 6
     hours is required to complete the task.

  - Now only less than 4 minutes is needed on the same host.

* Need add xz to HOSTTOOLS when archiver.bbclass is enabled and compression is xz.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 28 ++++++++++++++++------------
 meta/conf/bitbake.conf        |  3 +++
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 80a69cf31db..2d0bbfbd422 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -401,19 +401,11 @@ python do_ar_mirror() {
         subprocess.check_call(cmd, shell=True)
 }
 
-def exclude_useless_paths(tarinfo):
-    if tarinfo.isdir():
-        if tarinfo.name.endswith('/temp') or tarinfo.name.endswith('/patches') or tarinfo.name.endswith('/.pc'):
-            return None
-        elif tarinfo.name == 'temp' or tarinfo.name == 'patches' or tarinfo.name == '.pc':
-            return None
-    return tarinfo
-
 def create_tarball(d, srcdir, suffix, ar_outdir):
     """
     create the tarball from srcdir
     """
-    import tarfile
+    import subprocess
 
     # Make sure we are only creating a single tarball for gcc sources
     if (d.getVar('SRC_URI') == ""):
@@ -425,6 +417,16 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     srcdir = os.path.realpath(srcdir)
 
     compression_method = d.getVarFlag('ARCHIVER_MODE', 'compression')
+    if compression_method == "xz":
+        compression_cmd = "xz %s" % d.getVar('XZ_DEFAULTS')
+    # To keep compatibility with ARCHIVER_MODE[compression]
+    elif compression_method == "gz":
+        compression_cmd = "gzip"
+    elif compression_method == "bz2":
+        compression_cmd = "bzip2"
+    else:
+        bb.fatal("Unsupported compression_method: %s" % compression_method)
+
     bb.utils.mkdirhier(ar_outdir)
     if suffix:
         filename = '%s-%s.tar.%s' % (d.getVar('PF'), suffix, compression_method)
@@ -433,9 +435,11 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     tarname = os.path.join(ar_outdir, filename)
 
     bb.note('Creating %s' % tarname)
-    tar = tarfile.open(tarname, 'w:%s' % compression_method)
-    tar.add(srcdir, arcname=os.path.basename(srcdir), filter=exclude_useless_paths)
-    tar.close()
+    dirname = os.path.dirname(srcdir)
+    basename = os.path.basename(srcdir)
+    exclude = "--exclude=temp --exclude=patches --exclude='.pc'"
+    tar_cmd = "tar %s -cf - %s | %s > %s" % (exclude, basename, compression_cmd, tarname)
+    subprocess.check_call(tar_cmd, cwd=dirname, shell=True)
 
 # creating .diff.gz between source.orig and source
 def create_diff_gz(d, src_orig, src, ar_outdir):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 83b12cbc158..f838444af03 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -529,6 +529,9 @@ HOSTTOOLS += " \
 # Tools needed to run testimage runtime image testing
 HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
+# Used by archiver.bbclass when compression is xz
+HOSTTOOLS += "${@'xz' if (('archiver.bbclass' in (d.getVar('BBINCLUDED') or '')) and (d.getVarFlag('ARCHIVER_MODE', 'compression') == 'xz')) else ''}"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
-- 
2.42.0


