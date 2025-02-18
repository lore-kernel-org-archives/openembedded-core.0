Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B295C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:37:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19528.1739885859882395223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=414479ee1f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IDQBOI028502
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:37:39 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44thw931uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:37:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Feb 2025 05:37:37 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 18 Feb 2025 05:37:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH v2 1/2] python3-setuptools-scm: add subprocess timeout control env var
Date: Tue, 18 Feb 2025 21:37:35 +0800
Message-ID: <20250218133736.2113804-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=CZzy5Krl c=1 sm=1 tr=0 ts=67b48d22 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=G7_6LV9d0GMRhNnwkqcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dSvyOnPg_KqqTZfyD4cJfbb2YJIBUNid
X-Proofpoint-ORIG-GUID: dSvyOnPg_KqqTZfyD4cJfbb2YJIBUNid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_06,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502180104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211615

Backport patch from upstream to add subprocess timeout control env var

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-957-add-subprocess-timeout.patch | 78 +++++++++++++++++++
 .../python/python3-setuptools-scm_8.0.4.bb    |  4 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-scm/0001-fix-957-add-subprocess-timeout.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm/0001-fix-957-add-subprocess-timeout.patch b/meta/recipes-devtools/python/python3-setuptools-scm/0001-fix-957-add-subprocess-timeout.patch
new file mode 100644
index 0000000000..1af1ea0334
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools-scm/0001-fix-957-add-subprocess-timeout.patch
@@ -0,0 +1,78 @@
+From 2ac4f084def6db53b454b967b062bed2f945aa03 Mon Sep 17 00:00:00 2001
+From: Ronny Pfannschmidt <opensource@ronnypfannschmidt.de>
+Date: Fri, 5 Jan 2024 13:34:37 +0100
+Subject: [PATCH] fix #957 - add subprocess timeout
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools-scm/commit/2ac4f084def6db53b454b967b062bed2f945aa03]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ changelog.d/20240105_133254_subprocess_timeout_var.md |  4 ++++
+ docs/overrides.md                                     |  7 +++++++
+ src/setuptools_scm/_run_cmd.py                        | 11 +++++++++--
+ 3 files changed, 20 insertions(+), 2 deletions(-)
+ create mode 100644 changelog.d/20240105_133254_subprocess_timeout_var.md
+
+diff --git a/changelog.d/20240105_133254_subprocess_timeout_var.md b/changelog.d/20240105_133254_subprocess_timeout_var.md
+new file mode 100644
+index 0000000..78ecab2
+--- /dev/null
++++ b/changelog.d/20240105_133254_subprocess_timeout_var.md
+@@ -0,0 +1,4 @@
++
++### Changed
++
++- fix #957 - add subprocess timeout control env var
+diff --git a/docs/overrides.md b/docs/overrides.md
+index 5114a84..22d285e 100644
+--- a/docs/overrides.md
++++ b/docs/overrides.md
+@@ -14,3 +14,10 @@ where the dist name normalization follows adapted PEP 503 semantics.
+ 
+ setuptools_scm parses the environment variable `SETUPTOOLS_SCM_OVERRIDES_FOR_${NORMALIZED_DIST_NAME}`
+ as a toml inline map to override the configuration data from `pyproject.toml`.
++
++## subprocess timeouts
++
++The environment variable `SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT` allows to override the subprocess timeout.
++The default is 40 seconds and should work for most needs. However, users with git lfs + windows reported
++situations where this was not enough.
++
+diff --git a/src/setuptools_scm/_run_cmd.py b/src/setuptools_scm/_run_cmd.py
+index 3dfbda5..a64f904 100644
+--- a/src/setuptools_scm/_run_cmd.py
++++ b/src/setuptools_scm/_run_cmd.py
+@@ -25,7 +25,12 @@ else:
+ # unfortunately github CI for windows sometimes needs
+ # up to 30 seconds to start a command
+ 
+-BROKEN_TIMEOUT: Final[int] = 40
++
++def _get_timeout(env: Mapping[str, str]) -> int:
++    return int(env.get("SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT") or 40)
++
++
++BROKEN_TIMEOUT: Final[int] = _get_timeout(os.environ)
+ 
+ log = _log.log.getChild("run_cmd")
+ 
+@@ -132,7 +137,7 @@ def run(
+     *,
+     strip: bool = True,
+     trace: bool = True,
+-    timeout: int = BROKEN_TIMEOUT,
++    timeout: int | None = None,
+     check: bool = False,
+ ) -> CompletedProcess:
+     if isinstance(cmd, str):
+@@ -141,6 +146,8 @@ def run(
+         cmd = [os.fspath(x) for x in cmd]
+     cmd_4_trace = " ".join(map(_unsafe_quote_for_display, cmd))
+     log.debug("at %s\n    $ %s ", cwd, cmd_4_trace)
++    if timeout is None:
++        timeout = BROKEN_TIMEOUT
+     res = subprocess.run(
+         cmd,
+         capture_output=True,
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
index 64b5050c3b..bed1039e20 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.0.4.bb
@@ -10,6 +10,10 @@ SRC_URI[sha256sum] = "b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += " \
+    file://0001-fix-957-add-subprocess-timeout.patch \
+"
+
 UPSTREAM_CHECK_REGEX = "scm-(?P<pver>.*)\.tar"
 
 DEPENDS += "python3-tomli-native python3-packaging-native python3-typing-extensions-native"
-- 
2.34.1


