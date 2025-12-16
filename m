Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641DAD5CCA8
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:55:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18742.1765878916228424237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=HQnHGjZU;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=G07M0Az8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG7JkXJ1390543
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=; b=HQnHGjZUrp6rXnJQ
	TpHLxc9JKkzkPaUxEe0S6GyOVeM4NofKwULRjO9DMZk+gY+yUavX6L6DveuRWmtX
	bCkkUVPa6THOrrp7eXAH0FqvDNs0fggKadTjkXC48PG9pQUYVcrZ2yrpkhejRkJm
	wprDRW7OFqWmFCiGXNx4B0s+sMymbobyUbBZfHBEn8cOvxF0iQCVv4l5Rhi6IPPe
	DlUkhFF5a0xMsv8vHJlDQxyMSLsJIsFB4CD6heHDW2KrW+T6j0j2hskgaKTr4OLB
	G1Jm1HU5friCrW+kzv0pmzfs9+FWXK+SAhnvL8ZQMRiHqtXD/r5w/K/MjtdBSh0x
	QuikAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nu1kgy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a39993e5fso37102886d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 01:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765878914; x=1766483714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=;
        b=G07M0Az8bqVXpkLeqSVabv6bpo9cAYne9W+adz/mndOQ5A6Vvs/U6elDC5i8kSutbS
         9qnaUCQ68LpT7Kf8Fmn/620G+n11n8T1mLGjmveCKC0l6qR4XdNAy7tAVEyk8JcwEfTb
         LTNH5vXMipW0FHUH9ZG+Cbl1qGTrwkNcYH97e5c6kADq7crMsszJgIsDVm7Db6DnHF/F
         GpuVnMIBxDDYw0bEig8MPWsy6Sh5zIxWFYrsf+1Nl0X1qWmrgmrHXkYLIcBzXz2TRovz
         V0pdjU/WynMbFYuV3bUrJ93MBZ8ffAZzKuWtATfBZ5gavo8hpGEcWYYgIogd2RmdLX3/
         qdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765878914; x=1766483714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=;
        b=vLqpMMa/QWspVvdEprkJXPO+yFtcAZABmY0uhYUuElgwl+mRwuPjdn/6y/fFF3eB0h
         rvDyKGWqRo7tEbJfWHjeHrrver1QR8g6xn0yPxT7HvOfmgW5Mc0QNjCn2IFWFswc/JXq
         Wv0GZkRBTeWQcRc1x3Xfr/UaceX/Wqj3wDpn2meXrE2BUkR1ykdTh93/1LJDoTDS6Qgb
         eEEgFpkQ0dzSzHk2WgZMoj82InDAlMFTfM/+B2gcYdt6aaaGcIzfNzd9lNbA0Zh9B4Kp
         L+TnWG+B6EJwFsrnYeoGhqNBhkSLJcfEXsHTLaiMwHrvY818n/R8bdBfw50vffciU8Cz
         G7pA==
X-Gm-Message-State: AOJu0YzjD44kE3CaJBPaC1JAWO9cn4bMkkGTeu0KBdZpYJ8mFRiBB47J
	MrZ5IebiLZjVGyWQ3duM+D6FISnk4SNLvDmAEh1e2Y0UUjsHevDLWdmfu4hxYHb57RvfZC9vjU9
	Ghj1K5v2xk4Twl+eWMPTlsFD/lRygzUB0zbt3pA1GPe2BsrXifr/88+Lmi3TXVdMpzANksoO1Tf
	o1zunvUhSSkm7ISpZTYQ==
X-Gm-Gg: AY/fxX4su5rd6vgA6tzbn20Ej+yh90Tm9oj0DVVwFK8uu61TZdKZqzv3O3PjFM2FHbe
	bo7w/klIXsrUHRBEfWH4ENRjpEnKTNewxKEoqLxNJc2vqaESRicSZeKtKcZnHKMt5kp0WOYR4cg
	O2Rr9fmDeK4IuQBL1ybi5hNcx6MF/PLfm+ki3+iWaiWdD2eCI6wilZL1zSnG/3/fCOxUKQU75fG
	dM28ai8ULtsKaFI0OaywOw1jzkWrJwfmAnK+oVkp9LPpuElV4jdsbq2Kh9b9ccwXug8Mu6KjKx3
	UXSAb2keKUv55b0XVJl1H6EjRHHPoG3gJfcsgLqRrBFAFo15taA5XFljRJUp1pzfjjmpUsw2Ok9
	AKTD254Zj5igbdm7TIdJk8eNQtLFW57mq
X-Received: by 2002:a05:622a:a0f:b0:4ee:1dd0:5a51 with SMTP id d75a77b69052e-4f1d0461b4emr170745851cf.2.1765878914497;
        Tue, 16 Dec 2025 01:55:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7+bhSxsv9SCfiQ67JUdLFy5HaQk4e+BVB5c21T/TEjZ39lPz9qpCNwfmEFK/C1BT83D6PPQ==
X-Received: by 2002:a05:622a:a0f:b0:4ee:1dd0:5a51 with SMTP id d75a77b69052e-4f1d0461b4emr170745711cf.2.1765878913966;
        Tue, 16 Dec 2025 01:55:13 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d0b0dsm1645389866b.67.2025.12.16.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:55:13 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH 2/2] systemd: package 'ukify' seperately
Date: Tue, 16 Dec 2025 10:54:59 +0100
Message-Id: <20251216095459.3551985-3-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216095459.3551985-1-koen.kooi@oss.qualcomm.com>
References: <20251216095459.3551985-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: BgMNENfw0jGDFovPXHJGCMQ-8I8d6lF0
X-Proofpoint-GUID: BgMNENfw0jGDFovPXHJGCMQ-8I8d6lF0
X-Authority-Analysis: v=2.4 cv=AOuEbwt4 c=1 sm=1 tr=0 ts=69412c83 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Vfo9hBWOhRVvoKi3vUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4MiBTYWx0ZWRfX3vX7V+n5cjte
 AwVTFhfvaGcdriNxnXeBtjEqv3+AvTUtNcV+dQkbmPu5fwedXpzOjtwMlTaZxpoCCD6qCwWJhtl
 gu8kKuxHJ51VHXUhZhpnzXaeY0atgEztIoBf1Q5Dq0++W15OlYCGTsnwDQb/Tt72E5ZSKbXwn2F
 LZDLZKrSpQx/i9ysVFHp8itgH/ZS1ks9sM/qSMHyWdXz2qNVNDWqL8s696XFHm3bKx9hO3lzZ/E
 27CRYIdE0cHJREARnfZZWz9HWLkQGmZhTr5SGHl/4k+0aIYSCoQp5e9IdCFZtjk5RoUVexjO/71
 //U6rXDccaJtm9UUMxjr0vU8Zk6wmRQI4r/GtbUo+ob1f0wRwu7PDowWrRLIGnGMLeT9lVeNfLk
 lNpqDd4rgKfjrtVnaXK8qBUABI8pnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160082
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BG7JkXJ1390543
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227937

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


