Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA528CCD192
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:49 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.9217.1760038308885719046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fC3zLqQg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so1217523b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038308; x=1760643108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Isdfl5mDA63wNnTz7gfE/Fml4qDiLg+sYcURB1cq3E=;
        b=fC3zLqQgKg96sPbLux3e/xU1wXAMvBWthlYon9mMgkXNaHGVXDFXwzwotWlY9yszfj
         zsdgrw3oBxwB4/hWRSfgtpo1m/GvqZvID+46RhgkbugFxi3RmnVO2wHPOAX/ckBsEqWZ
         L6VLyrZ7Q90gXc2d7XP7Q0MbJBinB7VhRUMUrkjx2V7RtqOwEeG4Z3JRltU/EPWJkoN+
         +zQFduQsjvCyGEfEFXsBpe9ihV5/LfNy/L/QxIhNZxyM18MIklvy3qG/SBdsdupLwgVZ
         I0QW48JsbQIcokyOWZlQ6+H3LT0E6/Aci7x9xjcXH7kgDSzfBppQvUjENyIUlhOXzOmi
         H0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038308; x=1760643108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Isdfl5mDA63wNnTz7gfE/Fml4qDiLg+sYcURB1cq3E=;
        b=fmkBRqPRUvT9j32rQSJAJR6RKpK41kdj7yJpqa2cpe5nOq+PnXKv0D98n+RTqJbwx2
         LVUg5Qay9urWHGJFAThr8qQqtORsRpKne34b1ExgY5fzQbO9yq5Z/wLcSiwFndgShKtg
         PrWEP8IjIGGQjTW9B+7t0cfQyVyab+EhIC1gmOb0CckWLZMys0Y0qX/r5Ty9SyZXr6aD
         C56Uh2W3SC4SKGIvUcJA1K6rXzENqwpDZ+9rC+8z2LDfvoO/VqUXi0R44k43Gc6H3F7B
         QkxlQAdr5WMNd4G4J/Mn35vAMkNSraq1qdb/BDSow7cw2whfMM+6zhi67wzSiJSyYee4
         wg0A==
X-Gm-Message-State: AOJu0YyAe+YWC10BrNV/cJupiKFYIHYibBkPORp9vpGldgHTCKFKXq9v
	8/L+sJV5iMBfrs0Hav8/iGX1n22tDdXB91r68BONvHnqfc/2XWCOmQsvx+sRRt329RaB2+dlnUx
	BFiZI
X-Gm-Gg: ASbGncu+Yty4DNx2wfkvMEXaQN7qRGaAoLZZ9P5JvelJEsyjWC1MzBFji3UlQmBsxOm
	21OCW0AkfeKN04CR8nvdmKc/lPlHMBoYIJUzHKSQyspv8qLTnD5wP/k6xHXOYX6Ey9LJygt58Da
	fyWDfFjWFeQVU2VrFUnpicDdBTddUxSJqFChsgnLvIylBCEewEsD4jbfGn54gDswvgRR6/qUKAM
	kxzMEvvWYFF73sjBTYL1RfBA6QRPZbmU1HgNEVYtawX2KdrKPqV5WJti7giH6IYJOQZCq0WW/TV
	VnLH8/Ap32SqMSCUtpyJibCx5lDJsLZgDyzjz+Vt+3sAEYOtZ9y9H28O550VVV7M5NHVUhxBnwZ
	hq1pBB1scxPVAk7QiMJXeFxzOUhB5tGBCrifRyA==
X-Google-Smtp-Source: AGHT+IHi9MuKQF7YWkUiKiTBJEsKEbt992m5R4YOyuG1+8zBf8mphQaPNIX9JkyUnRW96iA9zTtfTQ==
X-Received: by 2002:a05:6a00:2d8f:b0:781:2538:bfb4 with SMTP id d2e1a72fcca58-79385ce2724mr9305850b3a.10.1760038307861;
        Thu, 09 Oct 2025 12:31:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/24] systemd: backport fix for handle USE_NLS from master
Date: Thu,  9 Oct 2025 12:31:04 -0700
Message-ID: <4b612ae7cbdc8327765c34d0e64fa8e0564891d4.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224639

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Do not build translations when NLS is disabled.
(From OE-Core rev: 83795ef6c3fa12a863cd20b7ec1a2607606987b6)

This change corresponds to upstream d848b454e64ffbd642590b4bbc378619e1547ad3
from master .
Since the systemd version are different between master & kirkstone
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_250.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
index 66d20a46fd..087c0035eb 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -235,6 +235,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dmode=release \
                   -Dsystem-alloc-uid-min=101 \
                   -Dsystem-uid-max=999 \
+                  -Dtranslations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
                   "
-- 
2.43.0


