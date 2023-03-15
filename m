Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C87EC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:02:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.8812.1678888924175973421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Vgu0uXFh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id h8so20103188plf.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nP4Z8/ZvD9NKiSCjdhtmu3tVtSbRiwyehDTSRiiVozw=;
        b=Vgu0uXFhML3HXklPbfEzGvfftDF/aDm8U8YFJ0z7g82+GUkhMgVtTTQYGJmhkFbEhJ
         ItTS+xyNix9taazqVe19W3WoifqXKq8iC85XbvH/5O9FY+huMLnpnnsAl3shog3ZW5II
         f3eK6XgKtRITmaI7o8nCvIzITlXazmxQEfjLupjCSzyXoPUtOuFMoJkvc4H0tGh/qoyo
         ohQ0FlVhoj1T7kubtAfQIwvp4s+LkUej9kPwNVs8Xk+fooqL+dVwbXIr7JvyjNhnbZVW
         MleySJiujUpcTJajI9RbPc5fuqHPzf0ekk9NHMZr7tZ8sFITdMdPeY6IVU/1MVUqzqss
         yO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nP4Z8/ZvD9NKiSCjdhtmu3tVtSbRiwyehDTSRiiVozw=;
        b=clcMiRZxRYoV7SKm19Ix9QodKb6UuwvZk5b/+eB5lTOsIHqnlKiXZ9vDh6qbDg6Zei
         snajvuL0C7z6Tzu8/4vlco8j2aUL7uU2Sh9p886QjIbbOWIMPUH0Jn/9p9KRL6J8p8IP
         JYx82KXRX9ZLPhd/H4/iFriYl967sn/D6KTZ9/iomFujGq/rhwn8eiX1C7PaJFRLSRUU
         quH6Ts10mhwy51OhGLmKXae61GPEj6KQ0e9Gag47RIkxA8OR2NBwDCzJBiA70EyZFcaf
         MfAsQAIFCN5nr5nQGblPX2wsAhd72JVweW1x7SMUaJWqZi0UNf54kX7yoJMDU9vueD8z
         7Wsg==
X-Gm-Message-State: AO0yUKUw72IMDJ5NK1g7VVg+G0PXqlFoQ+CLIqv7sTdWV9eVcIoe/62j
	/u7HDQb4KYX4QI5MQFSJBWdR40wGGVwxLbJIZ1I=
X-Google-Smtp-Source: AK7set8squ7J7DDe45M80bwkGg0orLoQ43UroovI7N4yeAT035y7PohYQLdW1N3JqvQyQsVxNiShzg==
X-Received: by 2002:a17:903:11c3:b0:194:cc66:66f7 with SMTP id q3-20020a17090311c300b00194cc6666f7mr3059190plh.19.1678888923153;
        Wed, 15 Mar 2023 07:02:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.02.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:02:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/22] vala: Fix install conflict when enable multilib.
Date: Wed, 15 Mar 2023 04:01:13 -1000
Message-Id: <8b41b5d2e423636942e34723ad940f6f143640c9.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178573

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted installs of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
   file /usr/bin/vapigen-wrapper conflicts between attempted installs
   of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64

The differences of vala-gen-introspect-0.56 are as follows:
@@ -2,7 +2,7 @@

 prefix=/usr
 exec_prefix=/usr
-libdir=/usr/lib64
+libdir=/usr/lib
 pkglibdir=${libdir}/vala-0.56

 if [ $# -ne 2 ]

The wrapper isn't used on target so we can simply delete it.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3cf894b8a9c4fa14fcc7c7445e85e9ae3192b398)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index d3daee37dc..162e99bb03 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -50,6 +50,9 @@ do_install:append:class-target() {
 # vapi files.
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
+
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
         # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
@@ -64,5 +67,5 @@ SSTATE_SCAN_FILES += "vapigen-wrapper"
 PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 
 vala_package_preprocess () {
-	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
+	rm -rf ${PKGD}${bindir_crossscripts}
 }
-- 
2.34.1


