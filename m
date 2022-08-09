Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C644C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 11:47:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10889.1660045645281131639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 04:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aEZmZX7o;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52200c8468=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 279BRPV1014620
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Aug 2022 04:47:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=sqj8rcEskwAWdtsNeHbN+Pw0T/PE0WJFbeFuT5iyCek=;
 b=aEZmZX7oeVJspIuavDIm8cxlkRfV8wJJCuBZDp2A+y+VBccy5F6Nwo5jw+aJXvQtvkVZ
 Y2/LO0D+KBdljVV/rqo+ULGdZf/tqykhelZ6hMnbh/Bf/+f8GTsTRgQWi5QgCskTgPLz
 fBnTJ3vbFgzDWba0N3Dal+SR0+5w/mLlmS7Igmzpqeh4MEmRU/4miKfc8gyXiEtSO0E0
 5Bk70qZhZQIeo7S0ZHV5kPTaepmDp051BTWjf6l+5ffWzxT4au4vAobUGXUf2qIhCmvk
 dIrF00BHg2umuQGFN7bzLbkXWJO1S5Y8AFnkuFHWbP3QYQ8PMVnGRmE7S9bLxfTZXlTt Aw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hsqtka7p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 04:47:24 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Aug 2022 04:47:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 9 Aug 2022 04:47:23 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 9 Aug 2022 04:47:23 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] apt: fix nativesdk-apt build failure during the second time
 build
Date: Tue, 9 Aug 2022 19:47:22 +0800
Message-ID: <20220809114722.1842564-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: iGTQijeGb_KBRxbnEMmHZ0JvrH2HdOsO
X-Proofpoint-ORIG-GUID: iGTQijeGb_KBRxbnEMmHZ0JvrH2HdOsO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=701 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208090051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 11:47:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169147

From: Changqing Li <changqing.li@windriver.com>

Run following commands:
bitbake nativesdk-apt
bitbake nativesdk-apt -c install -f

The second command's do_install will fail with following error:
| /build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4=
.5-r0/recipe-sysroot-native/usr/bin/x86_64-wrlinuxsdk-linux/x86_64-wrlinuxs=
dk-linux-g++ -D_WITH_GETLINE=3D1 -Dapt_pkg_EXPORTS -I/build/tmp-glibc/work/=
x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4.5-r0/build/include -I/b=
uild/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4.5-r=
0/build/include/apt-pkg --sysroot=3D/build/tmp-glibc/work/x86_64-nativesdk-=
wrlinuxsdk-linux/nativesdk-apt/2.4.5-r0/recipe-sysroot  -O2 -pipe -fmacro-p=
refix-map=3D/build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/natives=
dk-apt/2.4.5-r0=3D/usr/src/debug/nativesdk-apt/2.4.5-r0                    =
  -fdebug-prefix-map=3D/build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-li=
nux/nativesdk-apt/2.4.5-r0=3D/usr/src/debug/nativesdk-apt/2.4.5-r0         =
             -fdebug-prefix-map=3D/build/tmp-glibc/work/x86_64-nativesdk-wr=
linuxsdk-linux/nativesdk-apt/2.4.5-r0/recipe-sysroot=3D                    =
  -fdebug-prefix-map=3D/build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-li=
nux/nativesdk-apt/2.4.5-r0/recipe-sysroot-native=3D  -fPIC -fvisibility=3Dh=
idden -fvisibility-inlines-hidden -Wall -Wextra -Wcast-align -Wlogical-op -=
Wredundant-decls -Wmissing-declarations -Wunsafe-loop-optimizations -Wctor-=
dtor-privacy -Wdisabled-optimization -Winit-self -Wmissing-include-dirs -Wn=
oexcept -Wsign-promo -Wundef -Wdouble-promotion -Wsuggest-override -Werror=
=3Dsuggest-override -Werror=3Dreturn-type -std=3Dgnu++17 -MD -MT apt-pkg/CM=
akeFiles/apt-pkg.dir/tagfile-keys.cc.o -MF apt-pkg/CMakeFiles/apt-pkg.dir/t=
agfile-keys.cc.o.d -o apt-pkg/CMakeFiles/apt-pkg.dir/tagfile-keys.cc.o -c /=
build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4.5-=
r0/build/apt-pkg/tagfile-keys.cc
| /build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4=
.5-r0/build/apt-pkg/tagfile-keys.cc:1:10: fatal error: /include/apt-pkg/tag=
file-keys.h: No such file or directory
|     1 | #include "/include/apt-pkg/tagfile-keys.h"
0/build/tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-apt/2.4.=
5-r0/build/apt-pkg/tagfile-keys.cc

During the first command, do_install task changed tagfile-keys.cc, this
will make tagfile-keys.cc is newer than the built tagfile-keys.cc.o. So the=
 second
do_install will rebuild tagfile-keys.cc.o. But the header path is
replaced wrongly, so fix the header path

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools=
/apt/apt_2.4.5.bb
index 1d94dd118c..53849f80a3 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -138,5 +138,5 @@ do_install:append:class-target() {
=20
 do_install:append() {
 	# Avoid non-reproducible -src package
-	sed -i -e "s,${B},,g" ${B}/apt-pkg/tagfile-keys.cc
+	sed -i -e "s,${B}/include/,,g" ${B}/apt-pkg/tagfile-keys.cc
 }
--=20
2.25.1


