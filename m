Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.6999.1587651140458271543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 07:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gQV8zt0v;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id v8so7562897wma.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZS3HzcDA2iDX9Z+fV4t+372IQ/mR3UDNri7ySs8D/5U=;
        b=gQV8zt0vdVpkaksTgLd9E9/dpYjplckVBbL2tBTGvjkG86DlS7pfWqP/qpxVtAMIdQ
         G+OXMoC7NjHd2kgKxgko+gnypEex53XB4aKs9SgpOEriv/g5byJcsiHqLJMi2VRMZreN
         DofhGFe/m6ELZin6ZYCZtshN3rsrNNAVmrAolpY/wGGfa5brgt8oTQOcTwYVmPFfGdJg
         XY7VDXX1FApglEewTtkYpVIOnGN7v7KwzZpiNucWn2GlLwPUsID0FiiP8KruBCeR5fqj
         UaMJfj7jV1Rg0Y9RjV4Mseg/c5MIFMypjbqTI9gyKgsw0yjwX5avhSDo6u9eR3fJCp2Z
         EftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZS3HzcDA2iDX9Z+fV4t+372IQ/mR3UDNri7ySs8D/5U=;
        b=HI1bcpM0baaf0UK2V5JIaISWM3jYHR6t6e2vCAN4N16aCV3sELYgbHEeGeJiDk2zOg
         pPHB8OlJaRtnjlp9Jx76fOHyf6/QGku5ipPf5+iEBaPgj/yr9E1CXiE3fcJDuhdGjRWB
         DXtdV7bRWuvxRKjpLDW0lhjjpJFMcJHnu52K3TlpY/5VsMAsNRrOo1kPNUQHtKc29s0T
         Fcs6c/geCbtA73/5SPaoGw/6x/9J9xsstc/cyT6pXRCIMmg+DCbrE+uGcpDPxJ+mQ5Ah
         dfzUX24L4JfY6DryRgSQbCnWrX758Od+0t1rjfwF2h7Y4droZOe2HmS/VtvyeLj4pSlM
         XNgA==
X-Gm-Message-State: AGi0PuZEeWJuYX/57XoOHZ/Zgss8wSS1iMVfZ3+IOydr3TusMNdUr1BY
	hYSiDaCIvPzM+y4w8FMByP2KuTmB
X-Google-Smtp-Source: APiQypLLn3fC6uuZa3Dwy0X2cMJhHEff3UHskNH5+V5BR5k97SodHZ7Y9ZUeRvuKAkG2Cck7/ct0ZQ==
X-Received: by 2002:a7b:c772:: with SMTP id x18mr4574540wmk.39.1587651138504;
        Thu, 23 Apr 2020 07:12:18 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id a125sm3854726wme.3.2020.04.23.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 07:12:17 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 5/6] systemd: Drop RDEPEND on systemd-compat-units when sysvinit is disabled
Date: Thu, 23 Apr 2020 15:12:08 +0100
Message-Id: <20200423141209.82595-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423141209.82595-1-alex.kiernan@gmail.com>
References: <20200423141209.82595-1-alex.kiernan@gmail.com>

When sysvinit is disabled we have no init script support, so
systemd-compat-units serves no purpose.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 341ac6bbc51b..7ab01fb8cebe 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -163,7 +163,7 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
-PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,update-rc.d"
+PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
 # When enabled use reproducble build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
 def build_epoch(d):
@@ -567,7 +567,7 @@ RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator
 RDEPENDS_${PN} += "volatile-binds"
 
 RRECOMMENDS_${PN} += "systemd-extra-utils \
-                      systemd-compat-units udev-hwdb \
+                      udev-hwdb \
                       e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
                       os-release \
-- 
2.17.1

