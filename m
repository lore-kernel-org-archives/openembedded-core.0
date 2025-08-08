Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34768C87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 22:05:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.389.1754690724184972671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 15:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=ncXWZSOf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FNSXH024747
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Aug 2025 22:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=32O6HEICxxYuWG5IAV59H2
	wQ8WrgiI6vr0kbUwSJylU=; b=ncXWZSOfjja450/LSDvDuQe6Fp73lIDh4Jyicq
	tU0fhMxszSiOzDV8iLC87XQz3kP+qILoOaQsAFojqefoN/uYGe/Ewphy9v/8tZqF
	emJKyS34X/kuqJxx72o4v1xN7B781vdbSR6yZ9Duh1Nv5r22FdNz/NPgJkDpI1Sv
	2bD+LedX2NCMAjPBfzyTeHoyzVVIL8h57N8fAZXiXaSU05gB8/o85Uu+JPO0vwIv
	HIk7ZuAoZ2rZSXfF6G0Su1H37o2dPQoZdi1acK7UmoVTwIwwZQkTfyHy+2uACy1G
	5e6tLlaIm85NWuqCaaCwf0h1RJu7N7xVVPhxw+uXWNlHdx2g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1k4hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 22:05:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b085852fb8so91487441cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 15:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754690722; x=1755295522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32O6HEICxxYuWG5IAV59H2wQ8WrgiI6vr0kbUwSJylU=;
        b=iBsii1yC+hDzIwl/TyW50srP5WXJn6WLLv8rInoSr7Suw/6/JBCPk6jWOkVaEY29x4
         ivEYxaQtUYNUtBaCenEUg18uzZ3IdQrNNAACQVOMVPYVhmf8v/qd7rVAIuzWzC75rsFv
         mB99wPAFY/1r+Hn20I/KbrKX5E3ciRkxrdlrOmULrxAXN/B9nCS247S0krS3Vb7TFKdB
         boICwcuNyH5QbQnRAe7OU0q8dAX4NmVwr4WHJR8kJQZvjsHtWKsXRUNksZHiwxgbmq8t
         E66b/j0Fqs0LR1n5Bsd067kKPphP8ffTaWaLeF7cesRFrUoObhCNyTulw7en0nSjZ5Fn
         qUSw==
X-Gm-Message-State: AOJu0YzVZdJ1vAtoiH+yDcs+nXhN4wbdZyMz911JgQespsNRVlLvAn+W
	666kLY/N41TEe6wAiEozc+BfbCJ03QigCUD0z5lHHTkh6g7Vp3zBnWXx5lSFtcieVirBRnVu7+5
	GJXf9fQimNRzRvsJzq5eCqPVMXGsEc23Ee3SLozs/Reof6yKpzCHGWxhzkUgXGxeVvV/TDNDI+G
	QZqgmX3hszMKWrG7SVmA==
X-Gm-Gg: ASbGnctm3GHJTBQj6ygY0ZrvVp51ZB6iTDWz98WkubvgfwoJf+jcW9LbLo6rb6083Xf
	TPlQmZC+OlPAeTd4LvuZs/BkcAjqxqllpGvsVPQ2Dsm4cCQTCtNnnPStvk1zFK6aF5BT6IQxbws
	XoRid9Ewxn1qLyC6+cr2bS/tQ0J/7xL+l0i0njqpRvDD8RDjklwTvPoe34lL03ElvCz2/TJWFph
	Hx4nJqnwUx2raVjaE2mp4hi8f5DYsJzpMXXlv++dTqAlTpz4ciWuRSLkwf1++JqaYAdWFVIHQtN
	mQL5wsb/NKuUqI0SD/yxKzFcC280M38DnEoJpa7lETlqmcXBADPKCpn7HaS1j9IH9Q/1oEnYTwg
	JM8Wk/ifkvgvE6YsaxJHQn5f2I6xV0CX3fmZJbS51j15maiE42Vx8
X-Received: by 2002:a05:622a:d:b0:4b0:792b:273d with SMTP id d75a77b69052e-4b0aed42c5bmr62365991cf.21.1754690721325;
        Fri, 08 Aug 2025 15:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpQwsVQ+BhBYthhYe2o3Owo4yNAO4Zdi8W6flDX0SyhFRNwFdgw1tezt8BNEkEcndEzMBHDQ==
X-Received: by 2002:a05:622a:d:b0:4b0:792b:273d with SMTP id d75a77b69052e-4b0aed42c5bmr62365181cf.21.1754690720271;
        Fri, 08 Aug 2025 15:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9906dsm3185542e87.83.2025.08.08.15.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 15:05:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade 25.1.6 -> 25.2.0
Date: Sat,  9 Aug 2025 01:05:17 +0300
Message-Id: <20250808220517.3687046-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1dO2BJ4Z2zs4
 tycOvBdyjLlQETgx4jVQEQuV5uI5tCXC2tp0lOEHKnW7+3Zxss62OZsI+QouzMRhICAPlLrQe8h
 geoq0KQnQQXR8zC/FUy5XWRQbQRCpkEm7rb6jP5RfUmHECzdZQl/RM2XcZGeeavV9okS4rs1MQX
 oy48VwPEIq9yLyPaHx1x4IGEA3ef+V2LmWUUD/tRk2RhCeiRrCk4atA68JWklH7iMFTndXJCFHL
 JnVTbM0U7wg446UYFiB/8aesaEduy7Ptll4XDmx7ORkX549bz2CfmYB2KToI1IVQMB3+Pi4XIKi
 6ouUwcCstqQJLWPy93pBl8QXjGtIXRRuOy/nkw7QtLUxhrWsrE6MkUTdXdUcQR2Vd/h69ZYJ8Wj
 S4Hwp/YV
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=689674a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8 a=ZpVaWaFtAAAA:8
 a=EUspDBNiAAAA:8 a=tzMQSi8mAAAA:8 a=20KFwNOVAAAA:8 a=ngr0nC1O1lfuAdmaNdMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22 a=f63Bc6mPlh_JVoXi1IE3:22
X-Proofpoint-ORIG-GUID: 9g9K2m0AUYl9Ce5rqnXdbfMcvj22CIGH
X-Proofpoint-GUID: 9g9K2m0AUYl9Ce5rqnXdbfMcvj22CIGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_07,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 578FNSXH024747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 22:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221669

Upgrade Mesa to the latest release. Refresh remaining patches and drop
ones applied upstream.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../0001-dont-build-clover-frontend.patch     | 29 --------------
 ...itch-to-new-non-owned-TargetOptions-.patch | 39 -------------------
 ...on-t-encode-build-path-into-binaries.patch | 12 +++---
 meta/recipes-graphics/mesa/mesa.inc           |  6 +--
 4 files changed, 8 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-dont-build-clov=
er-frontend.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-fix-FTBFS-clc-s=
witch-to-new-non-owned-TargetOptions-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-dont-build-clover-fron=
tend.patch b/meta/recipes-graphics/mesa/files/0001-dont-build-clover-fron=
tend.patch
deleted file mode 100644
index 5f45f94fea4e..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-dont-build-clover-frontend.pa=
tch
+++ /dev/null
@@ -1,29 +0,0 @@
-From: Markus Volk <f_l_k@t-online.de>
-Date: Sun, 19 Mai 2025 15:34:46 +0100
-Subject: [PATCH] dont build clover frontend
-
-The clover frontend is deprecated and is always built with opencl, even =
if
-using rusticl. Additionally it adds a reproducibility issue.
-
-Upstream-Status: Inappropriate [oe-specific]
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
---- a/src/gallium/meson.build	2025-05-07 18:35:10.000000000 +0200
-+++ b/src/gallium/meson.build	2025-05-18 17:05:23.677694272 +0200
-@@ -195,15 +195,11 @@
- else
-   driver_d3d12 =3D declare_dependency()
- endif
--if with_gallium_clover or with_tests
-+if with_tests
-   # At the moment, clover and gallium/tests are the only two consumers
-   # for pipe-loader
-   subdir('targets/pipe-loader')
- endif
--if with_gallium_clover
--  subdir('frontends/clover')
--  subdir('targets/opencl')
--endif
- if with_gallium_rusticl
-   subdir('frontends/rusticl')
-   subdir('targets/rusticl')
diff --git a/meta/recipes-graphics/mesa/files/0001-fix-FTBFS-clc-switch-t=
o-new-non-owned-TargetOptions-.patch b/meta/recipes-graphics/mesa/files/0=
001-fix-FTBFS-clc-switch-to-new-non-owned-TargetOptions-.patch
deleted file mode 100644
index 2633869625be..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-fix-FTBFS-clc-switch-to-new-n=
on-owned-TargetOptions-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 531c6696d42953cd642dea7bf70153285c7949ae Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Kai=3D20Wasserb=3DC3=3DA4ch?=3D <kai@dev.carbon-projec=
t.org>
-Date: Tue, 6 May 2025 14:36:57 +0200
-Subject: [PATCH] fix(FTBFS): clc: switch to new non-owned `TargetOptions=
` for
- LLVM 21
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream hid the `TargetOptions` in commit 985410f87f2d19910a8d327527fd3=
0062b042b63
-
-Use the new `getTargetOpts()` to obtain the `TargetOptions` for
-`setTarget()`.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/me=
rge_requests/34835]
-
-Signed-off-by: Kai Wasserb=C3=A4ch <kai@dev.carbon-project.org>
-Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13079
-Reference: https://github.com/llvm/llvm-project/commit/985410f87f2d19910=
a8d327527fd30062b042b63
-Reviewed-by: Karol Herbst <kherbst@redhat.com>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3483=
5>
----
- src/compiler/clc/clc_helpers.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
---- a/src/compiler/clc/clc_helpers.cpp
-+++ b/src/compiler/clc/clc_helpers.cpp
-@@ -874,7 +874,11 @@ clc_compile_to_llvm_module(LLVMContext &
-                            diag_opts));
-=20
-    c->setTarget(clang::TargetInfo::CreateTargetInfo(
-+#if LLVM_VERSION_MAJOR >=3D 21
-+                   c->getDiagnostics(), c->getInvocation().getTargetOpt=
s()));
-+#else
-                    c->getDiagnostics(), c->getInvocation().TargetOpts))=
;
-+#endif
-=20
-    c->getFrontendOpts().ProgramAction =3D clang::frontend::EmitLLVMOnly=
;
-=20
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode=
-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-f=
reedreno-don-t-encode-build-path-into-binaries.patch
index 953a724dc092..136ed8623bcb 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
@@ -25,12 +25,12 @@ index bb7cebf5a748..351cc31ef2de 100644
 @@ -56,10 +56,12 @@ if with_tests
    asm_fw =3D custom_target('afuc_test.fw',
      output: 'afuc_test.fw',
-     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPU=
T@'],
+     command: [asm, files('../tests/traces/afuc_test.asm'), '@OUTPUT@'],
 +    env: {'RNN_PATH': rnn_src_path},
    )
    asm_fw_a7xx =3D custom_target('afuc_test_a7xx.fw',
      output: 'afuc_test_a7xx.fw',
-     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@=
OUTPUT@'],
+     command: [asm, files('../tests/traces/afuc_test_a7xx.asm'), '@OUTPU=
T@'],
 +    env: {'RNN_PATH': rnn_src_path},
    )
    test('afuc-asm',
@@ -38,13 +38,13 @@ index bb7cebf5a748..351cc31ef2de 100644
 @@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
      disasm_fw =3D custom_target('afuc_test.asm',
        output: 'afuc_test.asm',
-       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw')],
+       command: [disasm, '-u', files('../tests/reference/afuc_test.fw')]=
,
 +      env: {'RNN_PATH': rnn_src_path},
        capture: true
      )
      disasm_fw_a7xx =3D custom_target('afuc_test_a7xx.asm',
        output: 'afuc_test_a7xx.asm',
-       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_=
a7xx.fw')],
+       command: [disasm, '-u', files('../tests/reference/afuc_test_a7xx.=
fw')],
 +      env: {'RNN_PATH': rnn_src_path},
        capture: true
      )
@@ -56,14 +56,14 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
 @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
        log =3D custom_target(name + '.log',
          output: name + '.log',
-         command: [cffdump, '--unit-test', args, files('../.gitlab-ci/tr=
aces/' + name + '.rd.gz')],
+         command: [cffdump, '--unit-test', args, files('../tests/traces/=
' + name + '.rd.gz')],
 +        env: {'RNN_PATH': rnn_src_path},
          capture: true,
        )
        test('cffdump-' + name,
 @@ -247,7 +248,8 @@ if with_tests
        output: name + '.log',
-       command: [crashdec, args, files('../.gitlab-ci/traces/' + name + =
'.devcore')],
+       command: [crashdec, args, files('../tests/traces/' + name + '.dev=
core')],
        capture: true,
 -      env: {'GALLIUM_DUMP_CPU': 'false'},
 +      env: {'GALLIUM_DUMP_CPU': 'false',
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 0d6f013ae10a..a848a2ad8c73 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,12 +17,10 @@ PE =3D "2"
 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch \
-           file://0001-dont-build-clover-frontend.patch \
-           file://0001-fix-FTBFS-clc-switch-to-new-non-owned-TargetOptio=
ns-.patch \
 "
=20
-SRC_URI[sha256sum] =3D "9f2b69eb39d2d8717d30a9868fdda3e0c0d3708ba32778bb=
ac8ddb044538ce84"
-PV =3D "25.1.6"
+SRC_URI[sha256sum] =3D "7c726b21c074d14d31d253d638b741422f3c0a497ce7f1b4=
aaaa917d10bd8d4f"
+PV =3D "25.2.0"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.39.5


