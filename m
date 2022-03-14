Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50792C43219
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.3336.1647298134316850004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZBN+qOpF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id j26so26345251wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1eLpgNsrTVDKpK/jx0V7vRi9/jbMOMZVgL7j09dqR9k=;
        b=ZBN+qOpFGgApuq2oD0cebT1uH7RnFQiHfWM5Q+Cv23L/agA5cpYQItMwpikI3pf9x2
         v4eUu3TEoeNqeIaTf5llTV5hgLDR6uKM9RXqolYjnKMatpW/6yN87lzdnjOeJYdYbtdj
         oN3xn0hce7AgEE3NBknXLlqHrFZ0P1qplURSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1eLpgNsrTVDKpK/jx0V7vRi9/jbMOMZVgL7j09dqR9k=;
        b=38++H0hLgb10fwNOu2T7jTRCPh19pKiMw3tpkotBEC2oOSaP3hhGTx35UK+CuM29rb
         yp+Q1cKZ5zA05qnUq1XbK6f6EvAJ8NtPM6BgmDc9saPlkIUv9/ECD3c9nhz/RBUNA78j
         QedH7k+nnWXfa/RQIMjIl+eGzPxkO1IWLo17dd+x35psrIWDrR85rsW+btlmqbpECRuZ
         C26sLAfpjJoX68HLxTYFfPcY0d9rwgolKrH9QQrxqQRdQuk3p7wN9mbs6pzatJBi7ohh
         hHENyijCMdvjq4JnIx0dLZtWc8DeM6s67KLsGOXM9mNF9deS9kz23q3Khnl5DzzRArHc
         uawQ==
X-Gm-Message-State: AOAM530svtCy5iUGc3x7TFj72gDB9eBcL1wDeXYUNz1McxfWZvk/7gJ6
	RocUh4K4+KDQdb+wLGbOnVbEkOLB6slVG5jX
X-Google-Smtp-Source: 
 ABdhPJyNtMi/JPY15kcoybaG9HgzY5Kjw30dP+ooiNVP1+UCs4Bf0vnFLCWl/5BOuKnj/up6hysIvQ==
X-Received: by 2002:adf:e508:0:b0:1f1:dfed:7d56 with SMTP id
 j8-20020adfe508000000b001f1dfed7d56mr17635511wrm.440.1647298132688;
        Mon, 14 Mar 2022 15:48:52 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 14/33] poetry_core.bbclass: move from meta-python
Date: Mon, 14 Mar 2022 22:48:18 +0000
Message-Id: <20220314224837.834776-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163180

From: Tim Orling <tim.orling@konsulko.com>

poetry.core.masonry.api is one of the common PEP-517 build backends.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/poetry_core.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/classes/poetry_core.bbclass

diff --git a/meta/classes/poetry_core.bbclass b/meta/classes/poetry_core.bbclass
new file mode 100644
index 00000000000..fb37c78c782
--- /dev/null
+++ b/meta/classes/poetry_core.bbclass
@@ -0,0 +1,15 @@
+inherit pip_install_wheel python3native setuptools3-base
+
+DEPENDS += "python3-poetry-core-native"
+
+poetry_core_do_configure () {
+    :
+}
+
+# TODO: ideally this uses pypa/build
+poetry_core_do_compile () {
+    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PIP_INSTALL_DIST_PATH}')"
+}
+do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
+
+EXPORT_FUNCTIONS do_configure do_compile
-- 
2.32.0


