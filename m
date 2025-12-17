Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4B5D65C58
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:08:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16725.1765984114064968937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=DCCcHQ1+;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=Idoie3hx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKrZt2764423
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=; b=DCCcHQ1+cwQJ/93b
	45SvuXHfDgyMhfR1Mo/mHQllR3gpmMSNKpcmK1G/QmHrg9av7zPyWV9s4PYXmqcM
	jYv3AVeYSQhSzDBeAsP2IBahrh3zTkYvch1OI5454pEMZd/rPFkTRhL8Ewal1rn1
	K/nX7r18EkhdPOo2Y3p/8Dp97Y5uypmzCRd1XCi72VqK2Tk0irsEwS5tzao//xMW
	I7EzWQeRbvCFN+nIZIwfCGea6ywknESxoygKR8KQ1LWZ7TeeajElljqQII/o/ZZA
	okbqQ/kl2dcw8vAZ9qUzEaWUMfHhmxZnDkLVn3U0jtfdnto4ThlhBNNueic/r3Yk
	8s6Hiw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefjv0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:32 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7881cff41b7so76502257b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765984112; x=1766588912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=;
        b=Idoie3hxD/7qy23xJNZ2+VZBl5SZMoOJLWe9UX9ATU30wnUy8LDTXVA1rBNpgfJV4p
         hpoWbNM5yodiu4dYg5taAPuHj5K7Jax2p2HvyFgPaEzivCPX25k6jVOyujGl3+zD/QAg
         M1jCdJ8aObHNLg176MLwz65+KhdJ5250gtNfCMjOv08xIxqfAGequPZ3V72n4MaC74Ct
         iVARXypMBh29ndXUoJOymihmPAFT8Ptz+PekjQqZuoGl4L0/JFK/BfFX/bZ5/c7gDxau
         g1J+1A2oftbs1odFNpp5IGiowsYWXQfNcATDjVsG3hPBngKaDh79CuAgqOB//PeFpe4+
         Xn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765984112; x=1766588912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ff/BqKq4hvDhL0P+pZsfB0X61oMmLR6ivk/MSnfmLCg=;
        b=rvKicohwEp+po/z6bS37Taa8F5daBKke17O+1/bJ64ojsrUIKIhvtNiD8imHL7IHLp
         FhRrCoh4U+oFZS+k6zCZkaGf638iCCjN2zBa/5HdElCJwCyeBIO1af9bKBPrYIcK7XfH
         Vj/zbKnZ6I9CASh2+bJVxo9m3GCwtZ1MXwDkA3hW+VTOxzyN4kRDdG1sPBbiuuyC29cf
         wiQBf+qHy62NG5ICt8k5gEy3z6hl5SdobXjMpJyJStYsz6MWRqU4qrkmJc1J36t+JByS
         rpTgbGH0IGQEkJz1MoCtxsWM+PwELGxjUHLxXf9MDnCuzuYsK+yoyufBRIuSWRUKxBZ7
         1NHQ==
X-Gm-Message-State: AOJu0Yx2svEbj4zz3n9lWO6K1G/r46YV+AOXbRYJcm7tP1uxcPUWvQV/
	vlwqmKKV8ZdHmwaR7b9LzHhL8d8x2C+CkwUrvrMypuF7hfxf9Nt0BnZba5EIGtWicNWklx7LE6w
	IIIkHsCq6bvJSh5HgYKdeUbcfJjRQ9ewHzijbrOGL8bwCtxlf7j1Ai3BHjbtwIOibdmu/ktp+/k
	gHdG/gbvnVCwq2vYoqLQ==
X-Gm-Gg: AY/fxX7lWDozzvDJgqe54wddBnlgffanibDdyuYycO+/HO6GQUUNZQL/W9XL1F9PrCM
	XezvngB8dByJMQJOLikCEtJVEmhtHds/OGBypMov90l2UxzpEX2ie/YjYa/ydZtE1di+splSJS+
	v37qcgQaQIrno1QUG2VU/7tC4N0oXdR8xptMfrmL7QwBWgFnelVbHwFlDj9fsgvBlvIMjrZQ9pM
	OBlzbGZtELlDM8p34aAnPc27TWsgj4RKv4JkPlRp8WhbOwttFTO8mre+UIoKHRrRsfVZZhYjeHt
	TeDEACpzQzHTtxdsn1CYUPQEZQByum9pjUllCvT820g1e/9dNRFfYiUfrCttjrA7JiIJXhd84L/
	HHNzXjBDCf42uMlfMaSPN9lBIwNGB42dn
X-Received: by 2002:a05:690c:7481:b0:78e:1aa5:e95c with SMTP id 00721157ae682-78e6694e4b7mr131913117b3.5.1765984112345;
        Wed, 17 Dec 2025 07:08:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcXrE1IyTopCQI4GaB4k2aG8pihQz6PduGwznjz3XGw/LafGeYVvY8r5pHBZqIc4Y8QsfSgA==
X-Received: by 2002:a05:690c:7481:b0:78e:1aa5:e95c with SMTP id 00721157ae682-78e6694e4b7mr131912967b3.5.1765984111936;
        Wed, 17 Dec 2025 07:08:31 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b801cbac4c5sm52792066b.59.2025.12.17.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:08:31 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v3 2/3] systemd: package 'ukify' seperately
Date: Wed, 17 Dec 2025 16:08:27 +0100
Message-Id: <20251217150828.1044438-3-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
References: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExOSBTYWx0ZWRfX8ySWu9SK69oR
 7HzCR7yEdAk5CJ/TNa1HwUZoL4FR1+SFmEonBJYlGiV6douFuMk7nPvXYhOk7DD1fzWbkxfQ3le
 nGgLpWgVm3wMdrNt8ucm/pHQG1dqzLWhrhIHcg60reJrqchBjiC88MCJiQ79xBcwaTuOXURNzbR
 RVkNx4h/aEQKHaFMI3t685R4btN4efGmcyqVpTi0yrqCLMcQ1S2iWpuWCQQm/WbYkGPQwzZgk9G
 p0QqCy8FI9R+cgZyrR9wgbJDAqKye91Sf0CsZ/2cssX9WpOfn7xZmj+Kyw4Hft/X4hhwNHVi+cO
 sQw1GhMvj3ryjMOJa9DZu/N2KrZ3mszxfUqmxHLkx3ElrJSz1nm9zY4O2crjvuemJU+I2xBswIA
 Xo8VyF6IKfFO3qEQardMH91b0b86ZA==
X-Proofpoint-ORIG-GUID: 5Q2vKW4W8Ew503LN7HKKCi6LbS2F3tMt
X-Proofpoint-GUID: 5Q2vKW4W8Ew503LN7HKKCi6LbS2F3tMt
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942c771 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Vfo9hBWOhRVvoKi3vUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170119
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BHCKrZt2764423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228052

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


