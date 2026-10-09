Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F34CA601F
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 20:02:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4380.1791576128473944813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 13:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=N8TR84d6;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XbDzH8FZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699K0hHd1760625
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Oct 2026 20:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DIOprIkC0RqvwiWY39jZJo3NTkhE0Oe2R4H
	lsrQDstM=; b=N8TR84d65smbgd+Qxnw/G1GIr+v91fIMXPa86rNBQ1TZrgZsnIl
	y06F5c8K7BDuKQB2DUefi5WNr12AgaX1MdFlPhn8ZAKHUP3fs3Digs4OGcDtnxz2
	Y7lADn4HJrbRk1MgDI/4nSo9FuuNAcm6gvlrqrYKvm+5nwaT9iPJQkXazSSiX/n6
	d7Dy0JQU5Qy9h7JOa2ew89g1I6LR7s4WlgN9epsJXzy/7qvi2ygleuipRfaVgaO+
	IzdH5dxJu5YThmR4CahfSIbWjC9eF6BAedkr9dCjGg9Jco+pGDwL8irCG7gs33Vb
	DNp9kW5XPVlYglnZyVHUJKDL0e10xXH+QkA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74tbgjxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 20:02:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e8078ac577so29052e0c.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791576126; x=1792180926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIOprIkC0RqvwiWY39jZJo3NTkhE0Oe2R4HlsrQDstM=;
        b=XbDzH8FZrstWFBEuFzVVm8ZO+p+PaRh/yh5/aNDZNCz+nTzxK3yPludfboDzIpcH9a
         I66lK/m0oOK4jLJ8KMfZpcg8TZrqnvBo1w1XUe6HFvSlqvIODuigPkv1Q+gzKbIJCdFw
         dpPBzSMmtojVKOkVeT9FsLAAn7wmf1WUJWcGPUh/jZ5m8yq0inFKnqHoksHOLehcO5CZ
         tVGnZ1r5mjBmRsNUXzPsZIzJlfd++T/6HC05MDvfbl2s7GqqReMeOHzcXbDJ1X35rol1
         yVVpPtRD117kARRnz7qc/aW89epftzfLCvNMbGLSBm3SnXcJ9DnwyFCMB1J0Pi6znw+x
         drrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576126; x=1792180926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIOprIkC0RqvwiWY39jZJo3NTkhE0Oe2R4HlsrQDstM=;
        b=deiO7Iy8YjVY3cCHyztbSI0UbNUF5ustxJmv5y8w5Pwb5pvt6Imdag/HNbQUCFEOkf
         EpHh0TWLLsdQnNyuTSolMOTnDQnwUfaEP22ve0LbSET86kT8/BFDCg78TU1bER49i6cm
         /wJ4KpvkhPzhj7ldqzEZSq1u1WflWnNwv0DXECovU2rvignR80a4lC7kh2XM9hWobRmp
         wi59QRHjUf/o0rLI4eEand+E++r2IQli3jmux+khDWkQFe4RolB8wCazh12mREdJIvlu
         lQxblh44RQUVB1qrzCxnDBC1rpWwgBVqyLkp0JTa+q+KohHtxw7XcqyNlxK5WnR3LJAA
         neOA==
X-Gm-Message-State: AFq9FYIK1aEQKw0B2neKrtKqTxallvQXSiSECi9to5ga2DAI2jkAKh+7
	jRHWWkMl2r8xhGpbYgkVfis9+I1Q7HqQmKjCe6blBulHL5YMrbjamygmv8xxEEbgJ0jskBPzpYl
	ixdMZvPzP5oVALqfMi2qprNW8fXi+WGMY2vVEYnzzZ4U1sMpEtfkzu9oEIfbeSY8ohm50HKHMpH
	171OnKhyK/yBhV/WI=
X-Gm-Gg: AYBFou1jIeiTMx9WgqGG9kJNhf5/aLlgV/Rw0l8NNunGjViTKTwP2gib8HXOyhM0SXQ
	HmRhrBxwDm++1wE8okTbL0NxLHk3Gmv7OyuA1S5xmjI2bQTs76BqJJ0v2EYKcaxwKDWivfqmsR4
	F/loW5GGSWSfQqFdFEicW7YL8cLIgiCzd5FSEv39NRdGfIIRNX2Hj7faW1Xjk5EwQLIhnybYofu
	2vPQH6vR/bMSw0yYeOWJf8Xrj69bHz9g63JusK4u1FgRxyEtfOClCn9Ju053wMN6qN93k4f8VbZ
	wVErU778SSyQqXEkjKjr7ZwsoSGbQjvTDIAftWRazKXgo1GlmpVb4nmmcOJcGYwwDRHS0vTQwnr
	CfvrHlddGtTzV5w==
X-Received: by 2002:a05:6122:1d52:b0:5ca:df67:49e6 with SMTP id 71dfb90a1353d-5e91f5079a4mr1066657e0c.18.1791576126271;
        Fri, 09 Oct 2026 13:02:06 -0700 (PDT)
X-Received: by 2002:a05:6122:1d52:b0:5ca:df67:49e6 with SMTP id 71dfb90a1353d-5e91f5079a4mr1066616e0c.18.1791576125690;
        Fri, 09 Oct 2026 13:02:05 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acee65sm5448622f8f.49.2026.10.09.13.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:02:04 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] testimage: excluding TESTIMAGE_AUTO from initramfs images
Date: Fri,  9 Oct 2026 21:01:55 +0100
Message-ID: <20261009200155.1040688-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RcEFmFtv c=1 sm=1 tr=0 ts=6ac9483e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pbfHqgJEASC1RGkqVB8A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3OSBTYWx0ZWRfX1xInsF95Gn0/
 aJ7IJOZQPpcUnUY1KSTXOI8JwrFVdFahFByU1fl6T58PGOQYvAY8TNWCMF4s9ewD/vPkCPTr4O+
 +Hbg5oHShzfFbKRjctGw7zAcNSHvrOffNhe/R6zY1C4QdcK587AWeutZhJFVw85w9hwlvZzzmYU
 B3eC9UddVk7NbCW9MREn/2YAt9orueE3F7+7/7xxDKZyM/tiDC0ISM/377WL1Vavqoq5lai6NDW
 7df4oNgU4u95XkFfBfPnQi58ccNDWhAirHBh2+LnNZHeBzG2Kggm9MDVlZnrIESqHJ9lCxMf8GF
 ilZg4OwdCPzq23EUpubDv8G+26X1xozyToi78bAk3pZGtZKzQ96fjlCUL2E59mDb5xZy0cCM5PI
 jRIfudkEbrlYCckqwBPL6GBnDblEg6RrmU+q1BwW0bIIpdjMXWyn6gPdKpB92fvTFuwHn3GQHzN
 fs3quKq7PsfUdEMq6FQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3OSBTYWx0ZWRfX1DbX/QVCjQiw
 oJX3cO+4Diot+dIrSknihPj45EoW8yVR03B/Nj6ADL279dGOTN6smAlQClkTzJvftIUQApNqkHj
 sIEIepMxKJ9ye7ZFI/z+Xiok+UyiY7c=
X-Proofpoint-GUID: n2XHDwhnR4rfB9eP7S5hxEshMg4WLkrS
X-Proofpoint-ORIG-GUID: n2XHDwhnR4rfB9eP7S5hxEshMg4WLkrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 20:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247484

When TESTIMAGE_AUTO is enabled, the testimage task is automatically
executed for all images.
However, this is not the desired behavior for initramfs images,
so it is necessary to disable TESTIMAGE_AUTO in these cases.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/classes-recipe/testimage.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 419ad6dcb0..f21c87487f 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -520,6 +520,7 @@ def package_extraction(d, test_suites):
 testimage_main[vardepsexclude] += "BB_ORIGENV DATETIME"
 
 python () {
-    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
+    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False") and \
+      d.getVar('IMAGE_FSTYPES') != d.getVar('INITRAMFS_FSTYPES'):
         bb.build.addtask("testimage", "do_build", "do_image_complete", d)
 }
-- 
2.56.0


