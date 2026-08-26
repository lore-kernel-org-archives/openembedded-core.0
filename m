Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35D7C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 20:23:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21828.1787775828794956942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 13:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=X7d6/p02;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=j0abtdhs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QK5YTw2268957
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 20:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PEGzuVgUQH2ea10p+i9T5Jrq0a/oBomHWoG
	BoETa/KU=; b=X7d6/p02jmrboNJJxaME54eX7SBOzk9IvwVy5OJBp0HeCBW1LRl
	1XFFYHbOtBWpMq+J56OFG76MuZyd5XHPbsm0acfwSiRL98o0NA8mOX9z6N2o7/+d
	5WE801cM6Ef7qxlnbVDDrtSdHV927PJTArcwgcLn7m5njPlEvHzQZz7s1nA/suL8
	lSD6NC7yxCUaWo8fjaF2J52hX/DXmyi+o9i0/2Nir/pgudg9Fl7g3F/rR/Ra3yvO
	zqTZXU12BFDgvz1CfRzXadEC1IFCL6BoSdvUzl5oGnwJFE6+cCfRx6FcH5kcyzML
	fMbx99UGLH8JsefKbLU7Df9OAJrCeBiu+bg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4eggn8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 20:23:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso2518662a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787775826; x=1788380626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEGzuVgUQH2ea10p+i9T5Jrq0a/oBomHWoGBoETa/KU=;
        b=j0abtdhsafxtLehVPwKRd0T4MPFpTqMYsES9frM4wGZvl9rIe5i7A4bqtRsUVWWRdD
         Gwb3MkunOrS4WyTYrEj9HdEQGxDEaYkdxdgsOYySrpQo8+Q9Ujpgh4xa7P7iJcGeDHEV
         OOQmjpBpOfu2KSuoXt5nv8IbTq/gx/qTjkjD2kx1meCYiR3HsHbDshECfk+kgypc56Zi
         yV4TebSFX/Rf+AE5j3V5J4MG1gY29Nnlha1CboWhdbcFlnssZKGx++oIl3FjGMOnIdNn
         j/HnuWKT2P7u0Tcsx/t5HuDDMzU8VLFvgxomQksk7iKbJytbJoQreeKHPRhMzzdD608b
         BzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775826; x=1788380626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PEGzuVgUQH2ea10p+i9T5Jrq0a/oBomHWoGBoETa/KU=;
        b=TPXSXIbY5vxXe8+3W1cx1NwkAlfGIvzCmmkes3S4uM2Ov4PnSBubSVsfRwWRxOiDFu
         YsW8VKDxFIJflsVwQ2RZHj3Z6vw+osz99N7BVdXiKQmSGLwNZ5PSYJ4C0iIh+ka11qNi
         6Wf4bzwqmBXcQyUU+mQmaIQCEg6T43AsrWNb6xJwIm1+M5TQcso6JGwHKkZZzZJI8wus
         Rb+b/rf1ixdfIvOKxqab39Es+l4WWxMBFmpdO6JNa+2XqKlQdfrBVHfkQfyZPr0Ymq5q
         qh6xZ5xwgVi+2+Vkq9JxYKC1gIWsRiQbhzig4Nylk+glHIqbuVD6vEau/sGUy0JtjfJz
         /m9g==
X-Gm-Message-State: AFuF++lJxlLUsmL/k1KWS/5e9CrZAUhB38NR5/UMkvBRxqQ8kyfF158r
	nI4CUo9Ddy7dGXCA0Espj41/edC3SPt1Eawc1ZyLQvNc37lT4I/u64FbNsvSnEL+ucF/7Ub9WRb
	jGBSYJbNDgCwjP/WFikE1wDEoAknrzDF62MQzL9g00euyXtScRWftKtShf6hrwjhzHHEahAnyO9
	4G6EF9ggjlxuyAFb7Urg==
X-Gm-Gg: AR+sD13KSfjH5Xwj7qO7hWxoHFwRL6EOvh7b/JnJLWdF6YiZCMX3uNmC8E/Pg9HyLCZ
	x8QPjCWLmrZHILCH2ZSNTN1f2aFA8GDJJkLfQp6ldEsBZFEuq7RrhUhsxNQGwtVtmxcZB6eEBD6
	4xyyAqlFkE4Scp73fNGtbKNs8R5czT1iX+HzkfDKcMOc9bZ0mxTGXC0b7y8IychAUI2cmE523w4
	3n2ia6GQ/hIEVVlpLQNWHqY40suVQECe/WzhySuhQNsVhFdxJ67Aiv/pKIf4rOcy6iZx5XoZ5kF
	+HoHlrvsCvByGd++vVE/nei9MiqnrAkqEmoevgVfNDQ47NdJDpaISdqGxBX8DCtMAJ1N/EsbPDv
	4uDWEwxMHHVLQn4e12dM/VDNnfKBmTT+uCdUe1bo12wdTh3+fLQn8/IXr5eEDn0tEf77KL8wLsh
	nSIWICuAiP9bxxu57BK+4Bxn3r0B1uGTU5mdrq55Y=
X-Received: by 2002:a17:90b:4e88:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-3966d3e1aa7mr22239633a91.9.1787775826130;
        Wed, 26 Aug 2026 13:23:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-3966d3e1aa7mr22239504a91.9.1787775825301;
        Wed, 26 Aug 2026 13:23:45 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39667fe29absm5597778a91.0.2026.08.26.13.23.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:23:44 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-scons: backport revert of the 4.11.0 Variables() change
Date: Wed, 26 Aug 2026 20:23:29 +0000
Message-ID: <20260826202329.4115348-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _DzjBw8OXj5HjbiQntkLmMm2vvrTTqQn
X-Proofpoint-ORIG-GUID: _DzjBw8OXj5HjbiQntkLmMm2vvrTTqQn
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a8f4b53 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=NufY4J3AAAAA:8 a=ieUfmaG3DWzZlOiXgGgA:9 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TPcZfFuj8SYsoCJAFAiX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE3MSBTYWx0ZWRfXxM3H+tzZnJmf
 cKNNa/bx/hzNA+h6Fj/eKhDksnDiGJVke+sKgsRPRhZCijAnzI03yp04rQ1Q5IlYYdQX2JRPRRm
 GatUtOUIDuGKvQfa/F7js/MexGBS7jNVozf/hi2iSh+dJ4REmstYZwrMTc0QYOYupaAVoMRvg78
 BDkNqC0EvS70tR4+7Rf+E3QYrFYfd0IC1WXGdSNpG40Hn8d0IokoxHZgqdZiQnVvYPFQnGoBuMl
 jy+EMfhLJzCicDLQU//ogYO+0Tn+G6QMlSiMPBzVSEuxkaEPtgu8FfVkJ240a7LoR+pE6vbv+CM
 XXW7vs+ZRG6IdQBtwTBnhh6UKjqJWhDVHI6nQzq0hZXCYMO+4d1noOI8Nz5Gg8Nm3muht7ibqR9
 NcM9egc96Q1LtYtTF4mEScnS5xm9PY2jOWsxbn9xMBD9nOrF07Fzwkp13Lu4zLkqWAxHNnBNa/k
 uaqEm68APrpIdVfuX/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE3MSBTYWx0ZWRfX9lmW2wgT5d7n
 jQIcLtTuPZPYzzl70idUlmVI6HNadSWm+SLGVM72ow3+R8CyLtdqo2tnzBTxrCigpdZ4XOb8nk/
 tJg8Zwt0kaFq1fG3jLH5YJ5C3TfXdp4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 20:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244414

scons 4.11.0 resolves a saved-variables file through a File node, which
creates a node for a file that does not exist. That breaks gpsd's install
step, which fails unlinking a path that is not there, and makes Glob()
return phantom entries for other projects (SCons issues #4894 and #4893,
both regressions from 4.10.1). Upstream reverted it for 4.11.1, so
backport that revert until the release is available.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 ...evert-a-breaking-change-to-Variables.patch | 48 +++++++++++++++++++
 .../python/python3-scons_4.11.0.bb            |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-scons/0001-Revert-a-breaking-change-to-Variables.patch

diff --git a/meta/recipes-devtools/python/python3-scons/0001-Revert-a-breaking-change-to-Variables.patch b/meta/recipes-devtools/python/python3-scons/0001-Revert-a-breaking-change-to-Variables.patch
new file mode 100644
index 0000000000..b11de965c3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-scons/0001-Revert-a-breaking-change-to-Variables.patch
@@ -0,0 +1,48 @@
+From efa7ab507067e31b71ced010097e6f92cf71030f Mon Sep 17 00:00:00 2001
+From: Mats Wichmann <mats@linux.com>
+Date: Wed, 19 Aug 2026 14:21:44 -0600
+Subject: [PATCH] Revert a breaking change to Variables()
+
+In 4.11.0, via PR #4875, a saved-Variables file was looked up through
+a File node. This change is (temporarily) reverted due to side effects;
+Variables returns to reading the file directly with open/read.
+
+Upstream-Status: Backport [https://github.com/SCons/scons/commit/efa7ab507067e31b71ced010097e6f92cf71030f]
+Signed-off-by: Mats Wichmann <mats@linux.com>
+---
+ SCons/Variables/__init__.py | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/SCons/Variables/__init__.py b/SCons/Variables/__init__.py
+index c8ce37c84..dea36ddd0 100644
+--- a/SCons/Variables/__init__.py
++++ b/SCons/Variables/__init__.py
+@@ -271,20 +271,18 @@ class Variables:
+ 
+         # next set the values specified in any saved-variables script(s)
+         for filename in self.files:
+-            # Resolve the saved-variables file through the File() node so it
+-            # is found in the source directory (or a repository) as well as
+-            # the build directory, e.g. when using a variant dir (issue #816).
+-            node = env.File(filename)
+-            contents = node.get_text_contents()
+-            if contents:
++            # TODO: issue #816 use Node to access saved-variables file?
++            if os.path.exists(filename):
+                 # issue #4645: don't exec directly into values,
+                 #   so we can iterate through for unknown variables.
+                 temp_values = {}
+-                dirname = os.path.split(node.get_abspath())[0]
++                dirname = os.path.split(os.path.abspath(filename))[0]
+                 if dirname:
+                     sys.path.insert(0, dirname)
+                 try:
+                     temp_values['__name__'] = filename
++                    with open(filename) as f:
++                        contents = f.read()
+                     exec(contents, {}, temp_values)
+                 finally:
+                     if dirname:
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-scons_4.11.0.bb b/meta/recipes-devtools/python/python3-scons_4.11.0.bb
index 585cad271c..491ff4d10f 100644
--- a/meta/recipes-devtools/python/python3-scons_4.11.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.11.0.bb
@@ -4,6 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
+SRC_URI += "file://0001-Revert-a-breaking-change-to-Variables.patch"
 SRC_URI[sha256sum] = "5ba48f9e2eb6b9178cabdc9893792418e6970c84f43f4b027e4468e20616a89c"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


