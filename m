Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D733CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:50:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2361.1781628639703244942
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SvUIpFkN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=B6bUENBD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFdetC026894
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xnjjMY655JZ
	RJgypY6g324tuZ8HEecRVmjFZtudP8WM=; b=SvUIpFkNAzokfawfW9SB2pTjp0s
	BGoqyEj/8NGV0QSQF0nLi1wXk4eVFaiMwtUHFrcpFen8MFCHwneTbHnIajpyO7JK
	JPIFMtjgH3yO/wdjlozVMbt25E9qHonclneX2q50j4YwURk6GiG1QpBRx1qBKr3u
	Aht4nfoT0R3tjbtLnBzGpuk6cCQm8WUHG6/Pb8iyfPmmkEm4DiSH0EDC0m69mwx6
	taN/7gEDSddTBcuDp4vVlI56sNxhMTuxSCt/OcSLnPNnnQK6Rjwp/gMu0vZE27QS
	Smzi2IPZJNE07PhLssUTGSERZr38zt408DdV8SBbOfQVYlpwZDWzT1AQ/mg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52ua03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157f453a27so677960985a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781628638; x=1782233438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnjjMY655JZRJgypY6g324tuZ8HEecRVmjFZtudP8WM=;
        b=B6bUENBD3duXlowh9dB39+egBALJatFbUH022dv4ksUnki842Iz9+naT0hub/9WuYn
         F0ko80xtvcu/Kihe0H8JVJVSOxZqRmS0eo+PpyG5idEJyoDruY2OyyginiV7SffoFEId
         x7nwDhcD5Tzjvg0JmWSYJl2HIF/Gzx40FqF8dcpxiqhZHuEpBdAxzmZJhjsAdKy50tDc
         UMiPeWlmqS7yifmJt5Gk4pcsba2kwkd8vyijFR5Drmm4lN+mjER+PL01oTDnRH7wva5w
         0GK3TjKta7NXI9KtNI+Y8Xt2R7AHDTugRkoEu+5mrOEcRWCyboQhOcq55303/qGDBnv9
         UBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628638; x=1782233438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xnjjMY655JZRJgypY6g324tuZ8HEecRVmjFZtudP8WM=;
        b=k7TX5zQnGefafDGD+L/VLAL9VtMd0M74KkXGwO/fDg3w9NemJprxVxklPlU1RxtEfI
         1VHQUovVn4MNNE+h+gc14EMfaG2Gy6fQ2OUNgpNkByzyP/iKxsjhsC0fHDyQSfQoWZ5L
         nhU/PGrdkiDDQ2ohKrnqwPqpEarZ5B1HL+XrYvSgvmHVOdLDe7GIFjt7zE1SS+HdHETb
         woRTbE4AD6Eb+xa8clLDnyqrpBPr73yrRZtVQXUOR76WAcvAxdEO/tS1hfNo3MuBqvw3
         NQA1F4wNPLyms9l0NNmk4agf/g+jIqIePbGQ8y3AdV0GYz2e1iL9Y/Cm5jJGcSa700KC
         ZpUQ==
X-Gm-Message-State: AOJu0Yy4RS2ikJltg6RKvK0Sx8f9FH0QaBZWcZlSgKKgUcoJfu+8zfcn
	th4OYeK+LvGBKnlORvGbrGrmJrK7Nda96i3ode2yApR0pxmsX1rypA/Qb1swFWOWgjKSl0Ae1g6
	bN7tbSJbqravrmGwhn7qf8Ipp+z6X135mMxO6xtPNUuEnO9lhC82eAh71pZ68TA3hRvHoMtIhz3
	qIN2oForGgDmIw/G1TJg==
X-Gm-Gg: Acq92OGuVQRcHolbK9+n+ZvDrhQykWSgyyoOLxpLku5fur5MJYpgVWF15ngM7LcJVbL
	NIVzr3ch2YWljuWPaUV0ztb17MxoxStUkPdrxhVGgIiOSyJgYKX3zl8jKNVfe8hQ5pu30TnjtKL
	+QVuJZKeUBn2I+JNu6hJAQlySs9yyjnYIFZxx7K2QZEhhSW/kU2wRqfiXhBSyRYArVtzguEO9hH
	u+1ZFvz/OgkJkJ5US+CSPKIK4yPUNY0X1dGQ7emg50xDWA/vlB/CzzfFXFQu9/UiC6+/2YKWN2q
	We6XgrZUTlh35ramD9930iEsBgj281uHeBE8L0vK8S6DhHyAy4eDlwQYRHPbPTvFI7hPbnZsfdL
	3Wsa+6rKh1lQqD98gX8Zh68NBNc/jbB/X9q0nyGq/F5PM8hUFibDtl8AKdQ==
X-Received: by 2002:a05:620a:390c:b0:916:4a9:f35a with SMTP id af79cd13be357-91d8d0ab3f5mr76544885a.30.1781628637597;
        Tue, 16 Jun 2026 09:50:37 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:916:4a9:f35a with SMTP id af79cd13be357-91d8d0ab3f5mr76539285a.30.1781628637102;
        Tue, 16 Jun 2026 09:50:37 -0700 (PDT)
Received: from hu-ndechesn-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b54asm5456495a12.3.2026.06.16.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:50:35 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Subject: [OE-core][PATCH 2/2] alsa-ucm-conf: remove stale comment
Date: Tue, 16 Jun 2026 18:49:59 +0200
Message-Id: <20260616164959.3399737-3-nicolas.dechesne@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616164959.3399737-1-nicolas.dechesne@oss.qualcomm.com>
References: <20260616164959.3399737-1-nicolas.dechesne@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfXzVoeyuVg+8E6
 g6rsTPZcCFCwzi/FZ6oXk1SGiTcWRD1ALEgNAj7UFYd0gWNcvQFYbRnOMUNHLj5uHFrpQAkJ4Au
 nZBwF3p5DqkjkZor8JsgeDWb8Gn+sI0=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a317ede cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=foHCeV_ZAAAA:8
 a=EUspDBNiAAAA:8 a=2LkiJleH7R5LRNqz9dkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfXxZi1UwSKgx/T
 tkaiTO0utryfbhKDRiClYgME0GCKZ2sFUMn1ICTqvToHg1vYEntdS4FhbfxG2RxR/cYFdyr6r0r
 KQUKZi6kun9HW4ZrS8KUZllJv7D2BqED58/VsWT/tFZKQMuJdIZQ4IgNavFXF7cM1FUWqqSQWsw
 iuCgy0xA+8l6Ycrwrww4r7HKZ0fF7i3bjJBPfuo7rnEg0gSVr2uPr6wQBel5qari89wIS3dFhxO
 BIdpvei/RxftX3jeclZO6SMdZ6i4SjX8PrqLH5jOfO3083owQDFGsQueRL4Pte1kttZsR3VU166
 8N8p4GTtKIPKjMruV4XBc7a5mp9zJBpYX5X+TnsXw0VyfXdr+tHNeBn7DwS5wj6rs8cRVNNM/vk
 SPQUWvkwEpAPKF0eH1szNZ784vwDypaWtFkrZRK3G6DIXo8D67lCiVwtk9iF6vdlkQ2XkuvqNK+
 PjKKpyzSo2hbkhDehJQ==
X-Proofpoint-ORIG-GUID: KYgWYI10ZZVML2ol428brV5vfNTfTsQz
X-Proofpoint-GUID: KYgWYI10ZZVML2ol428brV5vfNTfTsQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238921

The "Something went wrong at upstream tarballing" comment was added in
commit 3b69f6c450 ("alsa-ucm-conf: upgrade 1.2.4 -> 1.2.5") to flag a
one-off issue with that release tarball. It has since been carried
forward through every upgrade despite no longer being relevant, so
remove it.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
---
 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.16.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.16.1.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.16.1.bb
index 095deca908..3c32677a37 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.16.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.16.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "cf3d1c07e089a83c4ece2c20f05dd6a8aab7fcd108768c38811386880575492b"
-# Something went wrong at upstream tarballing
 
 inherit allarch
 
-- 
2.34.1


