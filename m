Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4205F51418
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:15:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63874.1772778398127493526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 22:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Dckzy0Ks;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BhLDTCAO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264afk8526764
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 06:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4yOnlRXY949mG9YCmtv3eMfeGJwxqlG2T3C
	8phsrbxU=; b=Dckzy0KsplsNtFI1tpHxCI0vjAX9EX2nvLHxdTgENhCLDi0LZhU
	GhFQoA/Jq8KoB23+uASSARu0ZoCInTYp3wlPTncFk1/dnrt+v4eoHWy+w6lxd0om
	G+rgjsrzECTpw+hGt3ZpyVf6Htbu/Dfe6NLQAboDytX0IgEky07W84gaJRb2GA3P
	Mn3gPISxVTcERZoJeoVV2Ju+sycZkdtFOogLqVBInaZUw3YOVxTChJF+kjEvdFwa
	XdTML+OiY9he0mrF2Ib5Hww0OfsX604lyx63OJCYmH+IJyDZxET7/tKTo9Hc0Ggu
	QkARPUpbaZeaukQqcawfPvYKt/jbq4VTwlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dkg6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:09:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3598007eb74so28847133a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 22:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772777355; x=1773382155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4yOnlRXY949mG9YCmtv3eMfeGJwxqlG2T3C8phsrbxU=;
        b=BhLDTCAOf32jZ2tGkM67p3UZZlP3U81FtcFfpDF8vVWJsaNx/oOnN11KhfJjSnz2Nm
         1p9dHaQa2hq/RvfRp8wlCy/dGIIHNqJQDR+E6o1uKL/qe4JLfUaMgD2HhYQMJWRU5yXD
         p2Q5SO9miCEQ6SiA2kRZGz9pYxKtmj95oSfECb+2eH7kQPVFbOWHHlxYBv7KTMfSirSh
         lZQM+rVU81/cd0MpOUG19xkBrH30kyHgnyFYkkXVUkthP+JDgtmalUgMRJOZGAfhCVmb
         L9yaxi/82eOAVaPq32SYZvvcGOwbth5nj1GVpfE5EkpWxTo9pDF+1AnUgYMDTkw5P3I+
         WC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777355; x=1773382155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yOnlRXY949mG9YCmtv3eMfeGJwxqlG2T3C8phsrbxU=;
        b=vXGi22DoPpWiDxd+iM5hBH+n5FOVKiNzoIlBq6+NKRHQpVP0acUgqFZjscebWL5SmC
         FeF6aS8l5QARWyK0e4OlexMkXPRg3azKisSZn4kfCDELtmRqdaOd52HnrGv109NxR3RU
         dMN7UbDgrrBMCCX/5dcZsYCAwGixC2GWl+Q6DtBSZ0ZQWQ/alOuVNQGrNL3JOMnNmATg
         g61/L6zBBJn6CoX2O7AmRH2sAtfpVxJIXgda5c+F0TffBOjnQqfZJliiPwKc3qx2TUS4
         8+LeHdAxtREmPh05z6W+IZaycKzONRRBJIsfqswyI72IMcCQ5SmCeCkLqLCCWNfqbMac
         UCCA==
X-Gm-Message-State: AOJu0YzUTBJGDy9V7lS+2vmKwmyI4H1r+RZ7CVCbs15CkRan1RWhbiFI
	xvcclAfE167+cXxUQuDf+WsJUjBj6kbx8fcUFbfpxpV0Kw05jUMKkr/OI4CEvEtnzHlpiudsw+0
	PbFKUXnNHphpnSjfGN1KD7XeIx0+mT8r9olJKTqzhc5kK+khXt87J/Gu8lGVBtymbAyacCz3+Zp
	hoIJmIo2zrPVZRqO0=
X-Gm-Gg: ATEYQzzrbo/FsIcqb0P4Q9ek7B3OLg4EMP5fv05E/M9bEMy7Yfi+soH445JCV5TRcCg
	cyB2TW6wsMbzLno8U+pee7Tt4NuyCuQthQEb8F8oNrv/HCmi2AuhzjzxtdhOKwSWGIEOp83qWCk
	SVet+dZyFpsPKqMtKUomPedqJ4Cnqmu2cW5jAoHcgJS8GVoqwWn5PQHrUMUtvZWjvoJCI2EMzvm
	oIRtOdzuS87CPZ+oubvAD3BGmiNKqcoC1GO8r3aWbEQvuFx9sNiKJztVWKo1lXuDEjIUHtszzhK
	FrWSvgiLB+e6llweWfu3iE9sCDeNHsgd/mujgYHze9qAs3seD8yj3n7ze5sRG5fyhIjQq508MhF
	56uTDEHjKkQnFs6ejlzdvwj6dDbrSuOBXJoC1RiYMMQdmfGVpbEO51ZM3kg==
X-Received: by 2002:a05:6a20:a127:b0:38d:ec8c:7e54 with SMTP id adf61e73a8af0-398590d60b6mr1329456637.61.1772777355029;
        Thu, 05 Mar 2026 22:09:15 -0800 (PST)
X-Received: by 2002:a05:6a20:a127:b0:38d:ec8c:7e54 with SMTP id adf61e73a8af0-398590d60b6mr1329429637.61.1772777354415;
        Thu, 05 Mar 2026 22:09:14 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e183020sm442226a12.26.2026.03.05.22.09.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:09:14 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core v1] alsa-ucm-conf: Backport the channel fix Qualcomm lemans and monaco boards
Date: Fri,  6 Mar 2026 11:31:39 +0530
Message-Id: <20260306060139.3642888-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 7-7YtDSh6bV2mWomve6nq6q2KJ9fYUwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1NiBTYWx0ZWRfX+SvZrsFpZVjq
 QdIGiOw6yW1wmWRddpONtzTuRzPglcmWqWRigxJvsITeutmq5qCIEWN4n/QWuZOXosI8Dlwf3N/
 H3vigPns4uK4TAAPsh7a+A0JpasKujjqWJgY1hq0yXfUdjVxAPsXie+fEvFqoitVxVSbcugT5g5
 09KjQJPondrvAHSgCF074lwEi5QmRm341PgJniV+zotZxGMTkx0/C9DzNdYH8Bjwzy2HpCF2ae0
 Xm7Eqi0Eule4wWNYPt45wblRS/M/JOT5habvYE0zs2a41v8qY4C5VJ+M+yXgI+idhUSghZGojLG
 yQpGCZXyiE30BRp0s4jnb79G5wGz4JYthah4gzKIyHEuZj/TtBL2vFl/0sIOW+yhKx/8eAtzF/K
 M/STmTWzUG3wi9ANnle0C5dz8rpOd3e2dQzzsdE4EuRPwSKHb+Q9jP/b0VVgacjB+27wr/5RLoO
 FRGvMKei5h8Xy5b1ylA==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69aa6f8c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=foHCeV_ZAAAA:8 a=EUspDBNiAAAA:8 a=F1kXWJdj-w32oN3yrIUA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-GUID: 7-7YtDSh6bV2mWomve6nq6q2KJ9fYUwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060056
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232537

Remove Fixed channel setting for Qualcomm lemans and monaco boards to support
stereo capture.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 ...8775p-Remove-Fixed-channel-setting-f.patch | 32 +++++++++++++++++++
 ...s8300-Remove-Fixed-channel-setting-f.patch | 32 +++++++++++++++++++
 .../alsa/alsa-ucm-conf_1.2.15.3.bb            |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
new file mode 100644
index 0000000000..6ebc4f04c2
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
@@ -0,0 +1,32 @@
+From ba4126955f3e145d3a70171b5e8a23aafa157052 Mon Sep 17 00:00:00 2001
+From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Date: Fri, 23 Jan 2026 15:26:17 +0530
+Subject: [PATCH 01/02] ucm2: Qualcomm: sa8775p: Remove Fixed channel setting
+ for lemans-evk
+
+Remove Fixed channel setting for lemans-evk to support stereo
+capture.
+
+Upstream-Status: Backport
+[https://github.com/alsa-project/alsa-ucm-conf/commit/ba4126955f3e145d3a70171b5e8a23aafa157052]
+Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/694
+Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+---
+ ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf b/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
+index 5915d1c..f2be928 100644
+--- a/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
++++ b/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
+@@ -25,6 +25,5 @@ SectionDevice."Mic" {
+ 	Value {
+ 		CapturePriority 100
+ 		CapturePCM "hw:${CardId},1"
+-		CaptureChannels 1
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
new file mode 100644
index 0000000000..db561cdd55
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
@@ -0,0 +1,32 @@
+From 5c7b40c96b6cefd4d1d545d89b6d030248f0bb1c Mon Sep 17 00:00:00 2001
+From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Date: Fri, 23 Jan 2026 15:31:34 +0530
+Subject: [PATCH 02/02] ucm2: Qualcomm: qcs8300: Remove Fixed channel setting
+ for monaco-evk
+
+Remove Fixed channel setting for monaco-evk to support stereo
+capture.
+
+Upstream-Status: Backport
+[https://github.com/alsa-project/alsa-ucm-conf/commit/5c7b40c96b6cefd4d1d545d89b6d030248f0bb1c]
+Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/694
+Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+---
+ ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf b/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
+index 8345129..b60a310 100644
+--- a/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
++++ b/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
+@@ -25,6 +25,5 @@ SectionDevice."Mic" {
+ 	Value {
+ 		CapturePriority 100
+ 		CapturePCM "hw:${CardId},1"
+-		CaptureChannels 1
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
index 0ac51b6c5d..1fbf7b8c03 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
@@ -8,6 +8,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI += "file://0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch"
+SRC_URI += "file://0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch"
 SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
 # Something went wrong at upstream tarballing
 
-- 
2.34.1


