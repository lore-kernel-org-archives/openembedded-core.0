Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14205D6B6A9
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 16:29:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.19314.1730305769761912171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 09:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OBklOuN5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so109075e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730305768; x=1730910568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z4D/EDBp5XtWI6CYPg3zWb2sVn63FqT1D4/dB/G8VI=;
        b=OBklOuN5nfd7n0HHaWl+y6L8T8GOQg9gOMh8AYUxZ8CpVMPePI+oDxGMM3WR5oyY2J
         lKLS1Lu+jTjsb2sqOYjYeDWZj35xROk28VAucJ4lqgYYsE31vfIjdlM8GcNt9K2DOYlU
         eYqDRbiCRCS6ouETzp5Vn84urDTi7O8xpc8VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730305768; x=1730910568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z4D/EDBp5XtWI6CYPg3zWb2sVn63FqT1D4/dB/G8VI=;
        b=B/sd3qMcAjiwTXRmU8KQqxYFgi7/uU0WKeViMCFdw1c8ByPzjroU8a4XcjXIu1LcjJ
         Al6n8YkIsVNOVtYG4SH5ocMVNgfJbAGsjFyPJ9wZamkz7ZuwQMZlL5zS9d/QcdCWmNOY
         VANUZ8WkF5gHYKkpj6htHUjJgeKYqbKY1ACbs0ILFdrazeA5dl4wmloa4W8hOyPewCZC
         YiH8+NCw8uPK/+YeZEgmu3x69ZjoRSpsbowVsEcsVOMIMqmr45UQ1idTQ/RZctsHbv0P
         z3HX2s6Jzeu4GFkjErR9SRCJ7U3KlD6kRoW4MCZ/cX/BOwo6jb6WseuBhbrNLUSCHD2N
         HR0w==
X-Gm-Message-State: AOJu0YzXQbHF2kE5OzIuIz8NOiJOvUDd5nzbMu2ZBgcTGt/2L2u6yriU
	HdljuMewDikg8ERgGQXDe/AX8BwzVmSZYxTT8+bcUW3oQo9TM75s8OGJyXHvteSXlHzCXhcOiXz
	rro0=
X-Google-Smtp-Source: AGHT+IE8I8NLl5TjLOb6LlgPDDcADcObaQPejGIIUw6fPjt1Dc8asUTP2vtG/4DeDgPqHL2k5L6eGQ==
X-Received: by 2002:a05:600c:1d18:b0:431:40ca:ce6e with SMTP id 5b1f17b1804b1-4319ad2c716mr136528745e9.31.1730305767470;
        Wed, 30 Oct 2024 09:29:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:65f1:8463:55dd:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd97d74fsm26095695e9.23.2024.10.30.09.29.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 09:29:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildtools-docs-tarball: Add rsvg so we can handle svg files in docs
Date: Wed, 30 Oct 2024 16:29:26 +0000
Message-ID: <20241030162926.436367-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 16:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206554

We need to convert svg into png in the docs build so add rsvg tools
to handle this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-docs-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
index 72648e3b1cd..b9ef68eb6d5 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -9,6 +9,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-python3-sphinx \
     nativesdk-python3-sphinx-rtd-theme \
     nativesdk-python3-pyyaml \
+    nativesdk-rsvg \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-docs-nativesdk-standalone-${DISTRO_VERSION}"

