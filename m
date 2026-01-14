Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663F5D31A0E
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 06:44:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4941.1768373047563898883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 22:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P1MqM8sz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5474771f1a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DI9ORI1629137;
	Wed, 14 Jan 2026 06:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zqvWrGqHJnKwNILyJ4ZF
	HZvRnvbCoZON2lJRrOuM8Ag=; b=P1MqM8szUdaCDJvaZwxMJF9uNuNxJiuhGl8F
	UAbUoTVUt2NIAW1viu+yZqUbay8NOwiwXMzZOa4uvv6fNyPgmAs4FgYW31OL6XId
	lonycoF1eAIwOhXYCzWNvz6/MgfjYliv3bRazhLCoHL/r9FyyMXCxbVJv1UBdmbt
	K+cDCSUnlcVS8QnTA0HGey/jsM1KBE3PXv2c68YAy9iNe3ZVHEQa0HSpobCA2GON
	Xj52LJBANm/WVCdDPYhkkQAE+ga0H5Yi0rM3JTltAguKAjNxl8LjBQ2RyBV856Lv
	4E7bodjt4nyTcGK7GbR6EkB9n30oWgS6LI83jK1CwcyZq2lKVg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2m3gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 14 Jan 2026 06:44:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 13 Jan 2026 22:44:02 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 13 Jan 2026 22:44:01 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>,
        <richard.purdie@linuxfoundation.org>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH V4] go.bbclass: set buildid to empty string to improve reproducibility
Date: Wed, 14 Jan 2026 14:44:00 +0800
Message-ID: <20260114064400.4070617-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: j27DG2agzglRuBON8LAd7qGkY21WxwBp
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=69673b33 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=UGXAvUmdAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=biSirK55LH2f843hcx4A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: j27DG2agzglRuBON8LAd7qGkY21WxwBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1MCBTYWx0ZWRfXwLEk0anPGw4U
 5DxPKDnoBMIvJj65qISRxsj3WQxIdi/MZ0sFNexEZOWVwTHHuJjjxTduLLY3+/UONDRFIDpT0NT
 C82BZQ9D1lrvtY6kAvG6Y3zY1onxAbNqQQw4TW6ADoXKNH561YyiJTWLlqJk0QBbiSrEaPHCPs8
 sD/Hjq9NxGvDxjr1P9bjF9Gh13AqgWJ02YqaMC9DkInF6qGoYFw40boSS2OwJHPPNbIBSKD9xvY
 5aDlLWp+umYTxWKavMYfzZxyW8HA1Pw+eXSt5lAMNZXUzjPv4luZMFLz34PqMxhRPTuodvBGNfQ
 AdbQrcogZBfNs6+8wt1A83HMoQphnpLIYeMkbVcCTdZZzjscJ5aEQ6WCS6DkKaQZxwMM2fyeA4q
 FwCLPYAluEOwH0kXmNgDQmKW2gCdLC5b6YqDM29KVHmYdYrhuABWgvc/LD/vUstFF9nq+lI+JbL
 xvVdTmlsDNhPiEdzeFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229303

From: Changqing Li <changqing.li@windriver.com>

Go packages and binaries are stamped with build IDs that record both the
action ID, which is a hash of the inputs to the action that produced the
packages or binary, and the content ID, which is a hash of the action
output, namely the archive or binary itself, Refer [1].

And action ID include hash of modroot, which will include build path,
so this make go package not reproducible.
Refer [2], keying off module path instead of module root directory is a TODO.

[snip of log]
HASH[moduleIndex]: "go1.25.3"
HASH[moduleIndex]: "modroot /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n"
HASH[moduleIndex]: "package go1.25.3 go index v2 /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/buildid\n"
HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC 1704\n"
HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
HASH[moduleIndex]: 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b

Report this issue to upstream, refer [3]
Workaround the reproducible by setting buildid to empty, refer [4]

Refer:
[1] https://github.com/golang/go/blob/master/src/cmd/go/internal/work/buildid.go#L26
[2] https://github.com/golang/go/blob/master/src/cmd/go/internal/modindex/read.go#L70
[3] https://github.com/golang/go/issues/77086
[4] https://github.com/golang/go/issues/34186

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-recipe/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index b540471ba2..1c43b36fc0 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -51,11 +51,12 @@ GO_RPATH:class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
 GO_RPATH_LINK:class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LINKMODE ?= ""
+GO_BUILDID ?= "-buildid="
 GO_EXTRA_LDFLAGS ?= ""
 GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
 # Use system loader. If uninative is used, the uninative loader will be patched automatically
 GO_LINUXLOADER:class-native = ""
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} ${GO_BUILDID} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-- 
2.34.1


