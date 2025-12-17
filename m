Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45651D65528
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:34:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10996.1765964058902375231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=m9LtDlzB;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=RHuBoZds;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4XMG62316084
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=; b=m9LtDlzBiGia9tjV
	yWiSbi9Mur8dvTcy360huojT6GOUwRSwFHrqYJwndGllyA9+K9GVelTnkbBxD0Ze
	Wlq8+XiyGHN6laJ9cfzNeIbAwx4Sux+PezFRClOW644MbOmpJc0JNpt80BkZqzi9
	mi2mThVNZZfiTp2q/FVJmwimJ4riQOmw+kzl1G/RUtXlHTa0llIOk993PXknbOJ2
	1Hys9T2l8yjjnM+jL/md+55DBRp75qjcG8N3w2IC83WekjtHgeH26dnRvV7k/P+n
	cIkKa2u1Izy31ug01+HTvXZeu/c0s6JTqcl7/ikXEfEWPqIhf/2q4k6hkIeJ+c+k
	zpI8ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkgy1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1dea13d34so96912071cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765964057; x=1766568857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=;
        b=RHuBoZdskmqtnLSExuwelZIeVOMQ1a2PHDB3v18Gp2KESSWaPI7d6QyHE7GB8uCn7a
         Ag4TeS/MclhuHirgg4jUhaP6+f2KEBxJt4Q6yI2lYt+3SWBiVpmSNyYNKZt+NOFa+DlX
         AxgVxcKNmrLXqEO0k0M1Bl4v1SNZVsv8LjFGFxWlPQsvOO3kR8nI9+MWliXcjJ9nUQXu
         sKIWPVeaK8Ko12mZGeD4HzLxO4cgG/IbhObzCfF5uAnVbgZuJT/EzR7bvBomjEyjVAXD
         p36RyPpfuEEhF/bsjl6DqTtxvOpb0Vl/qPLex2a8k4JMZBT40uXCdRK8IdZYCNUqS3ZL
         z54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964057; x=1766568857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=;
        b=w/Xo26zQFil8wCu6ABoMU3MQ54noDNTcAiGSo1S0bW+49jYzNawNZ0+B/5u2IsgTHS
         BqwapDES5MeYG08b2lTgIMOX7Fi708VNewVbKaej66MQ3C2cvMekzjjv3ShuDJrlU1A9
         tDFXfqFPpdoVXJx+X01weNSw8r2fK8y67obtM1zf2ApZBDrIbsEylneBkCoxlbgG5ko/
         MQxegLjIYoS1YEGCxYwhr4BJvjpJ2FAXEXQM7Nax+8DBDv3FOAAmjFCC+aayACE9XzY1
         1lJREwIYmGqa4NTMZzZWGANdhgyDtulJN9DdCyZcgV2535BmoNqgOm7Nxd6uQJIGRGNJ
         4sng==
X-Gm-Message-State: AOJu0YxSRh9ZR1kjbpRjR4xvs4KmxabbN23JvitgePCMiz4tXsKQCZBI
	rBsCI10GdAebyIgMkeziKZUfofWtZ02y2Of1mLriXImAnKcjxsnINfk/1tTHyGlT4nqgMFanMEc
	HdDMK/iz8xvAm4yQPTlyYORfvw71wo2Bw2sqt17eAEty9xsEXzbAYK6OjcO8xmFmFvkoT3YzJNq
	io1tMv5tXJULKekiu++g==
X-Gm-Gg: AY/fxX5iwkj3pwZDU1oG+r+laxz1QE/YEbh15Jwl5aYgf32s0A406Z1JJuVslowQaaR
	+Yh7EMxg+2gxYR+jVNgr2efZx3T7hAl4aigFMMjyKiCpLkLPJ7i1cTU2n1yWC2nbnJW1q2Yrrzc
	/EYGR2mvkYVWLz9kQm116qJKqrH4Rp0RFvTD/u4x/ondvzn/o3kQ3O3koKPeWTRja6sEAC+AQda
	udIOWDigPn5WSbVH3TWJSADNvuPLnK8vuRPeNTU4od4SajgJ2xyAeeHPm+czNWmEOH1HTNxJ819
	b+VXlr7E0zJzXKviz+HQCHTo4TKSZCRovRDRdI2hWrBu8wT1r2rg/nX3wIasgHstjsCQCKWqoGb
	yriv3zfRV51jOQ/uAfecPNMYNzJTMCCqe
X-Received: by 2002:a05:622a:258d:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f1d065c7ffmr235100961cf.76.1765964057074;
        Wed, 17 Dec 2025 01:34:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEAn75NcMOgmZufNsC+tliMWydAQVOkoVwqRSNC4ZslJ3PCEopUhqdFTfXzjKdQlaXEOdolw==
X-Received: by 2002:a05:622a:258d:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f1d065c7ffmr235100821cf.76.1765964056584;
        Wed, 17 Dec 2025 01:34:16 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29bea0sm1938143866b.8.2025.12.17.01.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:34:16 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v2 2/2] systemd: package 'ukify' seperately
Date: Wed, 17 Dec 2025 10:34:09 +0100
Message-Id: <20251217093409.914045-3-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
References: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-GUID: wLetcWECT1Db9ji9ewsMhlTZ2apGEPl2
X-Proofpoint-ORIG-GUID: wLetcWECT1Db9ji9ewsMhlTZ2apGEPl2
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=69427919 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Vfo9hBWOhRVvoKi3vUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX1i/5ab5THeaF
 WLfMv9EDQthakE3hFbhebogF1g1UQLV8qgo8U2vtyJTi0gij7N5b64Gw/mqBuhdtRXfUrnppF/o
 bXyN1qy8ZOoe0KFnAnvUVwjL4TR0RS8FerY4/ChbBVbfhm/LEXXoHoPrQciJa7OYEJnLPYBwAp+
 llE8ASOiysF8BljYblTI+NrPl7SdKTPd3+fkvPrCdChy+ezmzvfVyw5ZFuJxnADglh9txvUK42V
 Dv89HHzAS69ABz+aCTCGriamvGqkSnUOSRrCy0Lltu/d6bj4EoNjhAmK8+NwlbfgSU7tlyYKfhg
 hzUaAChe0mU1RkMr1H8RzGu0dAmDqGTaLmea1FIqNL81biiTcY/8QsZHaFhNM58NKn3wxNLswis
 vn4ZkchY3aEGu8nwJTxZA58gXwsayA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BH4XMG62316084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228013

The upgrade to 258.x started shipping 'ukify' by default, but didn't
adjust the runtime dependencies. Add the python modules 'ukify' imports
and split out the package to avoid dragging in gigabytes of python just
plain systemd.

Succesfully tested at runtime on:
* RB1-core-kit, using u-boot EFI mode + systemd-boot
* RB3gen2-core-kit, using Qualcomm UEFI + systemd-boot
* Rubikpi3, using Qualcomm UEFI and type 2 boot
* Beagleboneblack using u-boot UFI mode + systemd-boot

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 meta/recipes-core/systemd/systemd_258.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-co=
re/systemd/systemd_258.1.bb
index dcbd4d92f3..70414b03a4 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -408,6 +408,7 @@ PACKAGE_BEFORE_PN +=3D "\
     ${PN}-networkd \
     ${PN}-rpm-macros \
     ${PN}-udev-rules \
+    ${PN}-ukify \
     ${PN}-vconsole-setup \
     ${PN}-zsh-completion \
     libsystemd-shared \
@@ -630,6 +631,24 @@ FILES:${PN}-udev-rules =3D "\
                         ${nonarch_libdir}/udev/rules.d/99-systemd.rules =
\
 "
=20
+SUMMARY:${PN}-ukify =3D "Create and inspect Unified Kernel Images (UKIs)=
"
+DESCRIPTION:${PN}-ukify =3D "ukify is a tool whose primary purpose is to=
 combine components (usually a kernel, an initrd, and a UEFI boot stub) t=
o create a Unified Kernel Image (UKI) =E2=80=94 a PE binary that can be e=
xecuted by the firmware to start the embedded linux kernel."
+FILES:${PN}-ukify =3D "${bindir}/ukify"
+RDEPENDS:${PN}-ukify =3D " \
+                        python3-compression \
+                        python3-core \
+                        python3-crypt \
+                        python3-datetime \
+                        python3-io \
+                        python3-json \
+                        python3-netclient \
+                        python3-pefile \
+                        python3-pprint \
+                        python3-pydoc \
+                        python3-pyzstd \
+                        python3-shell \
+                       "
+
 CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
--=20
2.34.1


