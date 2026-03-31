Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDBA10F9307
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 22:36:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.435.1774996571255163930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 15:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=gpeMRR40;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=eer9fglK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdLbO3882892
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 22:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D4obLuCUEftFDKWTQ26+KY
	3yX/oUwutN11Gyp6gztbo=; b=gpeMRR40EgubN4KPDM2hyUZ5xYGwCXJJ6ZXWiM
	SQAzw5RZRSB/5UM3ZKZBU1XWfgbf1mDQ2s3CmQquRMTGMOuvHFhdsJ2zfc9M04up
	ks8IUNryDV2UNAZ0p9mBc66pybNOimLl9S9SnmQRWhO69asuaqfVWpcUZjNOSyjj
	rYvtasMqR4CnA6GIaaExd8Y12S30VgppUrLwg3zqIY1QwPk5/odmwpUEZJJp8L51
	DEKafQU8K2b02+MJbPvmSv74W4s3nNsXmC1xF9oYgmBtg1u42qIsyugyCzN9mj7q
	iq08yW0DWnI+yKGecdw4K1SC7Np2BgGYEW2T0bgA3JJdWeCQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89utby5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 22:36:10 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56cfaba5062so4487373e0c.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774996569; x=1775601369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D4obLuCUEftFDKWTQ26+KY3yX/oUwutN11Gyp6gztbo=;
        b=eer9fglK8WnpXV7s985g1CjH8cOeVvDsA6DE+ls5hDWdob1UPfS2/khSpih7rXRRWM
         E2l4igIl+eJngvF+K5IuAu5dXwukfiEGzS7R+WKhPn/V61JszN9jFhqPpGNg5tG8uZv1
         3uwpqgzriWZClBIs6Dm+WMLN37N82YKceBsqa11qK7ulE6dOWVRA6g7ij+jv2sIKlvnf
         33F1WcLPSNJ4uKTwCbFRNIyW8FLzY9ihN/FE+xKvzSiqZ3lZeMMT5Fbjizsm4LkBK8HZ
         ldZzrYCrj2tqjJHkFywbcBpCn1dauYTe4mc7lwiq2uUwPaxKmJnVrMcsKnql/o24J7Y4
         nvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774996569; x=1775601369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4obLuCUEftFDKWTQ26+KY3yX/oUwutN11Gyp6gztbo=;
        b=N6JjYsqPUDdSdiJ+hMoV9MHUXqxIJL3jDIvE9ufW4mhhslE6pwSdQgp27Geemk8IKS
         ioZ/LnUELjVWApK/NoLCm842PsDOtTv3cNKFGvKibEHmkEaB7ygX6VZcI0MQ02E5FA0U
         H0OWnn7Jqh5UJd/4k0EAL0dBmY6LQwM/6cs/OWrhIdZ8TycgSk5/wAVkudQchegnzrtz
         sQpMH2/jrCwJAD0S+Hec7v6sMpfrxWsfP6hPx8WThB9GJb/hGFXoA8wLKWM/U4s7GyNd
         DcfAQfVgebQ3NFuaKsjKNElgsQxLKUoV0dkCiY09R5N6GgiM3vFkEjXxol74tKf2pj1R
         4FRA==
X-Gm-Message-State: AOJu0YwsP2iJCKz4mZLYL6NpOWuCjYffQA3xrAQyz09zi3Yp5QzL3ZV1
	sQNzKlsrqPuaH4aAT7/jPslpK8U3fT9BkG9N/RvUdX/ZlRmZ1mJJzSTq6CnN6jqb4D84BrdeKbj
	PE46mdz+8NO57j9Wxim+Ki+PsqqSc/ruvYC9/AZRtcXnIe1pzrrgtc98h84Tz13FQjtw6+3/dC7
	AlMtrYNJqTR+8EGMU=
X-Gm-Gg: ATEYQzyK9ja4bzJMyJeM4OKuKph1Od54xFSDdu5u5c7p+M405DttdJDUWTyfWmsAppQ
	IhdHaKkldI3TshUMcrAmwCqHAx6k+vi2a03JjAJCk3hInPqQDxY6GGqC96e/z3uT/bDDFDIFKls
	mMFVlJ+//3GhO/wxQQBmtD90xC4/9ncQ83lG97y5Yuy3sdHCfCoBUCyEQFhy3JjTHoBD56RpLoJ
	+Xne6p/iWBX0NXm3epZKty8kfc5+AVxwIWwWCAA/VzN/2Otzqp08gfZcNuVPHN/FkKpM7P0IPLP
	m5jUZx7veueTzBhe2x0yK5baH1c5XoKrtkWMtn7P7lVLICMh3rxEgm+V27yUlfomzb9lUV0r4YE
	avnEHpV+uTPpiBEViMF/rlCdyAWDqXw==
X-Received: by 2002:a05:6122:2212:b0:56b:7cf0:cf67 with SMTP id 71dfb90a1353d-56d8a96d7e3mr763813e0c.15.1774996569203;
        Tue, 31 Mar 2026 15:36:09 -0700 (PDT)
X-Received: by 2002:a05:6122:2212:b0:56b:7cf0:cf67 with SMTP id 71dfb90a1353d-56d8a96d7e3mr763803e0c.15.1774996568652;
        Tue, 31 Mar 2026 15:36:08 -0700 (PDT)
Received: from evatuf ([187.65.214.56])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d88e0ac0bsm1974381e0c.12.2026.03.31.15.36.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 15:36:07 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] busybox: enable mkfs.vfat via config fragment
Date: Tue, 31 Mar 2026 19:36:02 -0300
Message-ID: <20260331223602.2935829-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: 1i72yXDnlEo510UID92bjrvFCBEuvUqI
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cc4c5a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=5XGjxTY8yYkUmB1D1iF5Cg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=J0Tn2xNtAAAA:8 a=EUspDBNiAAAA:8 a=dD4pVHFDu7WxAmAtIUUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=9ZcRxastL33iXWX1AWsW:22
X-Proofpoint-GUID: 1i72yXDnlEo510UID92bjrvFCBEuvUqI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDIxOSBTYWx0ZWRfX18n7v9xP+3Tf
 QnmyVO+ebdxLArEsfc0sIaDo4CdLYkMq20iG/SW4KGhIjxJrisg++zdkLoZuozni0qUEdvS7uDo
 xumEhfXg/JP5iYIDW8OL+j6oMZ74fWqBMuVw7MBHmXYnq4Ud7Cv4XkPXy5LOa1fAsJWboGyT0CH
 WY+WwAUKdei3RvIIAdnHy9l2dbLuPXm99r8FAjWyqzTSuL8sxtHWvebPEIfPPEEvVtugXLs2XaR
 Jf18Ss8FVK3tduXWPKvGfBtB+s8XkjJJmtDFtqoULWYMv80OtIh6Kaab0WbN8V1eURwy8RPaR48
 XcXE917NT16RWnWrGp1ref1VHbiQ4cBJiYx2+q2umarCDhDz+HJuwIIkS4LJIRNJwyijaI5Mei+
 x3bO4iPmK/XskmwrMoUe8bsqlbQ5VqrOO2EBN2gStPH5F74W3oNIJAkr5b5M3yh98TSCaEHWZiT
 RgA5N0NKa0rmfekNL/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_05,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310219
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 62VGdLbO3882892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 22:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234319

Enable busybox=E2=80=99s mkfs.vfat (mkdosfs) implementation using a dedic=
ated
mkdosfs.cfg config fragment.

While dosfstools provides mkfs.vfat and is available through
update-alternatives, it is licensed under GPLv3. Busybox also includes a
lightweight mkfs.vfat implementation that is suitable for minimal images
and systems relying primarily on busybox utilities.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/recipes-core/busybox/busybox/mkdosfs.cfg | 2 ++
 meta/recipes-core/busybox/busybox_1.37.0.bb   | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/mkdosfs.cfg

diff --git a/meta/recipes-core/busybox/busybox/mkdosfs.cfg b/meta/recipes=
-core/busybox/busybox/mkdosfs.cfg
new file mode 100644
index 0000000000..29307b20fc
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/mkdosfs.cfg
@@ -0,0 +1,2 @@
+CONFIG_MKDOSFS=3Dy
+CONFIG_MKFS_VFAT=3Dy
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-c=
ore/busybox/busybox_1.37.0.bb
index 2a38372339..fbb0edb0fb 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://mount-via-label.cfg \
+           file://mkdosfs.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
--=20
2.53.0


