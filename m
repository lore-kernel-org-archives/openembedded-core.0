Return-Path: <daniel.diaz@sonos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1802C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 23:35:19 +0000 (UTC)
Received: from mx0b-0003c201.pphosted.com (mx0b-0003c201.pphosted.com [205.220.183.22])
 by mx.groups.io with SMTP id smtpd.web10.567.1753313695922751609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 16:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@sonos.com header.s=pps1 header.b=fvA7XfYm;
 dkim=fail reason="dkim: body hash did not verify" header.i=@sonos.com header.s=google header.b=bV48w3gF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: sonos.com, ip: 205.220.183.22, mailfrom: prvs=52995aa6d3=daniel.diaz@sonos.com)
Received: from pps.filterd (m0299974.ppops.net [127.0.0.1])
	by mx0b-0003c201.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N967xS014043
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 23:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonos.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=VETIQeSToxD+7xi/77kQmCmP0iS
	FmrSPPIDYBqXaHPY=; b=fvA7XfYmFVbadkvWZcKDaFMrK1LO2+48karry1AXmUh
	G5tx5LKSP518VYO0pNqbFeAmPWhHEqkKBLEViLR8JS2GSrajTV+MTM/7G+mBYEhH
	VtBvSqV3+qpg2WiEuoSWtjNrGj0DHTZOZp8DoiWjzeT//sRXnzT4l/GDyVH99M7M
	W0RvjnFxsIr0FvYyw2YoQGPHux02WO4R2gqcUHcetoUejzLE7aDlRNMSp6k1kzhD
	2lMMkc2H/5y6h7ECn6N+icTb55RccZuzS7ZK+enB6Wm2xUk4Yj97UJgRrrUzmyEP
	xuPpnENTCAaJfiEE/gddlf359HnY9+qfh7zTYsykxWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-0003c201.pphosted.com (PPS) with ESMTPS id 4825bhah97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 23:34:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab7406bfa1so934711cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 16:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sonos.com; s=google; t=1753313694; x=1753918494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VETIQeSToxD+7xi/77kQmCmP0iSFmrSPPIDYBqXaHPY=;
        b=bV48w3gFAF7Xd8Hj+Mf48lyGTao1nyLtnkUEfZwa3F9axPLHYoyNY/H1ctOk3M/IZr
         dBWrUeRUbNPLzAX0jnAIv6DXKC8ESkvFZ2zgWGWGDWffd2fwuRnG9UkYCWVEyNmapwjQ
         AFZQMlCIL4bx+6WpJpODUEGfMCbS4rlter0DrLkMNHmOLLTHQs9OoiIQE0lKUCN5fer5
         C5KnQdW8dMQh66ZNU5w08wJp0DkFsFE6rN/BDlCCBMXqDnFzh9a5uw3xi1scwo6w4SbO
         dyNUZAJwZq3mxdV8/q+iShbPZKrbKg7DqLLnS6rLcrIeL1viqKtvCtGj8/KO37mt1qfl
         5yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313694; x=1753918494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VETIQeSToxD+7xi/77kQmCmP0iSFmrSPPIDYBqXaHPY=;
        b=jlPzzEsNiq+KJMb2I4Vw/u8ZR2ahJzvXsZfrmTWcsOM1sgW/4tlz7xWg04YMACQoOu
         lQ4Rf7eHuThkWZrX1c6eTVqWNTg0e2/oDhpeVU/wfNpstEIxtfmmmDkQXF+uHaHzrkq3
         PPK7k6iFhBPkC9W6IVXt9/vczrIxj8RYxjo3kOXtrG6avLSJ2WCCjIn3qvVQNSRLAg1b
         1z1LiEQwAFKx+/ceJQZBqcNDLjikq/RpZIS+uM4qfepl/8rMME/o5yfq34SnRr62/wPM
         dq6mPXWEkrvWppZ2v3Xo56pqR8UF6Oyu2K1lWjb139OS4yk+jwP+YyP+6JRKym4PuKxX
         E1iA==
X-Gm-Message-State: AOJu0YwsiOV88l2WCYHwbPqxi2J3FZm56DncFOKVi5qXwtQe1WIelFru
	aw2+LTTOMmjW+w5RjybHXCep0JBC3N9V69BIdOKvOVj+qzTC2AXE7vUoPA/ty1bbJzByZ9j97Jy
	sAaHmA6TRzu95PyaeP/EjWPURdUKKgfF5YwHqoHoKRPCUnm65YJKI0MxJLjG8Zzd1h20ldYm3MK
	bj5SHV6O1JSSOJx0Hy
X-Gm-Gg: ASbGncuKq65CVKX5h9wDUPnn4o8Bt83BUC6E1rmx3yhb9YFn5SmW0S8z6Kqh/zzp6C+
	mz+RAQy3ZUHx89T+9Kq+NgCBATimvGThTumiYPlIt9/7kVobLcYZEKDhOu0hlznQU2SSsKQ5j7y
	jhDqQ+ggjLZwTK4ibG+DUjaMYjK6NYPmretgHLQlA15dNEuSWNFHIy6Vh/wr7L1kfnFQPFOYIY6
	+RUvKIT99iyAb9A9uEX5N8/LbEC7Kddu3Y7wjtOZu9DzIgAvZJUzYlHKw552fww/uwoE6Wwo7T/
	ne64m5tKOv8gSCDxmLVK+l3yHhYeUXbiEf7Ctv4zoGtLbIFcs5T9qjHaLZk0l32Ztlvbb110VnA
	3izqjq2LMmROfZBsYjeNgU9mSrxNvpEhHUw==
X-Received: by 2002:a05:622a:206:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ae6df50f5cmr29886501cf.13.1753313693526;
        Wed, 23 Jul 2025 16:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd4ZvABidHrirpsXt1eC6U/7V153COVGdEYA0JGq5/VQugBlqK9vPAKQlK0aNIGAvjSUJr1Q==
X-Received: by 2002:a05:622a:206:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ae6df50f5cmr29886331cf.13.1753313692996;
        Wed, 23 Jul 2025 16:34:52 -0700 (PDT)
Received: from audebla.rinconnetworks.com (ec2-18-210-179-160.compute-1.amazonaws.com. [18.210.179.160])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632e3cef4sm18805885a.84.2025.07.23.16.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:34:52 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@sonos.com>
To: openembedded-core@lists.openembedded.org
Cc: archana.polampalli@windriver.com,
        =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@sonos.com>
Subject: [kirkstone][PATCH] ffmpeg: Ignore two CVEs fixed in 5.0.3
Date: Wed, 23 Jul 2025 17:34:35 -0600
Message-Id: <20250723233435.3572670-1-daniel.diaz@sonos.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1MCBTYWx0ZWRfX2iaZou/miHQ9 Mx6xq4x34yFqftEQsDvNp3OX9sVpIjbDRcOj3iEdSHlsTYNnjPqnJW7rWe2dD3KlJ7UdA4Oq5o6 qe4rh9JPhx9APRPYGdrLXM+JywtzEyv5iqzL1aI/JAYhOvoIrJhAXLhdjsFtW4qXyqOjCbQof1y
 BWJ8xJdNsgap7oGy2T5CSYjuHdjgUx5Y0a5REqN6QN9knOgS4LAUEjo/B3SEh3RUjvaU+lbOX93 s5smZVFUSR9BUuOd6QBPBNNgbiiXGxyiYynykvn25BBz58P0Pdn5soVDpb/8+NeaSdt5wAiHzB1 EAG8FL0kKp/AIhzy1ZhuN6e5eOXIJfuPY5aLJdGmvlwVL2DNR1yAwtujeuwNZYnFKgdALFswguU wsOvu14A
X-Authority-Analysis: v=2.4 cv=AMT/dNt6 c=1 sm=1 tr=0 ts=6881719e cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=T5sf6WIhJZIZJJ5mX6GgmQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=o0PSW4O2d4IA:10 a=emhf11hzAAAA:8 a=iGHA9ds3AAAA:8
 a=ga-AVtERAAAA:8 a=2uVrN2aLMFY_ZzWK4vwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=HLUCug_QN4oeKp6PugZw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: IzVBLH8wubpLmPUQUkvIAt_dENlJwZ9O
X-Proofpoint-ORIG-GUID: IzVBLH8wubpLmPUQUkvIAt_dENlJwZ9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1011 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507220050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0003c201.pphosted.com id 56N967xS014043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 23:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220815

These two CVEs were fixed via the 5.0.3 release, and the
backported patches that fixed them were subsequently left
behind (although not deleted) by dadb16481810 ("ffmpeg:
upgrade 5.0.1 -> 5.0.3")

* CVE-2022-3109: An issue was discovered in the FFmpeg
  package, where vp3_decode_frame in libavcodec/vp3.c lacks
  check of the return value of av_malloc() and will cause a
  null pointer dereference, impacting availability.

* CVE-2022-3341: A null pointer dereference issue was
  discovered in 'FFmpeg' in decode_main_header() function of
  libavformat/nutdec.c file. The flaw occurs because the
  function lacks check of the return value of
  avformat_new_stream() and triggers the null pointer
  dereference error, causing an application to crash.

`bitbake ffmpeg` reports these two as "Unpatched".

Ignore them for now, until the NVD updates the versions where
these do not affect anymore.

Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@sonos.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 57bd4c5442..8da11f196d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -90,6 +90,12 @@ CVE_CHECK_IGNORE +=3D "CVE-2025-1373"
 # bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/3bc28e9d1ab336=
27cea3c632dd6b0c33e22e93ba
 CVE_CHECK_IGNORE +=3D "CVE-2022-48434"
=20
+# These two vulnerabilities were fixed in 5.0.3
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/2cdddcd6ec90c7=
a248ffe792d85faa4d89eab9f7
+CVE_CHECK_IGNORE +=3D "CVE-2022-3109"
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/481e81be1271ac=
9a0124ee615700390c2371bd89
+CVE_CHECK_IGNORE +=3D "CVE-2022-3341"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D7717
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
 ARM_INSTRUCTION_SET:armv5 =3D "arm"

