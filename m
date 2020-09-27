Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.20453.1601235108723303283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 12:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 16so8205551qkf.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 12:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=79LP+X4PfWjfb9ttgCrbUvvzy4n1YtQQjhez/x8iAIY=;
        b=UVbiSDpMFbKTXja2K2piMuL8GPkhciza4kz8TyH/pQ4UHRXmxkiWCbX1vJHti2Odq5
         Vrs2iehYELVwCtUHplrWyvNRzNj0/6FYd5ac0HbzxWBxC6kf0LR8wvdishODZRWtMSTt
         TONW9wqnzRUWv+5MiouDCKm16cfgIHGZ8PZq7LW3yukxV5OsaYT9Wl5dXrlRB2dmMOwR
         3wUhBlsIb8QPWa3+TUqXjReSpRxLpvacQl6IVt56KmVWCeeCn4JOqR00JEYVyCiAEfyS
         OLy0gScymu9YaaePp0t/Wq4ULHKEcmfOxmEDzwMg8gPxLym2XmwmgTfVy8mF4A+SflHU
         loAA==
X-Gm-Message-State: AOAM5316pFNRsfAymzj5soChiJCA1RyHC7AMTdYGkoz0TedXVmBVmYxD
	nwmzbXwNPlVj8rXVfyGwPKG+mqLzuT93FA==
X-Google-Smtp-Source: ABdhPJwMEJ58ldu9ycMpdgoPa+3d4E1OPa7/psF67Yd9bjAIqkz1OmywSdWUJEdqHYtlZTqjNWCu1A==
X-Received: by 2002:a05:620a:145:: with SMTP id e5mr8848207qkn.479.1601235107588;
        Sun, 27 Sep 2020 12:31:47 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.78.182])
        by smtp.gmail.com with ESMTPSA id f13sm6602641qko.122.2020.09.27.12.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 12:31:46 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell-backport PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
Date: Sun, 27 Sep 2020 16:31:35 -0300
Message-Id: <20200927193135.3463-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

We are adding a new PACKAGECONFIG option ('rng-tools') to control if we
wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We are
enabling it by default so there is no behavior change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe99349c1bd72b69d22ab0dc52b8825d3157b8e7)
---

 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index d879efc201..17138c0ad8 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -43,12 +43,15 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 
 inherit autotools-brokensep ptest
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "rng-tools"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
 
+# Add RRECOMMENDS to rng-tools for sshd package
+PACKAGECONFIG[rng-tools] = ""
+
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # login path is hardcoded in sshd
@@ -150,7 +153,10 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
+RRECOMMENDS_${PN}-sshd_append_class-target = "\
+    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
+"
+
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
-- 
2.28.0

