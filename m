Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8D5C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:50 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.5285.1663078725888225045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qsOi5OHc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso11479786pjm.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=g5VXro3t8aFCjWjI5lvO81ceEShEBSoVL03m+Wy5buY=;
        b=qsOi5OHc6JYs7MHccgvFucoOG4ey867WrNdxIV8uThcHEZJzqtSTcKc2V9RvbsaapD
         fO0QTvXVtdl44R6+xuYrxEEpBc7tQaetXv9tWKWF/nJxWeQsjWjlZaWnrgXAFW1qw5Sb
         twLYISHWjahcgoftW5ymTKkSfrW1ENc3d+ndB8uD+8e2C2MuH8sIZ3ZKL6l4J65gLPBp
         aEGHYkKXyVL76dumKboh7fHkEBKY5iX7lDk6EUUfnUkAxOesKlr4LmWMm3ueHYcdjS6z
         4KzgcxbvkrfzmLxu14oXJuUJ0I+784vv7lInO3DxJyRysO3huvFPB8alY43pcz1cux6x
         tgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=g5VXro3t8aFCjWjI5lvO81ceEShEBSoVL03m+Wy5buY=;
        b=XLPJIMyJHwvFQeDevIBI1LgOGdKYp1CPSZf17uy8UEp1eu2idFkBU8/Gd5mE8ZkY1S
         Od94SlFj0JezxNG/7n8nzX+pAmEiELRdxYSU1bGZy5rY3VzbcjjFwvbapnyaA3e/j8JV
         DIedN9A+EFXy7ONIuH6K5SDAqXwSy3JNn4iiaLVYHgEnsPgzkiMK+5hf1B5cIsq4eXJs
         KU9NjF6OVbGKFEzAOQcRKqh+hyIVKAmhzucWZAEiQir0F4dXGrolMG+XLnIT0YNd4l6B
         sIExGACD4THNzy4A3fEgVMdhb6KczjlpSe2n8ALJbKpYq57LVwO77IMCm/AjhCprpItx
         25MA==
X-Gm-Message-State: ACgBeo3sXagqox0bpHbdpyZ01vGIgAlhdXxfOiUh8sN3gJkQt7ljEA5T
	N5yMVwSQHmgg2rmtLian6c8aMiw6NZy75VxC
X-Google-Smtp-Source: 
 AA6agR524eJnYewOXPIEnW36FHcOITsUQCBMrrqI1vTfRnFrpp7ducHfCXytVN+k7VX48n8Oi7fzKg==
X-Received: by 2002:a17:903:228c:b0:178:3bc7:8a3f with SMTP id
 b12-20020a170903228c00b001783bc78a3fmr7200743plh.88.1663078724710;
        Tue, 13 Sep 2022 07:18:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/16] externalsrc: Don't wipe out src dir when
 EXPORT_FUNCTIONS is used.
Date: Tue, 13 Sep 2022 04:17:55 -1000
Message-Id: 
 <70f7575bfe7e3b136125b1db7ad5549074e7fd1c.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170593

From: Kristian Amlie <kristian.amlie@northern.tech>

When 73fa855f6af5ef9c3 was introduced, the "cleandirs" variable flag
started applying to functions exported using EXPORT_FUNCTIONS.
The externalsrc class is supposed to remove cleandirs in order to
prevent wiping out an external src folder (home directory?), but
doesn't take the previous point into account. The result is that
cleandirs is still in effect.

To fix this, apply the cleandirs manipulation to all variables, not
just predefined ones. This is expensive, but since it executes inside
an `if externalsrc` clause, and EXTERNALSRC is usually only set for
specific single recipes, it won't affect most recipes.

Richard Purdie <richard.purdie@linuxfoundation.org> is the original
author of this patch. I just submitted it under my name for blame
purposes, and also we have been testing it a lot in my company.

This is the original discussion:
https://lists.openembedded.org/g/openembedded-core/topic/91374926

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74ad497a55007960a4869905878e3ccbd11e4369)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 90792a737b..8136d25cb1 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -90,16 +90,18 @@ python () {
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
-            for funcname in [task, "base_" + task, "kernel_" + task]:
+        for v in d.keys():
+            cleandirs = d.getVarFlag(v, "cleandirs", False)
+            if cleandirs:
                 # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
-                cleandirs = oe.recipeutils.split_var_value(d.getVarFlag(funcname, 'cleandirs', False) or '')
+                cleandirs = oe.recipeutils.split_var_value(cleandirs)
                 setvalue = False
                 for cleandir in cleandirs[:]:
                     if oe.path.is_path_parent(externalsrc, d.expand(cleandir)):
                         cleandirs.remove(cleandir)
                         setvalue = True
                 if setvalue:
-                    d.setVarFlag(funcname, 'cleandirs', ' '.join(cleandirs))
+                    d.setVarFlag(v, 'cleandirs', ' '.join(cleandirs))
 
         fetch_tasks = ['do_fetch', 'do_unpack']
         # If we deltask do_patch, there's no dependency to ensure do_unpack gets run, so add one
-- 
2.25.1


