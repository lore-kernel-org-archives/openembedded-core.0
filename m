Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35C8C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 05:54:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45149.1739771697636730957
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 21:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4143913a06=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H5GHPR026920
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 21:54:57 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tuaq98j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 21:54:57 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 16 Feb 2025 21:54:56 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 16 Feb 2025 21:54:55 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] setuptools3-base.bbclass: override default subprocess timeout
Date: Mon, 17 Feb 2025 13:54:55 +0800
Message-ID: <20250217055455.3351270-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1824E84CBF53452B.4193@lists.openembedded.org>
References: <1824E84CBF53452B.4193@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QLGSRhLL c=1 sm=1 tr=0 ts=67b2cf31 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=zwXmAwp_x2hHYwLl0w4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: uEIUgrD7a-jElC9sDreXGC1tvwOMGfN9
X-Proofpoint-ORIG-GUID: uEIUgrD7a-jElC9sDreXGC1tvwOMGfN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502170049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51H5GHPR026920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 05:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211513

The environment variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT allows to over=
ride
the subprocess timeout. The default is 40 seconds and should work for mos=
t
needs.[1] However, it was not enough while using git shallow tarball and =
starting
multiple Yocto world builds in one host.

| =C2=A0 File "tmp/work/x86_64-linux/python3-scancode-native/32.1.0/recip=
e-sysroot-
native/usr/lib/python3.13/subprocess.py", line 1263, in _check_timeout
| =C2=A0 =C2=A0 raise TimeoutExpired(
| =C2=A0 =C2=A0 ...<2 lines>...
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Db''.join(stderr_seq)=
 if stderr_seq else None)
| subprocess.TimeoutExpired: Command '['git', '--git-dir', 'tmp/work/x86_=
64-
linux/python3-scancode-native/32.1.0/git/.git', 'status', '--porcelain',
'--untracked-files=3Dno']' timed out after 40 seconds

Explicitly set variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT to 600s in bbcl=
ass,
and we could override it in local.conf

[1] https://github.com/pypa/setuptools-scm/blob/main/docs/overrides.md

Issue: LINCD-21838
(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20250217

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/setuptools3-base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/setuptools3-base.bbclass b/meta/classes-=
recipe/setuptools3-base.bbclass
index 27af6abc58..190d9e6e3a 100644
--- a/meta/classes-recipe/setuptools3-base.bbclass
+++ b/meta/classes-recipe/setuptools3-base.bbclass
@@ -23,6 +23,10 @@ export CCSHARED  =3D "-fPIC -DPIC"
 # the python executable
 export LINKFORSHARED =3D "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
=20
+# The environment variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT allows
+# to override the subprocess timeout.
+export SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT ??=3D "600"
+
 FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
 FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES:${PN}-dev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.la"
--=20
2.34.1


