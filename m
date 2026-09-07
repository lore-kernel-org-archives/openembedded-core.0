Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF854C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 11:47:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32869.1788781525515972225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 04:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FHEP0y5C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37101daba7=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687BSnXC3716342;
	Mon, 7 Sep 2026 11:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=q03Eofxsm
	fvB4IEQw1rWbzLsK+YXmIBU2MTfF/En6K4=; b=FHEP0y5Ci+taFRLeNjhpXY6IY
	28txU7to41gTKG7dzhWBUeIRCcZufjVsqMOM0czm+IZg9CnDP9EQfXnlYDzbTQ0M
	jjJ2R5K9c4djEtrqZWpusyOApcKaIYc+PsVjbZlsXT4R5LDjOq6NJR+OGVBcmOoC
	wmTjYxLT/G7NcSFF5Yoopc2fHxidsadIgYQBm8euUGpWvMSXUsEyOr+ZzNVMiKYV
	iRZpQrgaQKT3Ovoa8IWeL45licwN8jIadWUVW7H++8XG8yVjZgAVwPHKMPbTsF7j
	DX982L4YIzxQwFc6Sln97uWSdQMFjDQZY2KcU2N47EH49z9Emdo9NuXQAqoKw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gga25tbqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 07 Sep 2026 11:45:13 +0000 (GMT)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 7 Sep 2026 04:45:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.46; Mon, 7 Sep 2026 04:45:11 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 7 Sep 2026 04:45:11 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <ross.burton@arm.com>,
        <jose.quaresma@oss.qualcomm.com>, <raj.khem@gmail.com>,
        <richard.purdie@linuxfoundation.org>, <Shiva.Komati@windriver.com>,
        "Himani
 Ramesh Barde" <HimaniRamesh.Barde@windriver.com>
Subject: [OE-core][PATCH v3] systemd: re-enable ptest support
Date: Mon, 7 Sep 2026 11:45:07 +0000
Message-ID: <20260907114507.294436-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a9ea3c9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=GhQEx97vAAAA:20 a=t7CeM3EgAAAA:8
 a=tjuFXTvfhPsJCo5rsE0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: FdUTVD3waTjJAVLA05WMDMdujb-WPinJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyOSBTYWx0ZWRfX8GdIVtef08RI
 W646EdYnntPhSUmGJOK5JQCAAnDi/Mq9+4wkbBao07k40IX2x8xDFXwwB1NOlzn3nG+XoWPE8Sg
 viYcROBr83KKO00ABFfNjbKxPeew2sjWS/DNcvGh5JKwd78zp7H7fjIh0oSfH48/fkg4+d7+U7/
 QDs4mkCULpKXQ2rspRxceyJ7K1FSQaquvhLQODo5ejEgIRBjKOXKEaHhMZOmes/bhrsMVlCCxXF
 CSAfN9dduvIfqa7FH7/zhYJeAusrzNlKdMMonZL8erUSM8hjNRllwvrfaBquS7IrzNOyYjbBSQO
 aZcznaEuQNSRo7wFcACCNC8pTScKfJFABBjv2fZX9dJeL0nC9UtY246FwvVUjhp6T3dawkyFfcO
 R35duQJfW7D5QlF+5/iYPhwqHUW2tKwb8EnJcUP//+bhYC4+bAY9kL7T8IsSuR3NH+4YfX/LIun
 giLH9qAn9MTKBqyvt7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyOSBTYWx0ZWRfX6E6d6kyPYXAN
 JWhQsSzSMQc7I0HI7YKkQ3VvvzaGsmJzImWbBEOwjxmOuTHI6agQErCRxZ1uEjun8htADQqH8IL
 hrG03bwpeTnEZ7HhXc2eBUkkOR8SmW/IOSGNKElG5ML8RMJN+uqO
X-Proofpoint-GUID: FdUTVD3waTjJAVLA05WMDMdujb-WPinJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070129
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 11:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245248

ptest support for systemd was dropped in 2018 (commit 906230a73b3c)
when the recipe switched to meson, as there was no easy way to install
and run the test suite. Current systemd and meson resolve this: the
meson 'install-tests' option installs the unit-test binaries and a
run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and
run-unit-tests.py already emits PASS:/SKIP: results per test.

Add a 'tests' PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtests
and -Dinstall-tests and pulls in python3-pefile-native (needed to build
the boot hwids test). do_install_ptest relocates the installed tests
into ${PTEST_PATH} and drops the mkosi/integration-tests harness (which
needs a booted system). A run-ptest wrapper drives run-unit-tests.py,
and systemd is registered in ptest-packagelists.inc.

The test/units integration tests, which require a booted system, are
out of scope here and can be addressed separately.

Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342
unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and
systemd-ptest packages cleanly with no QA errors.

[YOCTO #16386]

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
v3:
- Move PACKAGECONFIG[tests] next to the other PACKAGECONFIG entries and
  the PTEST_ENABLED conditional into the PACKAGECONFIG ??= block (Jose
  Quaresma).
- Drop the inline comment; details are in the commit message (Jose
  Quaresma).
- Fix the SRC_URI run-ptest indentation (Jose Quaresma).
- Wrap the commit message at ~72 columns.

v2:
- Gate tests via a PACKAGECONFIG on PTEST_ENABLED (Jose Quaresma).
- Register systemd in ptest-packagelists.inc, fixing the missing-ptest
  QA error seen on the autobuilder (Khem Raj, Richard Purdie).
- Add python3-pefile-native dependency (fixes boot hwids test build
  failure). Exclude the mkosi/integration harness from the ptest package.
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-core/systemd/systemd/run-ptest     | 11 +++++++++++
 meta/recipes-core/systemd/systemd_261.2.bb      | 17 ++++++++++++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)
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
index 80e1aa07d1..43c19c5edc 100644
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
+            file://run-ptest \
            "
 
 PAM_PLUGINS = " \
@@ -51,6 +52,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
     link-udev-shared \
     backlight \
     binfmt \
@@ -188,6 +190,7 @@ PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,initsc
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
+PACKAGECONFIG[tests] = "-Dtests=unsafe -Dinstall-tests=true,-Dtests=false -Dinstall-tests=false,python3-pefile-native"
 # When enabled use reproducible build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
 def build_epoch(d):
@@ -937,3 +940,15 @@ python do_warn_musl() {
         bb.warn("Using systemd with musl is experimental, see https://github.com/systemd/systemd/blob/9ca4334/NEWS#L524 for details")
 }
 addtask warn_musl before do_configure
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


