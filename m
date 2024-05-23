Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916D8C25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:58:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.11653.1716451103841424657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 00:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XE8youH3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4202cea9a2fso16186505e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716451102; x=1717055902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQYoFHzNJLQDlSqWTWhxfWd7fQsElP/pK5hX+sUwtIA=;
        b=XE8youH3cwB2JGhNOH59QO6y4wQKhmjzMchWcmrxliY5o18JK39ltwESqvfKnCkbHG
         xN5fcQ4Flw4B3z93te9P5a6voAOSzDmPuKWmgbwWQ4z3euRXDDBfw2h8bv8HFhIvwHiZ
         0hUUqtedEjPtwWWX6s+mI3IUo7xuKgUt9EJo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451102; x=1717055902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQYoFHzNJLQDlSqWTWhxfWd7fQsElP/pK5hX+sUwtIA=;
        b=nPkqjiUHzoXTvkNVtzu+T4uXb91dfbg4tM3kdxtaIQ0AY+P7e4llCmebr4506tKGfH
         PAZQDpAy5ihkmRt4l9CTez7nHuS5qUksUxbCklf5QhlgK/79XwMfErqsF1N+yNMzbS/8
         RxwlihVNfZud5oges648sP6uN5Y7vqFqTzVvdE/p6Dxw0k+rjbZ4q0/t6HY17Fk4DT4P
         KTBjp4hRWhWDd7dVOdyfaHM/9qHNHNV+cTqAQPLUHOjkbKqZ+h8jweSCnFGoN3e6rvUF
         ncAZG4savXhWInnJ2v1OV3i5auavcj1ghtMqP8f3A3LNxNFmmHwA5bva764QmY2w8emo
         4Yaw==
X-Gm-Message-State: AOJu0YyYzAxWgIY3Nc2gWpkVYlo52SNVVnGwYLJWbuyDZuxU8kmUqkbh
	Tlf92j5Hmy9opdqBFh9FPGSRTFpnqS9Hxzvv/pTyB/aDyn/xc7afUNd1AffbFslBuqkKwtfKN9J
	0
X-Google-Smtp-Source: AGHT+IH+wv8GT11HrFmnmoTQv3oEHiT0BG8DliZcf978ydpOLGyHt8WIEWb5Qa2RdSFrKe+QrCq3ng==
X-Received: by 2002:a1c:4b10:0:b0:41f:a9ac:1023 with SMTP id 5b1f17b1804b1-420fd30ee4fmr28873715e9.17.1716451102078;
        Thu, 23 May 2024 00:58:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bf06:e9d5:d26:9301])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f75acesm17120265e9.27.2024.05.23.00.58.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:58:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] base/insane: Move S/B checks to more logical place in insane class
Date: Thu, 23 May 2024 08:58:17 +0100
Message-Id: <20240523075818.2307756-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240523075818.2307756-1-richard.purdie@linuxfoundation.org>
References: <20240523075818.2307756-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 07:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199782

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass   | 5 -----
 meta/classes-global/insane.bbclass | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 4ac7bafefab..b6940bbb6ff 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -428,11 +428,6 @@ python () {
     oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
-    if d.getVar("S")[-1] == '/':
-        bb.warn("Recipe %s sets S variable with trailing slash '%s', remove it" % (d.getVar("PN"), d.getVar("S")))
-    if d.getVar("B")[-1] == '/':
-        bb.warn("Recipe %s sets B variable with trailing slash '%s', remove it" % (d.getVar("PN"), d.getVar("B")))
-
     # To add a recipe to the skip list , set:
     #   SKIP_RECIPE[pn] = "message"
     pn = d.getVar('PN')
diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 42ed1a24a74..99736830b9a 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1609,6 +1609,10 @@ python () {
         bb.fatal("Using S = ${WORKDIR} is no longer supported")
     if builddir == workdir:
         bb.fatal("Using B = ${WORKDIR} is no longer supported")
+    if sourcedir[-1] == '/':
+        bb.warn("Recipe %s sets S variable with trailing slash '%s', remove it" % (d.getVar("PN"), d.getVar("S")))
+    if builddir[-1] == '/':
+        bb.warn("Recipe %s sets B variable with trailing slash '%s', remove it" % (d.getVar("PN"), d.getVar("B")))
 
     # Some people mistakenly use DEPENDS:${PN} instead of DEPENDS and wonder
     # why it doesn't work.
-- 
2.40.1


