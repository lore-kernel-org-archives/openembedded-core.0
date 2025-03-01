Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373CFC021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 07:56:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5115.1740815760704778130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 23:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5155a5e946=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5217YEjR005867;
	Sat, 1 Mar 2025 07:55:56 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s7886hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 01 Mar 2025 07:55:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 28 Feb 2025 23:55:54 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 28 Feb 2025 23:55:53 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <jose.quaresma@foundries.io>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [RR][NULL][0/3] Upgrade go to 1.42.0
Date: Sat, 1 Mar 2025 15:55:49 +0800
Message-ID: <20250301075552.354661-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gyRh6HXKLlUXjKDZ01NaiaiU_IlpumQD
X-Proofpoint-ORIG-GUID: gyRh6HXKLlUXjKDZ01NaiaiU_IlpumQD
X-Authority-Analysis: v=2.4 cv=cfwormDM c=1 sm=1 tr=0 ts=67c2bd8b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=plf8rDjJAAAA:8 a=t7CeM3EgAAAA:8 a=vK9PrABJL9L2_Z0L1fYA:9 a=JWTSs7K9Rhv-lrTctFka:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_02,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503010060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 07:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212087

Summary: Upgrade go to 1.42.0

====== Comments (indicate scope for each "y" above) ======
* Conditions of submission

* Documentation Changes/Release Notes
  = Doc changes

  = Release notes

* Git logs
[poky]
commit 351a6f55cba8f43af2f1b54b49c8a05ccbe53d68
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sat Mar 1 10:45:10 2025 +0800

    go: remove support for GOROOT_FINAL
    
    After upstream go applied commit [cmd: remove support for
    GOROOT_FINAL][1], GOROOT_FINAL variable is dropped and use
    option -trimpath to instead [2]
    
    The option -trimpath has already been added to GOBUILDFLAGS
    in go.bbclass
    
    [1] https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98
    [2] https://github.com/golang/go/issues/62047
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit b25e6c9495f443cbdada6aea87ef4f0af741a6cd
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sat Mar 1 10:55:07 2025 +0800

    go: fix buildpath issue for go-runtime
    
    In upstream commit [cmd: remove support for GOROOT_FINAL][1], it clear
    GOROOT for func ld when -trimpath is used
    
    But it missed to do the same thing for share libarary linking which caused
    building go-runtime failed with buildpath issue
    
    |ERROR: go-runtime-1.23.4-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/
    linux_amd64_dynlink/libstd.so in package go-runtime contains reference to
    TMPDIR [buildpaths]
    
    This commit applied a patch to clear GOROOT for func ldShared when
    -trimpath is used and add option -trimpath to go-runtime build
    
    [1] https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98
    [2] https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98#diff-cab5921f94f2667bb0bc1b935d2d46b4c03541b4351b33438ab7290b94dea212R669
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 0eb236693eb209a893581eba8c863d4572b7bd80
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sat Feb 22 03:07:28 2025 -0800

    go: upgrade 1.22.12 -> 1.24.0
    
    Refresh patches
    
    See [1] for Go 1.24 Release Notes
    
    License-Update: update per Google Legal [2]
    
    [1] https://go.dev/doc/go1.24
    [2] https://github.com/golang/go/commit/760b722c344d312ab62a5c2f94865a869ce0bab9
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>



====== Testing ======
* Commands
$ bitbake go-binary-native go-cross-canadian-x86-64 go-cross-canadian-x86-64 go-runtime go

* Expected Results
Build successfully



