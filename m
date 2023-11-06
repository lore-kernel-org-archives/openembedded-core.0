Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6233C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 16:43:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.59036.1699289024391528865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 08:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IW5+UI5V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.176, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so62518791fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699289022; x=1699893822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTXpOLhFXoHXSH7iP+kc5OQjeF6U6M+NxEV2vdT615g=;
        b=IW5+UI5Vsn8M0313mPpb6T5PT2VxlhBti4U+usIqOGGbH5RYxGioAk96lSrV0nxFr9
         HTdGUev8/T1eV4xyiQ/gS1z75R5vv36KEgx+d54a4gEuXxOf6nomB5K3HwRF55ytEAaG
         Lu06Hcz/ahkNm3xk4VZ3XCo/PyWLt0oeh/jcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699289022; x=1699893822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTXpOLhFXoHXSH7iP+kc5OQjeF6U6M+NxEV2vdT615g=;
        b=rXXIYUsVVmXJFGzr5QuzxL/sjVxjxnRi41luSWSuj1Rxcaa1YF5nPmR+mqKkJeKW21
         pnW0IK8IaUFovlbe1ikFReLjGEDdYrxYrJT+9ZOubCexP2oTXbVTzKYhVW33Djg68ZEh
         wlJ+mR/EddjuxG0+83JlQkd48tsuwixZdfYS0V/I4z+VsvyFlJ6C/D0Dvdb6YJ2oxskb
         jUnmxlTnTCTR1TDQzSBIbPqr5vV8SlnGQyhx+qDOO3UihtuK5Fxni10Ebm0a3QeweJbp
         spnh4YxO5iNLL1XjGkJIuiaO3hX7K1YFCiVSj5SGfEAoeNSMLi9v9DWzQQ4mUwAi2csz
         /rlA==
X-Gm-Message-State: AOJu0Yxjvz0adUDzfe2oFJgmsA3Iks/yFXLAW1eBszkvyHWZdJPMI4IF
	pCP7KAIUKM6x1uyzZSW345lSArC5DgKlZtlLTmI=
X-Google-Smtp-Source: AGHT+IHD5jz0hS7UrHANsZmhy+EhZDDzT783TLFA5hIpjaiuwH5GhBP13oUvT+DuEakDTplCb1VA7Q==
X-Received: by 2002:a2e:3307:0:b0:2c6:ef64:3164 with SMTP id d7-20020a2e3307000000b002c6ef643164mr10264019ljc.17.1699289022255;
        Mon, 06 Nov 2023 08:43:42 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b003fefb94ccc9sm13131383wmq.11.2023.11.06.08.43.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:43:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] insane: Move unpack tests to do_recipe_qa
Date: Mon,  6 Nov 2023 16:43:39 +0000
Message-Id: <20231106164340.1213043-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106164340.1213043-1-richard.purdie@linuxfoundation.org>
References: <20231106164340.1213043-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 16:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190236

The SRC_URI tests are a better fit for the new do_recipe_qa task, move them
there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 46 ++++++++++++++----------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 307a09d115e..020865138f5 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1513,35 +1513,18 @@ Rerun configure task after fixing this."""
     oe.qa.exit_if_errors(d)
 }
 
-def unpack_check_src_uri(pn, d):
-    import re
-
-    skip = (d.getVar('INSANE_SKIP') or "").split()
-    if 'src-uri-bad' in skip:
-        bb.note("Recipe %s skipping qa checking: src-uri-bad" % d.getVar('PN'))
-        return
-
-    if "${PN}" in d.getVar("SRC_URI", False):
-        oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
-
-    for url in d.getVar("SRC_URI").split():
-        # Search for github and gitlab URLs that pull unstable archives (comment for future greppers)
-        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//codeload.github.com/" in url:
-            oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
-
 python do_qa_unpack() {
     src_uri = d.getVar('SRC_URI')
     s_dir = d.getVar('S')
     if src_uri and not os.path.exists(s_dir):
         bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
-
-    unpack_check_src_uri(d.getVar('PN'), d)
 }
 
 python do_recipe_qa() {
-    def test_missing_metadata(d):
+    import re
+
+    def test_missing_metadata(pn, d):
         fn = d.getVar("FILE")
-        pn = d.getVar('BPN')
         srcfile = d.getVar('SRC_URI').split()
         # Check that SUMMARY is not the same as the default from bitbake.conf
         if d.getVar('SUMMARY') == d.expand("${PN} version ${PV}-${PR}"):
@@ -1553,16 +1536,31 @@ python do_recipe_qa() {
             else:
                 oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not contain a HOMEPAGE. Please add an entry.".format(pn, fn), d)
 
-    def test_missing_maintainer(d):
+    def test_missing_maintainer(pn, d):
         fn = d.getVar("FILE")
-        pn = d.getVar("PN")
         if pn.endswith("-native") or pn.startswith("nativesdk-") or "packagegroup-" in pn or "core-image-ptest-" in pn:
             return
         if not d.getVar('RECIPE_MAINTAINER'):
             oe.qa.handle_error("missing-maintainer", "Recipe {} in {} does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc.".format(pn, fn), d)
 
-    test_missing_metadata(d)
-    test_missing_maintainer(d)
+    def test_srcuri(pn, d):
+        skip = (d.getVar('INSANE_SKIP') or "").split()
+        if 'src-uri-bad' in skip:
+            bb.note("Recipe %s skipping qa checking: src-uri-bad" % pn)
+            return
+
+        if "${PN}" in d.getVar("SRC_URI", False):
+            oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
+
+        for url in d.getVar("SRC_URI").split():
+            # Search for github and gitlab URLs that pull unstable archives (comment for future greppers)
+            if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//codeload.github.com/" in url:
+                oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
+
+    pn = d.getVar('PN')
+    test_missing_metadata(pn, d)
+    test_missing_maintainer(pn, d)
+    test_srcuri(pn, d)
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.39.2


