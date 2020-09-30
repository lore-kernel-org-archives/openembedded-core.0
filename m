Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6534.1601504104862542423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oGhf7AOs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id x123so2339714pfc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VKd/dQ5k5+3flnp/MX9sGhE4M+itwLedrZZTkij6gKA=;
        b=oGhf7AOsydbpJCuQnLepOVbGQLLrweslF9BfHevVh56mOuj0gk/OzvluZWibXrVWsJ
         34ZP+NfbDKJywzrzHWyWpePtT6VbjzDpzbt2ed61cb1glZGF8+K9JUC5oJio4mhwtACc
         pBNOJQW2O5HjMLukR3UC9FH1IL0+DKXYpX9TQ2yPO+0MCUl0w0M0i7tKZkYGTYC4Cirb
         5j3Npoi/FJI+sIfa/qM0UJqN86+EXymPtRiLPggG5Ks19gXElgChvuLs1ktkwjU1e7rA
         pm9hAX/j0f93h4E5xW29F7bc8k2d/FSvkuhFDss/sC8XSnHCgaMJHgxJymAEUlaNxzSE
         cGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VKd/dQ5k5+3flnp/MX9sGhE4M+itwLedrZZTkij6gKA=;
        b=XJ+YMgUCxafM3a0rGIZPl1R67F6vO35WlNaI5pO2UgTg3oEzLgHwHqFtZ4krTR0dGe
         29hizNN4p+qccQ2fD8Kx3Mo+QaU68VlvSB24GSn77X3B6kXKgAuxj+JJUJqXdBsokBAo
         +eOikD94grvBOTmJ2D+JvEmxXycYIuL+pq45BelxuABkZ2c10CSA7OeNqcGJVYDYYhwp
         f9n2Gq5NNIfUg7DitKRV2pkhXyJKSzS2rHpU9+brhKwS9i1G9BzR/zUWpy88dJKzjcuU
         gvwNyzCs5OLIOCOuef1OrhAiXIXZkN53AKEr4hm5WhKBLLyc+IxTTPTXhObOuDZFrIJq
         +u5w==
X-Gm-Message-State: AOAM5307vK+RdmAIpVpUsZrt5mbHMt/FAB9OJlCqAZ/GMzfsIonCQ3h6
	31RNfsQn4N6SHQYR8KksT1VEdhh9XiGpvgOGzdU=
X-Google-Smtp-Source: ABdhPJyd9ZslKJBWeorSVUIJWLopbWrJ2DrY8Y7BIJnv/9hZ7QixbzjoZjEf3ziD3ejSei1wGacTrA==
X-Received: by 2002:a05:6a00:23cc:b029:142:2501:34e5 with SMTP id g12-20020a056a0023ccb0290142250134e5mr4265128pfc.62.1601504103957;
        Wed, 30 Sep 2020 15:15:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/41] oeqa/qemurunner: Increase serial timeout
Date: Wed, 30 Sep 2020 12:11:26 -1000
Message-Id: <1c5f304ad8d7d5deb85b3a5135556f9e38a9326b.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Increase the serial login timeout from 60 to 120s. This seems like a
long time, however for a qemumips image with systemd+PAM and openssh,
(e.g. core-image-sato-sdk + DISTRO=poky-altcfg), the getty connects
to systemd's pam module which waits on logind and 45s for all this
to happen at the same time as things like ssh key generation happens
is not unknown.

Increase the timeout to match the longer times we know these things
can take in the worst case scenarios since we're tired of intermittent
issues related to the serial login affecting the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8b4292db741de660f756dfb766210814d587b7a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 519aa9aa1e..77ec939ad7 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -393,7 +393,7 @@ class QemuRunner:
 
         # If we are not able to login the tests can continue
         try:
-            (status, output) = self.run_serial(self.boot_patterns['send_login_user'], raw=True)
+            (status, output) = self.run_serial(self.boot_patterns['send_login_user'], raw=True, timeout=120)
             if re.search(self.boot_patterns['search_login_succeeded'], output):
                 self.logged = True
                 self.logger.debug("Logged as root in serial console")
-- 
2.17.1

