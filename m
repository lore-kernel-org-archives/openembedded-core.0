Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9388E98FBA
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:16:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126440.1775715408258954999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bH3lWIpM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395Qvjx270432
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 23:16:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2xiLcYmcdey8clHftoXd9YZl9RVU+3Aug35YUZINwtM=; b=bH3lWIpMBGC6
	lZgJge04WiZmr0QWCW//AZ5hApYptms58P4nhPYFUfF2/XOpnorA4ySVR2RGBodo
	pd8kSHs28EVn0mGEJ2c+Il30EY9v5niUESPY8AsKH6o8WduO8F1mLp+R8VlGXOfe
	IxJmcNPV8awnpBjuzTWbBqAX3A5YgbTN7bWSk6lxvNWbYM07YIYGN/oWTaUtoe2R
	T5a1ZLTEVfAZ+rxy3DKH8uNC0qNxY3S/SR1NJNhR9vTag0vKo3/HPSof+PLWImHS
	xQ0Dkz9apjoIweRb4LUqF6+8kv46dEaivh1ALuP2Ye6aDPTcK89K4ItR2teGY7Ba
	K58PdMQ/YA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryknh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 23:16:47 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:46 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:46 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 06/12] python3-wheel: fix CVE-2026-24049
Date: Thu, 9 Apr 2026 14:16:33 +0800
Message-ID: <20260409061639.1688205-7-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NerBlszp8iprbvkB0Krc-owhw8Th-f7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX0LHq/9fh5ypH
 E0vYZiE4sFgk5+tpYnYuOmcIjMmTlwh/vn+xxTs284GaR5mV7kSTdxafnY8z66yzN+H46OGz9uD
 2GHtrAulzzTuJtB6oszW9aIG+uIxmE0RsF1QnZu+ocsqS0WOzNEZ7XyV6CEn2xQunF5ouSQWd4t
 hXwPd24nCHd0m/Xy6jssJqDtblnHLCDE+aQ4m5tzgWzVT32tHUxqgKda/ccJzVU1oUyOnQ88Vt7
 sC9QhutZCok6ykgu5ch3rabIhUD3euGHzstkQ1y8sFyip+RTfU3M87sDs/BE7lIUQv/Hf3MAPnr
 ZQFvI9t0z14F7Zm8iaSAdhtY9l0vWiAoJxJfx4h+ufof/FDIEdAtC0WlBYvoU3eVbfAvGEinEWS
 bWZjNbVQ2fb10Y4BIIuw0Gf8iul2EAamlol5P3cEmhuL7Ll/lwyEfQzq4FqXAVrIcztnnRrvwCM
 tX960OsOSXvqy9YYsHA==
X-Proofpoint-GUID: NerBlszp8iprbvkB0Krc-owhw8Th-f7L
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d7444f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Eo5z8NStIMYwHTwZncMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234882

From: Guocai He <guocai.he.cn@windriver.com>

Backport patch to fix CVE-2026-24049 per reference [1] [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-24049
[2] https://github.com/pypa/wheel/commit/7a7d2de96b

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../python/python3-wheel/CVE-2026-24049.patch | 73 +++++++++++++++++++
 .../python/python3-wheel_0.42.0.bb            |  2 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch

diff --git a/meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch b/meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch
new file mode 100644
index 0000000000..89a848c100
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch
@@ -0,0 +1,73 @@
+From 363aef740d670c37d76b6fd86e2a28886de23f45 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Thu, 22 Jan 2026 01:41:14 +0200
+Subject: [PATCH] Fixed security issue around wheel unpack (#675)
+
+A maliciously crafted wheel could cause the permissions of a file outside the unpack tree to be altered.
+
+Fixes CVE-2026-24049.
+
+CVE: CVE-2026-24049
+
+In test case, the API "run_command" is not defined and use "unpack" directly.
+ 
+Upstream-Status: Backport [https://github.com/pypa/wheel/commit/7a7d2de96b]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ src/wheel/cli/unpack.py  |  4 ++--
+ tests/cli/test_unpack.py | 22 ++++++++++++++++++++++
+ 2 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/src/wheel/cli/unpack.py b/src/wheel/cli/unpack.py
+index d48840e..83dc742 100644
+--- a/src/wheel/cli/unpack.py
++++ b/src/wheel/cli/unpack.py
+@@ -19,12 +19,12 @@ def unpack(path: str, dest: str = ".") -> None:
+         destination = Path(dest) / namever
+         print(f"Unpacking to: {destination}...", end="", flush=True)
+         for zinfo in wf.filelist:
+-            wf.extract(zinfo, destination)
++            target_path = Path(wf.extract(zinfo, destination))
+ 
+             # Set permissions to the same values as they were set in the archive
+             # We have to do this manually due to
+             # https://github.com/python/cpython/issues/59999
+             permissions = zinfo.external_attr >> 16 & 0o777
+-            destination.joinpath(zinfo.filename).chmod(permissions)
++            target_path.chmod(permissions)
+ 
+     print("OK")
+diff --git a/tests/cli/test_unpack.py b/tests/cli/test_unpack.py
+index ae584af..96d1391 100644
+--- a/tests/cli/test_unpack.py
++++ b/tests/cli/test_unpack.py
+@@ -34,3 +34,25 @@ def test_unpack_executable_bit(tmp_path):
+     unpack(str(wheel_path), str(tmp_path))
+     assert not script_path.is_dir()
+     assert stat.S_IMODE(script_path.stat().st_mode) == 0o755
++
++@pytest.mark.skipif(
++    platform.system() == "Windows", reason="Windows does not support chmod()"
++)
++def test_chmod_outside_unpack_tree(tmp_path_factory: TempPathFactory) -> None:
++    wheel_path = tmp_path_factory.mktemp("build") / "test-1.0-py3-none-any.whl"
++    with WheelFile(wheel_path, "w") as wf:
++        wf.writestr(
++            "test-1.0.dist-info/METADATA",
++            "Metadata-Version: 2.4\nName: test\nVersion: 1.0\n",
++        )
++        wf.writestr("../../system-file", b"malicious data")
++
++    extract_root_path = tmp_path_factory.mktemp("extract")
++    system_file = extract_root_path / "system-file"
++    extract_path = extract_root_path / "subdir"
++    system_file.write_bytes(b"important data")
++    system_file.chmod(0o755)
++    unpack(str(wheel_path), str(extract_path))
++
++    assert system_file.read_bytes() == b"important data"
++    assert stat.S_IMODE(system_file.stat().st_mode) == 0o755
+--
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
index 807888e6c0..934f258a93 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7cee
 
 inherit python_flit_core pypi
 
+SRC_URI += "file://CVE-2026-24049.patch"
+
 BBCLASSEXTEND = "native nativesdk"
 
 # This used to use the bootstrap install which didn't compile. Until we bump the
-- 
2.34.1


