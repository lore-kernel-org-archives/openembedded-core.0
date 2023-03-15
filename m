Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60DAC7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.8771.1678888884312791289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Rvbz8427;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id c18so1535557ple.11
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ6LyQ7RcJXFKRzLuyRuko3G7jcp0lwKWdRwKcRGeTE=;
        b=Rvbz8427HEL3m1EglTH+oJvJIygUdT/OxcPNvAZr8mAfurpgzrZmZiakNSqMtagq45
         z3p8XjDt9E8GaZgPMPvoAvXbfcgLeYKeaxELPsOwampwIjCxsC2Cohc6NAZQHsa7Suhh
         SghQEe7Pbp6lA2ORLVkAUkcSd2jvT2MU76U40F4otBdcyvJO5ATxz5Hve+rMt5ANTzpw
         3WwpJnZb0ZGanqSvx4a2yGLwb32AlN2lpB56tpqXNf9+0Nabt4j8oubcX8u8VhSlSpm9
         lk/1H8so8zn7FpZXOgeQEpXV/wFRb2OnEG2jLMndtCZgFdacD0tpy9qn+1IgEfzyp/+y
         3grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQ6LyQ7RcJXFKRzLuyRuko3G7jcp0lwKWdRwKcRGeTE=;
        b=TnLQHAgJ/+M/h5Ckx6zzOnzGtxiwZG8ZfEoklPUaPhZmXJbrU4cHpvE+QdtWhFJGX3
         0fWw47Wx+P45eMl4ES8ValJOteUd9Lbct7t96kG1l4JEkBDvBJ4qFv1i5cJpONqrEZ/3
         n0+XSNi3aKXiNx943AnZ0rOxe5STW7bhnDmdrfHFQ6kaROIvbfRNzJ/fZQuNvEy5XUqR
         mNTpsPk1HiH1j2LRT9o238zZvc+/+/Lgxg7PPBoXCC4P85NAiEndeGmekJ4SAMs9v2km
         xRRxY7eQc2V0i/VyPjSaCEriYSaxapBJQZEAMMjCWoUr6L2eC2XsuGmJGg1k1gztFZng
         g48w==
X-Gm-Message-State: AO0yUKXaPf1YBrv+lnPUACXmtErNhIIQQ2xMv439K3Y2e/u4npHSMWPx
	He01urvJwEVTSp6fpAeb6e7vaYKFyZIicZT6fs8=
X-Google-Smtp-Source: AK7set/MgJU8vznwBsOUBi7G4ZdcvWMl7WV6yFptZ8Zm/deAdIyuCejuk1o3vsDv9VLVd3YoGwOqxQ==
X-Received: by 2002:a17:902:ea0f:b0:19e:f86c:255a with SMTP id s15-20020a170902ea0f00b0019ef86c255amr3048946plg.7.1678888883138;
        Wed, 15 Mar 2023 07:01:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/22] epiphany: Security fix for CVE-2023-26081
Date: Wed, 15 Mar 2023 04:00:52 -1000
Message-Id: <d5390008c3747073e4dfcc120b335d14dd0a08c9.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178552

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/epiphany/-/commit/53363c3c8178bf9193dad9fa3516f4e10cff0ffd]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/epiphany/epiphany_42.4.bb  |  1 +
 .../epiphany/files/CVE-2023-26081.patch       | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2023-26081.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.4.bb b/meta/recipes-gnome/epiphany/epiphany_42.4.bb
index 9efd2800da..98923a3bdc 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            file://migrator.patch \
            file://distributor.patch \
+           file://CVE-2023-26081.patch \
            "
 SRC_URI[archive.sha256sum] = "370938ad2920eeb28bc2435944776b7ba55a0e2ede65836f79818cfb7e8f0860"
 
diff --git a/meta/recipes-gnome/epiphany/files/CVE-2023-26081.patch b/meta/recipes-gnome/epiphany/files/CVE-2023-26081.patch
new file mode 100644
index 0000000000..af1e20bd8f
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/CVE-2023-26081.patch
@@ -0,0 +1,90 @@
+From 53363c3c8178bf9193dad9fa3516f4e10cff0ffd Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 3 Feb 2023 13:07:15 -0600
+Subject: [PATCH] Don't autofill passwords in sandboxed contexts
+
+If using the sandbox CSP or iframe tag, the web content is supposed to
+be not trusted by the main resource origin. Therefore, we'd better
+disable the password manager entirely so the untrusted web content
+cannot exfiltrate passwords.
+
+https://github.com/google/security-research/security/advisories/GHSA-mhhf-w9xw-pp9x
+
+Part-of: <https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1275>
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/epiphany/-/commit/53363c3c8178bf9193dad9fa3516f4e10cff0ffd]
+CVE: CVE-2023-26081
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ .../resources/js/ephy.js                      | 26 +++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/embed/web-process-extension/resources/js/ephy.js b/embed/web-process-extension/resources/js/ephy.js
+index 38b806f..44d1792 100644
+--- a/embed/web-process-extension/resources/js/ephy.js
++++ b/embed/web-process-extension/resources/js/ephy.js
+@@ -352,6 +352,12 @@ Ephy.hasModifiedForms = function()
+     }
+ };
+ 
++Ephy.isSandboxedWebContent = function()
++{
++    // https://github.com/google/security-research/security/advisories/GHSA-mhhf-w9xw-pp9x
++    return self.origin === null || self.origin === 'null';
++};
++
+ Ephy.PasswordManager = class PasswordManager
+ {
+     constructor(pageID, frameID)
+@@ -385,6 +391,11 @@ Ephy.PasswordManager = class PasswordManager
+ 
+     query(origin, targetOrigin, username, usernameField, passwordField)
+     {
++        if (Ephy.isSandboxedWebContent()) {
++            Ephy.log(`Not querying passwords for origin=${origin} because web content is sandboxed`);
++            return Promise.resolve(null);
++        }
++
+         Ephy.log(`Querying passwords for origin=${origin}, targetOrigin=${targetOrigin}, username=${username}, usernameField=${usernameField}, passwordField=${passwordField}`);
+ 
+         return new Promise((resolver, reject) => {
+@@ -396,6 +407,11 @@ Ephy.PasswordManager = class PasswordManager
+ 
+     save(origin, targetOrigin, username, password, usernameField, passwordField, isNew)
+     {
++        if (Ephy.isSandboxedWebContent()) {
++            Ephy.log(`Not saving password for origin=${origin} because web content is sandboxed`);
++            return;
++        }
++
+         Ephy.log(`Saving password for origin=${origin}, targetOrigin=${targetOrigin}, username=${username}, usernameField=${usernameField}, passwordField=${passwordField}, isNew=${isNew}`);
+ 
+         window.webkit.messageHandlers.passwordManagerSave.postMessage({
+@@ -407,6 +423,11 @@ Ephy.PasswordManager = class PasswordManager
+     // FIXME: Why is pageID a parameter here?
+     requestSave(origin, targetOrigin, username, password, usernameField, passwordField, isNew, pageID)
+     {
++        if (Ephy.isSandboxedWebContent()) {
++            Ephy.log(`Not requesting to save password for origin=${origin} because web content is sandboxed`);
++            return;
++        }
++
+         Ephy.log(`Requesting to save password for origin=${origin}, targetOrigin=${targetOrigin}, username=${username}, usernameField=${usernameField}, passwordField=${passwordField}, isNew=${isNew}`);
+ 
+         window.webkit.messageHandlers.passwordManagerRequestSave.postMessage({
+@@ -426,6 +447,11 @@ Ephy.PasswordManager = class PasswordManager
+ 
+     queryUsernames(origin)
+     {
++        if (Ephy.isSandboxedWebContent()) {
++            Ephy.log(`Not querying usernames for origin=${origin} because web content is sandboxed`);
++            return Promise.resolve(null);
++        }
++
+         Ephy.log(`Requesting usernames for origin=${origin}`);
+ 
+         return new Promise((resolver, reject) => {
+-- 
+2.35.5
+
-- 
2.34.1


