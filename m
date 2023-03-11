Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E88C74A44
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 08:07:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.41200.1678522024737868758
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 00:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I+59ykLd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v16so7120016wrn.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678522023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9ZbqKHzgQVMkO1lOfrRRtp5Wuk/EMrykZJu8faF+Rk=;
        b=I+59ykLdpHGlSnjyajvPd5lp0SUt5wSb2EidTvKZbxRxMJ0XbqXKWCLk2RikGOaG7k
         ZY40cjRA6QB7rUrkTNYwyVYvqFjo+p3Ka5UoxdMLPpaQeToj63/zMJwPLp+hNWXnX/OF
         pfJRPI8R8QsNG18mh8MtQOpFrA8v6jZfnOL5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678522023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9ZbqKHzgQVMkO1lOfrRRtp5Wuk/EMrykZJu8faF+Rk=;
        b=2/2hXoYrfndMBW9I2UXnVVNR1vVaPpfiUAqySrhzy7lSIYtqY9cTEvIsbHt/IEzlkb
         osFIXt+3eA2oKzMnrzDCkC4abYgO21faK7+Z11AZIMbnnpB51zG0MqUeG+Iftg6DKoLj
         O6tXXg17jX16kYCcy0X+cKhRQ40qBXRAmzT3va55IxfZjmmy05yRSf0D4SRC/9iWUZo7
         u16deDkyZNEnhxrcr4RXPl0mnXC4a8pkc7qYPuJWUMBoIWFmk2g0IVqVt0TKk+iC69Yv
         L34BHhGtAR0aaTdlp2hL51z3EhCO7fa5yF5G8KFvNUwYwD1qJrk6ADtprfp320JOq7Si
         EGuw==
X-Gm-Message-State: AO0yUKXKCxFQoz+KyEjfRaPmgKGV8vKthUeKjw1qttPQkOFjcIQpLrQy
	70Xzar/udUKTblak4XdJFv0XO8hdOlEXh66jMRw=
X-Google-Smtp-Source: AK7set8Fwm2OBuphSEt0E3RLO+D/OufzPOwLr/VXMxYSlcUCNA1iVriFJu3sQjgrScbBOzpzb8JF/w==
X-Received: by 2002:a05:6000:1289:b0:2c7:1524:eb07 with SMTP id f9-20020a056000128900b002c71524eb07mr17386606wrx.67.1678522023011;
        Sat, 11 Mar 2023 00:07:03 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm1099120wrp.101.2023.03.11.00.07.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 00:07:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base-files: Drop localhost.localdomain from hosts file
Date: Sat, 11 Mar 2023 08:07:02 +0000
Message-Id: <20230311080702.3284172-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 08:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178364

This was likely something we took inspiration from elsewhere with.
It was added in:

https://git.openembedded.org/openembedded/commit/packages/netbase/netbase/hosts?id=c8e5702127e507e82e6f68a4b8c546803accea9d

in 2005. Debian added this entry around 2004 and discussed and dropped
it in 2005:

https://lists.debian.org/debian-devel/2005/10/msg00559.html

resulting in:

https://salsa.debian.org/installer-team/netcfg/-/commit/3c15ee521b2b8f47b34ccc7f610523cd284f2221

We should drop this for some of the reasons in those threads,
it doesn't seem to be doing anything too helpful and isn't what most
applications expect.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/base-files/base-files/hosts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/hosts b/meta/recipes-core/base-files/base-files/hosts
index b94f414d5c8..10a5b6c704d 100644
--- a/meta/recipes-core/base-files/base-files/hosts
+++ b/meta/recipes-core/base-files/base-files/hosts
@@ -1,4 +1,4 @@
-127.0.0.1	localhost.localdomain		localhost
+127.0.0.1	localhost
 
 # The following lines are desirable for IPv6 capable hosts
 ::1     localhost ip6-localhost ip6-loopback
-- 
2.38.1


