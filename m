Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD66C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.12510.1641927739252130901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C3CY5PyG;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so7022195pjf.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nCVgGienXka776ETwaIEvXAmeyFzlmgC1EXf3QZUObg=;
        b=C3CY5PyG8gJUZ5t1XJiYJvHq6FsYMmgcMcxCKI0sIL1iJHt3f7VHfThR7WxGuG2E8e
         2fk3f0s9mMHYAxhBloh8JkS+V+nlKsPSyKJv1CH9h7jJJUy9LKbBrKzA+DrVjLmayr7Z
         EDrkoh26cEsnWartJ4oK3+T3Cjx0ljxWS1W6Vj/uU4+Ay5yXIiDrUXnvsdnDTaDzJ278
         7IZ6WYH9J/SXFzsFyHSgdPxfBvH9YQ+oc6H8TXNrQe+ydE7xVJrA/PBFllhAaETvivYj
         wNVrZQH0ySctUmdK7LOpVlqhxV/vyFm9YNxuZAQXkNXmmbkgLMeqbGH9yXkUaiuG2703
         Kcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nCVgGienXka776ETwaIEvXAmeyFzlmgC1EXf3QZUObg=;
        b=NKV3rPbKIDaKxGmYEsW4gxPoFOy2prCJCcV9VWyOtuzorGEFQSZf+0JpE6wvpoRwiJ
         JE5TWXRabRsoW1jV8Yc0P6HqXK3wE6bDhM/LC8DBY0jXDkJhYMIuIqaMKfr7+3gOsrhL
         a07PyYMIL08HghUAF4O1WZY5kQ1Dl/OoDOVZz9MR99E8AZOjrWyV2WRxcHH6oBCDLb17
         XvtqnZyuWuPRQ7tZPuf6BkBQIu/3T9OSAan54Ajnxfehp6LbPLv/5ZFEl+m22+7kJy2Y
         IM6Rjp2D6G8TNU8zk5M9NdqIsXDdXPnxp1biiW+5uv65WQmXs4fVUYeEaLMYXve2Vx9J
         mOgQ==
X-Gm-Message-State: AOAM5335svN8BA+mOXV4tsG1tuB0Dj70YRMHN12r57ap5LWVmtuDqq11
	zxYtTZCdpYwjr8V9h6eoNlxJuWLwWTw=
X-Google-Smtp-Source: 
 ABdhPJyTPfCLEX4pmNbI2rUbfrjLbPdnTUVqKQ0h/x19zfjVn1/uFH9PEc8grWS/Ct0PrVfNcxDHtA==
X-Received: by 2002:a17:902:e8c9:b0:149:b88d:5980 with SMTP id
 v9-20020a170902e8c900b00149b88d5980mr5765207plg.171.1641927738520;
        Tue, 11 Jan 2022 11:02:18 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 07/22] gpgme: inherit setuptools-base not distuils
Date: Tue, 11 Jan 2022 11:01:16 -0800
Message-Id: 
 <a7218b299b24f1be42ff96c4d6dd368f827f8d82.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160443

What was distutils-common-base has been merged into setuptools3-base,
since we no longer need to support python2 and python3.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-support/gpgme/gpgme_1.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.16.0.bb b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
index 0ab30d93b9e..d31e1b3132e 100644
--- a/meta/recipes-support/gpgme/gpgme_1.16.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
@@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig setuptools3-base ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
-- 
2.30.2


