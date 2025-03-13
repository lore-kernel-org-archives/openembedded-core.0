Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD14C28B2E
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:19:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.11307.1741861157635707943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 03:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hyqigI+M;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2235189adaeso14714215ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741861157; x=1742465957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf3X5noBYv3e9F/+bHWfJX3lLLnn78vIdN6ELtG6jr4=;
        b=hyqigI+Mj2fLL35drWofJC9ilHv5XeaSjL9Up1lw90BPe0EUnCDuu0+XmfIP3ho35S
         irs4RyLU54KFGZDuMC/bdfKf58y9RFRIkVs7UDWhgGtrQxvW3LGSEWrOq0JOGFBW3CFn
         +BhTyFJfRYdjA0fo3GjQn7pM8GprVbY32UdyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741861157; x=1742465957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf3X5noBYv3e9F/+bHWfJX3lLLnn78vIdN6ELtG6jr4=;
        b=Sd5ZmB0/geh5ULTI9pHUnvl2HDODPY+tZTTatFSpdgEhQfdSJYQRJPPw0GZbwU2dkP
         mUvBDFImqW0MFw54OO16PLSIimrrC/TSbEY3xsxVsxQ7ZKTiVegtPY907uJ6yadwXIIQ
         XPGc9rDvoSu1wpYucYndZPemN0Rvf5vosRgaYeiRojq5t0ADlKzXGkTeO6b5z1cnpqH5
         nH7tPcBebbbPjPJmVJSmptr16L7FHZJa7CGf4CLtu1WLYyaC1nUo1svNEcmHxmIj212n
         vAOeCfi4GTgBl5LUwiwiRMrbhrX479YZjZhlG3k7g/c5ioONNeE90oEWvGN3UPSOEc3o
         G8kg==
X-Gm-Message-State: AOJu0YzgcOb7c0ytgXkYG9no0SzzERP4Z7n20camcbnKyO7UzX0PGy5A
	VApot2rYu42rW7XTZqmjw1sc+rNgf6yrLzb5QGfLtl6mxyfrn6jivUk3QKAlsmXpjHaA31pPGlP
	B
X-Gm-Gg: ASbGncvj/Us4QT/3AWQLNzpeAej+ffZmiLDlpkW0Vu/dbPsS1A3FlgKuSN8g6bnJM7e
	fn8AI0yY2PZ1A65FGvvQRI7kwsw5texqCTqIBg+Y8LzbuM4Ue/jJGQM+oPF4D2R560TIPGAutvc
	VRv7YwHi4qBIPYDjMIX1/tfUsfONmp6kGMtmuwB3W9VttVpPAYvBZJoaHFFIJbVtwlWCud4mVvY
	lWu7uy7Yl1CvJeZ2U4Ij48tYm9dQJaRo2fOO2AugcphL5OLK/JDB5BbWdCABhkZdtkE8iVwWODb
	gbdkJqhG2HjXST03MIvhuSBwELOqmk7sqzHKTQ==
X-Google-Smtp-Source: AGHT+IEkVR1hYaX+EiF4aoIY1Bpm1CTqiFClemF9H7ByvwrXWIO5vLwQ02qiO42oUnI6CAu93TjXNQ==
X-Received: by 2002:a17:902:d2c6:b0:215:742e:5cff with SMTP id d9443c01a7336-225c6672ca0mr31590265ad.16.1741861156646;
        Thu, 13 Mar 2025 03:19:16 -0700 (PDT)
Received: from MVIN00043 ([223.190.81.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbebebsm9872745ad.201.2025.03.13.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 03:19:16 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Thu, 13 Mar 2025 15:46:57 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] ruby: Fix CVE-2025-27219
Date: Thu, 13 Mar 2025 15:46:55 +0530
Message-ID: <20250313101655.2118495-1-asharma@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212756

Upstream-Status: Backport [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../ruby/ruby/CVE-2025-27219.patch            | 31 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
new file mode 100644
index 0000000000..7813a6143c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
@@ -0,0 +1,31 @@
+From 9907b76dad0777ee300de236dad4b559e07596ab Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 16:01:17 +0900
+Subject: [PATCH] Use String#concat instead of String#+ for reducing cpu usage
+
+Co-authored-by: "Yusuke Endoh" <mame@ruby-lang.org>
+
+Upstream-Status: Backport [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]
+CVE: CVE-2025-27219
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ lib/cgi/cookie.rb | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/cgi/cookie.rb b/lib/cgi/cookie.rb
+index 9498e2f..1c4ef6a 100644
+--- a/lib/cgi/cookie.rb
++++ b/lib/cgi/cookie.rb
+@@ -190,9 +190,10 @@ def self.parse(raw_cookie)
+         values ||= ""
+         values = values.split('&').collect{|v| CGI.unescape(v,@@accept_charset) }
+         if cookies.has_key?(name)
+-          values = cookies[name].value + values
++          cookies[name].concat(values)
++        else
++          cookies[name] = Cookie.new(name, *values)
+         end
+-        cookies[name] = Cookie.new(name, *values)
+       end
+ 
+       cookies
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index ac9dec3514..76e5ac81ed 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-49761-0009.patch \
            file://CVE-2024-41946.patch \
            file://CVE-2025-27220.patch \
+           file://CVE-2025-27219.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


