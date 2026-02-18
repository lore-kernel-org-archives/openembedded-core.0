Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F3CE9A050
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:23:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10863.1771417375446028381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jHAjZh+l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6509523d13=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9FlvH1377447
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=JzopL/xJyHLVewOLl1/Hf3EuBNsrodrMsZMmftm5Flk=; b=jHAjZh+lI7AH
	/3jwPJWKRrYhgWLgWc3GUL/a6+AM0X5N965kSaUixhZuOr9r1J0mVsFewikasitq
	hYpYd6BhquZR6OkOLs65o1jMKiZDpjcQGiz5KtMDmRUOuIXo0cS9iGfSZHDFPLe9
	RwSytfueVZcgb9HjbN6XkKltoEYQUUCz62jYqpRfKN0lsFayCoT5X4k4Y5Hr5/H9
	Fym07qZ6/0nvDqINmXbRReGxfHWUN5OltrL8dbUftGV529GN9l5h5KNkXUg/9C90
	xGXeSPgeyd+j9zLTcguSsP/lO1erME2Em6+aaaWdse9eHtNQ8hglh7m3xSt31V2+
	7nDRM0XyeQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ccbamt6sg-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:54 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 18 Feb 2026 04:22:53 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Feb 2026 04:22:53 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v6 2/7] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Wed, 18 Feb 2026 04:22:48 -0800
Message-ID: <8a81798002ee363f4058b9c6f74a2a17c44080b7.1771409846.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1771409846.git.liezhi.yang@windriver.com>
References: <cover.1771409846.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SsCdKfO0 c=1 sm=1 tr=0 ts=6995af1f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=H-NycbhAXwVI0mX1kDIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwOSBTYWx0ZWRfX//EjvOj7zS9i
 LGtO8rZwLWPnGWAaja5v8Wy2jcGCnBvhGXHtuI4YmmozvfZlkqXT9pRoOQTU+GVWghqyOpL27pC
 Brs5PNLouBPImu3fNHKQjjUcTKWJZ4EItaXhhZaphkdhGKJEpjx1XFUes6ofOsJYRFNdXso2/Ck
 GpOcF6WC1m+FnyksIgOPapbS42cEPEYXseoW7E/qXg8ypTY7aQcREJ6+QENOfJCMBpIJMePDjQR
 a366ycuC/gv6uiSk7pXtgtsL3RMHz5DQt1DFfJmsyxLlkI2OcTF3itOyYqm3FqM/MXAoRoxsiYs
 nSQjdg05c2sq7Kz2BNKj1VmyLa4gdS55bPlpMOfgmiebCEmoDDcyY6ILQBalaPrfK3AI7NXWrTH
 tDVHJVjeb+JZ1ps6eTkpqpEkorz2d7j7ZDptIEpN9HezM+U/yLWco9BMSrBmwz1NBxCXHP7jNOX
 wdaSNDS8qGsb7RKLt0Q==
X-Proofpoint-ORIG-GUID: rhrz8RYHIFLwPTrSEJkWRf9Qx-31bxkR
X-Proofpoint-GUID: rhrz8RYHIFLwPTrSEJkWRf9Qx-31bxkR
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231300

From: Robert Yang <liezhi.yang@windriver.com>

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.1:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib, this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.1.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index bb3b8f830a..f4dd779a52 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -620,6 +620,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
-- 
2.49.1


