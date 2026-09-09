Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA6FC79FAD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 12:18:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7581.1788945585072593157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 02:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mZ97/nwO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3712269c4e=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68937A4U157439;
	Wed, 9 Sep 2026 08:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=bLtSPiyv2
	IUT8dB9ay0M6qFK4RaeCDpqldEl22UThPA=; b=mZ97/nwOGK/YDGY73oL2gVDgC
	sQbGFr2J6/0HzOhqw9kHKDJLtzLKQHnx0rvE6XkJ4mbdvqe7/+9/R3PeZT8aNVkR
	5fSeA/KBKmsoQi3tnygrX88I8m1oJjPNrN2Keght1pmTWyDA2PRPtX1TALXNwe2O
	LOuzCaj8SSb9RT6i7QWqjkPDf6hqBo56Q4JMr6smv1ASFJOP68qGb5f1ZjVGpmbP
	RnycJwbt9II4Xdrn30UczUCFOoe05n1Kb+hKIO7jPNS+FIi4NEbCHUqbZK1Iir6e
	lDMNoquIn+KalWIAnz+0pYwBmlxfPkLuQZPc1QP1rdpdK2yJu6yFWg/aOW5ww==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gg8rrdvn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 09 Sep 2026 08:55:23 +0000 (GMT)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 9 Sep 2026 01:55:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.46; Wed, 9 Sep 2026 01:55:22 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 9 Sep 2026 01:55:22 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>, <jose.quaresma@oss.qualcomm.com>,
        <Randy.MacLeod@windriver.com>, <ross.burton@arm.com>,
        <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <Shiva.Komati@windriver.com>,
        "Himani
 Ramesh Barde" <HimaniRamesh.Barde@windriver.com>
Subject: [OE-core][PATCH v4] systemd: re-enable ptest support
Date: Wed, 9 Sep 2026 08:55:18 +0000
Message-ID: <20260909085518.640950-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 9H76UYv23kvZ0ullHx1A071GVUF00p9o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5OCBTYWx0ZWRfX160guCiLjBmt
 0kYgK2cajKcHiovbqOTSFeZFfR+tyvAoW69J9CQvE9WBnumb6fyADVtwCz0lEFLx5rzqNcrTT4e
 28m/naexUu9EoI14UAhCBvZjH0uWpnC4qhX6wrgdoFgIJZ0yv47m
X-Proofpoint-GUID: 9H76UYv23kvZ0ullHx1A071GVUF00p9o
X-Authority-Analysis: v=2.4 cv=boF8wkai c=1 sm=1 tr=0 ts=6aa11efc cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=GhQEx97vAAAA:20 a=t7CeM3EgAAAA:8
 a=mhUy6aM4D53TeK_FPXgA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5OCBTYWx0ZWRfX+FoCaBMz9wlE
 maRqC+px/ihpcZjLMxRRp1zWX0SJ5JoivHk0m5ipyyHXHIcm/wlZx47X9+a2krqqOPt8NueN1B+
 A2whZdCW+fiRBz2r2vQpJBb3GMmIlg9lvByA1hdxg6rwbBiEZEkgg8qxQjMkJQzC+xUqDvx/yh/
 qsvkAs7+lk3L5DXQ2Fu5aeWW7szoSuOYQXuxliFiQFmvYCNplYGoBK+iT83iAY6sRHKy4UKaEup
 rsPWdSobMlajj0fSPVU8gBGWpNZrpL5ftp9aG544VgIgz/CzIawuNe/2GBTLe68CQOQeCaC8NlT
 X6VSkcSvL352XvmIMAhOE6qxbPKrB4XWGkE4aAjl0FhWSHemDnA34yOBTqS0OnuCJDVl+rS+2P6
 oDVFdem/QjXtJ6s7huDQe0kPJzsWyD7EOKgto5rB2ubC+XKpQ0zOE1xn+zYJbj9oF4hLfDelRgN
 ssafaKslFR8D/c0YgBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090098
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 12:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245460

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
v4:
- Make the systemd entry in ptest-packagelists.inc conditional on the
  'systemd' DISTRO_FEATURE via bb.utils.filter, so distros without systemd
  (e.g. poky) do not require systemd-ptest. Fixes the autobuilder failure
  reported by Mathieu Dubois-Briand.
- Fix leading-whitespace alignment of the PTEST_ENABLED and run-ptest
  lines (Jose Quaresma).

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
index ce6c0a2d76..5de3424e40 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -146,6 +146,7 @@ PTESTS_SLOW = "\
     python3-numpy \
     python3-xmltodict \
     strace \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
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
index 80e1aa07d1..095b123683 100644
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
+           file://run-ptest \
            "
 
 PAM_PLUGINS = " \
@@ -51,6 +52,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
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


