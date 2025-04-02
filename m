Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5F2C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2182.1743577932407042998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h28po3C9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso43241865e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577930; x=1744182730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MIj7kTus5Yo5Vokaze9H6111YnWhhl/LsKMyGSZ9+8=;
        b=h28po3C935zCNXeS3xMKNRg2sUbeGzh2uyWhsqOl6FUym3wUtoxq0Iwd8UVvAhgLBl
         IPS4pj4RQcDDV/pcCGt41wvFUmuSxCDIJ9utufKfk8DQG9DZUJoV3cm0eFt4at+H6a2s
         D3mapzXPTP0WvdxN380TmZuSbG4uqf1aamHzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577930; x=1744182730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MIj7kTus5Yo5Vokaze9H6111YnWhhl/LsKMyGSZ9+8=;
        b=g/OUZcAlIBQdIV7MKzUU4owlpJBTuML1tUPcu4mDAmIahAzF9JFlhSayHw8K1yeXZj
         b+or4A48mt+/8jlTxH6VyTkYPpBxAPtpyOjcUJh0PcnMXInyGoql8TxGRN7NUTejA5rx
         u/3cK17s4JjSS9KlnXjg9f9X2HgzkFzULYd0FJmdxdTGIE10u4RL2nifVtK/SJaJV5bf
         C19Aozlm1c0aLodupdqXBZsu7Cb/aEnuOYmXujjgnA+lynpffo2z+2yP3H/PlQJ46V82
         +p7RNLb6A4J+lvgHHLQbYDMJnL3pal9IsiYRMg+ZeL7BSQrsdE02hDgei54O9lJQEbGP
         clUA==
X-Gm-Message-State: AOJu0YwUufIDg+05pBYWbgK6ZkjsjptUXNJe32eh7Izh/SecjXgp4VJr
	dPVd8rUnHTsVCymaNhXkBr+1/eWD9e9XkJ5d3jLofKrliIvfcOG4BRKVnBNZ+ok1a4gylzABoVG
	3
X-Gm-Gg: ASbGncuD4nIV2ycRhf83EOYFW4rzNAW5fR1WtR7vcGNa+dBpTPWRNvPYSRbknxkIVco
	ITN/7XsNSvdeTmMIAEKVJtDP7t2dlUHFCt53exDbecnq3bE2jtGgWMcqUlpaBtwSMdREWM21A90
	b/femMjRY3rvhNbNL9qu7tb4l769yG1vzeqKdIqJALPSYqS/v0JcGq7n1+8yEXUce9v8TjmjJJW
	tC9v21cLW4xukKgZuVlraBWFZZSpkpgEAv0usEDPCL3ynz3FUlHDpZRNXNVdjDhif5GX2oS+6ia
	iXUxrKu1WjZ909N8jRRz5/QZXNi07WgqaZlwX1OlrULgMia+LMjA2AGuM6Q8EIP8XW1M0XtJbT8
	nyUKfD54i
X-Google-Smtp-Source: AGHT+IEyaJoSU+CctxZBMGi9ItLnfwY2uh2IElPzuJWPY946J/uCyerAfPTJWZKvoB9jM2FvAJLs7Q==
X-Received: by 2002:a05:6000:1889:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-39c12113a1amr12236442f8f.35.1743577930410;
        Wed, 02 Apr 2025 00:12:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 44/48] repo: upgrade 2.52 -> 2.53
Date: Wed,  2 Apr 2025 08:10:13 +0100
Message-ID: <20250402071017.2157620-44-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214217

Add tag to SRC_URI to verify SRCREV.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/repo/{repo_2.52.bb => repo_2.53.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/repo/{repo_2.52.bb => repo_2.53.bb} (92%)

diff --git a/meta/recipes-devtools/repo/repo_2.52.bb b/meta/recipes-devtools/repo/repo_2.53.bb
similarity index 92%
rename from meta/recipes-devtools/repo/repo_2.52.bb
rename to meta/recipes-devtools/repo/repo_2.53.bb
index 2e877c18476..77817c25e43 100644
--- a/meta/recipes-devtools/repo/repo_2.52.bb
+++ b/meta/recipes-devtools/repo/repo_2.53.bb
@@ -9,9 +9,9 @@ SECTION = "console/utils"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
+SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "8d5f03261164f3cd65af0576dfa7d4edded96c67"
+SRCREV = "4b94e773efd36754f6c8649ad55b90d19a61107f"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

