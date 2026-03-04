Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A517EB7EC8
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:43:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15141.1772621032665906561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oRt9wzX6;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso71247435e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772621031; x=1773225831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyBvMxL0Vnvq2XVy6q/9AyepAl1O4rjs176S/KpMPls=;
        b=oRt9wzX61PMqqlyx7b3q0nsyTjAUf3fBwtQpd86tpC4aAq0Vz70KqmBrPFDNhcciJt
         PkqvIA+rgWWzKCsSAoKuqPKSsVSw1E/qLTCIWxWgQcbIXOOB5Fk+GI+lO67j9+V+xaI3
         5BPOq+K0buGsTIvQh3ZuNF5eDXq6TWtaPxJPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621031; x=1773225831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyBvMxL0Vnvq2XVy6q/9AyepAl1O4rjs176S/KpMPls=;
        b=INoDvhD2ArwqLKvK4NCEgMurS29axqMPF0to+QIjVLbRhlsiLcUcQ5izHD99sibGLZ
         A1C0iDK1NnstgklLRjMdjRjDahB7UKRa4V0dYJbPu1OoeIcljff0BCynWZPZmyF96Wgf
         bIiwfgCiROpnFxFyEwvFmomx+wDQmFxKoyUJDsh/96XwtvXG0r8sNPkK//DY4Jq/+WSU
         kGWYZCJatnSMk0fAkZlmWcEq2I+Bcr6BUwsKIAsZiojdiBB322zEe987Cj5tc+AGTfN8
         4PzZxQz0RWFiE1y1l7jVWY/Vr/FntHgnSQZmAmhGYp/1d1b4RwmDt0FSYhls/cnp7y9B
         jKCw==
X-Gm-Message-State: AOJu0YwGLMxm0Ph35BUq6+pPPmSJufPlov6kcCxt2zUhPjUJzzcynpPs
	/C+NyOpZfahuvVAoNtzKil2RYyGs1P6B1r8bCbmR7lvfU7nXE/5Oa+sPsAU9uAqYZ2LdCorVZ9B
	AhzLYqMs=
X-Gm-Gg: ATEYQzyD94zZcok4FwatjHWIszIRPH9nd3aDPfJQDdEujvNUJYuwmP4mrwuQ49t8nu8
	/X6D5oAvone8Fx8EN2HtKuYj2P0lZVdpPt0Pwp35z0UmJP1MmYN38CBn6XqXa9xC4zHITh8fWnm
	BVGuVBnh3h+YAbuMKVE3PEz+se/yCYPkwonf9f1DWz9s4CujF3trn6ylKBuKrgeie/r/jM3tV+z
	etbHN1S22JuDjCF9PlaGD0aqGDh6UiPGcTvQC1krvCwn+OZyBC+K42hipjYZ8UO/1WkbPOEwKSO
	g7mAW+8vLFVIbCrPSgoiE5N6oc4xvLbNSLmGVYwe47rj0KTNeLyzdegI4yiWC4247bWjif9NTWf
	AwEmbrC2sfIx2QkCaCEEwxgFm36MwmrSk4L/7BzWtRvisOgotCgvIYurG7SR1qPvPWt7cvm+DUO
	y1b0Ac/2CXzHLJ3yy804DETKukDlBe12jSFuQlpxn38eQr3KRdWDUu+P7l8hbn247Mo5SQdwns1
	GkZMORT3L7+tyBue1+Bk3+uXDu7PF0c
X-Received: by 2002:a05:600c:4e16:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-485198992eemr23961985e9.27.1772621031007;
        Wed, 04 Mar 2026 02:43:51 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b34b6252sm25638168f8f.10.2026.03.04.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:43:50 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [RFC PATCH 1/4] insane.bbclass: check revision for every git URI
Date: Wed,  4 Mar 2026 11:43:39 +0100
Message-ID: <20260304104342.869457-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304104342.869457-1-corentin.guillevic@smile.fr>
References: <20260304104342.869457-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232370

Every git URI into SRC_URI variable should have a revision. However, if
the revision is missing (SRCREV), BitBake will perform a query on the
remote repository every time it parses a recipe.

This check will raise an error if a git URI is not provided alongside a revision.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/classes-global/insane.bbclass | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index aeffee7983..349da3a65d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1493,7 +1493,34 @@ python do_recipe_qa() {
                 error_msg = "%s: invalid PACKAGECONFIG(s): %s" % (pn, " ".join(sorted(invalid_pkgconfigs)))
                 oe.qa.handle_error("invalid-packageconfig", error_msg, d)
 
+    def test_git_missing_srcrev(pn, d):
+        sha1_re = re.compile(r'^[0-9a-f]{40}$')
+        for uri in d.getVar('SRC_URI').split():
+            # Get tokens for the current URI
+            params = bb.fetch2.decodeurl(uri)
+
+            if params[0] != 'git':
+                continue
+
+            name = params[5].get('name', '')
+            rev = params[5].get('rev', '')
+
+            # Revision is provided as a 'rev' parameter
+            if rev:
+                # Prevent any revision that doesn't look like a SHA-1
+                if not sha1_re.match(rev or ''):
+                    oe.qa.handle_error("missing-srcrev", "%s: ;rev=%s URL parameter doesn't look like a SHA-1" % (pn, rev), d)
+            # git URI has a "name" parameter
+            elif name:
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
2.51.0


