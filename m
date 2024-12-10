Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00155E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:56 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.3990.1733864210854046669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x7j24HtM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee76929a98so24100a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864210; x=1734469010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDfKXU0FA1s1BPSF2igSbuN0hWc6qDSkeX5lX5WgtTg=;
        b=x7j24HtM8iNrjhHeO7w3pF+ztytwXAMTrW5KdZDquGHi5txOzfK4cdd8EnTfS4tOin
         gcSMtpsLgRXUBftK66Ga2k7LivAoLt/eAyFOzmOGhjc8HLB9kXSbxUOYFKLuYZlMvhNG
         KVb1kRfkEXT/T5VD9iAg4EsbqsNlQGuJ53Av2r4W0hExaqNS8lPwtU5FxAiouYTlOl+i
         +83GdAtA0JH7CfwZjAyWnUY1cUGRwZziQUA44aEtraOwtnj3oVI73t3ghb8dSyTNBTE6
         vQPx9IAEMhGuncQMI7M5a9RXSB5bulljplJFdcVUCBZ6N4M9I3fzmnelInm/WUmNweR+
         eeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864210; x=1734469010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDfKXU0FA1s1BPSF2igSbuN0hWc6qDSkeX5lX5WgtTg=;
        b=o4Iw6TeGmUm5XOXtfGsVL9s2xklKdBHxHEOt+RlHHSSxAMVDZiDLfWrAj8FZFEKCFf
         PEfEbIIjhw7nvlKnV6nfLyUXG8ismrnYV1IIs/Qx8syP3hJJ2wlzSDE0zCaMIlQNSCT4
         HHaVk5/yLFzZ8VJVtBIPGD12+V5eIQQbzHkBD9U0Ek0Cwl6DwdhKvT0ru8KkusZZGeO5
         wlNIqGmVScKj6y5O3RtxfM/9y4tIcttHuU0OOEzPnLrv0fnOkHpDnC1zheaOjKYkRT6z
         rTayNpYZiU5vjTDUaqDxZBhpgJQNCdfAC33YKe/kSDU0EHizoD52p1FBAvs5WXfNrE/6
         WmPQ==
X-Gm-Message-State: AOJu0Yy1qEnqJz9SkvqQrdbJd+o9lH1opKe+WSYAd7Xxgxe6hVTtM2TQ
	92tfY6Dyp4in7iK8I+OP+cL0kn++DoZQtKhREyalanaRAuYKiMShBTFtizBR/+WY1RQ1jZkeWaK
	j
X-Gm-Gg: ASbGncu3I97XkNrrUCy/PV1KIvEbS4wNnA8kvYGy8YMHgO7OHnbd/kA4n9QWQSfx8NT
	62r5+/Ff5X+xOq57b8RIZWvXjUQ54CS3Xwb/qLx6D8GcYrodq5OG/QgsBw/Z/GTmtB5L62Lz9Dt
	odE8xwrY79sxVKKF9kfPAQSJWmttxW7thmff0QDuHao0u9+aUX3Zeh6kHU2yGvhSn8Nn7aLCczT
	P3T74mGiNOmqgTlGSmMtgvL6sH0vBTVPNCqjqLClRQ=
X-Google-Smtp-Source: AGHT+IGa1zZIOPzRfloBXuzJvUkZ86JACD2xG6g+5LKtDZqoLEdQEnchrNW0gssbv3rp6d7OOnIwdQ==
X-Received: by 2002:a17:90a:a797:b0:2ee:8253:9a9f with SMTP id 98e67ed59e1d1-2f12880d2a5mr283317a91.11.1733864210158;
        Tue, 10 Dec 2024 12:56:50 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/12] python3-poetry-core: drop python3-six from RDEPENDS
Date: Tue, 10 Dec 2024 12:56:26 -0800
Message-Id: <09378088bba46b6e505f69381496da0ecd0ecf2c.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208553

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

Looking at the history, python3-six was removed as a dependency
in the poetry.lock file in v1.5.2

Even before v1.5.2 and until now (v1.9.1) there is no code in
the package which imports the six module. So it can be safely
dropped from the recipe.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
index 540fdffaed..d1a8b939c0 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
@@ -36,7 +36,6 @@ RDEPENDS:${PN}:append:class-target = "\
 
 RDEPENDS:${PN} += "\
     python3-pip \
-    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


