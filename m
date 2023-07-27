Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA26BC41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:50 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.9073.1690468603590240556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pNKpUx9x;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99357737980so135978166b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468602; x=1691073402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIAW4L168KNaaAwfT3AABxyDTXk7obg/adLu/lnLNzk=;
        b=pNKpUx9xt4mnuTbkQQIAzGXNpnqzJ9JarzGlkLtFmoGi/3DsE/TJ605/xq4hcw3rHT
         WpUXNSqsWn9InnEVrpW5hjqH0s8QLdE0HRU6ZTLTgUmh1SnfGtUdgdGDQbU99d2kcQfV
         uB1BvwrNvBzU/for1XRvM+Xsb8t3FQq/abmeS72X7u7kVgH5FPn/+bur1X3aSgtcsiwE
         ktuLzjldwm+2YieEeDh8x1NxYiYLiSV9zBo4D2QndPGHSMiK64gRqJHTj9rgFnB07nQz
         haxnw7SRnwqkfXmyvFwjnHM4MkbT/LcVyuQtVx43hvTxLjAnUNc4s12hrGsQUefg1HN0
         u0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468602; x=1691073402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIAW4L168KNaaAwfT3AABxyDTXk7obg/adLu/lnLNzk=;
        b=g1BZpDxPBl1oGqBw6cLY+zZNJWePAXgdr3NC6zCPPRauPtlWAd/mVudtvmUgEW708d
         lGPJZEdjZ+KVbSiE+GoTesxywdYghlt44okv4d2jXYGX3y98cRxn4g6JjlQJYdYDvA1z
         u9mRRMD9DlJKYdgBPRALZfjy3DHOPS+feCBHqTul4dbkeFSpUbZ35xtlQMJ8JGWOg1hD
         J0gRNJ1gcXUHNaS0GA0cZw48BFzG6TqqQndwqiZ2Y73MMGNgVrtiK/kO/RoXua3dY7q5
         GWGk1lGChmBRghqcB2TihB8GL9ymxpX58Dntk6STQmj+Yl8ONSgXEJZtoa1AyCKvqe+T
         YGPA==
X-Gm-Message-State: ABy/qLbrCtDuBzp2aQvRYA1a/HVlWa+Y2fLhwIJiz68AeuBPIFB7jg5F
	v1oDtlD9VIEsKD3U3kAFGa5ZUCKD9ZU=
X-Google-Smtp-Source: APBJJlHUy75JP/vo2VhhBaiZtwXNvrAf3lVkt7VFREhPwZaYhyZa2XGA/kARuHUN0o8zy9ZmZeeFfg==
X-Received: by 2002:a17:906:59:b0:993:dd1d:8251 with SMTP id 25-20020a170906005900b00993dd1d8251mr2324356ejg.28.1690468601818;
        Thu, 27 Jul 2023 07:36:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/21] procps: address failure with gettext 0.22
Date: Thu, 27 Jul 2023 16:36:27 +0200
Message-Id: <20230727143627.3718496-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184961

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...o-address-failures-with-gettext-0.22.patch | 37 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.3.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch

diff --git a/meta/recipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch b/meta/recipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch
new file mode 100644
index 00000000000..805517900de
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-po-fr.po-address-failures-with-gettext-0.22.patch
@@ -0,0 +1,37 @@
+From 1d685477c254e5b10a81e32c87786e0f001b70f1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 24 Jul 2023 18:06:51 +0200
+Subject: [PATCH] po/fr.po: address failures with gettext 0.22
+
+Specifically:
+| fr.1po:3027: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In the directive number 4, the argument size specifier is invalid.
+| fr.1po:3820: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In the directive number 1, the argument size specifier is invalid.
+
+Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/199]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ po/fr.po | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/po/fr.po b/po/fr.po
+index 715c2b69..700834e1 100644
+--- a/po/fr.po
++++ b/po/fr.po
+@@ -3800,7 +3800,7 @@ msgid ""
+ "Type 'q' or <Esc> to continue "
+ msgstr ""
+ "Aide pour les commandes interactives~2 - %s\n"
+-"Fenêtre ~1%s~6: ~1Mode cumulatif ~3%s~2.  ~1Système~6: ~1Délai ~3%.1lf "
++"Fenêtre ~1%s~6: ~1Mode cumulatif ~3%s~2.  ~1Système~6: ~1Délai ~3%.1f "
+ "secs~2; ~1Mode sûr ~3%s~2.\n"
+ "\n"
+ "  Z~5,~1B~5,E,e   Global: «~1Z~2» couleurs; «~1B~2» gras; «~1E~2»/«~1e~2» "
+@@ -4723,7 +4723,7 @@ msgstr " -v, --version  affiche les informations de version et sort\n"
+ #: src/watch.c:486
+ #, c-format
+ msgid "Every %.1fs: "
+-msgstr "Toutes les %.1lfs: "
++msgstr "Toutes les %.1fs: "
+ 
+ #: src/watch.c:487
+ #, c-format
diff --git a/meta/recipes-extended/procps/procps_4.0.3.bb b/meta/recipes-extended/procps/procps_4.0.3.bb
index dc0e957bda1..71efb80207d 100644
--- a/meta/recipes-extended/procps/procps_4.0.3.bb
+++ b/meta/recipes-extended/procps/procps_4.0.3.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
            file://0001-src-w.c-use-utmp.h-only.patch \
+           file://0001-po-fr.po-address-failures-with-gettext-0.22.patch \
            "
 SRCREV = "806eb270f217ff7e1e745c7bda2b002b5be74be4"
 
-- 
2.30.2


