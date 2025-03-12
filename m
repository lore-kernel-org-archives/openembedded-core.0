Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14952C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.4668.1741809179198121555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qMt6ZUqe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224341bbc1dso5041735ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809178; x=1742413978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynKNZEyFM+L2OOrDuTYfEEXtZ7j442XcllDgRTu2jcA=;
        b=qMt6ZUqe9PGbBU3XZpR8vlaX0K408jBoWwb210Qz9Djydeu9yohDUjrw1H/OHLQqLx
         XCodAyAs5K0truH95lzrXmN7lItBE04ZQkfMiBGnnIbibDPBnqaiJArEI8ma3Z1jTqwz
         nmvaGvOopM/D4yRiwaiRGR0U9WDonDOtakWurpFIni6SuSAw8FsIdOt4TSW+C4DETKvt
         61T4BLMYP5c9uzXwRhw6a4nLBNQvTcYMA4Nr+3/W2WCiW0T5/Ut6kNocmZv184M36ziA
         8Y5wN5ZQnY/n2c7d1TDMkjtIKZPqJ03W/hPZPnzojxVHrK0p2UqSnMsV8eHzpZteV246
         FpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809178; x=1742413978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynKNZEyFM+L2OOrDuTYfEEXtZ7j442XcllDgRTu2jcA=;
        b=hafruVlt44YN7dK0vTPzceTTsUzrEbM0vSBxlzJpnUqhmeajU5XivOvc0vvywmBHIV
         32F4u5jKc+yH5ZpLQOmwuUuo6k5dRdLeEw5/tpg7NhTEaLS/GaWRFad67Tra7orBRFqr
         y20wSeUneopFE6jp6eoJFY+4UghOiXgUI7VRNX1SffBUbrtCbVx9UuezIQxiPScS2qNR
         PeDvVI6yZRogYj+tGw7enGH88VWRTBnKxYAPURV+yif5HRfPTvzafScrjZIM12NzkNbl
         C8WY/Ad9VUvgo1QxtXOvTOPn26CtQhZjaO4eStgJDM+ARO6+2N1RmIYnuiK/OCIshCfg
         idjw==
X-Gm-Message-State: AOJu0YxRymauwg4dB4elsok6s417j25mqCOI6XGmhn3qlqI0IlEgJwgB
	QI75SLygxrCezZKcyJNcZiu3ymNN7UzwoSPCMhlFyaDc7wk6C7rpjT5cOokRlf4hXH0pqPxZRZR
	h
X-Gm-Gg: ASbGncsVkAPstpG0cWykQzgWAj7N4tSDMydeH7g5mSn/DezJTxtZ3ON/mh49URmQo5I
	phmbsL7jFkBk+cXBoqspw0xNRvocqrEP19OIcQnNVM7koHoaOzTBbGzVdlRiwLmu3VFC79KJOuq
	B1qwqPQuHAqOQyPmyDfraZiw8IVcFePd+M3NhXg1+QhY1Xh91/rmjuh+NrowQYeB6/Bb4ZowVLc
	S/gqnvlJ2aw/tbc0jQEsycK2dRScwbH6iYhy62dva6OBiI3p30Wgldcss1hvEpMPPak6kWvIP1U
	Nf5Bt5F31skVqqaUVQ9fWJ+q1mETBbCboOPVU0sRsih0hQ==
X-Google-Smtp-Source: AGHT+IFKah4xrE16iWwvS1qeKmXmC17ukI9nUqWwr+UL+tqZUJqtGGmoedVor+3oSt/6S/oXtOGiMg==
X-Received: by 2002:a05:6a21:2d85:b0:1f5:80a3:afe8 with SMTP id adf61e73a8af0-1f58cbdd61dmr12211157637.39.1741809178353;
        Wed, 12 Mar 2025 12:52:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 12/25] grub: patch CVE-2025-0622
Date: Wed, 12 Mar 2025 12:52:20 -0700
Message-ID: <aeefadfda0e98d0b3369c4abc98485774e1fe562.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212679

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2025-0622-01.patch         | 35 ++++++++++++++++
 .../grub/files/CVE-2025-0622-02.patch         | 41 +++++++++++++++++++
 .../grub/files/CVE-2025-0622-03.patch         | 38 +++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  3 ++
 4 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
new file mode 100644
index 0000000000..09dbfce5f8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
@@ -0,0 +1,35 @@
+From 2123c5bca7e21fbeb0263df4597ddd7054700726 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 19:24:29 +0000
+Subject: [PATCH 1/3] commands/pgp: Unregister the "check_signatures" hooks on
+ module unload
+
+If the hooks are not removed they can be called after the module has
+been unloaded leading to an use-after-free.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2123c5bca7e21fbeb0263df4597ddd7054700726]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/pgp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/grub-core/commands/pgp.c b/grub-core/commands/pgp.c
+index c6766f044..5fadc33c4 100644
+--- a/grub-core/commands/pgp.c
++++ b/grub-core/commands/pgp.c
+@@ -1010,6 +1010,8 @@ GRUB_MOD_INIT(pgp)
+ 
+ GRUB_MOD_FINI(pgp)
+ {
++  grub_register_variable_hook ("check_signatures", NULL, NULL);
++  grub_env_unset ("check_signatures");
+   grub_verifier_unregister (&grub_pubkey_verifier);
+   grub_unregister_extcmd (cmd);
+   grub_unregister_extcmd (cmd_trust);
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
new file mode 100644
index 0000000000..be01da3355
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
@@ -0,0 +1,41 @@
+From 9c16197734ada8d0838407eebe081117799bfe67 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 23:46:55 +0000
+Subject: [PATCH 2/3] normal: Remove variables hooks on module unload
+
+The normal module does not entirely cleanup after itself in
+its GRUB_MOD_FINI() leaving a few variables hooks in place.
+It is not possible to unload normal module now but fix the
+issues for completeness.
+
+On the occasion replace 0s with NULLs for "pager" variable
+hooks unregister.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c16197734ada8d0838407eebe081117799bfe67]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/normal/main.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
+index 838f57fa5..04d058f55 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -582,7 +582,9 @@ GRUB_MOD_FINI(normal)
+   grub_xputs = grub_xputs_saved;
+ 
+   grub_set_history (0);
+-  grub_register_variable_hook ("pager", 0, 0);
++  grub_register_variable_hook ("pager", NULL, NULL);
++  grub_register_variable_hook ("color_normal", NULL, NULL);
++  grub_register_variable_hook ("color_highlight", NULL, NULL);
+   grub_fs_autoload_hook = 0;
+   grub_unregister_command (cmd_clear);
+ }
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
new file mode 100644
index 0000000000..79078a4350
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
@@ -0,0 +1,38 @@
+From 7580addfc8c94cedb0cdfd7a1fd65b539215e637 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 23:52:06 +0000
+Subject: [PATCH 3/3] gettext: Remove variables hooks on module unload
+
+The gettext module does not entirely cleanup after itself in
+its GRUB_MOD_FINI() leaving a few variables hooks in place.
+It is not possible to unload gettext module because normal
+module depends on it. Though fix the issues for completeness.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7580addfc8c94cedb0cdfd7a1fd65b539215e637]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/gettext/gettext.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 7a1c14e4f..e4f4f8ee6 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -535,6 +535,10 @@ GRUB_MOD_INIT (gettext)
+ 
+ GRUB_MOD_FINI (gettext)
+ {
++  grub_register_variable_hook ("locale_dir", NULL, NULL);
++  grub_register_variable_hook ("secondary_locale_dir", NULL, NULL);
++  grub_register_variable_hook ("lang", NULL, NULL);
++
+   grub_gettext_delete_list (&main_context);
+   grub_gettext_delete_list (&secondary_context);
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b9b9d37637..7d463f8aeb 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -26,6 +26,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0624.patch \
            file://CVE-2024-45774.patch \
            file://CVE-2024-45775.patch \
+           file://CVE-2025-0622-01.patch \
+           file://CVE-2025-0622-02.patch \
+           file://CVE-2025-0622-03.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


