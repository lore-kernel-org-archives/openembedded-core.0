Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC285CD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:33:09 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18089.1779186782894776095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j2V3w2vm;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: saisneha196@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c802803ac17so1439993a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779186782; x=1779791582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk18DnqfANnp1sG6QBK0fH+0qsxWBi+ihm7/DXN204Q=;
        b=j2V3w2vmAEexBXxgcRIzAl0a68eqvSGsqPJfDxRNFOPgx3gfubPR8s9SsP18kCdVHn
         mH0TuJNRpXwJMXhOZEWGvf4k96lkyvMRrAyVQOlgpa5LfiNGQbKJflVW/pNrE3fo9fBQ
         p70fs8E8cwlpBskfUKAL1gfW0vpyUoIZx2Zf2EsZpS6EEgQ7q+K1oKavd4vOi9nfSRly
         CYSpZ/P/UZSt621+pbqXe0kvm2nwVHnVZjxDW0owNSe9UWuRv5VHz4AiG2QEJkXAZoUJ
         WAJdoW3th+VEEw/3sn6jL+GrfRJUc7zCZBvygKrYJ5pAZnsGOFw8s/coFmF5TjDPNy7W
         9S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186782; x=1779791582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk18DnqfANnp1sG6QBK0fH+0qsxWBi+ihm7/DXN204Q=;
        b=om6lSMEjDIdprE1VFHZdlm8pp1/1IF2wfw6zFFCUFJDKtNbdR7W58qVckbBxFzsvvw
         DsPWzW8tFGjEb2fNAhNH2BPyike/Tfm3Pj1Hp11l3EO6pvyouo1lgELvNNnS5jdYrkaa
         pzUKse/0kowUwxlzcBNXgW56JjOXYDalrfjmI3Ns8gVExEmOscOQJp4G6UFr+1aGCdvU
         iYSm/XSLwOpMnBjeU7k7s+c6Ne9V9VUgG6Gp3JU93cv303wxJPPwiZfcWW5pouVcMPMA
         NPCT8eUYkPdHVnKCWr+UHjbbgc6uoYiYhPm+YlE6gCJJB1EcomFCgY1bkMmB3k0XtaSb
         NBQQ==
X-Gm-Message-State: AOJu0YzBA4nCIDhSYjbS58AroAfTBEehuoARyCe/UFy635aOfE4LWESy
	wMDCLE+cIngZA49SF8jy31qTEtNLgFgJvMZ1TnYlsKoSiwD9peXUAxIPYsXkrQ==
X-Gm-Gg: Acq92OFLUt7ZNuAIf4uu12gCVfq2roOrKDWY6ezdfga0RTld0RQPfDkJ84oGE0UnaUg
	GOCYaW7Z1mUkNu7kEtoPFxjL35soGBWdFMMsF5BNacwrrsGGxnTDNYKtAOLRKTEmHG+Q+BAFMwD
	JabNHn9pZ4tK2wUi+98phfU9+ayXjseuabahj6luZgQ64iwcG7D7qO/B1x+ivrf69hMacnlCWNq
	v+nE4SvWFSPrR0DiAJ36mCWGCEk7G9U0VKAt2+5t1HbWrBrRKcVUlxAon76+xCLmpl9x8qKHpXm
	kfSl95iFeZ1jqBo8l1EcZPFs1UA10ocSDTQyxzhY+Ploh0Y4MljhqmFZ1HOg9ia7YfZclekM0Xf
	EIT4XJhYtXPU12z2/VQZEIYT3peYSWow0gc3jUk7LDG+Pl4OHnFKGUeXWs6Z4cwGlu1QyZ3TGnZ
	iiONMkw+AuPJGkHBQUfJrkCt41wQKFWG7gS1/mMA2wuoV90C/AKHMmzlGt
X-Received: by 2002:a05:6a21:6d94:b0:3a2:dafd:3c02 with SMTP id adf61e73a8af0-3b22ea861a4mr21543990637.19.1779186781959;
        Tue, 19 May 2026 03:33:01 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb06268asm15383709a12.1.2026.05.19.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:33:01 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v3 2/3] insane.bbclass: add missing-srcrev QA check for SCM URIs
Date: Tue, 19 May 2026 16:02:48 +0530
Message-Id: <20260519103249.236132-3-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519103249.236132-1-saisneha196@gmail.com>
References: <20260519103249.236132-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237308

Add a proper QA check test_missing_srcrev() in do_recipe_qa that
fires at build time via oe.qa.handle_error(), complementing the
parse-time check in base.bbclass.

The check uses unexpanded getVar() calls (False flag) to safely
inspect SRCREV without triggering AUTOREV expansion, and mirrors
BitBake's full SRCREV resolution fallback chain.

Severity is controlled per layer:
- WARN_QA:append = " missing-srcrev" for all layers (warning by default)
- ERROR_QA:append:layer-core = " missing-srcrev" for oe-core (strict)

This follows the same pattern as missing-metadata and missing-maintainer
which are warnings globally but errors for oe-core.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
Reported-by: Yoann Congal <yoann.congal@smile.fr>
AI-Generated: Developed with assistance from Anthropic Claude
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---
 meta/classes-global/insane.bbclass | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 04700be71c..296cfba0fe 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -49,6 +49,9 @@ ERROR_QA ?= "\
 ERROR_QA:append = " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge', d)}"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
+WARN_QA:append = " missing-srcrev"
+ERROR_QA:append:layer-core = " missing-srcrev"
+
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
 enabled tests are listed here, the do_package_qa task will run under fakeroot."
@@ -1455,6 +1458,34 @@ python do_qa_unpack() {
 python do_recipe_qa() {
     import re
 
+    def test_missing_srcrev(pn, d):
+        import bb.fetch2
+        src_uri = (d.getVar('SRC_URI', False) or '').split()
+        for uri in src_uri:
+            try:
+                (scheme, _, _, _, _, params) = bb.fetch2.decodeurl(uri)
+            except Exception:
+                continue
+            if scheme not in ('git', 'gitsm', 'hg', 'svn'):
+                continue
+            if params.get('rev', ''):
+                continue
+            name = params.get('name', '') or 'default'
+            candidates = [
+                'SRCREV_%s:pn-%s' % (name, pn),
+                'SRCREV_%s' % name,
+                'SRCREV:pn-%s' % pn,
+                'SRCREV',
+            ]
+            raw = None
+            for candidate in candidates:
+                raw = d.getVar(candidate, False)
+                if raw:
+                    break
+            if not raw or raw == 'INVALID':
+                oe.qa.handle_error("missing-srcrev",
+                    "%s: %s not set for SCM URI %s" % (pn, candidates[-1], uri), d)
+
     def test_naming(pn, d):
         if pn.endswith("-native") and not bb.data.inherits_class("native", d):
             oe.qa.handle_error("recipe-naming", "Recipe %s appears native but is not, should inherit native" % pn, d)
@@ -1497,6 +1528,7 @@ python do_recipe_qa() {
 
     pn = d.getVar('PN')
     test_naming(pn, d)
+    test_missing_srcrev(pn, d)
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
     test_srcuri(pn, d)
-- 
2.34.1


