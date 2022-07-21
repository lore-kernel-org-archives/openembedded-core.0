Return-Path: <grembeter@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392F1C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 15:31:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7830.1658417500174687637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 08:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cLDAPWje;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: grembeter@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id mf4so3826386ejc.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3tGdX8/hicHOz6nZnFP/bxK9POGy46ZCwqpAlIA4Sbc=;
        b=cLDAPWjeDxekqIEkZuolLU1xzvuL96Te6UzQ45oWuKEpOuCWvmUED2kpVNz/T134og
         tNs9b8lLTlAxKD48jynlUz7ghN9ChKs7DAJ6IYj5Fevvvztn9d1pKCqnUF3Ktd5Z31sI
         He4Ox7HJ8WLGEQ6x6iKctJR4mt8Gj9cqeN8JkXmyUnz8yi+2rdYnf+kdl34fFTGY3Q3N
         VMGORcHN3BPZg3CQor03/B7+eHXUP5vw2fEyZPTI1AKAUBFg5KOfipMCGFzD5AkNlL2V
         E1hATaxBWfYYewZWllHCp9Qa1tRZwmBkpPJKUhlJns0VC0irtCIPGCd0a+N3pYoUa2kh
         n7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3tGdX8/hicHOz6nZnFP/bxK9POGy46ZCwqpAlIA4Sbc=;
        b=OaufIm7z6PYPH3BnFL/hrgsNpVOBrWbz8d/Gnix3IxWhycrVzhDG6RRJXZYq2TZ7P1
         uMTBgtLOQqIUX2Hdt1GD4LcTY4Nde5pv410nIxSlrAKY4cRLfnP8AOw8uVsekIlPiyUz
         bSzBx9JsdBnyb4LXg2cGiJNJQ/XOSxs1+i+A2O2j7JxehdAzeaRosZT3FEqgG4WiJOmO
         TFX+RU8/1hR/7rFMePXy/gtxgnNP1KDGgVk1CIAMuwsSLRALQ5bA/hIGv03eEQDqU/gm
         Uy89vW4jIKOgZtJStJEfq1MRVDUkpOQfjp6nbXsSsFT5eMzMneo4EgDX1YpyHgKttk1L
         ZaBg==
X-Gm-Message-State: AJIora8oXNw6pGpfq4qaGI95MyRM2xGpi0hSSfOcWcNHrEqC4QfnYduf
	hakyxxfsbmRdy7c1s0p+Kb0JmnMk4M0=
X-Google-Smtp-Source: 
 AGRyM1t5ABGE3ToODFystMMrVok4Bp3uimeeQOdihmeogGVNDD5PLWDGTR/Ojt9fopcRS/jSaIefWw==
X-Received: by 2002:a17:907:868f:b0:72b:859e:8fe4 with SMTP id
 qa15-20020a170907868f00b0072b859e8fe4mr40728339ejc.98.1658417497038;
        Thu, 21 Jul 2022 08:31:37 -0700 (PDT)
Received: from aherlnxtgry02.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id
 gh4-20020a1709073c0400b006fe8c831632sm965031ejc.73.2022.07.21.08.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:31:36 -0700 (PDT)
From: Grygorii Tertychnyi <grembeter@gmail.com>
X-Google-Original-From: Grygorii Tertychnyi
 <grygorii.tertychnyi@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Subject: [PATCH] efivar: fix import functionality
Date: Thu, 21 Jul 2022 17:30:46 +0200
Message-Id: <20220721153046.954697-1-grygorii.tertychnyi@leica-geosystems.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 15:31:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168389

"efivar --import" is broken in v38:

 # efivar -i /8be4df61-93ca-11d2-aa0d-00e098032b8c-Timeout
free(): invalid pointer
Aborted

Backport upstream patch to fix it.

Upstream issue:
https://github.com/rhboot/efivar/issues/173

Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
---
 .../0001-Fix-invalid-free-in-main.patch       | 30 +++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch b/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
new file mode 100644
index 000000000000..7e63df578e2a
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
@@ -0,0 +1,30 @@
+From 085f027e9e9f1478f68ddda705f83b244ee3bd88 Mon Sep 17 00:00:00 2001
+From: Robbie Harwood <rharwood@redhat.com>
+Date: Mon, 18 Apr 2022 13:08:18 -0400
+Subject: [PATCH] Fix invalid free in main()
+
+data is allocated by mmap() in prepare_data().
+
+Resolves: #173
+Signed-off-by: Robbie Harwood <rharwood@redhat.com>
+Upstream-Status: Backport
+Link: https://github.com/rhboot/efivar/commit/6be2cb1c0139ac177e754b0767abf1ca1533847f
+Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
+
+---
+ src/efivar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/efivar.c b/src/efivar.c
+index 5cd1eb2bc73c..09f85edd0a38 100644
+--- a/src/efivar.c
++++ b/src/efivar.c
+@@ -633,7 +633,7 @@ int main(int argc, char *argv[])
+ 				if (sz < 0)
+ 					err(1, "Could not import data from \"%s\"", infile);
+ 
+-				free(data);
++				munmap(data, data_size);
+ 				data = NULL;
+ 				data_size = 0;
+ 
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 53fe20a95b91..42625fa041f2 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            file://0001-src-Makefile-build-util.c-separately-for-makeguids.patch \
            file://efisecdb-fix-build-with-musl-libc.patch \
+           file://0001-Fix-invalid-free-in-main.patch \
            "
 SRCREV = "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
 
-- 
2.35.1


