Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0BDCF64A4
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 02:07:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23830.1763604413410493579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 18:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=MIVADrxf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: ricardo@foundries.io)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJNEL293474541
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 02:06:52 GMT
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahbt6thxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 02:06:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b969f3f5c13so338581a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 18:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1763604410; x=1764209210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFif31xsXu7ayf+eOuBhME099GmxtFzNNm7vAKyQABE=;
        b=MIVADrxfH+vYOgp9Xr8rnSxcWVAPI/1DH6MN61zvoFHmd3I95xTdcpVpnzWHjy7MvE
         5DFLGyDJd8TG+NB1ccG+SlXOU50vo1XO1Jnqr8MgN8GN342vFl1mBaGkqYL+0n5JKvTu
         /XrBUn51kH57EEQ3DqPrnUS7nanI8PlDEa3sZkUOmgfF/rhu00kLC1XNYq0dP1fCeVZM
         XQQVwSlWYhN1wHSUOarf4IXuAMqUNzdIe/unvGNRhPVqPDw3ZcB6PPjGSgmeEsQmC9sk
         HmtfUcQcBppnvbKunhQv/VrVqHwxTSxZU94qhG9cpgnaHU9cv8Ibw7llA+ZN5c7Ue+hh
         /NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763604410; x=1764209210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFif31xsXu7ayf+eOuBhME099GmxtFzNNm7vAKyQABE=;
        b=lHqE7l0umIkv0hGv7ja8bdeWkbQyHsH1azF1g9lq/L1nkLOo/MdzkDbjBEernaAzv3
         gWRX/1hOFVga3qYSwKfc1xLevw6+dCVF3ONy7pMfaeyRJV67busOdCokZWIdYVsrp33F
         LByrOr/v+fe72t8hj9SkTVQIgm4BT4eKdEows1I3w2J4TCjRLwWLzw/kr1/HSxI2YhGE
         tuXk+8WYjIo2s6K28DcUKWrZw7apK4mDmBraJEUcB5A9Pi1pzvd9lCLcgFXOmc6HvP0q
         lUoqzKQ8tvOEFh2w32oy5LTvUDgwL5vgqe3HbqQIk+8i96CUZveEWk90qoXDBSD4xCuO
         8uSw==
X-Gm-Message-State: AOJu0Yy4Iynyk+sPXTlwDwcP2C/dvsC3odnIYEXQild8smWYMyPzuLU4
	qgHSyO0SF+QBhqI8YR4cHbfGLWpfjpB527rGm8YyfuCJEl6H7n5SWV4srq2sBpV2AkUeL/GAMYm
	n5hN2saXxvncvzh6uh8y2EM941pNMewAyQJGUf7CWrFGR9SCsNTv/X4+KT6wmZSWeF5irf67RYc
	NvamK2+SbuGHcn
X-Gm-Gg: ASbGncuuxFz0tXlFzJf2VEaJ0idrOu7chtqYCYkZ765JT85gAoTxxrWQQKwZqsAFDDK
	UzVKS8cUQtFT5/IJ5CNiSECtRsi4SgrAO1Yn+/xe0Ere05uWy1CbdO/pUJh0+qZ7Y4X3euNkp9/
	CjN36H0hfjFy2NyftNtyERQKMhHTQk7hvRjmSkHCiw1TlL6QKUI8H7TfNdJ3HNyOhz3s2D5n2Zx
	lA2YGg40mW3lY16yHm0gh7jjzeUCVrmxI+x9KIYMYvItw5baTmaJEcCr1ZV5EiL05Rbyo2Rg8zA
	HLWTNQDG0DqqxTP881egFN6WEQaj9J+wAG7EcMZL6Z+c56jfT1ENViPCQroHlYJhPETnzsEuVVa
	b8iY=
X-Received: by 2002:a05:7023:a8c:b0:11b:a36d:a7f7 with SMTP id a92af1059eb24-11c9383a514mr466835c88.16.1763604410531;
        Wed, 19 Nov 2025 18:06:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2o97hKCKif7bqd67M3D2UOiuBHt2g/JoeTFVR12atjYc4tVmjHtpw6N3xVbFXNVYqBnEJuQ==
X-Received: by 2002:a05:7023:a8c:b0:11b:a36d:a7f7 with SMTP id a92af1059eb24-11c9383a514mr466824c88.16.1763604410057;
        Wed, 19 Nov 2025 18:06:50 -0800 (PST)
Received: from evatuf.. ([187.65.199.47])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6da4dsm3157360c88.9.2025.11.19.18.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 18:06:49 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@linaro.org
Subject: [PATCH] uki.bbclass: use basename for dtbs available via KERNEL_DEVICETREE
Date: Wed, 19 Nov 2025 23:06:33 -0300
Message-Id: <20251120020633.4589-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LkGHLT5ZQBZnHAKd7MKr-jiJ84l7Sn07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAxMSBTYWx0ZWRfX8xQWcO6CuKap
 r8CUqe4+88yaFXDYX40ZlAZNo3Ctb0RlJCWex6nb0sAxNetrrWrik/Zy/206PQcvsxKf/LXQNcJ
 nLn7V5ldzWsj7DVvFlmfMgE+1l3/ZG1HEib5F/7Nc3KXjbV76p+IqTitnVZP7/vFTiPasiC2AY4
 9esp4NylSpbDFmI4WDmW/uI8CzZc3uSf0NawlAcof+vjk9LZDzODZ2I4PHb9KQjLHRj/quizTEy
 /jtSNAM4jpYZglQfMk4+J5hpoHVUMdVLMKrQ8u62l/V0wBfWYvPCyEG0W1gO4UGU+EXhDGgI40y
 5WMKFEFjJJWtv38bCqkW5hz1kypTuknbIv+pDeSepkyALcIS8DFdhrIMGphB/umcINaZmIhFmC0
 vUiXEy3ExV/FRxIWsHrJGNWvfNjiug==
X-Proofpoint-ORIG-GUID: LkGHLT5ZQBZnHAKd7MKr-jiJ84l7Sn07
X-Authority-Analysis: v=2.4 cv=PJICOPqC c=1 sm=1 tr=0 ts=691e77bc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JEjW2rnyS3Y/5sYvBvSpBA==:17
 a=6UeiqGixMTsA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=nzdI5zr_s0Zz-bnDVt4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 02:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226601

Device-tree files set via KERNEL_DEVICETREE are deployed without any
vendor sub-directory (e.g. arm/juno.dtb gets deployed as juno.dtb).

Same is also done in kernel-fit-image.bbclass.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/classes-recipe/uki.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index fedff222c6c..a2b1c8a82d6 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -152,7 +152,9 @@ python do_uki() {
     # dtb
     if d.getVar('KERNEL_DEVICETREE'):
         for dtb in d.getVar('KERNEL_DEVICETREE').split():
-            dtb_path = "%s/%s" % (deploy_dir_image, dtb)
+            # DTBs are without sub-directories in deploy_dir
+            dtb_name = os.path.basename(dtb)
+            dtb_path = "%s/%s" % (deploy_dir_image, dtb_name)
             if not os.path.exists(dtb_path):
                 bb.fatal(f"ERROR: cannot find {dtb_path}.")
             ukify_cmd += " --devicetree %s" % (dtb_path)
-- 
2.34.1


