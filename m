Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F919E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:23:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10828.1771417375871435383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WViNu08m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6509523d13=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9FlvI1377447
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=129aaVgZwuVWiHmeV3+ItxrOUGYGsks85u6wFyD2EyA=; b=WViNu08m11EZ
	7fPWPOjyQiNm7Gpc9kSLoocngBl7g7CbWCqLmCZFxc58DfnzoKayJM8bB7Ks1HqP
	IE6C60JQD6ZMfMt6BbZOOACGMskcwU9iTVk7hyo3pZegCAtd5RA/rcAaB0ltniqf
	BuKAGcM3JNwSw40hiA5W9JZRfZ7ArbActxyenDxc+ZC5o8lHIAVYkNJxRqiZL9zK
	20YIWkewB1ltIdU0a5IGweknsKWPE4KT+H6iHycL7eTA6Anjk5MZs5wk8SWKBEWq
	HNpDoZ+hWTYhacFLcYWIcuPx6O1R9wrr7jqccjGvAYWx0VdcshwrwBRvIrZpFSjt
	UejJn69wUA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ccbamt6sg-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:55 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 18 Feb 2026 04:22:53 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Feb 2026 04:22:53 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v6 3/7] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Wed, 18 Feb 2026 04:22:49 -0800
Message-ID: <b6ec0070d82234218139cf60aaef137d100c7cb4.1771409846.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1771409846.git.liezhi.yang@windriver.com>
References: <cover.1771409846.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SsCdKfO0 c=1 sm=1 tr=0 ts=6995af1f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=7IgoiE7PWGSXnmU5ZuwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwOSBTYWx0ZWRfX+TRH9aml6XHm
 UBF+SKbsK5zeBDSwgZUebVwLaHIOUcExr/PLvoASD2c5S35nXj/YmyQmMMJSm9eveNWAYjc8Wes
 LARwVrT0CQ/X4Cg4HftyD2pNsbvZXOaAERDZGmfghtSusd89BkDs0aRGGGBXew8rq5ZUX2yFwrd
 pHz4YpGWXM+4m5tub5UuqtnspTmtnFMm0IkM3iw28vg94qX+rhCwm1QP7Yn1ld3H5mnZ8e+lJg7
 ThJbkwxFth5Z+B5BXM7urliTUNw2/ml/GILOQYJ9zD+9Gc7+7On00oiz579v5ll0bPyBkNxa7xC
 1BHRaGbSBfs0T7B1ojnB2OsR/dILjhXDgf49x/x1XjUZl0vvIlwXKGXqJVui4iFE1jPV/7mjcpy
 Ps0vp3M7xobW0bTKw0v2Ifd0vUQXmU/QT/4GONpEcv3qwIg6WtxPUpoGAjn4U1HRBNgCjPPIsX0
 LP7bQR3rPLa2bdt4GSg==
X-Proofpoint-ORIG-GUID: uVgKxBTxyPtnanBIbpR35ozjtpvlq3to
X-Proofpoint-GUID: uVgKxBTxyPtnanBIbpR35ozjtpvlq3to
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602180109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 12:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231302

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.37.0-r0.x86_64_x32): execv(/bin/sh) pid 624
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 5 +++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 279cd567b3..d389a9f43b 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1824,7 +1824,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 21f2200d19..11a568f302 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -293,6 +293,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3f5fa37fba..d4e1e9e9bf 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -81,4 +81,9 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"
+
-- 
2.49.1


