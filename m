Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58865C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:44:06 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.1360.1717087439314604516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 09:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eVKC3RAm;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52a6ef5e731so1719678e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717087437; x=1717692237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNT0ikjRQ0SxyK9/UGdUAQdaj+jsaJbWV7rrINRQfMQ=;
        b=eVKC3RAmR8Af7KodQuWT0VAuytW6vjeertH5TUXZ3ACJpkAUUgSlDAte2mvrDNge5A
         fxt22uzNjFuMk4eS1E0OlJVwuDiJJO22cRiWkWYpaGW5UFA/eGDXeS/zbX1Zn7+cMtoi
         uAGX0PfKmhjcrryptnDIljVYUd5VzjKEJ93tLH/RMERPM91uaN4JeYdb6iuKQmpfT9O1
         vmgVYLfUXBl7C717X4qehph6DTa8SbQ5EevWBxoeI1VMyTkddrLkojqXix+kBzgo3+ly
         /ectoivWwb+P9pzuBASjFZfxIB5xFWNIo1HJEOj5Rb5RrvOZ9BERG9200gPfqm4z4frL
         3QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087437; x=1717692237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNT0ikjRQ0SxyK9/UGdUAQdaj+jsaJbWV7rrINRQfMQ=;
        b=na/G4tJ/BfvBvKhk1ixLPMhGpY/8MchQTE3cODWXuWarMMC8z3AOF1tXb1d9u4olIY
         nABBCIlQ1BkxEUdu4HNvPbltNQJBfgbeBPPDJq4RpgSNixEx5lO4Tpfk83nYE4vsG+GI
         YEKnjLlqO+Vwm6jT9d7GQ2AlP/S+c5RNRE+k5+6L2HFJtKcu2TG88++djBMawemg642S
         0taV4TGJBxjyEDa0kuXPv5HGmrwKpMQCAVpi43Ajze9rJJXNgvEBnDX0XXKVCvPn+CGc
         o/IZCA81kTRhLg6yOHgT5SU7BIpFMCWfVb+kpCh8prZWtC/AjF5AzMm9WO0c7nuYig5Y
         y1Zg==
X-Gm-Message-State: AOJu0YxmwcMLeUeAcjHshoE87523zEZMSYBoTcMIuLPcT6dHhdOHyMDy
	PP9iDeLl+SAo1c4dKI+mqXI7L39DnImuswNSbT4I69SdQAZqG0INMRk0W8BJ0FctPVbcjW1ivJ3
	p
X-Google-Smtp-Source: AGHT+IEZX0yKxn653BKrG9cg478Fg75sXX5kHlcOKjRaAfqw8r+U0gfXKRo/AUn+HcjLtnzA/XlWSA==
X-Received: by 2002:a19:c505:0:b0:52b:72d2:8ebd with SMTP id 2adb3069b0e04-52b7d428dcdmr1612495e87.24.1717087436887;
        Thu, 30 May 2024 09:43:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d7f214sm11265e87.197.2024.05.30.09.43.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:43:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] site/x86_64-linux: add ac_cv_func_fnmatch_works
Date: Thu, 30 May 2024 19:43:55 +0300
Message-Id: <20240530164355.3294714-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 16:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200033

Other arch-specific caches have ac_cv_func_fnmatch_works. Add it to
x86_64 cache too, otherwise cabextract fails to build ([1])

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3893/steps/14/logs/stdio

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/site/x86_64-linux | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index b9ee141fd5c5..ed9c88fa20f7 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -83,3 +83,6 @@ ac_cv_func__restgpr_14_x=no
 
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
+
+# cabextract
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-- 
2.39.2


