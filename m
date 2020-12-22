Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.12041.1608647310694856818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kRfTUXaS;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 19so11956018qkm.8
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j+F1kXQGrcf/tC/9hD5cJRbLMhLw/0exA0a2enYDvUQ=;
        b=kRfTUXaSEmaQJG+OM4Y9yQ24Wz6pVN1ED7W7IpJOZOsQez0BrIjvelBqnnnQAl1IeM
         WzAQ9nTJ20OY3eCRpNeBiOit+HLmY4iCv0d2esz3GNQU5Pijp5AdBwydyUHnvEHlQXie
         TiJSFuUUmtYiG4vJNZBvRi8b6udqQK14h+8HGE4vtjL1sh1IdeH/5um8mQ4iCFG7Lkh2
         ubQcHb9mSiyNcKQOcUxGJj2eVc0ldGbTnB8AeE00Vf3pfUEx3fn50izb7mF+iGqYiEdI
         OyZyvXqg9bLZJSSjEj5qc+Q+tM2amKxd1jIe9jed3by/514X94P1daFomfMflrVTGA2A
         +ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+F1kXQGrcf/tC/9hD5cJRbLMhLw/0exA0a2enYDvUQ=;
        b=cD7nLbX/0N1ca30tL6yPIJYB5KVlk7AMt/Ruk5VSFtVNfEBqrZ78AUW7KrfCJOfoss
         Qsg8IkWFu0O0kugVs8AkQAwPKGyrKhu0h+6QQm+9HloBaygMfN4vozOF67b2p+9EfoFf
         pCFbMza0ATHIUPCHuGeZHPWcs3QW/oj4S9piu/KdyJg8AlhtuEyUYj0XGHrHHKMmZzfw
         gJV3dkBqnXgCQGg4iXPrFDp5QVQUCJNPEOvEBI66gONTHwgZGrmQBj6mpg2xPo0c/TXv
         v5KYQOEheOoyldz7l50XXbw/DlzAws1SOZZsb+2LXJS6VwdLYrZ9tE7z5+UJqhSaV47L
         85QQ==
X-Gm-Message-State: AOAM532bVka+W2moPaTheOCuvIGY4cQ/moEhUAH6gszFBvYNoTwJJEIt
	ctKBSwmgcY1cmlwzXo4cKoM=
X-Google-Smtp-Source: ABdhPJwZSBeTwnzg1IEg5MqLEXJqmJx/QAj9jLJd3Jhf+i8ozmavbNf+qUx6hmV8Zq/DntlCYlDW8Q==
X-Received: by 2002:a05:620a:16a4:: with SMTP id s4mr5628426qkj.131.1608647309850;
        Tue, 22 Dec 2020 06:28:29 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u65sm13169866qkb.58.2020.12.22.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:28:28 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] kern-tools: non-gcc config support and option re-classification
Date: Tue, 22 Dec 2020 09:28:18 -0500
Message-Id: <1f5445ff030a56ceddc337cb93a39f8cf8b6c773.1608646697.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1608646697.git.bruce.ashfield@gmail.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commits:

  1aa9046 merge_config.sh: Translate some env variables to make variables
  6fdcd64 symbol_why: allow re-classification from non-hardare to hardware

With these, a non-gcc compiler can be used, since the invocation of the
kernel configuration explicitly passes the variables as command line
vars, versus environment variables. This means the kernel Makefile
assignments are overriden and the desired compiler used.

With option re-classification, we can inhibit warnings when an option
has incorrectly been classified has 'hardware', and hence triggers a
visible warning.

[merge_config.sh: Translate some env variables to make variables]
Signed-off-by: Tyler Hicks <tyhicks@linux.microsoft.com>
[symbol_why: allow re-classification from non-hardare to hardware]
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ea33732a3e..27eef7fb6a 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "df4390b18a500a1a7d4695e1856971f8e36ce517"
+SRCREV = "73f813024d33432116a122524fd2ae48afc910c7"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1

