Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDFAE77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:21 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.20319.1734012500381027931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UExNbF05;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166360285dso6068755ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012500; x=1734617300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tprHYvX0NzUskLhhhlsLZj/WbmYATlioevug1wQ24co=;
        b=UExNbF051qyFD0lA2sY25PqedIw5SPwTtv4Xn8QORdZ3KowPbG8pQdWbgTgtyAibS6
         LSZ1EFIH62hLE+pLYey+DvrRhx83t9SDte3xFjttrxzI9PkAkh5uVbmfdDLcRrNCijqk
         7mF7B8AP/F58D8mkBjzP7EHmrjM0FvMRFG3bSkY2oa6+nD/A7juwi3EQXvwxVxZObRQc
         TPPcK0s9n5wBPndFm6QyKUfDjum23C/CWIecnPA7CZQeI1Q5C2aU4jPZTVglE9ft+SQi
         oXvTJsOZBpt1Q8kkreiDXrrraGxbGlBn4F6yoUjjGvbqxcGGgVO7SUg8NziI/+rgqCQH
         0ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012500; x=1734617300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tprHYvX0NzUskLhhhlsLZj/WbmYATlioevug1wQ24co=;
        b=byAZGAn/iVy9Us9b37dyOR7XKJon9mHFgbQMHpQAoTDvf6l2q0ayXes1EkEKJoIA6i
         2APo7zDJkGmSLU1G52PhIO30Idt20NyMjJccIGvCAAZ7BiozooU6fblJfM8662C8aliK
         8jP/qm7dtGE344REbWZnlISIn35cqbXnb9m+/mGpf25p8nz2E1bKnLZ/KXqrTndPwtAf
         IXh/zVKpeT4loQ5Of6wGaljY9GFeLuttp7awwGrxCzBKDRLXLnNB7Nf2Z/b0bCOEFIDB
         y5nM/mB3XwTIz3SbAWVbK6S811fATJ94CsFwV8dpIfwK8WVzgtrB+uXx8zxdZ1OgG+M9
         oKkg==
X-Gm-Message-State: AOJu0YwnC+MVOCnsjAWMC6+1MZoD83OG3OQeGTLK+HOqcluPIMn1HJn/
	tmf1ZvkfvCVHjUkY+QiN8DGXZTtWazIZyIJHWNLNDbUDqnMftpGPOzBNxAZNrAh3/2N6zIMhLd0
	i
X-Gm-Gg: ASbGncukKqaYgyz3QutzUB3ooouDUTXZi0//87iprGRLzt9Dmg4BfDAxEjt4dlqFl+J
	wwWyAkLpWNl62EQcP1+n8H9/Nq3lP2FF77GXOV50sTrzBEMRWY/CbAi/ZsFUamecdYKyU4h4v+B
	XAk2CDv5lCgeLzRr/tlOMdHD+xC8kHsBs0UlvSCj6IzymzDNNYGDG4bXEhSTmYEPYqJFzx1Zjcp
	FvH7hIWjdJinU3NW9M3F/nw1ITNyykR1zvMOLhDJF1AsQ==
X-Google-Smtp-Source: AGHT+IEd4g+ipZLV6T/jw8XlK2u55tTIwne9nQIQffJlC84+Ww/xCUlB+f7nNAkPZ/I4R8ooc9nvLg==
X-Received: by 2002:a17:902:f54b:b0:211:f6e4:d68f with SMTP id d9443c01a7336-2178ae50922mr61022995ad.6.1734012499663;
        Thu, 12 Dec 2024 06:08:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/12] python3-poetry-core: drop python3-six from RDEPENDS
Date: Thu, 12 Dec 2024 06:07:56 -0800
Message-Id: <01a938f176c1eb2f753c2df50ef966cc175a2d18.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208644

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
index a073f8b069..d280721d38 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
@@ -35,7 +35,6 @@ RDEPENDS:${PN}:append:class-target = "\
 
 RDEPENDS:${PN} += "\
     python3-pip \
-    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


