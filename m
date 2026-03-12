Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B74F106702C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22418.1773324605470782182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nyfOGHV/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAkDEt133876;
	Thu, 12 Mar 2026 14:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Huf+DVguEVvPRlTAVkjxR821nM8aCl78nAHfZVigdG0=; b=
	nyfOGHV/PAmlGhxUm3nSpDDsDkfbGGC1Ch4xnP6H0HlOP6Fw2rtCAK6nGHjOf2HL
	PEdPYaj0XTIlgZI5+eoNNdfA/AahunLrBUTFYE6MpT3yf9MQCgMRKulg8/i8zzRd
	P/uKjFdoqL+yaHC+DjX+LyAA//PXzRobMYSgLS+ZyjJKakiXw53/w++00jhRGXTa
	UcnY+tQ1rk+P82GikPA0hXoUT0t9YMLQHF5LucuLLYj+MMhnKx9PtAulEAU32KGW
	cfXwislA9e8UsDdR6B7eZr543UQSJwgiXwXfY+vpXzJw6Ppj3VSuchtd//MxESFS
	LiJGKYZdCAOoPjCrt4mUvQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqr9qb-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 14:09:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 07:09:40 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 07:09:40 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>
Subject: [PATCH v8 3/9] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Thu, 12 Mar 2026 07:09:33 -0700
Message-ID: <7215d34b053c1054dd711464aafc3fb6f148ddf1.1773324129.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1773324129.git.liezhi.yang@windriver.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jEZwWcrKDHFMIWaf2l1WnCqUWELiw6me
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfX439xvbl59AuQ
 +W9IimMSLLu31wcyVOvF3A0MJ8+F+oQ1RtW6Kbr09XY/GJc9LK3T2+jsAQJbQ4aw//b0DEjCefP
 eGhV5PGLfte5MiObJOkSd7Q2VqxZ/eDVOWWpiPz93Lv+9HWVE2HE91uYKB7M4XMWDYGUdYn8trF
 zUyKCkkpwQ2toQuG7ae6uETyro6k314T7K7ogfCurjnAH0V1Hvtc13BT66R0uTqcDS9Xoedu0lS
 laCkBJdCTTSU0ktI/DXgvh0kXMvXOcsL63S0wIeZiUKM1u9JgAA0Ka0cCUnPvFve3rmys2nQDVc
 KO3qDyPKTijHZK4A+/kLMhtO4i30AOdri37SSjc+ZF/QhYI/f6VaRYUeZI+qkl7WuWqZjc9j0CJ
 QhiBY0T3Wo/VNOecgmELN/VUglczOIwNVrsJVlaZ4sE7YBKmLF2aX1G1aq7xMJ91nb/tle0S1zv
 9/b0F8t58viFCXiKQzA==
X-Proofpoint-GUID: jEZwWcrKDHFMIWaf2l1WnCqUWELiw6me
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2c926 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=7IgoiE7PWGSXnmU5ZuwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232958

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
2.49.0


