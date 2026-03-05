Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79232F513E4
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 22:01:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55985.1772748056051944046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 14:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iwyPVS7T;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hkTO43wt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmgxo2304096
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 22:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aR50oeDCtiUuxRpnrOb/rn3sb2dzh8u0KO3
	68g5jioM=; b=iwyPVS7TtnleNBIUyK7fRvR64dj/ZUhCiWUXtpx8FrwuKPYGy5X
	yenrYglSrTaph567nReNTbq+9vLsUVuSVBUlsZ+j6rSH7poD0b8BSruZuB9fiRwi
	GL9EjwGRCi3CPWrLLox6tivqD1HK9FMSqWyysCUCDuFI2ZY582774fAxz35NgCIY
	+3Wzxl9yWmswM0U7j/FB7v/71x/bS67/MEx+OFmU6SwE/6f8Q7G8HslfYuuesJ6l
	pZrQcqBiU0uprosaTJ+4Yn4UOobDUfxotsvv5F089UyrcwaMmnU9CG0mwjL13/ib
	H3qsNAZPXDEa1S2egWtdQaOAaRckPqAihOg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u3x5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 22:00:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso6062794eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 14:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772748055; x=1773352855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aR50oeDCtiUuxRpnrOb/rn3sb2dzh8u0KO368g5jioM=;
        b=hkTO43wtbKuibrj+J9n3xVCGLdD59cXXvPNBOT+zpTyFX+eqwHuk3B09S2Zsoo0yTX
         3iR8UnU5x3JTmNYAMA6vV/ObQResp4VUNl1iRN7OntXBxneEeIfzfxcF2cw8GXf0L7uv
         uWksVHxaqAJUxwH0iPqZWfnXLOlXQB+83am0H0b3jlImiP4RfN9nl8/2BFYMpz2Q+VdW
         +23bmZ+n3XE+OOHUWwjH1W0gd8O3gPp9p0igEVeSO8ccMwfpjW6LK9XcvSqOb1Ql//d6
         ewIZw4sUOgp7r6RILEw06kYl77xNP66Op19ufn7bwC7Kzz/R/1J5qEJ1s+zpHHvNnhxK
         f+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772748055; x=1773352855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aR50oeDCtiUuxRpnrOb/rn3sb2dzh8u0KO368g5jioM=;
        b=HR7cxkIRb/q7eT6zf8KxKk1JEzkK6Ui1ABhRxRnsBkus8XZ/S3BTHGJ0x1LG+2dgW4
         Kd+Dfxlg9zO4Yw+Lk6pbDBtYa0b+77h7k1O5u4QJr/WojugWioZMzx7VrhcVNeMSQaX+
         CrbsHvdM+TJ90+Brb8K5kt6aseG4rGihTO6mHviZYn4fI6uD4Xl51iL7rT480zmZDPxa
         HPungixrl7VwKOUDzJP3zNnAC/29K/caTGn/97giS9hM8Mc4Ca+s5n1SufS75u96Zzoj
         AfKQrVAtdlFW+IHTeaB/bxR5BVOBhVPpd7aeTV72bMb6tE05zRqmSmwDjtv9QN499wBP
         E+IQ==
X-Gm-Message-State: AOJu0YwDcfwsDbVNazlRwzgCvB5G62GuMg9/cUgn73ORG/tG0J6njRpE
	u+dcKg8XPuxgexAZ+wayJRvLRBliSNyCbiYbwREwaEY1yrIODyAMtXUUHvNpwrwfRSTykCJxsQj
	e94s1pnD2vpFIz4jHqDrL2KobRwrMVRyjmukLeX1SVdtztQ5PaeZ45l/ngp+acdmRIeGo5zcKFy
	H4Rn5nBH6e1xCJoac=
X-Gm-Gg: ATEYQzyBZPoW3Rfn0QCoAgmmjNP47wmfrsd2JufUb1G4LXaHJuE2w19Xc1popyYtiXl
	D/VxCGgj/JBQNrnfUIs7AU+NSiXqbO4KMWlQT9o3KWO9mKj/LC4o25Z6NN97GahgZB3Ahdrs6Cm
	nI+MZAesUys20CWbmTDoFH9Jre0t5kOb0KP2WIu/pO+trsU04T0pvPvBh2QndBYxl6SAmeyby4r
	l9p1han3Z4tidX4IBhBC3bAzL7IsiKYCgPv9IHXt351zzgAd+BLu0LqE/NiJpSnbA7YQMXLa2Rw
	R7YIDg6atQZszKivpsSdLcOlaHKFKQTdYRZC1M4vB18jvQPIyyfP59lsx+5o9nGTzhGwAibCwRu
	NpE+DEh4NQeIem1k8OzpkHLEztd4dHzLT
X-Received: by 2002:a05:7300:cd90:b0:2ba:8496:498 with SMTP id 5a478bee46e88-2be4de8e32amr2126eec.7.1772748054415;
        Thu, 05 Mar 2026 14:00:54 -0800 (PST)
X-Received: by 2002:a05:7300:cd90:b0:2ba:8496:498 with SMTP id 5a478bee46e88-2be4de8e32amr2113eec.7.1772748053501;
        Thu, 05 Mar 2026 14:00:53 -0800 (PST)
Received: from evatuf.. ([187.65.214.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4692239csm1224302eec.16.2026.03.05.14.00.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 14:00:53 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: package lib/nvpcr as part of systemd
Date: Thu,  5 Mar 2026 19:00:42 -0300
Message-Id: <20260305220042.322654-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HwnKNXuKnEHHVwIxZiAUCXwjxgVkEsP7
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a9fd17 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=5XGjxTY8yYkUmB1D1iF5Cg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_BmmkRem0NTM2hOeHa4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: HwnKNXuKnEHHVwIxZiAUCXwjxgVkEsP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4OCBTYWx0ZWRfX5Q1O4ykFemqm
 9UNxK/Y9WYix62Ibh2qSHWV829smYjPv5Ui8+h024IhARe3Kdc7QpcITEU5tqUezIZ7QNvP71md
 j09FX3VVPb0AT9a7wouS+A2GVrEmORvqG6Hpg3x9S/tUdvngZRjwcsqgktIWjU63yHyH6VfiOE6
 pb3NJ/Ws4iAQDeaEm2fJXVfXqmfyBRZd1p9teL40LY7ONYV1tBn3J9oi0izcjbVz7jbnDM7I5Wc
 AXnJpfU3jKNdWgSP9p+U4D0tuc8f7u0bwOjlUpgKSFIkawxluB3N5j5+9kKoM+kqibygwpiEwNZ
 xu8+CVvykFRm8j0dKAJOAeIXf74KDxpDNwdTRQqdz+5/PZwvUh/MRUMmUuSMPiT4BdtKxAEBKNH
 UsdH2B2R3hFHiNAJV4TiJBb2+Wiav0qd4Vsp5/v8OPsaminZ2+1+8oxW4D0PdzsZXR1ylYrg/rV
 E4xLIEG36+4dERiyhSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 22:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232523

systemd 259 includes NvPCRs JSON snippets when tpm2 support is enabled
via packageconfig, so make sure they are also included as part of the
main systemd package.

This fixes the following issue when tpm2 is enabled in systemd:

ERROR: systemd-1_259.1-r0 do_package: QA Issue: systemd: Files/directories
were installed but not shipped in any package:
  /usr/lib/nvpcr
  /usr/lib/nvpcr/cryptsetup.nvpcr
  /usr/lib/nvpcr/hardware.nvpcr

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/recipes-core/systemd/systemd_259.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_259.1.bb b/meta/recipes-core/systemd/systemd_259.1.bb
index 34dd37ffff..e265579f85 100644
--- a/meta/recipes-core/systemd/systemd_259.1.bb
+++ b/meta/recipes-core/systemd/systemd_259.1.bb
@@ -696,6 +696,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/sysctl.d \
                 ${exec_prefix}/lib/sysusers.d \
                 ${exec_prefix}/lib/environment.d \
+                ${exec_prefix}/lib/nvpcr \
                 ${exec_prefix}/lib/pcrlock.d \
                 ${localstatedir} \
                 ${nonarch_libdir}/modprobe.d/systemd.conf \
-- 
2.34.1


