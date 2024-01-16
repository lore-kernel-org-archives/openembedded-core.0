Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D754C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 11:08:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.10815.1705403300226704846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 03:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFkPQNFf;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a28ab7ae504so921336766b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 03:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705403298; x=1706008098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4LpzpwSx5KyMmDuZeZKwTMCx4vVyv3TPuKUq7qbF/M=;
        b=XFkPQNFf5waMvZ0fIaqUkwNeKv/J/ThwD73yH5zlXyXfOjLZHzCPSp8WOkFirH1fVN
         EukXp5LAWq/PAVKa06ik0hf0qI0K+X+QVC6nEnoUAlCp98EifQernO+aZ5Q42x2Rzg2t
         codwZs5rOVvyhjfI4td+h+UDLinNNH7dLLYdfDkDMiw8n2yc2PMQOUtNLYErYorfrpCQ
         dcVziKjZYrrFGzaxJlTF+ciu8i6AcpmKJq3WkyX6C/pyZVHkJC6ujwrfbAx4E8VFA1zS
         As5Kji5Iorx8O0rzZWjE/oE4MmgHPsdhnhpkc7Bi5W9A/8DLl5K+fgbsgSssjOtFtRKP
         xcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705403298; x=1706008098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4LpzpwSx5KyMmDuZeZKwTMCx4vVyv3TPuKUq7qbF/M=;
        b=OzgP0fPP7OP+YY5kTOuyERRkI/MQhxSRA+UsKfr3INE0EIygYIdqkzST7ljRlTII0j
         5/yw1jOs1nxGZYFhTvqoPNb6dETdC1Xl/72Lh2UgrLOqagL/6yPhSAZ80iup803Gfzhi
         YLjSu6G3qDMoUTD3/RhsGLyRHeSwD2PoWLFwhb+Nt4oig7f27q67hBQT3rduFOq4yF/Z
         ivjV04jEB1KKpu10jlKKnDJxypOYTCiMDq4r2Ew/px+VEm4zLKS2Dd/FDqegXz9I17vM
         KXIe+UdlRoGTmtt+aV2wlfSyy9sSmvEvWPTZ+olmi1kbPG8fGpjy/B3OpX67PJ1Te3ES
         7uEQ==
X-Gm-Message-State: AOJu0YwENdE7xJmTvTWe8zYb7FmQTnTyVdLsOzG5f6TBcc5nj8CWE9yR
	LK4rb148cUr3BZMixdEVpSPKyzB2HeE=
X-Google-Smtp-Source: AGHT+IHd68oVFJwjhTlI2e0/EQmEkfHssfuTqoA6O6/7BbTfNor9tXH6LZ99Qqz53Ib4pHL2h5Ztsg==
X-Received: by 2002:a17:907:8e86:b0:a2e:4914:cba with SMTP id tx6-20020a1709078e8600b00a2e49140cbamr881162ejc.133.1705403298061;
        Tue, 16 Jan 2024 03:08:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a1709067d5000b00a26f6b8be1csm6327937ejp.75.2024.01.16.03.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 03:08:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/3] glib-2.0: ensure GI_DATA_ENABLED is set
Date: Tue, 16 Jan 2024 12:08:12 +0100
Message-Id: <20240116110814.1052866-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193854

With python 3.12 some of the glib ptests started failing. Inspection
revealed that they fail because all tests in some glib's test suites are skipped;
python 3.12's unittest module deems "no tests in a test suite were executed"
a failure (and I tend to agree).

Why are all the tests skipped? Because python dbus module is missing from
the image, and it's missing because it's pulled in by dbusmock, which
in turn is missing because it is pulled in by glib recipe subject to
GI_DATA_ENABLED, and that variable is not global but defined in a g-i-data
class that glib recipe did not include.

So needed dependencies were simply always excluded regardless of g-i settings,
until now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
v2: include g-i-data class instead of depending on python3-dbusmock
unconditionally; that didn't actually work
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ae6fc519922..5a57549d855 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -28,7 +28,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages
+inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages gobject-introspection-data
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.39.2


