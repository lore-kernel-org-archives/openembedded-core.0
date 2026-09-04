Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A44C61DD6
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:42:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9004.1788508956325335701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LlWVi2CJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37077ff900=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68465GHA235086;
	Fri, 4 Sep 2026 01:02:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3kW8/zpRP
	u2ru2q8reSLfn8hsL4NSljzmkZCdO/BGwg=; b=LlWVi2CJrgqORNylSgv/f/y22
	/nMXTQ2l2HNtsLmVnJhT2OwALy+UkycHsrfpaMPuKA1n8B9XG6LjgdbtlN0Fo1M2
	DHIh6+WE0Y5kgAj0d8dFOO+RXXl0LuiH3tFkrDzAfcV+xlonOiNbvBQy2z6NjnO0
	B8d+HsCiAX95Hx04wMVP8yQtm934EBLJIXC/cWXzkcLGf8ILZkWtd/V4iEZ2Cjfa
	dQakJuBQhY07Oo1xQmoL1qdqzsl2cAhd6R1G3QcwWVBqlXPrfTD1yppqSTNF1EBb
	XNO6F/Ecwi5m0Da+yEi3YnyO/c8+R5RDoE57yVkYtdqQ2/pipl5IYa4pi7zEg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gfc8p1971-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 04 Sep 2026 01:02:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 4 Sep 2026 01:02:23 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 4 Sep 2026 01:02:23 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <ross.burton@arm.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [OE-core][PATCH] systemd: re-enable ptest support
Date: Fri, 4 Sep 2026 08:02:15 +0000
Message-ID: <20260904080215.2501426-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3MyBTYWx0ZWRfX+fW2+9l89xb4
 6M+Ak2QUc1Hf/0iQBU80KThjPA/ArfC2cbUXglc1/CG3WTfN6h9m7CvvSMdQKazXpxwQCKenj4n
 P7wFLsg1laWpaKmP89DLxRFRyx+BcR4wkNlNho8E6CM41utcReZW
X-Authority-Analysis: v=2.4 cv=GZcnWwXL c=1 sm=1 tr=0 ts=6a9a7b11 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=GhQEx97vAAAA:20 a=t7CeM3EgAAAA:8
 a=BoTvoepAtHVGsuerbB8A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: vdOd2xUwM5PdQHLP89Sp7HNxum6-RASB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3MyBTYWx0ZWRfX12uLU+a5E/up
 riFtGlkmqOXu7Bh7VPqxtVWdBgdTRVMdH1yaKU1NU0dZ4qfdsxfVqyp5PVSiM+c4ImP1jSd/76W
 H/QPYGLGXcfFLm1ySm3cDwG70Ahg3Uebjqp/LJ5f2YBgsU2ZzQP/+1MOLKOWcKtFPY/tezDW4Mc
 WH42nE6JHLaUH1SHyRKHd0oJkHox/BYGynUvtNHsIEuuZWCa8MDj2/50XI4c3PiNbBKXHWgiAFL
 O71aiJfnrga/6tdFhoBsRePNafPQkEWNF9v4rgV3aWAaj3QLx7Ba2PcUo4xvnQ6g4wFtTAsSMlg
 AX7WuMQYt37v4fH1yFW/80JS61aVpCqKXidpRxit4PmjDnStDlxw3zgzwzO31sPinAozreXgjrn
 n7p0KKN6H4JD0814s5jPZ1WTlUqqJKQvTO8ff3J9k6E/L1TTHoM4COeI2YZxALkGudL1OSXyqxl
 x665h1x99NmVYkl8v/Q==
X-Proofpoint-ORIG-GUID: vdOd2xUwM5PdQHLP89Sp7HNxum6-RASB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040073
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245115

ptest support for systemd was dropped in 2018 (commit 906230a73b3c) when the recipe switched to meson, as there was no easy way to install and run the test suite. Current systemd and meson resolve this: the meson 'install-tests' option installs the unit-test binaries and a run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and run-unit-tests.py already emits PASS:/SKIP: results per test.

Enable install-tests, package the installed tree into systemd-ptest, and add a run-ptest wrapper that drives run-unit-tests.py. This provides ptest coverage for the systemd:test and libsystemd meson unit-test suites.

The test/units integration tests, which require a booted system, are out of scope here and can be addressed separately.

Verified on systemd 257.6: -Dinstall-tests=true installs 313 test-* unit-test binaries plus run-unit-tests.py; systemd-ptest packages cleanly. The recipe change parses without error against oe-core master (261.2).

[YOCTO #16386]

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 meta/recipes-core/systemd/systemd/run-ptest | 11 +++++++++++
 meta/recipes-core/systemd/systemd_261.2.bb  | 18 +++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-core/systemd/systemd/run-ptest

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
index 80e1aa07d1..dfd2b7c0c9 100644
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
@@ -937,3 +938,18 @@ python do_warn_musl() {
         bb.warn("Using systemd with musl is experimental, see https://github.com/systemd/systemd/blob/9ca4334/NEWS#L524 for details")
 }
 addtask warn_musl before do_configure
+
+# ptest support: systemd's meson 'install-tests' option installs the unit-test
+# binaries and run-unit-tests.py under ${prefix}/lib/systemd/tests. Package them
+# into systemd-ptest and drive them via run-ptest. [YOCTO #16386]
+EXTRA_OEMESON:append = " -Dinstall-tests=true"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    if [ -d ${D}${prefix}/lib/systemd/tests ]; then
+        cp -r ${D}${prefix}/lib/systemd/tests/* ${D}${PTEST_PATH}/
+    fi
+}
+
+RDEPENDS:${PN}-ptest += "${PN} python3-core bash"
+INSANE_SKIP:${PN}-ptest += "dev-deps debug-files"
-- 
2.54.0


