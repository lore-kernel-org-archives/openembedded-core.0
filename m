Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.7052.1619703693022194164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 06:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SRe84FHN;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id h8so38499599edb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UqMzvqbJ3IL/K3erCYcZvZtW0hU8uVeti64UyEFqAQ0=;
        b=SRe84FHNd0kJ3WRr9d6mjlErgaJBQ4PYyhbXaI5NrR9d4AoJ+p7CCa3KPK7zAr6ZH1
         V0wjCNWYJ3MCaEUXwM/sKbf0tiauyvp/Hsx/FB7JC7zOeV4HbXD0qqiWPRkamkQkAc2F
         NlEGfMmu3PFzzs4PqfqAE9SCK3Qckya6/KQDcMUjqUQA2FgltxhSRxH5B8GxLwF1msXT
         PFr+DCZUet1A23cVir5to0nLROXV4+TmTj5eV8qU7MkPys7Gk//yWOfzFZFooi93/WtJ
         HdAmmezQdTu1pnBq9A4/5IaVdhYeO8rwuvCWHvr4hxyhrDwQoYjmVFEO3Zg5vnodsfk6
         PqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UqMzvqbJ3IL/K3erCYcZvZtW0hU8uVeti64UyEFqAQ0=;
        b=MbvFRBVOrl2x8WNk8WjVq5u7JSERFYfwdjZKqMWn8ygiCrhfneSQMGfxI2ktkuSMO0
         WMLh5RengfrhN2+VicExvz0r+CYz1l6qv9SkfJsikWpWgRfO40ro/zA7PpuqGqpGNsqI
         qw9RoYtBAOqCnAv+VzNP5LEDN4FrZ+wYNACBS5yvPdHMoONymNU3hUF68SD0kBQLIikk
         sNYdbc1q8XENWP8vgvNwWnIz4Jo2Gdmj293LBa3ExoH0XWnMOSf9dEHHcxpxEEBQg03m
         VJfrrkd9G8jJUi3PPFZGbjAGzs97iDeW2+9k8JABPGxaCTmDImUMsStOq4m5Nnxc49s7
         gkQQ==
X-Gm-Message-State: AOAM530fTufYjHEcRc96NwHgJubxmEU0p/JNUBTBXOu0NMKj5aKUexj6
	srO/oSnErnCfJtLFD31qTVReSxc6jgw=
X-Google-Smtp-Source: ABdhPJzbOeyGpvRLR2z9cheVwr69VKpy9r9EveJ5njApxrKsCI90AH4IlllTcYwaV8EBvLlf8YRR8Q==
X-Received: by 2002:a05:6402:280d:: with SMTP id h13mr10807782ede.105.1619703691520;
        Thu, 29 Apr 2021 06:41:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k5sm2178709edj.84.2021.04.29.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 06:41:31 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] rootfs.py: find .ko.gz and .ko.xz kernel modules as well
Date: Thu, 29 Apr 2021 15:41:27 +0200
Message-Id: <20210429134127.2538183-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <41abc44a9ccb16871c69d6665711fb74b56df89a.camel@linuxfoundation.org>
References: <41abc44a9ccb16871c69d6665711fb74b56df89a.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christophe Chapuis <chris.chapuis@gmail.com>

* with xz PACKAGECONFIG enabled in kmod and xz module compression enabled in kernel
  the do_rootfs task doesn't run depmod in the image, because it thinks there are no modules:
  NOTE: No Kernel Modules found, not running depmod

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

v2: nothing else was broken, only xz was enabled only in target kmod, after enabling
    it for kmod-native as well it seems to work fine.
    Also use tuple as updated by Christophe and suggested by RP.

 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5f81023040..d634adda4e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -305,7 +305,7 @@ class Rootfs(object, metaclass=ABCMeta):
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=True):
             for name in files:
-                found_ko = name.endswith(".ko")
+                found_ko = name.endswith((".ko", ".ko.gz", ".ko.xz"))
                 if found_ko:
                     return found_ko
         return False
