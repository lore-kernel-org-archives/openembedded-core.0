Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0F4C46CD3
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 14:35:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.14868.1702996537549288786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 06:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IFPuSqt6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40b5155e154so58299185e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 06:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702996536; x=1703601336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7NKDTHaF8fv1LwwjSQ1JUQHVZB5W8i34Gd6edgJvjg=;
        b=IFPuSqt6Th9Jf3GP1r3H5CBSgmx5l2eZ+sCBFO/JKCyBaF+vKtP0rR71pkerfeMQaf
         lNc1+40fpBc9KsJUlIH/s4XRXe0LTNZwBcFEULqp6invvjpRlR32Dj1692LAJSSxZxDq
         lvdouqtTJZmlEx6CcXPcafhfb4GlsinaGaeRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996536; x=1703601336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7NKDTHaF8fv1LwwjSQ1JUQHVZB5W8i34Gd6edgJvjg=;
        b=tJUXqlGH+gd+2V6K2tkx9zeIV81SXwYiIupAqOS1p4NFWnFGDJG639UTpS+4mbu2Tk
         JE7LA5AmrNtN4CH2MbhbcuwDupEK2GmW8lUR/6qnS+JHOqaLQ0SiYdM2kORYzn3GTSTJ
         KVs3n8fi2886u+AsGBBnYKAk7MhJvK0VZmmDNK2zFF/aI8oJNSN2cT5JKNb5TmuPeocv
         bhbD8v6txXFlmG2OwW5qHkZj+nsUlVEiR1nYQmmVrGl7xKvnpUZG58/4lkIVjT1WlR3B
         xO1ikmxf/8esEgCe3SndOs7fqAGMDC2hCe3unXPQDXfoUrQf8wDNGfQfPPvIHofAFAwr
         vtUg==
X-Gm-Message-State: AOJu0YwbV02Nort8hsI6LywVKf60GXR37cf3Ta4Her8cL633Ebk/1vSh
	FJfMmWDycfCYrs+pEL5YT/C1MvwKkneljG9T+o0=
X-Google-Smtp-Source: AGHT+IFqzLcqPAk1tjQpPq/pNKQJgEqQAc3JZj+qDiI56IbtO3ySyBYOOqiCIesm4Q46YwrGlVvQvQ==
X-Received: by 2002:a05:600c:1715:b0:40c:24b6:ba53 with SMTP id c21-20020a05600c171500b0040c24b6ba53mr8563949wmn.101.1702996535954;
        Tue, 19 Dec 2023 06:35:35 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0040c57e4ea28sm3168889wmq.17.2023.12.19.06.35.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:35:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] oeqa/selftest/overlayfs: Don't overwrite DISTRO_FEATURES
Date: Tue, 19 Dec 2023 14:35:31 +0000
Message-Id: <20231219143531.3514266-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
References: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192744

Whilst debugging an autobuilder failure, I wondered why it was rebuilding qemu-system-native
instead of reusing from sstate. The reason was it was overwriting DISTRO_FEATURES,
in this case removing opengl which caused much to rebuild.

The test doesn't need that so don't do it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 4031ded0fe4..a20fa6acc2d 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -79,7 +79,7 @@ DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES += "systemd overlayfs usrmerge"
+DISTRO_FEATURES:append "systemd overlayfs usrmerge"
 OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
 """
 
-- 
2.39.2


