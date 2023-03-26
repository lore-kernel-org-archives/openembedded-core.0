Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041D2C77B6C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 14:56:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11691.1679842575379242046
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 07:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ArCs/fFi;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id l8-20020a05600c1d0800b003ef6708bbf6so1550710wms.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679842578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yasAkKMo5DiQAj3RFbi4YFfV4iYL6M5/x7ieuNiEAW4=;
        b=ArCs/fFiFurjId9MFQRvKqT7Le2xSTqV1HDpHRaqhJIgHG+dYMVmJJ6MT7NsT9gWti
         +yKHZT5qWOFPhjq3j7KH0f+aa7BAcAExs6plMYneoyalnKxB5fktpSuQ+Edye5KHwMRa
         DuLDAgsayJTkAIXekUdHffa7yIzGAJ0EmChx9WU9Iu0LQ3pjzu2Fd2VBRy+wPvBTLm6m
         BsuBopNVj0TeOpBulcbx+bCv13WBslVNwXdrSMoqZD90jZpFQU3iptjYiChCVznckoJF
         MQo4J7jdQL35NhBEw4CnxAXV9l7n7qZzH2MiWD2jV6lAGs/soI6NfX2lJcC1q6BAW7l1
         dX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yasAkKMo5DiQAj3RFbi4YFfV4iYL6M5/x7ieuNiEAW4=;
        b=ECufWUs01UuEink7HPCj9kJwvF2AKneumgWWMT4fwwQjurNRY8z/tEytTyK4OG7Tla
         RC9QlXUJr6NZwpnsC+eVQjY8f+L3+xcG2vCIdSVfTpQ6FUAuShoGxCfhmhDrg8i1WUc2
         nS3MSy8j6hv0L3940uC/bRuhLhyQI/LTXQGyUvgCAaVALnZm3P7qjAcws7qT0vb/d1Wt
         ts9zCM6AW5scYtSMBTuf8PJzvC1McV2O82FE3d0P2s4REojnPfqM+k5ZCiK04++zZKrN
         Qc9ufx2rnqF7+3RUHRX742eJLInFpNVYsl9RqoU/JkkF70fNCscwaQ0jkxUPc/GS2b8C
         CjCw==
X-Gm-Message-State: AO0yUKXzbRJ+71PXwYvwJUoDPn6PoZiCZBiglmvOfJD27HcGMFCqqiSS
	r3YHEdTLUb0ELXffVad4CXokt7UuMZY=
X-Google-Smtp-Source: AK7set+7bXEFDtM8stbvkh+J9yhzXqcCiuJ6ad/wgISkh31QckK6ea0gKHz0wSzHODEARXnkQof6tg==
X-Received: by 2002:a05:600c:2118:b0:3eb:39e0:3530 with SMTP id u24-20020a05600c211800b003eb39e03530mr6611085wml.41.1679842578400;
        Sun, 26 Mar 2023 07:56:18 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:af58:462f:1cbf:cab5])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee63fe5203sm10797549wmm.36.2023.03.26.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:56:18 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV2 4/5] devtool: add support for multiple git url inside a cargo based recipe
Date: Sun, 26 Mar 2023 16:56:02 +0200
Message-Id: <eaf66cf5064cbc92f0f643d42a266927f0c502a0.1679842454.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679842454.git.frederic.martinsons@gmail.com>
References: <cover.1679842454.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 14:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179124

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Without that, the possible git urls that are in SRC_URI of a recipe
are removed from SRC_URI during devtool process and so the
cargo_common_do_patch_paths in cargo_common.bbclass cannot
patch these packages to fetch them locally.

I use a generic type name because I foresee this change will
be useful for recipe that used a package manager (cargo but also
npm) see https://bugzilla.yoctoproject.org/show_bug.cgi?id=11015

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes/externalsrc.bbclass                       | 4 +---
 meta/recipes-extended/rust-example/zvariant-crates.inc | 6 +++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 26c5803ee6..b00fdba8e9 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,9 +68,7 @@ python () {
         for url in fetch.urls:
             url_data = fetch.ud[url]
             parm = url_data.parm
-            if (url_data.type == 'file' or
-                    url_data.type == 'npmsw' or url_data.type == 'crate' or
-                    'type' in parm and parm['type'] == 'kmeta'):
+            if url_data.type in ['file', 'npmsw', 'crate'] or parm.get('type') in ['kmeta', 'git-dependency']:
                 local_srcuri.append(url)
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
diff --git a/meta/recipes-extended/rust-example/zvariant-crates.inc b/meta/recipes-extended/rust-example/zvariant-crates.inc
index 297a784661..41f50b1b0c 100644
--- a/meta/recipes-extended/rust-example/zvariant-crates.inc
+++ b/meta/recipes-extended/rust-example/zvariant-crates.inc
@@ -125,9 +125,9 @@ SRC_URI += " \
     crate://crates.io/winnow/0.4.0 \
     crate://crates.io/zvariant_derive/3.12.0 \
     crate://crates.io/zvariant_utils/1.0.0 \
-    git://github.com/gtk-rs/glib;protocol=https;nobranch=1;name=glib;destsuffix=glib \
-    git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=glib-sys;destsuffix=glib-sys;subpath=glib-sys \
-    git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=gobject-sys;destsuffix=gobject-sys;subpath=gobject-sys \
+    git://github.com/gtk-rs/glib;protocol=https;nobranch=1;name=glib;destsuffix=glib;type=git-dependency \
+    git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=glib-sys;destsuffix=glib-sys;subpath=glib-sys;type=git-dependency \
+    git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=gobject-sys;destsuffix=gobject-sys;subpath=gobject-sys;type=git-dependency \
 "
 
 SRCREV_FORMAT .= "_glib"
-- 
2.34.1


