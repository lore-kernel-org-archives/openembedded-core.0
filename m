Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF9FC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4711.1642588897658532320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RfKHsi0r;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso13461177wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CWcYDptwqlK8jrzlL1ny64XgNPMdQScQqt2VlLuX614=;
        b=RfKHsi0rwSKhFNN2qdhUPhgikW1/yo/nAh9KqoN81qAqAh2xH2YHIUc3BrYTx+KQXV
         nbwph0Xj/TSSw0+cM3NqX36lN7b9zCi+KyUpTyQAksRYjdtnnWnC+/pE7EB1UdmX+Cow
         o4RbADShOdubLWH699YAVlDojFFGWx7JZ5idlq4RoX2W6Ix9sr/rTQCQ6+mLUVXhAmy2
         nhGdj8OsmUvniVoPAtkZD4v/+fqzSTCRcP0qHZkUweglgquWIwTE+G6PomGS30Zp8jmL
         322ebpCf+4yEb5e0Zeh+jhPF8fQ9deHdp7vNkQ+ODX7VtJWPcQJKe7WVl7RbO1d6U+NH
         u76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CWcYDptwqlK8jrzlL1ny64XgNPMdQScQqt2VlLuX614=;
        b=oAZdVfJlORN8T8R3b+hQbGhNlQjsSb4CH/TusO1eiI1fGhWf9MDXuxjaILK9JOMEBV
         tK4ozYjxSqwsdSmkWqCM8dQHdm7nJOuUgZGVP5NlqFR9BLEniAxr3Vcn75agzFnlAw8U
         omX/Jf5Lk2p0SHDzb9XW/CuX8BGM9J4gRoFqUcA5giHnHMhYD9XVxl0vzIvXWVyqmVZ5
         JPm+Zthnvbja92sQJunp45M9XjEOo6ZrFCNRpNtxF+0j9HSJDKBAwa2bofJ9k5wwW9hg
         flOhRbWAE/pPvjX1thcKYqL0YnoX8X9KnfN2Eso47Zi2M5iptizkIzxMATDqjChGg506
         0utg==
X-Gm-Message-State: AOAM530l8xZKY3y1nToET3KNSJ5QFD8FwTQM15Wd/K91xGXOjsNoGroI
	Hdo1k+t/p+BwgbUNOJIrkolw5c177v8=
X-Google-Smtp-Source: 
 ABdhPJyCl2IhcdB5FoqBsf22eatnw+OTmXGl7Dls1RwsZCaK2LXpMo7d4EeNmwsWvRJyFkFjpmO5UA==
X-Received: by 2002:a05:600c:4f93:: with SMTP id
 n19mr2839036wmq.64.1642588896296;
        Wed, 19 Jan 2022 02:41:36 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/39] readline: upgrade 8.1 -> 8.1.2
Date: Wed, 19 Jan 2022 11:40:53 +0100
Message-Id: <20220119104117.2120127-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160706

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../readline/{readline-8.1 => files}/rl-native.map         | 0
 .../{readline-8.1 => readline}/configure-fix.patch         | 0
 .../readline/{readline-8.1 => readline}/norpath.patch      | 0
 meta/recipes-core/readline/readline_8.1.2.bb               | 7 +++++++
 meta/recipes-core/readline/readline_8.1.bb                 | 7 -------
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-core/readline/{readline-8.1 => files}/rl-native.map (100%)
 rename meta/recipes-core/readline/{readline-8.1 => readline}/configure-fix.patch (100%)
 rename meta/recipes-core/readline/{readline-8.1 => readline}/norpath.patch (100%)
 create mode 100644 meta/recipes-core/readline/readline_8.1.2.bb
 delete mode 100644 meta/recipes-core/readline/readline_8.1.bb

diff --git a/meta/recipes-core/readline/readline-8.1/rl-native.map b/meta/recipes-core/readline/files/rl-native.map
similarity index 100%
rename from meta/recipes-core/readline/readline-8.1/rl-native.map
rename to meta/recipes-core/readline/files/rl-native.map
diff --git a/meta/recipes-core/readline/readline-8.1/configure-fix.patch b/meta/recipes-core/readline/readline/configure-fix.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-8.1/configure-fix.patch
rename to meta/recipes-core/readline/readline/configure-fix.patch
diff --git a/meta/recipes-core/readline/readline-8.1/norpath.patch b/meta/recipes-core/readline/readline/norpath.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-8.1/norpath.patch
rename to meta/recipes-core/readline/readline/norpath.patch
diff --git a/meta/recipes-core/readline/readline_8.1.2.bb b/meta/recipes-core/readline/readline_8.1.2.bb
new file mode 100644
index 0000000000..787f7e734a
--- /dev/null
+++ b/meta/recipes-core/readline/readline_8.1.2.bb
@@ -0,0 +1,7 @@
+require readline.inc
+
+SRC_URI += "file://configure-fix.patch \
+           file://norpath.patch \
+           "
+
+SRC_URI[archive.sha256sum] = "7589a2381a8419e68654a47623ce7dfcb756815c8fee726b98f90bf668af7bc6"
diff --git a/meta/recipes-core/readline/readline_8.1.bb b/meta/recipes-core/readline/readline_8.1.bb
deleted file mode 100644
index 0786a08163..0000000000
--- a/meta/recipes-core/readline/readline_8.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require readline.inc
-
-SRC_URI += "file://configure-fix.patch \
-            file://norpath.patch"
-
-SRC_URI[archive.md5sum] = "e9557dd5b1409f5d7b37ef717c64518e"
-SRC_URI[archive.sha256sum] = "f8ceb4ee131e3232226a17f51b164afc46cd0b9e6cef344be87c65962cb82b02"
-- 
2.20.1


