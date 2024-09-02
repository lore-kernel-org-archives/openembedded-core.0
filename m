Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABA1CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 09:41:47 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.34971.1725270104987702366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 02:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NXNykWbl;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53436e04447so4177777e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725270103; x=1725874903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0xLsfawRyeMZ8dp7aiTKQelRguErRxZI20nl+pSDoI=;
        b=NXNykWblLo7qA+UZiI4m4U49813QAYMckVFR2ZPqjaBe74AVE/LXjmRy0SSD07GfM5
         8gTpPjW4pikdkeDjPytIrK2R4hA9dBBp3pD6ULZxnuNhbqpO/UD4fo3HMCgCmsXiM4sV
         9tCXRg4Kz/K8gmyCI0aGv6wHmTd4mg2YKyCOMPfeAYWjC0G4n4nAwxEFqukLzzT38Z7o
         6Zz5yIUjfSHicJZ9ZZYeMT9y3cLJXNjAcLtNSPQ412RGgVO3AYAP2FjFHfTd7np1CmnW
         +fDKJL8UmwKOAtguK9HzQiivGTq7LlcUFYvH3gWRfN/DV0m4LgvPICJHXZbKH0ZIJGuB
         riyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270103; x=1725874903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0xLsfawRyeMZ8dp7aiTKQelRguErRxZI20nl+pSDoI=;
        b=IFgf6twaW5kN63T6q7/VbuSPIDyO1GQx15w1p0FjkDSx/XqWM6rTGrgVsAvqLhaMzj
         wVVeK8DpShwiWX0hmgOU/IR91x9FYkurZTBy1h0+6Qahp+RMv+2iy4zIyKflCmCM7Q8G
         h9vzupuYwJPLIkP5n/r6WEwsHanpgCOKkTFf6H2qFeGa8HYcYBdFCmPxrKyhu6tFNw0j
         ZDLUrHSPUQNNoPy1mSCLNYyQ+Vruj3ZVWPZCz4UWz+FjAi5EebVAB4IcBo+oB9J64EHZ
         c1ZUtkmre7okVEuidIUxd64WW3dS8tUVtgTFYYYC4l5JHx9kDP6Miv4d+fY/6oLse/gG
         L2BA==
X-Gm-Message-State: AOJu0YzsTLNqJxHiyDWFWdSyACq6fy+K2TbmlONrdNk1pv5sqy8vU2tF
	K6XfaQP6AuvgyuDMGyTmU+uueQjal/6CLM+1tjvkPEMbYVOYVvytYCqXldWyGYMfcA1e7zXTumm
	Gi9A=
X-Google-Smtp-Source: AGHT+IF4+FcBIM5jMzxGTiljSzic0YFbgtHqzWjckKnmv+JeqB7LFSwPOptwDu3yQ3nvl6r03TEbkA==
X-Received: by 2002:a05:6512:3049:b0:533:4191:fa4a with SMTP id 2adb3069b0e04-5353ebb9866mr4446079e87.15.1725270102543;
        Mon, 02 Sep 2024 02:41:42 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084176bsm1528853e87.219.2024.09.02.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:41:42 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
Date: Mon,  2 Sep 2024 12:41:16 +0300
Message-ID: <20240902094117.31156-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240902094117.31156-1-mikko.rapeli@linaro.org>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 09:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204066

Needed by systemd-tools-native

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d8252c5b82..a8c630e7f8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -511,7 +511,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 HOSTTOOLS += " \
     [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
-    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
+    fgrep file find flock g++ gawk getent gcc getconf getopt git grep gunzip gzip \
     head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
-- 
2.34.1


