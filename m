Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6ECCE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 08:49:40 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.57313.1695631773546499458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 01:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q7oNPFXG;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-532c3b4b55eso7002071a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 01:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695631772; x=1696236572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=px5rSZfQ0jfEHHi/dJnWef99hkJq3BAvXPR3CQBXgIg=;
        b=Q7oNPFXGf/LWOtPZlGFKVZZ/Z5cGxW3ujokUbkQ1zUULWnb+sVa+GOY4RrvUX6Romd
         1fXelTSu9Ch9AFV2wyxaABkCiw3MyCrkUBLn9puuZlrlVjFGQmu1Et32xvlNvP7I+LtS
         qpQoissSMUOQK94kxSapOlbQNkv4skb7cj1DjS6tFDFt2EIpAve/ovHn7BM/UonhcJ/T
         9Tiq7rA+YLKFESQ+2UvWVCWQfwBc4iBNafXkwSQ2k5dzq8Q4HkCzBdBrgCB7GyGa+FBB
         zz8HVJnJD5acevYwiUu+/VQzicO9+SuQaJm32xEMcNZ1GJSaCdhVJ9DRyrwGFZCZw8fo
         akMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695631772; x=1696236572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=px5rSZfQ0jfEHHi/dJnWef99hkJq3BAvXPR3CQBXgIg=;
        b=ZAESjbD95oSSmopkZET8IvKyoxOypB3oRxGCYYIV/ttf7jDrgN3OjBT6Liwzb3DuWl
         w4yX9bKiwfTKXct4uiuCKZK5cPuurHQde7yXm9LTNxv4hudMF0ngGd0zkRy2j1YZqlLJ
         7h2Ci9TRUX9FYf/EsfRv3flgvJNpKV+53QrbEhis2H7ZeW4rbZDKHuB3kIz+FJcJDO4B
         vnrEsHWl7SpkOK9VCUZEqAULBWtmfcKauqFm58NS6m/+l95q5GfTPDL3UPWQAxqIi1Qk
         fKnAdbqIUazOHBipm73alFiy8RNEfGm+JKqwQs1roCf3YEHC1RoAhZBedOZ8PNfNRgNp
         YiIQ==
X-Gm-Message-State: AOJu0YzNErJGZ+9PYq9U2MKGepSChp7XeEtjabkTkBGkww0LVn1tlSGG
	Bb09MpX7nZG3FsQqToEgXMivAAr1QT4=
X-Google-Smtp-Source: AGHT+IEm5vzIKqwRYOazniH2v2d5HUDHbAJ69pYbdyVWNn+p3VSZa/ebXlGiWaQocM5rCXssBf2wEg==
X-Received: by 2002:aa7:c58f:0:b0:52f:4c92:69ee with SMTP id g15-20020aa7c58f000000b0052f4c9269eemr5323018edq.36.1695631771751;
        Mon, 25 Sep 2023 01:49:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m26-20020aa7c49a000000b00530a0ceb4a0sm5263902edq.37.2023.09.25.01.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:49:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] groff: fix another build race via backport
Date: Mon, 25 Sep 2023 10:49:29 +0200
Message-Id: <20230925084929.1943354-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 08:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188182

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-build-meintro_fr.ps-depends-on-tbl.patch | 31 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch

diff --git a/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch b/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch
new file mode 100644
index 00000000000..3e81b86ac8e
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch
@@ -0,0 +1,31 @@
+From f21e9f13beb57a1e0666edf9693d7c83f2189897 Mon Sep 17 00:00:00 2001
+From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
+Date: Fri, 22 Sep 2023 01:27:57 -0500
+Subject: [PATCH] [build]: meintro_fr.ps depends on tbl.
+
+* doc/doc.am (doc/meintro_fr.ps): Depend on tbl, resolving race in
+  sufficiently parallelized builds.  Overlooked in commit 92349ae223,
+  2022-05-30.
+
+Fixes <https://savannah.gnu.org/bugs/?64695>.  Thanks to Alexander
+Kanavin for the report.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ doc/doc.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/doc.am b/doc/doc.am
+index d3c9ab6b7..0f95c7774 100644
+--- a/doc/doc.am
++++ b/doc/doc.am
+@@ -334,7 +334,7 @@ SUFFIXES += .me.in .me
+ 
+ # Use '-K utf8', not '-k', in case 'configure' didn't find uchardet.
+ # The French translation uses tbl; its English counterpart does not.
+-doc/meintro_fr.ps: doc/meintro_fr.me preconv
++doc/meintro_fr.ps: doc/meintro_fr.me preconv tbl
+ 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
+ 	&& $(DOC_GROFF) -K utf8 -t -Tps -me -mfr $< >$@
+ 
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 370817c9f27..0fc4f831d8f 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://groff-not-search-fonts-on-build-host.patch \
            file://0001-Make-manpages-mulitlib-identical.patch \
            file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
+           file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
            "
 
 SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
-- 
2.30.2


