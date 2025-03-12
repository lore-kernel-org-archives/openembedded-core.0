Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60749C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:07 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.4546.1741809360313191249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HbPtcw+8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2255003f4c6so4952265ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809359; x=1742414159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsVu81ItEP81OA4xHrtplCVLru1/Xk2e0iSHAaD47So=;
        b=HbPtcw+8W+93AYxrqwxcBuMgVLCcUbFsXvs5U89t3RP+vfSf6vyLv0oHs/dHZcG6eL
         CKEnZOdnZSb/AADyP7+r/RnSZl1ZJwvzjJowGE8r53HjCJrejEbUKvH3RnYA6qYUn75B
         /aMaMp5mQZL+/VFqYZ9mJ8JgM4QVjMC1//iAIIoz+71v7n5RWoTJXDrYxm8Lh4lzxUdJ
         C3lUxIWR1iwmgKE8aWHYFbZCYbAwA7Cu8lvd2A06hUR0fy4XXCcoQTwm548VnZno3rnt
         qBt7h2OvKJlVCXXC8o7cxpxa3Rrn4JiZ3uwb5uMEbtrSbBNylq2NOXv7VZ5c1QdqJnyD
         IjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809359; x=1742414159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsVu81ItEP81OA4xHrtplCVLru1/Xk2e0iSHAaD47So=;
        b=ZHjrZrrK7wZ/pFNVlghBaktRLnZcrEpjQxR+bmdohzXfnFo2I1HsMClMbmauN4t/xm
         vmpm6E00TVEv5M7uf3Nqu7hKlFM6bTXwdPKEBfWt10t1K5RP/HYlRq8gQBcj8lxbVw9j
         jySrg0JbcqS+wVcfkSK2NNizwA6KL6OBjHPd0jKpHbv10WPZUQolhLccPtJjM8Zaqc4M
         pDrhv/Zmp8PjELaNEk/x5TdvZua9sgrnyvdwy3FuQ492bMPIKC8mzZQr+5bkLIDTgB2T
         VoWyZuukCXsAq7v0Vyc3B4wCRIy3+CJ4RMj5VIOuDrsgv2aoCCjP16NHwDwuJS//1wTZ
         3DiQ==
X-Gm-Message-State: AOJu0YyYue+fbv4bi8RGBJx6xf3s8wJyyniq+nKRgyg0uB4MPALL8q/8
	Cd+E3mUEH9qfTFVxeDCwFJHzs3U4P70QkMX0XKakV8p/Z0RNfP0m0X0UkJ3nhjPXKLOX0AiG/mf
	s
X-Gm-Gg: ASbGncuh467ybVeKq7H/Fj9/Gl+MaIlPGqLgwdyDZ3awXqPFhYYxNrEbhuujHeQ0hVh
	cRigfruSIQlbiLJOFzHazulyCWdNtPnS5gxYyftPD2E10CYUKnhFJDmnGVGgaicCH4RTKefrdNi
	QD43H/eRt3LeGEmPUWs7wPFQemtRzG6J+ziZoZi271HBir5vIkSQV3nOlxr7bSzNn2lPU2C53aK
	CtdHB+CdkeUaRko9DmM4NpeKT0PUm9WOIlluelAFPStVo8rlVhqdWu8vFOQStofkyD6Nlpg7iW1
	xwIOl4XjGsdphYdG25nk3cz8zsyt2juE/8sLwRh6Pv8GpA==
X-Google-Smtp-Source: AGHT+IGTVov+wqlV01Ucydbq6jGQs02b7IECPwHKgMDcwNrJrdDgVvDRNhj/WEeIF/6FH+mrAhYSkA==
X-Received: by 2002:a05:6a21:7308:b0:1f5:6a1a:329b with SMTP id adf61e73a8af0-1f58cbc548fmr17155146637.32.1741809359634;
        Wed, 12 Mar 2025 12:55:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.55.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:55:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/28] ruby: Fix CVE-2025-27219
Date: Wed, 12 Mar 2025 12:55:23 -0700
Message-ID: <7e0a96b5c0b7a5ca593df83861086d0980ea72e9.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212696

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport from [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


