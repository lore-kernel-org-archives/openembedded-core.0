Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D109BD2FFE8
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 10:01:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.18927.1729245704748073502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 03:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h8r3w9uj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so1452593f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729245703; x=1729850503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgzpiH/QH+/WiBlxdvAEez1dCRlvCLDJwiqcy0EiqfU=;
        b=h8r3w9uj6HPBLho1EAFGnAQr0DYFMAbepJfl+s7lXYPr3rTdMR3x1E8EWAtJc3RWhi
         xoRTPtcSFWxUi60aTBCzdOgj2rcRAZsAQ1aei3yMtN+H2bvrZQpQE1IUEjmJaBydbMny
         FEnW43rVlDWbroIqIFF0npSJPTWIoRpTuq+ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245703; x=1729850503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgzpiH/QH+/WiBlxdvAEez1dCRlvCLDJwiqcy0EiqfU=;
        b=kW0B6V037Ovn6oLnEYBWd7ybRFnp1G+riZ2ftgGqA2M0K6ueZKDTF0kWgczUZ5fx+/
         KsF7RPJTrUfDY+pQM//mWgbu9YOg+WXITytddk9xNqacRhqac6O+VsmUEhryxXGCwKjo
         FXXUzEDRYBURefPJR/SzYD2OMn5YDsiG6rYST2IleULhrhsOWyUPsdMMOjbI60QFVa3X
         PZaFLvMHe/Fg7A6asmr593ZjTsLafPiafqDCeCCh0/8T66Wh69ICA7f3nUKS+1gpoPu5
         SD+TnhrN2UkSm5Abi0pUSmCoRUI6H5O1NM/+iXLZkrP/2SKCdWXdw2+bNIE/eXDm//ki
         A6gw==
X-Gm-Message-State: AOJu0YyUNS5VvfOOOINIeVuBG7H7Q+BQW1ASxITAt4qQQ1E2ObDcWyW5
	JO8kJO2Ecv/IZS1NhIbayV6wP5mGaxCJxO22oxDMkP+gvZpoK3ZzwmZDq96yqowYCm0+S+4hQ03
	+
X-Google-Smtp-Source: AGHT+IEQpr3Bpzsy9gnaefnmyzbaFmSgEdwkAXmJ3m1wop57PidoBDIjwxfB1googNXWgYsAM5q/bg==
X-Received: by 2002:a5d:5512:0:b0:37d:3e8c:f708 with SMTP id ffacd0b85a97d-37eab4ee7d5mr1374975f8f.20.1729245702828;
        Fri, 18 Oct 2024 03:01:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b6b8:7e19:2b4e:cb76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed5e9sm1491533f8f.76.2024.10.18.03.01.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:01:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] subversion: Upgrade 1.14.3 -> 1.14.4
Date: Fri, 18 Oct 2024 11:01:38 +0100
Message-ID: <20241018100138.2341819-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
References: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206049

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/{subversion_1.14.3.bb => subversion_1.14.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.3.bb => subversion_1.14.4.bb} (97%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/meta/recipes-devtools/subversion/subversion_1.14.4.bb
similarity index 97%
rename from meta/recipes-devtools/subversion/subversion_1.14.3.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.4.bb
index 1cf4e1734bd..0f453db2473 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "949efd451a09435f7e8573574c71c7b71b194d844890fa49cd61d2262ea1a440"
+SRC_URI[sha256sum] = "44ead116e72e480f10f123c914bb6f9f8c041711c041ed7abff1b8634a199e3c"
 
 inherit autotools pkgconfig gettext python3native
 

