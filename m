Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.2137.1587563546340140862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 06:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=prYDxRKj;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id k1so2500222wrx.4
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5mKAelUzI44aarQ2zERGU+mItzdLge1A2R1Q8a/MEBg=;
        b=prYDxRKjb8C0lHZCR7ykA0cxpe48WN1GDX/0nDWVjcgSbhajdlmENW2z/bOjxOaN24
         59GkPAipH3Yb4+4JQmOEudE6e/GH8DeQXsU132RTZzclXi3aPY1EFe3dcfVhcg2IZF7f
         YbneMcnvMpUT81X7ve2hr773wpTm9EhJAczPdJbBbWVyGHJ8zpoTHaLR7hb9EWlGOL46
         dL7Y5MKdOZQrY4T/ovMsz8HEhyL8wfCXQnJ8AH5rsYxoc5UWjZGaS51qNpQCJjtiofw3
         JbLFJUlKxrvG1pfs++M5UztbMg6Ptt6wvGM1JzphT6bCkqQ4p74dzor6PYXeKMYkUr/o
         mjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5mKAelUzI44aarQ2zERGU+mItzdLge1A2R1Q8a/MEBg=;
        b=Ad9iG6bVbsVfgPEgCcDlwYddL5FOL4MdngNBJzbPXbiaPGKvquJV/4A/kIti7QvuZ+
         XAh6qfxtLqdTtC/bOUivDv3gE8CyOmG3jKlsFdQvE8feWqthUi38psPfzERxmxOIbNWB
         oCQb0eAQhXXXWq9B1z7+lPmvyTqDgrkgP/sP0tql+TeyOUb3OdjMKsmW5wKqm/vvQMjW
         7upuSvMUJQeCK1Azu9j0UMeLwkADLpZ5PWwIwxc7rA7jepE9fxvG1f4HN+lC+P2Q9JpY
         TN7BL55uK5mD40BKytnXrrPoXqnRGAaOy/nSM9BnKLpO/dzT42SM/sMiCRIwyZLhcsMl
         DJ7w==
X-Gm-Message-State: AGi0PubqPpCA7gpjNT8oTkuFIRtjW+LhCW3Cz0OX9ODUI5AmPyxuGK+t
	PEsON1g7eD+Sj2iq2Z5vaYWf4D8v
X-Google-Smtp-Source: APiQypLrBDpHgjo+59zQoO6ukS3zUm83qsudhkAvvP50vMzwi/QG8ZnL4Z7uBh+4tkdAwCoxPWfyvw==
X-Received: by 2002:adf:bb84:: with SMTP id q4mr28310022wrg.141.1587563544337;
        Wed, 22 Apr 2020 06:52:24 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id d7sm8155846wrn.78.2020.04.22.06.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 06:52:23 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 5/6] systemd: Drop RDEPEND on systemd-compat-units when sysvinit is disabled
Date: Wed, 22 Apr 2020 14:52:10 +0100
Message-Id: <20200422135211.121292-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422135211.121292-1-alex.kiernan@gmail.com>
References: <20200422135211.121292-1-alex.kiernan@gmail.com>

When sysvinit is disabled we have no init script support, so
systemd-compat-units serves no purpose.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

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

