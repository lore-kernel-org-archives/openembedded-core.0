Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D07C35FF6
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 14:10:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.15393.1741961419684648854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 07:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H8SAUe5+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22580c9ee0aso40373075ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741961419; x=1742566219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDP+UjjZTwhgdevjxsUkSp8dnTENvHX2tUWPKu/y7GY=;
        b=H8SAUe5+yMq3vXuWwRaNo6gMKVE54EKlZFR7Ei4YwmUlG8ArEsiRIYgTldFg1EJdH/
         L33sRBiNI/AweEpJzspy9kJBGmgTYyPXTfq3F5po1/SIg2yx2anR9xMQKjAnTob2yVGj
         jX8De8cnH31ukwdy05aZQJfCv+6WeLufDRnGVaCeBuBKIBfi9GGeDbmg3dvkGgjQAxIC
         16PCz25YXenbxN8Wlfu8XRsShHc8PHWhQe7D0OnxNL76p3OGmqsVqh/JVIwLpPehzl6P
         TkNTe0mhj3Eg4I+9NIpDEv06ZjPwSE5JX+DqNGRqMp+BZlSgRbX9/n0+wBNMxrsvH/wr
         ITQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961419; x=1742566219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDP+UjjZTwhgdevjxsUkSp8dnTENvHX2tUWPKu/y7GY=;
        b=fknwp2NV6+M6N6pzq+9a1TNiErWiPK8f2PwRcmKl/6AZYgj1zZGHO6asIxKUuZUIJS
         jkenp1iUoApvcCuK3eZRmEckZULnBFyABja6ak0uqonUILsPkVMnUa0R+/jOb2cmWIfh
         Ks4PpE/GUDTdrJgvaBep1sobtowlV8HlhdgwxJ4zlRtqt3UJLLCR71I0I7Iq3jgR5bOJ
         E6LhVNzVYVvPeh5pdYeeXiQWMItgy3nAqt1rkxaC/svmnGA53Likw3zhGJXuyT5bm9Tv
         vlsiekjBE6/3uX3bIdZFGm9bPAXNuI0qM3GDsTakxkSg3Lm+2W7lipldWROA17JTZpmO
         IwJw==
X-Gm-Message-State: AOJu0Yw6cYBBgl00+q6Wv0fxAjqXYuSm/jptPIEueUEHm/H4IwO2OjfU
	h05Z+95OXZGENbHZFM4h7LWwmx2H3ulVaVI97w/WBt0Tb3NzD/ympNZY06h6i7L0TT6LK0DpEeK
	v
X-Gm-Gg: ASbGncvvbfw8Fn2RIsmiqg4NddwwDwZ5xUIQ+mizde27RiYM3x/So/3RBo1GPVy35st
	LnGOYBO4C5NyvL/QYuzKVWLumm6/QwY+E9Tab9Sqn3pmq5e1rZcOu9YzPJ9rCi0UJVdxWecQv6s
	/pThwRclvcYp75ITfGJGpT/mcBNM6XdmcGk6Juxq06alfwDPEx2oii0M0P5v6G6ajwF25naT8Jo
	a58jz3Ms2F2yhaA2jw6dRFZMQ6xhoFhWIghTVtukm82VhjPfi996aE569Y+9FXmt48mB9HeQdRe
	5HqvDViyQD3FbGCrcI60Lml/Z81oKaK5g+XU
X-Google-Smtp-Source: AGHT+IEzvPWJZsUt4Ch18wysssPuhOUL6PBOK6JvQ+tEjobZLqq4bkgPqjpdLTBGJC3xRp/sSJbgjA==
X-Received: by 2002:a05:6a00:6c9c:b0:736:339b:8296 with SMTP id d2e1a72fcca58-737223e73b0mr4067648b3a.18.1741961418512;
        Fri, 14 Mar 2025 07:10:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f60d:ac2a:8f85:c2ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559269sm3000774b3a.65.2025.03.14.07.10.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:10:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] libarchive: patch CVE-2025-25724
Date: Fri, 14 Mar 2025 07:10:04 -0700
Message-ID: <ec837d3b21b4f8b98abac53e2833f1490ba6bf1e.1741961309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741961309.git.steve@sakoman.com>
References: <cover.1741961309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 14:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212848

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this MR which was merged to master.
Note that this commit also patched CVE-2025-1632 in bsdunzip, however
that utility was introduced only in 3.7.0, so that part is not
applicable in kirkstone.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2025-25724.patch           | 40 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch
new file mode 100644
index 0000000000..fe489e852f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch
@@ -0,0 +1,40 @@
+From c9bc934e7e91d302e0feca6e713ccc38d6d01532 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=A4stle?= <peter@piie.net>
+Date: Mon, 10 Mar 2025 16:43:04 +0100
+Subject: [PATCH] fix CVE-2025-1632 and CVE-2025-25724 (#2532)
+
+Hi,
+
+please find my approach to fix the CVE-2025-1632 and CVE-2025-25724
+vulnerabilities in this pr.
+As both error cases did trigger a NULL pointer deref (and triggered
+hopefully everywhere a coredump), we can safely replace the actual
+information by a predefined invalid string without breaking any
+functionality.
+
+CVE: CVE-2025-25724
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---------
+
+Signed-off-by: Peter Kaestle <peter@piie.net>
+---
+ tar/util.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tar/util.c b/tar/util.c
+index 3b099cb5..f3cbdf0b 100644
+--- a/tar/util.c
++++ b/tar/util.c
+@@ -758,7 +758,10 @@ list_item_verbose(struct bsdtar *bsdtar, FILE *out, struct archive_entry *entry)
+ #else
+ 	ltime = localtime(&tim);
+ #endif
+-	strftime(tmp, sizeof(tmp), fmt, ltime);
++	if (ltime)
++		strftime(tmp, sizeof(tmp), fmt, ltime);
++	else
++		sprintf(tmp, "-- -- ----");
+ 	fprintf(out, " %s ", tmp);
+ 	safe_fprintf(out, "%s", archive_entry_pathname(entry));
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 6af01cf408..4ceb0df2c0 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2024-48957.patch \
            file://CVE-2024-48958.patch \
            file://CVE-2024-20696.patch \
+           file://CVE-2025-25724.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


