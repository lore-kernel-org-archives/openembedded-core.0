Return-Path: <igor.opaniuk@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA514C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:15:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18945.1784898950729323906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 06:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=miCzJQBA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cF219+Kp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: igor.opaniuk@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OCmEBK2825687
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6wXq0ltA6g9owFp8TB71mhvH/yk0C4blDQR
	1BrgO12A=; b=miCzJQBAghfvl+0qhzjASBUbjYYiLNkzO9fL2+YYtNEXyrZ2vwf
	Xnk3fpqnJ6EMPuwmI5/2nc6FNW7SSt4cxnmtruR85IfaYkh2cT7RYIKwkS/1fzuV
	CxmeIu2zsJXnO8ngXL/QsEUNm+CywuLrD/EH5h+8dF8CV1Z7k9CCyMBFXdaIFScq
	R6fD4fKvc85XDxIQL0ZlN1C9vzSOE9yj6u2KvMkvvxLfsWsvSwehiqemUXT/43ej
	haShlHJX24y3KJfrMD2+qaqfHdw3L7Ur0m6qiN781C40Gq3pXOHnQTDSnrgvN7UP
	9Jq4BG5RxVIf2Y6nPSvLHIJDjSrQYY5Kydg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj82t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:15:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0f0a0760so10784921cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784898949; x=1785503749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wXq0ltA6g9owFp8TB71mhvH/yk0C4blDQR1BrgO12A=;
        b=cF219+KpReTsMbuJ3faH5hXgDog3n8u5sr6tFe6VvOkLu25przFY2SbHqzHnXFlDq5
         tKueWykveCNwiGi8mOHm6H16inj6rb1Vg2hHPVJe3O9AO/kVssubj45fC7mE1p3xscDM
         qlZb5qt51QErelwvCUYw3+K/q2aDrYl2Lh+NykuhTNKJFsR4XIu/nATBOS8RQ3c69nQS
         QSPEksrdHasozTZr4L/3VMX6UwjlJc0A0ZZJgMs6yo2SFPrTulSUjf7mh7TtaLuPNh6g
         CWrZL/amlP2A0y4nMyJDiJkaSzGBpb88PB7MJGVIUyVhvO38YlbTmnD+nCmkVsX91/k8
         7CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898949; x=1785503749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wXq0ltA6g9owFp8TB71mhvH/yk0C4blDQR1BrgO12A=;
        b=dSS4IY4606jc25CP/mjyBGJTrEtxYOZYztd1cLpNRS19dIzXQGXXVOOUHfwN/rAcI6
         Ep8yNN3fCI9Mx3WU86cmmvEzs5Cfyy3jqvUlBEE4usFo5s0jvNlEYrvH/u8dVjY6f+JA
         JYpvZRDkIUSJvCP+fqeb8tr8dkH4Z5pvoFl5WMcnIy7fGXKnA9WyNyJSIoFaG8gPZzHg
         dsVFjYCEunuEnJ0OcX3t0xyDvU++pCDaVkXhyYv64hkKTKDn8dNVfvNPBW9DLOwksfHM
         NOELkwHddctWPfEtbcb8IFdk+EX/smR7QEDw0JyW1YzUocLK7tPC8nLWtEAqPtHnoV3K
         zgQQ==
X-Gm-Message-State: AOJu0YxL0GdV2NXWMlrEdPfEp0cb4nQKglEB9MUOPsFvBgeTvqlFaMtw
	bPTEJ24Y4fWSNyo0HtaU4n74r51Q9w6ZySTPTDp+2vQJZKfkzsjkjZPIXLqsZscmdyzbBW/eMCB
	V+dg2JxiGkcZTEwSD7SMmd2fMosC8CIp7pxu5FvOkqG8assNqMnxXphvbrKM92JA5cUjQPutUtG
	9V2S0U8VIYeL/2/UA=
X-Gm-Gg: AR+sD10/593DR74iy0Q3Cl3lX0o0Z2V0rMF7tj4+USrAiAH8HDftVuH1ZjUpqPxTZ8t
	N7ma7msJEewFPuIsj0mFhR8kpmZneau4bB5BvX1C/Jy9O3mwrudoMOJzMEMXrHX/tmAYlXIrYFF
	55atlxZOSgbrNLiN+u7pdqCbvcYkeYVW8d/Xm2GrsYDI8TNPCy01X5RzMMSB498dnIzr3e8l2x2
	udtf2SDSqXoGBaRWAz322jaHv+LAT03usYp/msKRvDUnhLzwntv/yFY5qnuk3hICjtZ5IvSo40s
	tEWVxj9PtOqmxd2k4fi0djt1g6AcweENOjiqSD609xVZ3XJNWtdI9h4dk6ig0zVENS36N61BwTe
	oSjgdrUW5mlFIlIApTazCnSq2vR5SaVPMeeh+RXee
X-Received: by 2002:a05:622a:4ccd:b0:527:8dc5:51b9 with SMTP id d75a77b69052e-5283dee88a6mr70451671cf.56.1784898948662;
        Fri, 24 Jul 2026 06:15:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccd:b0:527:8dc5:51b9 with SMTP id d75a77b69052e-5283dee88a6mr70450441cf.56.1784898947327;
        Fri, 24 Jul 2026 06:15:47 -0700 (PDT)
Received: from t14s-g6 (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c7880dsm24952579f8f.37.2026.07.24.06.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:15:46 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com, ricardo.salveti@oss.qualcomm.com,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [OE-core][PATCH] libzip: import recipe from meta-oe
Date: Fri, 24 Jul 2026 15:15:37 +0200
Message-ID: <20260724131537.1058940-1-igor.opaniuk@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a636585 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=MlrH0q0GAAAA:8 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8 a=omOdbC7AAAAA:8
 a=v3nXkY4fWbSNsAuyJisA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=rsQC-oSfGZFnTtIp--5P:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfX4OwC67cDDF0k
 iU93zomsbDOKQf4mV0jb6yqFofv9+t5d2lRwC5N5v2WBG0HDTg59gfQ6SQXJitnazsKCvWlNMDs
 Q9/5gX0zG66r2+Z2XpbmrVIuh6V17F4RCBe6ePhYJ54K3y0ltn8YG0hNy6URDKI+4Tb3w2prIOj
 6hz6KBOWfnQtRiyjPmYIz2m6mJobrIuDMQDDnMHTt1pzdtnlgmqcNtq7tFsXtYKXM9EFhaDvpda
 4onDap+hFlVEjsKg/EwqdysgFKCQUnPEqAzchmb4vO/5+vuLNcfijE+QFrN8DuaLYsre8tHzbI+
 NTR4ZCUmCpD9q9BYwFC1gGoA+EJbLgWXzZO+nEJfZuVSCoLWYbZrmpHOp1WQXDFhwL2SdSfwXG9
 9TpxzF68k8G5mcRWGqyCCu+a8vEQ018xP/VXXPPU2lZo63FUgoxs+6WRResOSKY2WaGXiZwfNfz
 g6IR+BcQQXyufiJZWLA==
X-Proofpoint-ORIG-GUID: l0eD2ARNL86_SxU48rMs-pvQF8SgmdHt
X-Proofpoint-GUID: l0eD2ARNL86_SxU48rMs-pvQF8SgmdHt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfXycUzL4V4ExP2
 hmht8C6//b6Xm1m+GLfbqy+N5uywOz4GC7T3WHsyA2Tblg8RdhvzD9MaNdUQSd4x14IZVg3jsoF
 xRFkh1cEJ0OjS//GzMiFLgXQX8YJ2HE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241932

Recent versions of the qdl tool [1], used for flashing and provisioning
Qualcomm-based boards, depend on libzip in order to flash images
directly from zip-compressed flat builds without unpacking them: the
device requests individual images on demand (in Sahara/Firehose
device-driven order), which requires random access to archive members
by name. Neither zlib (byte-stream compression only, no container
format support) nor libarchive (streaming, sequential access only)
covers this use case.

qdl recipes are provided by the Qualcomm BSP layer (e.g. meta-qcom [2])
and board flashing is core BSP functionality. Recipes from other layers
also depend on libzip (libsigrok, idevicerestore and php in meta-oe,
localsearch in meta-gnome), so it makes sense to move libzip to
OE-Core in order to reduce inter-layer dependencies, following the
example of commit 1a0196a794 ("libconfig: import recipe from meta-oe").

Changes between meta-oe and this recipe:
- Added SUMMARY, BUGTRACKER and SECTION
- Fixed the tools and examples PACKAGECONFIGs to use the actual
  BUILD_TOOLS and BUILD_EXAMPLES CMake options (ENABLE_TOOLS and
  ENABLE_EXAMPLES do not exist and were silently ignored)
- Fixed the tests PACKAGECONFIG to use BUILD_REGRESS consistently
- Dropped the mbedtls PACKAGECONFIG, as mbedtls is not in OE-Core
- Extended BBCLASSEXTEND with nativesdk

[1] https://github.com/linux-msm/qdl
[2] https://github.com/qualcomm-linux/meta-qcom
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-extended/libzip/libzip_1.11.4.bb | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-extended/libzip/libzip_1.11.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b49386a27d..eac288126a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -469,6 +469,7 @@ RECIPE_MAINTAINER:pn-libxv = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxvmc = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxxf86vm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libyaml = "Wang Mingyu <wangmy@fujitsu.com>"
+RECIPE_MAINTAINER:pn-libzip = "Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-lighttpd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-dummy = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-firmware = "Vivek Puar <vpuar@qti.qualcomm.com>"
diff --git a/meta/recipes-extended/libzip/libzip_1.11.4.bb b/meta/recipes-extended/libzip/libzip_1.11.4.bb
new file mode 100644
index 0000000000..36f7d1faf5
--- /dev/null
+++ b/meta/recipes-extended/libzip/libzip_1.11.4.bb
@@ -0,0 +1,30 @@
+SUMMARY = "C library for reading, creating, and modifying zip archives"
+DESCRIPTION = "libzip is a C library for reading, creating, and modifying \
+zip archives. Files can be added from data buffers, files, or compressed \
+data copied directly from other zip archives. Changes made without closing \
+the archive can be reverted."
+HOMEPAGE = "https://libzip.org/"
+BUGTRACKER = "https://github.com/nih-at/libzip/issues"
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a9d2078f35e61cf1122ccd440687cf"
+
+DEPENDS = "zlib bzip2"
+
+SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
+SRC_URI[sha256sum] = "8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b"
+
+inherit cmake
+
+PACKAGECONFIG ?= "ssl lzma tools examples"
+
+PACKAGECONFIG[ssl] = "-DENABLE_OPENSSL=ON,-DENABLE_OPENSSL=OFF,openssl"
+PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF,gnutls nettle"
+PACKAGECONFIG[lzma] = "-DENABLE_LZMA=ON,-DENABLE_LZMA=OFF,xz"
+PACKAGECONFIG[zstd] = "-DENABLE_ZSTD=ON,-DENABLE_ZSTD=OFF,zstd"
+PACKAGECONFIG[tools] = "-DBUILD_TOOLS=ON,-DBUILD_TOOLS=OFF"
+PACKAGECONFIG[examples] = "-DBUILD_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF"
+PACKAGECONFIG[tests] = "-DBUILD_REGRESS=ON,-DBUILD_REGRESS=OFF"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.53.0


