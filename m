Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138BC5DF66
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 03:03:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5390.1786676621403627423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 20:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hzudDaY2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Mgu0V+Aq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E19br1241803
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rHKiORMflsvgbyrsvDyc+ss5lq4T/J69ijM
	jF4o8JYM=; b=hzudDaY2+ioq2qYjz290ejwOlD8190rR4CkT7qQC5AeYSj4jF8y
	HuUZ5MTyCbvR5S2irS+xcz8Ixka7vVvcc3MapGLiQmVSv3Je+1IV+qvpmMIcza9X
	91kLhbSh1nT4G2ONSFR+EmgKVBO/Bd0D/F3Y5W6IYN48sipCIOq55mut3jyZuBKG
	RspMJRW3XNpYrKiqxgJM3rUpBXuCq5M/b3qOgOuK5jdAMNEVWgUBn046X2/SgLze
	7lQ2HNGCFVafOFmR4ed5WeLpFVcxh6RdA/6XDD3mJvZhjSU+jTLugzaDTDuRJeaj
	bNCTqloM1pMpOtU1OIoI5Y56dLmlLaQEUAA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1utcha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:03:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1914058b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 20:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786676619; x=1787281419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHKiORMflsvgbyrsvDyc+ss5lq4T/J69ijMjF4o8JYM=;
        b=Mgu0V+Aqkf0mGzCPQDEpAPnu6m0Xb4Lhf5dutkaRGXD2CukcWjvBeIVDCyliq6ou0E
         melyvNflGDNfL5duurw12uSZRmZMX/yxOX6+Cr62YZGTWGHn50MYi0I5bvhru0m5rZRb
         v7PXfHXVJcJCIawr3oPRA0lmtSAMnE6CrF51kCf6/oBQ5XsWt86HaaU60N/18Izf4FE5
         F0t9/WdbbKS5cDgzuBOA/D+Lps2ej94huh48OCz2C4T/QfxNiCXffjDAIKVT+LdkvELb
         GDd2B+gfWcQoAnzPDz5ceqoPusJnxP39vmOZGzywHmWPR4S0Yj1X0jSlKBBauRS6qV4m
         5lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786676619; x=1787281419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rHKiORMflsvgbyrsvDyc+ss5lq4T/J69ijMjF4o8JYM=;
        b=sApUk1ec3t5q3zK5gsf55Mn7nEn6Y9mJAE6WE4h6b7xgUISYqgDjlXPYJeuHMkoeP5
         6pkc9bT0MwnKdEaPXfeIv4oeTTnwVvMIQtHkKxh3W+xwPPh4eu0aj5mY5vqiiM24O7vE
         SUimhUuZ6vGJSI6BZf3rkFB5YNRN1ozKzAW97gI4UHtnm0rJfIgRzuPtOlHoG0Q3vmL2
         nDeyBhH3zeHLV37LKiqqD/jjoUbBGrZiM4RIAEINAiEIaCs+Es7WBil1O2XlQGqlk+/u
         JazgIItps0fJP+mXQWWQXMH5PIe97Yywml6lc0o6I9xr6LD2LVB4Tvcl/Nd4QoIL1Xlz
         ep6A==
X-Gm-Message-State: AOJu0YxMjrYMKVc09LNyDVQ8rBssu+rn0lwAFwMC4FtDv4xzNDLuZQj8
	km0W9opdMaKmSpKplP4ojniw1D0E6iqKUD0Vk61DlGyUIymcB2Geiz8FYuRjO6flOWJqG4sQU4J
	/DIAhstrB2GhdDrCDGuq2ilGPVw3HZE7NwkwWKWXgzmfKRiqucuglk4vQB5SOROz8P5MpexPXBM
	bGWp1I/isoqiGiFKAWRw==
X-Gm-Gg: AR+sD11GIaOcBL2vb9RJWFMCITGbf2jW/wcmsw8fuvMZhFMgjPPLQlm9oNdAxA63rNC
	fUT60D4h6EEEVkbRN49+Wn6a7RtvHUsDJJUdZau6i+dO0R2hzE3qAVVP7VJ+qMHk1QZpxnmjxvQ
	AxoR8iKOzhdLPPEkOkWYSsb0Wgs7S9g9tukG9i9/7qACS7+TWlfngSrludBreBT6Ggim8uNXCOD
	fOShepjcZSLJQpPwZRADCofgiQ2ry5Yls1VTIZOS1R7e2JIt2tdiehMb6iVNfPSes4OmaYeDAOv
	vtwsQStieEAbsbz3PTRbrb27h6+R2qCl9dnLaZZzdFTwevBwavGoY/23fqkn+RFFvNEJF0ntHwy
	5BBEyqtgbO0oquSULAD8o0hzJmnF4TedRMt84fQimwFEN1YHoJszYx+D4NgRh+98LdZ6ept9yhJ
	dVOmU1rUkU/1i+eyuAXkdD/RbetOkWzBkrrEMfcKc=
X-Received: by 2002:a05:6a00:6c87:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84fdc77ab89mr2750945b3a.9.1786676619017;
        Thu, 13 Aug 2026 20:03:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c87:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84fdc77ab89mr2750878b3a.9.1786676618153;
        Thu, 13 Aug 2026 20:03:38 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc5a4e828sm1550081b3a.44.2026.08.13.20.03.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:03:37 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uboot-sign: list the TEE loadable behind U-Boot
Date: Fri, 14 Aug 2026 03:03:28 +0000
Message-ID: <20260814030328.192752-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0o6GrIk7sBB2nJg06Xkr71c9m2bsL302
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAyNCBTYWx0ZWRfX2yNyz6aIdrcu
 1hnJXd7kIdvY+2lvsKZc7s/LuB/66f7zSpMDCJv4gANdpH5/WooEV7pjJCnjMsPy/++DJQ4/8km
 sbij3aeBbKwlGvP6mXZtd0bDfjEK2EK+OwNW7Q5FXsHvt+EnjLSzr/3WA5txNkPhsUEhlSTdD9T
 frn19VC7kF20ukkV8ah7nTPrxoW7fnKZOdtrHZ2WGob+zFQEPOqXClbYhlHMzhpKwEfYL4Me50d
 Lq5SVuCTsCSpUylYEgTHG6N+jBcyjzUDi+VX4UdtYfN+gzmvXCx9+aqrYVHvuFxK9DhiBmNEvIB
 NrM6VONWrtSPQ55AAy82ihX02iIxnuIzbcMNYFAXVBhVnfiFef73PaXkvGBmqYwjCKQZVAoTMQm
 wwPMYj4pBZh22028geYg3Duk3aA5DTzOsuQQSiEe1HpI5MYfF3rn5+29WemPrQ+767YhwEPV4L/
 5h9a1qzhkYnCDUhRSbQ==
X-Proofpoint-ORIG-GUID: 0o6GrIk7sBB2nJg06Xkr71c9m2bsL302
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7e858c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VTT31UuMaAZhFUJcaEgA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAyNCBTYWx0ZWRfXwUcOTN1FA8GO
 L40jfKyzl7EFXbk+EkHQz6n6t44gXQF14cANItCDVcMCU0AX3zmUMvq/1PLoeKNkIohqP5W4qX8
 6HQ7tQSxleBtqZFobRdgsX0X3gYTEqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243393

uboot_fitimage_assemble() prepends the TEE image to the "loadables"
property of the configuration, which puts it ahead of U-Boot. That order
is not only cosmetic.

An SPL that hands off to the ARM Trusted Firmware (CONFIG_SPL_ATF)
describes the images it loaded to the next stage through the /fit-images
node of the device tree it passes on, and common/spl/spl_fit.c only
records a loadable there once spl_image->fdt_addr is set. That happens
when it loads an image os_takes_devicetree() accepts, which is U-Boot.
Images listed ahead of U-Boot are therefore loaded but never described,
and spl_invoke_atf() in common/spl/spl_atf.c, which looks up the BL32
entry point by searching /fit-images for an IH_OS_TEE image, finds
nothing. BL31 is then entered without a BL32 entry point and OP-TEE is
never started.

Append the TEE image instead, so that the assembled order becomes "atf",
"uboot", "tee".

This does not regress the configurations that work today:

- Where U-Boot is the image selected as firmware, it is loaded before the
  loop over the loadables runs, so the device tree is already in place and
  every loadable is recorded whatever its position. This is the shape of
  the FIT that arch/arm/dts/imx8mm-u-boot.dtsi describes, with
  firmware = "uboot" and loadables = "atf", "tee".

- Where the ARM Trusted Firmware is the firmware, U-Boot has to come
  first among the loadables, which is what this change produces. The
  binman description in arch/arm/dts/rockchip-u-boot.dtsi already ends up
  in that order: it selects fit,firmware = "atf-1", "u-boot" and generates
  the loadables from its images node, where the U-Boot entry precedes the
  OP-TEE one.

- Nothing else in the SPL depends on the position of the TEE image. An
  arm32 OP-TEE image is recorded by spl_fit_image_record_arm32_optee()
  wherever it appears, and the fallback that takes the entry point from
  the first loadable only applies when the image selected as firmware
  carries none, while every image generated here is emitted with one.

The images in the FIT and their contents are unchanged; only the order in
which they are named in the property differs. Update the order the
selftest expects accordingly.

AI-Generated: Uses Claude Code

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass   | 5 ++++-
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 33f9abdb79..66d8171c9f 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -458,7 +458,10 @@ EOF
         };
 EOF
 	if [ "${UBOOT_FIT_TEE}" = "1" ] ; then
-		conf_loadables="\"tee\", ${conf_loadables}"
+		# Listed behind U-Boot: an SPL handing off to the ARM Trusted
+		# Firmware only describes the images it loaded to the next stage
+		# once it has loaded the one it appends the device tree to.
+		conf_loadables="${conf_loadables}, \"tee\""
 		uboot_fitimage_tee
 	fi
 
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 451878aafd..3d8bdc4a74 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1798,7 +1798,7 @@ class UBootFitImageTests(FitImageTestCase):
                 'entry = <%s>;' % bb_vars['UBOOT_FIT_TEE_ENTRYPOINT'],
                 'compression = "none";',
             ]
-            loadables.insert(0, "tee")
+            loadables.append("tee")
         if bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE'] == "1":
             its_field_check += [
                 'description = "ARM Trusted Firmware";',
@@ -1850,7 +1850,7 @@ class UBootFitImageTests(FitImageTestCase):
             }
         }
         if bb_vars['UBOOT_FIT_TEE'] == "1":
-            loadables.insert(0, "tee")
+            loadables.append("tee")
             req_sections['tee'] = {
                 "Type": "Trusted Execution Environment Image",
                 # "Load Address": bb_vars['UBOOT_FIT_TEE_LOADADDRESS'], not printed by mkimage?
-- 
2.43.0


