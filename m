Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA41C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:03:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.162523.1680796955851529054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4RFam6dM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so43306366pjp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796984; x=1683388984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDhPPwUVseEmZjOr1MzNMbA4KEaBFrBZQFF/kDRtpm4=;
        b=4RFam6dMteklIalyETJWNqD45PteJMeHF/EVdEOoPJ0qmXS+7itIEgUo8OSU1ZoZ4V
         n8OJsjyht0lMLX0T2jZLf3GVahvYVtQRAV+4jv6XEZXDqOTEA869qshUYvAcqPEKTgqQ
         9KDIdaeMzkWCX1gGWNFfQ1DsEMsErotSCPEN9EKgVKxETwvQwWaKuIdemrIu7k3o+rQn
         ictJfMwOH+o3/GVpT4OShpX5lxlRPXfJuywdAtg+4UWJthAriNOmkwWYAWsoIwiXycaF
         zVjp59+EjeJRY8rbRN8A67VwJw1h6zAt3TsfAe85NBZlDaIdRSDYDn5LSZN0eGpJc+be
         VAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796984; x=1683388984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDhPPwUVseEmZjOr1MzNMbA4KEaBFrBZQFF/kDRtpm4=;
        b=UahbqXvJrBNvnumaePzWv/xcnYQ4Mql7GA9xqD6Zx7Y6aQ0K07hIq6go3epfFPn9a5
         ehkGfc6Ln7E2Nv/Pg6KMnrRXyH8Y6xs79LHne/rw3QzIXi22GkoqP76HJPTX3r7GnJG5
         +8b5Jy4q6qEbWoiFo2HtZ2iMxgKMGRgGja8YGvP57khwLNBCRtq+0LbSddjKob17znIP
         Qy2D7qHAjB4xeqW2alo/m6jvRPxpsKU3VllMmE8qOzsBv7YKqHBu/hS++KidVYm2agCZ
         C1+0Yu9dMlcNBUKGlMR0NKCvCzsJEIoB5kZ98o7BjANmFithfFgY6vaSd0UZmG2ERYb1
         qdrw==
X-Gm-Message-State: AAQBX9ftL5dKgNVUgMoC+Hma4k8y9DC58GMa9SAtD/f+Hr73tXvIYkvo
	kyXO8UWqiEm2pWyTUDXxSN6B/aCCSybrrcM3cuY=
X-Google-Smtp-Source: AKy350YwS1wNBmUd2BrXV8MOS3TcprjSOFAn8iB7dbahsu0sBh9SE44IBJqURuwaIapwrLcgYRiHlA==
X-Received: by 2002:a05:6a20:5009:b0:d0:76e3:16ec with SMTP id n9-20020a056a20500900b000d076e316ecmr67070pza.13.1680796983876;
        Thu, 06 Apr 2023 09:03:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.03.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:03:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 24/26] shadow: Fix can not print full login timeout message
Date: Thu,  6 Apr 2023 06:01:51 -1000
Message-Id: <e5c1b64ea66fb1cbdb6403fa26d4d42b9d64e44f.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179802

From: Soumya <soumya.sambu@windriver.com>

When we do not enter password during login, it is expected to display message "Login timed out after 60 seconds". But it prints only first few bytes(like "Login t") when write is immediately followed by exit.
Fix - Calling exit from new handler provides enough time to display full message.

Upstream-Status: Accepted [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]

Signed-off-by: Soumya <soumya.sambu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 644cfe9dcf351bfa6c67f4b4d1e7dec416a59021)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Fix-can-not-print-full-login.patch   | 41 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
new file mode 100644
index 0000000000..37ba5f3dc2
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
@@ -0,0 +1,41 @@
+commit 670cae834827a8f794e6f7464fa57790d911b63c
+Author: SoumyaWind <121475834+SoumyaWind@users.noreply.github.com>
+Date:   Tue Dec 27 17:40:17 2022 +0530
+
+    shadow: Fix can not print full login timeout message
+    
+    Login timed out message prints only first few bytes when write is immediately followed by exit.
+    Calling exit from new handler provides enough time to display full message.
+
+Upstream-Status: Accepted [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
+
+diff --git a/src/login.c b/src/login.c
+index 116e2cb3..c55f4de0 100644
+--- a/src/login.c
++++ b/src/login.c
+@@ -120,6 +120,7 @@ static void get_pam_user (char **ptr_pam_user);
+ 
+ static void init_env (void);
+ static void alarm_handler (int);
++static void exit_handler (int);
+ 
+ /*
+  * usage - print login command usage and exit
+@@ -391,11 +392,16 @@ static void init_env (void)
+ #endif				/* !USE_PAM */
+ }
+ 
++static void exit_handler (unused int sig)
++{
++	_exit (0);
++}
+ 
+ static void alarm_handler (unused int sig)
+ {
+ 	write (STDERR_FILENO, tmsg, strlen (tmsg));
+-	_exit (0);
++	signal(SIGALRM, exit_handler);
++	alarm(2);
+ }
+ 
+ #ifdef USE_PAM
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5656a375b7..0ed220ac5c 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            file://0001-shadow-use-relaxed-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+	   file://0001-Fix-can-not-print-full-login.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


