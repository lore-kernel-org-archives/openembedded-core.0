Return-Path: <david.zuhn@sonos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1F2C47077
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 22:49:16 +0000 (UTC)
Received: from mx0b-0003c201.pphosted.com (mx0b-0003c201.pphosted.com [205.220.183.22])
 by mx.groups.io with SMTP id smtpd.web11.3594.1704754150779567014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 14:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sonos.com header.s=pps1 header.b=jCFr0X9V;
 dkim=pass header.i=@sonos.com header.s=google header.b=N4XmZdbT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: sonos.com, ip: 205.220.183.22, mailfrom: prvs=7737ed8f84=david.zuhn@sonos.com)
Received: from pps.filterd (m0299973.ppops.net [127.0.0.1])
	by mx0b-0003c201.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408MKeAv016185
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jan 2024 22:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonos.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pps1; bh=LsCblodoL6MV
	fJ+EX309XX+hR0nHZVHvhB8zx/v7D80=; b=jCFr0X9VkSYuz7jOIoojWslEUlnA
	aXyKILj9NdVR+8vW9iazlew8/Q/WBnsLHI4o3dPAJHjjIbZHVQGhiShaabe0H+UQ
	HIFaGxKjGMbDyGG+rfLMB3s21W1iyLP4OKp/2HLJlabmTpxC+8VclVqXif4MZHbU
	9rfKXHRfmOPDZzs/iWAvOMUnkbMFyz4qbYxaz25mqiqZz8lcD1RzQeqYDsTVl6Rx
	WWWcWFfUTPMCA3eySu82IrQ1tVClAFIZtaU4X0jOOruNqA/xlMOU1hGc9v9ndXXE
	p54NHQNDEirV2CazAiJIP0vdZyPuhABbQDVeWGfH7vVojEeVVvb024DDDw==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0b-0003c201.pphosted.com (PPS) with ESMTPS id 3vf17ujcpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 22:49:09 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7ba8315d1cbso247591539f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sonos.com; s=google; t=1704754148; x=1705358948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsCblodoL6MVfJ+EX309XX+hR0nHZVHvhB8zx/v7D80=;
        b=N4XmZdbT4/H1Hu/mBhjzV7gs9oMHksy0A9P2ZGuXAf9lvTpaEu8GbgrPG3+kgpbnWy
         eJ5AB4hqnxN11T8CCW9PMnftDGbxfOXg30Aj1pTeYDMjr6cIYkObXksroWZSIdq4v56E
         mPXaT+dGOMVMEFdNCF30usUWecYHPlQzKjy+UwkW5+F9a1zPFuIjk8l/+kwaNj+Pwtc4
         9gARvuWMysHNsTuHwbJ51H1UdIkw6B+HADV52ZB+Y008qA/91cHHYGHkBjI+6baDVuVt
         OncfO6dHCU0UyfRgsYdCsYGTh2TK4+Br7olW8s8zbaXZmf7HmGxcqOAzOLv6Y0AYDQba
         DRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704754148; x=1705358948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsCblodoL6MVfJ+EX309XX+hR0nHZVHvhB8zx/v7D80=;
        b=jtu68t2anxN3dbGd/iAHPcBdO+4vdX20JsD6W4eNW8hzGWRlWcTfw8PDVX1/2WInhK
         XdPlDUZmAG6yLqTNqQTf+8CVu5pHkSnQkj0TJqeeEGfCqSQQ3B+kiSaKC/5EQdggYoqV
         0AsnlF9aPipeS+U2CrH0rcjQaPqwUFuBjiVmi+Xo/HgrxhOYMqwQuy+T8clF0kmhaS8I
         4ISmio3ogRTHwFUHe/FeT1/+MrHzI7yRlm2RxFAi9LRN9N9wXXgssJCJmVhQwfEf+gqp
         UytEIxrVinikyLihp8Rm+Jpg6UuFXOrGhjTOxRyP6NvUTHN/jrLhZn6Ea5KTnLKBOExd
         klfQ==
X-Gm-Message-State: AOJu0YypmV7ihOFS17bqmFj3+XXEAVl8USl3Ob5wujitTW8BAkhkL3zl
	fgNPRM+8a10lenVmY5f6PJPufubPETwsjbWiTSn8RYND1WGOULD5iT2CgPN7yUCEAOBKMGz8r+S
	uwvRJRrgxElXpZ37RX/OmL37+p7px0nxr+eunnZV4bJIns/7XMV9OISHV
X-Received: by 2002:a6b:f003:0:b0:7bb:c68d:a09 with SMTP id w3-20020a6bf003000000b007bbc68d0a09mr5878812ioc.15.1704754148032;
        Mon, 08 Jan 2024 14:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHU4LMJHsWyFMWWEsOCbwaB4jfHtgEVzcx65DKAWBBuS6dyMCfvzXtpfm9/+idBrHHtq9lIg==
X-Received: by 2002:a6b:f003:0:b0:7bb:c68d:a09 with SMTP id w3-20020a6bf003000000b007bbc68d0a09mr5878804ioc.15.1704754147769;
        Mon, 08 Jan 2024 14:49:07 -0800 (PST)
Received: from roebling.sonos.com (97-116-45-192.mpls.qwest.net. [97.116.45.192])
        by smtp.gmail.com with ESMTPSA id i40-20020a056638402800b0046b6238d7b1sm248325jai.121.2024.01.08.14.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 14:49:07 -0800 (PST)
From: david d zuhn <david.zuhn@sonos.com>
To: openembedded-core@lists.openembedded.org
Cc: david d zuhn <david.zuhn@sonos.com>
Subject: [PATCH 1/1] rng-tools: remove obsolete build time dependency on sysfsutils
Date: Mon,  8 Jan 2024 16:49:03 -0600
Message-Id: <20240108224903.4086308-2-david.zuhn@sonos.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20240108224903.4086308-1-david.zuhn@sonos.com>
References: <20240108224903.4086308-1-david.zuhn@sonos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wis0QJsKBYdmhXFL7NltTWoeaR9fMFrM
X-Proofpoint-GUID: wis0QJsKBYdmhXFL7NltTWoeaR9fMFrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=668 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 22:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193436

This package used to use libsysfs, but has been modified to read
the /sys file system directly.  This build dependency is no longer
needed.

Signed-off-by: david d zuhn <david.zuhn@sonos.com>
---
 meta/recipes-support/rng-tools/rng-tools_6.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
index d23d6be34e..f0aa3ff93f 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nhorman/rng-tools"
 BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "sysfsutils openssl libcap"
+DEPENDS = "openssl libcap"
 
 SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
-- 
2.26.2


