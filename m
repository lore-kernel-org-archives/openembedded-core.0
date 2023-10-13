Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01941C46CA1
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:54:04 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.51175.1697234043755422420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hk36qMkB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-692c02adeefso1981679b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234043; x=1697838843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9JhuVumAqX5PMDApghmQ5DljK4nwy/Z8YjoJ0p7NJ4=;
        b=hk36qMkB9o87VYDSbByefJOWKw0h8tvRyR8F3IZMrEebS0WiTHNHJuG73wrLM6AvHC
         2jr5TuQY09HckSGibowrulWIblOzGFGyB+X8hUn/trJ3LzXQllkzq36AoYwwxgRQ863l
         rpiKapbr4seuWLkrBxCbtjpIJFWwe0i8r6q2w/NTQWacHYORorP70AVjKyYCS/6baEg7
         uWudj/+FCizz3cXRW7eg30CbvYeTXSZXrrQd+VGoVcG1DXftJkUaBPfQMW7mx8mzYDKU
         o9fSY5ssH//BQFHuQHZ828KkfQsxdbN1KUe6pqfInB8n2JchgM9LG3OUiLfXY/hEYwu/
         OxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234043; x=1697838843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9JhuVumAqX5PMDApghmQ5DljK4nwy/Z8YjoJ0p7NJ4=;
        b=GpmG0ygexoOBNYnJ41jvO2j6qf2c/OlPmzCNV5IFuz9Llh9tPp4ANvxJfsuz/g/b7z
         NcbER+q14K/kwSMviwjUSnfBHkBC60Sq7Vx/gVn1EP3KmoaMRO8GZt6fF2Rk9dlmaEzp
         /9TG3ijnBN2Bs4qD1Cy6HkLxRh9NXfODUJHJNQIEDKceNVE9BpVLBXyXiX3QJffpeKFm
         GSqcEH3SMWfJVrYLy9im4Yaf5MXdL2P5cAE3Hh2g2+ddO/NVZ8SgcpA0J8yIcbwWPZG9
         3H7OvbAHPJCrRNL60pggvfgZVp+uK3QfamUw6pa5jNeLaZZNEygWo5UheXPhm24KYE99
         BSZg==
X-Gm-Message-State: AOJu0Yzk9XJllQpfVPga7XzZut+mlQsY1xloqG/nYct731egGhjiRl3W
	P/RSzo1stuymUIqE9RFi316zW0xYdQRPVe1y/oc=
X-Google-Smtp-Source: AGHT+IGbiy6Z3j9LiDmC+VBkOkamhDKZeuukdoSYQBgHlgDTAYuouByBeuky4v4IiBNiZPYFjN69rA==
X-Received: by 2002:a05:6a00:a26:b0:68f:c215:a825 with SMTP id p38-20020a056a000a2600b0068fc215a825mr27551297pfh.12.1697234042878;
        Fri, 13 Oct 2023 14:54:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.54.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:54:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/27] libsoup-2.4: Only specify --cross-file when building for target
Date: Fri, 13 Oct 2023 11:52:49 -1000
Message-Id: <d52003dd13cb17e32ccfa717f8462c8301334dd1.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189102

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The soup.cross file is only created when building for target so only
tell meson to read it when it exists. This allows libsoup-2.4-native to
be built again.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4acbd2269931b500846d56885c3304d244e514f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 5abeced30b..a605857c60 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -40,7 +40,7 @@ do_write_config:append:class-target() {
 ntlm_auth = '${bindir}/ntlm_auth'
 EOF
 }
-EXTRA_OEMESON += "--cross-file ${WORKDIR}/soup.cross"
+EXTRA_OEMESON:append:class-target = " --cross-file ${WORKDIR}/soup.cross"
 
 EXTRA_OEMESON += "-Dvapi=disabled -Dtls_check=false"
 
-- 
2.34.1


