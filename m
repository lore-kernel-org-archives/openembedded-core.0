Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC0AC02199
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:01:47 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.112524.1738663304290571299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=bk86lKed;
 spf=pass (domain: foundries.io, ip: 209.85.218.48, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7157cf352so551140066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738663301; x=1739268101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnYMvQM3V7X1+1l/DoGaDg1Jk7T6tPmxuaEfJDQlWAw=;
        b=bk86lKedZRbM4JsLXugsG4I3UFNw8FQ4Kj9kDe8wwORf/XrcG2XzRuAKjjq4UdGHGZ
         FY8fEQdjsM3Zsn9VmkMl2afJsPcwKThQ5zhwvi0+KIEteeR4UDNx+7HIuoQj1fQwRjbT
         V9El7mS0wj1ZOSYkNQ/KqZsqTaAeQa6hnF8XyFlgq+YP3VW1sDLLRD/MKxzWCF9PRhmK
         FtMKGU0A2HwvBdkaz+iL8avWowWIMyxAkx1+qiohrrPC18maqvpKyFq1gJN0N8qRAukA
         TUMi15oam1F4TFkJblKzGuDvK6i0JlhTcz+jm2aR0u5QrYGen6yRFFMK8LfRK1wGNqcX
         GdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663301; x=1739268101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnYMvQM3V7X1+1l/DoGaDg1Jk7T6tPmxuaEfJDQlWAw=;
        b=QIgu0R42Jpm/W9TrOfT4m7Fr8LrQQf/jpZ+KG1AwkMh035JmvkSaZuUMYj3zNIDC0B
         Q1z6lqxU4dFpK5GgacUzRmngjvlG7I3BDdZfPT80WX4+QkIoSbItPKPpAbf7M5IdZCQM
         LfC+5JZHyZGsqgUJ/wIg0bQHN1dlffueT3SMm58EzEcx55kLXjUV1shfYZa6FebhZaGD
         W0QUXItLK1/xO+cVrh6F9z86g8tZnWD94wZEbpkDtRSXZRWX8L9kwyYE7hPgRSHH2gY/
         lQwaM5HIshQH/QcWlWmvq2sdXATnKBoezn4ZVqP+ySXbEPL08MnYBlUm1kHkDti/ogh5
         CJnQ==
X-Gm-Message-State: AOJu0Yy1iJs6FdhqMd7NpcwQ+aq0d4qrM53J7EthoxKr6tTXawoPpebO
	CFdejkwq9gjeALkSox/GlKs2seeBYOKh1k2ZsQKRUVTftBp4nsoCdG4vQ/Ea9GClbC0pEOUBeWJ
	swVXZpQ==
X-Gm-Gg: ASbGncuQXKLTItTpEhxQXfcu0ugh/kaag2i5Qdx4anNu0e+yaOa2+Q+zAW8PJ0mrDUp
	iL3SePQwF9Als91HXDLeNsjt6NbO6DeLB5NopzS/AXhQOQp6wB5lJHQ0obtbHcxfG2CReKrqgFO
	6Hd5ytMLpZ6o9IcIUpAJc82194Q4lpRO7M92S3gARFtuZw6EkLbLgMWfw1zionIA8/3jd2HqxsW
	LFYXRlxemXebJvKoAKLndaJhO6iiwLDuf6ZvGkagPqvIDBSWPWpCMagMVvddWyl2mmnFofs40cK
	Puq69xt1dJxobJpZU22NPmI=
X-Google-Smtp-Source: AGHT+IETfwWQ2h50aOAjmxS5LlArhfbgdN7ew6x050mKyLuy+weQrfgyHZNHo2+EsAR2P5kwQuqN8g==
X-Received: by 2002:a17:907:7d92:b0:ab6:f68d:8b22 with SMTP id a640c23a62f3a-ab7483d03e8mr267537566b.2.1738663301387;
        Tue, 04 Feb 2025 02:01:41 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff724sm899065966b.105.2025.02.04.02.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:01:40 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH 2/6] MAINTAINERS.md: fix markdown style issues
Date: Tue,  4 Feb 2025 11:01:10 +0100
Message-ID: <20250204100114.3749576-3-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
References: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210757

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Fix markdown style issues using markdownlint tool [1]:
$ cat MAINTAINERS.md | mdl
(stdin):71: MD012 Multiple consecutive blank lines
(stdin):72: MD012 Multiple consecutive blank lines

[1] https://github.com/markdownlint/markdownlint
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 MAINTAINERS.md | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS.md b/MAINTAINERS.md
index fe706a19a3..d943ed38f1 100644
--- a/MAINTAINERS.md
+++ b/MAINTAINERS.md
@@ -67,5 +67,3 @@ Shadow maintainers/development needed
 
 * toaster
 * bitbake
-
-
-- 
2.43.0


