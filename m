Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41609C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 04:30:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.24466.1658723426956901111
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 21:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Wwrf9Z29;
 spf=pass (domain: mvista.com, ip: 209.85.214.180,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d7so9321955plr.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 21:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhHVXGdZNMKh9fmopvtpCMue6JNl6LheCe9zMlZlJrg=;
        b=Wwrf9Z29VpKaI+eXxC15SawGFzjZ2i4SBscEKyX3kocWMLzaeptZaAiIj1k8oCK7fJ
         LEDaBv9yFed8r3g21KScXxzN80nAC9RYpAR0ojm0RVSSpy9nHPtNgfNeFCFne8dZrBto
         N6V/qMwpiPQBiSzeTATGkJSj4K56LW2fVqvRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhHVXGdZNMKh9fmopvtpCMue6JNl6LheCe9zMlZlJrg=;
        b=ALMxuZmyDwavI0KXahTB/0lJIP58Q9RJ3JooxVH7i4pSqU8tm5CVpYzR4RvNxKzVHL
         r9WpZM9mLsmQAlxfDpNTuhdCHm8jgjBjHYWjxbl806u3Hpu9F1u6ziD1fGhMEHMoY4YJ
         4bSQdtFxva6cGnBh9pn32IAlL271XCUJYi6DUIcgW6iFPrWhtuiJSxpFJGUWb/xFCI6q
         cA3NXpnbdIZPhseI3jXoUtfguZ53DvSlQoJPUDvKGLc/KwSZGd2V5pjkAX6dwkwLdrLf
         NLp1TgAiwIxiICA1qpCyVxehbS2rg8sEBTEGl09TaVnaAr5z3mW7/kxQ9mV/bNFX5lDp
         s/cg==
X-Gm-Message-State: AJIora+IJQtcJlZPyBxHo0Xr0nPiSOsogkqEebjmG65pgI+hSb1Oi88w
	N+BV64O6BqPDkFuFWaXVhtJ0nLQrLLs9b9YZ
X-Google-Smtp-Source: 
 AGRyM1sBHtbvnGp2/n0J+2M6rk0JK421ACv8v6+aVnqZICFKmvWnnHKgROKLekCCKSaMbve4lFWSWQ==
X-Received: by 2002:a17:90a:9f8d:b0:1f0:253e:3ecf with SMTP id
 o13-20020a17090a9f8d00b001f0253e3ecfmr30729832pjp.33.1658723425689;
        Sun, 24 Jul 2022 21:30:25 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.206])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a621b01000000b005258df7615bsm8348230pfb.0.2022.07.24.21.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 21:30:25 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Mon, 25 Jul 2022 10:00:20 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] gnupg: CVE-2022-34903 possible signature forgery
 via injection into the status line
Date: Mon, 25 Jul 2022 10:00:18 +0530
Message-Id: <20220725043018.6784-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 04:30:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168468

Source: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git
MR: 119422
Type: Security Fix
Disposition: Backport from https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=34c649b3601383cd11dbc76221747ec16fd68e1b
ChangeID: 6924f2a96aae0e29654c6797697bea3d500a41ed
Description:
	CVE-2022-34903 gnupg: possible signature forgery via injection into the status line.

Affects "gnupg < 2.3.6"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../gnupg/gnupg/CVE-2022-34903.patch          | 44 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.3.4.bb     |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch b/meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch
new file mode 100644
index 0000000000..d0c329952a
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch
@@ -0,0 +1,44 @@
+From d3de6cc587e38aa1cd3ae198f1ca452c78481a21 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 25 Jul 2022 09:54:50 +0530
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
+index 002656b..935e488 100644
+--- a/g10/cpr.c
++++ b/g10/cpr.c
+@@ -372,20 +372,15 @@ write_status_text_and_buffer (int no, const char *string,
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
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.4.bb b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
index d27bddb8bd..32a1447aa5 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://CVE-2022-34903.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.25.1


