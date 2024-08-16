Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C32FC52D7D
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 03:26:31 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.140531.1723778784888617911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 20:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=a1iZC1oA;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7c3ebba7fbbso1277669a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 20:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723778784; x=1724383584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3HImihnUPLWHO+01f3K9YamUDNgz1JGMRAzhL8Aees=;
        b=a1iZC1oAXSVrwIfY70kOtpNRU4iLIwQvYPuYqM9XiQLGlvSaiCD9eCPEI6n+7FGi1O
         w/GenE3l0rQfAphQQQbgfQg6yR8hA2dUh/uQp257xNl9N0fCJWJDiseR4UM2FeKEe0RU
         eUCB30brY7bwaywb6uuASby5lSYYSrdA8jXv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723778784; x=1724383584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3HImihnUPLWHO+01f3K9YamUDNgz1JGMRAzhL8Aees=;
        b=ZInadDcZJhgAn9qajIoDW6sO7sZEhL7khsHm8Cc8g3x9VUw4KDjc2reTTABklNEBVZ
         Lu5p5sOU7NatwPkM2zcLn0mXjG/DfsUrCGKgXrJVdMbwEksX1nbcHVq04dqH/24+LQen
         1xaCqhJ2EuoGsSWe2xMQ5iEJnzAW81ZrIl7eDSE5oal8C8xhckV+HSPD/rYZgeQNBTc4
         OWY5sbvhmncn2o0TbgfwcZ6eJ9HXawtwOqPgC1fV0HPtC2X532b3ZKoZGlJLa7UCJ2Ve
         2y4jIHAmorzSij3mumN6y0LvXXzY7QSB5koQR3yLMLh8HTOL+HhaVpW47iP/eZX+nA4d
         KP0w==
X-Gm-Message-State: AOJu0YzmoAHf20J5Vjrvw0NE4tvnah/gcKgvGy62TwI3khNWxpEzZRDA
	zIa4/qTTckuG8j9+NwJNqlpy4WTAOI/L/6e7mPws5WvXIyzzVvAJ3vLUCHun/gMIHuSFTZ3PQS6
	k
X-Google-Smtp-Source: AGHT+IE2pnoIsgexhuGydVYeO4PsjSu1GQy/2dOfQlAb2N+OFzUoHuy8m4koLJD7vZpsZfIfqmmYJw==
X-Received: by 2002:a05:6a20:cf8b:b0:1c2:8bf8:e7ab with SMTP id adf61e73a8af0-1c904f7ec24mr2014155637.9.1723778783919;
        Thu, 15 Aug 2024 20:26:23 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c67:855e:80a0:8d13:c02e:8cde])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af3c3e5sm1716879b3a.204.2024.08.15.20.26.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2024 20:26:23 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Fri, 16 Aug 2024 08:56:17 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] ruby: Backport fix for CVE-2024-27282
Date: Fri, 16 Aug 2024 08:56:16 +0530
Message-ID: <20240816032616.20709-1-asharma@mvista.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 03:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203456

Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../ruby/ruby/CVE-2024-27282.patch            | 28 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
new file mode 100644
index 00000000000..dde79792788
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
@@ -0,0 +1,28 @@
+From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 12 Apr 2024 15:01:47 +1000
+Subject: [PATCH] Fix Use-After-Free issue for Regexp
+
+Co-authored-by: Isaac Peka <7493006+isaac-peka@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]
+CVE: CVE-2024-27282
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ regexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regexec.c b/regexec.c
+index 73694ab14a0b0a..140691ad42489f 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
+     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
+       GET_MEMNUM_INC(mem, p);
+       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-end. */
+-      STACK_PUSH_MEM_END(mem, s);
+       mem_start_stk[mem] = GET_STACK_INDEX(stkp);
++      STACK_PUSH_MEM_END(mem, s);
+       MOP_OUT;
+       JUMP;
+ 
diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
index 5c2b07e5e4e..f1aff315b72 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2023-36617_1.patch \
            file://CVE-2023-36617_2.patch \
            file://CVE-2024-27281.patch \
+           file://CVE-2024-27282.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.44.1


