Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E72FA3743
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:39 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.2193.1666901788406356367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMh7S9D/;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id fy4so7882714ejc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOuifgPakIU8fhbtQGk3jwwTHP9AV5p0gbydePRmnds=;
        b=VMh7S9D/ePzYnZMKwI8iNivMfA+HyC9EP3kZPeJv3zb8gcEX9TjFtiAFQc0mVxKxW9
         RzzZlI2QqESEM9gb6C1sEeDPiVjxkWiabxBx1ME45zdZTvkIDmwEkeQSe0Imi2SnJEHK
         VxgldBL4NJyKR6qgbpmYQqDrE7+cJMdBJSD356ITnVGH9bWWIaVoy+g7VjB8lUKtKjWu
         VK/28/6NHqYUsztk9kc/jRveplOmI/wBuMi7W0M0O83bDDqQV7rMyErrETojX2cXlcqp
         ih96sZf1UtTL4uGy/Qc2sc7FewJFqLU5Zvs7DjxOO7aBzwYRjgI4e15VAD4MFXOIZ/0s
         pzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOuifgPakIU8fhbtQGk3jwwTHP9AV5p0gbydePRmnds=;
        b=bbej0Q4ZAE8UfnLVG5WMB/rVoip9qflzfpNxlczIqQ+BNQUmX7n/3LIxpxjBnOzSwN
         axDByO0wzJLWgB9PNUD8v0hIZl8e9YfrbDR+2HRhubp4vQl7BPVsLCCi00fGUIppJ5Vx
         M7Q0vu3HbwbzC94C2ruZsWWHYFJWOpwtS52Br+gitOCVUUXoaQgAsZzVyIFQHSzhDIYP
         p2IDayxr5MBVQYJSba2jvrddH7lOev5UREIxNrkvc3VypyvUuVy4fLjyThqmKf7OIAN7
         mmDA4OzocmU8BIAHUtnpq7ycz/Cyk1efWSBQ84tK08nzQE3oKrRaJ1gH0Q08h6i+90N+
         kgdQ==
X-Gm-Message-State: ACrzQf28YTZhCcPD828hVmx9lNUJtSbf0ZlSfRGQvPD2y2GWloT0k2VI
	bQwJj45SxpAt7Rx30WjAhZQv9RnGm1jfyA==
X-Google-Smtp-Source: AMsMyM7Yklx7Z5QSJfVSsnIDlmWDF8PdyXHYHs/SKAdI9CrY/MIxf4wXtYQg0YevR4ou3RIy24IRaw==
X-Received: by 2002:a17:907:3201:b0:741:94f2:aeaf with SMTP id xg1-20020a170907320100b0074194f2aeafmr43239731ejb.505.1666901797481;
        Thu, 27 Oct 2022 13:16:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/23] libxslt: upgrade 1.1.35 -> 1.1.37
Date: Thu, 27 Oct 2022 22:16:09 +0200
Message-Id: <20221027201611.3644334-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172224

Drop the no longer supported option.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libxslt/{libxslt_1.1.35.bb => libxslt_1.1.37.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.35.bb => libxslt_1.1.37.bb} (93%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.37.bb
similarity index 93%
rename from meta/recipes-support/libxslt/libxslt_1.1.35.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.37.bb
index 2fd777766c..361bb0f8dc 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.37.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
+SRC_URI[sha256sum] = "3a4b27dc8027ccd6146725950336f1ec520928f320f144eb5fa7990ae6123ab4"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -39,7 +39,7 @@ do_configure:prepend () {
 	touch ${S}/doc/xsltproc.1
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto --with-html-subdir=${BPN}"
+EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin += "${PN}-utils"
 RCONFLICTS:${PN}-bin += "${PN}-utils"
-- 
2.30.2


