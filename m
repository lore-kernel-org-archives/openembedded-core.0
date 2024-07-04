Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5326FC3DA41
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.8994.1720096065617027028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pImTwRPx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fb3cf78ff3so2383785ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096065; x=1720700865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qh77zKlPs7QNrgkFjvxPkFNe3Zv1DLNyCfsGXxmHYmk=;
        b=pImTwRPxniNkVBN6eIChzZ+/YHG4bSxvKwM5E3zghq2eHU5CJHWj3rOvqkTo/b0vcx
         rZaq4Or673PFfbpC2trgd/nhMRxyoxoWUpovy1ArnkJM4q9u27yqUthsZOwXnsC55Sie
         wtCImLKuIJDp0OdPVuiHc/A6pF33upx/FWW9fxs9VAcGijT0AcQOVW1lbIFGIbqovv++
         PQyegbL+IEeUyBFdA7yOQNlClc/ZbBKWnxMj3Uxjbcn6vWOkAbvSSTfsJ6YppLuMH23M
         W1L50v0wVSIhqYZRTtlj/Cu9DhTvpgBX7T+xbffdRHIu3mEfFy6MGVBAHKqI0F4mumLT
         zPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096065; x=1720700865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qh77zKlPs7QNrgkFjvxPkFNe3Zv1DLNyCfsGXxmHYmk=;
        b=keTq5eJUUZi/Xbcz8prjOakFryLA0OWCKLtstTKjWB171gDmkwBC1+h/Lt1aafZET4
         jRFbQY/szXGrpABk7TbkulDb82m+ZqZQH7PYcHh/AafsRTm998pVCQBvTk1D2j97lc3h
         hMpf+bpnJNR2wedihI/un/E3ol7tJ/7GsoWHozGexm8iRSrOLdbgQlM39Ba/aykZvVoQ
         6k/9XY1qdPhnejVbwEMWB/WhZPPKXBLdYA4jw4ux/wEO+ltxI8EUo7JQcFBJXsznFK5J
         ++zArQIwGVO4WOvR5Fnp9shczohrLOm8kxiv/Zwu6RVxk09kBaenVhVSFkoSmNueAeeR
         5oqA==
X-Gm-Message-State: AOJu0YxGhnSz1ewwDTEK0/BS6FgGPld+rfv5iHJ9gc+8/PZr52E4LGiR
	GkENeNohaRvNYKh8e2KiZhNSzZ4DCYJuQdckMrOI1Z56tnsstxmx/g4WHndCyMCRqodKaFVb0qk
	K
X-Google-Smtp-Source: AGHT+IFQ9Tj/pYEjTbhTSKB2rgPYWDZM/R40Fc9PtnELpUidjYT++PR4eBE+KCDg5XUXPl3aUTRV2g==
X-Received: by 2002:a17:902:6508:b0:1fb:3b61:45a4 with SMTP id d9443c01a7336-1fb3b614b34mr5152115ad.62.1720096064854;
        Thu, 04 Jul 2024 05:27:44 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/21] libpam: fix runtime error in pam_pwhistory moudle
Date: Thu,  4 Jul 2024 05:27:05 -0700
Message-Id: <a985fb71e30d958dcacdcc75f5bbdd0e49f7478a.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201555

From: Yi Zhao <yi.zhao@windriver.com>

Backport a patch to fix runtime error in pam_pwhistory module when
selinux is enabled:

root@qemux86-64:~# passwd
passwd: System error
passwd: password unchanged

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...x-passing-NULL-filename-argument-to-.patch | 69 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch b/meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch
new file mode 100644
index 0000000000..23d5646235
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch
@@ -0,0 +1,69 @@
+From 80dc2d410595b5193d32f965185710df27f3984e Mon Sep 17 00:00:00 2001
+From: Md Zain Hasib <hasibm@vmware.com>
+Date: Sat, 29 Jul 2023 11:01:35 +0530
+Subject: [PATCH] pam_pwhistory: fix passing NULL filename argument to
+ pwhistory helper
+
+This change fixes a bug when pwhistory_helper is invoked from
+pam_pwhistory with an NULL filename, pwhistory_helper receives a short
+circuited argc count of 3, ignoring the rest of the arguments passed
+due to filename being NULL. To resolve the issue, an empty string is
+passed in case the filename is empty, which is later changed back to
+NULL in pwhistory_helper so that it can be passed to opasswd to read
+the default opasswd file.
+
+* modules/pam_pwhistory/pam_pwhistory.c (run_save_helper,
+run_check_helper): Replace NULL filename argument with an empty string.
+* modules/pam_pwhistory/pwhistory_helper.c (main): Replace empty string
+filename argument with NULL.
+
+Fixes: 11c35109a67f ("pam_pwhistory: Enable alternate location for password history file (#396)")
+Signed-off-by: Dmitry V. Levin <ldv@strace.io>
+
+Upstream-Status: Backport
+[https://github.com/linux-pam/linux-pam/commit/80dc2d410595b5193d32f965185710df27f3984e]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ modules/pam_pwhistory/pam_pwhistory.c    | 4 ++--
+ modules/pam_pwhistory/pwhistory_helper.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/modules/pam_pwhistory/pam_pwhistory.c b/modules/pam_pwhistory/pam_pwhistory.c
+index 5a7fb811..98ddffce 100644
+--- a/modules/pam_pwhistory/pam_pwhistory.c
++++ b/modules/pam_pwhistory/pam_pwhistory.c
+@@ -141,7 +141,7 @@ run_save_helper(pam_handle_t *pamh, const char *user,
+       args[0] = (char *)PWHISTORY_HELPER;
+       args[1] = (char *)"save";
+       args[2] = (char *)user;
+-      args[3] = (char *)filename;
++      args[3] = (char *)((filename != NULL) ? filename : "");
+       DIAG_POP_IGNORE_CAST_QUAL;
+       if (asprintf(&args[4], "%d", howmany) < 0 ||
+           asprintf(&args[5], "%d", debug) < 0)
+@@ -228,7 +228,7 @@ run_check_helper(pam_handle_t *pamh, const char *user,
+       args[0] = (char *)PWHISTORY_HELPER;
+       args[1] = (char *)"check";
+       args[2] = (char *)user;
+-      args[3] = (char *)filename;
++      args[3] = (char *)((filename != NULL) ? filename : "");
+       DIAG_POP_IGNORE_CAST_QUAL;
+       if (asprintf(&args[4], "%d", debug) < 0)
+         {
+diff --git a/modules/pam_pwhistory/pwhistory_helper.c b/modules/pam_pwhistory/pwhistory_helper.c
+index 469d95fa..fb9a1e31 100644
+--- a/modules/pam_pwhistory/pwhistory_helper.c
++++ b/modules/pam_pwhistory/pwhistory_helper.c
+@@ -108,7 +108,7 @@ main(int argc, char *argv[])
+ 
+   option = argv[1];
+   user = argv[2];
+-  filename = argv[3];
++  filename = (argv[3][0] != '\0') ? argv[3] : NULL;
+ 
+   if (strcmp(option, "check") == 0 && argc == 5)
+     return check_history(user, filename, argv[4]);
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index 2a53bb4cc5..ef32d19f3d 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://run-ptest \
            file://pam-volatiles.conf \
            file://0001-pam_namespace-include-stdint-h.patch \
+           file://0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch \
            "
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
-- 
2.34.1


