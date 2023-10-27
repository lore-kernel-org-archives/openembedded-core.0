Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8673BC27C48
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 01:17:30 +0000 (UTC)
Received: from mx0a-0003c201.pphosted.com (mx0a-0003c201.pphosted.com [205.220.171.22])
 by mx.groups.io with SMTP id smtpd.web11.16464.1698437057242227312
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 13:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sonos.com header.s=pps1 header.b=R8cF02iM;
 dkim=pass header.i=@sonos.com header.s=google header.b=XL/IrUTe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: sonos.com, ip: 205.220.171.22, mailfrom: prvs=466465f2d0=david.zuhn@sonos.com)
Received: from pps.filterd (m0299972.ppops.net [127.0.0.1])
	by mx0a-0003c201.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39RHBsHH008397
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 13:04:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonos.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pps1; bh=eSFDzNbAtH4D
	/vYvKqav+MYtrnPkwPAu+9b+4p/PT38=; b=R8cF02iM8RuASHGjGoIjuUeSXDuX
	0EYzDLI7oy6pdKl9Bn3GdFIuelQLbyolQApxQ4PDiXpBrzFhz+owN7r/sOhJIc3g
	WgXXILQR897pJl9T1yoJQGEuBU+Ak/UEeUne8PVrIPowZkVXif0rT+xDrLYC4O1f
	IcU73JExZpUVx4ZjKzpM5Criv04BIFkSflrH/C7r8X5kyP/84I0F7b+fmuNwpzUj
	sHRPfMpuMgl7xE4hcBflP63T3k9jlCuyVWB+Q0KkWhMND1y+PLPaDmDawQ9i5pzF
	z56gWIyMYU/mDJnLcsLwnW+YhbI4eREvVpPqODROgzKkR0QgWJiPsXDOfg==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0003c201.pphosted.com (PPS) with ESMTPS id 3tywshshmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 13:04:16 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3528544b1e5so26003805ab.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 13:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sonos.com; s=google; t=1698437055; x=1699041855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSFDzNbAtH4D/vYvKqav+MYtrnPkwPAu+9b+4p/PT38=;
        b=XL/IrUTekkNApR5akwqAcmKKc8qiUCIySxREueCRxGP6BtJA9hQnANjZcuXNqSL5/R
         h6LP+GVOmXKQUoWsz7IOSzxESX5Cl0M3uhm8NBRiuk4HwsdmQBw3esaU82CfQMwQ+b03
         gITtGES1balHgMwPgLVcTbC+qhyHeBsMUQqfksn+0W9FsV4UItjV4OqGjQAEmAxZLliF
         I8owadiUDJPaKjXrHDoCvEXaDQBHYLWWqsj0xE9e98BTG0uMYtK+L6AIpkABsnxgF/rG
         AC9Qa+TsbfH6QjQyxs7rLRq0gfbqJ+BgU6uwtj9KPLlPTvDMD/OTVSp2wUAhN4SrE0Ir
         HmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698437055; x=1699041855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSFDzNbAtH4D/vYvKqav+MYtrnPkwPAu+9b+4p/PT38=;
        b=YUb7znnGlUa8Iv4A6uOp7SvqCeXHtKc9qELF+KPsi5Cwcdr0TDEDySq3pk8Dwpq4Hl
         OjpiU/Wl3oAm+6/N0B24t9z7wZGjos30gGEc6EHncOhF4jINE1t8lWx0/YbmBHK/8U/l
         rs8S+VYOKBSezW3u8OEc3ok7wwGaFcYYtwUZD2nW2TQvSfI0VaIUjRBHO1DuKbEnyWka
         eUPY+PiPrytabUajY9oiOUtQ+y26YvmPrmfkLVBOVyxKre5m2m5t6iv5TZF32t3ZVgPZ
         AX313ojtO02UHNIUmDcoH1CuEgQPTIDc7Ni5nCrIhHxCMmVRdLUOvRXdsddKfMhRmCgb
         U/Aw==
X-Gm-Message-State: AOJu0YyN62fQuLrbbfHa5P5jjitfbhHx2/OH74d4MQymrAvkQSNaDN9n
	T3f3n0MfGqRUVgr4OlNmUaxEY+ZNurL5UZPcMmTSnJUOsjUKatlW7so9i6r+duuWcq1THesCmzx
	breECW+nm9HvUDnAynYn0AOBe5Hk3zZ2ClGAkNG3uknPk6GSd
X-Received: by 2002:a05:6e02:b46:b0:34f:7b1e:c568 with SMTP id f6-20020a056e020b4600b0034f7b1ec568mr5423836ilu.3.1698437055357;
        Fri, 27 Oct 2023 13:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsCkAcYGk+nnlA78MZ3TzhY+VouHMjwd09WSf7D0HyH7tsYzFum8BWhSty11/VC3IzS1gqMA==
X-Received: by 2002:a05:6e02:b46:b0:34f:7b1e:c568 with SMTP id f6-20020a056e020b4600b0034f7b1ec568mr5423824ilu.3.1698437055138;
        Fri, 27 Oct 2023 13:04:15 -0700 (PDT)
Received: from roebling.sonos.com (97-116-51-195.mpls.qwest.net. [97.116.51.195])
        by smtp.gmail.com with ESMTPSA id cr9-20020a056e023a8900b0035134f1a240sm663963ilb.86.2023.10.27.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 13:04:14 -0700 (PDT)
From: "david zuhn" <david.zuhn@sonos.com>
To: openembedded-core@lists.openembedded.org
Cc: david d zuhn <david.zuhn@sonos.com>
Subject: [PATCH 1/1] bitbake.conf: remove ${CCACHE} from FORTRAN compiler
Date: Fri, 27 Oct 2023 15:03:51 -0500
Message-Id: <20231027200351.3717801-2-david.zuhn@sonos.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20231027200351.3717801-1-david.zuhn@sonos.com>
References: <20231027200351.3717801-1-david.zuhn@sonos.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Qlu6H7aC3iyiBSl7abHMZjWWlWZNOQmU
X-Proofpoint-ORIG-GUID: Qlu6H7aC3iyiBSl7abHMZjWWlWZNOQmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_19,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310270173
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 01:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189758

ccache used to support FORTRAN (versions 3.3-3.6) but no longer does

Signed-off-by: david d zuhn <david.zuhn@sonos.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2900a8bdba..67ff769046 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -553,7 +553,7 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+export FC = "${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
 export CCLD = "${CC}"
@@ -570,7 +570,7 @@ PYTHON = "${@sys.executable}"
 
 export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
-export BUILD_FC = "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
+export BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
 export BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
 export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
 export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
-- 
2.26.2


