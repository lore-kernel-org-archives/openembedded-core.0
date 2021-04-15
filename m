Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4643.1618479281199687687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 02:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ehq/zVAC;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id 20so7780438pll.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WfkOVL8ERi/22/e+2ST0ebs2FyxgV7SfiqIycvpDBkk=;
        b=ehq/zVACKQhnIzIjEjb8vTkN2PkJjb8/gcelHQNZUQv31uq+8wr3V541Mr+0PpnHcY
         kakJ/Q3HnJqQVZZMFd7EPKnCsW/dGBWer6xqhd6ChZdzAd2QuvtQu/nX0zq8ge20zRSF
         yglvCTicS/dNeIILRZVfAulv/K5440TduBONz0hrE0Jj4H898FSKI8jGfN7X8t7ZnrdD
         LBlkdwiP9YHMmuZ9sbwOzk8E6O84tgAARI/b2CYe9QO4xfR6di1di4JjsJK26y03qWxR
         8AQvlsAEoE1/qKGjgKi7YMgDRcid4ISmq9oorvtDWjnP11QGq+/HZqZwAoyU9i5+QctY
         j9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WfkOVL8ERi/22/e+2ST0ebs2FyxgV7SfiqIycvpDBkk=;
        b=QQqz1kymj6hPZKib6+AkBJExjeyv0koxSm1rOLYmoC5i9IPBpQ1AeTGpVq2BRVmHQy
         gtnB5EgmfGt8Fj6FMMyF8eigxX29bHkh0Uiz6srh5rUAnoAg9C+DwOGqNhQgI9isytJc
         4rwFuy6S8mk8eDQZQSWRk3r5kP8q3HQnCBSNUAKGwRq3/WO046cEBrfTa8juqVk1EfN5
         WrEXsNuZN6ZcDX17YNmSAJlBE6/08wj/3+gbiG4VvOyiPxe2lv0VP35/tfY8fYEG/HWb
         s5j3v7Nu+DysgBeASRnxYmF2Uc8f1/cIfuuiuPE70ZzZ36EohDg4n1Pduf9bHt8YkU/r
         zvZA==
X-Gm-Message-State: AOAM53119/W5lbwEH23smlSUE7pm3FkWSK4TDrhLeqgEPfv4tJ2aKMO3
	uPqLSlKfjR8jBvNIGGQyGyxIYeLDIvIxxWaF
X-Google-Smtp-Source: ABdhPJwhr0hY1i7jR+/F3lUqG81jFRfHLnWnd1xruycBZLwt4YFsw1MqtCEKkVnYTV9MkaZkaMYwLw==
X-Received: by 2002:a17:903:189:b029:e5:d7c3:a264 with SMTP id z9-20020a1709030189b02900e5d7c3a264mr2802857plg.6.1618479280495;
        Thu, 15 Apr 2021 02:34:40 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id ms9sm1994851pjb.32.2021.04.15.02.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:34:40 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH 4/8] In rust testing we have to boot image in slirp mode along with qemu monitor via telnet. Also, we are passing "-serial mon:stdio -serial" to fix runtime errors like, "failed with Connection reset by peer" observed during execution on image.
Date: Thu, 15 Apr 2021 02:32:23 -0700
Message-Id: <20210415093227.175608-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415093227.175608-1-vinay.m.engg@gmail.com>
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 77ec939ad7..dd70a1d77d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -184,7 +184,14 @@ class QemuRunner:
         # and analyze descendents in order to determine it.
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
-        self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
+
+        #In case of rust test we are explicitely passing slirp and qemu monitor via telnet.
+        if "slirp" in launch_cmd:
+            self.use_slirp = True
+            self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1} -monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null"'.format(bootparams, self.qemu_pidfile)
+        else:
+            self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
+
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
-- 
2.17.1

