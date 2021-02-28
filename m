Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.7686.1614526648302008262
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YtQNBB94;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id v13so912680edw.9
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jNl7niQvzq7l+SRHh46E/oudCg5gc+x3vGPqIwyJjtY=;
        b=YtQNBB94cKyjJ3T8Lk5/ivBk0DCp543TH+By310gjMvO0SsI37TlbHlTGs0apmi2dV
         9ewRfoJgwobn+31VLYG+nJO870X6ufM98OOmYU9JvEIDNydR6Ip9WzvHeZ7ItBGgBTQX
         spriQaka90v2nNtlZn1nVSIuGc08w1ivX/5tOoprReMaWVwl3xKbocNbUlKN6JvpzghW
         Dx0sbskWfJA57eVBpkYMAZC0H4C9uRwKsR4on3SaJlzSoQxF8BzVkqoWykD+fHr52CvI
         wnKrhQxyKMQy1vWJBfpU2wE+PH737pJFkqmZGHT+xJtSBpYbHuEfO/9dUQQfLYY/T13S
         kyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jNl7niQvzq7l+SRHh46E/oudCg5gc+x3vGPqIwyJjtY=;
        b=ppLAP8PfCxPqBpP/kY/PMeDq+XwaapaOnfIIhd7itEkNYKh58cOiR3bNEFyh9dpYac
         /GhWTJLEikIGAsZ3705RMHzLPvD+bEDeDDWNGAATU6aoQzQbsErNl1HkmcrOmKpZYOhZ
         Cde82fnrwVgsjWJUiX2B62/9Y6ztcvvJRKm7NXXfLzSx8vW+EyHVCNBC5ZfNhLykTh5n
         sTVshiRhGkSRatpH5uAQwTKj2pnKvlBZc2EzJFzRrSFvlC3L/oyvUz7suUFcoOfF7mtm
         BzJI2eM4bNaBnulS8WNRegpSYrlss0VGshZ21RsphNxgiYRpmYNDYx2nejxb7giIblMR
         m8Zg==
X-Gm-Message-State: AOAM533HAOiMyZGWWlL96NUeCp3ShMkWzqrzRPHoZQXAyL4zpQ/g5Mz0
	1XZkM2ELneI6nJilma6KGWV72qPoe4xFHA==
X-Google-Smtp-Source: ABdhPJyP7btFy110imigpiS1zW8yoZoW+XS6b3uMhhJaR4hR9njEz4ECNgJHtEQH6PGWGq1XB4zg8A==
X-Received: by 2002:aa7:c3c4:: with SMTP id l4mr3178719edr.335.1614526646934;
        Sun, 28 Feb 2021 07:37:26 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:26 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/24] scripts/lib/wic/partition.py: do not set FAT size
Date: Sun, 28 Feb 2021 16:37:00 +0100
Message-Id: <20210228153702.498275-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modern dosfstools automatically determines the appropriate size
and will error out if something that doesn't make sense is
supplied on the command line.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/wic/partition.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 85f9847047..76d144d12d 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -339,8 +339,6 @@ class Partition():
             label_str = "-n %s" % self.label
 
         size_str = ""
-        if self.fstype == 'msdos':
-            size_str = "-F 16" # FAT 16
 
         extraopts = self.mkfs_extraopts or '-S 512'
 
@@ -422,8 +420,6 @@ class Partition():
             label_str = "-n %s" % self.label
 
         size_str = ""
-        if self.fstype == 'msdos':
-            size_str = "-F 16" # FAT 16
 
         extraopts = self.mkfs_extraopts or '-S 512'
 
-- 
2.29.2

