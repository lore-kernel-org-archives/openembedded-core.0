Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52E5C04A6A
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.20346.1687728171782894703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Lf0jzvyq;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-313e742a787so848372f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728170; x=1690320170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGY+AmJgaTseULnmU4znRBmL+reOi84rfNDi98GyGh4=;
        b=Lf0jzvyqL1T34A0uk2+Qvwtgwn5DnbSeZa79gW5TAOtn0oTRdiiHJDewSyml/swTTb
         rrYVkso9rcPzUkDlXi6A3VK98/qNgCUs6ZkCMrFPdWNcB/y8v/V5JLgWoyTLEwu/jTds
         k4iup71LZ6dx1x85s0zDB5B7/Aba+nscEM7BVzkFY2ZWjQSQjEEZIzOu9xdmCNgGkoKz
         /hJvu0NjQDeYekC7yxIgBt+iDsWTA4EeLvvtv5Bq1HHesEGI8tJKJvoGQZKiOraXwW5S
         2SZ7MINe8zRBAkSQtVN/JdrNHgp8L3erBxBDcX1UIJbO73D6M4XTNnI23irOEkCDo+5m
         k3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728170; x=1690320170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGY+AmJgaTseULnmU4znRBmL+reOi84rfNDi98GyGh4=;
        b=LMxb1rGwYO0ZC3H/YnpeskvMUwHEHLNwpTYPmZMLCgvgNhSGAjtvhn+rK8bimJYL0h
         0H1BjbS7K1sVxFcgk2dN3IEXR2tjHPuC95MOiwy0S5AA2n8EA310WTzw/BlgTPYqkOTk
         1u5XwsYIZqccI1z5QPLMDm2oqlYtj0t5hBwaHHDEKLK/UI/amr8KhoPlvlf1MjWMoNrO
         jOLfShBPorze1RiBCKDPkYe2inslJ9Qq5Rk7lw2Vr9lqsbOxqzPyp/X95XK8dsJduZCy
         gzH/6zB5IHxvZ7OKBBTVhXY3AlGlEvt2GpkO57hijga8iwDhwAdFE4Nqd1kmNHFa0RaR
         WwlQ==
X-Gm-Message-State: AC+VfDxiVNztG/ACqOoYLgX2ML5BeUmTGVOJiwi9whY2N5iC1ix8eq27
	+EIalpdRPs4DLEqsWn85l0PmNiSncIjJ7A==
X-Google-Smtp-Source: ACHHUZ6G6IK9Btu1QGS8rhRmCsclVPgx/Z79HWsc58btSLYx7L9UuleRA6mo8W72HCvB7Gi56EHwow==
X-Received: by 2002:a5d:6a0b:0:b0:313:f000:5de6 with SMTP id m11-20020a5d6a0b000000b00313f0005de6mr1381719wru.16.1687728170136;
        Sun, 25 Jun 2023 14:22:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/21] shadow: remove dependency on pam-plugin-lastlog
Date: Sun, 25 Jun 2023 23:22:31 +0200
Message-Id: <20230625212241.915739-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183386

This item has been deprecated in pam 1.5.3 and is no longer
built by default:
https://github.com/linux-pam/linux-pam/blob/master/NEWS

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/shadow/files/pam.d/login | 4 ----
 meta/recipes-extended/shadow/shadow.inc        | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/pam.d/login b/meta/recipes-extended/shadow/files/pam.d/login
index b340058539e..d39e09b1eae 100644
--- a/meta/recipes-extended/shadow/files/pam.d/login
+++ b/meta/recipes-extended/shadow/files/pam.d/login
@@ -57,10 +57,6 @@ auth       optional   pam_group.so
 # (Replaces the use of /etc/limits in old login)
 session    required   pam_limits.so
 
-# Prints the last login info upon succesful login
-# (Replaces the `LASTLOG_ENAB' option from login.defs)
-session    optional   pam_lastlog.so
-
 # Prints the motd upon succesful login
 # (Replaces the `MOTD_FILE' option in login.defs)
 session    optional   pam_motd.so
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index cf05a3af93c..83e1a847693 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -65,14 +65,11 @@ PAM_PLUGINS = "libpam-runtime \
                pam-plugin-env \
                pam-plugin-group \
                pam-plugin-limits \
-               pam-plugin-lastlog \
                pam-plugin-motd \
                pam-plugin-mail \
                pam-plugin-shells \
                pam-plugin-rootok"
 
-PAM_PLUGINS:remove:libc-musl = "pam-plugin-lastlog"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
-- 
2.30.2


