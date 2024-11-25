Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CDFD3B7EF
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 08:15:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14551.1732522503196681839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 00:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1059dd1ea8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP76maO031692;
	Mon, 25 Nov 2024 08:15:01 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4336189qve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 25 Nov 2024 08:15:01 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 25 Nov 2024 00:15:00 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 25 Nov 2024 00:15:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
Subject: [OE-core] [RR V3][0/3] SPDX 3.0: Reduce redundant spdxid-hash symlinks to save inode on host
Date: Mon, 25 Nov 2024 00:14:57 -0800
Message-ID: <20241125081500.4048680-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IUNyRcFKuw1mFLxlVVVy1Zd2TnFE0MVn
X-Proofpoint-GUID: IUNyRcFKuw1mFLxlVVVy1Zd2TnFE0MVn
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=67443205 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=24AZYWMyAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=y5aK6GwoVf6Qokk4b4oA:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-25_05,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411250069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 08:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207722

Summary: [OE-core] [RR V3][0/3] SPDX 3.0: Reduce redundant spdxid-hash symlinks to save inode on host

Changed in V2:
- Add link prefix and name to namespace of spdxId and alias, create one symlink for one jsonld file

Changed in v3:
- Rebase to fix conficlt with commit [lib/oe/sbom30: Prefix aliases with "http://spdx.org/spdxdocs/"] [1]

[1] https://github.com/openembedded/openembedded-core/commit/5e0ff36e025f5e842fa90b8219b53257d65ea66a

* Git logs
[oe-core]
commit 36b18e383a3feb9c15add223f0a065915d45f584
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sat Nov 9 17:16:31 2024 +0800

    oeqa/selftest: Add SPDX 3.0 include source cases for core_image_minimal build
    
    $ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source
    2024-11-09 09:17:54,600 - oe-selftest - INFO - Adding layer libraries:
    2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta/lib
    2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-yocto-bsp/lib
    2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-selftest/lib
    2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/meta-openembedded/meta-oe/lib
    2024-11-09 09:17:54,602 - oe-selftest - INFO - Checking base configuration is valid/parsable
    2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: "include selftest.inc" in path-to/build_spdx3-st/conf/local.conf
    2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
    2024-11-09 09:17:56,653 - oe-selftest - INFO - test_core_image_minimal_include_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
    2024-11-09 10:41:16,654 - oe-selftest - INFO - Keepalive message
    2024-11-09 11:37:53,091 - oe-selftest - INFO -  ... ok
    2024-11-09 11:55:18,638 - oe-selftest - INFO - ----------------------------------------------------------------------
    2024-11-09 11:55:18,638 - oe-selftest - INFO - Ran 1 test in 9442.187s
    2024-11-09 11:55:18,638 - oe-selftest - INFO - OK
    2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS:
    2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.test_core_image_minimal_include_source: PASSED (8396.65s)
    2024-11-09 11:55:35,490 - oe-selftest - INFO - SUMMARY:
    2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 9442.187s
    2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit d666b562d27d7f8166e032fa10c7e0f703eb14d5
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sat Nov 9 14:18:26 2024 +0800

    sbom30.py: reduce redundant spdxid symlinks to save inode on host
    
    In order to support all in-scope SPDX data within a single
    JSON-LD file for SPDX 3.0.1, Yocto's SBOM:
    - In native/target/nativesdk recipe, created spdxid-hash symlink
      for each element to point to the JSON-LD file that contains
      element details;
    - In image recipe, use spdxid-hash symlink to collect element
      details from varies of JSON-LD files
    
    While SPDX_INCLUDE_SOURCES = "1", it adds sources to JSON-LD file
    and create 2N+ spdxid-hash symlinks for N source files.
    (N for software_File, N for hasDeclaredLicense's Relationship)
    
    For large numbers of source files, adding an extra symlink -> real file
    will occupy one more inode (per file), which will need a slot in
    the OS's inode cache. In this situation, disk performance is slow
    and inode is used up quickly
    
    After commit [sbom30/spdx30: add link prefix and name to namespace
    of spdxId and alias] applied, the namespace of spdxId and alias in
    recipe and package jsonld differs. Use it to create symlink to jsonld,
    take recipe shadow, package shadow and package shadow-src for example:
    
    For recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json
    
        spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
        alias: http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH/...
        link-name: recipe-shadow
        symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/recipe-shadow.spdx.json -> ../recipes/shadow.spdx.json
    
    For package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.json
    
        spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
        alias: http://spdx.org/spdxdocs/openembedded-alias/package-shadow/UNIHASH/...
        link-name: package-shadow
        symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shadow.spdx.json -> ../packages/shadow.spdx.json
    
    In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.json
    
        spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
        alias: http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH/...
        link-name: package-shadow-src
        symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shadow-src.spdx.json -> ../packages/shadow-src.spdx.json
    
    Build core-image-minimal with/without this commit, comparing the spdxid-link
    number, 7 281 824 -> 6 043
    
    echo 'SPDX_INCLUDE_SOURCES = "1"' >> local.conf
    
    Without this commit:
    $ time bitbake core-image-minimal
    real    100m17.769s
    user    0m24.516s
    sys     0m4.334s
    
    $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
    7281824
    
    With this commit:
    $ time bitbake core-image-minimal
    real    85m12.994s
    user    0m20.423s
    sys     0m4.228s
    
    $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name "*.json" |wc -l
    6043
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 0523e946e618537edf13789c0a4e10741e59fb38
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sun Nov 24 21:44:07 2024 -0800

    sbom30/spdx30: add link prefix to the namespace of spdxId and alias
    
    In order to simple reference the SPDX ID to instead of making jsonld hash
    path for each element, only creating one symlink for one file and referencing
    it multiple times, add link prefix and name to the namespace of spdxId and alias
    to replace ${PN} to avoid namespace conflict between recipe, packages and images.
    
    Take recipe shadow, package shadow and package shadow-src for example:
    Without this commit, spdxId and alias in recipe and package jsonld have the same
    namespace
    
        spdxId: http://spdx.org/spdxdocs/shadow-xxx/...
        alias: http://spdx.org/spdxdocs/openembedded-alias/shadow/UNIHASH/...
    
    After apply this commit, the namespace of spdxId in recipe and package jsonld differs:
    In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json
    
        spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
        alias: http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH/...
    
    In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.json
    
        spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
        alias: http://spdx.org/spdxdocs/openembedded-alias/package-shadow/UNIHASH/...
    
    In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.json
    
        spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
        alias: http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH/...
    
    Then will use namespace of spdxId and alias to create link for jsonld file,
    one symlink for one jsonld file, referenced by elements multiple times
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>



====== Testing ======
* Commands

Build core-image-minimal with/without this commit, comparing the spdxid-link
number, 7 281 824 -> 6 043

echo 'SPDX_INCLUDE_SOURCES = "1"' >> local.conf

Without this commit:
$ time bitbake core-image-minimal
real    100m17.769s
user    0m24.516s
sys     0m4.334s

$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
7281824

With this commit:
$ time bitbake core-image-minimal
real    85m12.994s
user    0m20.423s
sys     0m4.228s

$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name "*.json" |wc -l
6043


$ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source
2024-11-20 03:29:24,850 - oe-selftest - INFO - Adding layer libraries:
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta/lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-yocto-bsp/lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-selftest/lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/meta-openembedded/meta-oe/lib
2024-11-20 03:29:24,868 - oe-selftest - INFO - Checking base configuration is valid/parsable
2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include selftest.inc" in path-to/build_spdx3-st/conf/local.conf
2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2024-11-20 03:29:27,317 - oe-selftest - INFO - test_core_image_minimal_include_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
2024-11-20 04:52:47,318 - oe-selftest - INFO - Keepalive message
2024-11-20 05:14:08,115 - oe-selftest - INFO -  ... ok
2024-11-20 05:21:12,798 - oe-selftest - INFO - ----------------------------------------------------------------------
2024-11-20 05:21:12,798 - oe-selftest - INFO - Ran 1 test in 6706.271s
2024-11-20 05:21:12,798 - oe-selftest - INFO - OK
2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS:
2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.test_core_image_minimal_include_source: PASSED (6280.82s)
2024-11-20 05:21:32,027 - oe-selftest - INFO - SUMMARY:
2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 6706.272s
2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)


* Expected Results
All successfully


