Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2466D767DF
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:36:18 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14947.1766144174103621937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RKIJVqep;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fbc305914so1229109f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766144172; x=1766748972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT/HXEsH6E7fnj+CJvNCqFjB5m7T1MO1xAZ7rdm4iI4=;
        b=RKIJVqeplR40ismGBQUsFNwS5eUBQCU5fCE5g1oxW1q5RNdCzSa/HZwL3SuIw5MyNk
         GZRWo0glLo0prWMi1XxH80pC54wtUrak2aVmIqvVZVj6nwFxdrokag22cJFRupx+X+Fm
         ZYay1Crl9usQIAQQf7m4SjKR+7On3KS0w2R60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144172; x=1766748972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eT/HXEsH6E7fnj+CJvNCqFjB5m7T1MO1xAZ7rdm4iI4=;
        b=Stc4P5cnsEP4WWcWrHvJDFbVtitPShFH6jXDlkr7tOxgG1vsYioyMrQRgqVltpsq0G
         MHL2iG87rtz3cl7o1zdyCeHMy/AlfPW9ZjZyiXoonXzbRI/kqPTi0U+GxNZaBTYyOVzw
         kjYjAF24hp8NVTbx34PIMyvf8sE4DCaSurnOavjjABjltAOu+/+ALhxA2vxDOX+UtykL
         B9a7cnYWK2wOKmmVtPy1rfUzpQLe70m/oSlBEh4/aUbfO09UChJYz3TAT2ob24ouQUps
         UfQHzhA7yihZj4xOwxcTdvvddstZOoQUi00X2g2NSWv+xn5H13rA7w9ksdKWUQ66k/QY
         KOBg==
X-Gm-Message-State: AOJu0YxRn0m1hBD0K8iMaOh3dIIpia+S0/s0a4u9D/DNcA47Fz0g/qF7
	be19hSWwecOS2pyreNiaR/GNVO4xXxm6Yywh/DVDWM1+lNNvvjtWuoW7A2isgv4Q3hI/cBftZuW
	3tmlCIwgQCQ==
X-Gm-Gg: AY/fxX4e68wKpccGDjhJ4/k/FUmdd6qIE2xtjukQLwUyLmFBsZjcvXGA5E17TmVL7bb
	UwqM32DnyymnFiuAF+8JEmUAhAEsQkdM3NiqD9Az6UQxWUtEzu3g2ZUFIws8bB7cSGYv+5elwXl
	LEG80raNDIOyI17dHG6zAco7WmzTbExdOGQiPm1QB/Eas/XyeXxJih1Uu/Fs6Nd5BkGZ7ac1b4Z
	J0pjmllNtYJK7Q1CJcTKCZaDXhE08SkZMZ7iShnundYY2WLAS0f3284GZnvLNnXlyk6NNSW8ow/
	eC/iXL77p9B0XK/faL/9V9zYJ9bMVbgyDaIOU1JryPd1ZD2dgPARI2RTbX29OusP9crtl9iJ3ZP
	TuxoP7mM0kOgPqpNcJkf7ao3Ql91gYqWrzzXpX1byrp6P0BTLdTANwitqUmfW1sPns/HMTxYO02
	6Lv2+Zl65USAPvZY8kqqrwJNTdcg8Zv7+L9RpW20NxmMcjHA47/udQ7cVMFbyFxvj8gb0+a63Pf
	w0OK2H/7SHYRdBcn34=
X-Google-Smtp-Source: AGHT+IEyZBSFiHT9Rpt3DgpVZtVUwJycqyMgSRtmU2wAfE/oldrJ90thk0VNlgztXb8uT1ifjMhuNQ==
X-Received: by 2002:a05:6000:25c1:b0:431:a50:6e98 with SMTP id ffacd0b85a97d-4324e5061e4mr2643013f8f.30.1766144172295;
        Fri, 19 Dec 2025 03:36:12 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82fa1sm4243906f8f.23.2025.12.19.03.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:36:12 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v3 4/4] doc/bitbake-setup: document "uri" property
Date: Fri, 19 Dec 2025 12:35:58 +0100
Message-ID: <20251219113558.1573766-4-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219113558.1573766-1-corentin.guillevic@smile.fr>
References: <20251219113558.1573766-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228217

The property 'uri' is a simplification of the property 'remotes'. It is
used to provide only one URI.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 .../bitbake-user-manual-environment-setup.rst        | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index ec1bdeecd..cfa61e460 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -673,11 +673,7 @@ They contain the following sections:
          "sources": {
              "bitbake": {
                  "git-remote": {
-                     "remotes": {
-                         "origin": {
-                             "uri": "https://git.openembedded.org/bitbake"
-                         }
-                     },
+                     "uri": "https://git.openembedded.org/bitbake",
                      "branch": "master",
                      "rev": "master"
                  },
@@ -716,6 +712,12 @@ They contain the following sections:
       -  ``branch`` (**required**): the Git branch, used to check that the
          specified ``rev`` is indeed on that branch.
 
+   -  ``uri`` (*optional*): a URI that follows the git URI syntax. Can replace the
+      ``remotes`` structure if only one URI is provided. Despite this, ``uri`` and
+      ``remotes`` can still be used together.
+
+      See https://git-scm.com/docs/git-clone#_git_urls for more information.
+
    -  ``local`` (*optional*): specifies a path on local disk that should be symlinked
       to under ``layers/``. This is useful for local development, where some layer
       or other component used in a build is managed separately, but should still be
-- 
2.51.0


