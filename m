Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5085C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:35:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1264.1668792929021986083
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RUIgi/3j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=832133cac8=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIHHgde008097
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=w7priCH94iQyL9jRgxD/YCXsA3Kyib4IYflkvpGLR3o=;
 b=RUIgi/3jBEPUnMQ/X+5INrKfUja+R95mpqm/1X9BJtz787ZpJfazkLghyfdtSHl3gtNx
 qkixPeaLmpbSEnD9zQ3SyFa9PUc9yh3bNhTPh6g723+GikzciCkygjACVHUrxAXoXQiH
 Y4PO8hTSsvxQ17PTasKixcXMQ5ag3xC3SaurkxezwRx4Oy83BXJ5OyWhmoG7v37q3MGl
 34rT+HF82wQ+oDng1ODogV4iRQhNtDEIo30+PSSm2qR5Fls43Z6VeBwnTCdJu06IYrRO
 M48Pbczx2zwc1lSGp5gyDgXE9NGoY0yoLBPITKSlzJjPaO7KgtUN4lTBQ/vRGyuPVmLS XQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kx0nw8kry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:35:27 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 18 Nov 2022 09:35:26 -0800
Received: from ala-lpggp5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Fri, 18 Nov 2022 09:35:26 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] python3: Fix CVE-2022-37460
Date: Fri, 18 Nov 2022 09:35:26 -0800
Message-ID: <20221118173526.40333-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XPYJfqQkufHUI88hWyDSeraBJH5jzSLZ
X-Proofpoint-ORIG-GUID: XPYJfqQkufHUI88hWyDSeraBJH5jzSLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_05,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173480

Apply patch created after the release of 3.11.0.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../python/python3/cve-2022-37460.patch       | 95 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.0.bb |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/cve-2022-37460.patch

diff --git a/meta/recipes-devtools/python/python3/cve-2022-37460.patch b/meta/recipes-devtools/python/python3/cve-2022-37460.patch
new file mode 100644
index 0000000000..12177684fd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/cve-2022-37460.patch
@@ -0,0 +1,95 @@
+From 94582bb643f98bc58b1ff206d1d2a56f97c3a7e5 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 28 Sep 2022 16:46:11 -0700
+Subject: [PATCH] gh-97612: Fix shell injection in get-remote-certificate.py
+ (GH-97613)
+
+Fix a shell code injection vulnerability in the
+get-remote-certificate.py example script. The script no longer uses a
+shell to run "openssl" commands. Issue reported and initial fix by
+Caleb Shortt.
+
+Remove the Windows code path to send "quit" on stdin to the "openssl
+s_client" command: use DEVNULL on all platforms instead.
+
+Co-authored-by: Caleb Shortt <caleb@rgauge.com>
+(cherry picked from commit 83a0f44ffd8b398673ae56c310cf5768d359c341)
+
+Co-authored-by: Victor Stinner <vstinner@python.org>
+---
+CVE: CVE-2022-37460
+
+Upstream-Status: Backport [https://github.com/python/cpython.git]
+                          [commit 94582bb643... unmodified]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ ...2-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst |  3 +++
+ Tools/scripts/get-remote-certificate.py       | 25 ++++++-------------
+ 2 files changed, 10 insertions(+), 18 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2022-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst
+
+diff --git a/Misc/NEWS.d/next/Security/2022-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst b/Misc/NEWS.d/next/Security/2022-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst
+new file mode 100644
+index 0000000000..2f113492d4
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2022-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst
+@@ -0,0 +1,3 @@
++Fix a shell code injection vulnerability in the ``get-remote-certificate.py``
++example script. The script no longer uses a shell to run ``openssl`` commands.
++Issue reported and initial fix by Caleb Shortt. Patch by Victor Stinner.
+diff --git a/Tools/scripts/get-remote-certificate.py b/Tools/scripts/get-remote-certificate.py
+index 38901286e1..68272fca83 100755
+--- a/Tools/scripts/get-remote-certificate.py
++++ b/Tools/scripts/get-remote-certificate.py
+@@ -15,8 +15,8 @@
+ def fetch_server_certificate (host, port):
+ 
+     def subproc(cmd):
+-        from subprocess import Popen, PIPE, STDOUT
+-        proc = Popen(cmd, stdout=PIPE, stderr=STDOUT, shell=True)
++        from subprocess import Popen, PIPE, STDOUT, DEVNULL
++        proc = Popen(cmd, stdout=PIPE, stderr=STDOUT, stdin=DEVNULL)
+         status = proc.wait()
+         output = proc.stdout.read()
+         return status, output
+@@ -33,8 +33,8 @@ def strip_to_x509_cert(certfile_contents, outfile=None):
+                 fp.write(m.group(1) + b"\n")
+             try:
+                 tn2 = (outfile or tempfile.mktemp())
+-                status, output = subproc(r'openssl x509 -in "%s" -out "%s"' %
+-                                         (tn, tn2))
++                cmd = ['openssl', 'x509', '-in', tn, '-out', tn2]
++                status, output = subproc(cmd)
+                 if status != 0:
+                     raise RuntimeError('OpenSSL x509 failed with status %s and '
+                                        'output: %r' % (status, output))
+@@ -45,20 +45,9 @@ def strip_to_x509_cert(certfile_contents, outfile=None):
+             finally:
+                 os.unlink(tn)
+ 
+-    if sys.platform.startswith("win"):
+-        tfile = tempfile.mktemp()
+-        with open(tfile, "w") as fp:
+-            fp.write("quit\n")
+-        try:
+-            status, output = subproc(
+-                'openssl s_client -connect "%s:%s" -showcerts < "%s"' %
+-                (host, port, tfile))
+-        finally:
+-            os.unlink(tfile)
+-    else:
+-        status, output = subproc(
+-            'openssl s_client -connect "%s:%s" -showcerts < /dev/null' %
+-            (host, port))
++    cmd = ['openssl', 's_client', '-connect', '%s:%s' % (host, port), '-showcerts']
++    status, output = subproc(cmd)
++
+     if status != 0:
+         raise RuntimeError('OpenSSL connect failed with status %s and '
+                            'output: %r' % (status, output))
+-- 
+2.38.1
+
diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
index 92a1f69320..93628c76ff 100644
--- a/meta/recipes-devtools/python/python3_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3_3.11.0.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
+           file://cve-2022-37460.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.38.1


