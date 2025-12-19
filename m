Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF23D767F5
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 12:01:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15289.1766145678527656229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 04:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=NZL65Isj;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=iGHx/jvF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBGBtq3999652
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EDPoUo9Jhb8KjXS0Wdxzqq3I/xcB9DxUuCKtLa3Q7A=; b=NZL65Isj76cNSVAV
	VK4kJqOeYW5sQUIravswgZcpBafU2qQ5aNBvOiE3gybZWZrKgdWEDUc8VDvrIiHk
	kO6p77B2mzNAPsKpKMqvESIGQ2JUdF1ygzSejZMXQyHTL9Sj9J4IYKGfK+l5CkZz
	P8hljDs0B5ubSYKbLfNwxP1ZHmddDr33zSey2B9+yAtYm0aG0axtfnu7fXcZzHC8
	EzUSzIE0fxNyLHOj5FaMMAPF2a8vTKZOTSrEaJM2syywaB5PwIxoQCX6qDIUxk3u
	T8xf6Zoq2OrGcci9G5sIaaa62qcu0axrfH1DniWKREW3TBqhGTupz/uOlBi/oFNx
	noT+yQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29jjsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55b0f62aeb7so2319962e0c.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 04:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145677; x=1766750477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EDPoUo9Jhb8KjXS0Wdxzqq3I/xcB9DxUuCKtLa3Q7A=;
        b=iGHx/jvFLQY1PxR+8/18l6I9WF9UuuY4E6GCeGcts9SEElXJ9dY2G3sno2s4nJnJLM
         YYYzOV2L39rnS6TRHqz+e0DjQwjj/k0QUGhvdHK8ztRjEfBMzNcc6YuOd4xCXJaT4j5O
         p6ifNivqe20ofUUCjlfLXCxoAeOz2N1TD/Mjo4mBfX+NrvV4v/wDX0L40MHtJgY4KUl1
         BM98juPQFFuxiDbu+xm5xgy/HumqdUlqZABImwJaBN+HidXUF9EspfbCE6pV1e0NpjlY
         9flW45KpYzW5q/n7Vs5PUiIEwQoorgvtK811tcvaxxmntUbvii56zq/xYHvUuctAfBTc
         qnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145677; x=1766750477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EDPoUo9Jhb8KjXS0Wdxzqq3I/xcB9DxUuCKtLa3Q7A=;
        b=qo10FzRQq/gAbroJuDh+PaxTJ5AWDqMQoH6flUzi0LFLcZQORsXMBardADlEKejtWV
         UrG//JWDwnBdoJm3OPVI574KZImow5Ez8s0TzJf4oGB3Ku+wfzGPTRe2Qlko7ACWb2In
         JwPSc8lG79MBBr7iJMDPtaG7lCDSTLtJrQcvj6gOw3fM2s5NlyhgUTy8zHBcf+wbFTYc
         +BwQ4afIX0pTguo1shhmrjJPUYHH+wkQhPZW1iJ0a2h3r8O+XC5dKrQLoP5yLaXBg99z
         Cl1WIPcZgvlS4lmKyuZerumITOVZ73kZp8qaGOGOpKo/ZovCRejUmrkli6upc8ghcQRX
         qNVA==
X-Gm-Message-State: AOJu0YyBXv/RTojBt1l5dH+5XE6ELfQm/0XK14ExqSSTS1NsWSWe/DW2
	pLNgNJFlkdyEevIe+CcHs/ERI6ErVcuqhPaj8PwgveEqk+7C2L4VNoPi92i6lIgVQc3kVh78Y9f
	YdnGJDWHANzv9B65WsJPA98coB+tebE+dc//Oy9WFlif5IcDdbGuNfTMX3ECQGpb6NhziskjsW8
	YxI74oym9kX7OlK306Hg==
X-Gm-Gg: AY/fxX4IUSwbM3Rc54hWdKB9wa5nyPPIORNrgUX5y6dka3d7XSVpytGwHm+6KMMfBJl
	VEJq7U2Kopk4YXFdUJkjPvk6HvhkPDnHgsrkLBSyZHjIm1WeEELLA4Gej/3uXtgLrXBEEjlksdQ
	PhUqtOfrN5TFrh4DS3Z3bJiEfghCRjzWTRJgJI69UVXJxG30bdy5cxvjR3M4GEcfb7/7Vu8FXEP
	E0FkD1Z5LsjSVUlHy/+NhUbRllSPgj1KeQQzumh7oXTWfD+5vo2s3tq/ELeS2D9/Gtjqh9JVGot
	zFdIb02Hvw4yPmn80GUfa7cFZ0yBANUL/86sHu9CjDRc2CW/gaZENH1wMLZNa7TGdjk451yn+vz
	O/MqhCkQG11qslxCZe6kCAS2TQWAOK89e
X-Received: by 2002:a05:6122:318f:b0:559:83be:69c5 with SMTP id 71dfb90a1353d-5615be07d05mr739120e0c.10.1766145676863;
        Fri, 19 Dec 2025 04:01:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/LJCBhTk/D824hfODkCDi6Oix5zC1OlEjTjUVDQYXTZ/iUemlperg+h7xiwlGCImbvHilDg==
X-Received: by 2002:a05:6122:318f:b0:559:83be:69c5 with SMTP id 71dfb90a1353d-5615be07d05mr739076e0c.10.1766145676387;
        Fri, 19 Dec 2025 04:01:16 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c03sm2002120a12.18.2025.12.19.04.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:01:15 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v4 2/4] systemd: package 'ukify' seperately
Date: Fri, 19 Dec 2025 13:01:07 +0100
Message-Id: <20251219120109.1967755-3-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
References: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=69453e8e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Vfo9hBWOhRVvoKi3vUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 1HssihQlrMf8NbHrwkQX1B3ffc6xs4yK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5OSBTYWx0ZWRfX5SAZhs+yL1Lk
 OqipWBNRkt5mxeV0zM+ewos+kfCt46G/qrab+L1tWvlLxUqBhmt1PcYVTZtWoCni0/NK0wGzntm
 LBpLkMxG67LUoaXOEfneMqw7z0NqvLQlk6JzVFifljRxNTVe2OP7D6bKO1bn8RnLjBR0c3mldbM
 Gxp2ExIhKat8Q0htDJnhensVpV0sXSAZ8fTSeMtQeVmnpo98FTXzTRq6EOJKQ6AXYbCTewiMq/O
 02rfk33eWvo2xa5SCyxN52NAYIr75pZdMyYTEfBXyaQf2pT0iD4uOoLLLxEelkqjajPZEhK92n/
 cB40lyDcaX80Hpnd4ja+ILGPBlyNlnkQFENhHxWqPNBvyqllWrzsouBJ8tsE8GpifIySjWeDU49
 DC6H5OrcoNqMwmLS0N9zlkD0gaiWY9R897YepHjLupF8djr67UFsk7JSiMlUx8RElXyRQiSXwWO
 gaAW/Ph2hBMctsSI/DA==
X-Proofpoint-GUID: 1HssihQlrMf8NbHrwkQX1B3ffc6xs4yK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190099
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BJBGBtq3999652
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228223

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

No changes since v1/v2/v3

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


