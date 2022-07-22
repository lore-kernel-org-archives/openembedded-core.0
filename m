Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B73C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 13:35:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.7773.1658496913507761924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 06:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F73BEo0U;
 spf=pass (domain: mvista.com, ip: 209.85.216.52,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id pc13so4407370pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=59Bh+Q+237PEIKcwX/CRYweqJSCI88Qhb8CF0IfOPwU=;
        b=F73BEo0UzYhpWd5+3q3TWu93Li3rh0Tk2ixdj00AL/qwO1oRemgYU986apoPx8QMgv
         Bta+a/qaZlrcxbuFCNrPhUVoeyephemWiK5ExZLRhV2HDxwV3F7UDMKK/gQ6nx44cnzC
         1Wvit/M6P0PbWGZVdwjPvioSfMFYq6mhYBEG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=59Bh+Q+237PEIKcwX/CRYweqJSCI88Qhb8CF0IfOPwU=;
        b=yE0IjuNAkwR5jIN8qZ1gZtjcquGAds63hTmjlF9IY0tK0vsaJRKViqdDQqDHE16Hdo
         lr+eWVtCRv716MDjfZ2/6zCE1ub2fH3uMHXCxErN+O+rC5Izz5+4WC2apgUNhhkncdPF
         KgNn/dHZb1rqxBK9qAqMm1S8mLPVEanK3fudkksBc3cDjqz9la6l5Ay6Rr3vJieE1itA
         eXQETw6DASxdOPInkFa1g0S3FGhXZ7r03I2dUCC51ybdPTgc52B68IXJcl89lxYhkb4T
         5tIv5Wx6hHEUOaGwcLLQv58YU41sUMaGb+lxeldK+C26AXNnuKnA9ra+qJSHt8VZUb2j
         OJ9A==
X-Gm-Message-State: AJIora8Ka22lojzFLFtxa/6PE0zQR66EYuPX8gNmscetFr8jKU0yJghl
	WwVvfIJO6YVCs7UkS/D+m3A73WgslmZTeg==
X-Google-Smtp-Source: 
 AGRyM1sgy//iP9X2orqrRtGn5cwKT4SRyVGXIhYc0pm25dF5U1brrSA1kmxPXs9w4SLZ5shHonoBbg==
X-Received: by 2002:a17:902:f609:b0:168:dcbe:7c4d with SMTP id
 n9-20020a170902f60900b00168dcbe7c4dmr307260plg.169.1658496912411;
        Fri, 22 Jul 2022 06:35:12 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.210])
        by smtp.gmail.com with ESMTPSA id
 d2-20020a623602000000b0050dc7628171sm3917903pfa.75.2022.07.22.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 06:35:12 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 22 Jul 2022 19:05:06 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] gnupg: CVE-2022-34903 possible signature forgery via
 injection into the status line
Date: Fri, 22 Jul 2022 19:05:04 +0530
Message-Id: <20220722133504.35380-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 13:35:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168408

Source: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git
MR: 119424
Type: Security Fix
Disposition: Backport from https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=34c649b3601383cd11dbc76221747ec16fd68e1b
ChangeID: 97de66d6aa74e12cb1bf82fe85ee62e2530fccf6
Description:
	CVE-2022-34903 gnupg: possible signature forgery via injection into the status line.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


