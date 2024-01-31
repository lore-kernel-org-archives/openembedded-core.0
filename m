Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D431C47DDF
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 12:04:47 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.12324.1706702685009266361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 04:04:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rjv0pUCE;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51124d416e3so865841e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 04:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706702683; x=1707307483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7guO2eXt8SXR99wDTplufkgaRKWU148ZhWg9BDLi2wg=;
        b=Rjv0pUCEebueBsXTuKJr/2lPWWTyHIh6KOW1D85qtTB5rYWrBICKoYEQhq8ugYdeYB
         8vIvIsHxbV6ntPFjZVTQJnLYGJB2RoWpbeMyU4F08fel1nhKIgO0ldHw360yoyMy+4Ym
         pwvKFXZMvlVIXQ8EuO8hLrUVfqndjjRQhO9gWUkkwaEud/8wR5TOxmrp2Te5eOWtUF6e
         bSasZ444s/8Q9OooMHSqrevEHLElzRg9enMlLmZ+Kmo321gXANr0etwjZyrWwRioYoZm
         L4/Z6iBMVUFqaZmPx/haizWmB7dQcaw28zL9OXgd0+H0ZxNGXGtztDGmW9ZRCw9iCPRp
         gPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706702683; x=1707307483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7guO2eXt8SXR99wDTplufkgaRKWU148ZhWg9BDLi2wg=;
        b=ljXTiOk0i3kFlB8yoZumYSIIeaNcc1fe4mlAqtrfTVkjwFWOqP3KkCBwU+1BYL8vg5
         kAbdAlxGjoGYgzrlTr/Nwponohy9wbgUuIdTinlGE6pG/CbKWzx3y1R1K2YJc6xNthCy
         /POheXp3jIdbU9YS66h/mFOZac0i8+KrlwXXO7ep93VVxgLWrNA+c+KULZ/IZz4qwoVI
         hNuQa7PrfFy91zxMj6ZYoPG4pbk7HsrBWSSrYrUdeWwkJvcluB41gLnTD2SwxC5AYmh2
         NU5XKakkykUzp9lSbdX9WjGk5d9AF4iY2awKtxjk7EM/ic7ND4rhDrB5kvoUojRlb0BV
         SlsQ==
X-Gm-Message-State: AOJu0YwhXVNwE1rthTu0o75unueNqGDtI/CFEqpNpuO68iDZNACeCDS+
	CWbnvaJVki4lEi3OGEeSj34tWu63TGdAFkvz6bblHox3neDxXqCsiGmidt5m
X-Google-Smtp-Source: AGHT+IH2yB3uSQI1N3fLffqiKb4J26z289rd5JktQ0WElXe0yNDePJWfp6d1nj6Pj/CLyRxLTEJKyQ==
X-Received: by 2002:ac2:5bce:0:b0:511:17b7:db1a with SMTP id u14-20020ac25bce000000b0051117b7db1amr970474lfn.34.1706702682931;
        Wed, 31 Jan 2024 04:04:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c450c00b0040d5ae2906esm1429854wmo.30.2024.01.31.04.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:04:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] classes/package_rpm: streamline the logic in one of the condition blocks
Date: Wed, 31 Jan 2024 13:04:38 +0100
Message-Id: <20240131120438.1097632-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131120438.1097632-1-alex@linutronix.de>
References: <20240131120438.1097632-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 12:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194516

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index c9354734756..ffa0623af1d 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -243,13 +243,11 @@ python write_specfile () {
                     p = path + '/' + dir
                     # All packages own the directories their files are in...
                     target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
-            else:
+            elif path:
                 # packages own only empty directories or explict directory.
                 # This will prevent the overlapping of security permission.
                 attr = get_attr(path)
-                if path and not files and not dirs:
-                    target.append(attr + '%dir "' + escape_chars(path) + '"')
-                elif path and path in dirfiles:
+                if (not files and not dirs) or path in dirfiles:
                     target.append(attr + '%dir "' + escape_chars(path) + '"')
 
             for file in files:
-- 
2.39.2


