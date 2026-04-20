Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0ACF588C5
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 13:29:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19254.1776691751690560237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 06:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kw3PCQ/s;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso9158255e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 06:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776691750; x=1777296550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9o2frGbiwvufvs3crayqi0VE+cgZ3jKFp1V7hQp7DI=;
        b=kw3PCQ/ssyaX8fMycn3/d3OErxzZddSTikPsLiSgIGTho3p91zN4bLLXqd7OQH1y2F
         E9fT4dFrl4N8e18iOLL+yP2GQJQh3HwZQK4DdTleGHs9xUin7dzJC1oyzjdLZJPPn0iq
         dpqXuurW6iDNtWF5HiNq5LxhE/xinMHfvZzlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691750; x=1777296550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9o2frGbiwvufvs3crayqi0VE+cgZ3jKFp1V7hQp7DI=;
        b=l+D4ZoP/pzKCUGPJe5ibCSjRNOVY+pY+IsvkqkGQbpL8cXA5NWm9ijQ6ZGO6N1DwiM
         JDtblbwQrmiWT5ZqfTzr/DVhG5wwiVI87Nk+7lHRNFQy2pHcYRTXT9CYnUhMK/DcMO4D
         kLHVQDYNKw7Z8a2PNZmjqVjW8NH18FLRWxlf5Y7loZ+sveNpTt8/arzZwMdCaw0ynI/F
         BAjZssGaLPpzC7dTMasAAr66SvuJt7+FfbL3V/Rmbn+CgNQswAjxKXuFtpy3EdGlCOXS
         WkXZVgwKq7xIF0E5Bq+HFYXRTjHQ22jVdRts6Uyz2ui8rIAWquqsu5/9RbRC/mmyqwKM
         tiDQ==
X-Gm-Message-State: AOJu0Yz+Q5gNnOm5Y9N7Ec02/hg5Ul3FR0T88NYd/VA6hgNoEO26XzEE
	TULb/E9TKCfvQUmodqPl+Nu1A8RqLwYy9BAEOOuD97MlgOxjEh6OZDClifrClEPbMcHAn40dz0C
	vGXczXlU=
X-Gm-Gg: AeBDievFpAAKxQKoGEBOI73AyItO0Ni9BZJ6JNLHVNPCkUSSrQhKxbTgDDs+tp2AU3K
	NCBI4FiJ/x0B/Zdn+zxU7/CkmI3rVLMYwoerpK0K0f+9MfMcsNCUcyyFtZwb8MPXySxxNqIGwQd
	RHBY6mrFt8Y+JCfiIynZUM8i/ASPtuT4euv2khvSAcn6cPt8z4sLbMyZspd2P0e6R0jTYMqz73B
	FLcvTbIL/LxL3YL2EMvmYKIFBh7lBHm9exB1/GFZHwVP+iEdl/QA43adYO85Bazd2/NGsFftpFc
	+0GOWfYpu/pz90FxGXBoMfP8trGRY6dqKVvHhJDPo5q01JTV3AA5eyUqSNCksC6Od8suzzRPIV+
	WI7Ysealx4VXT+18NpzKEKWnG0dMNQlTyi7xLQ9Mx2I5AjwsjZ5VMA1IDsJKuc3huiPQjWs5BR0
	DGmMaEREa+i6B0grJWGsKCkD2ewNz6NdzqTG9x2fpFseVjyPBBasy33QcXnztckCN9IvXlWfCqH
	VXHdGyEjrP8vndkMtBWzjzb3oTycrzMEVzuJdGWfLw=
X-Received: by 2002:a05:600c:1554:b0:485:439b:683f with SMTP id 5b1f17b1804b1-488fb775fd5mr186015535e9.20.1776691749946;
        Mon, 20 Apr 2026 06:29:09 -0700 (PDT)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891b46cffasm98933635e9.13.2026.04.20.06.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:29:09 -0700 (PDT)
From: corentin.guillevic@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v2] sanity: add check for own-mirrors/SOURCE_MIRROR_URL
Date: Mon, 20 Apr 2026 15:28:26 +0200
Message-ID: <20260420132825.441861-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 13:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235564

From: Corentin Guillevic <corentin.guillevic@smile.fr>

The SOURCE_MIRROR_URL variable belongs to  the own-mirrors class. However, the
user may forget to define it. This will cause the class to inject incorrect
content into PREMIRRORS, resulting in the following error:

ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error: MalformedUrl('${SOURCE_MIRROR_URL}')
ERROR: Logfile of failure stored in: /path/to/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_fetch.258066
ERROR: Task (/path/to/layers/poky/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_fetch) failed with exit code '1'

Add a check to the sanity class, to detect this case and raise an error.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/classes-global/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1a490f8d61..cd2cfa9a62 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -984,6 +984,11 @@ def check_sanity_everybuild(status, d):
             "Please set TMPDIR to a clean path with no trailing slash or "
             "consecutive slashes (e.g. %s).\n" % (tmpdir, os.path.normpath(tmpdir)))
 
+    # Check whether the SOURCE_MIRROR_URL variable, belonging to the 'own-mirrors' class, is defined
+    inheritlist = d.getVar('INHERIT')
+    if oe.utils.inherits(d, 'own-mirrors') and not d.getVar('SOURCE_MIRROR_URL'):
+        status.addresult("own-mirrors is enabled, but SOURCE_MIRROR_URL is not defined")
+
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
-- 
2.51.0


