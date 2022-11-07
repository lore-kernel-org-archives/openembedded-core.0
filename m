Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD49C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.4342.1667832948899435495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oK38z+T7;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso9808112wma.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9UOBpOo3wy+h89NobCPhHnm62zMRop4o0eMzMTdIfQ=;
        b=oK38z+T7m4R8yA8SHOwvc1ypMjG0+N2ntlVJSWTV3kFtVjiaRv3A9tVVxJC+K4eMNk
         lxqlR2ylaxPSygMrksdT6cAngAEc6DigjdQAjMYED8PvN5apIlXxwX7Go5c77iblDKz5
         zYlgtOpAywhD6a1ZBciQnuNmbE6MtXC+XqFTPWkYbKXiZEYu7Ip+6H86QZPNJ5/3MmmS
         oj5tTqAVUS052pebu1QsRi8WWTt/jzhe+AvHr0WEhzcfiP0KoLTXJXYxpp0xdqIQBVJ2
         zQbFwDZ0vRrZ9rhUwjb6EbpJfA6GjwZpHS6LAO+KmzC6e2SxAdTpCjREEZ0JwFnlYQdo
         4yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9UOBpOo3wy+h89NobCPhHnm62zMRop4o0eMzMTdIfQ=;
        b=LRHCIcGvWi0FU15qXJxxwX0YUxXcBDL7oC6XTtprN1XD2t8C7G3dcFjdKNOitQK43M
         ZCaOnUASJxp1toOAndMpGMDRaE4Bi+oCTfgW+YHB/NlsDPUq64i/VgR47tBjDWtM0eOj
         RHOnBCQFRSWnPu4Kgl9Jz/9zIdntY8iJ7JozsTWitPEMNnPR5+SO5OuE8bM+yxEt+y0t
         pM5jIyh9/IWKN+lnvcfaEPLroa+2o2nTR3pSSjOu0L9i6ka8lZ7Gm6MxzZQgu/QT2KHw
         WUbOLI9n179IbU4mbB+SzE4or7c9FtqdP7Avj0VEvVUQ/2N4Kltin/hYWvbrFVfHgEcj
         71eA==
X-Gm-Message-State: ACrzQf1VUmTdm5ZHnMR6W63PQEnghfLzxsPVBGDVDgLhRpm97oNTq5w3
	L3YJwxUqeHzQhoWUI+bJVD40d88MMbk=
X-Google-Smtp-Source: AMsMyM7N4posh5XW1MUFZ2YZ680UxqXrdMuupe3ZjYI3uX8bM5yii/z+YWQzSfSZEv7rI8OqeVMixw==
X-Received: by 2002:a05:600c:4fd5:b0:3cf:9e9b:68f5 with SMTP id o21-20020a05600c4fd500b003cf9e9b68f5mr8564446wmq.60.1667832947362;
        Mon, 07 Nov 2022 06:55:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/48] gdk-pixbuf: upgrade 2.42.9 -> 2.42.10
Date: Mon,  7 Nov 2022 15:54:53 +0100
Message-Id: <20221107145508.1051404-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172883

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index d33718e3ea..aa44515fbb 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
-SRC_URI[sha256sum] = "28f7958e7bf29a32d4e963556d241d0a41a6786582ff6a5ad11665e0347fc962"
+SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.30.2


