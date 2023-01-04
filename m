Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAFCC54EF1
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9370.1672830362981472240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S5JZHhUQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id t15so23699991wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT7SiaWeqZF2bROGKhxoKQFAF8chPIqj2I9ETCmDKZY=;
        b=S5JZHhUQ6kQJ1uajZ4YWnkDoZxDtGQ3haTdtFElkARfbr/FQHwVC03Egv7M0JKaSqm
         3dxAExzF4Qt5Sc8vQRCDFGBYGvut+bInK+BTAkii3Qvq0iUnh+qhqIV6+2JbX1XP0uqL
         1EF2jfKTlnDT/rnaFjiYKiBR1dZh5sb+ECBtxmyO4f6l92RK/0WjvgmUZOA7PaSZpSMF
         OTkkFzIc/V9cr5LGsNw89gTi3Pe/YdCEbPZDiz+d7nJtGbTornrl5kF7ZYxliFfGOoFq
         89aZud3gFGuoIWLfmfefeF28N3bsFWo8IBSv9FNAGYZfe8jYQ0IlwijoyV74VjZppLxR
         MkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bT7SiaWeqZF2bROGKhxoKQFAF8chPIqj2I9ETCmDKZY=;
        b=Ql+iIz1w5t8AOwpESf5lzAakOsZaOaKAnqr0dxes1tt0ZO91rYGbCXnWevB//BYh0c
         UJyl7zaWoT1ce3YgY5vgKWxGFrlY5jkfNm9YABJRRwHPCEyKS1orYTIPT8CmQptTBWVg
         lgEdEzXTuViOQoHjcFZq+hXlwNbyI2AHvBSDB3SefcmyMDVhHJ61438MKGywzaOYjvSY
         PzF4TIBCGUSjJZaSV7RyzBsBWq7vEpZuoE5XnI3Kzt8x/8+Inq5JZmRtwRlhgUyJOEri
         PBoWza9gc7BkDUEwHc6zZl55YftL8bEY8kNhhWjHv9gjOGVsVnVJ/WI6ys2oJBwzrkqj
         GJlw==
X-Gm-Message-State: AFqh2krtOH3FQD8HbEXwrKVdvs+DKaW6HT78sVzMUNeMNIpJEf68N3AN
	Eg4IbryKCFVx0rwyrmxsRAnesgU62B0=
X-Google-Smtp-Source: AMrXdXtybfZeF+G0Sb+FPfVVsiiBFfa2sISejbNtpkZuZf/jQinrh6LOU4gAUXthd0BW3FXk8VzY2g==
X-Received: by 2002:a5d:444d:0:b0:242:7089:ab90 with SMTP id x13-20020a5d444d000000b002427089ab90mr27441170wrr.69.1672830361452;
        Wed, 04 Jan 2023 03:06:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/77] libksba: update 1.6.2 -> 1.6.3
Date: Wed,  4 Jan 2023 12:04:42 +0100
Message-Id: <20230104110548.2537259-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175396

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch        | 6 +++---
 .../libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb} (94%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index af96bd57cd..bdb80ff34d 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 6081640895b6d566fa21123e2de7d111eeab5c4c Mon Sep 17 00:00:00 2001
+From ca8174aa81d7bf364b33f7254a9e887735c4996d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/ksba.m4 b/src/ksba.m4
-index 6b55bb8..6e7336f 100644
+index 452c245..aa96255 100644
 --- a/src/ksba.m4
 +++ b/src/ksba.m4
 @@ -23,37 +23,6 @@ dnl with a changed API.
@@ -44,7 +44,7 @@ index 6b55bb8..6e7336f 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"$KSBA_CONFIG" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG ksba --exists; then
 -      KSBA_CONFIG="$GPGRT_CONFIG ksba"
 -      AC_MSG_NOTICE([Use gpgrt-config as ksba-config])
diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.3.bb
similarity index 94%
rename from meta/recipes-support/libksba/libksba_1.6.2.bb
rename to meta/recipes-support/libksba/libksba_1.6.3.bb
index f6ecb9aec4..dc39693be4 100644
--- a/meta/recipes-support/libksba/libksba_1.6.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.3.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
+SRC_URI[sha256sum] = "3f72c68db30971ebbf14367527719423f0a4d5f8103fc9f4a1c01a9fa440de5c"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.30.2


