Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129A6FEA830
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:49:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17463.1774424979946992382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WqoH16mr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7544e4345f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4SxTt324512
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:49:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=3WwQj3Io4IcmvyioK5se
	t5SpRDYS7tk9Cve1VPAEXHE=; b=WqoH16mr5injAbLwKLmtkT0LjIDdIdDFuRGl
	4Mof2pigN8QsbG0PblKIByzNrWDtAiqVz8i8iq3WVybPLZby2tRG84L95vgCzsIC
	rg2nIPb9xu5kru8aMjNyBwcc5HfUCCrKWVPIJ/0Ux0SWhqI2Ug3gBJulk52ePI0m
	pmDmfEWi0xR/NdPt4haO7QlZVRzOOxhHC60r8Wt0j4pXIub3r7HKK6qtUt5npNVA
	0ewwxik0aW1o/L2HqVFzRvxhRumqVKWLsr8rPid9NukpqMtrX9ZVXvm7aD3nxyoj
	dE99/uKMgb4G8CzCKzfOlXbe6aJzFTa8Fv2B+hMTuBDrABw+kQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucvawe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:49:39 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 25 Mar 2026 00:49:38 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 25 Mar 2026 00:49:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gobject-introspection: disable cache for g-ir-scanner
Date: Wed, 25 Mar 2026 15:49:37 +0800
Message-ID: <20260325074937.2568123-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SfQaNcLpScsNQtxlp6hcPa2etEisv4a_
X-Proofpoint-ORIG-GUID: SfQaNcLpScsNQtxlp6hcPa2etEisv4a_
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c39393 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=2GYCqRxHw7iNxOvvrdEA:9 a=O8hF6Hzn-FEA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1NCBTYWx0ZWRfX1ZhDcUz0dOUu
 ceUCdX11oN218SUy8cgAm+gf/067ch859qKB6EhPa8L6uBdOiVIhsMo24Jp8qTTcW6bZWQeK3sm
 8L8JMrlkKXVYz7kgDM2Y8p92tUtUlO69AXg9KpoymNY6KkoojCWCJKTxcBNz4dBHVaLsSk0mkch
 JvpY2JuvRPPfWk6HWZSD+0zxOVTIF3ZxxF1U59GIVqi4fdZR9B8knwbuOkEmq5C07yIcBkrsz9E
 E7kGkKOZsi571troSZ1BFNs6eKZdQPtONKN5qKVKjZJsO5PkwUKrcNFklTeQmJ/ClAQOvX2skyh
 FKZ4temS0iOOXlkXIYWOjOgQBOMhilocy3dqBqCEDZC6HsQlODEmSF5FbWY9JRAx4gTDr/T3zj2
 L18LEZHt5UzciKWrpOLTBkGYViCF8V74kFGlpkgkf2WaxH7r0UVZEIIT8YQG07LsYD3V/wO6BAD
 KLowtPlHj6NJKE4jF8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233864

An intermittent failure occurs in gobject-introspection do_compile:
[snip]
|Traceback (most recent call last):
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/python3.14/shutil.py", line 918, in move
|    os.rename(src, real_dst)
|    ~~~~~~~~~^^^^^^^^^^^^^^^
|OSError: [Errno 18] Invalid cross-device link: '/tmp/g-ir-scanner-cache-version-89xkkvp4' -> '/folk/hjia/.cache/g-ir-scanner/.cache-version'
|
|During handling of the above exception, another exception occurred:
|
|Traceback (most recent call last):
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/bin/g-ir-scanner", line 134, in <module>
|    sys.exit(scanner_main(args))
|             ~~~~~~~~~~~~^^^^^^
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/scannermain.py", line 653, in scanner_main
|    transformer = create_transformer(namespace, options)
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/scannermain.py", line 446, in create_transformer
|    transformer = Transformer(namespace,
|                              accept_unprefixed=options.accept_unprefixed,
|                              identifier_filter_cmd=identifier_filter_cmd,
|                              symbol_filter_cmd=symbol_filter_cmd)
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 49, in __init__
|    self._cachestore = CacheStore()
|                       ~~~~~~~~~~^^
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/cachestore.py", line 52, in __init__
|    self._check_cache_version()
|    ~~~~~~~~~~~~~~~~~~~~~~~~~^^
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/cachestore.py", line 89, in _check_cache_version
|    shutil.move(tmp_filename, version)
|    ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/python3.14/shutil.py", line 938, in move
|    copy_function(src, real_dst)
|    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/python3.14/shutil.py", line 529, in copy2
|    copyfile(src, dst, follow_symlinks=follow_symlinks)
|    ~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|  File "tmp/work/cortexa57-wrs-linux/gobject-introspection/1.86.0/recipe-sysroot-native/usr/lib/python3.14/shutil.py", line 315, in copyfile
|    with open(dst, 'wb') as fdst:
|         ~~~~^^^^^^^^^^^
|OSError: [Errno 122] Disk quota exceeded
[snip]

In commit [1], it moved the fix to gobject-introspection-data.bbclass, and recipe gobject-introspection
inherits gobject-introspection-data.bbclass.

But commit [2] moved the fix to gobject-introspection.bbclass which recipe gobject-introspection
does not inherits it

Explicitly add the fix back to recipe gobject-introspection

[1] https://git.openembedded.org/openembedded-core/commit/?id=35d5f707f6bb2ce5e9ab908e66e1ea9eeac754b1
[2] https://git.openembedded.org/openembedded-core/commit/?id=49988a49f7c9a19aa2a547d49369996e3e20d452

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../gobject-introspection/gobject-introspection_1.86.0.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
index f8eab2797f..506ed99076 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
@@ -114,6 +114,8 @@ EOF
 do_compile:prepend() {
         # Needed to run g-ir unit tests, which won't be able to find the built libraries otherwise
         export GIR_EXTRA_LIBS_PATH=$B/.libs
+        # This prevents g-ir-scanner from writing cache data to $HOME
+        export GI_SCANNER_DISABLE_CACHE=1
 }
 
 do_install:prepend() {
-- 
2.34.1


