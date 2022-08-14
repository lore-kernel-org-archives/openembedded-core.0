Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70196C28B2B
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 22:20:47 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.10141.1660515643981272276
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YciNNb2m;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id y141so5358016pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Bsh2V94MHizmHMhmKOs74z/IHzcIkouIwkrfH6nI5+0=;
        b=YciNNb2mgmq6DI6vzi553+7LS5nRXrhqvutYBPwcLIBPd8TNZfYpKhWS5FkAUirmMb
         0D9bW4OBpWOz8GmiHEN5owOjj16g2L60tonyad15zcqEJmLNT8anC7GosHis5FzAOkwk
         THs2nVaJvuQD3KBHQm6yahzlrWjNCaazNzG22Eo6EhVxDJ/seCqZ0rhBmZj6iNeeeJmK
         9B7bYmnrN4rn7KyV3xlRerDPKuHMHRjo5ayBFA75vLfeRrRkR3ZoTYqdTNk19mTP2MlZ
         xB+FvQ9mpL62EY6zSrdwKj/R2WCUTWia4GYywxx0PCgIh7E+mPfg+KA6UtC4jV69zCgt
         y7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Bsh2V94MHizmHMhmKOs74z/IHzcIkouIwkrfH6nI5+0=;
        b=H+tdKrJVM2cNY/ljDMw6Z9L+Tiy8XNwCqowJ1lALlJsXGgbHbWs8cC4hENH0hdkwQj
         2gy9m+hCKBkEDzc6vDC582d36/z1EES42fWeclyKbrbDE1kAlU8GCuhrhCecmVp/l09I
         0aPWrl3G0deg+0UvwUgxpgYL+kxI81+rbGG8whQX99/ZlVkD9s7OZhr8EIWFz1Jkl95z
         mBpiYxOyO8KUwjRlLI/TkWn3EjV4Vm3TwK9u6EKf5nOr4vaQE2YxOuQyueQKuYLrIga0
         uh7LUI4gujfk5lhOXtaZNcJaC7Ik3OfeGPffb3pxB/Oats4QFgwYjNNq9Y0+lXQvD7YK
         ViNg==
X-Gm-Message-State: ACgBeo1cTZ/KuJUg74HHvG8e6aXwTffUwZFAzNV3DrlGypgM/AJC3KLH
	Vcd+Oz5PZueeGTpZp9AtPFWzERvAEP1vdQ==
X-Google-Smtp-Source: 
 AA6agR41DD/NIK8YhR1CdaFZgTCObeHWRdTsEpUBDbufaZ6/1X9ckAchtGM3+l+rg41QDGMIo8/h6g==
X-Received: by 2002:a05:6a00:138a:b0:52d:979a:b640 with SMTP id
 t10-20020a056a00138a00b0052d979ab640mr13642445pfg.8.1660515642861;
        Sun, 14 Aug 2022 15:20:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a170902d58f00b0016d8b0dfd61sm5819502plh.178.2022.08.14.15.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 15:20:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 03/10] zlib: Resolve CVE-2022-37434
Date: Sun, 14 Aug 2022 15:20:30 -0700
Message-Id: <20220814222037.283943-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220814222037.283943-1-raj.khem@gmail.com>
References: <20220814222037.283943-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 22:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169330

This is only seen in development branch as per [1]

[1] https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1#commitcomment-80753451
CVE: CVE-2022-37434

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/zlib/zlib_1.2.12.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zlib/zlib_1.2.12.bb
index 77e7a4937fa..d3e0f25295d 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -17,6 +17,10 @@ UPSTREAM_CHECK_URI = "http://zlib.net/"
 
 SRC_URI[sha256sum] = "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18"
 
+# 1.2.12 or any other released zlib version does not have this issue see
+# https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1#commitcomment-80801182
+CVE_CHECK_IGNORE += "CVE-2022-37434"
+
 CFLAGS += "-D_REENTRANT"
 
 RDEPENDS:${PN}-ptest += "make"
-- 
2.37.2


