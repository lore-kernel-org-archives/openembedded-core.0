Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E16C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 09:25:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3617.1788254695860790931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 02:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SDqUa9kL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cEB1OT0K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JiP1975509
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Sep 2026 09:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VGJw3xveo6jp+vfkJLjdJP4ZKjddhEZmRGR
	NWpW7qzI=; b=SDqUa9kLM3AwEh9t5qQ27KiA3LmFLI0vm3XXg4rQ0DbuYf6OooG
	vWRCpADp333U67yGsn89x50s9G5s5fDgnTs3KONsmtA9ZJWK2ZwzzZUam5qwIDqn
	Zfw/M+whgoHNU4DrnTOi70XdrpsGZh2Y+/1c+PL20mZfXIEfFU2ZZN0PfE/xT/t3
	VQ92G5MG/YonsLpqzWDU/4sx5UDkOzKjzFAtT2O00m6rigc4uX9YubxPKe/UMDK1
	g+Dh4F2xppUfyNgaS8XWR2CijiaIxP5EoDKm7EdoXVFghOWhC404RUs65ll0vwM7
	Ps2zDqPnrPJ4MPiyudK7Qyux0G0f9u4dtmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r1jck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 09:24:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso595200985a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788254694; x=1788859494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGJw3xveo6jp+vfkJLjdJP4ZKjddhEZmRGRNWpW7qzI=;
        b=cEB1OT0K/npodPl9Am2r0512EEgTX4amR29N108D6nomDzf6Axfq291mvk/tZkAElz
         RIv3X4TUQvJDFb/zvpSdvAK9WxIiCKCK7f5wbje7l9MF7GaypC8Z6ASk32pMdL9vkKHv
         F05JCGyiU30V0xJh7Qo2HEUYaXdzBJwlXLkc9MX5fzEzNltXCE3bk7+nH2WlkbsJL0Jc
         bRbOY8mKY8uCVrUIniw96gCHd+T33M01aALkHb2mUzkZxG/HNspSqvDKtY2FVPmCV1Q7
         gAXfWhTSfXsBYJEaic8ZHeXsZAzAQAH0rDS67POKUpIcEt934TNikIVAv8LBhq9nfE4E
         /gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254694; x=1788859494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGJw3xveo6jp+vfkJLjdJP4ZKjddhEZmRGRNWpW7qzI=;
        b=DJITBGnAA8KcqLpC2bDNbuAsXeW/d2lLp+yL6oSQI8c/7QD5JemHuLAbioAwa2QJDz
         aYWzeBJbzKt8m3OOnEFZlmDfc38/5lpL0JVu/cdaLR8Cp/2woHd0P8+D8xohiYk8kJ0L
         NW8Gnqpy7PQyP+8vRrZsBWQKuPjJREzes0iowu8XpcTtEZ5kF50iIbze1/lXTlbuzoLy
         4MpzBXECBA1U9esMmnJJ7NOgJv5xSCRsty82zCUqRdFTba+u0fegVji6pQmnp0IqNibC
         EV3t4E8ogXY/+Sc2TY7ZntLu07288c+GFTEHZiRXaozBmSZ/XSDj8RIkjeEDt3ichIJp
         y3rw==
X-Gm-Message-State: AFuF++ktiCBCVIUdBpsGLzl6wZCVEZTV2l/7PCdvp8097FNdaDoEqXyD
	bj9BhDS7GgJSpLrnufMGs+BJzgSWwnwPT1MdNzJyS2Tx7QXcHN5XYHOtgT97Bk0BwBSrAly0vGT
	IZi9WI6ltLFjIi7qok/bP4XGqkNw8oSzDOgictT1rDGY1OZxU0dMNqsQqmUl8gzYFitLXi09aZR
	44NiFTGcl3ltcFce4=
X-Gm-Gg: AR+sD114f12RYMjx1E8zrPIAjA6eplmjzBx+LXE7xAAWKjEPFqxL7QxQ5Av5fTBt9Ik
	d1XzJUAO6Xph6w7/gOsBbgLWiQaYJSwIZJdFL3Q4vHEMvv0FTRjyN5peSZK9zB5najuWHDYFs1p
	x6PsLyJgwKv82lFRbRPGS5qN1IdkaLZJLUCqrtkLfTz6fASWU2djAd3Bf3WaeHKbJjVKOGnmien
	B12N3rk6amxgF/uyW4lly2w4GbOd3HLqqCLRACEh85SvYfwAL5BPSC6MCZA2p6x4FfWaJh4vwup
	7LJO3fTrnIyw6OBSjBWKw6/thceVJvd8wYaVtbVY2k5c+NI9E7g4phxH3/2ek89OuEkYp/m/IBz
	T5BAEREjS5epWpQ==
X-Received: by 2002:a05:620a:29c1:b0:92e:520a:ffab with SMTP id af79cd13be357-9394819e6f6mr888066885a.38.1788254693700;
        Tue, 01 Sep 2026 02:24:53 -0700 (PDT)
X-Received: by 2002:a05:620a:29c1:b0:92e:520a:ffab with SMTP id af79cd13be357-9394819e6f6mr888061685a.38.1788254693111;
        Tue, 01 Sep 2026 02:24:53 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9267c369sm236445485e9.3.2026.09.01.02.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:24:52 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] Revert "python3-pycairo: inherit python3-dir not python3targetconfig"
Date: Tue,  1 Sep 2026 10:24:31 +0100
Message-ID: <20260901092430.915029-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a9699e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=AJ841pqZiyq3luhBG6oA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4MyBTYWx0ZWRfX1A9BwRK7D7di
 eCM3Y621DzxKypImK76nDIGvR1BeX3m/uH7aqkm+EQOwhRsQXNIpKNMZmfge7kFaR6rZSU5y1IJ
 EwtDuxgU0KeyJODglWMOCNrBBxygHycb78GvwzFEUmh/mPCYAHsHZMzgOS7CBQ16yjh/S3DFs2Z
 zqt780wR4hsdM+8BLlsDBeFv6u/CZoi+my519HBRbZQ2hDosprzX/SrTI60hgsZMIHZBU6uznvE
 T7g41heINfW6S3MUq/L+jNHDy/t1MTI7GNdR/5yZBS7gAvevOxT6cNpSAuwbcESex0j5ngiQOU+
 WBc/MZk1H/DbMyC52bpyOIF+OOQHkkMUl2MAdbQe0aZJucgV9YScsyVr3Lv1TOjAf+9eMKlVJai
 FlCjoho7D/ihhgJDeuiPAtt9SH6uON1K8P1nLQb0rUbwzH1oQuK8kUSWBP2Dp0RPQ42PcLsxmWA
 8nVcSniplYnz7/d/8PQ==
X-Proofpoint-GUID: s49io1jM0eHQqKiiCgQOT22KgCPBbjhF
X-Proofpoint-ORIG-GUID: s49io1jM0eHQqKiiCgQOT22KgCPBbjhF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4MyBTYWx0ZWRfXxeXCu2Pi0NqC
 KPFIFIUcE0IDmJ5pAaKqKI5eTIg+OevbCaBphnm40hHUMujBS06MIDYXFgfpTMoC+l5rkpLFYCR
 apDg8LVj5CdQ0cTL5K7b+3hF7wIRzis=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 09:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244813

This reverts commit 7aa548771b7d405e215219360bd60c1b6efe9069.

Without this the arch on the library name changes from "aarch64"
to "x86_64" when we build for arm64 target.

Analysis of buildhistory shows that the content is the same,
only the name changes:

# --- a/packages/armv8a-oe-linux/python3-pycairo/sysroot
# +++ b/packages/armv8a-oe-linux/python3-pycairo/sysroot
# @@ -9,8 +9,8 @@
#  drwxr-xr-x -          -                  22 ./usr/lib/pkgconfig
#  -rw-r--r-- -          -                 162 ./usr/lib/pkgconfig/py3cairo.pc
#  drwxr-xr-x -          -                  26 ./usr/lib/python3.14
#  drwxr-xr-x -          -                  58 ./usr/lib/python3.14/site-packages
# -drwxr-xr-x -          -                 174 ./usr/lib/python3.14/site-packages/cairo
# --rwxr-xr-x -          -              303544 ./usr/lib/python3.14/site-packages/cairo/_cairo.cpython-314-x86_64-linux-gnu.so
# +drwxr-xr-x -          -                 176 ./usr/lib/python3.14/site-packages/cairo
# +-rwxr-xr-x -          -              303544 ./usr/lib/python3.14/site-packages/cairo/_cairo.cpython-314-aarch64-linux-gnu.so
#  drwxr-xr-x -          -                  20 ./usr/lib/python3.14/site-packages/cairo/include
#  -rw-r--r-- -          -                8778 ./usr/lib/python3.14/site-packages/cairo/include/py3cairo.h
#  -rw-r--r-- -          -                 660 ./usr/lib/python3.14/site-packages/cairo/__init__.py

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/recipes-devtools/python/python3-pycairo_1.29.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
index 19e41baac4..b70d1f177d 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.1.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "4fbd26b4af24c9787d84cf5448e34eb8dca064b732479aaecd03109520
 
 S = "${UNPACKDIR}/pycairo-${PV}"
 
-inherit meson pkgconfig python3-dir github-releases
+inherit meson pkgconfig python3targetconfig github-releases
 
 CFLAGS += "-fPIC"
 
-- 
2.55.0


