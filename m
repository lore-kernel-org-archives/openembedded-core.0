Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D39AC6FD19
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 17:36:38 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1172.1678124193205527151
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 09:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VEbogi7X;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id u5so11240596plq.7
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 09:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678124192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UjBzpOYNIPUzOByZP28FUaE3ziCsLt9/T74dC02Eo4=;
        b=VEbogi7XF5fRt/wHV75VnK0gskSQ0dXzeBde9vRrymSJbiNYlOakVZl+zhEg+9gNca
         26FQPvBzY+SDqGQyH6lcUYltX7pd9SRf/4pkZsE9knWPhbCNDJWrw/l6vHg9JzDVcPgz
         ATCkaRYVgI0iHwRwq7vBDxPTlpUcPHSnBilNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678124192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UjBzpOYNIPUzOByZP28FUaE3ziCsLt9/T74dC02Eo4=;
        b=24rWZDSUZAiudAgODSuWIUkrLQj9GvV8CL8rYDP7pmdQbj9QmOyMwRy7baS6CALz4d
         TqhbA+ApOW8MmXa8pZR0VnJdy4xu/mSZ5MnOGTpqdrqbZ63H36FksjBWlvNs4ySUfKX/
         Fa2SYDSdbIvs5VXQFmrMvPn36lsBsznORKrZ6TJ5BrKGJlvoBUUmQIwL7Hzgv577bmgG
         XU9V3IgFhq1vo/GPYC4F7AcGmUGbqSeuVhRnvp9p9z9jNCKzuWlSmgwIE6QC78AL63O4
         y6mW9zfyrnJc4cvB/30oyRkLDbCBf+0tlKx62XOa4fz3RZ12Atgc+DvDpdoHCXz7qV+Q
         Fslw==
X-Gm-Message-State: AO0yUKU4Yl+zApr9+ZC8w/cvfct26S2xeYSlIe5NCjMLtnSeu0SVu20+
	BNuRqHHUHqIg02sjcaLZQWpRmei9IqZoXiWVCHM=
X-Google-Smtp-Source: AK7set9Q2xN2H4gYzVC5UJAycdZuPeXW8RJXR50xjIFBNDKl4Or12a/3847q+WP++H2nnHy4zLKijg==
X-Received: by 2002:a17:902:e84f:b0:19a:839f:435 with SMTP id t15-20020a170902e84f00b0019a839f0435mr16187363plg.3.1678124192020;
        Mon, 06 Mar 2023 09:36:32 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:2d0b:3dae:40dd:a6e:aed1:22e8])
        by smtp.gmail.com with ESMTPSA id z15-20020a170902d54f00b0019a928a8982sm6985907plf.118.2023.03.06.09.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 09:36:31 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] epiphany: Security fix for CVE-2023-26081
Date: Mon,  6 Mar 2023 23:06:01 +0530
Message-Id: <20230306173601.8793-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 17:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178080

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.gnome.org/GNOME/epiphany/-/commit/53363c3c8178bf9193dad9fa3516f4e10cff0ffd]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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
2.25.1


