Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BD0C63797
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9388.1672830376764924673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FUy+3lQU;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id az7so8167401wrb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXUrTV9V/eLBSS3RULgnqmClVMcVg5k5DlUTT9w3ky4=;
        b=FUy+3lQU07f7DoCSrslQL8C4+XNFibNHWvFZWlagorusBMH/szIyjXh2A1t/MJwYtV
         dea9+ci0n5FuzxM3qbHyLfrzb0mztHvP8DBtt8f9bdv6uBOPRgeFVbN2OWvifZuGrvY7
         PKm5x5elg3DKAYD/BwahpYuthVAxX0L0Jg6oWoODEpllJoUn/gfgLDmQlGb7YvSaTsv3
         qNDYfc7rFy1zfRXrArc+Zjb5yzh6p5zzK2fHiAb7djl3MdWrrIpJgpTbcz31VrJdsfdv
         SPgAiwLFzNcoBi0dRF712143zMn5E19KVlg4tTS8zQ8aU8WKJ9tsDipvGzP6dJxqSQsd
         GIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXUrTV9V/eLBSS3RULgnqmClVMcVg5k5DlUTT9w3ky4=;
        b=MEzxBH6N1aqkcWuMO7i/14OjN6qxJ4Zlg2xIOeeIgDMKjOxM03mO1PgGmZsGrTkA2Z
         Un0XYFORAoiDP/80T9zYHkZ/zki8aFlRghOE7ZzWucD8TjWaEfQ87wNlJLNnYtfr8Oga
         +LC/1XzZ0SYFe6aYk+ietrpk2sHK08Md4jfQbrkMyHiJflW92OrXGEDUB94DMoT8cjwv
         sy9Fr82lIWDCPCDrLn2c7CIOHxhrfMFarHCTqVEgfTLck9GOymSv4dvEO6ZJn6Hfvrvo
         yeZemQU+SXGjGz33ssjerQOHT8IqZm9p5DNiO0eWjTzU4UCMygbp3591yeI56G7y7AgT
         LICg==
X-Gm-Message-State: AFqh2kp4PmUp/wB05ykVrYN9dvssvJjPeC929oJxtv564u9FyYD/ZWUh
	QU1he6bmrxnfnL0k3C+yuP1/Ij7kyEI=
X-Google-Smtp-Source: AMrXdXunRTGo4mHq5FvRKfGYKvDMaOUqyw5IguZVfPkLen2fgDWXDPdq0dAtwWS1ilP8gU+FhFOy7A==
X-Received: by 2002:a05:6000:18c9:b0:242:88af:d88b with SMTP id w9-20020a05600018c900b0024288afd88bmr30200039wrq.43.1672830385955;
        Wed, 04 Jan 2023 03:06:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 44/77] python3-cryptography-vectors: upgrade 38.0.3 -> 38.0.4
Date: Wed,  4 Jan 2023 12:05:15 +0100
Message-Id: <20230104110548.2537259-44-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175429

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...vectors_38.0.3.bb => python3-cryptography-vectors_38.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_38.0.3.bb => python3-cryptography-vectors_38.0.4.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb
index 9e4c40e0c4..a36cbeb09a 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "1cdafd42f5348d77e4e7e4791aefd1f62b16bd552a0274afc9346533fe32e925"
+SRC_URI[sha256sum] = "6ec62695bec5df810288ddceae998ae691cdb8a162808d6cbc960d3deb9a7db1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.30.2


