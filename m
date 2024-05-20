Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A642DC25B7B
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.61063.1716212042913808665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mQW8dKvj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f457853950so1507412b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212042; x=1716816842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPtaApX9FqqXi7sg2xlqMy8rIYMMhmO/RFQ8WgwhEx4=;
        b=mQW8dKvjWFmoDKV0LDF3Qx1VyhRuWUsR0tZSSLRMzjyGrRUkcPvB5vvFVAdWgJCdP+
         txYn71/NHodp8UPN7gUzZIr592l7YMQzFpywqXF4Mng7cfTX1aeNHg3xsLde/A/XHmRj
         GnAHr2ycGq9nMj0DXh0SC2jm2U+k7rdvQ15SDr/o4wusbbT6I/4bkV88PHRxNyHZ64jl
         Id5WCiFjSrxT/Eg9S0JcK6WLG8V+KKIxcthrrLyNwS5FCcOnHhPJR9YtcFiNLbF2HImA
         6jyVN2KidgknrWb2CDLxhShBKA7kwwHj1EIKbC2Ep+pXZBl9eAZuzVCKOYsTmpd6z1g/
         ve7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212042; x=1716816842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPtaApX9FqqXi7sg2xlqMy8rIYMMhmO/RFQ8WgwhEx4=;
        b=lEgHgWXyAA9rmZ2490YWh2kDWEoS/fQG4XaYyynznqySK+R5l/mrAw6xjk8th5A07m
         c7PwQZL1sbciidpbqn9iRRDf6HCWosb1luQKYWQYGY7KeRH+jNWhjfKR2C1cp2UtR+av
         MH9jX2jkZ7dkLweQ27UhBGekIOaf2fW0cCvRPVmO7jjLap6JEHCYudqUqScKRWWXqzIh
         DaUCLN2wiwkDr6A5y6TtNIjQATytlJtdg/iWseEWmWnxPq0cRB9hSdNfqsndTGRbocNY
         aaSujYVPZe1phG1SD93NMhEbKn+dRfVlViNKurXwi+Dp/CLT2a0iZSCGf29MBcPzyym3
         4gpg==
X-Gm-Message-State: AOJu0YyTAR1OyXI0iMKULpyP+/cSVcfg+563R7tm40rSEn0tdm2msInj
	xGfhEsLeeGHr/CJoRG+uQepdX0Np5iw2hB/HFM4HUrordpz8txAk9WY2jzpjsAf7uny8SJHjDjn
	L
X-Google-Smtp-Source: AGHT+IGxczfYisSmrLdr0CBhhDz9svIwgBE23hAVwHrrrAuH/HSaiOQ/59HfMmsuZ0BHuptHFpmIJg==
X-Received: by 2002:a05:6a00:23c5:b0:6ea:c7bd:90e3 with SMTP id d2e1a72fcca58-6f69fc2fbf7mr8267304b3a.14.1716212041839;
        Mon, 20 May 2024 06:34:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.34.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:34:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/21] bash: Fix file-substitution error-handling bug
Date: Mon, 20 May 2024 06:33:27 -0700
Message-Id: <6a81ccc68f8389ca1c9c8eed009388045beea9e4.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199587

From: Zev Weiss <zev@bewilderbeest.net>

This is part of a patch that's been upstream for a while but hasn't yet
been released.  The bug is causing some downstream difficulties, so a
local patch to tide us over until the next release makes things a bit
easier.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit bf384d6618780dea2df24adac88ba4364cb65b9b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bash/bash/fix-filesubst-errexit.patch     | 34 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.2.21.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch

diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
new file mode 100644
index 0000000000..60f1852316
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
@@ -0,0 +1,34 @@
+From 59ddfda14e3c9aa6286bb4c4c0748f7c1324a65a Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Fri, 7 Apr 2023 00:28:46 -0700
+Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
+ enabled
+
+This is a trimmed-down version of a commit in the bash 'devel' branch
+[1] that contains this fix as well as other unrelated ones.
+
+[1] https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=ec9447ce9392a0f93d96789c3741285fede8a150
+
+Upstream-Status: Backport
+
+Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
+---
+ builtins/evalstring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/builtins/evalstring.c b/builtins/evalstring.c
+index df3dd68e2a7e..6612081cd646 100644
+--- a/builtins/evalstring.c
++++ b/builtins/evalstring.c
+@@ -753,7 +753,7 @@ open_redir_file (r, fnp)
+   fd = open(fn, O_RDONLY);
+   if (fd < 0)
+     {
+-      file_error (fn);
++      internal_error ("%s: %s", fn, strerror (errno));
+       free (fn);
+       if (fnp)
+ 	*fnp = 0;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index 46d921bbe6..532adf4c1a 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-builtins.patch \
            file://use_aclocal.patch \
            file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
+           file://fix-filesubst-errexit.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
-- 
2.34.1


