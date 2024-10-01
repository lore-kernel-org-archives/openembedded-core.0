Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4895ACE7CE7
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 08:28:48 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.76271.1727771322624482666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 01:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sNgBBnl9;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fad8337aa4so9319051fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727771321; x=1728376121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMHKrlrsTVk0uUvK/TIRcDwWQtyRXn6XEb4zPPLaQRU=;
        b=sNgBBnl9j7AOIR4/aohndHjr/uEct0PQP5O8vTlMXpObjOHDtogYS3dib6A5eErJKW
         mX65mjeoNiJrcJF2Owh1TZFedEPX67/h/qeKeTqKA/9KkeAG8rhRe6Xolmwy8hEhjti6
         AqdeeIKAeBuuH8xXRyTq0mSCF/pdORB1fMgLVfRYnr8xq/qaFPAmYA+va2QmV2Tx0ZgZ
         kn2P0wAwlyIOTL9KxacxFYPmFhbK1vJb2L6b9YBMEe1g1ds+m9BPfCU7VDoSWseCyCmZ
         pKbA34nPpNnqkAMURZzDWqtpxIJZP+VvCj4gDDdFwft8VShTzxgss9+1dWVMobbF/3aT
         BKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771321; x=1728376121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMHKrlrsTVk0uUvK/TIRcDwWQtyRXn6XEb4zPPLaQRU=;
        b=VCSrQ6WyEiXEsXy+D1BMRN7uZq596LVxNaQ+611Wzp1W5puXULnOiym2dpI4sUg8Wb
         RxdHBh1VI5J10/mgkD4jMc60W6TJrdj0po+W1cJ+/5Ay6ZCY0D9i+nQXQmjdCjZ45uJ7
         3HJOZxLi0YkX/DoUwpdScraxQ7r+vEUe4zxnpD+cCt02j8gJLCjGQt5siB5ob0o0Jazs
         Stks5+/pYWt0L0xfU6ROZcsGKKnn4L7EIB6va45HjEa7laDPt5/s0aoIkcVrM/km7efB
         ZhZ101RhmlCFCyItvvyecsw4UgSOYw55TEZOYS2EhKZs3ZOqMQeXvdGknhQ9BygoOrMM
         2lnw==
X-Gm-Message-State: AOJu0YxC4Fky5PQJSOWItw129QdwiWsHWm5yTFpVcexBDdUVCLLPAXt3
	ZF8VcclEkF73MB90UXju0/9mC4vhdN5SH9V7Bp+aTEkr+piMMK8LCBeT7TGeVMXwjbPubhstaq0
	F9dw=
X-Google-Smtp-Source: AGHT+IH1j57cwnasgloJtcbW7wcJkrZepHqQTc2J7lHdz8O0LAbs1cBjBFHFUgpKQTuec2Rbkn25dQ==
X-Received: by 2002:a2e:4e19:0:b0:2ef:c281:54f7 with SMTP id 38308e7fff4ca-2f9d41979a9mr60656581fa.37.1727771320743;
        Tue, 01 Oct 2024 01:28:40 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2facb2ce928sm7734221fa.76.2024.10.01.01.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:28:38 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 02/11] maintainers.inc: add python3-pefile
Date: Tue,  1 Oct 2024 11:28:12 +0300
Message-ID: <20241001082821.26115-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001082821.26115-1-mikko.rapeli@linaro.org>
References: <20241001082821.26115-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 08:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205136

Recipe moved from meta-oe to oe-core and
Khem Raj <raj.khem@gmail.com> agreed to continue
as maintainer.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 60f36a9449..b86c91c5d6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -662,6 +662,7 @@ RECIPE_MAINTAINER:pn-python3-numpy = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pefile = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.34.1


