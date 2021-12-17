Return-Path: <loic.poulain@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24459C4332F
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 13:37:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.6195.1639748271987098557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 05:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gwVKuRRB;
 spf=pass (domain: linaro.org, ip: 209.85.221.42,
 mailfrom: loic.poulain@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id v11so4064560wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 05:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NjpomhRJY5NcwUf7L0uFiiD8Qp2qwjzKb3n3q9dEHyE=;
        b=gwVKuRRBEkBBI1k5MuRp3lznOBovdFuyGVKIEuMNw7E+FZ//i9c0rjDAk6MU5hUblW
         X2EmK/vSwt2BcyZifv/UExGDk/Jdagi4/lUgD5H3T1FBG69RO0sHZ075FCKi6dqLWc/x
         BopBHr8Mi0KvSr6g3GTmr5kcBFXk0GfLi6qYqwC9Aa280roujNbFHg8Ej6UHfEhjOdSa
         OIrBPyl92GiNHlUHxaReAR/Ft51xoV82bnHu7e+dzPzQ2boSkzjztHNYOo3fIiLxO+87
         6PRUGB6Ec/DjOLuXkns4Isedj/vLTvAYkyAZcHAPlFflSpatao0nlqOiLAbbcG8blr+n
         DbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NjpomhRJY5NcwUf7L0uFiiD8Qp2qwjzKb3n3q9dEHyE=;
        b=GVNlpcLkU5W3QcGVx/dWXZpeZ5m4/NFeIFKE2oF09+1in8p7MSeU7ifzLgIljycbiG
         bf4CWIdDqGf9/SO+Fifo5QXmoNAckdNOB0vkYAXZNwvKmnjWToXiqHVYdwlf+Qj2j2q5
         XjTUkZrftNHJ67t+sma7mO/JmiH7GmsYg5X4Ssa/9fLFLbaMidbTCTz6/NgoBssHrZVu
         /ToOwi9KxeAP1ldQzBjsIxlZrzrDPqiGmeSsQWZhiPSv5yXbl3bUbCJPBao+GvdmOFa5
         Qx7nZQ+/lQrrTVfO/gbQURvadLFF8yno8cBxui8K7ImXHe1kh+he/h1fIusw9T3aZ8lH
         P8CQ==
X-Gm-Message-State: AOAM530nySBuN/EoCR8vDC+gZnEzBb4an4hwNBh1LW0ddSZIv3TebT6W
	8DAt/i7wASbCR65xYmNimIb7DGu7h8opKT3L
X-Google-Smtp-Source: 
 ABdhPJz3gmdr5HxDDa7z8l5K6ABRghc4XOEQ1hoLm2ruOSpUsIOlFdoHct0D3oH2Q7UstBhNMv8c3A==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr2585407wrd.704.1639748270287;
        Fri, 17 Dec 2021 05:37:50 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:9c6e:200e:26e7:6955])
        by smtp.gmail.com with ESMTPSA id
 k33sm4178752wms.21.2021.12.17.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 05:37:49 -0800 (PST)
From: Loic Poulain <loic.poulain@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Loic Poulain <loic.poulain@linaro.org>
Subject: [meta-oe][PATCH 2/2] libqmi: build with qrtr support
Date: Fri, 17 Dec 2021 14:37:44 +0100
Message-Id: <20211217133744.10922-2-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211217133744.10922-1-loic.poulain@linaro.org>
References: <20211217133744.10922-1-loic.poulain@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 13:37:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159826

QRTR is a virtual bus for talking to Qualcomm based modems,
either integrated or PCIe.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb
index c337abde3..1f1179865 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "be01ece0ea2c2194cbea5744bf5aaf06c04ba5fb7ec7887a13116c76d114fedd"
 
-PACKAGECONFIG ??= "udev mbim"
+PACKAGECONFIG ??= "udev mbim qrtr"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
+PACKAGECONFIG[qrtr] = "--enable-qrtr,--disable-qrtr,libqrtr-glib"
 PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
-- 
2.17.1


