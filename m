Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FE9CF8847
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 11:40:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32280.1763638844036923199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 03:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pQmWUL8H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3419e170cb=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK6aS3P3721328
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 03:40:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=PPWPP8hE6URi9EN/kRz8
	V1ZTvl5cXLBVcEAk4uCfWXI=; b=pQmWUL8HrAmhRmnlB6BgMve7kAxt15LqsBgc
	Wr1usx9VgDVYV0aniymS897m449a0JBM+BT1KFLtgYH1sSHNyC/h4pKx8tkfxzbp
	kuGG6mHOa9bSKCOXEuORGlqw8U9gwmw/0LOF8eJlMu+m4hp5Qr/O4NeV8QNnx/NK
	pLIQB9CsTuu/yweZ1NYDqgdzKR7Dw7pl4Pqy2A6DM4aJZ5DlfMim5SqIpAtCQ+E8
	QCOISYt0QYTWJ2cZ0vBJiZeI/dHbcuc+AgCUATQQdqkQc7MHUZTNW0Us9j8VvV7J
	tdBdDBkN+PzMzcz9NX8pxeTbEFDNaa2nyU+ZLJp1RkZ+mGwFxw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswje4rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 03:40:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 20 Nov 2025 03:40:42 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 20 Nov 2025 03:40:42 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake.conf: add new variable FIXED_SOURCE_DATE_EPOCH
Date: Thu, 20 Nov 2025 19:40:41 +0800
Message-ID: <20251120114041.193806-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691efe3b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=JQSNpBNHAAAA:8 a=t7CeM3EgAAAA:8
 a=6ZXuvi-LJkF483BbeEwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZKWIBMmYmmn__vDP1tk7Pfsi0pQzrEn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA3MyBTYWx0ZWRfXzyDNO6fD2k0o
 AOcrbjDrlRGimzX6HO4XpjVpsGtrVbzjfomEP5OvB7GRwgpIBo4ghrRzUrPSEN2rYV/+dmWb2m9
 hTPyhrhnB9yZrniGlCa1KQ6umpuPnYvJ11t8iGI3q6qpep1vrljTTT6tQLPZETr3Hs91jhR2ort
 NAC4GncEcToaddt+y0zBR7nSh9sDFX8nYvXoVc3otxoFPHkjNXMAlGQWQw2+1nFigRTwUmJvujq
 80InBGepeC9l3C7AKYK4Eh4O17WF7xYOBY355I/GwmGO7ZItGXJTaLUFVlSFfduhagd4QE8Q98y
 nudHvtJmJ4ErlAlung9HrAp9XQ9BhrSrFQfYJXwMIhrKNlcb0NlSvb0yfiG0IMl3D29cuAZK+q/
 8IGX3/tPXCCDRpEpmjtKxbBhzKucgA==
X-Proofpoint-ORIG-GUID: ZKWIBMmYmmn__vDP1tk7Pfsi0pQzrEn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 11:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226614

From: Changqing Li <changqing.li@windriver.com>

Here is SRC_URI of jquery:
SRC_URI = "\
    https://code.jquery.com/${BP}.js;name=js;subdir=${BP} \
    https://code.jquery.com/${BP}.min.js;name=min;subdir=${BP} \
    https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
    "
When ${BP}.js/${BP}.min.js/${BP}.min.map are downloaded in a git repo,
and this git repo is cloned locally as a PREMIRRORS. In this case, mtime
of these files will be current time when checking out. For this recipe,
source_date_epoch will get by function
get_source_date_epoch_from_youngest_file, mtime of
${BP}.js/${BP}.min.js/${BP}.min.map are not stable, so cause the
generated package not reproducible.

A new variable FIXED_SOURCE_DATE_EPOCH is added to support this case.
By default, FIXED_SOURCE_DATE_EPOCH is 0,  and source_date_epoch works
as before. If user build in above case, FIXED_SOURCE_DATE_EPOCH set to 1
in recipe jquery can ensure fixed source date epoch used by this recipe
to support reproducible build.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/bitbake.conf      |  1 +
 meta/lib/oe/reproducible.py | 13 ++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5406e542db..2371567da3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -680,6 +680,7 @@ export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
 SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
+FIXED_SOURCE_DATE_EPOCH ?= "0"
 
 ##################################################################
 # Settings used by bitbake-layers.
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 0270024a83..8ed5e2b458 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -158,11 +158,14 @@ def fixed_source_date_epoch(d):
     return 0
 
 def get_source_date_epoch(d, sourcedir):
-    return (
-        get_source_date_epoch_from_git(d, sourcedir) or
-        get_source_date_epoch_from_youngest_file(d, sourcedir) or
-        fixed_source_date_epoch(d)       # Last resort
-    )
+    if d.getVar('FIXED_SOURCE_DATE_EPOCH') == '0':
+        return (
+            get_source_date_epoch_from_git(d, sourcedir) or
+            get_source_date_epoch_from_youngest_file(d, sourcedir) or
+            fixed_source_date_epoch(d)       # Last resort
+        )
+    else:
+        return fixed_source_date_epoch(d)
 
 def epochfile_read(epochfile, d):
     cached, efile = d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, None)
-- 
2.34.1


