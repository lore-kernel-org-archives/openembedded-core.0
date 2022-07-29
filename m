Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1355C19F2A
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:24:38 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.500.1659108271432543580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rVE5Cq/m;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id b9so4894543pfp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cEjLQ+/Sd4laApuAeriXnmN8R7EzeO3UvTrJRmDC+mY=;
        b=rVE5Cq/mBY7FnS2ply4XIZc+284CtO3s6Ao/SmhfOlLKi484IrzqTI/6DwKRY7CqjU
         sKu5ywyI3ucG7/QO3nX3M0TT3CfAOPEk4b1d+3j89xsGzaqQKFwRSdJzXOcNTqFF7fdY
         qHS/sSqtrAzbBmO6LPM1n5tzpYbkImGEnIkts5QpEfI4BJpDGTUqwD1Rjf7Th2oKaH0o
         LC7gznQGtbIZt0cQxmmxLgLTd9luVcPVFEu0NUUOqMa8mnhN2D9jA0PVImkQ70oTND70
         E5WlFk5xjKjBfCjQXoAVPUhGAj4d7/E5tw99QirmQNbuqpd4SaTW9KdeuckBxJZRwMJ/
         XDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cEjLQ+/Sd4laApuAeriXnmN8R7EzeO3UvTrJRmDC+mY=;
        b=CdrXLCBVoi9cLTrSfsa8JWEvOYhCZ4RUqUYqilVHGYRid382k/GgRjIYM5/p8f2fng
         o89IJ7cWAXwXbneXr+ACqLTP6fBWSF/wT6D4fJKyywiKh1fxf0nRxaFc/LOlJjxgdMc+
         1CIBhLgxrvnXy70/WwJvvc1VEGAU/RG/FNYQpqdxBnV98xlFOOROH0O94nyeXjtbNZvk
         3brx3CXnboB9WRM81k8hYea18mdZfiLoc6VU1nzW1j5r7eWUPoClnKDPNMza1/QaU20A
         1iUb9lP2/vrn6hw52uOXwPJ3x1ySVCAkYvQSJu7p5YxRpIifzq+sZx+3PeU3WGZYfhTW
         y0kg==
X-Gm-Message-State: AJIora+Ua4bdVgg28crijMmpbjTsTg+mHMNc1RA7s3aR+BdSHaUB9ctE
	fDW4C+pIU5eJ7Qu8Zp0KzWF/qY2o5F0/EvLZ
X-Google-Smtp-Source: 
 AGRyM1uFMGF76pY+fAZEpJhsz4Il/GsYb1FWOuoBI6gmyh6GcM847m7yKp7GYBXt0/5RT5zTPRN2BQ==
X-Received: by 2002:a05:6a00:88f:b0:52c:6962:274f with SMTP id
 q15-20020a056a00088f00b0052c6962274fmr4146875pfj.12.1659108270141;
        Fri, 29 Jul 2022 08:24:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a17090311d000b0016be6a554b5sm3889808plh.233.2022.07.29.08.24.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:24:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] gnupg: CVE-2022-34903 possible signature
 forgery via injection into the status line
Date: Fri, 29 Jul 2022 05:24:05 -1000
Message-Id: 
 <2bf155d59e33972bbb1780e34753199b5a9192a0.1659108121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659108121.git.steve@sakoman.com>
References: <cover.1659108121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 15:24:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168666

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git
MR: 119424
Type: Security Fix
Disposition: Backport from https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=34c649b3601383cd11dbc76221747ec16fd68e1b
ChangeID: 97de66d6aa74e12cb1bf82fe85ee62e2530fccf6
Description:
	CVE-2022-34903 gnupg: possible signature forgery via injection into the status line.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnupg/gnupg/CVE-2022-34903.patch          | 44 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.2.27.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch b/meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch
new file mode 100644
index 0000000000..5992949d35
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch
@@ -0,0 +1,44 @@
+From 2f05fc96b1332caf97176841b1152da3f0aa16a8 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 22 Jul 2022 17:52:36 +0530
+Subject: [PATCH] CVE-2022-34903
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=34c649b3601383cd11dbc76221747ec16fd68e1b]
+CVE: CVE-2022-34903
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ g10/cpr.c | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/g10/cpr.c b/g10/cpr.c
+index d502e8b..bc4b715 100644
+--- a/g10/cpr.c
++++ b/g10/cpr.c
+@@ -328,20 +328,15 @@ write_status_text_and_buffer (int no, const char *string,
+             }
+           first = 0;
+         }
+-      for (esc=0, s=buffer, n=len; n && !esc; s++, n--)
++      for (esc=0, s=buffer, n=len; n; s++, n--)
+         {
+           if (*s == '%' || *(const byte*)s <= lower_limit
+               || *(const byte*)s == 127 )
+             esc = 1;
+           if (wrap && ++count > wrap)
+-            {
+-              dowrap=1;
+-              break;
+-            }
+-        }
+-      if (esc)
+-        {
+-          s--; n++;
++            dowrap=1;
++          if (esc || dowrap)
++            break;
+         }
+       if (s != buffer)
+         es_fwrite (buffer, s-buffer, 1, statusfp);
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.27.bb b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
index 18bb855769..bd09b02017 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.27.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2022-34903.patch \
            "
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.25.1


