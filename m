Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF21FC83F17
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:09 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.1282.1693417740562999783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HCfgh1JX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-56963f2e48eso62515a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417739; x=1694022539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzqoNCDLIAymGKsTzAE7e0mdTtwsHwc5rQR/6UR8Bvk=;
        b=HCfgh1JXGF78pZC6cXnCp6PtAxDEaugKPLUmYNzr/fQPjn1z9UBPfoOW61RQuRLzLW
         Myslsz554TZ3hwY+VYPTd6YoS4u8KsCIezGphTGCt4hmbrQFJwYGLLdxUudvEtJp5dLZ
         prc0w3wimrfDRoTZC7ajEgBnJsGYdNmXbKzaXWePx3DWsxv1qAndIlxE1LfnxiInEsLE
         8k+xU8lycjADi/+/MkXPAXQhFarCbH1arU8rmuYCYj5ne9ZNOHDxIE+siYFsCSdWUrEg
         0nyTd4eUJ2ofm81/lpKnSTzsI3xAOkB5ijYCZDZHTtL4t6cfuivrH94BkN0xgyDj4MIQ
         jGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417739; x=1694022539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzqoNCDLIAymGKsTzAE7e0mdTtwsHwc5rQR/6UR8Bvk=;
        b=dsGas44SkuvPC9jEJqO2F3OPHTeYpZHwbs/qFBfu/5Iviw0qoJBfc/25aDCgp1eqKy
         SnjRxXvTN1v6bNT7Pff0h7sqgZknpldyODq5U/GRMWMX9pHIhmYv+14u75kIeE5d1yKo
         W/CdKpwOTXHoSztIrfzNKDaNQnuLHYJOFC2xTuScH0iQS6AEUrQORLKMVpksqMwzkkdm
         Hz44GwzBIYp+XEhr3l4BwWlrSOC+Iue/2b7S5xV8TbBFFgth228u/xT/0goI+SaH+5Jh
         chwVKT57rJpm1DB9HEjNfB+9ITaRt0zD14zNYLqVZr64w64jQOpmKQpJqOA6MTv2F5kx
         yVLg==
X-Gm-Message-State: AOJu0YzKlIcsVtYeSorcFwXC96Snbi2qMS/bYaojteF7HJTNEWPOhHhr
	LjqbYhvQbl4eHKolNqJ5oLzwSsG6ImX50Zy4iyk=
X-Google-Smtp-Source: AGHT+IEgemQZGSUXu5TWDvR9SNjMlirSdGS30/dlRSOvtoH25yXP8d1o+c0rLhpp948wZvjgBiDVnA==
X-Received: by 2002:a05:6a21:8188:b0:13d:a903:88e6 with SMTP id pd8-20020a056a21818800b0013da90388e6mr2688947pzb.48.1693417739421;
        Wed, 30 Aug 2023 10:48:59 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/20] graphene: fix runtime detection of IEEE754 behaviour
Date: Wed, 30 Aug 2023 07:48:17 -1000
Message-Id: <49f8ba521e66c489f58b808af7abe61c44af5470.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186915

From: Ross Burton <ross.burton@arm.com>

Graphene gates a runtime check on whether it is cross-compiling, when it
should be whether it can run target binaries.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61bb4086bea61a0446f469ed3cb0d525860a1a31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../graphene/files/float-div.patch            | 28 +++++++++++++++++++
 .../graphene/graphene_1.10.8.bb               |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/graphene/files/float-div.patch

diff --git a/meta/recipes-graphics/graphene/files/float-div.patch b/meta/recipes-graphics/graphene/files/float-div.patch
new file mode 100644
index 0000000000..bf74101b1c
--- /dev/null
+++ b/meta/recipes-graphics/graphene/files/float-div.patch
@@ -0,0 +1,28 @@
+From c19d1f4a7e44e071df3a2612ae2eb20c84e831a6 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Thu, 10 Aug 2023 12:44:49 +0100
+Subject: [PATCH] build: Allow host builds when cross-compiling
+
+Environments that set up execution wrappers when cross-compiling should
+be allowed to run code. We only fall back on external properties if we
+really can't run any native code on the host machine.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 48f22d7..7dcb9e6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -270,7 +270,7 @@ int main() {
+  return 0;
+ }
+ '''
+-if meson.is_cross_build()
++if not meson.can_run_host_binaries()
+   ieee754_float_div = meson.get_external_property('ieee754_float_div', cc.get_id() in ['gcc', 'clang'])
+   message('Cross-building, assuming IEEE 754 division:', ieee754_float_div)
+ else
diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 9f5b4d0e2d..55d8a2d74e 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -7,6 +7,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc
 
+SRC_URI += "file://float-div.patch"
+
 SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da31dfde2928f279a"
 
 # Disable neon support by default on ARM-32 platforms because of the
-- 
2.34.1


