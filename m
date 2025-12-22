Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCFDE6ADF1
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:58 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87711.1766434130149065271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kW8VNdP0;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b61f82b5fso5629111a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434128; x=1767038928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljE3yUczRqVA4Ue0qx8fCbYQLje9hUeDLO/flVeh6eA=;
        b=kW8VNdP0ZazKvi2YHBTNa8cOpbWzdCyzxqb+x25Ih9zzUD5nMyGEIgdjCadPREZ8cj
         tNlEEcbg8hufJzVSRsJXD9cWssjh67Zyeg1HOAU3mnd9r1HNo7Dfr+XI75WcTNr0Df6L
         neKbwBzvhI+ecEvtcjUask7yqgQ7LlYxWZ2U15r2g3qqxZyc+Dig1w4xrCqxHnugAW4j
         YkfkAw3reF26ZB7Iin8lmYiu718gyjQr5dTG8huFJ0ilxdXtLKNz4d1Jm9Eu8VKw4gpN
         VvFH1I9WnSc5fv4jaNPi3nrJJcm6SdF3sGyl3QTq/SRqDByQ1YhaM/eVss7+dSGx4uFy
         1dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434128; x=1767038928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ljE3yUczRqVA4Ue0qx8fCbYQLje9hUeDLO/flVeh6eA=;
        b=VbgPyWz332vlxCvc6H4jlXZkIvCXlAvCtAd3IktUHyjeqekoDtzMn0aqnCe3buGfwr
         SPDH0w0HyZ/RpPBtPvvI1HYTLMxVRgJUu4FREQVi6iQR+slOue5+QA5AVCrr2f4xPoXb
         FNEpRww/qWhKEEveNN8BHjlxeh3eq7uFpeSnq1doFGwZagVgSkWp3qWUX7r3sUHqfymu
         gAOOBD1XP2f7QqLOd7Xd7qfqY2RdWudHY1Yp6bVab7YLdIwrt6zY5zB/FrxU6Lq2s4uR
         l8rvHCap0GAXNGzhnlzervtrIyxM+zM0LkBNTkQAuohfUJtdzJNnPXqPsHWjnfncFjaE
         DN8Q==
X-Gm-Message-State: AOJu0Yz56lZAfWZRbIvbbKmQ/0PWGXI+GrNwe+zZ21uBsBETyPkejrQd
	tO59n0kSSgAGF1W03isfR1fkB3sqxOMg4XY5LzTJ5a1Qgl82hy83GoQzbL9k1A==
X-Gm-Gg: AY/fxX7d/r1Z58IVsrFpPhBpOuzoRyDL9zr/NxlUC9FLd7jCwx/XcJKTCRlHbrF60aV
	0CeSt51sAi7gCFsptaE7GEZHD7/+j/Say0ucesjm75EEmPIExXvY5NLKRxElWgugIVY/MhFv2Qc
	jBmpFKOEQXk2jgkeiLwFQmU1dT3UFaWTnFWAa1Wo+sI1wdinSBJXnSBRKE5BnLIA+0V7DT3O1fN
	NBkFj0GZnPyN8i+SfqgfauhUZhQCqG1+wCr6DaidjBnnDy7RekDHMoNzRUATr3mMSf0OR7lhcg1
	N2hH2ydxDUaCemm1npQmFKxEHgXdLz3Uzrz0vZyGqlC+VqoFf9VLxRkk9Z2N/E2WI4I4JmN30Ue
	TeBXvyqPajYPdLOMLpA2f6jaYLbGkhj1HipH37leFXgQqgJvgsIN0lqqpTlGsJJH1b3IR29a0EV
	NnrtOYcKhhS9hu3A/7TZu2nqK2XCorx+SqqeiT8aFHt2kUlVu2LMu8ZV/MiQ==
X-Google-Smtp-Source: AGHT+IHR1TnwWkUPOmT/XbdW1+FYlo76cuqaa394Kmuu/YUIJX/vNL/IU6lq3t1xvDS3ukMqflgt4A==
X-Received: by 2002:a17:907:7f8e:b0:b76:eec9:a1a9 with SMTP id a640c23a62f3a-b8036f34039mr1147791266b.7.1766434128333;
        Mon, 22 Dec 2025 12:08:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 092/114] repo: upgrade 2.59 -> 2.60.1
Date: Mon, 22 Dec 2025 21:07:14 +0100
Message-ID: <20251222200739.2278706-92-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228417

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/repo/{repo_2.59.bb => repo_2.60.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.59.bb => repo_2.60.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.59.bb b/meta/recipes-devtools/repo/repo_2.60.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.59.bb
rename to meta/recipes-devtools/repo/repo_2.60.1.bb
index e447fd9492..4a981e5270 100644
--- a/meta/recipes-devtools/repo/repo_2.59.bb
+++ b/meta/recipes-devtools/repo/repo_2.60.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "1afe96a7e997ce7748f066b206a85ac648f7a87c"
+SRCREV = "871e4c7ed153682a77de44e300b5f5461eb08538"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.3


