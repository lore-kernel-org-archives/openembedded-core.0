Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C36C3ABAD
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:37 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.8294.1745982031734389805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NlSoRalK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so113425695ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982031; x=1746586831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KgKBtXHWrXSCQpmn4KnDl/q3VsWgKLjZ2Oa1uLH90Y=;
        b=NlSoRalKjrAi9lHPgOzt/vkXG4XW7QmV0lzrE+g8GWPNijxvOESsEu7XF1QwOf2YEV
         Yksj3SuZwq1kRjI7jU8pzO0JbRMwwGCKlJaehcW9iD/7DYI1iY/GMwwNpq6L+XR37xX0
         j/VTvBjAe5WFK1CMQQou+9J2hPtu6ZF05ijwXv02J5kk2VB/rgSyyw9S4btdYmGSfN4s
         L34Uo5/4Mvcy2qZPlH1Mq48ExAUW5D0obhSklb9zDEcBDZkD0dr2K3P/q0HH1zPZ8xHt
         IdV0SqVsfsHUjBlR/nhlWgTqxIkH8Tm8e/B8QrnAaibzBv2QAZ4NJBAbJ6uBzv92pa/f
         LfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982031; x=1746586831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KgKBtXHWrXSCQpmn4KnDl/q3VsWgKLjZ2Oa1uLH90Y=;
        b=vJhObzsyCxSXe0D98gj5kfOGzKaqOLaD85UqHupo+mBmlKvLNOOLA5GGr/OqqdSW7O
         /AbIrQ5UvAv3C3PjqDAwVyLCUpgYRNyZqh046Q697HWU7OPuCHpn0MY/2PC4eThEKH8Y
         Q2y/J+Fwqee/kL0P8JbgBr62OfwyQQrQesTHdPzUPdHcSJajBhCWSzWg9VuzmAb/eP5N
         k7GlF75aq8ekhojzFG+I5xLMzhnuqoC441SFCczICWowd6onwg70eB8xv9Z3t+1iunDH
         XyJbuCLaue3OIkHH/x2s1tM/Uko+aJa/puKoAc5p0jhVATFJVrleQbC/6RJAq7tdNzWF
         sJMg==
X-Gm-Message-State: AOJu0YwxfVfbJ/0zsD3I/F7ZNRucn/aoQIcEEpR5PaNey/afqJXqgjU6
	eLuSDXXXDJXSqihY6Lu4KwTIo593fFzBwUUo9KBtXDCiefC3YFw+ktZKSjYRrM9616wtDmXBv8g
	A
X-Gm-Gg: ASbGncu9NdaO5FjHUnckQi+suvK9JXPZX9Jhe2ESFgJQdXyr2pJ+nmMTa8w6qDUArbt
	hzz20IbEKSfaEYg5W10DCi178VnHgYdLpj95YxKFEmA9goHvAuSob9cBwAhvmwOARqAyZ0+rHHJ
	zgQbQd06g5CrYYgRKGWma8jR9qnnnUQ2TkFATr3JbX3ru68He0hmh7x0Zdq5o4ZRhATOAMGQZML
	TU25dConqtrgZj6bI4D/cCjZCq9srGlTtVUNwC6fKCTnn9IRTiscZhgB1R7fEb0k2FJm90gsSi4
	hpGad21PaoE++bZ74Dr0NuyKZgDhlkE=
X-Google-Smtp-Source: AGHT+IERsT4HxaUulUwgbZzSvIgCU7q6JAULLrATexglRmifb3HOlnnBdVDWebGroGPlyRzAP8pamw==
X-Received: by 2002:a17:903:1984:b0:224:ff0:4360 with SMTP id d9443c01a7336-22df35ffbabmr27122705ad.53.1745982030909;
        Tue, 29 Apr 2025 20:00:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/15] initscripts: add function log_success_msg/log_failure_msg/log_warning_msg
Date: Tue, 29 Apr 2025 19:59:59 -0700
Message-ID: <90cf409ba74c4bb398199667ea2819759a720373.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215717

From: Changqing Li <changqing.li@windriver.com>

* add function log_success_msg/log_failure_msg/log_warning_msg, some
packages still use these functions, like mariadb, refer [1], without
these function, with sysV init manager, mariadb will report error:

root@qemux86-64:~# /etc/init.d/mysqld status
/etc/init.d/mysqld: line 383: log_success_msg: command not found

* remove RCONFLICTS with lsbinitscripts, LSB support already remove in
  [2]

[1] https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104
[2] https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290
[3] https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../initscripts/initscripts-1.0/functions     | 21 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 -
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 35aebd4a55..7fc19c808b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -92,3 +92,24 @@ passed() {
     echo -n -e "${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}"
     return $rc
 }
+
+log_success_msg()
+{
+    echo -n $@
+    success
+    echo
+}
+
+log_failure_msg()
+{
+    echo -n $@
+    failure
+    echo
+}
+
+log_warning_msg()
+{
+    echo -n $@
+    warning
+    echo
+}
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index e61ac554f3..56ee65ac5b 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -53,7 +53,6 @@ RDEPENDS:${PN} = "initd-functions \
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS:${PN} = "${PN}-functions"
 RPROVIDES:${PN}-functions = "initd-functions"
-RCONFLICTS:${PN}-functions = "lsbinitscripts"
 FILES:${PN}-functions = "${sysconfdir}/init.d/functions*"
 FILES:${PN}-sushell = "${base_sbindir}/sushell"
 
-- 
2.43.0


