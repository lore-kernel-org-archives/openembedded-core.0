Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.16950.1621247756228849434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQbZ/DEH;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 6so4345933pgk.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x/yinDHuQu8EeljlZz6kY866WOqCCqYlKIASocP/yUI=;
        b=TQbZ/DEHH2+3JlsCcGvVUFh0LxQVwWRf3cxrC18JApxBekjpxU4QF1+vwDdHd8ShgJ
         eSEs4rIKE6b6InGkaQp5ZZV5A7xFvNJ0F/ZG7usmDarbqV5ljkk+j/Yg9Uml7TXAG6/Z
         myNtZ+kummgddg2H9l0HICkPNqVBpspoPrArhYRCFlSVXQM8oCniLGtKM4NviuZ8YoA9
         dG1FVZcGqE0nPIENAd7/EeRLXR14tYFbi8jsuG8YV/CWzC8Vz4k68acZ2cJuRODkRZn+
         QVzcLvqpe6N2bGJCiGW26jM13jH3i/7XDOBcYIgfEwVrtei1E2VDFnWjDuitQqyWS+tn
         vokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x/yinDHuQu8EeljlZz6kY866WOqCCqYlKIASocP/yUI=;
        b=X5s/gFa5RCPkNLcKRti56P5lL5e9tB8Wkcpw4Nx6dghkyGd1zfnwlNKQtfGNzXFcK+
         XjxqqqDDDEi8eV/krB7J7oNiWDUvRsucWpRoXsgwD6k7cbsNkWz60LUyAnVEqyhc7vg+
         UxzUoC1UiqFkoIM3Am/v2u2j6E4jxoGLzUZGYKSNf7E0M0lye/v8+i8vrJsWxnBHrAha
         qosffbHI6OJzwRM9B34BZabRlWUBpqPvxlvCufx01MD06jR5ud0pwOFVNoM2jf0MZm5F
         1jN7mwGrlrIXAvUbvw+hvNlN6bqm/TIY/PR3ZjHrksGUhlXhg4GYI4umXFSMX/VjF1jM
         GNgg==
X-Gm-Message-State: AOAM532royS7AGBqA8QZUSXzoBiXjFRVJbgSS7gPsXalkqZ1D/2q2yKZ
	bTRoZLocZVyeOaELYQbR1PwUjfw0pY7Vp12d
X-Google-Smtp-Source: ABdhPJx/0Efsi5vJ5M42As8VIRf09hpf3vuW6oYMA6cSe1uqAir9vdzmipQjEYQJAdH9eFFtshZ1Ow==
X-Received: by 2002:a63:7e46:: with SMTP id o6mr42221573pgn.38.1621247755244;
        Mon, 17 May 2021 03:35:55 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id m20sm14903365pjq.40.2021.05.17.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:35:54 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	alex.kanavin@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v2 5/7] oeqa/utils/qemurunner.py: Enable self.use_slirp
Date: Mon, 17 May 2021 03:35:26 -0700
Message-Id: <20210517103528.24434-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517103528.24434-1-vinay.m.engg@gmail.com>
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>

The qemu is booted with slirp mode. We are setting "self.use_slirp"
as "True" to avoid the error during qemuboot.

ERROR: Couldn't get ip from qemu command line and runqemu output! Here is the qemu command line used:

We are setting "self.use_slirp=True" only when "slirp" is passed
"launch_cmd" through "runqemuparams".

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 77ec939ad7..13abf6690d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -184,6 +184,8 @@ class QemuRunner:
         # and analyze descendents in order to determine it.
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
+        if "slirp" in launch_cmd:
+            self.use_slirp=True
         self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
-- 
2.17.1

