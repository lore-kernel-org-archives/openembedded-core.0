Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18E0C44509
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:09 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88752.1783067408429936256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=btiFPV7Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4720f3bf164so696523f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067407; x=1783672207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcIMjLGw+ba1id9k5a/8TQoa0H82h4bcJkjdS6GUchM=;
        b=btiFPV7YCDOvBa/RDFZ9ZIPTRcuj86u7qFeuybPvTNrQqfzrQ17zFU3EgoeaZ7EDi1
         UjYc5gENaKIKr+dGg0eywwBqlc8+bpVNGz0lLVTW/R1V8APStEb+0gcyJ5ZEa1KBCiGp
         rb5jQ/Hwr2LaNTFv1nXRX1qNUKos9E4uBt/6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067407; x=1783672207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcIMjLGw+ba1id9k5a/8TQoa0H82h4bcJkjdS6GUchM=;
        b=p+09pDlkPi6VzW/emeCikCtYY1EzXeS7aDWxFvfdp2/tgwzZdwwSVEA2Dr9a8YwT6w
         w4SsjhihTUiWoH90xcnBRit6/6UZVSzjnjG65RfhFdchpnMm4tgKFD/T/BX6/tfARCQd
         e2WFeBcd0zVuLKW2njgjvO8fmvhLDQroEbselAgy2RTe9F67oRHVOz2X/2JAuxIKNN8N
         c1GUqC0ELounI2AOrvSRCF4fFagvmfYoL7klCMMdvoa5nMD1NrKfpAd+PxHutTL+qvpr
         uhcdgh+jjt44txO/x0sRP9mCqkNfRb+yWEgr02/6y4bZuFhQUw8yp6HocLkJSFC61HZG
         qlJg==
X-Gm-Message-State: AOJu0Yx5HotmgildY6kgiBH1jUyNX6VpGVSwGBL0t9D1t0E2Po0UD9+o
	fPtkPKMMr9gy0Az/T1AKxqhwnoMR3x6MKyddNj6Fyxb00k15fq5v1dei4NOzTl1wtD3clPs87jL
	NUk2HWsA=
X-Gm-Gg: AfdE7cnPTJXRkdksYou3qOGv1XxBvgJPi5ROuaN1aroT1khoFAO27n7R7sW0BVWy1CM
	xMXunbKSNVfhzPwZyJefhZc1BJsAW2lSaSxVitAQqEkknuBRW47hZCguO43riV6LZ5EdAaVjNTx
	Y0UI3gla/6qjeANlKiJVhaEWoQmeDVywucMAu+jivuBl90JaofDbiaU8OVnmX3hGDP9acYiqgkF
	2DBi2nMiRpIk8ixmlFjKziMvKyw325K+ExhPOVRYSKO7xv5pOaEG4vYV2ADoBWwHHHIvinHUeVn
	HCPHGYuzAcazocE00we6VWtIRI4vaYVSyyJCgoMeDMlyOXCns+nIPSDVnyLTP1gf7JBlWzOnUmN
	69OgvYzlaeeFGRHwbFTQx7FgpFqK4ojKiyc5lGtjkVMeHnXd3wtBjZCpaJ/lXZprRw+kT9winMQ
	8qbDdRas7PkiAIPVFq9L8gKR8h2szl+trHXxYWU+GuLIdd7dThR6mM
X-Received: by 2002:adf:f012:0:b0:474:4817:8c15 with SMTP id ffacd0b85a97d-479373e6ca6mr2806325f8f.26.1783067406564;
        Fri, 03 Jul 2026 01:30:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/15] libxmlb: upgrade 0.3.27 -> 0.3.28
Date: Fri,  3 Jul 2026 09:29:49 +0100
Message-ID: <20260703082955.1585712-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240091

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.27.bb => libxmlb_0.3.28.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.27.bb => libxmlb_0.3.28.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 2dd4a6727b6..39e85b319ab 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 14e62a2eb40fdd1c78b82b4855541686608c3d45 Mon Sep 17 00:00:00 2001
+From da7a7acacde7771ce4c0fd3ae7e55d0c151ee063 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 043db65..be86a38 100644
+index 795167d..ab2b582 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -3304,7 +3304,7 @@ xb_speed_func(void)
+@@ -3329,7 +3329,7 @@ xb_speed_precompiled_func(void)
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
index c68f375aa32..0e1c815362a 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.27.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "2320a66cd267a82bfd41db90e35cd33e1f71bd8b"
+SRCREV = "7a1b31db70bca83345de26219eb7e858cb85d321"
 
 DEPENDS = "glib-2.0 xz zstd"
 

