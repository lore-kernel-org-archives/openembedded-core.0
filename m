Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B4EC282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 18:28:39 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.45887.1741631310607902116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 11:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ggCTsO/O;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22355618fd9so84212655ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741631310; x=1742236110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ij1E9zvtbgqp+34R8L3uE5vdmR24WyFDmWtL+68d02c=;
        b=ggCTsO/Ow0PgtVLpTDCUJ4xy92S5s2nH5CC7GVvyZafROYBEb5ukONm0EA4J93Ux6T
         565iW0AE9mDpwTjrIJ4/k/JJy6jhppCYXWnliqEEmqJlCxuk4gsDQc/MJ6bs2U2LvKUN
         d97l3xh2pn1J3P44xH5WA5/ijxMVTvqH8vlFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741631310; x=1742236110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ij1E9zvtbgqp+34R8L3uE5vdmR24WyFDmWtL+68d02c=;
        b=XzK+GfHy13NWQJ3sVUq4iL2caVmj+8GRHWoKCvEMx7b9UjOP8Mpr9ZmB28A7SqZhe/
         7cBTLecUT9CmjF3zvj5+d3pgvPuGkqvsqwefVmr+aJaUioxxDwpBBvFdgfSqNIafe3gC
         BkbTiRVpSRIrAcMB0wXJQeRzYBXcANhFrA1nHCurbkpqtFd7CANCytT9MsMWfRBzk8rO
         xvctxGtoYZ5WMa8l6fJEgGYY8vw/3MNOYTnTsEstf2i7J0KPs/ZO+M0JnceDyMJqOAR+
         6NMBTEUq2+NHIgMsI5++cTx2jrp+mniZX28XW8e6a1ZsxEmxNujuIlfoXOsQmGR+P2cd
         rC2g==
X-Gm-Message-State: AOJu0YyDXqfRbirTHvTp8ZOiKXxeJwtf5vbNk06DICJzOSEsP+pc31ib
	2n1aGqhDVT4a4cYHBcV5hvl0pRnfMFBcP/Ep9W6PrNefURbhsJKPeGoz4xpRCcJTR7cd2A2PsD6
	2
X-Gm-Gg: ASbGncvBKH3kweYn9t4zh/KUwYK8Ogwc0A0QNhDisQGCDFoXOqxZw1MklxRblxgb59P
	2q0gL0/JeVYxCMdY7Z7PrN7TUUdObe1BRyfOQ4+ndWw0RHtOgYc0zubJ2cnhYTVHET/dMDsOaR2
	OvK1/S+UsV0BimNuByLyS/0kMe3BwxgMi9g9Dsxghka1OD3LWrL7DX5PbHM3mPNsj50TMp1XCmh
	MRQzewK8F7rNiFNASeLYgzOedSULIb/ZElQ+EseczFQsYbi7GRgNGup1k0z7TpPD4oEi/3OLBE/
	42mlDdylRF078cpdNsTh8CvXEkn/MrS07zWIrsE=
X-Google-Smtp-Source: AGHT+IGoKvg8CkNMNCpnccdUB+0wB9dYX5/bGtX/7sZf8G4tpxVMc/LaUlM1QNjPC13jcLDJgjYOjA==
X-Received: by 2002:a17:902:e842:b0:224:26fd:82e5 with SMTP id d9443c01a7336-225931ad6e5mr11697895ad.48.1741631309745;
        Mon, 10 Mar 2025 11:28:29 -0700 (PDT)
Received: from MVIN00043 ([223.190.80.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e8642sm81495095ad.72.2025.03.10.11.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 11:28:29 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Mon, 10 Mar 2025 23:56:09 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] ruby: Fix CVE-2025-27219
Date: Mon, 10 Mar 2025 23:56:07 +0530
Message-ID: <20250310182607.1114400-1-asharma@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 18:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212534

Upstream-Status: Backport from [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../ruby/ruby/CVE-2025-27219.patch            | 31 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |  1 +
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
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
index fb0d711765..4354107a85 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
+           file://CVE-2025-27219.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


