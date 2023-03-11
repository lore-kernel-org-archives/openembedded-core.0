Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97755C7618A
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.35732.1678494447580790605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A0m0N9tz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id g3so6565531wri.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnekYFxJMlcmf/QmgYdj8WGpPshoXHzhwlHDJzbsNC8=;
        b=A0m0N9tzTzZpqb3cfVW43A6lRq3Gg1+3ih4nAJNUPTIPtN1TAz4TaYpgl/fO+km01Y
         40fgL6tWIHf2JMt1TpJNZRKkTmOH7FahOopJ699Ms1h3t/kJQxyQ73RU9StCGUbGCDTS
         F10O7FEzRbwWhV55nNcgHku08oq/o+h8O8ZKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnekYFxJMlcmf/QmgYdj8WGpPshoXHzhwlHDJzbsNC8=;
        b=FHP94s+HT593RM/PMmNELqno+PSGRbvRCqZVnue0Gi4pwufGlCVIRQi7ZmjevZzaaz
         7cZYk99qohWcPuYqoC0RXPeGsXllJKN4GY3Vbyq3rOyXxW+E3WNWhHbYjXETrlgTVZJy
         4e1SfhuMrQ54asCCD+Gt3faiN85LjpQs7XKC8LwQ89QUOTudoB2rttBPaDKMW+N8rGqd
         6hJb3+9xpwjWE7U3S2DzgYaijbUxZPw57+vTYynapM9svJLv5rC40QzyebXyp7+imZGT
         xY57zx8ffJId70U41+SFlNpnoEKPE7yC6qlGkrSi0ec3lVZR4OAPvu5Zw16cJILp3Rsm
         Mx4Q==
X-Gm-Message-State: AO0yUKUFEiN0gFojetU16R4x0LDOuI6W4+OcT+jgw/fepelTV3vrOwJu
	1ddHKD9yYdrFnrHhBtiMuszonekMzEb5xzQQp+Y=
X-Google-Smtp-Source: AK7set9vE/peexaOS1EhGeP5qwWJzf7tv6csvvkaNyx9zwhFlk3EE4hSLLr4eI36cUelMqktHD+E0Q==
X-Received: by 2002:adf:e242:0:b0:2c5:4db8:3dde with SMTP id bl2-20020adfe242000000b002c54db83ddemr17619848wrb.70.1678494445833;
        Fri, 10 Mar 2023 16:27:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/16] perl: Add missing procps-ps dependency for ptests
Date: Sat, 11 Mar 2023 00:27:10 +0000
Message-Id: <20230311002722.3211118-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178348

Some of the ptests fail in a minimal image as they depend on options
to ps which busybox doesn't support. Add the full utility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index c233fab5453..e07355d3f54 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -56,7 +56,7 @@ python populate_packages:prepend() {
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
 
-RDEPENDS:${PN}-ptest += "${PN}-modules ${PN}-doc sed"
+RDEPENDS:${PN}-ptest += "${PN}-modules ${PN}-doc sed procps-ps"
 
 # The perl-ptest package contains Perl internal modules and generating file
 # dependencies for it causes problems.
-- 
2.38.1


