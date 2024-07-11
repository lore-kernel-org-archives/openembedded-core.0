Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48426C3DA47
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 09:44:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.8035.1720691067590409444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 02:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ph00gZcz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42565670e20so10516135e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 02:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720691066; x=1721295866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+8qxKQM4K9K66uN8FecL65AQ0DMCRyWmzpweyAjjjQ=;
        b=Ph00gZcz/uVhE3ZYEXmDC/FskHVHcbmhd2hUx2cK35U4w/MFcrLNUizocgs69oV5ID
         ZpkuQpsDN/JFGKczO03VaxPzKx49QxIIxuqvrY+fQoEMGc4HY/x1OdXXmXnqrsZiobHd
         bukNPWDuQCeyUJ+VKQiTYawTfBvYQEHa2yzng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720691066; x=1721295866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+8qxKQM4K9K66uN8FecL65AQ0DMCRyWmzpweyAjjjQ=;
        b=iWcmiY7+WiaO34VTqZrXvbviJuoWU/O/ju5JSVI+a/xA18HvM1YNeMFPWnBElFXZmZ
         ze4xCOTPuldOcu3oUnRpUD8GJWc+EpgtpQRyK2QIzOoIVPL3vmcW8hYft9BWuE+w6KH9
         mcsyvcRveLIaghCOf7sN/FvCaoxnkN20aqleBOi6hTc402tcT8lp1hxwEOrfcrrAbLlW
         MDAY4eNTTqiThQTrE2LnC5gW8w9nXwSj0gHiJbBHpjUid93gjcRte4OC09emofnZq47l
         ByIbJWV+OaYBZbsDN0X+isjcXD6hj2R2mm1cfqh/dfn3UgygzHYJU3BpPIBkrRMl0tCk
         Adlg==
X-Gm-Message-State: AOJu0YyW4DD4xEwhudNdkwUNlaJorGoJWjI8WDtF6yxOIqcLbrGxFoWA
	cHZj3vEsvaxdku5J587jVzkpeJL8Foz61tdB2LWBwLc+EQNPVWCxo4BTTON5wNzUvys6cVnjEK6
	k
X-Google-Smtp-Source: AGHT+IHyGiq6/ymBt34hM7c1SQr2Cq/qXOhrCxMKg/mNNQve8KDSUPomvEo5CrqLCxVHFyQAxHMKig==
X-Received: by 2002:a05:600c:21d9:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-427981d2c99mr17507035e9.17.1720691065393;
        Thu, 11 Jul 2024 02:44:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426e7638d1dsm92040245e9.25.2024.07.11.02.44.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:44:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Promote long standing warnings to errors
Date: Thu, 11 Jul 2024 10:44:23 +0100
Message-ID: <20240711094423.1167286-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 09:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201772

Most of these warnings have been around and enabled for a long time. In particular,
buildpaths has been like this for two years. I'm aware some layers still have not
been able to resolve all the warnings but I believe that regardless, it is still
time to raise the bar. If the warnings don't get fixed, it is probably a sign
that nobody cares about the recipe and it should be dropped.

For anyone coming here to find out what changed and how to disable it, if
you are going to remove from ERROR_QA and add back to WARN_QA (or just ignore
the warnings), please do it with a layer specific override rather than making
it global. We have fixed these issues in core and intend to keep them all fixed.
If you globally disable the errors, it just means we get patches which end up
regressing things.

You can do things like:

ERROR_QA:remove:layer-mylayername = "buildpaths"

not that I'd recommend it.

Also note that the next version of Yocto Project Compatible will only be
available to layers which are not disabling some set of these errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 6888fa06f00..027d17e8684 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -26,7 +26,8 @@
 
 # Elect whether a given type of error is a warning or error, they may
 # have been set by other files.
-WARN_QA ?= " libdir xorg-driver-abi buildpaths \
+WARN_QA ?= "32bit-time"
+ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             textrel incompatible-license files-invalid \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn \
@@ -34,9 +35,7 @@ WARN_QA ?= " libdir xorg-driver-abi buildpaths \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-format \
             license-incompatible license-file-missing obsolete-license \
-            32bit-time virtual-slash \
-            "
-ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
+            libdir xorg-driver-abi buildpaths \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
@@ -45,7 +44,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz patch-status \
+            patch-fuzz patch-status virtual-slash \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"

