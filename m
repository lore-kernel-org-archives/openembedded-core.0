Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBD9C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.4235.1667832968313191686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UPzSDLum;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id o30so7045727wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6iGJtXwXsXYN9a3huCjvi9dKrt8WWavRFhS2fju+50=;
        b=UPzSDLumrc1CkUka19R+2xIqxjdSqwUd+TfjfK/kpeDkLLmhhpsrimdaRbqjpuyVu8
         YUoJi1k3ngjMdL/mE9Yo893lWrrXxK7vdMIBbGlHvEWgP7zipcQ1t0PU1o/+90x3fXav
         yFrSpNFqRueHs+wk5eI3cAdqeLW054HOXmM7wMqqm8HY7b9SF5dyjN7hr/POS/R8lfwm
         4MplfrFxt5QCt9W6CAakkoWLoxIb5wpfJ3Z+dQZrnd5atWt1L8ltH1Z1HhZvutlyTDEo
         Lf4zqnq5xdUUeFWGTQiu98BoyKFPRCvkGRXpyHg2CI/jSY2jQetkqZDO+LXieiFUcVaB
         5p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6iGJtXwXsXYN9a3huCjvi9dKrt8WWavRFhS2fju+50=;
        b=msdIPI5gVmeKLWOsLDkZsGGh45yaMP89aqhMNjpwO5xiFRIWRCpvqd7mOZiQ/3LmPf
         ymGCM7TqNIqTla+YbFn6Fd7RfZTGgqVMOm7zr1HBxrjc+j/TtXKzw+i67CMUGYq4lwe5
         RyFEKixsrg6DfSKCzF1GuvJEnPq7PvOCZL3kgjOzFHglI6AVxVyEWr5s2rxjjSp5dKR2
         Dl1aI2j8srgtR9wA+Buv+8Sf+HmkLdgAHeTmIkduOTeVtcC+HpQxOTQ9o1mTBrGDCgY2
         zKK4SnkosiGzMTMFRLuJiLk2kWcXzRyzLw2L2U8xxGI9JQ8l9A16KpgZTbbpOWvGFwtl
         dSCQ==
X-Gm-Message-State: ACrzQf1Tc2OeGqyDMYKQC9Q0bpK3XzLEslhTkEoh4EMWJANACO8fWIEd
	Ep1ZZTWmQ9HQQUTczcL7axmO/rKxoNE=
X-Google-Smtp-Source: AMsMyM7eeegQJ0ieUDB2Zxo9QL7FKPC/gc2xkNG+WCboKZgc0hIUOMHnbWyp4FnH2iEh6b/RrbWS9w==
X-Received: by 2002:a05:600c:4fd5:b0:3cf:9e9b:68f5 with SMTP id o21-20020a05600c4fd500b003cf9e9b68f5mr8565488wmq.60.1667832966707;
        Mon, 07 Nov 2022 06:56:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:56:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 47/48] sanity.bbclass: do not check for presence of distutils
Date: Mon,  7 Nov 2022 15:55:07 +0100
Message-Id: <20221107145508.1051404-47-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172897

This will be removed in 3.12 and has been deprecated for a while.

sysconfig is the replacement for distutils.sysconfig

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/sanity.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 606444cae1..26533a3521 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -625,11 +625,10 @@ def check_sanity_version_change(status, d):
     # never again until the sanity version or host distrubution id/version changes.
 
     # Check the python install is complete. Examples that are often removed in
-    # minimal installations: glib-2.0-natives requries # xml.parsers.expat and icu
-    # requires distutils.sysconfig.
+    # minimal installations: glib-2.0-natives requries # xml.parsers.expat
     try:
         import xml.parsers.expat
-        import distutils.sysconfig
+        import sysconfig
     except ImportError as e:
         status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)
 
-- 
2.30.2


