Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.26621.1600977492659799165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id ef16so152477qvb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2020 12:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=6Ik1s/Dfn2XmrS+LK5isW5sHyrc3lsY/ofKD9TicHgM=;
        b=OBdFVIde4RwEdj2xuKpsX5heMjaOgwjFeUI5erh+Rq0vh18VWs1wOzdp+fU4LiO4ky
         Spm9AEwW4fFnW2O1ylA2QZul6YLxasR35AWtBIMtvNnq2HDr3U4RR8EfE0ILuo1NvKwE
         Dmy6P7HXdg+Y/b1pu663XSvlYurq6pvfKO22k7DnnASxFFzul1N/ZAoS3PDHo+Z9oMBw
         OFqqmXgYnL3k9/6aPgvheNpbLTdTPP20ugfS0DoMqPfJP8acwX/qPpSr7MofRTrAjIJ9
         BxONjTPWxdXKQDpjUGXNlnb0okzsM0y312qdK0kH7wSkfjqY72/Bq+FKuR260WndTxdJ
         DnMg==
X-Gm-Message-State: AOAM530LCSujrq+wu8jcugbGHPKDHLEGIAruiGe+JmulLXNAzoM03wnq
	MhxHGqdJyOVWUcu17m1Ls3T4xQy+Kd8OeQ==
X-Google-Smtp-Source: ABdhPJwrVL4P46ne0N49ixvjM6yGEfV01iHZWAEEca02xud5hs+5WCpANIxVlLOzfK0Un9Lp7Y/HBQ==
X-Received: by 2002:a0c:fd42:: with SMTP id j2mr908489qvs.37.1600977491366;
        Thu, 24 Sep 2020 12:58:11 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.78.182])
        by smtp.gmail.com with ESMTPSA id f24sm301567qkk.136.2020.09.24.12.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 12:58:10 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
Date: Thu, 24 Sep 2020 16:58:00 -0300
Message-Id: <20200924195800.4164634-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

We are adding a new PACKAGECONFIG option ('rng-tools') to control if we
wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We are
enabling it by default so there is no behavior change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-connectivity/openssh/openssh_8.3p1.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
index fad321898c..e007328704 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
@@ -42,12 +42,15 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 
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
@@ -149,7 +152,10 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
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

