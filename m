Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C22C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 15:49:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.51823.1745855337596510802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 08:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cx2Xa6ll;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SADAKq021086
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 15:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UleAVv719KPsInjyB22Kkeo68KjBlvqnOc1
	fawLxZyc=; b=cx2Xa6llE+1KyJTQk7r8P+cEQwWoKnYP24KYrrYWsOvAWmGMtGY
	x5BfN3sKxaPp0x+vlk720h0nTuKPQxSEsmoigjkSVCCp38AIm1s9Bfv7XlawcVAK
	B8FxuqviDBwI4JX5WA8qvZmjFk1StWLPYtAuRncL8slRpsFmhVPtVA11nLwPxYYQ
	2DWyrR5shzsYNg6mKVJIJ1ZGlTk1wLi7fUm4Ie3bChYJIzN2ZdNt1rN+guAFZ1Ls
	1n2Al8xV0egLtIxIr+3LJL4fZKOjFzX/q4kouvFUds3WebTykFwwXiKyDXPddT96
	Qr5y+ih1EcIppHIiJQNhFJAXIbC0tMd47Ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg99pdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 15:48:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c92425a8b1so834622485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 08:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855335; x=1746460135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UleAVv719KPsInjyB22Kkeo68KjBlvqnOc1fawLxZyc=;
        b=IVoNS3MTOwx4WhAyLgPuf6JtwdAC/mHJg9oFYIXH25NLLjHasKXVymi4pWbRCSLYF6
         41c/pj1t5aIT1ueJUbyuXaFYMnlymOy5CnZilDPGH2/5eMl5Vsl/nUV5jz/Sbt9cXYkl
         XKqnt0REomseH/Vi3GP5twbjdKXf6Dbfh8O8PLbNb4uiznISolEqKvLpmkBXNdH/E8SA
         tUlZNYHFZRzttUK5bsbIPh7HHcbs6DKeg0/dlaR+x479GfZPzZlnn6S03MTOeh+tvjz2
         7KCaUIt0CcEHnuf/Sm5j0S5tTQlIIv/RcDOXqkpoRb6/g+R2FdMRHSHj0M5CJEWAMnhh
         5ppQ==
X-Gm-Message-State: AOJu0YxDGUdXnWOmm+zsLvLYQ5fGk6suKpxPpHVFEjL+MimMTZqxcCpC
	VyZkR/gEAg/KcOjmIMzSfQZa3+/3sVCNLQthX/sp5w89V8r22ePG8P2h6nUptX9sxNUyRp/B3Ra
	fzFWFyJ5gYz94au6YyuEJul5CdxdSARvc3BpZ7aQrApH4mDWTZ/YyzlbxVMoXcClnYUB8e7Fb8M
	+hg8Zuj/XLMAY=
X-Gm-Gg: ASbGncs4QOYw6f4ExjDFUqIeLNJ7w9TuFiM/Mp1yJWBsw8E/chuYt7nNbxW11SxXUs+
	A1vYDMMy74nHVecqh11hHLzRXn3Hl5Lwhk/+kq52ICXBK2tA0z1+DJPTZY3poROJLYspPaHIvcI
	x7inVtBzYTfJJwmvJMXkfkAKwl2pCyF/B34PEZUk3gpId4iM4mwmzEu5zCfXPSW/LVEPg8Z+Yws
	NqmMQUSCoenRJ2Acr7q5cD522+4SiNsdJImxZyv0v/69tlZb4hVtkqWO5wN57TfUO9/N2M0bZTS
	u0XwuutXXceJ8D7vqEyTV7HWwHqxv66OF5D3Z4E/oxJsJgj8jdkjBGa03tALqJiuiKhrdU1R23H
	FGtSDk6wwRLNGPNDSlK0RKfEm
X-Received: by 2002:a05:620a:2805:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7c95859ad12mr2662499285a.2.1745855335371;
        Mon, 28 Apr 2025 08:48:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYY4jZ2T8cybAdWr/IpIWcClFHvAKldNpx10r9jO5bv5zeGp4bCk1QNdJOvdwcMeoxTdBvcQ==
X-Received: by 2002:a05:620a:2805:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7c95859ad12mr2662493685a.2.1745855334736;
        Mon, 28 Apr 2025 08:48:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccaa69bsm1703927e87.182.2025.04.28.08.48.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:48:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] graphene: disable one of error flags
Date: Mon, 28 Apr 2025 18:48:53 +0300
Message-Id: <20250428154853.3084518-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=680fa368 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=g3O51PD4wFpvE54AkhAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8AE1-h41_D4m1M-BRw170xJ_GGpwv_Ot
X-Proofpoint-GUID: 8AE1-h41_D4m1M-BRw170xJ_GGpwv_Ot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyOSBTYWx0ZWRfX36qT4HzofNUm llB5PagOK47gD6iQccMkMS6teidjUdpBuQXAdLrWRXCmxt2PkYySV0rTYdTD3lHDnK3FIkPset5 5jO/2ReOqg+kYwGWgNbW2xPiQjShR0nlrGZblkq0GxRcVYp+ayyQE5SLZAmTXISt+cc4L4jlrNv
 Mz0YAANCquI1UtdBaXNN1/XT7KO1I17ruWK9wQDuJH4yJQr1UTjj80cD/xIMBVmvCI3Dezc63Ze vfUmKR0x7phMEJMEt/wApxgxZRt9BqMlD1qx7SWxvvEVYurrbviz6uayiSm6ZISJN1v3DP+XmNw 0WHK5TC/Nn+VEOvG2SunD7SeqZ5Ll4iez3d2yGpoQrGnb2gJyqcApbT0W+Pckn2/M6Hi36JRp9y
 23ikW5HTBjvmgy3JJ1i+Og6AJ9/YMdxawbFJio0C4lX6oeSIdIamPh+jp1A9OschQB/fSMWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=819 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 15:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215618

Building of graphene fails with the following error. Disable
corresponding flag being set by meson until the issue gets resolved
upstream.

../graphene-1.10.8/src/graphene-gobject.c: In function 'graphene_point_get_type':
../graphene-1.10.8/src/graphene-gobject.c:155:14: error: redundant redeclaration of '__Static_assert_function' [-Werror=redundant-decls]
../graphene-1.10.8/src/graphene-gobject.c:155:14: note: previous declaration of '__Static_assert_function' with type 'int (*(void))[1]'
../graphene-1.10.8/src/graphene-gobject.c:155:14: error: redundant redeclaration of '__Static_assert_function' [-Werror=redundant-decls]
../graphene-1.10.8/src/graphene-gobject.c:155:14: note: previous declaration of '__Static_assert_function' with type 'int (*(void))[1]'
../graphene-1.10.8/src/graphene-gobject.c: In function 'graphene_point3d_get_type':
../graphene-1.10.8/src/graphene-gobject.c:157:14: error: redundant redeclaration of '__Static_assert_function' [-Werror=redundant-decls]
../graphene-1.10.8/src/graphene-gobject.c:155:14: note: previous declaration of '__Static_assert_function' with type 'int (*(void))[1]'
../graphene-1.10.8/src/graphene-gobject.c:157:14: error: redundant redeclaration of '__Static_assert_function' [-Werror=redundant-decls]
../graphene-1.10.8/src/graphene-gobject.c:157:14: note: previous declaration of '__Static_assert_function' with type 'int (*(void))[1]'
../graphene-1.10.8/src/graphene-gobject.c:157:14: error: redundant redeclaration of '__Static_assert_function' [-Werror=redundant-decls]
../graphene-1.10.8/src/graphene-gobject.c:157:14: note: previous declaration of '__Static_assert_function' with type 'int (*(void))[1]'

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...build-disable-Werror-redundant-decls.patch | 32 +++++++++++++++++++
 .../graphene/graphene_1.10.8.bb               |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/graphene/files/0001-meson.build-disable-Werror-redundant-decls.patch

diff --git a/meta/recipes-graphics/graphene/files/0001-meson.build-disable-Werror-redundant-decls.patch b/meta/recipes-graphics/graphene/files/0001-meson.build-disable-Werror-redundant-decls.patch
new file mode 100644
index 000000000000..0aacd72257f5
--- /dev/null
+++ b/meta/recipes-graphics/graphene/files/0001-meson.build-disable-Werror-redundant-decls.patch
@@ -0,0 +1,32 @@
+From b8139367858b3473777c2819abdbc900e70648bb Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Mon, 28 Apr 2025 18:29:29 +0300
+Subject: [PATCH] meson.build: disable -Werror=redundant-decls
+
+Building of Graphene started to fail with the following errors. Disable
+offending flag.
+
+../graphene-1.10.8/src/graphene-gobject.c: In function 'graphene_point_get_type':
+../graphene-1.10.8/src/graphene-gobject.c:155:14: error: redundant redeclaration of '__Static_assert_function' [-Werror=redundant-decls]
+../graphene-1.10.8/src/graphene-gobject.c:155:14: note: previous declaration of '__Static_assert_function' with type 'int (*(void))[1]'
+../graphene-1.10.8/src/graphene-gobject.c:155:14: error: redundant redeclaration of '__Static_assert_function' [-Werror=redundant-decls]
+../graphene-1.10.8/src/graphene-gobject.c:155:14: note: previous declaration of '__Static_assert_function' with type 'int (*(void))[1]'
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Pending
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index fa65177fc1d2..fc11eced11e3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -98,7 +98,6 @@ else
+     '-Wno-unused-local-typedefs',
+     '-Werror=float-conversion',
+     '-Werror=float-equal',
+-    '-Werror=redundant-decls',
+     '-Werror=missing-prototypes',
+     '-Werror=missing-declarations',
+     '-Werror=format=2',
diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index e2e82b32aa82..eb8adc64f41a 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7d871d9e23c450c421a85bb2819f648"
 
 inherit gnomebase gobject-introspection gtk-doc
 
-SRC_URI += "file://float-div.patch"
+SRC_URI += "file://float-div.patch \
+    file://0001-meson.build-disable-Werror-redundant-decls.patch \
+"
 
 SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da31dfde2928f279a"
 
-- 
2.39.5


