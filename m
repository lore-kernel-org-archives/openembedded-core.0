Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363F7CD8CBE
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 18:12:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.587.1763057527232511278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ysyDInKL;
 spf=pass (domain: smile.fr, ip: 209.85.167.50, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957c929a5eso1373945e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763057525; x=1763662325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXbamOx+zTfajNqRaHi7IoC7ncIXwcR80NhY3MmBxbk=;
        b=ysyDInKL8PdP2U4EKjSUR1HBMOxqSjs/qP9Rd4NFd8lS7XDW4KDISax3vBRqk7mgzR
         VmvnC9o/jMleP6Oj7H1u1WKUaMXCL3oVvPBurlwUZcuIwsAatBp7HqDHMwdMFtB7TVhv
         ZgFH1eeHrp9J2EEL4jcRhgt8wuK/qrIRNqLUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763057525; x=1763662325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXbamOx+zTfajNqRaHi7IoC7ncIXwcR80NhY3MmBxbk=;
        b=dK3J+7/loERbkUlf1t+HRdSmzyhDiO8+wPD0EM971UyvBH7QUkwYskdFbyG+IPRfJ2
         CJFMyApk4yAq/IWcj2WJYWGyDTEjXE+vqASBf+HmxGS++mbKLySVAIhFJ2J5nt4D5PgP
         tDmzX13YZQqVK9El/iERMIzG1986quReKVsNINDv+sEyeKH6CkfhUJYckKEvkxcbFZIe
         MYxDidmU9B4BeTQ/nkDQZTtNohgjCyzRpEoh5in7iZUdsFSng05brI6th+q59KVhDKhw
         FwaZGxoPHCFHIVQpLXyKe7P9sARoxazQWbz3ya2SNQldzD9sumLVkTQs0T1NkpcvabZX
         qbnw==
X-Gm-Message-State: AOJu0YxA6kFKNQza5srfPwx18/4slPuxjgdzqa7S1v63W/9RFBdR1chh
	puJq1WoS4RoCTkKjMC9ZlqIigerHtmG3a7Z3oIWQghGk45XpRCB0I0K1kUgIVQDO4LfmnbXwl9X
	nc/j1GFSrqg==
X-Gm-Gg: ASbGnctC012/bKSgeAvYB8kD750CKUrQqkKXjF0FIHmTESQc8N4tQIzaSTGTBckaSg/
	QxffPS2HZCIyPLK6hB5YzKU9wu6nc2FVexXAuqhZzci2jK3qWXq+VZ1zwMHDZ+WY4RIIotnB6Bg
	qvoaK/U2v+RO7BeP8jUASe91jtPHRwn6v+tmdQq1XRmj6SzpRHb9bVfHbtj61PvGGTB3YgEgyDB
	zt8vrK7rE9HMgVfGLE1REk+kc/TpYaFUjwk957Sy2AfTtA8cHUyvDjVDql+M9H9sDREar2ah5wI
	sca1saxzkrG6olagLGk3k8tDhnHC8Z5iF/NDRadw4KeD4I4aSl35ZJnmUfWkuELPxQSaLyKIE0x
	wzH2sBROJBV5L6P4WAryBATlAjCFgL1to7FyKEMbIrgsDYALFI4ASwqVyfQ6RO1wSgjuTmhUiB4
	9wPacRtVLvBg==
X-Google-Smtp-Source: AGHT+IFEEVOHYt/wRWiWEzKaeN/8PUKNTmbcoEggYcAgxRrh+JZAkY1XvK9Q/dgKRAhAcd/ftrorYA==
X-Received: by 2002:a05:6512:ad3:b0:594:2a0f:916f with SMTP id 2adb3069b0e04-5958426a4a6mr117125e87.43.1763057525202;
        Thu, 13 Nov 2025 10:12:05 -0800 (PST)
Received: from heaven.lan ([2001:861:3080:b0f0:8ab:bf5a:da73:c932])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803acc1asm543232e87.13.2025.11.13.10.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:12:04 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH 1/2] insane.bbclass: check revision for every git URI
Date: Thu, 13 Nov 2025 19:11:56 +0100
Message-ID: <20251113181157.410053-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 18:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226255

Every git URI into SRC_URI variable should have a revision. However, if
the revision is missing (SRCREV), BitBake will perform a query on the
remote repository every time it parses a recipe.

This check will raise an error if a git URI is not provided alongside a revision.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/classes-global/insane.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index fed8163c3e..f6e9ed6347 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1495,7 +1495,26 @@ python do_recipe_qa() {
                 error_msg = "%s: invalid PACKAGECONFIG(s): %s" % (pn, " ".join(sorted(invalid_pkgconfigs)))
                 oe.qa.handle_error("invalid-packageconfig", error_msg, d)
 
+    def test_git_missing_srcrev(pn, d):
+        for uri in d.getVar('SRC_URI').split():
+            if not uri.startswith('git://'):
+                continue
+
+            # Get parameters for the current URI
+            params = bb.fetch2.decodeurl(uri)[5]
+            name = params.get('name', '')
+
+            # git URI has a "name" parameter
+            if name:
+                rev = d.getVar('SRCREV_' + name)
+                if not rev:
+                    oe.qa.handle_error("missing-srcrev", "%s: no revision (%s) defined for URI %s" % (pn, 'SRCREV_' + name, uri), d)
+            else:
+                if d.getVar('SRCREV') == "INVALID":
+                    oe.qa.handle_error("missing-srcrev", "%s: no revision (SRCREV) defined for URI %s" % (pn, uri), d)
+
     pn = d.getVar('PN')
+    test_git_missing_srcrev(pn, d)
     test_naming(pn, d)
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
-- 
2.49.0


