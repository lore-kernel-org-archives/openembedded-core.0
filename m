Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D09E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:56:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.78183.1734429393255082390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2081b295a1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH7VaHM018648
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 09:56:32 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43gy80k0w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 09:56:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 17 Dec 2024 01:56:31 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 17 Dec 2024 01:56:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] kern-tools-native: fix SyntaxWarning for RegEx calls on Python 3.12
Date: Tue, 17 Dec 2024 17:56:29 +0800
Message-ID: <20241217095629.1439411-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=I4ufRMgg c=1 sm=1 tr=0 ts=67614ad0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=8AHkEIZyAAAA:8 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=NX8aWspJnoVtvEPz7ucA:9 a=WsVes6SLYKcA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 0wBxGrtCVcQKjtYIaaHVF6Yy-KnjQ9d1
X-Proofpoint-ORIG-GUID: 0wBxGrtCVcQKjtYIaaHVF6Yy-KnjQ9d1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_05,2024-12-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412170081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 09:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208827

Python 3.12 emmits a SyntaxWarning when using unescaped
character inside a RegEx string.
'''
recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid escape sequence '\.'
  if re.match( ".*\.config", opt ):
recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid escape sequence '\w'
  x = re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid escape sequence '\s'
  if re.search( "^#\s*CONFIG_", option ):
'''

According to [1], use raw strings for regular expression

[1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-changes

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...yntaxWarning-for-RegEx-calls-on-Pyth.patch | 60 +++++++++++++++++++
 .../kern-tools/kern-tools-native_git.bb       |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch

diff --git a/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch b/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch
new file mode 100644
index 0000000000..e87067c8ac
--- /dev/null
+++ b/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch
@@ -0,0 +1,60 @@
+From 1f64368e4e82e47cd0e0dfe37b0e1b8958566d21 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 17 Dec 2024 01:25:29 -0800
+Subject: [PATCH] symbol_why: fix SyntaxWarning for RegEx calls on Python 3.12
+
+Python 3.12 emmits a SyntaxWarning when using unescaped
+character inside a RegEx string.
+'''
+recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid escape sequence '\.'
+  if re.match( ".*\.config", opt ):
+recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid escape sequence '\w'
+  x = re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
+recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid escape sequence '\s'
+  if re.search( "^#\s*CONFIG_", option ):
+'''
+
+According to [1], use raw strings for regular expression
+
+[1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-changes
+
+Upstream-Status: Submitted [linux-yocto@lists.yoctoproject.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tools/symbol_why.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/symbol_why.py b/tools/symbol_why.py
+index 326e84f..4864378 100755
+--- a/tools/symbol_why.py
++++ b/tools/symbol_why.py
+@@ -158,7 +158,7 @@ for opt in args.args:
+     elif re.match( "--ksrc=*", opt):
+         temp, ksrc = opt.split('=', 2)
+     else:
+-        if re.match( ".*\.config", opt ):
++        if re.match( r".*\.config", opt ):
+             dotconfig=opt
+         elif not ksrc:
+             ksrc=opt
+@@ -213,7 +213,7 @@ if not os.getenv("KERNELVERSION"):
+     hconfig = open( dotconfig )
+     for line in hconfig:
+         line = line.rstrip()
+-        x = re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
++        x = re.match( r"^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
+         if x:
+             os.environ["KERNELVERSION"] = x.group(1)
+             if verbose:
+@@ -492,7 +492,7 @@ def split_option( config_option_str ):
+         opt = m.group(1)
+         val = m.group(2)
+     except:
+-        if re.search( "^#\s*CONFIG_", option ):
++        if re.search( r"^#\s*CONFIG_", option ):
+             # print( "option is a is not set!!! %s" % option )
+             m = re.match(r"# (CONFIG_[^ ]+) is not set", option )
+             if m:
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 8eff00821a..7d11889eda 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -16,7 +16,9 @@ PV = "0.3+git"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master;protocol=https"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master;protocol=https \
+           file://0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch \
+"
 S = "${WORKDIR}/git"
 
 do_configure() {
-- 
2.34.1


