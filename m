Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D25C74A5B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:25 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.5719.1678402699543199324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WdGb9Mf1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so3406566pja.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ6LyQ7RcJXFKRzLuyRuko3G7jcp0lwKWdRwKcRGeTE=;
        b=WdGb9Mf17Tai5+NzTkJCOxKhye5FJYV9BKEE9qLHR20FA8IRJNtYWEC3mrD/3E/sJp
         tKHPpgEe/GFD/Rj/FoDyF1Gb1Q84twca0grfdFs3ockalgUHG1fmc/7LMFJ5r/jtiVQL
         MLZZhT/6fcfNatMRLr/QtEdS8gWGK/hRmNW87IVZbvftp8+ZV13ftON3D9U5l8FEgl1X
         /mhIh0DzNm4QAuYqoyfqnng1+qfp/NEFLA7pMvvloMDTX4EJgS+e+ybjG6vuIO0sATuo
         2fTeOFBG9mGYNn/YQFnU65LN6IhdfjLbRlkLdWQ4IQyLoXM238kbDOMBKmXbAAIUOgbX
         1y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQ6LyQ7RcJXFKRzLuyRuko3G7jcp0lwKWdRwKcRGeTE=;
        b=efa4Au8kb67tY5h7uZZQK8h0EpDcLCw5sdvMyE57YWsOUMCmk4D9FAa7RDNhlBJWS2
         j0KuG2A9kLejXo7uAqaDiIbiipAQuWC9GJazVD478TERNYFQMz+rxC8Os7Ck2u+UDfve
         ypBsMw+Bwgij5TmvG9JjWkNLGTc4jA/59+N4Dwde+NLTCKY4O6XE8qQF3MXtEuWNzEyM
         PH7DR2NUxExM8q2IHiWM+WBercZDxXGBRMOPRsFyHo3ykaXO+do+lMmmsvyg1ZEf7ddL
         0KufyOWE5Tw1PgWmFNgCfV8xr2JqqWn9ds40Q2F+t4S9xVx9S3mHOP6gFkD8oFWb0UPg
         qj+Q==
X-Gm-Message-State: AO0yUKWi/2lrpKvdZtKbk1ZF3oPbNo+zrIDkXPjApgT9x4+pfoDLiuWn
	60xkt1y5s8uazeBI0vxBRTA8phy3mkHrnYvUEd0=
X-Google-Smtp-Source: AK7set96ZuPmeZBvgaZ0yBu/RA9sCetqgMG2Fl0H1+PEbSf6LjZmCD7eBis86LPMEiQeZWFZ1IsIkg==
X-Received: by 2002:a05:6a20:734f:b0:cd:26b2:ee17 with SMTP id v15-20020a056a20734f00b000cd26b2ee17mr26872469pzc.36.1678402698562;
        Thu, 09 Mar 2023 14:58:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/27] epiphany: Security fix for CVE-2023-26081
Date: Thu,  9 Mar 2023 12:57:39 -1000
Message-Id: <412f9b5732f0ff659fc7ed81fe936755fa9d2773.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178277

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


