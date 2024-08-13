Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA942C531DF
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:02 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.70858.1723551415823313362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RMYYjR2l;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb576db1c5so3595401a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551415; x=1724156215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPFvjBcypVcCWSbKgsCCr8EMY/59+zIv1YxAOqlWPJQ=;
        b=RMYYjR2lMXGwZFl+18svurKgWnLHs5pgYAacPTe5tOaoNmGxpt/GogtycMS7unItMj
         EFMMFlfTOwrNVOPKf3raJxvw0E6GLi6NbNUZjCY070E70qcJiFZvgkIUNPgRclgu1kOw
         7/zQIVC4gtF44UZLWkIqRewpX/hdMYxvFRWHhfEv9meSrlnaNUyQ77iIxmOarWGGRUMg
         t+qugeo0FZHGcOALsc3LDGAweQ/Y1f0E4WBmjP01yJDTiwEQ5zzdgfbQbYbnEISaFFRk
         1zyqRjhTlCXstkMOnVJ8LPogj7LcPQIS0AzmjGmAusOysDK7GCMVTqV7HXIijHHhJhJc
         ymxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551415; x=1724156215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPFvjBcypVcCWSbKgsCCr8EMY/59+zIv1YxAOqlWPJQ=;
        b=HzPdPcvLUyvK2r26gw8cuIS1EhRpolXDxQ/Rw+UaiX2NE3Hbp2htmcw8oj1Wy+zD6n
         NWcAtWAwM8gm5GIsveU3Dfb7OXzV+llP4xXNGSeErAcxBb5gYZ0bwQzI9XJS3rIyOCZH
         Z7aSnUgMlVFISI1OXEQoAmQMEjU8uzdr7dy4HRARIQX2qECCVk0h/SMT0r2PplD/5jmP
         D6DF5EfXzohPGM2lq891MpCX2kMLHK8fSlHrD2yNRah4hlEaF7M75+FMF5HC2E2aWXe9
         UGWkHBHKxYBUOW+y3NI2pdMPyIyaotx59V0Cg6rN2bsxPw1dlL2/La8JC++tVdAxBryd
         rptw==
X-Gm-Message-State: AOJu0YxLiAQr10hS55sdk3MXzd+tPcqqofK9sktXoF69XgsjfR5JGSDo
	Y4kAiFu/jivDvxUVI7ZODsCNhwR00MbzPrwhWATWDQJpgnvQ6tMIsfmNkR1TKl6z7SG6FplVidE
	8+38=
X-Google-Smtp-Source: AGHT+IHV4gvwjm1gaCdAg7JpSJxkUU3H5Zsn+duMN1d4uDJ12aXMsEBOUeBBm5Lw1bfM1kPdJ7G0UA==
X-Received: by 2002:a17:90a:cc07:b0:2c9:8c34:9754 with SMTP id 98e67ed59e1d1-2d392546aabmr3705191a91.21.1723551414971;
        Tue, 13 Aug 2024 05:16:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.16.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:16:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/11] libyaml: Update status of CVE-2024-35328
Date: Tue, 13 Aug 2024 05:16:39 -0700
Message-Id: <be8c629dcd0aea56d0fe77a82afd21161604e74b.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203266

From: Peter Marko <peter.marko@siemens.com>

This is open yet but seems to be disputed
This has not yet been disputed officially

Based on:
OE-Core rev: 4cba8ad405b1728afda3873f99ac88711ab85644
OE-Core rev: 7ec7384837f3e3fb68b25a6108ed7ec0f261a4aa
OE-Core rev: c66d9a2a0d197498fa21ee8ca51a4afb59f75473
Squashed and converted to CVE_CHECK_IGNORE syntax

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 4cb5717ece..f7c29e7e0f 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,4 +18,7 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+# upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
+CVE_CHECK_IGNORE += "CVE-2024-35328"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


