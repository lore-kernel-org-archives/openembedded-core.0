Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87B7CD3423
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 06:32:12 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9173.1777876331450905714
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2026 23:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=R7kUIRRa;
 spf=pass (domain: mvista.com, ip: 74.125.82.52, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12dfbcc0703so2897822c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2026 23:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777876330; x=1778481130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHSX7KJY0DaDZnWLro7IfZTeXyetIQbspafcTVM61Qk=;
        b=R7kUIRRaxGWS9yugKXyEDAfVi/0S6iosSIm2y/Iv0Uoo/KhjMzdtcAsJnXAp8TMpGa
         m/oS9cvGLuTYQxN74/5OD4WxHYP4wZjYYzy0tpdL5zJ4rcPgk6hqsghE7z6VFs1ifiB6
         92wP0N/zwpQ8j1RR17jAQKN8aE5h8boNUURqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777876330; x=1778481130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHSX7KJY0DaDZnWLro7IfZTeXyetIQbspafcTVM61Qk=;
        b=oZERqc1MfUP6Pfz/I1bDyFkv0PV6+cgL+OUz02abDSq4pV79tpPAwIbqArf9im10tm
         FfXrnA8SG3ToyI1xh7L3S2dmnOFSoxqcp93azS7Hjmb+OJDn3458K3tCgM9nMm/kleG0
         Zb+4fqjTDda3p86MEW0VNlNaIYNP9XaEKoQB1Q4bYF08m1Fr2Ws76cEiiZtAFSLajYj2
         92cAjGmk4Sp3pPzuTtVblg/9fzvtsoXHT9JwBjb46ldepZVHUmhgHXugICbjPHPGJoqx
         78rKk4saqpUkmfDlXdg616gCDOmBoF/iDQ+XgooDN5O5BANEuYsOZ8bN0A52sxVyiTuP
         kGbg==
X-Gm-Message-State: AOJu0YxCYKUXKCw+i2QBObZr1BCT02pd3TnEkhm8Fs4P5XYWaTYvY2du
	JkrpS/Es+sI13DZ6aN8jskBfgRRj20nfafCiyMinNEWDMZOQJUZBE2JW5QGohfdwrqUf9sChq93
	q6f63gWQ=
X-Gm-Gg: AeBDiesJwblSOS6yA6KzsjbmLrP8Fq646dvIKVx+mdQLZucj5W5R1GsjXKNCLW2IK9R
	AYA+q7yj5FIBFXErh3WEgAP76ZQSgiB4HAgrn+vuStkir4a1PlmFV/IgbGyUCh1Wj/MYw/HnaiD
	jIdtpB1hy433ugeQ5VwgcLf7LfXENEKxG5UnsRnCvDUAubnoO9KW7DMMqrk4kDOh8gZzCsb66iX
	Zv5EVnZrO/URhbtBxBpuLUFBesMxAIrOGljR3SW6hPV2bYQPubmtldUKtNDNg9T+alhQ4W2EEO9
	dDuqqV7Nu9BfaGL9PqHdHqOXeZJ8Zim1oh7LmGqHgNNetSPG19VR9yGcK0IiDecQuVWjIpzCClf
	u7ldPcMn/JBcBmt1nqT61E/XtkRwNCva+QQ8f+51cJwc2CsMQHaITIzyq9NO44XHtaysBsO2/81
	iQUZQB76AkztiZmdNNMZl7/0Cel1Xe7LGytnrLquXZRZ/dLnA=
X-Received: by 2002:a05:7022:404:b0:12d:b7e5:a67b with SMTP id a92af1059eb24-12dfd7ca694mr3875762c88.14.1777876330473;
        Sun, 03 May 2026 23:32:10 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df81ec067sm14995802c88.0.2026.05.03.23.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:32:10 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 1/3] libexif: upgrade 0.6.24 -> 0.6.25
Date: Mon,  4 May 2026 12:01:57 +0530
Message-ID: <20260504063159.30681-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 06:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236431

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../0001-Add-serial-tests-config-needed-by-ptest.patch      | 6 +++---
 .../libexif/{libexif_0.6.24.bb => libexif_0.6.25.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libexif/{libexif_0.6.24.bb => libexif_0.6.25.bb} (94%)

diff --git a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
index 505aa07330..26ab7f657f 100644
--- a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
+++ b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
@@ -1,4 +1,4 @@
-From 1ee7217c8ae724d793f9a9876c3608057a2ccbf8 Mon Sep 17 00:00:00 2001
+From ea0110e5def8eaf2567193323601f06ff892ce15 Mon Sep 17 00:00:00 2001
 From: Julien Stephan <jstephan@baylibre.com>
 Date: Tue, 11 Jul 2023 16:07:54 +0200
 Subject: [PATCH] Add serial-tests config needed by ptest
@@ -13,10 +13,10 @@ Signed-off-by: Julien Stephan <jstephan@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index cd48047..5413907 100644
+index 9e483c9..561b61c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -16,6 +16,7 @@ AM_INIT_AUTOMAKE([
+@@ -21,6 +21,7 @@ AM_INIT_AUTOMAKE([
    dist-zip
    check-news
    subdir-objects
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.25.bb
similarity index 94%
rename from meta/recipes-support/libexif/libexif_0.6.24.bb
rename to meta/recipes-support/libexif/libexif_0.6.25.bb
index b407ee52de..59c22753d0 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.25.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"
+SRC_URI[sha256sum] = "7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307"
 
 inherit autotools gettext github-releases ptest
 
-- 
2.50.1


