Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7E3C7618D
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 09:41:16 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.8295.1678959669343716741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 02:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zz8c87jA;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id o12so4987959edb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678959668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2JulSsT0PkuDB3bP33TEJAHOSVx6nPyWIVUQptsZ5U=;
        b=Zz8c87jAaPmYGCJ15poVulUa1U6U0/gQjN9Bh3kHvv+yh2mKnTMH2JdWKWRDu4VX0u
         ZAptlMdfmMh+/levJ8N6l9OQ/yS+DIfFlVAVuR4laTggNbOWCvU4TUf859yhMCV7kzfV
         zw89xSj4CW9oU+q84ZIY1SMRQ9nIM0v1epMAigZKfdricndT8mVaMb48ftUqYE/v9Lhs
         KoCzQczUs/bOl9d8F8l0UCUOBOJqxBhmc5ooT+ZbiMnm1+wefxUEeRFb11o5VRdS4LZb
         zq0Zl71piZU9dF31HTr6e61sAAKNcVWWkNJwRLyTBn1l5XVEnQJVPRrtQr0tFQrA/vK8
         1HPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678959668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2JulSsT0PkuDB3bP33TEJAHOSVx6nPyWIVUQptsZ5U=;
        b=CZFXZM7yXZe0RtPYM80xl/S7xoi5XQlDMOXRx44R6rjCsJKGGFhs4SbewoBHMlTjzs
         0JfQtScXALiMppmGHqvKhkZcYBNh7UsJS5JBIhG19b8ZHSSDxjiiQhd21YEj+NdqkAPa
         ieC/QraLS00yIvzJLh1salgiPYVcnWjkXEhE1sCqJbLfffQ34UNVr3hi3qfa8Zto7e3n
         IbRDz6buZarTBxYQsmIg8dI+t4SdpzwOygVLHsgFTdLF5i7jf9iS9RSKVy3sXJYH56+C
         wEol5Rifxl10T087MhgmTUGOFAl7bW7tBlI1s824A+2IboWHu9xwKuzqWXKS+Ea2ZixN
         Me0g==
X-Gm-Message-State: AO0yUKWAMG17MUMI1xsGURigXIp5j0QZPGdpqYR0wDsMA9SX04ZJFdqx
	QQWacKseO5c2OAakbPTdu7plrpTHTsA=
X-Google-Smtp-Source: AK7set+tVXwtoQpthiWVKEAkvEiLlGuFwZJ+urOiIcHWHrK00tQhJb419dPGKVWIYZM9/cpiRF+cAQ==
X-Received: by 2002:a17:906:656:b0:8b1:7841:9f28 with SMTP id t22-20020a170906065600b008b178419f28mr8817439ejb.55.1678959667626;
        Thu, 16 Mar 2023 02:41:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lf28-20020a170907175c00b00923221f4062sm3621661ejc.112.2023.03.16.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 02:41:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/6] mesa: allow mesa-native/nativesdk only subject to opengl/vulkan DISTRO_FEATURE
Date: Thu, 16 Mar 2023 10:40:58 +0100
Message-Id: <20230316094102.2628727-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316094102.2628727-1-alex@linutronix.de>
References: <20230316094102.2628727-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178692

This prevents accidental builds of it when native/nativesdk opengl
is not actually enabled (which may cause undesirable lengthening
of dependency chains or build failures because those dependencies
don't enable options required for mesa).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c0b8f65625..775aab9297 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -51,7 +51,7 @@ inherit meson pkgconfig python3native gettext features_check
 
 BBCLASSEXTEND = "native nativesdk"
 
-ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
+ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
-- 
2.30.2


