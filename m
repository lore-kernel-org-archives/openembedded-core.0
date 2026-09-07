Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B53C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:29:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30521.1788770502592647711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 01:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fVaBCF/K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37101daba7=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68778gol3549577;
	Mon, 7 Sep 2026 01:08:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=eLtmLx0JUkNI/prF0gAb1WMEg0RJxOytZtY4AbKGgCU=; b=
	fVaBCF/K3SSw6mIiyV+lrnCxS9sY1GaYH2p+K+NcTKPPAaq1r33zkSyDZ/sFj4od
	cYdBa0EECCSnGzjzI02L5d0pnSWiXJiLndZeM6CKsqzzcnmpqmSXb9Etjwtth4PC
	oo3cEUNSP1faC1rcPFnOXrCevwotldgrlqgeQcl1+0II+BcW3tina4IWRsxKd8Kn
	yc8r4HugyDG2ABYpqJtP9EiTsT3CkcfsrG2TvGgGjCoU8VOtRfFrTrZZqLUCJVDi
	ZPkqaBl6XX2GY2V8gYC8IhmovFWyR1T2jRWnvP4REf2FB2tAysJJssOnO7YlnkMQ
	i0ZH+oQNfo+fgX/sm18yBA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ggec0sxwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 07 Sep 2026 01:08:44 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 7 Sep 2026 01:08:43 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 7 Sep 2026 01:08:43 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <ross.burton@arm.com>,
        <jose.quaresma@oss.qualcomm.com>, <raj.khem@gmail.com>,
        <richard.purdie@linuxfoundation.org>, <Shiva.Komati@windriver.com>,
        "Himani
 Ramesh Barde" <HimaniRamesh.Barde@windriver.com>
Subject: [OE-core][PATCH v2] systemd: re-enable ptest support
Date: Mon, 7 Sep 2026 08:08:37 +0000
Message-ID: <20260907080837.202307-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260904080215.2501426-1-HimaniRamesh.Barde@windriver.com>
References: <20260904080215.2501426-1-HimaniRamesh.Barde@windriver.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a9e710c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=GhQEx97vAAAA:20 a=t7CeM3EgAAAA:8
 a=tjuFXTvfhPsJCo5rsE0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: XxzmGG8y7B65kO6SKdmWFC50xaltKg8Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NyBTYWx0ZWRfX0JgdkB9MoBbb
 dYr/P7x33vv8oEbUNsyKZ7rnP568PWbPZu+1Fq6hLEaZ1fm1Tzb9/Jih3ZPw1G/Cze2DhnyxAVu
 qXFPM2KR+Txt5hgFXPZhM96jlvDLIhRGYkhs9ixdxh76mrN18j1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NyBTYWx0ZWRfX6X/C3k2icuKU
 CTQnG1iWbYBVNmUwqreVL0EQHySWxO+1rITtyudbC+8qphdJwZLDTVqV5BJVVTgGJwFYqgKclES
 yeMIT3uXG7M+RKqautVjIFyChezfKGqSASar/ARLBGk8bu6oG7hu4mKZdrmca2Mv/a2Dy9KjES7
 aDmushSoxCiMGpc3p1oL41/Lhm1AKjJF5KUgsItzCuOtvtdnyTXVzyVmwPcPRcGUPJestccxuSd
 WB/An5kLJcIepC6SR7cMfpnhplC7FTgSCEw4nHAZsVFQFiB7zLtMfj0zPef1KhJMhdVKSuMUDs9
 OXW9wnW/Q4ertsylfebjdqWAonKZGn0812CcCh2xFu4TiEhR+bakHDSIqWJooNY029F3gAf25R2
 7DHyeha25T4Lwzb3JCOxw/jWITYOePm+NoOTa2l9Nvm5DsXaBBC5cJ2GJ5XsgNiHjOHEVTFH48i
 mniD+bZ7NAbVfsyR/Lg==
X-Proofpoint-GUID: XxzmGG8y7B65kO6SKdmWFC50xaltKg8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070087
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 10:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245244

ptest support for systemd was dropped in 2018 (commit 906230a73b3c) when the recipe switched to meson, as there was no easy way to install and run the test suite. Current systemd and meson resolve this: the meson 'install-tests' option installs the unit-test binaries and a run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and run-unit-tests.py already emits PASS:/SKIP: results per test.

Add a 'tests' PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtests and -Dinstall-tests and pulls in python3-pefile-native (needed to build the boot hwids test). do_install_ptest relocates the installed tests into ${PTEST_PATH} and drops the mkosi/integration-tests harness (which needs a booted system). A run-ptest wrapper drives run-unit-tests.py, and systemd is registered in ptest-packagelists.inc.

The test/units integration tests, which require a booted system, are out of scope here and can be addressed separately.

Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342 unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and systemd-ptest packages cleanly with no QA errors.

[YOCTO #16386]

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
v2:
- Gate tests via a PACKAGECONFIG on PTEST_ENABLED (Jose Quaresma).
- Drop the redundant copy; relocate installed tests into ${PTEST_PATH}
  (Jose Quaresma).
- Register systemd in ptest-packagelists.inc, fixing the missing-ptest QA
  error seen on the autobuilder (Khem Raj, Richard Purdie).
- Add python3-pefile-native dependency (fixes boot hwids test build failure).
- Exclude the mkosi/integration-test harness from the ptest package.
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/systemd/systemd/run-ptest   | 11 ++++++++++
 meta/recipes-core/systemd/systemd_261.2.bb    | 21 ++++++++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-core/systemd/systemd/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ce6c0a2d76..4697843555 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -146,6 +146,7 @@ PTESTS_SLOW = "\
     python3-numpy \
     python3-xmltodict \
     strace \
+    systemd \
     tar \
     tcl \
     tcl8 \
diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-core/systemd/systemd/run-ptest
new file mode 100755
index 0000000000..b2204b96d4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+# Run systemd's installed meson unit tests in ptest format.
+# systemd's -Dinstall-tests=true installs run-unit-tests.py plus the
+# unit-tests/test-* binaries; run-unit-tests.py already emits PASS:/SKIP: lines.
+set -u
+here="$(cd "$(dirname "$0")" && pwd)"
+for cand in "$here/run-unit-tests.py" "$here/tests/run-unit-tests.py" /usr/lib/systemd/tests/run-unit-tests.py; do
+    [ -f "$cand" ] && { python3 "$cand" 2>&1; exit 0; }
+done
+echo "FAIL: systemd-ptest (run-unit-tests.py not found)"
+exit 1
diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-core/systemd/systemd_261.2.bb
index 80e1aa07d1..3e04bd803c 100644
--- a/meta/recipes-core/systemd/systemd_261.2.bb
+++ b/meta/recipes-core/systemd/systemd_261.2.bb
@@ -9,7 +9,7 @@ DEPENDS:append:libc-musl = " libucontext"
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives systemd gettext bash-completion manpages features_check mime
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives systemd gettext bash-completion manpages features_check mime ptest
 
 # unmerged-usr support is deprecated upstream, taints the system and will be
 # removed in the near future. Fail the build if it is not enabled.
@@ -37,6 +37,7 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-Do-not-create-var-log-README.patch \
+file://run-ptest \
            "
 
 PAM_PLUGINS = " \
@@ -937,3 +938,21 @@ python do_warn_musl() {
         bb.warn("Using systemd with musl is experimental, see https://github.com/systemd/systemd/blob/9ca4334/NEWS#L524 for details")
 }
 addtask warn_musl before do_configure
+
+# ptest support. systemd's meson 'install-tests' option installs the unit-test
+# binaries and run-unit-tests.py under ${prefix}/lib/systemd/tests. Gate it on
+# ptest being enabled and package the installed tree. [YOCTO #16386]
+PACKAGECONFIG[tests] = "-Dtests=unsafe -Dinstall-tests=true,-Dtests=false -Dinstall-tests=false,python3-pefile-native"
+PACKAGECONFIG:append = " ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    if [ -d ${D}${prefix}/lib/systemd/tests ]; then
+        mv ${D}${prefix}/lib/systemd/tests/* ${D}${PTEST_PATH}/
+        rm -rf ${D}${prefix}/lib/systemd/tests
+    fi
+    rm -rf ${D}${PTEST_PATH}/mkosi ${D}${PTEST_PATH}/integration-tests
+}
+
+RDEPENDS:${PN}-ptest += "python3-core bash"
+INSANE_SKIP:${PN}-ptest += "dev-deps debug-files"
-- 
2.54.0


